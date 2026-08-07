local reactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local soundService = game:GetService("SoundService")
local cryoModule = require(reactSceneUnderstanding.Parent.Cryo)
local useTimedLoopModule = require(reactSceneUnderstanding.useTimedLoop)
local useState = require(reactSceneUnderstanding.Parent.React).useState

local function getAllAudioSources() --[[ line: 13 ]]
	-- upvalues: soundService (ref), cryoModule (ref)
	local ok, status = pcall(function() --[[ line: 20 ]]
		-- upvalues: soundService (copy)
		return soundService:GetAudioInstances()
	end)
	
	return if ok then cryoModule.List.filter(status, function(p0) --[[ line: 25 ]]
		return p0:IsA("Sound") or p0:IsA("AudioPlayer")
	end) else {}
end

return function() --[[ line: 33 | named "useAudioSources" ]]
	-- upvalues: useState (ref), getAllAudioSources (ref), useTimedLoopModule (ref)
	local var5, var6 = useState(getAllAudioSources)
	useTimedLoopModule(1, function() --[[ line: 36 ]]
		-- upvalues: var6 (ref), getAllAudioSources (copy)
		var6(getAllAudioSources())
	end)
	
	return var5
end