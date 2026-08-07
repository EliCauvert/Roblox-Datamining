-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:56 2026 Pacific Standard Time.

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

local function _(p0) --[[ line: 27 | named "getCellDataKey" ]]
	return if p0.key == nil then p0.text else p0.key
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

function dropdownMenu.didUpdate(p1, _, p2) --[[ line: 129 ]]
	if p1.props.onMenuOpenChange and p1.state.menuOpen ~= p2.menuOpen then
		p1.props.onMenuOpenChange(p1.state.menuOpen)
	end
end

function dropdownMenu.init(p3) --[[ line: 135 ]]
	-- upvalues: cryoModule (ref), bindModule (ref)
	p3:setState({
		menuOpen = false,
		selectedKey = p3.props.defaultKey,
		absoluteSize = Vector2.new(0, 0)
	})
	
	function p3.openMenu() --[[ line: 142 ]]
		-- upvalues: p3 (ref)
		p3:setState({ menuOpen = true })
	end
	
	function p3.closeMenu() --[[ line: 148 ]]
		-- upvalues: p3 (ref)
		p3:setState({ menuOpen = false })
	end
	
	function p3.onSelect(p4) --[[ line: 154 ]]
		-- upvalues: p3 (ref)
		p3:setState({ menuOpen = false, selectedKey = p4 })
		p3.props.onChange(p4)
	end
	
	function p3.mapCellData(p5) --[[ line: 162 ]]
		-- upvalues: cryoModule (copy), bindModule (copy), p3 (ref)
		local var12 = if p5.key ~= nil then p5.text else p5.key
		local var13 = cryoModule.Dictionary.join(p5, { key = cryoModule.None })
		var13.onActivated = bindModule(p3.onSelect, var12)
		var13.selected = p3.state.selectedKey == var12
		
		return var13
	end
	
	function p3.onResize(p6) --[[ line: 172 ]]
		-- upvalues: p3 (ref)
		p3:setState({ absoluteSize = p6.AbsoluteSize })
	end
end

function dropdownMenu.getDerivedStateFromProps(p7, p8) --[[ line: 179 ]]
	-- upvalues: roactModule (ref)
	local var14 = false
	
	for i, v in p7.cellDatas do
		if (if v.key ~= nil then v.text else v.key) == p8.selectedKey then
			var14 = true
			break
		end
	end
	return if var14 then nil else { selectedKey = roactModule.None }
end

function dropdownMenu.render(p9) --[[ line: 197 ]]
	-- upvalues: cryoModule (ref), controlStateModule (ref), roactModule (ref), dropdownMenuCellModule (ref), imagesModule (ref), dropdownMenuListModule (ref)
	local t, t_1
	local var15 = cryoModule.List.map(p9.props.cellDatas, p9.mapCellData)
	local selectionOrder = p9.props.selectionOrder
	local var16 = cryoModule.List.findWhere(var15, function(p10) --[[ line: 203 ]]
		return p10.selected
	end)
	local var17 = if var16 ~= nil then p9.props.placeholder else var15[var16].text
	local var18 = p9.state.absoluteSize.X > 640
	local _ = nil
	local _ = nil
	
	if p9.props.enableTokenOverride then
		local buttonDefault = p9.props.menuStateColors.buttonDefault
		local contentDefault = p9.props.menuStateColors.contentDefault
		
		if p9.props.errorState then
			buttonDefault = p9.props.menuStateColors.alert
		end
		t = { [controlStateModule.Default] = buttonDefault }
		t_1 = { [controlStateModule.Default] = contentDefault }
	else
		local var19 = "SecondaryDefault"
		local var20 = if p9.state.menuOpen then var19 else "SecondaryOnHover"
		
		if p9.props.errorState then
			var19 = "Alert"
			var20 = "Alert"
		end
		t = {
			[controlStateModule.Default] = var19,
			[controlStateModule.Hover] = var20
		}
		t_1 = { [controlStateModule.Default] = "TextEmphasis" }
	end
	if p9.props.isForcedClosed and p9.state.menuOpen then
		p9:setState({ menuOpen = false })
	end
	return roactModule.createElement("Frame", {
		Size = UDim2.new(UDim.new(1, 0), p9.props.height),
		BackgroundTransparency = 1,
		[roactModule.Change.AbsoluteSize] = p9.onResize,
		[roactModule.Ref] = p9.props[roactModule.Ref]
	}, {
		InnerFrame = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			SpawnButton = roactModule.createElement(dropdownMenuCellModule, {
				isLoading = false,
				userInteractionEnabled = true,
				Size = UDim2.fromScale(1, 1),
				buttonImage = imagesModule["component_assets/circle_17_stroke_1"],
				buttonStateColorMap = t,
				contentStateColorMap = t_1,
				icon = if p9.state.menuOpen then imagesModule["truncate_arrows/actions_truncationCollapse"] else imagesModule["truncate_arrows/actions_truncationExpand"],
				text = var17,
				isDisabled = p9.props.isDisabled,
				isActivated = p9.state.menuOpen,
				hasContent = var16 ~= nil,
				onActivated = function() --[[ line: 276 ]]
					-- upvalues: p9 (ref)
					if p9.state.menuOpen then
						p9.closeMenu()
						
						return
					end
					p9.openMenu()
				end,
				enableTokenOverride = p9.props.enableTokenOverride,
				SelectionOrder = selectionOrder
			}),
			DropdownMenuList = roactModule.createElement(dropdownMenuListModule, {
				zIndex = 2,
				closeBackgroundVisible = false,
				buttonProps = var15,
				open = p9.state.menuOpen,
				openPositionY = UDim.new(0, 12),
				buttonSize = UDim2.fromScale(1, 1),
				menuListBackground = p9.props.menuListBackground,
				screenSize = p9.props.screenSize,
				showDropShadow = p9.props.showDropShadow,
				fixedListHeight = p9.props.fixedListHeight,
				onDismiss = p9.closeMenu,
				enableTokenOverride = p9.props.enableTokenOverride,
				selectionOrder = if selectionOrder then selectionOrder + 1 else nil,
				menuPositionFixed = p9.props.dropdownMenuListPositionFixed
			}),
			UISizeConstraint = var18 and roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(300, 1e999) }) or nil
		}) or nil
	})
end

return roactModule.forwardRef(function(p11, p12) --[[ line: 311 ]]
	-- upvalues: useStyleModule (ref), styleDefaultsModule (ref), cryoModule (ref), roactModule (ref), dropdownMenu (ref)
	local var24
	local _ = nil
	
	if p11.enableTokenOverride then
		local dropdownMenuDefaultTokens = styleDefaultsModule.getDropdownMenuDefaultTokens(useStyleModule())
		var24 = cryoModule.Dictionary.join(p11, {
			height = p11.height or dropdownMenuDefaultTokens.height,
			menuStateColors = cryoModule.Dictionary.join(dropdownMenuDefaultTokens.menuStateColors, p11.menuStateColors or {})
		})
	else
		var24 = p11
	end
	return roactModule.createElement(dropdownMenu, cryoModule.Dictionary.join(var24, { [roactModule.Ref] = p12 }))
end)