local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ReactModule = require(ProfilePlatform.Parent.React)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local GroupPeekSduiSectionModule = require(ProfilePlatform.Components.GroupPeekSduiSection)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), GroupPeekSduiSectionModule (copy), EnumsModule (copy)
	return ReactModule.createElement(GroupPeekSduiSectionModule, {
		layoutOrder = p1.layoutOrder,
		section = EnumsModule.Components.Announcements
	})
end)