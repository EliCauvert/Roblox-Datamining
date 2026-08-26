local _ = require(script:FindFirstAncestor("AvatarExperienceCatalog").Components.ResultsList.WidgetListInfoViewModel)

return function(p1)
	local t = {}
	
	for i in p1 do
		local var1 = tonumber(i)
		
		if var1 then
			table.insert(t, var1)
		end
	end
	table.sort(t)
	local t_1 = {}
	
	for i_1, v in t do
		local var2 = p1[tostring(v)]
		
		if var2.content and #var2.content > 0 then
			table.insert(t_1, { position = v, widget = var2 })
		end
	end
	return t_1
end