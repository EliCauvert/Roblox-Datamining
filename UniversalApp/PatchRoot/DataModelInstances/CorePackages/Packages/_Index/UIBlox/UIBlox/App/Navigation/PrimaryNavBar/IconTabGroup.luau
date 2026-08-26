local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local cryoModule = require(parent_1.Cryo)
local reactModule = require(parent_1.React)
local object = require(parent_1.LuauPolyfill).Object
local interactableListModule = require(parent.Core.Control.InteractableList)
local selectionModeModule = require(parent.Core.Control.Enum.SelectionMode)
local useCursorModule = require(parent.App.SelectionCursor.useCursor)
local iconTabModule = require(script.Parent.IconTab)
local horizontalContainerModule = require(script.Parent.HorizontalContainer)
local _ = require(script.Parent.Types)
local constantsModule = require(script.Parent.Constants)
local t = {
	selection = { 1 },
	items = {},
	padding = {
		left = constantsModule.ICON_TAB_PADDING,
		right = constantsModule.ICON_TAB_PADDING
	},
	itemSpacing = UDim.new(0, constantsModule.ICON_TAB_ITEM_SPACING),
	itemPadding = {
		left = constantsModule.ICON_TAB_ITEM_PADDING_LEFT,
		right = constantsModule.ICON_TAB_ITEM_PADDING_RIGHT
	}
}

return function(p1)
	-- upvalues: object (ref), t (ref), useCursorModule (ref), horizontalContainerModule (ref), constantsModule (ref), reactModule (ref), interactableListModule (ref), cryoModule (ref), iconTabModule (ref), selectionModeModule (ref)
	local var1 = object.assign({}, t, p1)
	local var2 = useCursorModule(UDim.new(0.5, 0), 0)
	
	return horizontalContainerModule({
		showRoundedBackground = false,
		size = UDim2.new(0, 0, 0, constantsModule.ICON_TAB_GROUP_HEIGHT),
		automaticSize = Enum.AutomaticSize.X,
		padding = var1.padding
	}, {
		MainTabList = reactModule.createElement(interactableListModule, {
			size = UDim2.new(0, 0, 1, 0),
			automaticSize = Enum.AutomaticSize.X,
			fillDirection = Enum.FillDirection.Horizontal,
			horizontalAlignment = Enum.HorizontalAlignment.Left,
			sortOrder = Enum.SortOrder.LayoutOrder,
			itemList = var1.items,
			itemSize = UDim2.fromScale(0, 0),
			renderItem = function(p2, p3, p4)
				-- upvalues: cryoModule (copy), var1 (ref), var2 (ref), reactModule (copy), iconTabModule (copy)
				return reactModule.createElement(iconTabModule, {
					item = p2,
					selected = p4,
					controlState = p3,
					padding = var1.itemPadding
				}), {
					LayoutOrder = cryoModule.List.find(var1.items, p2),
					AutomaticSize = Enum.AutomaticSize.XY,
					SelectionImageObject = var2
				}
			end,
			onSelectionChanged = function(p2)
				-- upvalues: var1 (ref)
				local var3 = var1.items[p2[1]]
				
				if var3 ~= nil and var3.onActivated ~= nil then
					var3.onActivated()
				end
			end,
			selection = var1.selection,
			selectionMode = selectionModeModule.Single,
			padding = var1.itemSpacing
		})
	})
end