local mrRouterHeaders = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.Http).MrRouterHeaders

return function(p1, p2)
	-- upvalues: mrRouterHeaders (ref)
	local t = { Accept = p1 }
	
	if p2 ~= nil then
		t["Content-Type"] = p2
	end
	return mrRouterHeaders.injectMrRouterHeaders(t)
end