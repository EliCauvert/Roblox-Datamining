local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useTokens = require(parent.Foundation).Hooks.useTokens
local sduiTextIconRowModule = require(serverDrivenUi.Content.SduiTextIconRow)
local useCountdownSubtitleTextBinding = require(parent.GameCollections).useCountdownSubtitleTextBinding

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), useCountdownSubtitleTextBinding (ref), reactModule (ref), sduiTextIconRowModule (ref), cryoModule (ref)
	local var4 = useTokens()
	local textColor = p0.textColor or var4.Color.Content.Default.Color3
	
	return reactModule.createElement(sduiTextIconRowModule, cryoModule.Dictionary.join({
		testId = "--sdui-countdown-text-icon-row",
		gap = p0.gap or var4.Gap.XXSmall,
		fontStyle = p0.fontStyle or var4.Typography.BodyMedium,
		textColor = textColor,
		textFlexMode = Enum.UIFlexMode.Shrink,
		icon = p0.icon,
		iconWidth = p0.iconWidth or var4.Size.Size_400,
		iconColor = textColor,
		selectable = p0.onActivated ~= nil
	}, p0, {
		text = useCountdownSubtitleTextBinding(p0.endTimestamp, p0.formatStringHoursMinutes, p0.defaultString)
	}))
end)