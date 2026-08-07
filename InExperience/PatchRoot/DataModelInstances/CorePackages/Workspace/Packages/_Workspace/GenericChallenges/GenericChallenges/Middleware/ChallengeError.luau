local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local errorKindModule = require(genericChallenges.Types.ErrorKind)
local luauPolyfillModule = require(genericChallenges.Parent.LuauPolyfill)
local t = {}
t.__index = t

function t.new(p0, p1) --[[ line: 25 ]]
	-- upvalues: t (ref)
	return setmetatable({ kind = p0, data = p1 }, t)
end

function t.match(p2) --[[ line: 32 ]]
	-- upvalues: luauPolyfillModule (ref), t (ref)
	return luauPolyfillModule.instanceof(p2, t)
end

function t:matchAbandoned() --[[ line: 36 ]]
	-- upvalues: t (ref), errorKindModule (ref)
	return t.match(self) and self.kind == errorKindModule.Abandoned
end

return t