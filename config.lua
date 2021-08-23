Config = {}
Config.UsePrompt = false
Config.KeyPress = 0xD8F73058

Config.DoorList = {
    {
        AuthJob = { 'sheriff' },
        doorHash = 3483244267, -- Rhodes Vault Door
        doorCoords = vector3(1282.84,-1308,77.04),
        locked = true,
        distance = 1.5
    },
    {
		doorCoords = vector3(1295.39,-1298.22,77.04),
		AuthJob = { 'sheriff' },
		locked = false,
		distance = 2.5,
		doors = { 
			{
				doorHash = 3317756151, -- Rhodes Front Door Left
			},
			{
				doorHash = 3088209306, -- Rhodes Front Door Right
			}
		}
	},
}