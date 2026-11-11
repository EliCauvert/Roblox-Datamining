local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local AppStorageJsonCacheUtils = require(script:FindFirstAncestor("SharedFlags").Parent.AppCommonLib).Utils.AppStorageJsonCacheUtils
local GetFFlagEnableAppStorageJsonCacheInABTestModule = require(script.Parent.GetFFlagEnableAppStorageJsonCacheInABTest)
local ExperienceReactDeferredSchedulerLayerName = game:DefineFastString("ExperienceReactDeferredScheduler_LayerName", "UIEcosystem.User")
local EnableReactSchedulerIXP = game:DefineFastFlag("EnableReactSchedulerIXP", false)

return function()
	-- upvalues: EnableReactSchedulerIXP (copy), GetFFlagEnableAppStorageJsonCacheInABTestModule (copy), AppStorageJsonCacheUtils (copy), ExperienceReactDeferredSchedulerLayerName (copy), AppStorageService (copy), HttpService (copy)
	if not EnableReactSchedulerIXP then
		return nil
	end
	if GetFFlagEnableAppStorageJsonCacheInABTestModule() then
		local ExperimentCacheCachedJsonForKey = AppStorageJsonCacheUtils.default:getCachedJsonForKey("ExperimentCache")
		
		if ExperimentCacheCachedJsonForKey then
			return ExperimentCacheCachedJsonForKey[ExperienceReactDeferredSchedulerLayerName]
		end
	else
		local Success, Result = pcall(function()
			-- upvalues: AppStorageService (upval)
			return AppStorageService:GetItem("ExperimentCache")
		end)
		
		if Success then
			local Success1, Result1 = pcall(function()
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			
			if Success1 and Result1 then
				return Result1[ExperienceReactDeferredSchedulerLayerName]
			end
		end
	end
	return nil
end