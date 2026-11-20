local _ = require(script:FindFirstAncestor("GameInvite").Parent.DataHydration)
local IsInCurrentExperienceModule = require(script.Parent.isInCurrentExperience)
local IsInThisServerModule = require(script.Parent.isInThisServer)

return function(p1, p2): boolean
	-- upvalues: IsInCurrentExperienceModule (copy), IsInThisServerModule (copy)
	return p1 ~= nil and (p1.gameId ~= "" and (IsInCurrentExperienceModule(p1) and not IsInThisServerModule(p1, p2)))
end