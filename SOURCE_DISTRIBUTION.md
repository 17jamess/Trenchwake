# Free editable source

This release supports Roblox's documented copyable-place route. On the game's Roblox page, open the menu and choose **Edit in Studio**, then save a local copy. The published place must have **Allow users to download a copy of this Place** enabled.

All running Luau is immediately editable in the copy. **ServerStorage.SourceDistribution** additionally contains the complete corresponding source ZIP: preferred source files, licensed assets, notices, QA, build scripts and documentation. It is labelled data, never executed, and does not replicate to game clients.

Save the copy as **Roblox XML (.rbxlx)**. Copy the `ExtractSourcePowerShell` StringValue into a local `.ps1` file, or use the extractor supplied with the source mirror:

```powershell
./extract-source-distribution.ps1 -PlacePath ./Trenchwake.rbxlx -OutputPath ./Trenchwake-Source.zip
```

The extractor verifies the embedded SHA-256 before writing the ZIP. Extract the ZIP and run `./rebuild-place.ps1` to rebuild. The builder first packages the exact local source and then embeds that archive in ServerStorage; output archives and place files are excluded from the archive, avoiding a circular dependency.

Additional public mirror: https://github.com/17jamess/Trenchwake . The in-game source offer uses Roblox's own copy/download route rather than sending players off-platform. Preserve source availability and the offer whenever deploying a modified version.

Roblox route: https://create.roblox.com/docs/projects/configure-games#allow-copying . Licence and attribution remain in LICENSE, LICENSE-ASSETS, ATTRIBUTION.md and OPEN_SOURCE.md. This provides a practical source distribution route; it is not legal advice or a guarantee of licence compatibility with every platform policy.
