local playabilityRodux = script:FindFirstAncestor("PlayabilityRodux")
local immutable = require(playabilityRodux.Parent.AppCommonLib).Immutable
local setPlayabilityStatusModule = require(playabilityRodux.PlayabilityStatus.SetPlayabilityStatus)

return function(p1, p2)
	-- upvalues: setPlayabilityStatusModule (ref), immutable (ref)
	p1 = p1 or {}
	
	if p2.type == setPlayabilityStatusModule.name then
		p1 = immutable.JoinDictionaries(p1, p2.playabilityStatus)
	end
	return p1
end