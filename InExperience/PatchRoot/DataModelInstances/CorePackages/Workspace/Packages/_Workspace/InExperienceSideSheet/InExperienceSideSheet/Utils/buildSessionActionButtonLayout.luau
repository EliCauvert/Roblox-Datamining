local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local _ = require(InExperienceSideSheet.Common.Types)
local ShortcutButtonModule = require(InExperienceSideSheet.Components.ShortcutButton)
local FFlagSideSheetEmphasizeLeave = require(InExperienceSideSheet.Flags).FFlagSideSheetEmphasizeLeave
local ButtonWidth = require(InExperienceSideSheet.Common.Enums).ButtonWidth

local function createShortcutButton(p1, LayoutOrder, Full)
	-- upvalues: ReactModule (copy), ShortcutButtonModule (copy), FFlagSideSheetEmphasizeLeave (copy)
	return ReactModule.createElement(ShortcutButtonModule, {
		label = p1.label,
		getShortcutIcon = p1.getShortcutIcon,
		getOnActivated = p1.getOnActivated,
		getIsEnabled = p1.getIsEnabled,
		width = Full,
		layoutOrder = LayoutOrder,
		isEmphasized = p1.isEmphasized,
		testId = if FFlagSideSheetEmphasizeLeave then p1.testId else nil
	})
end

local function buildHalfWidthRowLayoutItem(Entry, Count)
	-- upvalues: createShortcutButton (copy), ButtonWidth (copy), ReactModule (copy), View (copy)
	if #Entry == 1 then
		local Entry1 = Entry[1]
		
		return {
			key = Entry1.name,
			node = createShortcutButton(Entry1, Count, ButtonWidth.Full)
		}
	end
	local t = {}
	
	for i, value in Entry do
		t[value.name] = createShortcutButton(value, i, ButtonWidth.Half)
	end
	return {
		key = "HalfWidthRow_" .. Count,
		node = ReactModule.createElement(View, {
			tag = "row gap-small size-full-0 auto-y",
			LayoutOrder = Count
		}, t)
	}
end

return function(List)
	-- upvalues: buildHalfWidthRowLayoutItem (copy), ButtonWidth (copy), createShortcutButton (copy)
	local Nodes = {}
	local Count = 0
	local Tbl = {}
	
	local function _()
		-- upvalues: Tbl (copy), Count (ref), buildHalfWidthRowLayoutItem (upval), Nodes (copy)
		if #Tbl ~= 0 then
			Count += 1
			local HalfWidthRowLayoutItem = buildHalfWidthRowLayoutItem(Tbl, Count)
			Nodes[HalfWidthRowLayoutItem.key] = HalfWidthRowLayoutItem.node
			table.clear(Tbl)
			
			return
		end
	end
	
	for _, value in List do
		if (value.width or ButtonWidth.Full) == ButtonWidth.Half then
			table.insert(Tbl, value)
			
			if #Tbl == 2 and #Tbl ~= 0 then
				Count += 1
				local HalfWidthRowLayoutItem = buildHalfWidthRowLayoutItem(Tbl, Count)
				Nodes[HalfWidthRowLayoutItem.key] = HalfWidthRowLayoutItem.node
				table.clear(Tbl)
			end
		else
			if #Tbl ~= 0 then
				Count += 1
				local HalfWidthRowLayoutItem = buildHalfWidthRowLayoutItem(Tbl, Count)
				Nodes[HalfWidthRowLayoutItem.key] = HalfWidthRowLayoutItem.node
				table.clear(Tbl)
			end
			Count += 1
			Nodes[value.name] = createShortcutButton(value, Count, ButtonWidth.Full)
		end
	end
	if #Tbl ~= 0 then
		Count += 1
		local HalfWidthRowLayoutItem = buildHalfWidthRowLayoutItem(Tbl, Count)
		Nodes[HalfWidthRowLayoutItem.key] = HalfWidthRowLayoutItem.node
		table.clear(Tbl)
	end
	return Nodes
end