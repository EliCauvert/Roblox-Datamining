local IsIosAuthServiceEnabledModule = require(script:FindFirstAncestor("AuthCommon").Utils.isIosAuthServiceEnabled)

return function(p1) --[[ Line: 5 | Named "shouldSkipLegacyPasswordSaveEvent" ]]
	-- upvalues: IsIosAuthServiceEnabledModule (copy)
	return p1 and IsIosAuthServiceEnabledModule()
end