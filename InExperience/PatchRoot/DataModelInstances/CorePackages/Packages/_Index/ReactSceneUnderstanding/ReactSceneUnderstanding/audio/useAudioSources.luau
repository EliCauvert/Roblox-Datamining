local reactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local soundService = game:GetService("SoundService")
local cryoModule = require(reactSceneUnderstanding.Parent.Cryo)
local useTimedLoopModule = require(reactSceneUnderstanding.useTimedLoop)
local useState = require(reactSceneUnderstanding.Parent.React).useState

local function getAllAudioSources()
	-- upvalues: soundService (ref), cryoModule (ref)
	local ok, status = pcall(function()
		-- upvalues: soundService (copy)
		return soundService:GetAudioInstances()
	end)
	
	return if ok then cryoModule.List.filter(status, function(p0)
		return p0:IsA("Sound") or p0:IsA("AudioPlayer")
	end) else {}
end

return function()
	-- upvalues: useState (ref), getAllAudioSources (ref), useTimedLoopModule (ref)
	local var5, var6 = useState(getAllAudioSources)
	useTimedLoopModule(1, function()
		-- upvalues: var6 (ref), getAllAudioSources (copy)
		var6(getAllAudioSources())
	end)
	
	return var5
end