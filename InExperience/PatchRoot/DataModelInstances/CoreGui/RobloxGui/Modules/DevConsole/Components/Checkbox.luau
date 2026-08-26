local constantsModule = require(script.Parent.Parent.Constants)
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local checkbox = roactModule.Component:extend("Checkbox")

function checkbox.render(p1)
	-- upvalues: constantsModule (ref), roactModule (ref)
	local size = p1.props.Size
	local position = p1.props.Position or UDim2.new(0, 0, 0, 0)
	local layoutOrder = p1.props.LayoutOrder or 0
	local name = p1.props.Name
	local selectedColor = p1.props.SelectedColor or constantsModule.Color.SelectedBlue
	local unselectedColor = p1.props.UnselectedColor or constantsModule.Color.UnselectedGray
	local onSelectedStateChanged = p1.props.OnSelectedStateChanged
	local var1 = ""
	local var2 = 1
	local var3 = unselectedColor
	
	if p1.props.IsSelected then
		var1 = constantsModule.Image.Check
		var2 = 0
		var3 = selectedColor
	end
	return roactModule.createElement("ImageButton", {
		Size = size,
		Position = position,
		Image = var1,
		BackgroundColor3 = var3,
		BackgroundTransparency = 0,
		BorderColor3 = constantsModule.Color.Text,
		BorderSizePixel = var2,
		LayoutOrder = layoutOrder,
		[roactModule.Event.Activated] = function(_)
			-- upvalues: onSelectedStateChanged (ref), name (ref), p1 (ref)
			if onSelectedStateChanged then
				onSelectedStateChanged(name, not p1.props.IsSelected)
			end
		end
	})
end

return checkbox