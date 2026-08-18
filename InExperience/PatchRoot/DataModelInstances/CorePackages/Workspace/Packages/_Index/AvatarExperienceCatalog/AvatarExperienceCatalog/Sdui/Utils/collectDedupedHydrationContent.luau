local _ = require(script:FindFirstAncestor("AvatarExperienceCatalog").Components.ResultsList.WidgetListInfoViewModel)
local t = { Asset = true, Bundle = true, Look = true }

return function(p0, p1, p2, p3) --[[ line: 22 | named "collectDedupedHydrationContent" ]]
	-- upvalues: t (ref)
	for i = 1, if p3 then math.min(p3, #p0) else #p0 do
		local var1 = p0[i]
		local var2 = tostring(var1.type)
		local var3 = tostring(var1.id)
		
		if t[var2] then
			local var4 = p2[var2] or {}
			
			if not var4[var3] then
				var4[var3] = true
				p2[var2] = var4
				table.insert(p1, var1)
			end
		end
	end
end