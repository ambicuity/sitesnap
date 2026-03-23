# SiteSnap

SiteSnap is a private Chrome Extension (Manifest V3) focused on full-page capture, annotation, and professional export workflows (PNG/PDF), with a side-panel-first workspace assistant.

## Product Goals

- Capture long or complex pages reliably.
- Annotate quickly (crop, blur, highlight, text, shape, signature, color adjustments).
- Export polished assets for docs, reviews, audits, and handoffs.
- Keep user trust high with privacy-first defaults and explicit settings.

## Core Capabilities

- Full-page and viewport capture pipeline with scroll planning, chunk stitching, and fallback repair paths.
- Dedicated editor runtime with reducer-driven state and history support.
- Export stack for PNG and paginated PDF (`pdf-lib`), including watermark/date-url options.
- Side panel UX for workflow-oriented capture sessions.
- Optional AI suggestion provider with local heuristic fallback.
- Lightweight privacy controls through settings and runtime safety checks.

## Extension Surfaces

- **Popup**: Quick actions and launch controls.
- **Side panel**: Workspace-oriented flow for capture and follow-up actions.
- **Editor page**: Annotation and export workspace.
- **Settings page**: User-level behavior and export defaults.
- **Welcome/Workspace pages**: Onboarding and extended workspace views.
- **Background service worker**: Runtime orchestration, storage, capture lifecycle, messaging.
- **Content script**: In-page capture interaction and page introspection.

## Architecture Overview

### Runtime modules

- `src/background/background.js`
- `src/content/capture-content.js`
- `src/editor/*`
- `src/popup/*`
- `src/sidepanel/*`
- `src/shared/*`

### Build entrypoints (Vite)

Vite compiles these entrypoints into `dist/`:

- `background` -> `src/background/background.js`
- `capture-content` -> `src/content/capture-content.js`
- `editor` -> `editor.html`
- `popup` -> `popup.html`
- `settings` -> `settings.html`
- `sidepanel` -> `sidepanel.html`
- `welcome` -> `welcome.html`
- `workspace` -> `workspace.html`

### State and contracts

- Message contract constants live in `src/shared/constants.js`.
- Editor contracts/reducer live in `src/shared/editor-contracts.js` and `src/shared/editor-reducer.js`.
- Settings normalization lives in `src/shared/settings.js`.
- Capture planning/session logic lives in `src/shared/capture-*.js`.

## Privacy and Security Model

### Default behavior

- Settings are normalized and sanitized before use.
- Capture/session data is handled in extension-managed storage/runtime state.
- AI provider integration is disabled by default and requires explicit user configuration.

### Extension CSP

`manifest.json` enforces:

- `script-src 'self'`
- `object-src 'self'`
- `base-uri 'self'`

### Tracker shielding

Background runtime includes declarative network blocking rules for known tracker domains when rules are enabled.

## Permissions

Current Manifest V3 permissions (`manifest.json`):

- `activeTab`
- `tabs`
- `storage`
- `scripting`
- `sidePanel`
- `downloads`
- `declarativeNetRequest`

Host permissions:

- `<all_urls>`

Notes:

- `downloads` is build-verified by `scripts/check-manifest-permissions.mjs`.
- `Alt+Shift+P` is configured for `_execute_action` command.

## Tech Stack

- Vite 7
- React 19
- Tailwind CSS 4
- `pdf-lib`
- Vitest

## Local Development

### Prerequisites

- Node.js 20+
- npm 10+
- Chrome 123+

### Setup

```bash
npm install
```

### Run dev server (UI iteration)

```bash
npm run dev
```

### Build extension

```bash
npm run build
```

This runs:

1. `vite build`
2. Permission integrity check on `dist/manifest.json`

### Run tests

```bash
npm run test
```

## Load in Chrome (Unpacked)

1. Build once with `npm run build`.
2. Open `chrome://extensions`.
3. Enable **Developer mode**.
4. Click **Load unpacked**.
5. Select the `dist/` directory.

## Repo Structure

- `src/background/` - service worker and capture orchestration
- `src/content/` - tab/page interaction logic
- `src/editor/` - editor rendering and tooling
- `src/popup/` - popup application
- `src/sidepanel/` - side panel application
- `src/settings/` - settings UI
- `src/shared/` - cross-surface contracts, runtime helpers, reducers, settings, exports
- `src/styles/` - theme and global styles
- `tests/` - unit/integration tests
- `scripts/` - build and repository automation scripts
- `.github/` - workflows, templates, governance files

## Quality and CI Expectations

For repository changes:

- Keep PRs scoped and explicit.
- Validate with:
  - `npm run test`
  - `npm run build`
- For GitHub workflow updates, ensure gh-aw source files and lock files stay in sync.

## Release and Versioning

- Extension version is currently `1.0.0` in `manifest.json` and `package.json`.
- User-facing repository changes should be recorded in `CHANGELOG.md` under `## [Unreleased]`.

## Known Constraints

- Built for Chromium/Chrome extension runtime (MV3).
- Requires unpacked-extension loading in development.
- Host permission scope is currently broad (`<all_urls>`) to support capture workflows across arbitrary sites.

## Support

- Use GitHub issue templates for bug reports and feature requests.
- For security/privacy concerns, use private disclosure: `contact@riteshrana.engineer`.

---

Canonical product/repo name: **SiteSnap**  
In-app assistant label: **SiteSnap Workspace Assistant**
