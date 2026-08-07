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

return function(p0) --[[ line: 30 | named "RespawnLaterDialog" ]]
	-- upvalues: reactModule (ref), useLocalization (ref), addUnifiedEventLogging (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), sessionService (ref), dialog (ref), dialogSize (ref), orientation (ref), buttonVariant (ref)
	local var4 = reactModule.useRef(nil)
	local var5 = useLocalization({
		headerText = "Feature.AvatarSwitcher.Heading.RespawnToSwitch",
		contentText = "Feature.AvatarSwitcher.Message.RespawnNotAllowed",
		continueText = "Feature.AvatarSwitcher.Action.OK"
	})
	reactModule.useEffect(function() --[[ line: 39 ]]
		-- upvalues: addUnifiedEventLogging (copy), var4 (ref), unifiedEventLogEnums (copy), unifiedLoggingSurface (copy), sessionService (copy)
		addUnifiedEventLogging(var4, {
			elementName = "DEFER_SWITCH_AVATAR_RESPAWN_DISABLED_BUTTON",
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = unifiedLoggingSurface.IN_EXPERIENCE_AVATAR_SWITCHER
		}, { sessionTagName = sessionService:GetSessionTag("level2a") })
	end, {})
	
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		size = dialogSize.Small,
		onClose = p0.onClose
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var5.headerText }),
		DialogContent = reactModule.createElement(dialog.Content, nil, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var5.contentText })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			orientation = orientation.Vertical,
			actions = {
				{
					text = var5.continueText,
					variant = buttonVariant.Emphasis,
					onActivated = p0.onDefer,
					ref = var4
				}
			}
		})
	})
end