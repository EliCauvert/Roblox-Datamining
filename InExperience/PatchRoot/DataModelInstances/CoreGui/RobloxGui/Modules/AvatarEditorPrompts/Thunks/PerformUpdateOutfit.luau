local AvatarEditorService = game:GetService("AvatarEditorService")
local Parent = script.Parent.Parent
local CloseOpenPromptModule = require(Parent.Actions.CloseOpenPrompt)
local GetConformedHumanoidDescriptionModule = require(Parent.GetConformedHumanoidDescription)

return function(p1) --[[ Line: 8 ]]
	-- upvalues: GetConformedHumanoidDescriptionModule (copy), AvatarEditorService (copy), CloseOpenPromptModule (copy)
	GetConformedHumanoidDescriptionModule(p1:getState().promptInfo.humanoidDescription, false):andThen(function(Result) --[[ Line: 12 ]]
		-- upvalues: AvatarEditorService (upval)
		AvatarEditorService:PerformUpdateOutfit(Result)
	end, function(_) --[[ Line: 14 ]]
		-- upvalues: AvatarEditorService (upval)
		AvatarEditorService:SignalUpdateOutfitFailed()
	end)
	p1:dispatch(CloseOpenPromptModule())
end