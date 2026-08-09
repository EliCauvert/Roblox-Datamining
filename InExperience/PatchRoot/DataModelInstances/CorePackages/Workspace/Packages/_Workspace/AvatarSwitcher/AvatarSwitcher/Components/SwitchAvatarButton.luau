local sessionService = game:GetService("SessionService")
local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local parent = avatarSwitcher.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local buttonSize = foundationModule.Enums.ButtonSize
local useLocalization = require(parent.Localization).Hooks.useLocalization
local signalsReactModule = require(parent.SignalsReact)
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local addUnifiedEventLogging = avatarExperienceAnalyticsModule.addUnifiedEventLogging
local unifiedEventLogEnums = avatarExperienceAnalyticsModule.UnifiedEventLogEnums
local unifiedLoggingSurface = require(parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local getAvatarSwitcherStoreModule = require(avatarSwitcher.Stores.getAvatarSwitcherStore)
local fFlagAXAvatarTimeoutFlowIE = require(parent.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE
local getTimeoutStatusStore = require(parent.AvatarExperienceCommon).Stores.getTimeoutStatusStore

return function(p0) --[[ line: 31 | named "SwitchAvatarButton" ]]
	-- upvalues: signalsReactModule (ref), getAvatarSwitcherStoreModule (ref), fFlagAXAvatarTimeoutFlowIE (ref), getTimeoutStatusStore (ref), useLocalization (ref), reactModule (ref), addUnifiedEventLogging (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), sessionService (ref), foundationModule (ref), buttonSize (ref), buttonVariant (ref), fillBehavior (ref)
	local var7 = signalsReactModule.useSignalState(getAvatarSwitcherStoreModule)
	local var8 = signalsReactModule.useSignalState(var7.getIsSwitching)
	local var9 = signalsReactModule.useSignalState(var7.getSelectedOutfitId)
	local var10 = signalsReactModule.useSignalState(var7.getSelectedOutfitDetails)
	local _ = nil
	local var11 = if fFlagAXAvatarTimeoutFlowIE then signalsReactModule.useSignalState(getTimeoutStatusStore().getIsTimedOut) else nil
	local var12 = useLocalization({ buttonText = "Feature.AvatarSwitcher.Action.Continue" })
	local var8_1 = var8 or (var9 ~= nil and var10 == nil)
	local var14 = var8_1
	
	if not var14 then
		var14 = true
		var14 = var9 == nil and ((if var9 == nil then fFlagAXAvatarTimeoutFlowIE else nil) and var11)
	end
	local var15 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 53 ]]
		-- upvalues: addUnifiedEventLogging (copy), var15 (ref), unifiedEventLogEnums (copy), unifiedLoggingSurface (copy), sessionService (copy)
		task.delay(0, function() --[[ line: 56 ]]
			-- upvalues: addUnifiedEventLogging (copy), var15 (copy), unifiedEventLogEnums (copy), unifiedLoggingSurface (copy), sessionService (copy)
			addUnifiedEventLogging(var15, {
				elementName = "SWITCH_AVATAR_BUTTON",
				action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
				surface = unifiedLoggingSurface.IN_EXPERIENCE_AVATAR_SWITCHER
			}, { sessionTagName = sessionService:GetSessionTag("level2a") })
		end)
	end, {})
	
	return reactModule.createElement(foundationModule.Button, {
		text = var12.buttonText,
		size = buttonSize.Small,
		variant = if var14 then buttonVariant.Standard else buttonVariant.Emphasis,
		fillBehavior = fillBehavior.Fill,
		onActivated = p0.onActivated,
		isLoading = var8_1,
		isDisabled = var14,
		ref = var15
	})
end