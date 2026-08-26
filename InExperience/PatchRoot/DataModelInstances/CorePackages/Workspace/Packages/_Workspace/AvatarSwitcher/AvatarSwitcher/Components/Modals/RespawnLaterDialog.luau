local sessionService = game:GetService("SessionService")
local parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialogSize = foundationModule.Enums.DialogSize
local orientation = foundationModule.Enums.Orientation
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local addUnifiedEventLogging = avatarExperienceAnalyticsModule.addUnifiedEventLogging
local unifiedEventLogEnums = avatarExperienceAnalyticsModule.UnifiedEventLogEnums
local unifiedLoggingSurface = require(parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface

return function(p1)
	-- upvalues: reactModule (ref), useLocalization (ref), addUnifiedEventLogging (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), sessionService (ref), dialog (ref), dialogSize (ref), orientation (ref), buttonVariant (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = useLocalization({
		headerText = "Feature.AvatarSwitcher.Heading.RespawnToSwitch",
		contentText = "Feature.AvatarSwitcher.Message.RespawnNotAllowed",
		continueText = "Feature.AvatarSwitcher.Action.OK"
	})
	reactModule.useEffect(function()
		-- upvalues: addUnifiedEventLogging (copy), var1 (ref), unifiedEventLogEnums (copy), unifiedLoggingSurface (copy), sessionService (copy)
		addUnifiedEventLogging(var1, {
			elementName = "DEFER_SWITCH_AVATAR_RESPAWN_DISABLED_BUTTON",
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
		DialogTitle = reactModule.createElement(dialog.Title, { text = var2.headerText }),
		DialogContent = reactModule.createElement(dialog.Content, nil, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var2.contentText })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			orientation = orientation.Vertical,
			actions = {
				{
					text = var2.continueText,
					variant = buttonVariant.Emphasis,
					onActivated = p1.onDefer,
					ref = var1
				}
			}
		})
	})
end