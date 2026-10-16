local _ = game:GetService("CoreGui").RobloxGui
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Constants)
local CheckboxDropdown = RoactModule.Component:extend("CheckboxDropdown")

function CheckboxDropdown.render(p1) --[[ Line: 10 ]]
	-- upvalues: RoactModule (copy), ConstantsModule (copy)
	local FrameWidth = p1.props.frameWidth
	local DropdownTargetGui = p1.props.dropdownTargetGui
	local ScaledElementHeight = p1.props.elementHeight * p1.props.numElements
	
	return RoactModule.createElement(RoactModule.Portal, {
		target = if DropdownTargetGui == nil then game:GetService("CoreGui").DevConsoleMaster else DropdownTargetGui or game:GetService("CoreGui").DevConsoleMaster
	}, {
		InputCatcher = RoactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1,
			[RoactModule.Event.InputEnded] = p1.props.onCloseCheckbox
		}, {
			OuterFrame = RoactModule.createElement("ImageButton", {
				AutoButtonColor = false,
				BackgroundTransparency = 0,
				Size = UDim2.new(0, FrameWidth, 0, 24 + ScaledElementHeight),
				Position = p1.props.absolutePosition,
				BackgroundColor3 = ConstantsModule.Color.TextBoxGray
			}, {
				innerFrame = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 12, 0, 12),
					Size = UDim2.new(0, FrameWidth, 0, ScaledElementHeight)
				}, p1.props[RoactModule.Children] or {})
			})
		})
	})
end

return CheckboxDropdown