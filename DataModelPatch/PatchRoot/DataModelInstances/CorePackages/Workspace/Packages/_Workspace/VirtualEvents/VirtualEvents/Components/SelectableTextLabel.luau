local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local CryoModule = require(VirtualEvents.Parent.Cryo)
local ReactModule = require(VirtualEvents.Parent.React)
local UseStyleFunction = require(VirtualEvents.Parent.UIBlox).Core.Style.useStyle

return function(p1)
	-- upvalues: UseStyleFunction (copy), CryoModule (copy), ReactModule (copy)
	local BaseSize = UseStyleFunction().Font.BaseSize
	
	return ReactModule.createElement("TextBox", CryoModule.Dictionary.join({
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
		fontStyle = CryoModule.None,
		colorStyle = CryoModule.None
	}), {
		TextSizeConstraint = ReactModule.createElement("UITextSizeConstraint", {
			MaxTextSize = p1.fontStyle.RelativeSize * BaseSize,
			MinTextSize = p1.fontStyle.RelativeMinSize * BaseSize
		})
	})
end