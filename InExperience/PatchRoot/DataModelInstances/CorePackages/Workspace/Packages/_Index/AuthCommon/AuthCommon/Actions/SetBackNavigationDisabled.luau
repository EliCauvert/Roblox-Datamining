local parent = script:FindFirstAncestor("AuthCommon").Parent
local argCheckModule = require(parent.ArgCheck)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1)
	-- upvalues: argCheckModule (ref)
	return {
		disabled = argCheckModule.isType(p1, "boolean", "disabled")
	}
end)