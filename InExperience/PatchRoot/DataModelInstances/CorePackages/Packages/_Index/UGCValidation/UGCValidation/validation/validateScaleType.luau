local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local analyticsModule = require(parent.Analytics)

return function(p1, p2)
	-- upvalues: constantsModule (ref), analyticsModule (ref)
	if not p1 then
		return true
	elseif constantsModule.AvatarPartScaleTypes[p1.Value] then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateScaleType_InvalidAvatarPartScaleType, nil, p2)
	assert(p1.Parent)
	
	return false, {
		string.format("The AvatarPartScaleType value in '%s' is invalid. Please, verify the value you are using is either Classic, ProportionsSlender, or ProportionsNormal.", p1.Parent.Name)
	}
end