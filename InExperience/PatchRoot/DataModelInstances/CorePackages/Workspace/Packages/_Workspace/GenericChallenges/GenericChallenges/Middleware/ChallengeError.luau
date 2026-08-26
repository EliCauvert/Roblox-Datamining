local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local errorKindModule = require(genericChallenges.Types.ErrorKind)
local luauPolyfillModule = require(genericChallenges.Parent.LuauPolyfill)
local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: t (ref)
	return setmetatable({ kind = p1, data = p2 }, t)
end

function t.match(p1)
	-- upvalues: luauPolyfillModule (ref), t (ref)
	return luauPolyfillModule.instanceof(p1, t)
end

function t:matchAbandoned()
	-- upvalues: t (ref), errorKindModule (ref)
	return t.match(self) and self.kind == errorKindModule.Abandoned
end

return t