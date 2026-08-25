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
	local var9 = sceneAnalysisContextModule.use()
	local var10 = useAudioSourcesModule()
	local var11 = useCameraStateModule()
	local var12 = usePrevious(var11)
	local var13 = useCallback(function()
		-- upvalues: var9 (ref), sortByAudibleVolumeModule (copy), var10 (ref)
		var9.setAudibleSounds(sortByAudibleVolumeModule(var10))
	end, { var10, var9.setAudibleSounds })
	useTimedLoopModule(1, function()
		-- upvalues: var13 (ref)
		var13()
	end)
	useEffect(function()
		-- upvalues: var9 (ref), var10 (ref), var13 (ref)
		if #var9.audibleSounds == 0 and #var10 > 0 then
			var13()
		end
	end, { #var9.audibleSounds, #var10, var13 })
	useEffect(function()
		-- upvalues: var11 (ref), var12 (ref), enumsModule (copy), var13 (ref)
		if var11 ~= var12 and var11 == enumsModule.CameraState.Idle then
			var13()
		end
	end, { var11, var12, var13 })
	
	return var9.audibleSounds
end