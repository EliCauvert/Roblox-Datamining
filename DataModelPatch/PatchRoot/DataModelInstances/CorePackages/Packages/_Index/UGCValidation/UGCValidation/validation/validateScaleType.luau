local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local AnalyticsModule = require(Parent.Analytics)

return function(p1, p2)
	-- upvalues: ConstantsModule (copy), AnalyticsModule (copy)
	if not p1 then
		return true
	elseif ConstantsModule.AvatarPartScaleTypes[p1.Value] then
		return true
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateScaleType_InvalidAvatarPartScaleType, nil, p2)
		assert(p1.Parent)
		
		return false, {
			string.format("The AvatarPartScaleType value in '%s' is invalid. Please, verify the value you are using is either Classic, ProportionsSlender, or ProportionsNormal.", p1.Parent.Name)
		}
	end
end