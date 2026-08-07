local avatarEditorService = game:GetService("AvatarEditorService")
local parent = script.Parent.Parent
local closeOpenPromptModule = require(parent.Actions.CloseOpenPrompt)
local getConformedHumanoidDescriptionModule = require(parent.GetConformedHumanoidDescription)

return function(p0) --[[ line: 8 ]]
	-- upvalues: getConformedHumanoidDescriptionModule (ref), avatarEditorService (ref), closeOpenPromptModule (ref)
	getConformedHumanoidDescriptionModule(p0:getState().promptInfo.humanoidDescription, false):andThen(function(p1) --[[ line: 12 ]]
		-- upvalues: avatarEditorService (copy)
		avatarEditorService:PerformUpdateOutfit(p1)
	end, function(_) --[[ line: 14 ]]
		-- upvalues: avatarEditorService (copy)
		avatarEditorService:SignalUpdateOutfitFailed()
	end)
	p0:dispatch(closeOpenPromptModule())
end