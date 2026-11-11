local ArgCheckModule = require(script:FindFirstAncestor("AuthCommon").Parent.ArgCheck)

return function(p1, p2)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isNotNil(p1, "linking")
	ArgCheckModule.isType(p2, "string", "url")
	p1:openURL(p2)
end