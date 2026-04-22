# Book My House

A guesthouse booking application built with Ruby on Rails, used as part of the technical interview process at [App Maintainers](https://appmaintainers.com).

## About App Maintainers

[App Maintainers](https://appmaintainers.com) specializes in long-term Ruby on Rails product development and maintenance. For over 10 years we've been building, refactoring, and scaling web applications for startups, NGOs, and municipalities — some partnerships lasting 8+ years. We believe Rome wasn't built in a day, and neither is great software.

## About this project

Book My House is a small but functional Rails application for managing guesthouse bookings. It serves as the foundation for a 2-3 hour in-person technical interview. The goal is not to finish everything — we want to see how you think, how you ask questions, and how you prioritize.

### Tech stack

- **Ruby on Rails 8.1** with SQLite
- **Pico CSS** for classless semantic HTML styling
- **React 19** with esbuild for JSX bundling
- **Hotwire** (Stimulus + Turbo)
- **Dev Containers** for zero-friction setup

## Getting started

### Option 1: Dev Container (recommended)

The easiest way to get started. You only need [Docker](https://www.docker.com/) installed.

**VS Code / Cursor:**
1. Clone the repository
2. Open the folder in VS Code
3. When prompted, click **"Reopen in Container"**
4. Wait for the build to complete
5. Open the terminal inside the container and run:

```bash
bin/setup
bin/dev
```

**RubyMine:**
1. Clone the repository and open it in RubyMine
2. RubyMine will detect the `.devcontainer` configuration
3. Click **"Create Dev Container and Mount Sources"**
4. Open the terminal and run `bin/setup && bin/dev`

**CLI (without IDE):**
```bash
npm install -g @devcontainers/cli
devcontainer up --workspace-folder .
devcontainer exec --workspace-folder . bash
bin/setup
bin/dev
```

### Option 2: Local setup

If you prefer to run without Docker, make sure you have:

- Ruby (see `.ruby-version`)
- Node.js (see `.node-version`)
- SQLite 3

Then:

```bash
bundle install
npm install
bin/setup
bin/dev
```

### Verify it works

Visit [http://localhost:3000](http://localhost:3000) — you should see a list of bookings.

## Running tests

```bash
bin/rails test
```

## Questions?

If you run into setup issues, don't hesitate to reach out. We're happy to help.

Learn more about us at [appmaintainers.com](https://appmaintainers.com).
