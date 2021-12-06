Map Sprites
-

Put standing map sprites into the `sms` folder and moving map sprites into the `mms` folder. 

- Run "GenerateMapSpritesInstaller.bat"
- - This will also rename your images, removing `,() {}-`. 
- Run "Png2DmpImages.bat"
- - You may need to ensure that Png2Dmp.exe has the correct relative path. 
- - Eg. Root/Somefolder/THISFOLDER is where we are.
- - but Root/EventAssembler/Tools/Png2Dmp.exe is where it expects it. 

Copy part of "GeneratedInstaller.event" into "Installer.event" to edit the SMS Size or MMS AP. 

Copy the definitions into the `Installer.event` or your relevant CustomDefinitions file. 
Eg.
```
#define Cavalier_M_Sword_SALVAGEDstand 107 
#define Cavalier_M_Sword_SALVAGEDwalk 127 
```

MMS is the same as class ID and is not set in your class table, so keep that in mind. Eg. if you want to replace EirikaLord's MMS, you must have the definition be 1. 

SMS is set in your ClassTable.CSV, and you can now use the definitions you added in there. 