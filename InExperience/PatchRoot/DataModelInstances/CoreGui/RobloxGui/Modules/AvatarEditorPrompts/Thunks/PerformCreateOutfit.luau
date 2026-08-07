local avatarEditorService = game:GetService("AvatarEditorService")
local parent = script.Parent.Parent
local closeOpenPromptModule = require(parent.Actions.CloseOpenPrompt)
local getConformedHumanoidDescriptionModule = require(parent.GetConformedHumanoidDescription)

return function(p0) --[[ line: 8 ]]
	-- upvalues: getConformedHumanoidDescriptionModule (ref), avatarEditorService (ref), closeOpenPromptModule (ref)
	return function(p1) --[[ line: 9 ]]
		-- upvalues: getConformedHumanoidDescriptionModule (copy), avatarEditorService (copy), p0 (ref), closeOpenPromptModule (copy)
		getConformedHumanoidDescriptionModule(p1:getState().promptInfo.humanoidDescription, false):andThen(function(p2) --[[ line: 13 ]]
			-- upvalues: avatarEditorService (copy), p0 (copy)
			avatarEditorService:PerformCreateOutfitWithDescription(p2, p0)
		end, function(_) --[[ line: 15 ]]
			-- upvalues: avatarEditorService (copy)
			avatarEditorService:SignalCreateOutfitFailed()
		end)
		p1:dispatch(closeOpenPromptModule())
	end
end