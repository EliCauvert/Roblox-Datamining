local avatarEditorService = game:GetService("AvatarEditorService")
local parent = script.Parent.Parent
local closeOpenPromptModule = require(parent.Actions.CloseOpenPrompt)
local getConformedHumanoidDescriptionModule = require(parent.GetConformedHumanoidDescription)

return function(p1)
	-- upvalues: getConformedHumanoidDescriptionModule (ref), avatarEditorService (ref), closeOpenPromptModule (ref)
	return function(p2)
		-- upvalues: getConformedHumanoidDescriptionModule (copy), avatarEditorService (copy), p1 (ref), closeOpenPromptModule (copy)
		getConformedHumanoidDescriptionModule(p2:getState().promptInfo.humanoidDescription, false):andThen(function(p3)
			-- upvalues: avatarEditorService (copy), p1 (copy)
			avatarEditorService:PerformCreateOutfitWithDescription(p3, p1)
		end, function(_)
			-- upvalues: avatarEditorService (copy)
			avatarEditorService:SignalCreateOutfitFailed()
		end)
		p2:dispatch(closeOpenPromptModule())
	end
end