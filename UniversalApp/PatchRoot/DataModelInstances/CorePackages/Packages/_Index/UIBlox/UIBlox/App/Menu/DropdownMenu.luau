local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local cryoModule = require(parent_1.Cryo)
local imagesModule = require(parent.App.ImageSet.Images)
local controlStateModule = require(parent.Core.Control.Enum.ControlState)
local dropdownMenuListModule = require(parent.App.Menu.DropdownMenuList)
local dropdownMenuCellModule = require(parent.App.Menu.DropdownMenuCell)
local validateColorInfoModule = require(parent.Core.Style.Validator.validateColorInfo)
local bindModule = require(parent.Utility.bind)
local useStyleModule = require(parent.Core.Style.useStyle)
local styleDefaultsModule = require(script.Parent.StyleDefaults)

local function _(p1)
	return if p1.key == nil then p1.text else p1.key
end

local dropdownMenu = roactModule.Component:extend("DropdownMenu")
dropdownMenu.validateProps = tModule.strictInterface({
	placeholder = tModule.string,
	onChange = tModule.callback,
	height = tModule.optional(tModule.UDim),
	screenSize = tModule.Vector2,
	showDropShadow = tModule.optional(tModule.boolean),
	fixedListHeight = tModule.optional(tModule.number),
	errorState = tModule.optional(tModule.boolean),
	isDisabled = tModule.optional(tModule.boolean),
	onMenuOpenChange = tModule.optional(tModule.callback),
	menuListBackground = tModule.optional(validateColorInfoModule),
	cellDatas = tModule.array(tModule.strictInterface({
		icon = tModule.optional(tModule.union(tModule.table, tModule.string)),
		text = tModule.string,
		key = tModule.optional(tModule.string),
		disabled = tModule.optional(tModule.boolean),
		keyCodeLabel = tModule.optional(tModule.union(tModule.enum(Enum.KeyCode), tModule.strictInterface({
			key = tModule.enum(Enum.KeyCode),
			axis = tModule.optional(tModule.string)
		}))),
		iconColorOverride = tModule.optional(tModule.Color3),
		textColorOverride = tModule.optional(tModule.Color3)
	})),
	menuStateColors = tModule.optional(tModule.strictInterface({
		buttonDefault = tModule.optional(validateColorInfoModule),
		contentDefault = tModule.optional(validateColorInfoModule),
		alert = tModule.optional(validateColorInfoModule)
	})),
	enableTokenOverride = tModule.optional(tModule.boolean),
	isForcedClosed = tModule.optional(tModule.boolean),
	selectionOrder = tModule.optional(tModule.number),
	dropdownMenuListPositionFixed = tModule.optional(tModule.boolean),
	defaultKey = tModule.optional(tModule.string)
})
dropdownMenu.defaultProps = {
	showDropShadow = false,
	fixedListHeight = nil,
	enableTokenOverride = false,
	dropdownMenuListPositionFixed = false,
	defaultKey = nil
}

function dropdownMenu.didUpdate(p1, _, p2)
	if p1.props.onMenuOpenChange and p1.state.menuOpen ~= p2.menuOpen then
		p1.props.onMenuOpenChange(p1.state.menuOpen)
	end
end

function dropdownMenu.init(p1)
	-- upvalues: cryoModule (ref), bindModule (ref)
	p1:setState({
		menuOpen = false,
		selectedKey = p1.props.defaultKey,
		absoluteSize = Vector2.new(0, 0)
	})
	
	function p3.openMenu()
		-- upvalues: p1 (ref)
		p1:setState({ menuOpen = true })
	end
	
	function p3.closeMenu()
		-- upvalues: p1 (ref)
		p1:setState({ menuOpen = false })
	end
	
	function p3.onSelect(p2)
		-- upvalues: p1 (ref)
		p1:setState({ menuOpen = false, selectedKey = p2 })
		p1.props.onChange(p2)
	end
	
	function p3.mapCellData(p2)
		-- upvalues: cryoModule (copy), bindModule (copy), p1 (ref)
		local var1 = if p2.key ~= nil then p2.text else p2.key
		local var2 = cryoModule.Dictionary.join(p2, { key = cryoModule.None })
		var2.onActivated = bindModule(p1.onSelect, var1)
		var2.selected = p1.state.selectedKey == var1
		
		return var2
	end
	
	function p3.onResize(p2)
		-- upvalues: p1 (ref)
		p1:setState({ absoluteSize = p2.AbsoluteSize })
	end
end

function dropdownMenu.getDerivedStateFromProps(p1, p2)
	-- upvalues: roactModule (ref)
	local var1 = false
	
	for i, v in p1.cellDatas do
		if (if v.key ~= nil then v.text else v.key) == p2.selectedKey then
			var1 = true
			break
		end
	end
	return if var1 then nil else { selectedKey = roactModule.None }
end

function dropdownMenu.render(p3)
	-- upvalues: cryoModule (ref), controlStateModule (ref), roactModule (ref), dropdownMenuCellModule (ref), imagesModule (ref), dropdownMenuListModule (ref)
	local t, t_1
	local var2 = cryoModule.List.map(p3.props.cellDatas, p3.mapCellData)
	local selectionOrder = p3.props.selectionOrder
	local var3 = cryoModule.List.findWhere(var2, function(p4)
		return p4.selected
	end)
	local var4 = if var3 ~= nil then p3.props.placeholder else var2[var3].text
	local var5 = p3.state.absoluteSize.X > 640
	local _ = nil
	local _ = nil
	
	if p3.props.enableTokenOverride then
		local buttonDefault = p3.props.menuStateColors.buttonDefault
		local contentDefault = p3.props.menuStateColors.contentDefault
		
		if p3.props.errorState then
			buttonDefault = p3.props.menuStateColors.alert
		end
		t = { [controlStateModule.Default] = buttonDefault }
		t_1 = { [controlStateModule.Default] = contentDefault }
	else
		local var6 = "SecondaryDefault"
		local var7 = if p3.state.menuOpen then var6 else "SecondaryOnHover"
		
		if p3.props.errorState then
			var6 = "Alert"
			var7 = "Alert"
		end
		t = {
			[controlStateModule.Default] = var6,
			[controlStateModule.Hover] = var7
		}
		t_1 = { [controlStateModule.Default] = "TextEmphasis" }
	end
	if p3.props.isForcedClosed and p3.state.menuOpen then
		p3:setState({ menuOpen = false })
	end
	return roactModule.createElement("Frame", {
		Size = UDim2.new(UDim.new(1, 0), p3.props.height),
		BackgroundTransparency = 1,
		[roactModule.Change.AbsoluteSize] = p3.onResize,
		[roactModule.Ref] = p3.props[roactModule.Ref]
	}, {
		InnerFrame = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			SpawnButton = roactModule.createElement(dropdownMenuCellModule, {
				isLoading = false,
				userInteractionEnabled = true,
				Size = UDim2.fromScale(1, 1),
				buttonImage = imagesModule["component_assets/circle_17_stroke_1"],
				buttonStateColorMap = t,
				contentStateColorMap = t_1,
				icon = if p3.state.menuOpen then imagesModule["truncate_arrows/actions_truncationCollapse"] else imagesModule["truncate_arrows/actions_truncationExpand"],
				text = var4,
				isDisabled = p3.props.isDisabled,
				isActivated = p3.state.menuOpen,
				hasContent = var3 ~= nil,
				onActivated = function()
					-- upvalues: p3 (ref)
					if p3.state.menuOpen then
						p3.closeMenu()
						
						return
					end
					p3.openMenu()
				end,
				enableTokenOverride = p3.props.enableTokenOverride,
				SelectionOrder = selectionOrder
			}),
			DropdownMenuList = roactModule.createElement(dropdownMenuListModule, {
				zIndex = 2,
				closeBackgroundVisible = false,
				buttonProps = var2,
				open = p3.state.menuOpen,
				openPositionY = UDim.new(0, 12),
				buttonSize = UDim2.fromScale(1, 1),
				menuListBackground = p3.props.menuListBackground,
				screenSize = p3.props.screenSize,
				showDropShadow = p3.props.showDropShadow,
				fixedListHeight = p3.props.fixedListHeight,
				onDismiss = p3.closeMenu,
				enableTokenOverride = p3.props.enableTokenOverride,
				selectionOrder = if selectionOrder then selectionOrder + 1 else nil,
				menuPositionFixed = p3.props.dropdownMenuListPositionFixed
			}),
			UISizeConstraint = var5 and roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(300, 1e999) }) or nil
		}) or nil
	})
end

return roactModule.forwardRef(function(p3, p4)
	-- upvalues: useStyleModule (ref), styleDefaultsModule (ref), cryoModule (ref), roactModule (ref), dropdownMenu (ref)
	local var2
	local _ = nil
	
	if p3.enableTokenOverride then
		local dropdownMenuDefaultTokens = styleDefaultsModule.getDropdownMenuDefaultTokens(useStyleModule())
		var2 = cryoModule.Dictionary.join(p3, {
			height = p3.height or dropdownMenuDefaultTokens.height,
			menuStateColors = cryoModule.Dictionary.join(dropdownMenuDefaultTokens.menuStateColors, p3.menuStateColors or {})
		})
	else
		var2 = p3
	end
	return roactModule.createElement(dropdownMenu, cryoModule.Dictionary.join(var2, { [roactModule.Ref] = p4 }))
end)