local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local reactModule = require(avatarExperienceControlBar.Parent.React)
local useBaseControlBarPropsModule = require(avatarExperienceControlBar.useBaseControlBarProps)
local baseControlBarModule = require(avatarExperienceControlBar.BaseControlBar)

return reactModule.memo(function(p1)
	-- upvalues: useBaseControlBarPropsModule (ref), reactModule (ref), baseControlBarModule (ref)
	return reactModule.createElement(baseControlBarModule, useBaseControlBarPropsModule(p1))
end)