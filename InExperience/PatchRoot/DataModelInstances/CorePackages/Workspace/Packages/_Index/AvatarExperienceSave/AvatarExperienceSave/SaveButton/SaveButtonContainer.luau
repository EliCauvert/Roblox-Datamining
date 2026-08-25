local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local parent = avatarExperienceSave.Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local useSaveButtonPropsModule = require(avatarExperienceSave.SaveButton.useSaveButtonProps)
local saveButtonModule = require(avatarExperienceSave.SaveButton.SaveButton)

return function(p0)
	-- upvalues: reactModule (ref), saveButtonModule (ref), dashModule (ref), useSaveButtonPropsModule (ref)
	return reactModule.createElement(saveButtonModule, dashModule.assign(p0, useSaveButtonPropsModule()))
end