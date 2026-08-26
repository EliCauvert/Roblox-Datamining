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
local getTimeoutStatusStore = require(parent.AvatarExperienceCommon).Stores.getTimeoutStatusStore

return function(p1)
	-- upvalues: signalsReactModule (ref), getAvatarSwitcherStoreModule (ref), getTimeoutStatusStore (ref), useLocalization (ref), reactModule (ref), addUnifiedEventLogging (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), sessionService (ref), foundationModule (ref), buttonSize (ref), buttonVariant (ref), fillBehavior (ref)
	local var1 = signalsReactModule.useSignalState(getAvatarSwitcherStoreModule)
	local var2 = signalsReactModule.useSignalState(var1.getIsSwitching)
	local var3 = signalsReactModule.useSignalState(var1.getSelectedOutfitId)
	local var4 = signalsReactModule.useSignalState(var1.getSelectedOutfitDetails)
	local var5 = signalsReactModule.useSignalState(getTimeoutStatusStore().getIsTimedOut)
	local var6 = useLocalization({ buttonText = "Feature.AvatarSwitcher.Action.Continue" })
	local var7 = var2 or (var3 ~= nil and var4 == nil)
	local var8 = var7 or (if var3 ~= nil then var5 else true)
	local var9 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: addUnifiedEventLogging (copy), var9 (ref), unifiedEventLogEnums (copy), unifiedLoggingSurface (copy), sessionService (copy)
		task.delay(0, function()
			-- upvalues: addUnifiedEventLogging (copy), var9 (copy), unifiedEventLogEnums (copy), unifiedLoggingSurface (copy), sessionService (copy)
			addUnifiedEventLogging(var9, {
				elementName = "SWITCH_AVATAR_BUTTON",
				action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
				surface = unifiedLoggingSurface.IN_EXPERIENCE_AVATAR_SWITCHER
			}, { sessionTagName = sessionService:GetSessionTag("level2a") })
		end)
	end, {})
	
	return reactModule.createElement(foundationModule.Button, {
		text = var6.buttonText,
		size = buttonSize.Small,
		variant = if var8 then buttonVariant.Standard else buttonVariant.Emphasis,
		fillBehavior = fillBehavior.Fill,
		onActivated = p1.onActivated,
		isLoading = var7,
		isDisabled = var8,
		ref = var9
	})
end