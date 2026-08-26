local guiService = game:GetService("GuiService")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local t = inGameMenuDependenciesModule.t
local roact = inGameMenuDependenciesModule.Roact
local closeMenuButtonModule = require(script.Parent.CloseMenuButton)
local gameIconButtonModule = require(script.Parent.GameIconButton)
local systemMenuButton = roact.PureComponent:extend("SystemMenuButton")
systemMenuButton.validateProps = t.strictInterface({
	on = t.optional(t.boolean),
	anchorPoint = t.optional(t.Vector2),
	position = t.optional(t.UDim2),
	layoutOrder = t.optional(t.integer),
	onActivated = t.callback,
	onClose = t.callback,
	canCaptureFocus = t.optional(t.boolean)
})
systemMenuButton.defaultProps = { on = false, canCaptureFocus = false }

function systemMenuButton.tryCaptureFocus(p1, p2)
	-- upvalues: guiService (ref)
	if p1.props.canCaptureFocus and not p2.canCaptureFocus or p1.props.canCaptureFocus and p1.props.on ~= p2.on and p1.state.isIconFocused then
		guiService.SelectedCoreObject = p1.iconRef:getValue()
	end
end

function systemMenuButton.init(p1)
	-- upvalues: roact (ref)
	p1.iconRef = roact.createRef()
	p1:setState({ isIconFocused = false })
	
	function p2.onIconSelectionGained()
		-- upvalues: p1 (ref)
		p1:setState({ isIconFocused = true })
	end
	
	function p2.onIconSelectionLost()
		-- upvalues: p1 (ref)
		p1:setState({ isIconFocused = false })
	end
end

function systemMenuButton.didMount(p1)
	p1:tryCaptureFocus({ canCaptureFocus = false })
end

function systemMenuButton.didUpdate(p1, p2)
	p1:tryCaptureFocus(p2)
end

function systemMenuButton.render(p1)
	-- upvalues: roact (ref), closeMenuButtonModule (ref), gameIconButtonModule (ref)
	return if p1.props.on then roact.createElement(closeMenuButtonModule, {
		onActivated = p1.props.onClose,
		layoutOrder = p1.props.layoutOrder,
		AnchorPoint = p1.props.anchorPoint,
		Position = p1.props.position,
		onSelectionGained = p1.onIconSelectionGained,
		onSelectionLost = p1.onIconSelectionLost,
		[roact.Ref] = p1.iconRef
	}) else roact.createElement(gameIconButtonModule, {
		onActivated = p1.props.onActivated,
		layoutOrder = p1.props.layoutOrder,
		anchorPoint = p1.props.anchorPoint,
		position = p1.props.position,
		onSelectionGained = p1.onIconSelectionGained,
		onSelectionLost = p1.onIconSelectionLost,
		[roact.Ref] = p1.iconRef
	})
end

return systemMenuButton