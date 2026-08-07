-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:57 2026 Pacific Standard Time.

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

return function(p0) --[[ line: 43 | named "IconTabGroup" ]]
	-- upvalues: object (ref), t (ref), useCursorModule (ref), horizontalContainerModule (ref), constantsModule (ref), reactModule (ref), interactableListModule (ref), cryoModule (ref), iconTabModule (ref), selectionModeModule (ref)
	local var9 = object.assign({}, t, p0)
	local var10 = useCursorModule(UDim.new(0.5, 0), 0)
	
	return horizontalContainerModule({
		showRoundedBackground = false,
		size = UDim2.new(0, 0, 0, constantsModule.ICON_TAB_GROUP_HEIGHT),
		automaticSize = Enum.AutomaticSize.X,
		padding = var9.padding
	}, {
		MainTabList = reactModule.createElement(interactableListModule, {
			size = UDim2.new(0, 0, 1, 0),
			automaticSize = Enum.AutomaticSize.X,
			fillDirection = Enum.FillDirection.Horizontal,
			horizontalAlignment = Enum.HorizontalAlignment.Left,
			sortOrder = Enum.SortOrder.LayoutOrder,
			itemList = var9.items,
			itemSize = UDim2.fromScale(0, 0),
			renderItem = function(p1, p2, p3) --[[ line: 60 ]]
				-- upvalues: cryoModule (copy), var9 (ref), var10 (ref), reactModule (copy), iconTabModule (copy)
				return reactModule.createElement(iconTabModule, {
					item = p1,
					selected = p3,
					controlState = p2,
					padding = var9.itemPadding
				}), {
					LayoutOrder = cryoModule.List.find(var9.items, p1),
					AutomaticSize = Enum.AutomaticSize.XY,
					SelectionImageObject = var10
				}
			end,
			onSelectionChanged = function(p4) --[[ line: 75 ]]
				-- upvalues: var9 (ref)
				local var11 = var9.items[p4[1]]
				
				if var11 ~= nil and var11.onActivated ~= nil then
					var11.onActivated()
				end
			end,
			selection = var9.selection,
			selectionMode = selectionModeModule.Single,
			padding = var9.itemSpacing
		})
	})
end