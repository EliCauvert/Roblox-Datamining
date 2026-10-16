local Roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact
local SocialLibrariesSelectableAlertViewShim = game:DefineFastFlag("SocialLibrariesSelectableAlertViewShim", false)
local AlertViewSoakArea = Roact.PureComponent:extend("AlertViewSoakArea")
AlertViewSoakArea.defaultProps = {
	Visible = true,
	BackgroundTransparency = 0.75,
	BackgroundColor3 = Color3.fromRGB(255, 0, 255)
}

function AlertViewSoakArea.render(p1) --[[ Line: 14 ]]
	-- upvalues: Roact (copy), SocialLibrariesSelectableAlertViewShim (copy)
	return Roact.createElement("ImageButton", {
		Active = true,
		AutoButtonColor = false,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = p1.props.BackgroundTransparency,
		BackgroundColor3 = p1.props.BackgroundColor3,
		Selectable = not SocialLibrariesSelectableAlertViewShim and nil,
		Visible = p1.props.Visible
	}, p1.props[Roact.Children])
end

return AlertViewSoakArea