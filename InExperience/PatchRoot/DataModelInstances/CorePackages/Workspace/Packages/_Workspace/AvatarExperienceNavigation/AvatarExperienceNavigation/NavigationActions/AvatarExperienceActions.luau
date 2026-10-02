local t = { ClearScreens = "ClearScreens" }

function t.clearScreens(p1)
	-- upvalues: t (ref)
	return { type = t.ClearScreens, routeNames = p1 }
end

return t