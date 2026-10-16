local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.BaseMenu)
local _ = require(Foundation.Components.Types)

local function markSelectedItem(Items, Id) --[[ Line: 10 ]]
	-- upvalues: markSelectedItem (copy)
	if Id == nil then
		return Items, nil
	end
	local List = {}
	local v1 = nil
	
	for _, item in Items do
		if not item.id then
			if item.items then
				local MarkSelectedItemResult, MarkSelectedItemResult2 = markSelectedItem(item.items, Id)
				table.insert(List, { title = item.title, items = MarkSelectedItemResult })
				v1 = v1 or MarkSelectedItemResult2
				continue
			end
			continue
		end
		local item1 = item
		
		if item.id == Id then
			item1 = table.clone(item)
			item1.isChecked = true
			v1 = item1
		end
		table.insert(List, item1)
	end
	return List, v1
end

return markSelectedItem