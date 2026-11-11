# OpenFront attribution and modifications

**© OpenFront and Contributors. OpenFront / OpenFront Inc.**

Trenchwake is an unofficial Roblox adaptation. OpenFront and its contributors do not endorse this game. OpenFront is not this game's primary title. No third-party Roblox game scripts or private assets are included.

## Source code

The new `src/shared/CombatRules.luau`, `src/server/StrategyAI.luau` and `src/server/AttackFrontier.luau` modules, together with the corresponding changes in `src/server/MatchService.luau`, adapt OpenFront source into Luau. Upstream reference: [openfrontio/OpenFrontIO](https://github.com/openfrontio/OpenFrontIO), commit [`59742761c2b75d6f3ac583c21d6007b8e542e786`](https://github.com/openfrontio/OpenFrontIO/tree/59742761c2b75d6f3ac583c21d6007b8e542e786).

Source material includes:

- `packages/engine/src/configuration/EngineConfig.ts` — combat and expansion calculations.
- `packages/engine/src/execution/AttackExecution.ts` — progressive conquest, neighbor prioritization, frontier processing and attack/tick integration, adapted in AttackFrontier and MatchService.
- `packages/engine/src/execution/utils/AiAttackBehavior.ts` — troop reserves and shared attack decisions.
- `packages/engine/src/execution/nation/NationAttackBehavior.ts` — strategic target selection.
- `packages/engine/src/execution/TribeExecution.ts` — staggered AI scheduling.

**Modified 9 November 2026:** selected gameplay logic was translated and adapted to Roblox Luau, the existing server-owned simulation, the Roblox world's terrain encoding, and its balancing and scheduling model. The port notes `COMBAT_PORT.md` and `AI_PORT.md` describe the implementation-specific changes. The rest of the game includes previously written Luau rendering, interface, navigation and server code; the combined code is distributed under GNU AGPL version 3, including the upstream additional attribution/origin terms, in [LICENSE](LICENSE). Retain the notices when redistributing modified versions. No warranty is provided.

This source attribution supersedes the previous statement that no OpenFront AGPL code was incorporated. It does not relicense OpenFront material under a permissive license. See [OPEN_SOURCE.md](OPEN_SOURCE.md) for source access and release preparation.

## World geography

The terrain data in `assets/world-full.bin`, embedded without changes in `src/shared/TerrainData1.luau` through `TerrainData16.luau`, is the full World map from [OpenFront](https://github.com/openfrontio/OpenFrontIO/tree/59742761c2b75d6f3ac583c21d6007b8e542e786/resources/maps/world). `src/shared/WorldMap.luau` decodes these chunks using `TerrainDataManifest.luau`.

**Attribution: OpenFront / OpenFront Inc. — © OpenFront and Contributors.**

Original data: [resources/maps/world/map.bin](https://raw.githubusercontent.com/openfrontio/OpenFrontIO/59742761c2b75d6f3ac583c21d6007b8e542e786/resources/maps/world/map.bin). The file is a 2,000 × 1,000 terrain raster with 651,569 land cells. This project embeds the same bytes using base64 and adds original Luau lookup, label, crop and route helpers. The previous 1,000 × 500 `map4x.bin` remains in `assets/world-large.bin` for decorative menu artwork, and the older 500 × 250 `map16x.bin` remains in `assets/world.bin` as a reference fixture. See assets/WORLD_FULL_SOURCE.md for exact hashes and crop details. Map crops and any modified geography derived from this data remain available under the same asset licence.

OpenFront's [asset licence](https://github.com/openfrontio/OpenFrontIO/blob/main/LICENSE-ASSETS) covers assets in its `resources/` directory, including level/map data, under [Creative Commons Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/). Preserve attribution, link the licence, and identify modifications when distributing adapted map assets. The map's authors do not endorse this Roblox adaptation.

OpenFront's proprietary assets, external premium content and WarFront-specific assets are not included.

The country anchors follow the public World-map manifest. Additional city labels are approximate geographic anchors and should not be interpreted as political boundaries.

## Interface artwork and original extensions

The field-kit helmet, historical command-headquarters illustration and current Trenchwake wordmark were generated for this project. The six construction icons and three current lobby navigation illustrations are original SVG artwork. Their editable inputs and PNGs are included in `assets/field-kit/`; these original visual assets are offered under CC BY-SA 4.0. The decorative menu map is adapted from the OpenFront map: palette, framing, shading, vignette and decorative regions were changed, and it remains CC BY-SA 4.0 with OpenFront attribution. No third-party Roblox game's artwork, logo or font files were copied. The interface uses Roblox-provided fonts and a platform-bundled click sound.

Forward supply reach is an original gameplay extension, documented in CAMPAIGN_PORT.md. It uses the existing combat/frontier separation; it is not represented as an upstream OpenFront supply feature.

The launch helmet/pennant icon and territory/railway thumbnail were generated for this project on 11 November 2026, using the existing Trenchwake identity as a reference. Final PNGs and exact prompts are under `assets/field-kit/launch/`. These original marketing graphics are also offered under CC BY-SA 4.0. They do not depict additional infantry or shooter gameplay.

## Asset exclusions

OpenFront's `proprietary/` assets and external premium/CDN assets are not licensed for use in a separate Roblox game and are not included in this game package. The downloaded upstream reference checkout is research material, not a game distribution bundle. Do not upload its entire directory or its full ZIP as the Roblox game's source/assets release. The game source archive should contain this `warfront` project and its licensed dependencies/assets only.
