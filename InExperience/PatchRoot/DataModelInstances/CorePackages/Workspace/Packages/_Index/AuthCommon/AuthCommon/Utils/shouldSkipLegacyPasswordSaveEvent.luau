local isIosAuthServiceEnabledModule = require(script:FindFirstAncestor("AuthCommon").Utils.isIosAuthServiceEnabled)

return function(p1)
	-- upvalues: isIosAuthServiceEnabledModule (ref)
	return p1 and isIosAuthServiceEnabledModule()
end