local PlayabilityRodux = script:FindFirstAncestor("PlayabilityRodux")
local Immutable = require(PlayabilityRodux.Parent.AppCommonLib).Immutable
local SetPlayabilityStatusModule = require(PlayabilityRodux.PlayabilityStatus.SetPlayabilityStatus)

return function(p1, p2)
	-- upvalues: SetPlayabilityStatusModule (copy), Immutable (copy)
	local P0 = p1 or {}
	
	if p2.type == SetPlayabilityStatusModule.name then
		P0 = Immutable.JoinDictionaries(P0, p2.playabilityStatus)
	end
	return P0
end