local avatarEditorService = game:GetService("AvatarEditorService")
local parent = script.Parent.Parent
local closeOpenPromptModule = require(parent.Actions.CloseOpenPrompt)
local getConformedHumanoidDescriptionModule = require(parent.GetConformedHumanoidDescription)

return function(p1)
	-- upvalues: getConformedHumanoidDescriptionModule (ref), avatarEditorService (ref), closeOpenPromptModule (ref)
	getConformedHumanoidDescriptionModule(p1:getState().promptInfo.humanoidDescription, false):andThen(function(p2)
		-- upvalues: avatarEditorService (copy)
		avatarEditorService:PerformUpdateOutfit(p2)
	end, function(_)
		-- upvalues: avatarEditorService (copy)
		avatarEditorService:SignalUpdateOutfitFailed()
	end)
	p1:dispatch(closeOpenPromptModule())
end