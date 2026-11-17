local IAPExperience = script:FindFirstAncestor("IAPExperience")
local Parent = IAPExperience.Parent
local ReactModule = require(Parent.React)
local AccountSettingsEntryPointsModule = require(Parent.AccountSettingsEntryPoints)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetAppContextModule = require(IAPExperience.Utility.getAppContext)
local ManageRecommendationsInputOwnerModule = require(script.Parent.ManageRecommendationsInputOwner)
local _ = require(script.Parent.ManageRecommendationsMenuView)

return function()
	-- upvalues: ReactModule (copy), GetAppContextModule (copy), UniversalAppPolicyModule (copy), UseLocalizationFunction (copy), ManageRecommendationsInputOwnerModule (copy), AccountSettingsEntryPointsModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetAppContextModule (upval), UniversalAppPolicyModule (upval)
		return GetAppContextModule() == "IN_EXPERIENCE" and UniversalAppPolicyModule.getAppFeaturePolicies().getShowInContextPersonalizedRecommendationsInExperienceBuyRobux()
	end, {})
	local UseLocalizationResult = UseLocalizationFunction({
		label = if UseMemoResult then "Feature.BuyRobux.Action.ContentPersonalization" else nil
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3 = UseStateResult or UseStateResult1
	ReactModule.useEffect(function()
		-- upvalues: ManageRecommendationsInputOwnerModule (upval), UseStateResult3 (copy)
		ManageRecommendationsInputOwnerModule.setActive(UseStateResult3)
	end, { UseStateResult3 })
	ReactModule.useEffect(function()
		-- upvalues: ManageRecommendationsInputOwnerModule (upval)
		return ManageRecommendationsInputOwnerModule.reset
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p1): boolean
			return not p1
		end)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), AccountSettingsEntryPointsModule (upval)
		UseStateResult2(false)
		UseStateResult2_1(true)
		AccountSettingsEntryPointsModule.openAccountSettings(AccountSettingsEntryPointsModule.Page.PersonalizedRecommendations, {
			surfaceKey = "Client_InExperience_BuyRobux",
			onClosed = function()
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1(false)
			end
		})
	end, {})
	
	return if UseMemoResult then {
		viewProps = {
			label = UseLocalizationResult.label or "",
			isOpen = UseStateResult,
			onTriggerActivated = UseResult,
			onDismiss = UseResult1,
			onItemActivated = UseResult2,
			triggerRef = ManageRecommendationsInputOwnerModule.setTrigger
		},
		isActive = UseStateResult3
	} else nil
end