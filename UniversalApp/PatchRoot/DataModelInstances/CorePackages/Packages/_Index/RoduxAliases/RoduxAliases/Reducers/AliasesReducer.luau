local Parent = script.Parent.Parent
local ByUserIdModule = require(Parent.Reducers.Aliases.byUserId)
local _ = require(Parent.RoduxAliasesTypes)
local t = {}

return function(p1)
	-- upvalues: t (copy), ByUserIdModule (copy)
	return function(p2, p3)
		-- upvalues: t (upval), ByUserIdModule (upval), p1 (copy)
		return { byUserId = ByUserIdModule(p1)((p2 or t).byUserId, p3) }
	end
end