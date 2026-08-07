local constantsModule = require(script.Parent.Parent.Constants)
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local checkbox = roactModule.Component:extend("Checkbox")

function checkbox.render(p0) --[[ line: 8 ]]
	-- upvalues: constantsModule (ref), roactModule (ref)
	local size = p0.props.Size
	local position = p0.props.Position or UDim2.new(0, 0, 0, 0)
	local layoutOrder = p0.props.LayoutOrder or 0
	local name = p0.props.Name
	local selectedColor = p0.props.SelectedColor or constantsModule.Color.SelectedBlue
	local unselectedColor = p0.props.UnselectedColor or constantsModule.Color.UnselectedGray
	local onSelectedStateChanged = p0.props.OnSelectedStateChanged
	local var7 = ""
	local var8 = 1
	local var9 = unselectedColor
	
	if p0.props.IsSelected then
		var7 = constantsModule.Image.Check
		var8 = 0
		var9 = selectedColor
	end
	return roactModule.createElement("ImageButton", {
		Size = size,
		Position = position,
		Image = var7,
		BackgroundColor3 = var9,
		BackgroundTransparency = 0,
		BorderColor3 = constantsModule.Color.Text,
		BorderSizePixel = var8,
		LayoutOrder = layoutOrder,
		[roactModule.Event.Activated] = function(_) --[[ line: 39 ]]
			-- upvalues: onSelectedStateChanged (ref), name (ref), p0 (ref)
			if onSelectedStateChanged then
				onSelectedStateChanged(name, not p0.props.IsSelected)
			end
		end
	})
end

return checkbox