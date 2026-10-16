local MrRouterHeaders = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.Http).MrRouterHeaders

return function(Accept, p1) --[[ Line: 9 | Named "buildSduiRequestHeaders" ]]
	-- upvalues: MrRouterHeaders (copy)
	local config = { Accept = Accept }
	
	if p1 ~= nil then
		config["Content-Type"] = p1
	end
	return MrRouterHeaders.injectMrRouterHeaders(config)
end