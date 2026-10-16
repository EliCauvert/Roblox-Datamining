local ConstantsModule = require(script.Parent.Parent.Constants)
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Checkbox = RoactModule.Component:extend("Checkbox")

function Checkbox.render(p1) --[[ Line: 8 ]]
	-- upvalues: ConstantsModule (copy), RoactModule (copy)
	local Size = p1.props.Size
	local Position = p1.props.Position or UDim2.new(0, 0, 0, 0)
	local LayoutOrder = p1.props.LayoutOrder or 0
	local Name = p1.props.Name
	local SelectedColor = p1.props.SelectedColor or ConstantsModule.Color.SelectedBlue
	local OnSelectedStateChangedFunction = p1.props.OnSelectedStateChanged
	local Check = ""
	local BorderSizePixel = 1
	local UnselectedColor = p1.props.UnselectedColor or ConstantsModule.Color.UnselectedGray
	
	if p1.props.IsSelected then
		Check = ConstantsModule.Image.Check
		BorderSizePixel = 0
		UnselectedColor = SelectedColor
	end
	return RoactModule.createElement("ImageButton", {
		Size = Size,
		Position = Position,
		Image = Check,
		BackgroundColor3 = UnselectedColor,
		BackgroundTransparency = 0,
		BorderColor3 = ConstantsModule.Color.Text,
		BorderSizePixel = BorderSizePixel,
		LayoutOrder = LayoutOrder,
		[RoactModule.Event.Activated] = function(_) --[[ Line: 39 ]]
			-- upvalues: OnSelectedStateChangedFunction (copy), Name (copy), p1 (copy)
			if OnSelectedStateChangedFunction then
				OnSelectedStateChangedFunction(Name, not p1.props.IsSelected)
			end
		end
	})
end

return Checkbox