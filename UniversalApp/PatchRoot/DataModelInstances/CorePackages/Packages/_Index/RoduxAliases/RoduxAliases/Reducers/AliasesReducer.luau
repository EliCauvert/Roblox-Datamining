local parent = script.Parent.Parent
local byUserIdModule = require(parent.Reducers.Aliases.byUserId)
local _ = require(parent.RoduxAliasesTypes)
local t = {}

return function(p0) --[[ line: 10 ]]
	-- upvalues: t (ref), byUserIdModule (ref)
	return function(p1, p2) --[[ line: 11 ]]
		-- upvalues: t (copy), byUserIdModule (copy), p0 (ref)
		return { byUserId = byUserIdModule(p0)((p1 or t).byUserId, p2) }
	end
end