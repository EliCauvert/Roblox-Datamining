local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local cryoModule = require(virtualEvents.Parent.Cryo)
local reactModule = require(virtualEvents.Parent.React)
local useStyle = require(virtualEvents.Parent.UIBlox).Core.Style.useStyle

return function(p1)
	-- upvalues: useStyle (ref), cryoModule (ref), reactModule (ref)
	local baseSize = useStyle().Font.BaseSize
	
	return reactModule.createElement("TextBox", cryoModule.Dictionary.join({
		BackgroundTransparency = 1,
		ClearTextOnFocus = false,
		TextEditable = false,
		ClipsDescendants = true,
		AutomaticSize = Enum.AutomaticSize.XY,
		Font = p1.fontStyle.Font,
		TextColor3 = p1.colorStyle.Color,
		TextTransparency = p1.colorStyle.Transparency,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top
	}, p1, {
		fontStyle = cryoModule.None,
		colorStyle = cryoModule.None
	}), {
		TextSizeConstraint = reactModule.createElement("UITextSizeConstraint", {
			MaxTextSize = p1.fontStyle.RelativeSize * baseSize,
			MinTextSize = p1.fontStyle.RelativeMinSize * baseSize
		})
	})
end