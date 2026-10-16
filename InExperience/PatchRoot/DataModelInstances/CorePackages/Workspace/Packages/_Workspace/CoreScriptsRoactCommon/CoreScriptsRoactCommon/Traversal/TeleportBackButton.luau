local TeleportService = game:GetService("TeleportService")
local CoreScriptsRoactCommon = script:FindFirstAncestor("CoreScriptsRoactCommon")
local Parent = CoreScriptsRoactCommon.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local UseTeleportBackModule = require(CoreScriptsRoactCommon.Hooks.useTeleportBack)
local TraversalTelemetryModule = require(script.Parent.TraversalTelemetry)

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 23 | Named "TeleportBackButton" ]]
	-- upvalues: TeleportService (copy), UseTeleportBackModule (copy), FoundationModule (copy), ReactModule (copy), View (copy), TraversalTelemetryModule (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy)
	local ThirdPartyTeleportInfo, ThirdPartyTeleportInfo2 = TeleportService:GetThirdPartyTeleportInfo(false)
	local UseTeleportBackModuleResult = UseTeleportBackModule(ThirdPartyTeleportInfo2)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Foreground = UseTokensResult.Color.ActionStandard.Foreground
	
	return ReactModule.createElement(View, {
		tag = "padding-left-small padding-right-medium align-x-center align-y-center auto-x bg-over-media-0 radius-circle row size-0-1100",
		onActivated = function() --[[ Line: 32 ]]
			-- upvalues: TraversalTelemetryModule (upval), ThirdPartyTeleportInfo (copy), UseTeleportBackModuleResult (copy)
			TraversalTelemetryModule.sendBackButtonActionEvent({
				integration_id = "back_button",
				event_type = "click",
				destination_universe_id = ThirdPartyTeleportInfo
			})
			UseTeleportBackModuleResult()
		end,
		ref = Ref
	}, {
		TeleportBackIcon = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = IconName.ChevronLargeLeft,
			style = Foreground,
			size = IconSize.Medium
		}),
		TeleportText = p1.text and ReactModule.createElement(Text, {
			tag = "auto-x size-0-full text-truncate-split text-label-medium",
			LayoutOrder = 2,
			Text = p1.text,
			sizeConstraint = p1.textLimitWidth and {
				MaxSize = Vector2.new(p1.textLimitWidth, UseTokensResult.Size.Size_1100)
			},
			textStyle = Foreground
		})
	})
end))