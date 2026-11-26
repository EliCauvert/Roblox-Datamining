local RunService = game:GetService("RunService")
local VoiceDebugTabMinEngineVersion = game:DefineFastInt("VoiceDebugTabMinEngineVersion", 0)

return {
	isEngineVersionAtLeast = function(Text: string, p1: number): boolean
		if p1 <= 0 then
			return true
		else
			local Number: number? = tonumber(string.match(Text, "%.(%d+)%."))
			
			return Number ~= nil and p1 <= Number
		end
	end,
	get = function(): boolean
		-- upvalues: RunService (copy), VoiceDebugTabMinEngineVersion (copy)
		local RobloxVersion: string = RunService:GetRobloxVersion()
		
		if VoiceDebugTabMinEngineVersion <= 0 then
			return true
		else
			local Number: number? = tonumber(string.match(RobloxVersion, "%.(%d+)%."))
			
			return Number ~= nil and VoiceDebugTabMinEngineVersion <= Number
		end
	end
}