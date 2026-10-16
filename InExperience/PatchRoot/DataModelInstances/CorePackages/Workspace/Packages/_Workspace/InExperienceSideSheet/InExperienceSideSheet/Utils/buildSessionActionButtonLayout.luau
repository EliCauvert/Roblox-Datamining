local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local _ = require(InExperienceSideSheet.Common.Types)
local ShortcutButtonModule = require(InExperienceSideSheet.Components.ShortcutButton)
local ButtonWidth = require(InExperienceSideSheet.Common.Enums).ButtonWidth

local function _(p1, LayoutOrder, Width) --[[ Line: 22 | Named "createShortcutButton" ]]
	-- upvalues: ReactModule (copy), ShortcutButtonModule (copy)
	return ReactModule.createElement(ShortcutButtonModule, {
		label = p1.label,
		getShortcutIcon = p1.getShortcutIcon,
		getOnActivated = p1.getOnActivated,
		getIsEnabled = p1.getIsEnabled,
		width = Width,
		layoutOrder = LayoutOrder
	})
end

local function buildHalfWidthRowLayoutItem(Entry, LayoutOrder) --[[ Line: 37 ]]
	-- upvalues: ButtonWidth (copy), ReactModule (copy), ShortcutButtonModule (copy), View (copy)
	if #Entry == 1 then
		local Entry1 = Entry[1]
		
		return {
			key = Entry1.name,
			node = ReactModule.createElement(ShortcutButtonModule, {
				label = Entry1.label,
				getShortcutIcon = Entry1.getShortcutIcon,
				getOnActivated = Entry1.getOnActivated,
				getIsEnabled = Entry1.getIsEnabled,
				width = ButtonWidth.Full,
				layoutOrder = LayoutOrder
			})
		}
	end
	local Elements = {}
	
	for LayoutOrder1, value in Entry do
		Elements[value.name] = ReactModule.createElement(ShortcutButtonModule, {
			label = value.label,
			getShortcutIcon = value.getShortcutIcon,
			getOnActivated = value.getOnActivated,
			getIsEnabled = value.getIsEnabled,
			width = ButtonWidth.Half,
			layoutOrder = LayoutOrder1
		})
	end
	return {
		key = "HalfWidthRow_" .. LayoutOrder,
		node = ReactModule.createElement(View, {
			tag = "row gap-small size-full-0 auto-y",
			LayoutOrder = LayoutOrder
		}, Elements)
	}
end

return function(List) --[[ Line: 63 | Named "buildSessionActionButtonLayout" ]]
	-- upvalues: buildHalfWidthRowLayoutItem (copy), ButtonWidth (copy), ReactModule (copy), ShortcutButtonModule (copy)
	local Nodes = {}
	local LayoutOrder = 0
	local Tbl = {}
	
	local function _() --[[ Line: 68 | Named "flushHalfRow" ]]
		-- upvalues: Tbl (copy), LayoutOrder (ref), buildHalfWidthRowLayoutItem (upval), Nodes (copy)
		if #Tbl ~= 0 then
			LayoutOrder += 1
			local HalfWidthRowLayoutItem = buildHalfWidthRowLayoutItem(Tbl, LayoutOrder)
			Nodes[HalfWidthRowLayoutItem.key] = HalfWidthRowLayoutItem.node
			table.clear(Tbl)
			
			return
		end
	end
	
	for _, value in List do
		if (value.width or ButtonWidth.Full) == ButtonWidth.Half then
			table.insert(Tbl, value)
			
			if #Tbl == 2 and #Tbl ~= 0 then
				LayoutOrder += 1
				local HalfWidthRowLayoutItem = buildHalfWidthRowLayoutItem(Tbl, LayoutOrder)
				Nodes[HalfWidthRowLayoutItem.key] = HalfWidthRowLayoutItem.node
				table.clear(Tbl)
			end
		else
			if #Tbl ~= 0 then
				LayoutOrder += 1
				local HalfWidthRowLayoutItem = buildHalfWidthRowLayoutItem(Tbl, LayoutOrder)
				Nodes[HalfWidthRowLayoutItem.key] = HalfWidthRowLayoutItem.node
				table.clear(Tbl)
			end
			LayoutOrder += 1
			Nodes[value.name] = ReactModule.createElement(ShortcutButtonModule, {
				label = value.label,
				getShortcutIcon = value.getShortcutIcon,
				getOnActivated = value.getOnActivated,
				getIsEnabled = value.getIsEnabled,
				width = ButtonWidth.Full,
				layoutOrder = LayoutOrder
			})
		end
	end
	if #Tbl ~= 0 then
		LayoutOrder += 1
		local HalfWidthRowLayoutItem = buildHalfWidthRowLayoutItem(Tbl, LayoutOrder)
		Nodes[HalfWidthRowLayoutItem.key] = HalfWidthRowLayoutItem.node
		table.clear(Tbl)
	end
	return Nodes
end