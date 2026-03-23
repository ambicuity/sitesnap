# SiteSnap Privacy Policy

Last updated: March 23, 2026

SiteSnap is a Chrome extension for page capture, annotation, and export (PNG/JPEG/PDF). This policy explains what data the extension processes, where it is stored, and how you control it.

## Scope

This policy applies to the SiteSnap Chrome extension and its extension UI surfaces (popup, side panel, workspace, editor, and settings).

## Data SiteSnap processes

SiteSnap processes the following categories of data to provide core functionality:

1. Page context metadata
- Active tab URL
- Active tab title
- Hostname
- Timestamp metadata for capture/session history entries

2. Capture and edit content
- Screenshot frame/chunk image data captured from pages you explicitly capture
- Capture stitch metadata (positions, dimensions, session identifiers)
- Annotation/editing state associated with a capture session

3. User settings
- Theme, UI preferences, export settings, download preferences
- History preference (`persistHistory`)

4. Optional capture history (disabled by default)
- URL, title, hostname, and timestamp for prior capture contexts
- History entry cap: up to 120 entries

## How SiteSnap uses this data

SiteSnap uses processed data only to deliver requested extension features:

- Perform full-page capture planning, scrolling, and stitching
- Render captures in editor/workspace and apply annotations
- Export files to your local Downloads folder
- Restore your extension settings and UI preferences
- Show recent capture/session state inside extension UI

## Storage locations and retention

SiteSnap stores data in browser-managed extension storage:

- `chrome.storage.session` for active runtime/session state
- `chrome.storage.local` for persistent user settings and optional history
- Extension IndexedDB for capture chunk archival used by editor/export flows

Retention behavior:

- Capture history persistence is off by default and only stored if enabled by you.
- You can delete captures from the extension UI (discard/delete actions).
- Disabling history persistence clears stored history entries.
- Runtime/session capture state is reset by extension startup logic.

## Data sharing, transfers, and third parties

SiteSnap does not require an account for core use and does not intentionally transmit captured page image content to developer-operated remote servers in default behavior.

SiteSnap may open third-party websites only when you explicitly click links/actions such as:

- Support links (for example, Buy Me a Coffee)
- Repository/help links (for example, GitHub)
- Share/export helper links you invoke manually (for example, opening a compose page in webmail)

These destinations are controlled by your explicit action, and their own privacy policies apply once opened.

## Permissions and why they are requested

- `activeTab`: temporary access to the active tab after user gesture
- `tabs`: read active tab metadata and open extension tabs/pages
- `scripting`: inject and run capture/content helpers on permitted pages
- `storage`: save settings and capture metadata
- `sidePanel`: provide SiteSnap side panel workflow
- `downloads`: save exported files
- Optional host permissions (`http://*/*`, `https://*/*`): requested per-origin at runtime when needed for capture on that site

## What SiteSnap does not do

- No persistent `<all_urls>` host permission by default
- No remote AI upload path for captured content in current default implementation
- No in-extension ad network behavior
- No sale of personal information by SiteSnap

## Your controls

You can:

- Grant or deny site access prompts per origin
- Enable/disable capture history persistence in Settings
- Delete capture sessions from the extension UI
- Uninstall the extension at any time

## Security approach

SiteSnap uses Manifest V3 extension controls and an extension-page Content Security Policy (`script-src 'self'`) to reduce injection risk. Data access is scoped to extension functionality and requested host origins.

## Policy updates

This policy may be updated when extension behavior changes. The "Last updated" date will be revised when material updates are made.

## Contact

For privacy or security questions:

- `contact@riteshrana.engineer`
