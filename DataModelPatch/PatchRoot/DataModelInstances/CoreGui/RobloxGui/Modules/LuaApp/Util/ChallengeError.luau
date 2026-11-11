local LuauPolyfillModule = require(game:GetService("CorePackages").Packages.LuauPolyfill)
local ErrorKindModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.Challenge.ErrorKind)
local ChallengeErrorModule = {}
ChallengeErrorModule.__index = ChallengeErrorModule

function ChallengeErrorModule:new(Kind, Data)
	-- upvalues: ChallengeErrorModule (copy)
	local t = {}
	setmetatable(t, ChallengeErrorModule)
	t.kind = Kind
	t.data = Data
	
	return t
end

function ChallengeErrorModule.match(p1)
	-- upvalues: LuauPolyfillModule (copy), ChallengeErrorModule (copy)
	return LuauPolyfillModule.instanceof(p1, ChallengeErrorModule)
end

function ChallengeErrorModule:matchAbandoned(): boolean
	-- upvalues: ChallengeErrorModule (copy), ErrorKindModule (copy)
	return ChallengeErrorModule.match(self) and self.kind == ErrorKindModule.Abandoned
end

function ChallengeErrorModule.matchRateLimited(p1)
	-- upvalues: ChallengeErrorModule (copy), ErrorKindModule (copy)
	return if ChallengeErrorModule.match(p1) and p1.kind == ErrorKindModule.RateLimited and p1.data and p1.data.retryTime and DateTime.fromIsoDate(p1.data.retryTime) then p1.data.retryTime else nil
end

return ChallengeErrorModule