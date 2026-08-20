local _ = require(script:FindFirstAncestor("AvatarExperienceCatalog").Components.ResultsList.WidgetListInfoViewModel)

return function(p0) --[[ line: 25 | named "getOrderedWidgets" ]]
	local t = {}
	
	for i in p0 do
		local var3 = tonumber(i)
		
		if var3 then
			table.insert(t, var3)
		end
	end
	table.sort(t)
	local t_1 = {}
	
	for i_1, v in t do
		local var2 = p0[tostring(v)]
		
		if var2.content and #var2.content > 0 then
			table.insert(t_1, { position = v, widget = var2 })
		end
	end
	return t_1
end