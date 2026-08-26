local teleportService = game:GetService("TeleportService")
local coreScriptsRoactCommon = script:FindFirstAncestor("CoreScriptsRoactCommon")
local parent = coreScriptsRoactCommon.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local useTeleportBackModule = require(coreScriptsRoactCommon.Hooks.useTeleportBack)
local traversalTelemetryModule = require(script.Parent.TraversalTelemetry)

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: teleportService (ref), useTeleportBackModule (ref), foundationModule (ref), reactModule (ref), view (ref), traversalTelemetryModule (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	local var1, var2 = teleportService:GetThirdPartyTeleportInfo(false)
	local var3 = useTeleportBackModule(var2)
	local var4 = foundationModule.Hooks.useTokens()
	local foreground = var4.Color.ActionStandard.Foreground
	
	return reactModule.createElement(view, {
		tag = "padding-left-small padding-right-medium align-x-center align-y-center auto-x bg-over-media-0 radius-circle row size-0-1100",
		onActivated = function()
			-- upvalues: traversalTelemetryModule (copy), var1 (ref), var3 (ref)
			traversalTelemetryModule.sendBackButtonActionEvent({
				integration_id = "back_button",
				event_type = "click",
				destination_universe_id = var1
			})
			var3()
		end,
		ref = p2
	}, {
		TeleportBackIcon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = iconName.ChevronLargeLeft,
			style = foreground,
			size = iconSize.Medium
		}),
		TeleportText = p1.text and reactModule.createElement(text, {
			tag = "auto-x size-0-full text-truncate-split text-label-medium",
			LayoutOrder = 2,
			Text = p1.text,
			sizeConstraint = p1.textLimitWidth and {
				MaxSize = Vector2.new(p1.textLimitWidth, var4.Size.Size_1100)
			},
			textStyle = foreground
		})
	})
end))