local SessionService = game:GetService("SessionService")
local AvatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local Parent = AvatarSwitcher.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local ButtonSize = FoundationModule.Enums.ButtonSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SignalsReactModule = require(Parent.SignalsReact)
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local AddUnifiedEventLoggingFunction = AvatarExperienceAnalyticsModule.addUnifiedEventLogging
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local GetAvatarSwitcherStoreModule = require(AvatarSwitcher.Stores.getAvatarSwitcherStore)
local GetTimeoutStatusStoreFunction = require(Parent.AvatarExperienceCommon).Stores.getTimeoutStatusStore

return function(p1)
	-- upvalues: SignalsReactModule (copy), GetAvatarSwitcherStoreModule (copy), GetTimeoutStatusStoreFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), AddUnifiedEventLoggingFunction (copy), UnifiedEventLogEnums (copy), UnifiedLoggingSurface (copy), SessionService (copy), FoundationModule (copy), ButtonSize (copy), ButtonVariant (copy), FillBehavior (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetAvatarSwitcherStoreModule)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseSignalStateResult.getIsSwitching)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(UseSignalStateResult.getSelectedOutfitId)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(UseSignalStateResult.getSelectedOutfitDetails)
	local UseSignalStateResult4 = SignalsReactModule.useSignalState(GetTimeoutStatusStoreFunction().getIsTimedOut)
	local UseLocalizationResult = UseLocalizationFunction({ buttonText = "Feature.AvatarSwitcher.Action.Continue" })
	local UseSignalStateResult1_1 = UseSignalStateResult1 or UseSignalStateResult2 ~= nil and UseSignalStateResult3 == nil
	local UseSignalStateResult1_1_1 = UseSignalStateResult1_1 or (UseSignalStateResult2 == nil or UseSignalStateResult4)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: AddUnifiedEventLoggingFunction (upval), UseRefResult (copy), UnifiedEventLogEnums (upval), UnifiedLoggingSurface (upval), SessionService (upval)
		task.delay(0, function()
			-- upvalues: AddUnifiedEventLoggingFunction (upval), UseRefResult (upval), UnifiedEventLogEnums (upval), UnifiedLoggingSurface (upval), SessionService (upval)
			AddUnifiedEventLoggingFunction(UseRefResult, {
				elementName = "SWITCH_AVATAR_BUTTON",
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
				surface = UnifiedLoggingSurface.IN_EXPERIENCE_AVATAR_SWITCHER
			}, { sessionTagName = SessionService:GetSessionTag("level2a") })
		end)
	end, {})
	
	return (ReactModule.createElement(FoundationModule.Button, {
		text = UseLocalizationResult.buttonText,
		size = ButtonSize.Small,
		variant = if UseSignalStateResult1_1_1 then ButtonVariant.Standard else ButtonVariant.Emphasis,
		fillBehavior = FillBehavior.Fill,
		onActivated = p1.onActivated,
		isLoading = UseSignalStateResult1_1,
		isDisabled = UseSignalStateResult1_1_1,
		ref = UseRefResult
	}))
end