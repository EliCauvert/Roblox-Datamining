local playabilityRodux = script:FindFirstAncestor("PlayabilityRodux")
local immutable = require(playabilityRodux.Parent.AppCommonLib).Immutable
local setPlayabilityStatusModule = require(playabilityRodux.PlayabilityStatus.SetPlayabilityStatus)

return function(p0, p1) --[[ line: 7 ]]
	-- upvalues: setPlayabilityStatusModule (ref), immutable (ref)
	p0 = p0 or {}
	
	if p1.type == setPlayabilityStatusModule.name then
		p0 = immutable.JoinDictionaries(p0, p1.playabilityStatus)
	end
	return p0
end