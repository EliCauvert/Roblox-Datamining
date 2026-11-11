local Parent = script:FindFirstAncestor("AuthCommon").Parent
local ArgCheckModule = require(Parent.ArgCheck)

return require(Parent.Rodux).makeActionCreator(script.Name, function(p1)
	-- upvalues: ArgCheckModule (copy)
	return {
		disabled = ArgCheckModule.isType(p1, "boolean", "disabled")
	}
end)