#### Problem

The Civilization V SDK contains tools allowing the creation of custom maps, scenarios, or mods. It's a Windows-only tool. In theory it should run in Proton, but it doesn't work. In particular, the SDK appears to launch. But whenever you choose an option, this launches Civ 5 in the background, and at that point nothing more appears to happen.

It seems that the SDK communicates with the game somehow. But in Proton, the SDK and the game are installed separately. I don't believe there is any proper sandboxing between the apps, but they do run in different Proton prefixes.

#### Notes

- Civ V app ID is 8930
- SDK app ID is 16830
- SDK requires VC 2020 and .NET 3.5

#### Ideas

- [x] Try running Civ 5 with Proton instead of the native Linux build
- [ ] Run steam from the CLI and check the logs
- [ ] Is the SDK missing something required to run it in Proton?
  - It requires VC 2020 and .NET 3.5: https://steamdb.info/app/16830/depots/
- [ ] Run the SDK in Windows and see exactly which command is used to start Civ 5, then try starting Civ 5 manually with that same command
  - `steam.exe -applaunch 8930 \dx9 -Nexus 4320` ??? (https://steamcommunity.com/app/8930/discussions/0/882966056463177513/?ctp=3)
- [ ] Try launching the World Builder directly
  - `~/.steam/steam/steamapps/common/Sid Meier's Civilization V SDK/WorldBuilder/x86/WorldBuilder.exe` ??? (https://steamcommunity.com/app/8930/discussions/0/882966056463177513/?ctp=3)
- [ ] Try running the SDK and Civ 5 with the same command?
  - https://github.com/jcnils/protonhax
  - https://github.com/sonic2kk/steamtinkerlaunch
- [ ] Try installing the SDK in the same Proton prefix as Civ 5
- [ ] Create an issue in the Proton repo? 🤷‍♂️

#### Resources

- [Proton 101 (aka Steam Play Basic Instructions) ](https://steamcommunity.com/app/221410/discussions/0/1636417404917541481/)