local argCheckModule = require(script:FindFirstAncestor("AuthCommon").Parent.ArgCheck)

return function(p0, p1) --[[ line: 5 ]]
	-- upvalues: argCheckModule (ref)
	argCheckModule.isNotNil(p0, "linking")
	argCheckModule.isType(p1, "string", "url")
	p0:openURL(p1)
end