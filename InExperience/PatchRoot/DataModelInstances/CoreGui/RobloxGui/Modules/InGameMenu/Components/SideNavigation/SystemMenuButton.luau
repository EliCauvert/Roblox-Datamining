local GuiService = game:GetService("GuiService")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local T = InGameMenuDependenciesModule.t
local Roact = InGameMenuDependenciesModule.Roact
local CloseMenuButtonModule = require(script.Parent.CloseMenuButton)
local GameIconButtonModule = require(script.Parent.GameIconButton)
local SystemMenuButton = Roact.PureComponent:extend("SystemMenuButton")
SystemMenuButton.validateProps = T.strictInterface({
	on = T.optional(T.boolean),
	anchorPoint = T.optional(T.Vector2),
	position = T.optional(T.UDim2),
	layoutOrder = T.optional(T.integer),
	onActivated = T.callback,
	onClose = T.callback,
	canCaptureFocus = T.optional(T.boolean)
})
SystemMenuButton.defaultProps = { on = false, canCaptureFocus = false }

function SystemMenuButton.tryCaptureFocus(p1, DefaultProps) --[[ Line: 28 ]]
	-- upvalues: GuiService (copy)
	if p1.props.canCaptureFocus and not DefaultProps.canCaptureFocus or p1.props.canCaptureFocus and p1.props.on ~= DefaultProps.on and p1.state.isIconFocused then
		GuiService.SelectedCoreObject = p1.iconRef:getValue()
	end
end

function SystemMenuButton.init(p1) --[[ Line: 37 ]]
	-- upvalues: Roact (copy)
	p1.iconRef = Roact.createRef()
	p1:setState({ isIconFocused = false })
	
	function p1.onIconSelectionGained() --[[ Line: 44 ]]
		-- upvalues: p1 (copy)
		p1:setState({ isIconFocused = true })
	end
	
	function p1.onIconSelectionLost() --[[ Line: 50 ]]
		-- upvalues: p1 (copy)
		p1:setState({ isIconFocused = false })
	end
end

function SystemMenuButton.didMount(p1) --[[ Line: 57 ]]
	p1:tryCaptureFocus({ canCaptureFocus = false })
end

function SystemMenuButton.didUpdate(p1, p2) --[[ Line: 62 ]]
	p1:tryCaptureFocus(p2)
end

function SystemMenuButton.render(p1) --[[ Line: 66 ]]
	-- upvalues: Roact (copy), CloseMenuButtonModule (copy), GameIconButtonModule (copy)
	return if p1.props.on then Roact.createElement(CloseMenuButtonModule, {
		onActivated = p1.props.onClose,
		layoutOrder = p1.props.layoutOrder,
		AnchorPoint = p1.props.anchorPoint,
		Position = p1.props.position,
		onSelectionGained = p1.onIconSelectionGained,
		onSelectionLost = p1.onIconSelectionLost,
		[Roact.Ref] = p1.iconRef
	}) else Roact.createElement(GameIconButtonModule, {
		onActivated = p1.props.onActivated,
		layoutOrder = p1.props.layoutOrder,
		anchorPoint = p1.props.anchorPoint,
		position = p1.props.position,
		onSelectionGained = p1.onIconSelectionGained,
		onSelectionLost = p1.onIconSelectionLost,
		[Roact.Ref] = p1.iconRef
	})
end

return SystemMenuButton