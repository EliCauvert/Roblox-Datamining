local AvatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local Parent = AvatarExperienceSave.Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local UseSaveButtonPropsModule = require(AvatarExperienceSave.SaveButton.useSaveButtonProps)
local SaveButtonModule = require(AvatarExperienceSave.SaveButton.SaveButton)

return function(p1) --[[ Line: 10 | Named "SaveButtonContainer" ]]
	-- upvalues: ReactModule (copy), SaveButtonModule (copy), DashModule (copy), UseSaveButtonPropsModule (copy)
	return ReactModule.createElement(SaveButtonModule, DashModule.assign(p1, UseSaveButtonPropsModule()))
end