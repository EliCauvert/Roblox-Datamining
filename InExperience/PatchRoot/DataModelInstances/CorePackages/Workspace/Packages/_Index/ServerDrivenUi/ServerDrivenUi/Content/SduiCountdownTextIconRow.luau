local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useTokens = require(parent.Foundation).Hooks.useTokens
local sduiTextIconRowModule = require(serverDrivenUi.Content.SduiTextIconRow)
local useCountdownSubtitleTextBinding = require(parent.GameCollections).useCountdownSubtitleTextBinding

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useCountdownSubtitleTextBinding (ref), reactModule (ref), sduiTextIconRowModule (ref), cryoModule (ref)
	local var1 = useTokens()
	local textColor = p1.textColor or var1.Color.Content.Default.Color3
	
	return reactModule.createElement(sduiTextIconRowModule, cryoModule.Dictionary.join({
		testId = "--sdui-countdown-text-icon-row",
		gap = p1.gap or var1.Gap.XXSmall,
		fontStyle = p1.fontStyle or var1.Typography.BodyMedium,
		textColor = textColor,
		textFlexMode = Enum.UIFlexMode.Shrink,
		icon = p1.icon,
		iconWidth = p1.iconWidth or var1.Size.Size_400,
		iconColor = textColor,
		selectable = p1.onActivated ~= nil
	}, p1, {
		text = useCountdownSubtitleTextBinding(p1.endTimestamp, p1.formatStringHoursMinutes, p1.defaultString)
	}))
end)