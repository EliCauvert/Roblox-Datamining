local function dumpNavigationRoute(p1, Text): string
	-- upvalues: dumpNavigationRoute (copy)
	local v1 = ""
	local Text1 = Text .. "   "
	local Index = p1.index
	
	if p1 and p1.routes then
		for i, route in p1.routes do
			local RouteName = route.routeName
			
			if i == Index then
				RouteName = "*" .. RouteName
			end
			v1 = (v1 .. Text1 .. RouteName .. "\n") .. dumpNavigationRoute(route, Text1)
		end
	end
	return v1
end

return function(p2): string
	-- upvalues: dumpNavigationRoute (copy)
	return "[Navigation Root]\n" .. dumpNavigationRoute(p2, "")
end