# SILT Brand Playbook

Interactive brand playbook for SILT. One self-contained static page (`index.html`, ~5.7MB) plus sidecar
video and image assets. No build step, no dependencies, no server code.

Live: https://silt-brand-playbook.vercel.app

## Structure

| Path | What it is |
|------|------------|
| `index.html` | The whole site: markup, CSS and JS in one file. Small images are inlined as base64 webp. |
| `id-am.mp4` / `id-pm.mp4` | Identity films (AM and PM). Play on a press, never autoplay. |
| `idw/` | Identity poster wall art, 24 tiles per mode (`a*.webp` = AM, `p*.webp` = PM). |
| `flav/` | Taste section flavour photography. |
| `*.mp4` | Ritual film scenes, problem shots, efficacy clips, SKU dance loops. |

The AM/PM toggle in the header flips `data-mode` on `<html>`; almost every section swaps its copy, art and
video off that one attribute.

## Run it locally

```bash
python3 -m http.server 8000
```

Then open http://localhost:8000. Opening `index.html` straight off the filesystem also works, though some
browsers get fussy about video there.

## Deploy

Static hosting, root directory, no build command.

```bash
npx vercel --prod
```

Or connect the repo on Vercel and set Framework Preset to "Other" with an empty build command.

## Editing notes

- Everything lives in `index.html`. Search for the section id (`pb-identity`, `pb-taste`, `pb-business` …).
- Assets under 60KB are base64-inlined; anything bigger is a sidecar file so the page stays light.
- The identity films are controlled by `window.idFilmReset()`, which pauses and rewinds both videos whenever
  the mode toggles or the tab changes.
