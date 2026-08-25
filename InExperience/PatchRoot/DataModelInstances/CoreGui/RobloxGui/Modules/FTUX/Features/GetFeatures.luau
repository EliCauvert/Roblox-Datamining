local parent = script.Parent.Parent
local platformEnumModule = require(parent.Enums.PlatformEnum)
local enableSafetyBubbleDummyModule = require(parent.Features.EnableSafetyBubbleDummy)

function GetFeatures(p0)
	-- upvalues: platformEnumModule (ref), enableSafetyBubbleDummyModule (ref)
	if p0 == platformEnumModule.QuestVR then
		enableSafetyBubbleDummyModule()
	end
end

return GetFeatures