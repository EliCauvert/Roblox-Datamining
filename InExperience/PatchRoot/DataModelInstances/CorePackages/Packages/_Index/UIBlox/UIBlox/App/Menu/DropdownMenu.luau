local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local CryoModule = require(Parent1.Cryo)
local ImagesModule = require(Parent.App.ImageSet.Images)
local ControlStateModule = require(Parent.Core.Control.Enum.ControlState)
local DropdownMenuListModule = require(Parent.App.Menu.DropdownMenuList)
local DropdownMenuCellModule = require(Parent.App.Menu.DropdownMenuCell)
local ValidateColorInfoModule = require(Parent.Core.Style.Validator.validateColorInfo)
local BindModule = require(Parent.Utility.bind)
local UseStyleModule = require(Parent.Core.Style.useStyle)
local StyleDefaultsModule = require(script.Parent.StyleDefaults)

local function _(p1) --[[ Line: 27 | Named "getCellDataKey" ]]
	return if p1.key == nil then p1.text else p1.key
end

local DropdownMenu = RoactModule.Component:extend("DropdownMenu")
DropdownMenu.validateProps = TModule.strictInterface({
	placeholder = TModule.string,
	onChange = TModule.callback,
	height = TModule.optional(TModule.UDim),
	screenSize = TModule.Vector2,
	showDropShadow = TModule.optional(TModule.boolean),
	fixedListHeight = TModule.optional(TModule.number),
	errorState = TModule.optional(TModule.boolean),
	isDisabled = TModule.optional(TModule.boolean),
	onMenuOpenChange = TModule.optional(TModule.callback),
	menuListBackground = TModule.optional(ValidateColorInfoModule),
	cellDatas = TModule.array(TModule.strictInterface({
		icon = TModule.optional(TModule.union(TModule.table, TModule.string)),
		text = TModule.string,
		key = TModule.optional(TModule.string),
		disabled = TModule.optional(TModule.boolean),
		keyCodeLabel = TModule.optional(TModule.union(TModule.enum(Enum.KeyCode), TModule.strictInterface({
			key = TModule.enum(Enum.KeyCode),
			axis = TModule.optional(TModule.string)
		}))),
		iconColorOverride = TModule.optional(TModule.Color3),
		textColorOverride = TModule.optional(TModule.Color3)
	})),
	menuStateColors = TModule.optional(TModule.strictInterface({
		buttonDefault = TModule.optional(ValidateColorInfoModule),
		contentDefault = TModule.optional(ValidateColorInfoModule),
		alert = TModule.optional(ValidateColorInfoModule)
	})),
	enableTokenOverride = TModule.optional(TModule.boolean),
	isForcedClosed = TModule.optional(TModule.boolean),
	selectionOrder = TModule.optional(TModule.number),
	dropdownMenuListPositionFixed = TModule.optional(TModule.boolean),
	defaultKey = TModule.optional(TModule.string)
})
DropdownMenu.defaultProps = {
	showDropShadow = false,
	fixedListHeight = nil,
	enableTokenOverride = false,
	dropdownMenuListPositionFixed = false,
	defaultKey = nil
}

function DropdownMenu.didUpdate(p1, _, p2) --[[ Line: 129 ]]
	if p1.props.onMenuOpenChange and p1.state.menuOpen ~= p2.menuOpen then
		p1.props.onMenuOpenChange(p1.state.menuOpen)
	end
end

function DropdownMenu.init(p1) --[[ Line: 135 ]]
	-- upvalues: CryoModule (copy), BindModule (copy)
	p1:setState({
		menuOpen = false,
		selectedKey = p1.props.defaultKey,
		absoluteSize = Vector2.new(0, 0)
	})
	
	function p1.openMenu() --[[ Line: 142 ]]
		-- upvalues: p1 (copy)
		p1:setState({ menuOpen = true })
	end
	
	function p1.closeMenu() --[[ Line: 148 ]]
		-- upvalues: p1 (copy)
		p1:setState({ menuOpen = false })
	end
	
	function p1.onSelect(SelectedKey) --[[ Line: 154 ]]
		-- upvalues: p1 (copy)
		p1:setState({ menuOpen = false, selectedKey = SelectedKey })
		p1.props.onChange(SelectedKey)
	end
	
	function p1.mapCellData(p2) --[[ Line: 162 ]]
		-- upvalues: CryoModule (upval), BindModule (upval), p1 (copy)
		local Text = if p2.key == nil then p2.text else p2.key
		local JoinResult = CryoModule.Dictionary.join(p2, { key = CryoModule.None })
		JoinResult.onActivated = BindModule(p1.onSelect, Text)
		JoinResult.selected = p1.state.selectedKey == Text
		
		return JoinResult
	end
	
	function p1.onResize(Frame) --[[ Line: 172 ]]
		-- upvalues: p1 (copy)
		p1:setState({ absoluteSize = Frame.AbsoluteSize })
	end
end

function DropdownMenu.getDerivedStateFromProps(p1, p2) --[[ Line: 179 ]]
	-- upvalues: RoactModule (copy)
	local Flag = false
	
	for _, cellData in p1.cellDatas do
		if (if cellData.key == nil then cellData.text else cellData.key) == p2.selectedKey then
			Flag = true
			break
		end
	end
	return if Flag then nil else { selectedKey = RoactModule.None }
end

function DropdownMenu.render(p3) --[[ Line: 197 ]]
	-- upvalues: CryoModule (copy), ControlStateModule (copy), RoactModule (copy), DropdownMenuCellModule (copy), ImagesModule (copy), DropdownMenuListModule (copy)
	local MapResult = CryoModule.List.map(p3.props.cellDatas, p3.mapCellData)
	local SelectionOrder: number = p3.props.selectionOrder
	local Where = CryoModule.List.findWhere(MapResult, function(p4) --[[ Line: 203 ]]
		return p4.selected
	end)
	local Placeholder = if Where == nil then p3.props.placeholder else MapResult[Where].text
	local IsXAbove = p3.state.absoluteSize.X > 640
	local ButtonStateColorMap = nil
	local ContentStateColorMap = nil
	
	if p3.props.enableTokenOverride then
		local ButtonDefault = p3.props.menuStateColors.buttonDefault
		local ContentDefault = p3.props.menuStateColors.contentDefault
		
		if p3.props.errorState then
			ButtonDefault = p3.props.menuStateColors.alert
		end
		ButtonStateColorMap = { [ControlStateModule.Default] = ButtonDefault }
		ContentStateColorMap = { [ControlStateModule.Default] = ContentDefault }
	else
		local v1 = "SecondaryDefault"
		local SecondaryOnHover: string = if p3.state.menuOpen then v1 else "SecondaryOnHover"
		
		if p3.props.errorState then
			v1 = "Alert"
			SecondaryOnHover = "Alert"
		end
		ButtonStateColorMap = {
			[ControlStateModule.Default] = v1,
			[ControlStateModule.Hover] = SecondaryOnHover
		}
		ContentStateColorMap = { [ControlStateModule.Default] = "TextEmphasis" }
	end
	if p3.props.isForcedClosed and p3.state.menuOpen then
		p3:setState({ menuOpen = false })
	end
	return RoactModule.createElement("Frame", {
		Size = UDim2.new(UDim.new(1, 0), p3.props.height),
		BackgroundTransparency = 1,
		[RoactModule.Change.AbsoluteSize] = p3.onResize,
		[RoactModule.Ref] = p3.props[RoactModule.Ref]
	}, {
		InnerFrame = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			SpawnButton = RoactModule.createElement(DropdownMenuCellModule, {
				isLoading = false,
				userInteractionEnabled = true,
				Size = UDim2.fromScale(1, 1),
				buttonImage = ImagesModule["component_assets/circle_17_stroke_1"],
				buttonStateColorMap = ButtonStateColorMap,
				contentStateColorMap = ContentStateColorMap,
				icon = p3.state.menuOpen and ImagesModule["truncate_arrows/actions_truncationCollapse"] or ImagesModule["truncate_arrows/actions_truncationExpand"],
				text = Placeholder,
				isDisabled = p3.props.isDisabled,
				isActivated = p3.state.menuOpen,
				hasContent = Where ~= nil,
				onActivated = function() --[[ Line: 276 ]]
					-- upvalues: p3 (copy)
					if p3.state.menuOpen then
						p3.closeMenu()
						
						return
					else
						p3.openMenu()
					end
				end,
				enableTokenOverride = p3.props.enableTokenOverride,
				SelectionOrder = SelectionOrder
			}),
			DropdownMenuList = RoactModule.createElement(DropdownMenuListModule, {
				zIndex = 2,
				closeBackgroundVisible = false,
				buttonProps = MapResult,
				open = p3.state.menuOpen,
				openPositionY = UDim.new(0, 12),
				buttonSize = UDim2.fromScale(1, 1),
				menuListBackground = p3.props.menuListBackground,
				screenSize = p3.props.screenSize,
				showDropShadow = p3.props.showDropShadow,
				fixedListHeight = p3.props.fixedListHeight,
				onDismiss = p3.closeMenu,
				enableTokenOverride = p3.props.enableTokenOverride,
				selectionOrder = if SelectionOrder then SelectionOrder + 1 else nil,
				menuPositionFixed = p3.props.dropdownMenuListPositionFixed
			}),
			UISizeConstraint = IsXAbove and RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(300, 1e999) }) or nil
		}) or nil
	})
end

return RoactModule.forwardRef(function(p3, p4) --[[ Line: 311 ]]
	-- upvalues: UseStyleModule (copy), StyleDefaultsModule (copy), CryoModule (copy), RoactModule (copy), DropdownMenu (copy)
	local JoinResult = nil
	if p3.enableTokenOverride then
		local DropdownMenuDefaultTokens = StyleDefaultsModule.getDropdownMenuDefaultTokens((UseStyleModule()))
		JoinResult = CryoModule.Dictionary.join(p3, {
			height = p3.height or DropdownMenuDefaultTokens.height,
			menuStateColors = CryoModule.Dictionary.join(DropdownMenuDefaultTokens.menuStateColors, p3.menuStateColors or {})
		})
	else
		JoinResult = p3
	end
	return RoactModule.createElement(DropdownMenu, CryoModule.Dictionary.join(JoinResult, { [RoactModule.Ref] = p4 }))
end)