local function isRootRoute(Route)
	-- upvalues: isRootRoute (copy)
	if Route.routes and #Route.routes > 1 then
		return false
	else
		local Index = Route.index
		local Route1 = Route.routes and Route.routes[Index]
		
		return not Route1 or isRootRoute(Route1)
	end
end

return isRootRoute