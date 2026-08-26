local sessionService = game:GetService("SessionService")
local parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local foundationModule = require(parent.Foundation)
local orientation = foundationModule.Enums.Orientation
local dialog = foundationModule.Dialog
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialogSize = foundationModule.Enums.DialogSize
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local addUnifiedEventLogging = avatarExperienceAnalyticsModule.addUnifiedEventLogging
local unifiedEventLogEnums = avatarExperienceAnalyticsModule.UnifiedEventLogEnums
local unifiedLoggingSurface = require(parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface

return function(p1)
	-- upvalues: reactModule (ref), useLocalization (ref), addUnifiedEventLogging (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), sessionService (ref), dialog (ref), dialogSize (ref), orientation (ref), buttonVariant (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3 = useLocalization({
		headerText = "Feature.AvatarSwitcher.Heading.RespawnToSwitch",
		contentText = "Feature.AvatarSwitcher.Label.RespawnLater",
		respawnText = "Feature.AvatarSwitcher.Action.Respawn",
		respawnLaterText = "Feature.AvatarSwitcher.Action.RespawnLater"
	})
	reactModule.useEffect(function()
		-- upvalues: addUnifiedEventLogging (copy), var1 (ref), unifiedEventLogEnums (copy), unifiedLoggingSurface (copy), sessionService (copy), var2 (ref)
		addUnifiedEventLogging(var1, {
			elementName = "CONFIRM_SWITCH_AVATAR_BUTTON",
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = unifiedLoggingSurface.IN_EXPERIENCE_AVATAR_SWITCHER
		}, { sessionTagName = sessionService:GetSessionTag("level2a") })
		addUnifiedEventLogging(var2, {
			elementName = "DEFER_SWITCH_AVATAR_BUTTON",
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = unifiedLoggingSurface.IN_EXPERIENCE_AVATAR_SWITCHER
		}, { sessionTagName = sessionService:GetSessionTag("level2a") })
	end, {})
	
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		size = dialogSize.Small,
		onClose = p1.onClose
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var3.headerText }),
		DialogContent = reactModule.createElement(dialog.Content, nil, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var3.contentText })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			orientation = orientation.Vertical,
			actions = {
				{
					text = var3.respawnText,
					variant = buttonVariant.Emphasis,
					onActivated = p1.onConfirm,
					ref = var1
				},
				{
					text = var3.respawnLaterText,
					variant = buttonVariant.Standard,
					onActivated = p1.onDefer,
					ref = var2
				}
			}
		})
	})
end