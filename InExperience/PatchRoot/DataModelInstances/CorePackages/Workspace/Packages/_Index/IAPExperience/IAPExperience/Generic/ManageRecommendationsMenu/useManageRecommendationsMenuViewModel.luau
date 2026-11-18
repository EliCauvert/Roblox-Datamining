local IAPExperience = script:FindFirstAncestor("IAPExperience")
local Parent = IAPExperience.Parent
local ReactModule = require(Parent.React)
local AccountSettingsEntryPointsModule = require(Parent.AccountSettingsEntryPoints)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetAppContextModule = require(IAPExperience.Utility.getAppContext)
local FFlagPurchasePromptVLOPUpsellSettingsEntryPointModule = require(IAPExperience.Flags.FFlagPurchasePromptVLOPUpsellSettingsEntryPoint)
local FFlagPurchasePromptVLOPAppUpsellSettingsEntryPointModule = require(IAPExperience.Flags.FFlagPurchasePromptVLOPAppUpsellSettingsEntryPoint)
local ManageRecommendationsInputOwnerModule = require(script.Parent.ManageRecommendationsInputOwner)
local _ = require(script.Parent.ManageRecommendationsMenuView)
local ManageRecommendationsSurfaceKeyModule = require(script.Parent.ManageRecommendationsSurfaceKey)

local function getVisibleSurfaceKey(p1)
	-- upvalues: GetAppContextModule (copy), FFlagPurchasePromptVLOPUpsellSettingsEntryPointModule (copy), UniversalAppPolicyModule (copy), ManageRecommendationsSurfaceKeyModule (copy)
	if GetAppContextModule() == "IN_EXPERIENCE" then
		return if FFlagPurchasePromptVLOPUpsellSettingsEntryPointModule and UniversalAppPolicyModule.getAppFeaturePolicies().getShowInContextPersonalizedRecommendationsInExperienceBuyRobux() then ManageRecommendationsSurfaceKeyModule.InExperience else nil
	else
		local AppFeaturePolicies = UniversalAppPolicyModule.getAppFeaturePolicies()
		
		return if p1 then if AppFeaturePolicies.getShowInContextPersonalizedRecommendationsMarketplaceBuyRobux() then ManageRecommendationsSurfaceKeyModule.Marketplace else nil elseif AppFeaturePolicies.getShowInContextPersonalizedRecommendationsExperienceDetailsBuyRobux() then ManageRecommendationsSurfaceKeyModule.ExperienceDetails else nil
	end
end

return function(p1)
	-- upvalues: FFlagPurchasePromptVLOPAppUpsellSettingsEntryPointModule (copy), ReactModule (copy), getVisibleSurfaceKey (copy), GetAppContextModule (copy), UniversalAppPolicyModule (copy), ManageRecommendationsSurfaceKeyModule (copy), UseLocalizationFunction (copy), ManageRecommendationsInputOwnerModule (copy), AccountSettingsEntryPointsModule (copy)
	local UseMemoResult = nil
	UseMemoResult = if FFlagPurchasePromptVLOPAppUpsellSettingsEntryPointModule then ReactModule.useMemo(function()
		-- upvalues: getVisibleSurfaceKey (upval), p1 (copy)
		return (getVisibleSurfaceKey(p1))
	end, { p1 }) elseif ReactModule.useMemo(function()
		-- upvalues: GetAppContextModule (upval), UniversalAppPolicyModule (upval)
		return GetAppContextModule() == "IN_EXPERIENCE" and UniversalAppPolicyModule.getAppFeaturePolicies().getShowInContextPersonalizedRecommendationsInExperienceBuyRobux()
	end, {}) then ManageRecommendationsSurfaceKeyModule.InExperience else nil
	local HasUseMemoResult = UseMemoResult ~= nil
	local UseLocalizationResult = UseLocalizationFunction({
		label = if HasUseMemoResult then "Feature.BuyRobux.Action.ContentPersonalization" else nil
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
		UseStateResult2(function(p2): boolean
			return not p2
		end)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), AccountSettingsEntryPointsModule (upval), UseMemoResult (ref)
		UseStateResult2(false)
		UseStateResult2_1(true)
		AccountSettingsEntryPointsModule.openAccountSettings(AccountSettingsEntryPointsModule.Page.PersonalizedRecommendations, {
			surfaceKey = UseMemoResult,
			onClosed = function()
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1(false)
			end
		})
	end, { UseMemoResult })
	
	return if HasUseMemoResult then {
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