local AvatarEditorService = game:GetService("AvatarEditorService")
local Parent = script.Parent.Parent
local CloseOpenPromptModule = require(Parent.Actions.CloseOpenPrompt)
local GetConformedHumanoidDescriptionModule = require(Parent.GetConformedHumanoidDescription)

return function(Name)
	-- upvalues: GetConformedHumanoidDescriptionModule (copy), AvatarEditorService (copy), CloseOpenPromptModule (copy)
	return function(p1)
		-- upvalues: GetConformedHumanoidDescriptionModule (upval), AvatarEditorService (upval), Name (copy), CloseOpenPromptModule (upval)
		GetConformedHumanoidDescriptionModule(p1:getState().promptInfo.humanoidDescription, false):andThen(function(Result)
			-- upvalues: AvatarEditorService (upval), Name (upval)
			AvatarEditorService:PerformCreateOutfitWithDescription(Result, Name)
		end, function(_)
			-- upvalues: AvatarEditorService (upval)
			AvatarEditorService:SignalCreateOutfitFailed()
		end)
		p1:dispatch(CloseOpenPromptModule())
	end
end