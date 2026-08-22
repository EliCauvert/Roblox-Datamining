local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useHasPaidTradingAccessModule = require(profilePlatform.Hooks.useHasPaidTradingAccess)
local logTradeItemsExposureIfEligibleModule = require(profilePlatform.Utils.logTradeItemsExposureIfEligible)

return function() --[[ line: 12 | named "useTradeItemsExposureLogger" ]]
	-- upvalues: useProfileWrapperContextModule (ref), enumsModule (ref), useLocalUserId (ref), useHasPaidTradingAccessModule (ref), reactModule (ref), logTradeItemsExposureIfEligibleModule (ref)
	local var6 = useProfileWrapperContextModule()
	local profileId = var6.profileId
	local var7 = var6.profileType == enumsModule.ProfileTypes.User
	local var8 = tostring(useLocalUserId())
	local var9 = useHasPaidTradingAccessModule(var8)
	local var10 = useHasPaidTradingAccessModule(if var7 then profileId else nil)
	
	return reactModule.useCallback(function() --[[ line: 21 ]]
		-- upvalues: var7 (ref), logTradeItemsExposureIfEligibleModule (copy), profileId (ref), var8 (ref), var9 (ref), var10 (ref)
		if var7 then
			logTradeItemsExposureIfEligibleModule({
				profileId = tostring(profileId),
				localUserId = var8,
				localHasPaidTradingAccess = var9,
				otherHasPaidTradingAccess = var10
			})
			
			return
		end
	end, {
		profileId,
		var8,
		var9,
		var10,
		var7
	})
end