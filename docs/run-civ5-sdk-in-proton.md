#### Problem

The Civilization V SDK contains tools allowing the creation of custom maps, scenarios, or mods. It's a Windows-only tool. In theory it should run in Proton, but it doesn't work. In particular, the SDK appears to launch. But whenever you choose an option, this launches Civ 5 in the background, and at that point nothing more appears to happen.

It seems that the SDK communicates with the game somehow. But in Proton, the SDK and the game are installed separately. I don't believe there is any proper sandboxing between the apps, but they do run in different Proton prefixes.

#### Notes

- Civ V app ID is 8930
- SDK app ID is 16830
- SDK requires VC 2020 and .NET 3.5
- The SDK seems to contain a launcher, and depending which item is picked, it runs a particular command then closes the SDK

  - ModBuddy actually seems to run some kind of lightweight Visual Studio ???

    ⓘ ModBuddy requires an additional framework to be installed before it will run: _Visual Studio 2010 Isolated Shell Redistributable_ (https://web.archive.org/web/20180701132916/https://download.microsoft.com/download/1/9/3/1939AD78-F8E8-4336-83F3-E2470F422C62/VSIsoShell.exe)

    ```
    C:\Program Files (x86)\Steam\steamapps\common\Sid Meier's Civilization V SDK\ModBuddy\ModBuddy.exe
    ```

  - World Builder actually launches Civ 5 with a specific parameter:

    ```
    "C:\Program Files (x86)\Steam\steamapps\common\Sid Meier's Civilization V\CivilizationV.exe"  "C:\Program Files (x86)\Steam\steamapps\common\Sid Meier's Civilization V\LaunchPad\LaunchPad.exe" \dx9 -Nexus 4320
    ```

  - Fire Tuner

    ⓘ It seems to be Fire Tuner that requires .NET, as per `tasklist /m *mscor*"`

    ```
    "C:\Program Files (x86)\Steam\steamapps\common\Sid Meier's Civilization V SDK\FireTuner2\FireTuner2.exe"
    ```

#### Ideas

- [x] Try running Civ 5 with Proton instead of the native Linux build
- [x] Figure out if the World Builder uses .NET to run
  - No, it doesn't; Fire Tuner uses .NET
- [x] Run steam from the CLI and check the logs
  - I don't see any helpful logs
- [x] Is the SDK missing something required to run it in Proton?
  - I don't think so
  - It requires VC 2020 and .NET 3.5: https://steamdb.info/app/16830/depots/
- [x] Run the SDK in Windows and see exactly which command is used to start Civ 5, then try starting Civ 5 manually with that same command (get the command used in Windows using `WMIC path win32_process get Caption,Processid,Commandline`)

  - WorldBuilder.exe must be running (`"C:\Program Files (x86)\Steam\steamapps\common\Sid Meier's Civilization V SDK\WorldBuilder\x86\WorldBuilder.exe"`)
  - It calls Civ 5 with special parameters (`C:\Program Files (x86)\Steam\steamapps\common\Sid Meier's Civilization V\CivilizationV.exe \dx9 -Nexus 4320`)

  This seems to work in Windows:

  1. Start Civ 5 with those parameters
  1. Start WorldBuilder.exe
  1. Close and start Civ 5 with those parameters after WorldBuilder.exe complains (it needs to be running first)

  - `CivilizationV.exe \dx9 -Nexus 4320`

  - `"C:\Program Files (x86)\Steam\steamapps\common\Sid Meier's Civilization V\CivilizationV.exe" "C:\Program Files (x86)\Steam\steamapps\common\Sid Meier's Civilization V\LaunchPad\LaunchPad.exe" \dx9 -Nexus 4320`
  - `steam.exe -applaunch 8930 \dx9 -Nexus 4320` ??? (https://steamcommunity.com/app/8930/discussions/0/882966056463177513/?ctp=3)

- [ ] Try launching the World Builder directly
- [ ] Try running the SDK and Civ 5 with the same command?
  - https://github.com/jcnils/protonhax
  - https://github.com/sonic2kk/steamtinkerlaunch
- [ ] Try installing the SDK in the same Proton prefix as Civ 5
- [ ] Create an issue in the Proton repo? 🤷‍♂️

#### Resources

- [Proton 101 (aka Steam Play Basic Instructions) ](https://steamcommunity.com/app/221410/discussions/0/1636417404917541481/)