-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:55 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local reactModule = require(parent.Parent.React)
local useStyleModule = require(parent.Core.Style.useStyle)

return function(p0) --[[ line: 18 | named "HelperText" ]]
	-- upvalues: useStyleModule (ref), reactModule (ref)
	local helperText = useStyleModule().Tokens.Component.HelperText
	local typography = helperText.Base.Typography
	local var2 = if p0.error then helperText.Error.ContentColor else helperText.Base.ContentColor
	
	return reactModule.createElement("TextLabel", {
		TextWrapped = true,
		BackgroundTransparency = 1,
		Text = p0.text,
		TextTransparency = var2.Transparency,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextColor3 = var2.Color3,
		Font = typography.Font,
		TextSize = typography.FontSize,
		LineHeight = typography.LineHeight,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.LayoutOrder
	})
end