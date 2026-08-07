local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local analyticsModule = require(parent.Analytics)

return function(p0, p1) --[[ line: 12 | named "validateScaleType" ]]
	-- upvalues: constantsModule (ref), analyticsModule (ref)
	if not p0 then
		return true
	elseif constantsModule.AvatarPartScaleTypes[p0.Value] then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateScaleType_InvalidAvatarPartScaleType, nil, p1)
	assert(p0.Parent)
	
	return false, {
		string.format("The AvatarPartScaleType value in '%s' is invalid. Please, verify the value you are using is either Classic, ProportionsSlender, or ProportionsNormal.", p0.Parent.Name)
	}
end