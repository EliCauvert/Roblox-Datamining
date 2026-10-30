local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local SduiTextIconRowModule = require(ServerDrivenUi.Content.SduiTextIconRow)
local UseCountdownSubtitleTextBindingFunction = require(Parent.GameCollections).useCountdownSubtitleTextBinding

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseCountdownSubtitleTextBindingFunction (copy), ReactModule (copy), SduiTextIconRowModule (copy), CryoModule (copy)
	local UseTokensResult = UseTokensFunction()
	local TextColor = p1.textColor or UseTokensResult.Color.Content.Default.Color3
	
	return ReactModule.createElement(SduiTextIconRowModule, CryoModule.Dictionary.join({
		testId = "--sdui-countdown-text-icon-row",
		gap = p1.gap or UseTokensResult.Gap.XXSmall,
		fontStyle = p1.fontStyle or UseTokensResult.Typography.BodyMedium,
		textColor = TextColor,
		textFlexMode = Enum.UIFlexMode.Shrink,
		icon = p1.icon,
		iconWidth = p1.iconWidth or UseTokensResult.Size.Size_400,
		iconColor = TextColor,
		selectable = p1.onActivated ~= nil
	}, p1, {
		text = UseCountdownSubtitleTextBindingFunction(p1.endTimestamp, p1.formatStringHoursMinutes, p1.defaultString)
	}))
end)