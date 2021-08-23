# Dans_Locks
 Locking System for Redem:RP
 
 <h2> Using this Script
 
 For a basic 1 door lock, navigate to config.lua and in Config.DoorList copy and paste the following
 ```
 {
        AuthJob = { 'sheriff' }, -- The job(s) that can unlock / lock this door
        doorHash = 3483244267, -- This can be found using any object finder tool I use https://github.com/spAnser/cfx-rdr-spanser-debug
        doorCoords = vector3(1282.84,-1308,77.04), -- Stand in the middle of the doorway and write down your coords here
        locked = true, -- Is the door starting locked?
        distance = 1.5 -- How far the unlock range is
    },
 ```
 
 For a double door setup its just as easy, navigate to config.lua and in Config.DoorList copy and paste the following
 ```
 {
		doorCoords = vector3(1295.39,-1298.22,77.04), -- Stand in the middle of the doorway and write down your coords here
		AuthJob = { 'sheriff' }, -- The job(s) that can unlock / lock this door
		locked = false,  -- Is the door starting locked?
		distance = 2.5, -- How far the unlock range is
		doors = { 
			{
				doorHash = 3317756151,  -- This can be found using any object finder tool I use https://github.com/spAnser/cfx-rdr-spanser-debug
			},
			{
				doorHash = 3088209306,  -- This can be found using any object finder tool I use https://github.com/spAnser/cfx-rdr-spanser-debug
			}
		}
	},
 ```
 
 To use the prompt that appears in the bottom right corner, simply go to config.lua and change Config.UsePrompt to your liking.
 
 To change the keybind used, simply go to config.lua, and change Config.KeyPress to a hash of your liking. Useful list can be found here -> 
 https://forum.cfx.re/t/keybind-hashes/1666877/2
 
 <h2> Required Resources
 RedEM:RP is required
 Forum Post -> https://forum.cfx.re/t/redem-roleplay-gamemode-the-roleplay-gamemode-for-redm/915043
 Github -> https://github.com/RedEM-RP/redem_roleplay
 
 <h2> Known Bug
  There is a bug in which I have been unable to solve, and that is getting the animations working on the UsePrompt config.
  
  Workarounds, comment out following lines
  
  ```
  client.lua -> Line 66 to Line 78, Line 80 to Line 81
  client.lua -> Line 89 to Line 101, Line 103 to Line 104
  client.lua -> Line 112 to Line 123, Line 125 to Line 126
  ```
  
  I will be looking in to trying to fix this problem, but until then there is a temporary fix.
  
  <h2> Credits
   
   A huge thank you to CryptoGenics for a base for me to work off of.
   
   CryptoGenics -> https://github.com/CryptoGenics
   CryptoGenics Doorlock -> https://github.com/CryptoGenics/redemrp_doorlocks
   
   Thank you to RedEM and RedEM:RP
   RedEM:RP Discord -> https://discord.gg/JS82WmQ7nG
