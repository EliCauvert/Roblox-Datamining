local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local DropdownMenu = require(CorePackages.Packages.UIBlox).App.Menu.DropdownMenu
local DropdownSelector = RoactModule.PureComponent:extend("DropdownSelector")
DropdownSelector.defaultProps = {
	contentMaxWidth = 1e999,
	selectorHeight = 48,
	selectorSpacer = 24,
	paddingHorizontal = 0,
	paddingVertical = 0,
	errorText = "",
	renderErrorItem = function() end
}
DropdownSelector.validateProps = TModule.strictInterface({
	itemList = TModule.array(TModule.strictInterface({ key = TModule.string, value = TModule.any })),
	screenSize = TModule.Vector2,
	renderSelectedItem = TModule.callback,
	contentMaxWidth = TModule.optional(TModule.number),
	selectorHeight = TModule.optional(TModule.number),
	selectorSpacer = TModule.optional(TModule.number),
	paddingHorizontal = TModule.optional(TModule.number),
	paddingVertical = TModule.optional(TModule.number),
	isDisabled = TModule.optional(TModule.boolean),
	errorState = TModule.optional(TModule.boolean),
	errorText = TModule.optional(TModule.string),
	renderErrorItem = TModule.optional(TModule.callback)
})

function DropdownSelector.init(p1)
	function p1.onSelectionChange(SelectedKey)
		-- upvalues: p1 (copy)
		p1:setState({ selectedKey = SelectedKey })
	end
	
	p1:setState({ selectedKey = nil })
end

function DropdownSelector.getDerivedStateFromProps(p1, p2)
	local ItemList = p1.itemList
	local SelectedKey = p2.selectedKey
	
	for _, value in ipairs(ItemList) do
		if SelectedKey == value.key then
			return nil
		end
	end
	return { selectedKey = #ItemList > 0 and ItemList[1].key or nil }
end

function DropdownSelector.render(p3)
	-- upvalues: RoactModule (copy), DropdownMenu (copy)
	local ItemList = p3.props.itemList
	local ScreenSize = p3.props.screenSize
	local ContentMaxWidth = p3.props.contentMaxWidth
	local SelectorHeight = p3.props.selectorHeight
	local SelectorSpacer = p3.props.selectorSpacer
	local PaddingHorizontal: number = p3.props.paddingHorizontal
	local PaddingVertical = p3.props.paddingVertical
	local IsDisabled = p3.props.isDisabled
	local ErrorState = p3.props.errorState
	local ErrorText = p3.props.errorText
	local RenderErrorItemFunction = p3.props.renderErrorItem
	local RenderSelectedItemFunction = p3.props.renderSelectedItem
	local SelectedKey = p3.state.selectedKey
	local v1 = nil
	local CellDatas = {}
	
	for _, value in ipairs(ItemList) do
		table.insert(CellDatas, { text = value.key })
		
		if SelectedKey == value.key then
			v1 = value.value
		end
	end
	local ErrorState1 = ErrorState or #ItemList == 0
	local YOffset = SelectorHeight + SelectorSpacer + PaddingVertical
	
	return RoactModule.createFragment({
		SelectorFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0)
		}, {
			Selector = RoactModule.createElement(DropdownMenu, {
				placeholder = ErrorState1 and ErrorText or SelectedKey,
				onChange = p3.onSelectionChange,
				height = UDim.new(0, SelectorHeight),
				screenSize = ScreenSize,
				errorState = ErrorState,
				isDisabled = IsDisabled,
				cellDatas = CellDatas
			}),
			SelectorPadding = RoactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, PaddingVertical),
				PaddingLeft = UDim.new(0, PaddingHorizontal),
				PaddingRight = UDim.new(0, PaddingHorizontal)
			}),
			SelectorMaxWidth = RoactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(ContentMaxWidth + 2 * PaddingHorizontal, 1e999)
			})
		}),
		SelectionFrame = RoactModule.createElement("Frame", {
			ZIndex = -1,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, YOffset),
			Size = UDim2.new(1, 0, 1, -YOffset)
		}, ErrorState1 and { Error = RenderErrorItemFunction() } or { [SelectedKey] = RenderSelectedItemFunction(v1) })
	})
end

return DropdownSelector