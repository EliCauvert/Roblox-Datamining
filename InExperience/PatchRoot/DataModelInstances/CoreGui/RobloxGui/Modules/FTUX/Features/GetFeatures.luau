local parent = script.Parent.Parent
local platformEnumModule = require(parent.Enums.PlatformEnum)
local enableSafetyBubbleDummyModule = require(parent.Features.EnableSafetyBubbleDummy)

function GetFeatures(p1)
	-- upvalues: platformEnumModule (ref), enableSafetyBubbleDummyModule (ref)
	if p1 == platformEnumModule.QuestVR then
		enableSafetyBubbleDummyModule()
	end
end

return GetFeatures