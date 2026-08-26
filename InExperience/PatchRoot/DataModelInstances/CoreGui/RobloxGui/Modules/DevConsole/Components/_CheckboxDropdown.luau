local _ = game:GetService("CoreGui").RobloxGui
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local checkboxDropdown = roactModule.Component:extend("CheckboxDropdown")

function checkboxDropdown.render(p1)
	-- upvalues: roactModule (ref), constantsModule (ref)
	local children = p1.props[roactModule.Children] or {}
	local absolutePosition = p1.props.absolutePosition
	local frameWidth = p1.props.frameWidth
	local dropdownTargetGui = p1.props.dropdownTargetGui
	local var1 = p1.props.elementHeight * p1.props.numElements
	
	return roactModule.createElement(roactModule.Portal, {
		target = if dropdownTargetGui ~= nil then dropdownTargetGui else game:GetService("CoreGui").DevConsoleMaster
	}, {
		InputCatcher = roactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1,
			[roactModule.Event.InputEnded] = p1.props.onCloseCheckbox
		}, {
			OuterFrame = roactModule.createElement("ImageButton", {
				AutoButtonColor = false,
				BackgroundTransparency = 0,
				Size = UDim2.new(0, frameWidth, 0, 24 + var1),
				Position = absolutePosition,
				BackgroundColor3 = constantsModule.Color.TextBoxGray
			}, {
				innerFrame = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 12, 0, 12),
					Size = UDim2.new(0, frameWidth, 0, var1)
				}, children)
			})
		})
	})
end

return checkboxDropdown