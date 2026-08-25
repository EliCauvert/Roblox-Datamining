local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local appStorageJsonCacheUtils = require(script:FindFirstAncestor("SharedFlags").Parent.AppCommonLib).Utils.AppStorageJsonCacheUtils
local getFFlagEnableAppStorageJsonCacheInABTestModule = require(script.Parent.GetFFlagEnableAppStorageJsonCacheInABTest)
local experienceReactDeferredSchedulerLayerName = game:DefineFastString("ExperienceReactDeferredScheduler_LayerName", "UIEcosystem.User")
local enableReactSchedulerIXP = game:DefineFastFlag("EnableReactSchedulerIXP", false)

return function()
	-- upvalues: enableReactSchedulerIXP (ref), getFFlagEnableAppStorageJsonCacheInABTestModule (ref), appStorageJsonCacheUtils (ref), experienceReactDeferredSchedulerLayerName (ref), appStorageService (ref), httpService (ref)
	if not enableReactSchedulerIXP then
		return nil
	elseif getFFlagEnableAppStorageJsonCacheInABTestModule() then
		local experimentCacheCachedJsonForKey = appStorageJsonCacheUtils.default:getCachedJsonForKey("ExperimentCache")
		
		if experimentCacheCachedJsonForKey then
			return experimentCacheCachedJsonForKey[experienceReactDeferredSchedulerLayerName]
		end
	else
		local ok, status = pcall(function()
			-- upvalues: appStorageService (copy)
			return appStorageService:GetItem("ExperimentCache")
		end)
		
		if ok then
			local ok_1, status_1 = pcall(function()
				-- upvalues: httpService (copy), status (ref)
				return httpService:JSONDecode(status)
			end)
			
			return if ok_1 and status_1 then status_1[experienceReactDeferredSchedulerLayerName] else nil
		end
	end
end