local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useHasPaidTradingAccessModule = require(profilePlatform.Hooks.useHasPaidTradingAccess)
local logTradeItemsExposureIfEligibleModule = require(profilePlatform.Utils.logTradeItemsExposureIfEligible)

return function()
	-- upvalues: useProfileWrapperContextModule (ref), enumsModule (ref), useLocalUserId (ref), useHasPaidTradingAccessModule (ref), reactModule (ref), logTradeItemsExposureIfEligibleModule (ref)
	local var1 = useProfileWrapperContextModule()
	local profileId = var1.profileId
	local var2 = var1.profileType == enumsModule.ProfileTypes.User
	local var3 = tostring(useLocalUserId())
	local var4 = useHasPaidTradingAccessModule(var3)
	local var5 = useHasPaidTradingAccessModule(if var2 then profileId else nil)
	
	return reactModule.useCallback(function()
		-- upvalues: var2 (ref), logTradeItemsExposureIfEligibleModule (copy), profileId (ref), var3 (ref), var4 (ref), var5 (ref)
		if var2 then
			logTradeItemsExposureIfEligibleModule({
				profileId = tostring(profileId),
				localUserId = var3,
				localHasPaidTradingAccess = var4,
				otherHasPaidTradingAccess = var5
			})
			
			return
		end
	end, {
		profileId,
		var3,
		var4,
		var5,
		var2
	})
end