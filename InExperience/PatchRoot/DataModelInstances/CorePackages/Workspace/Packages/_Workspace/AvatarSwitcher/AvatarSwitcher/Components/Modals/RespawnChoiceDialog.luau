local SessionService = game:GetService("SessionService")
local Parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local FoundationModule = require(Parent.Foundation)
local Orientation = FoundationModule.Enums.Orientation
local Dialog = FoundationModule.Dialog
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local AddUnifiedEventLoggingFunction = AvatarExperienceAnalyticsModule.addUnifiedEventLogging
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface

return function(p1) --[[ Line: 31 | Named "RespawnChoiceDialog" ]]
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), AddUnifiedEventLoggingFunction (copy), UnifiedEventLogEnums (copy), UnifiedLoggingSurface (copy), SessionService (copy), Dialog (copy), DialogSize (copy), Orientation (copy), ButtonVariant (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseLocalizationResult = UseLocalizationFunction({
		headerText = "Feature.AvatarSwitcher.Heading.RespawnToSwitch",
		contentText = "Feature.AvatarSwitcher.Label.RespawnLater",
		respawnText = "Feature.AvatarSwitcher.Action.Respawn",
		respawnLaterText = "Feature.AvatarSwitcher.Action.RespawnLater"
	})
	ReactModule.useEffect(function() --[[ Line: 42 ]]
		-- upvalues: AddUnifiedEventLoggingFunction (upval), UseRefResult (copy), UnifiedEventLogEnums (upval), UnifiedLoggingSurface (upval), SessionService (upval), UseRefResult1 (copy)
		AddUnifiedEventLoggingFunction(UseRefResult, {
			elementName = "CONFIRM_SWITCH_AVATAR_BUTTON",
			action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = UnifiedLoggingSurface.IN_EXPERIENCE_AVATAR_SWITCHER
		}, { sessionTagName = SessionService:GetSessionTag("level2a") })
		AddUnifiedEventLoggingFunction(UseRefResult1, {
			elementName = "DEFER_SWITCH_AVATAR_BUTTON",
			action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = UnifiedLoggingSurface.IN_EXPERIENCE_AVATAR_SWITCHER
		}, { sessionTagName = SessionService:GetSessionTag("level2a") })
	end, {})
	
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		size = DialogSize.Small,
		onClose = p1.onClose
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = UseLocalizationResult.headerText }),
		DialogContent = ReactModule.createElement(Dialog.Content, nil, {
			DialogText = ReactModule.createElement(Dialog.Text, { Text = UseLocalizationResult.contentText })
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			orientation = Orientation.Vertical,
			actions = {
				{
					text = UseLocalizationResult.respawnText,
					variant = ButtonVariant.Emphasis,
					onActivated = p1.onConfirm,
					ref = UseRefResult
				},
				{
					text = UseLocalizationResult.respawnLaterText,
					variant = ButtonVariant.Standard,
					onActivated = p1.onDefer,
					ref = UseRefResult1
				}
			}
		})
	})
end