local IsIosAuthServiceEnabledModule = require(script:FindFirstAncestor("AuthCommon").Utils.isIosAuthServiceEnabled)

return function(p1)
	-- upvalues: IsIosAuthServiceEnabledModule (copy)
	return p1 and IsIosAuthServiceEnabledModule()
end