local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local cryoModule = require(virtualEvents.Parent.Cryo)
local reactModule = require(virtualEvents.Parent.React)
local useStyle = require(virtualEvents.Parent.UIBlox).Core.Style.useStyle

return function(p0) --[[ line: 15 | named "SelectableTextLabel" ]]
	-- upvalues: useStyle (ref), cryoModule (ref), reactModule (ref)
	local baseSize = useStyle().Font.BaseSize
	
	return reactModule.createElement("TextBox", cryoModule.Dictionary.join({
		BackgroundTransparency = 1,
		ClearTextOnFocus = false,
		TextEditable = false,
		ClipsDescendants = true,
		AutomaticSize = Enum.AutomaticSize.XY,
		Font = p0.fontStyle.Font,
		TextColor3 = p0.colorStyle.Color,
		TextTransparency = p0.colorStyle.Transparency,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top
	}, p0, {
		fontStyle = cryoModule.None,
		colorStyle = cryoModule.None
	}), {
		TextSizeConstraint = reactModule.createElement("UITextSizeConstraint", {
			MaxTextSize = p0.fontStyle.RelativeSize * baseSize,
			MinTextSize = p0.fontStyle.RelativeMinSize * baseSize
		})
	})
end