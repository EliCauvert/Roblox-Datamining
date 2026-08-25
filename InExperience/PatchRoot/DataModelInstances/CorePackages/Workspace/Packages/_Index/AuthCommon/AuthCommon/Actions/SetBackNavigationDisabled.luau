local parent = script:FindFirstAncestor("AuthCommon").Parent
local argCheckModule = require(parent.ArgCheck)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0)
	-- upvalues: argCheckModule (ref)
	return {
		disabled = argCheckModule.isType(p0, "boolean", "disabled")
	}
end)