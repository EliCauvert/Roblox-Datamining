local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local CryoModule = require(Parent1.Cryo)
local ReactModule = require(Parent1.React)
local Object = require(Parent1.LuauPolyfill).Object
local InteractableListModule = require(Parent.Core.Control.InteractableList)
local SelectionModeModule = require(Parent.Core.Control.Enum.SelectionMode)
local UseCursorModule = require(Parent.App.SelectionCursor.useCursor)
local IconTabModule = require(script.Parent.IconTab)
local HorizontalContainerModule = require(script.Parent.HorizontalContainer)
local _ = require(script.Parent.Types)
local ConstantsModule = require(script.Parent.Constants)
local config = {
	selection = { 1 },
	items = {},
	padding = {
		left = ConstantsModule.ICON_TAB_PADDING,
		right = ConstantsModule.ICON_TAB_PADDING
	},
	itemSpacing = UDim.new(0, ConstantsModule.ICON_TAB_ITEM_SPACING),
	itemPadding = {
		left = ConstantsModule.ICON_TAB_ITEM_PADDING_LEFT,
		right = ConstantsModule.ICON_TAB_ITEM_PADDING_RIGHT
	}
}

return function(p1)
	-- upvalues: Object (copy), config (copy), UseCursorModule (copy), HorizontalContainerModule (copy), ConstantsModule (copy), ReactModule (copy), InteractableListModule (copy), CryoModule (copy), IconTabModule (copy), SelectionModeModule (copy)
	local AssignResult = Object.assign({}, config, p1)
	local UseCursorModuleResult = UseCursorModule(UDim.new(0.5, 0), 0)
	
	return HorizontalContainerModule({
		showRoundedBackground = false,
		size = UDim2.new(0, 0, 0, ConstantsModule.ICON_TAB_GROUP_HEIGHT),
		automaticSize = Enum.AutomaticSize.X,
		padding = AssignResult.padding
	}, {
		MainTabList = ReactModule.createElement(InteractableListModule, {
			size = UDim2.new(0, 0, 1, 0),
			automaticSize = Enum.AutomaticSize.X,
			fillDirection = Enum.FillDirection.Horizontal,
			horizontalAlignment = Enum.HorizontalAlignment.Left,
			sortOrder = Enum.SortOrder.LayoutOrder,
			itemList = AssignResult.items,
			itemSize = UDim2.fromScale(0, 0),
			renderItem = function(Item, ControlState, Selected)
				-- upvalues: CryoModule (upval), AssignResult (copy), UseCursorModuleResult (copy), ReactModule (upval), IconTabModule (upval)
				return ReactModule.createElement(IconTabModule, {
					item = Item,
					selected = Selected,
					controlState = ControlState,
					padding = AssignResult.itemPadding
				}), {
					LayoutOrder = CryoModule.List.find(AssignResult.items, Item),
					AutomaticSize = Enum.AutomaticSize.XY,
					SelectionImageObject = UseCursorModuleResult
				}
			end,
			onSelectionChanged = function(Entry)
				-- upvalues: AssignResult (copy)
				local Item = AssignResult.items[Entry[1]]
				
				if Item ~= nil and Item.onActivated ~= nil then
					Item.onActivated()
				end
			end,
			selection = AssignResult.selection,
			selectionMode = SelectionModeModule.Single,
			padding = AssignResult.itemSpacing
		})
	})
end