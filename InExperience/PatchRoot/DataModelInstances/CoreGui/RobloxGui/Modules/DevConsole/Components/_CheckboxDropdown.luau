local _ = game:GetService("CoreGui").RobloxGui
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local checkboxDropdown = roactModule.Component:extend("CheckboxDropdown")

function checkboxDropdown.render(p0)
	-- upvalues: roactModule (ref), constantsModule (ref)
	local children = p0.props[roactModule.Children] or {}
	local absolutePosition = p0.props.absolutePosition
	local frameWidth = p0.props.frameWidth
	local dropdownTargetGui = p0.props.dropdownTargetGui
	local var4 = p0.props.elementHeight * p0.props.numElements
	
	return roactModule.createElement(roactModule.Portal, {
		target = if dropdownTargetGui ~= nil then dropdownTargetGui else game:GetService("CoreGui").DevConsoleMaster
	}, {
		InputCatcher = roactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1,
			[roactModule.Event.InputEnded] = p0.props.onCloseCheckbox
		}, {
			OuterFrame = roactModule.createElement("ImageButton", {
				AutoButtonColor = false,
				BackgroundTransparency = 0,
				Size = UDim2.new(0, frameWidth, 0, 24 + var4),
				Position = absolutePosition,
				BackgroundColor3 = constantsModule.Color.TextBoxGray
			}, {
				innerFrame = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 12, 0, 12),
					Size = UDim2.new(0, frameWidth, 0, var4)
				}, children)
			})
		})
	})
end

return checkboxDropdown