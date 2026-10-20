local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseHasPaidTradingAccessModule = require(ProfilePlatform.Hooks.useHasPaidTradingAccess)
local LogTradeItemsExposureIfEligibleModule = require(ProfilePlatform.Utils.logTradeItemsExposureIfEligible)

return function()
	-- upvalues: UseProfileWrapperContextModule (copy), EnumsModule (copy), UseLocalUserIdFunction (copy), UseHasPaidTradingAccessModule (copy), ReactModule (copy), LogTradeItemsExposureIfEligibleModule (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local ProfileId = UseProfileWrapperContextModuleResult.profileId
	local IsProfileTypeMatch = UseProfileWrapperContextModuleResult.profileType == EnumsModule.ProfileTypes.User
	local Text = tostring((UseLocalUserIdFunction()))
	local UseHasPaidTradingAccessModuleResult = UseHasPaidTradingAccessModule(Text)
	local UseHasPaidTradingAccessModuleResult1 = UseHasPaidTradingAccessModule(if IsProfileTypeMatch then ProfileId else nil)
	
	return ReactModule.useCallback(function()
		-- upvalues: IsProfileTypeMatch (copy), LogTradeItemsExposureIfEligibleModule (upval), ProfileId (copy), Text (copy), UseHasPaidTradingAccessModuleResult (copy), UseHasPaidTradingAccessModuleResult1 (copy)
		if IsProfileTypeMatch then
			LogTradeItemsExposureIfEligibleModule({
				profileId = tostring(ProfileId),
				localUserId = Text,
				localHasPaidTradingAccess = UseHasPaidTradingAccessModuleResult,
				otherHasPaidTradingAccess = UseHasPaidTradingAccessModuleResult1
			})
			
			return
		end
	end, {
		ProfileId,
		Text,
		UseHasPaidTradingAccessModuleResult,
		UseHasPaidTradingAccessModuleResult1,
		IsProfileTypeMatch
	})
end