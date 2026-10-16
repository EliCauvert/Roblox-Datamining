local App = script:FindFirstAncestor("App")
local Parent = App.Parent
local Parent1 = Parent.Parent
local TModule = require(Parent1.t)
local RoactModule = require(Parent1.Roact)
local ButtonModule = require(App.Button.Button)
local ButtonTypeModule = require(App.Button.Enum.ButtonType)
local ControlStateModule = require(Parent.Core.Control.Enum.ControlState)
local PlayerTileButton = RoactModule.PureComponent:extend("PlayerTileButton")
PlayerTileButton.validateProps = TModule.strictInterface({
	buttonHeight = TModule.optional(TModule.number),
	buttonWidth = TModule.optional(TModule.number),
	outerButtonPadding = TModule.optional(TModule.number),
	icon = TModule.union(TModule.string, TModule.table),
	onActivated = TModule.optional(TModule.callback),
	isSecondary = TModule.optional(TModule.boolean),
	isDisabled = TModule.optional(TModule.boolean),
	tileSize = TModule.optional(TModule.UDim2),
	mouseEnter = TModule.optional(TModule.callback),
	mouseLeave = TModule.optional(TModule.callback),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean)
})
PlayerTileButton.defaultProps = {
	isSecondary = false,
	isDisabled = false,
	buttonHeight = 36,
	outerButtonPadding = 10,
	isRoactGamepadEnabled = true,
	tileSize = UDim2.new(0, 150, 0, 150)
}

function PlayerTileButton.render(p1) --[[ Line: 42 ]]
	-- upvalues: ButtonTypeModule (copy), RoactModule (copy), ButtonModule (copy), ControlStateModule (copy)
	return RoactModule.createElement(ButtonModule, {
		buttonType = p1.props.isSecondary and ButtonTypeModule.Secondary or ButtonTypeModule.PrimarySystem,
		automaticSize = Enum.AutomaticSize.XY,
		position = UDim2.new(1, 0, 1, 0),
		size = UDim2.new(0, p1.props.tileSize.X.Offset / 2 - p1.props.outerButtonPadding * 1.5, 0, p1.props.buttonHeight),
		anchorPoint = Vector2.new(1, 1),
		onActivated = p1.props.onActivated or function() --[[ Line: 62 ]] end,
		isDisabled = p1.props.isDisabled,
		icon = p1.props.icon,
		isRoactGamepadEnabled = p1.props.isRoactGamepadEnabled,
		onStateChanged = function(Hover, Hover1) --[[ Line: 66 ]]
			-- upvalues: ControlStateModule (upval), p1 (copy)
			if Hover == ControlStateModule.Hover then
				p1.props.mouseEnter()
				
				return
			end
			if Hover1 == ControlStateModule.Hover then
				p1.props.mouseLeave()
			end
		end
	})
end

return PlayerTileButton