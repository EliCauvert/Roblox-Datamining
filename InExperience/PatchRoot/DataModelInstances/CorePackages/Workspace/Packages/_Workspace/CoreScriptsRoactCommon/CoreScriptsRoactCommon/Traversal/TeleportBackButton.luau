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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 23 | named "TeleportBackButton" ]]
	-- upvalues: teleportService (ref), useTeleportBackModule (ref), foundationModule (ref), reactModule (ref), view (ref), traversalTelemetryModule (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	local var6, var7 = teleportService:GetThirdPartyTeleportInfo(false)
	local var8 = useTeleportBackModule(var7)
	local var9 = foundationModule.Hooks.useTokens()
	local foreground = var9.Color.ActionStandard.Foreground
	
	return reactModule.createElement(view, {
		tag = "padding-left-small padding-right-medium align-x-center align-y-center auto-x bg-over-media-0 radius-circle row size-0-1100",
		onActivated = function() --[[ line: 32 ]]
			-- upvalues: traversalTelemetryModule (copy), var6 (ref), var8 (ref)
			traversalTelemetryModule.sendBackButtonActionEvent({
				integration_id = "back_button",
				event_type = "click",
				destination_universe_id = var6
			})
			var8()
		end,
		ref = p1
	}, {
		TeleportBackIcon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = iconName.ChevronLargeLeft,
			style = foreground,
			size = iconSize.Medium
		}),
		TeleportText = p0.text and reactModule.createElement(text, {
			tag = "auto-x size-0-full text-truncate-split text-label-medium",
			LayoutOrder = 2,
			Text = p0.text,
			sizeConstraint = p0.textLimitWidth and {
				MaxSize = Vector2.new(p0.textLimitWidth, var9.Size.Size_1100)
			},
			textStyle = foreground
		})
	})
end))