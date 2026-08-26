local parent = script.Parent.Parent
local byUserIdModule = require(parent.Reducers.Aliases.byUserId)
local _ = require(parent.RoduxAliasesTypes)
local t = {}

return function(p1)
	-- upvalues: t (ref), byUserIdModule (ref)
	return function(p2, p3)
		-- upvalues: t (copy), byUserIdModule (copy), p1 (ref)
		return { byUserId = byUserIdModule(p1)((p2 or t).byUserId, p3) }
	end
end