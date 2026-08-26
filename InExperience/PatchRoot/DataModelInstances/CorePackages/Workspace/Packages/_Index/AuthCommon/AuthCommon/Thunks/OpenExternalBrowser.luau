local argCheckModule = require(script:FindFirstAncestor("AuthCommon").Parent.ArgCheck)

return function(p1, p2)
	-- upvalues: argCheckModule (ref)
	argCheckModule.isNotNil(p1, "linking")
	argCheckModule.isType(p2, "string", "url")
	p1:openURL(p2)
end