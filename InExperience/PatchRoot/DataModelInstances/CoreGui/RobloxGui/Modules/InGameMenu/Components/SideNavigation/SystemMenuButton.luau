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

function systemMenuButton.tryCaptureFocus(p0, p1)
	-- upvalues: guiService (ref)
	if p0.props.canCaptureFocus and not p1.canCaptureFocus or p0.props.canCaptureFocus and p0.props.on ~= p1.on and p0.state.isIconFocused then
		guiService.SelectedCoreObject = p0.iconRef:getValue()
	end
end

function systemMenuButton.init(p2)
	-- upvalues: roact (ref)
	p2.iconRef = roact.createRef()
	p2:setState({ isIconFocused = false })
	
	function p2.onIconSelectionGained()
		-- upvalues: p2 (ref)
		p2:setState({ isIconFocused = true })
	end
	
	function p2.onIconSelectionLost()
		-- upvalues: p2 (ref)
		p2:setState({ isIconFocused = false })
	end
end

function systemMenuButton.didMount(p3)
	p3:tryCaptureFocus({ canCaptureFocus = false })
end

function systemMenuButton.didUpdate(p4, p5)
	p4:tryCaptureFocus(p5)
end

function systemMenuButton.render(p6)
	-- upvalues: roact (ref), closeMenuButtonModule (ref), gameIconButtonModule (ref)
	return if p6.props.on then roact.createElement(closeMenuButtonModule, {
		onActivated = p6.props.onClose,
		layoutOrder = p6.props.layoutOrder,
		AnchorPoint = p6.props.anchorPoint,
		Position = p6.props.position,
		onSelectionGained = p6.onIconSelectionGained,
		onSelectionLost = p6.onIconSelectionLost,
		[roact.Ref] = p6.iconRef
	}) else roact.createElement(gameIconButtonModule, {
		onActivated = p6.props.onActivated,
		layoutOrder = p6.props.layoutOrder,
		anchorPoint = p6.props.anchorPoint,
		position = p6.props.position,
		onSelectionGained = p6.onIconSelectionGained,
		onSelectionLost = p6.onIconSelectionLost,
		[roact.Ref] = p6.iconRef
	})
end

return systemMenuButton