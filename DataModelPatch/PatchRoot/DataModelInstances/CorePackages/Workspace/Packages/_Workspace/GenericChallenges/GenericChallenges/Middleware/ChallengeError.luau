local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local ErrorKindModule = require(GenericChallenges.Types.ErrorKind)
local LuauPolyfillModule = require(GenericChallenges.Parent.LuauPolyfill)
local ChallengeErrorModule = {}
ChallengeErrorModule.__index = ChallengeErrorModule

function ChallengeErrorModule.new(Kind, Data)
	-- upvalues: ChallengeErrorModule (copy)
	return (setmetatable({ kind = Kind, data = Data }, ChallengeErrorModule))
end

function ChallengeErrorModule.match(p1)
	-- upvalues: LuauPolyfillModule (copy), ChallengeErrorModule (copy)
	return LuauPolyfillModule.instanceof(p1, ChallengeErrorModule)
end

function ChallengeErrorModule:matchAbandoned(): boolean
	-- upvalues: ChallengeErrorModule (copy), ErrorKindModule (copy)
	return ChallengeErrorModule.match(self) and self.kind == ErrorKindModule.Abandoned
end

return ChallengeErrorModule