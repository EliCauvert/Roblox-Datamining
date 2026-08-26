local reactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local reactModule = require(reactSceneUnderstanding.Parent.React)
local reactUtilsModule = require(reactSceneUnderstanding.Parent.ReactUtils)
local sceneAnalysisContextModule = require(reactSceneUnderstanding.SceneAnalysisContext)
local enumsModule = require(reactSceneUnderstanding.enums)
local useCameraStateModule = require(reactSceneUnderstanding.useCameraState)
local sortByAudibleVolumeModule = require(reactSceneUnderstanding.audio.sortByAudibleVolume)
local useAudioSourcesModule = require(reactSceneUnderstanding.audio.useAudioSources)
local useTimedLoopModule = require(reactSceneUnderstanding.useTimedLoop)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local usePrevious = reactUtilsModule.usePrevious

return function()
	-- upvalues: sceneAnalysisContextModule (ref), useAudioSourcesModule (ref), useCameraStateModule (ref), usePrevious (ref), useCallback (ref), sortByAudibleVolumeModule (ref), useTimedLoopModule (ref), useEffect (ref), enumsModule (ref)
	local var1 = sceneAnalysisContextModule.use()
	local var2 = useAudioSourcesModule()
	local var3 = useCameraStateModule()
	local var4 = usePrevious(var3)
	local var5 = useCallback(function()
		-- upvalues: var1 (ref), sortByAudibleVolumeModule (copy), var2 (ref)
		var1.setAudibleSounds(sortByAudibleVolumeModule(var2))
	end, { var2, var1.setAudibleSounds })
	useTimedLoopModule(1, function()
		-- upvalues: var5 (ref)
		var5()
	end)
	useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), var5 (ref)
		if #var1.audibleSounds == 0 and #var2 > 0 then
			var5()
		end
	end, { #var1.audibleSounds, #var2, var5 })
	useEffect(function()
		-- upvalues: var3 (ref), var4 (ref), enumsModule (copy), var5 (ref)
		if var3 ~= var4 and var3 == enumsModule.CameraState.Idle then
			var5()
		end
	end, { var3, var4, var5 })
	
	return var1.audibleSounds
end