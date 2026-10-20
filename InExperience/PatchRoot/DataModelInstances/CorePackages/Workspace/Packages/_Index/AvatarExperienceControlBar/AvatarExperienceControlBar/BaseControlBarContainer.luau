local AvatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local ReactModule = require(AvatarExperienceControlBar.Parent.React)
local UseBaseControlBarPropsModule = require(AvatarExperienceControlBar.useBaseControlBarProps)
local BaseControlBarModule = require(AvatarExperienceControlBar.BaseControlBar)

return ReactModule.memo(function(p1)
	-- upvalues: UseBaseControlBarPropsModule (copy), ReactModule (copy), BaseControlBarModule (copy)
	return ReactModule.createElement(BaseControlBarModule, (UseBaseControlBarPropsModule(p1)))
end)