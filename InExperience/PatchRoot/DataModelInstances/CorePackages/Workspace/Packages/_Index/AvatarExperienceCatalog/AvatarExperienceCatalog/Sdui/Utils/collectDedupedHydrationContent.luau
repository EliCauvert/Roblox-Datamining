local _ = require(script:FindFirstAncestor("AvatarExperienceCatalog").Components.ResultsList.WidgetListInfoViewModel)
local t = { Asset = true, Bundle = true, Look = true }

return function(p1, p2, p3, p4)
	-- upvalues: t (ref)
	for i = 1, if p4 then math.min(p4, #p1) else #p1 do
		local var1 = p1[i]
		local var2 = tostring(var1.type)
		local var3 = tostring(var1.id)
		
		if t[var2] then
			local var4 = p3[var2] or {}
			
			if not var4[var3] then
				var4[var3] = true
				p3[var2] = var4
				table.insert(p2, var1)
			end
		end
	end
end