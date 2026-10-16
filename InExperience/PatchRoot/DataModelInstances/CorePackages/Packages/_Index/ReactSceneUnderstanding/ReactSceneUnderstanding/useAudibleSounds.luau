local ReactSceneUnderstanding = script:FindFirstAncestor("ReactSceneUnderstanding")
local ReactModule = require(ReactSceneUnderstanding.Parent.React)
local SceneAnalysisContextModule = require(ReactSceneUnderstanding.SceneAnalysisContext)
local EnumsModule = require(ReactSceneUnderstanding.enums)
local UseCameraStateModule = require(ReactSceneUnderstanding.useCameraState)
local SortByAudibleVolumeModule = require(ReactSceneUnderstanding.audio.sortByAudibleVolume)
local UseAudioSourcesModule = require(ReactSceneUnderstanding.audio.useAudioSources)
local UseTimedLoopModule = require(ReactSceneUnderstanding.useTimedLoop)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UsePreviousFunction = require(ReactSceneUnderstanding.Parent.ReactUtils).usePrevious

return function() --[[ Line: 31 | Named "useAudibleSounds" ]]
	-- upvalues: SceneAnalysisContextModule (copy), UseAudioSourcesModule (copy), UseCameraStateModule (copy), UsePreviousFunction (copy), UseCallbackFunction (copy), SortByAudibleVolumeModule (copy), UseTimedLoopModule (copy), UseEffectFunction (copy), EnumsModule (copy)
	local UseResult = SceneAnalysisContextModule.use()
	local UseAudioSourcesModuleResult = UseAudioSourcesModule()
	local UseCameraStateModuleResult = UseCameraStateModule()
	local UsePreviousResult = UsePreviousFunction(UseCameraStateModuleResult)
	local UseCallbackResult = UseCallbackFunction(function() --[[ Line: 37 ]]
		-- upvalues: UseResult (copy), SortByAudibleVolumeModule (upval), UseAudioSourcesModuleResult (copy)
		UseResult.setAudibleSounds(SortByAudibleVolumeModule(UseAudioSourcesModuleResult))
	end, { UseAudioSourcesModuleResult, UseResult.setAudibleSounds })
	UseTimedLoopModule(1, function() --[[ Line: 56 ]]
		-- upvalues: UseCallbackResult (copy)
		UseCallbackResult()
	end)
	UseEffectFunction(function() --[[ Line: 60 ]]
		-- upvalues: UseResult (copy), UseAudioSourcesModuleResult (copy), UseCallbackResult (copy)
		if #UseResult.audibleSounds == 0 and #UseAudioSourcesModuleResult > 0 then
			UseCallbackResult()
		end
	end, {
		#UseResult.audibleSounds,
		#UseAudioSourcesModuleResult,
		UseCallbackResult
	})
	UseEffectFunction(function() --[[ Line: 66 ]]
		-- upvalues: UseCameraStateModuleResult (copy), UsePreviousResult (copy), EnumsModule (upval), UseCallbackResult (copy)
		if UseCameraStateModuleResult ~= UsePreviousResult and UseCameraStateModuleResult == EnumsModule.CameraState.Idle then
			UseCallbackResult()
		end
	end, {
		UseCameraStateModuleResult,
		UsePreviousResult,
		UseCallbackResult
	})
	
	return UseResult.audibleSounds
end