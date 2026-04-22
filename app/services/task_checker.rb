class TaskChecker
  TASKS = [
    { number: 1, title: "Add Guest Count", difficulty: "Starter" },
    { number: 2, title: "House Show Page", difficulty: "Starter" },
    { number: 3, title: "Fix Statistics", difficulty: "Intermediate" },
    { number: 4, title: "Paginate Bookings", difficulty: "Intermediate" },
    { number: 5, title: "Delete with Stimulus Confirmation", difficulty: "Intermediate" },
    { number: 6, title: "React Booking Query Form", difficulty: "Advanced" },
    { number: 7, title: "House Availability Calendar", difficulty: "Advanced" }
  ].freeze

  def self.results
    TASKS.map do |task|
      task.merge(complete: send(:"task#{task[:number]}_complete?"))
    end
  end

  def self.completed_count
    results.count { |t| t[:complete] }
  end

  def self.task1_complete?
    Booking.column_names.include?("number_of_guests") &&
      Booking.validators_on(:number_of_guests).any?
  rescue
    false
  end

  def self.task2_complete?
    Rails.application.routes.recognize_path("/houses/1", method: :get)
    defined?(HousesController) && HousesController.instance_methods(false).include?(:show)
  rescue ActionController::RoutingError
    false
  end

  def self.task3_complete?
    controller = StatisticsController.new
    # Check that the controller doesn't just use House.first
    source = StatisticsController.instance_method(:show).source_location&.last
    return false unless source

    lines = File.readlines(StatisticsController.instance_method(:show).source_location.first)
    method_body = lines[(source - 1)..].take_while { |l| !l.strip.start_with?("end") }.join
    method_body.include?("group") || method_body.include?("count") || method_body.include?("order")
  rescue
    false
  end

  def self.task4_complete?
    source_file, line = BookingsController.instance_method(:index).source_location
    return false unless source_file

    lines = File.readlines(source_file)
    method_body = lines[(line - 1)..].take_while { |l| !l.strip.match?(/\A(end|def )/) || l.strip.start_with?("def index") }.join
    method_body.include?("limit") || method_body.include?("offset") || method_body.include?("page")
  rescue
    false
  end

  def self.task5_complete?
    BookingsController.instance_methods(false).include?(:destroy) &&
      File.exist?(Rails.root.join("app/javascript/controllers/confirm_controller.js"))
  rescue
    false
  end

  def self.task6_complete?
    path = Rails.root.join("app/javascript/components/BookingForm.jsx")
    return false unless File.exist?(path)

    content = File.read(path)
    !content.include?("Under construction")
  rescue
    false
  end

  def self.task7_complete?
    Rails.application.routes.recognize_path("/api/houses/1/bookings", method: :get)
    File.exist?(Rails.root.join("app/javascript/components/AvailabilityCalendar.jsx"))
  rescue ActionController::RoutingError
    false
  end
end
