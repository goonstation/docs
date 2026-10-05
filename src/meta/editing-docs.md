# Editing These Docs

These docs are Markdown built with [mdBook](https://rust-lang.github.io/mdBook/) and published to <https://docs.goonhub.com> on every push to `master` of [goonstation/docs](https://github.com/goonstation/docs).

## Quick edits

Click the edit (pencil) icon at the top right of any page. GitHub will fork the repo and open a pull request for you.

## Adding a page

1. Create a `.md` file under the matching section folder in `src/`.
2. Add it to `src/SUMMARY.md`, which defines the sidebar. Pages not listed there are not built.
3. Link to other pages with relative paths to the `.md` file, e.g. `[Code Guide](../guidelines/code.md#even-better-profiler)`. Heading anchors are lowercase with spaces as dashes.

## Previewing locally

```sh
cargo install mdbook
mdbook serve --open
```

## Callouts

```md
> [!NOTE]
> Useful information.

> [!WARNING]
> Something that will bite you.
```

Supported kinds: `NOTE`, `TIP`, `IMPORTANT`, `WARNING`, `CAUTION`.
