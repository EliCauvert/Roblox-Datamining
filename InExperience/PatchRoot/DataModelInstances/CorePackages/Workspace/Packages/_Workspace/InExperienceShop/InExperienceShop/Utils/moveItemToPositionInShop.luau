local _ = require(script:FindFirstAncestor("InExperienceShop").Types)

return function(Tbl1, Key, Id, ItemType, Value: number)
	local Tbl = Tbl1[Key]
	
	if Tbl == nil then
		return Tbl1
	end
	local Index = nil
	
	for i, item in Tbl.items do
		if item.itemType == ItemType and item.id == Id then
			Index = i
			break
		end
	end
	if Index == nil then
		return Tbl1
	end
	local ClampedValue = math.clamp(Value, 1, #Tbl.items)
	
	if Index == ClampedValue then
		return Tbl1
	else
		local Item = Tbl.items[Index]
		local Copy = table.clone(Tbl.items)
		table.remove(Copy, Index)
		table.insert(Copy, ClampedValue, Item)
		local Copy1 = table.clone(Tbl)
		Copy1.items = Copy
		local Copy2 = table.clone(Tbl1)
		Copy2[Key] = Copy1
		
		return Copy2
	end
end