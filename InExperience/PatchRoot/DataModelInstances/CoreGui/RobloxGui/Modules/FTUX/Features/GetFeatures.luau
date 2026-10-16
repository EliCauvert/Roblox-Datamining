local Parent = script.Parent.Parent
local PlatformEnumModule = require(Parent.Enums.PlatformEnum)
local EnableSafetyBubbleDummyModule = require(Parent.Features.EnableSafetyBubbleDummy)

function GetFeatures(QuestVR) --[[ Line: 8 ]]
	-- upvalues: PlatformEnumModule (copy), EnableSafetyBubbleDummyModule (copy)
	if QuestVR == PlatformEnumModule.QuestVR then
		EnableSafetyBubbleDummyModule()
	end
end

return GetFeatures