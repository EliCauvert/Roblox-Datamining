local app = script:FindFirstAncestor("App")
local parent = app.Parent
local core = parent.Core
local parent_1 = parent.Parent
local tModule = require(parent_1.t)
local roactModule = require(parent_1.Roact)
local buttonModule = require(app.Button.Button)
local buttonTypeModule = require(app.Button.Enum.ButtonType)
local controlStateModule = require(core.Control.Enum.ControlState)
local playerTileButton = roactModule.PureComponent:extend("PlayerTileButton")
playerTileButton.validateProps = tModule.strictInterface({
	buttonHeight = tModule.optional(tModule.number),
	buttonWidth = tModule.optional(tModule.number),
	outerButtonPadding = tModule.optional(tModule.number),
	icon = tModule.union(tModule.string, tModule.table),
	onActivated = tModule.optional(tModule.callback),
	isSecondary = tModule.optional(tModule.boolean),
	isDisabled = tModule.optional(tModule.boolean),
	tileSize = tModule.optional(tModule.UDim2),
	mouseEnter = tModule.optional(tModule.callback),
	mouseLeave = tModule.optional(tModule.callback),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean)
})
playerTileButton.defaultProps = {
	isSecondary = false,
	isDisabled = false,
	buttonHeight = 36,
	outerButtonPadding = 10,
	isRoactGamepadEnabled = true,
	tileSize = UDim2.new(0, 150, 0, 150)
}

function playerTileButton.render(p0) --[[ line: 42 ]]
	-- upvalues: buttonTypeModule (ref), roactModule (ref), buttonModule (ref), controlStateModule (ref)
	return roactModule.createElement(buttonModule, {
		buttonType = if p0.props.isSecondary then buttonTypeModule.Secondary else buttonTypeModule.PrimarySystem,
		automaticSize = Enum.AutomaticSize.XY,
		position = UDim2.new(1, 0, 1, 0),
		size = UDim2.new(0, p0.props.tileSize.X.Offset / 2 - p0.props.outerButtonPadding * 1.5, 0, p0.props.buttonHeight),
		anchorPoint = Vector2.new(1, 1),
		onActivated = p0.props.onActivated or function() --[[ line: 62 ]] end,
		isDisabled = p0.props.isDisabled,
		icon = p0.props.icon,
		isRoactGamepadEnabled = p0.props.isRoactGamepadEnabled,
		onStateChanged = function(p1, p2) --[[ line: 66 ]]
			-- upvalues: controlStateModule (copy), p0 (ref)
			if p1 == controlStateModule.Hover then
				p0.props.mouseEnter()
				
				return
			elseif p2 == controlStateModule.Hover then
				p0.props.mouseLeave()
			end
		end
	})
end

return playerTileButton