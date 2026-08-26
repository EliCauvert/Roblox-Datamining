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
	
	return if ok then cryoModule.List.filter(status, function(p1)
		return p1:IsA("Sound") or p1:IsA("AudioPlayer")
	end) else {}
end

return function()
	-- upvalues: useState (ref), getAllAudioSources (ref), useTimedLoopModule (ref)
	local var1, var2 = useState(getAllAudioSources)
	useTimedLoopModule(1, function()
		-- upvalues: var2 (ref), getAllAudioSources (copy)
		var2(getAllAudioSources())
	end)
	
	return var1
end