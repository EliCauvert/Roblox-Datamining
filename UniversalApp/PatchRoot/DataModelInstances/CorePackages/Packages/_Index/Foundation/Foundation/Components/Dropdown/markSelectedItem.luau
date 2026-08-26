local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.BaseMenu)
local _ = require(foundation.Components.Types)

local function markSelectedItem(p1, p2)
	-- upvalues: markSelectedItem (ref)
	if p2 == nil then
		return p1, nil
	end
	local t = {}
	local var1 = nil
	
	for i, v in p1 do
		if v.id then
			local var2 = v
			
			if v.id == p2 then
				var2 = table.clone(v)
				var2.isChecked = true
				var1 = var2
			end
			table.insert(t, var2)
		elseif v.items then
			local var3, var4 = markSelectedItem(v.items, p2)
			table.insert(t, { title = v.title, items = var3 })
			var1 = var1 or var4
		end
	end
	return t, var1
end

return markSelectedItem