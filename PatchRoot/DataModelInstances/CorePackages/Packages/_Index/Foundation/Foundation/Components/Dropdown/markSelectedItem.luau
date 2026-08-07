-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:03 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.BaseMenu)
local _ = require(foundation.Components.Types)

local function markSelectedItem(p0, p1) --[[ line: 10 ]]
	-- upvalues: markSelectedItem (ref)
	if p1 == nil then
		return p0, nil
	end
	local t = {}
	local var3 = nil
	
	for i, v in p0 do
		if v.id then
			local var4 = v
			
			if v.id == p1 then
				var4 = table.clone(v)
				var4.isChecked = true
				var3 = var4
			end
			table.insert(t, var4)
		elseif v.items then
			local var5, var6 = markSelectedItem(v.items, p1)
			table.insert(t, { title = v.title, items = var5 })
			var3 = var3 or var6
		end
	end
	return t, var3
end

return markSelectedItem