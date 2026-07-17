---
name: prepare-stretchly-website-release
description: Prepare hovancik.net for a new Stretchly release. Use when asked to prep, publish, or update the website for a Stretchly version, including the release post, installer links, and user-facing documentation synced from hovancik/stretchly.
---

# Prepare a Stretchly website release

Work from the repository root. In `hovancik/stretchly`, use the `release` branch
as the source of truth when it exists. Otherwise use `main`, or the repository's
configured default branch if `main` does not exist.

## Guardrails

- Preserve existing worktree changes and avoid unrelated edits.
- Do not invent release notes, supported platforms, artifact names, known issues,
  or contributor credits.
- Do not update historical release posts when searching for stale versions.
- Do not commit, push, merge, or deploy unless the user explicitly asks.
- When packages are still being built, prepare links to the expected assets but
  do not treat temporary 404 responses as failures.

## 1. Establish the release data

1. List the branches in `hovancik/stretchly` and resolve `source_branch`:
   - use `release` when it exists
   - otherwise use `main`
   - if `main` does not exist, use the repository's configured default branch
   - if none of these can be resolved, stop and report the missing source branch
2. Determine the requested semantic version. If it was not provided, read
   `package.json` from `refs/heads/<source_branch>`.
3. From `source_branch`, retrieve:
   - `CHANGELOG.md`
   - `package.json`
   - `README.md`
4. Confirm that `package.json` and the newest dated changelog section agree.
5. Retrieve `README.md` from the previous release tag and compare it with
   `source_branch`. Use this delta to identify documentation changes for the
   website.
6. Prefer the GitHub MCP Server for repository data. Use the GitHub API only
   when the MCP tools are unavailable.

Use these derived values consistently:

- `release_version`: full semantic version, for example `1.22.0`
- `display_version`: version without a trailing `.0`, for example `1.22`
- `release_date`: date from the finalized changelog section
- `release_slug`: `display_version` with dots replaced by hyphens

## 2. Prepare the website branch

1. Inspect `git status` before switching branches or updating refs.
2. Fetch `origin`.
3. When the worktree is clean and the task starts from `develop`, fast-forward
   it to `origin/develop`.
4. Create a release branch following recent repository history. Minor releases
   currently concatenate major and minor components, so `1.22.0` uses `122`.
   Inspect history rather than assuming this convention for patch releases.
5. If the user already has a suitable release branch or work in progress,
   continue there without discarding it.

## 3. Add the release announcement

Use the newest Stretchly release post as the structural template.

Create:

```text
source/blog/YYYY-MM-DD-stretchly-RELEASE-SLUG-is-now-available.html.markdown
```

Requirements:

- Use the changelog date in the filename and frontmatter.
- Use `display_version` in the title and introductory paragraph.
- Keep the established greeting, download-page link, and sponsor thank-you.
- Copy the release changelog categories, order, and bullets exactly. Do not
  summarize or editorialize them.
- Keep the existing frontmatter and Markdown style.

## 4. Update downloads

Edit `source/stretchly/downloads.html.md.erb`.

Update the direct release URLs using the verified artifact naming convention:

```text
https://github.com/hovancik/stretchly/releases/download/vRELEASE_VERSION/Stretchly-RELEASE_VERSION.dmg
https://github.com/hovancik/stretchly/releases/download/vRELEASE_VERSION/Stretchly-RELEASE_VERSION-arm64.dmg
https://github.com/hovancik/stretchly/releases/download/vRELEASE_VERSION/Stretchly-Setup-RELEASE_VERSION.exe
```

Before using these names, confirm that the Stretchly packaging configuration or
the previous release still uses them.

Also apply relevant installation and platform-support changes from the release
README delta, such as:

- minimum supported operating-system versions
- Homebrew commands and Gatekeeper guidance
- package-manager deprecations
- Linux runtime requirements or workarounds

Preserve website-specific direct-download links and unrelated package-manager
instructions.

## 5. Sync the About page

Edit `source/stretchly/about.html.md.erb` using the README comparison from step
1. Apply only user-facing changes relevant to this page:

- default behavior and command-line usage
- preferences added, removed, renamed, or given new defaults
- new advanced-preference documentation
- known issues added, changed, or resolved
- newly credited contributors

Do not replace the file wholesale. The website has different frontmatter, image
paths, image sizes, and layout details from the Stretchly README.

## 6. Check completeness

Review all current Stretchly pages for the previous version and changed option
names. Distinguish intentional historical references from stale current
download or documentation content.

At minimum, confirm:

- the release post contains every changelog item
- current direct-download links use `release_version`
- removed preferences are no longer documented as active
- changed defaults match the release README
- resolved known issues were removed
- new known issues and contributors were added

## 7. Render and inspect

Run:

```bash
git diff --check
bundle exec middleman build --clean
```

If the host Ruby toolchain is unavailable, use the repository container:

```bash
docker --context default compose run --rm web bundle exec middleman build --clean
```

If the normal container build cannot reach RubyGems, use the host-networked
fallback and remove its temporary image afterward:

```bash
docker --context default build --network=host -t hovancik-site-release-check .
docker --context default run --rm -v "$PWD":/myapp -w /myapp hovancik-site-release-check bundle exec middleman build --clean
docker --context default image rm hovancik-site-release-check
```

Inspect the generated release post and downloads page under `build/`, checking
the rendered title and artifact URLs. Finish by showing `git status` and the
files changed.

When reporting completion, state the branch and expected package filenames.
If packages are still in progress, make clear that the website is prepared but
the asset links will become live only after the GitHub release is published.
