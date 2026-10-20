local ReactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local SoundService = game:GetService("SoundService")
local CryoModule = require(ReactSceneUnderstanding.Parent.Cryo)
local UseTimedLoopModule = require(ReactSceneUnderstanding.useTimedLoop)
local UseStateFunction = require(ReactSceneUnderstanding.Parent.React).useState

local function getAllAudioSources()
	-- upvalues: SoundService (copy), CryoModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: SoundService (upval)
		return SoundService:GetAudioInstances()
	end)
	
	return if Success then CryoModule.List.filter(Result, function(Object)
		return Object:IsA("Sound") or Object:IsA("AudioPlayer")
	end) else {}
end

return function()
	-- upvalues: UseStateFunction (copy), getAllAudioSources (copy), UseTimedLoopModule (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction(getAllAudioSources)
	UseTimedLoopModule(1, function()
		-- upvalues: UseStateResult2 (copy), getAllAudioSources (upval)
		UseStateResult2(getAllAudioSources())
	end)
	
	return UseStateResult
end