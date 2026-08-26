local avatarEditorService = game:GetService("AvatarEditorService")
local parent = script.Parent.Parent
local closeOpenPromptModule = require(parent.Actions.CloseOpenPrompt)
local getConformedHumanoidDescriptionModule = require(parent.GetConformedHumanoidDescription)

return function(p1)
	-- upvalues: getConformedHumanoidDescriptionModule (ref), avatarEditorService (ref), closeOpenPromptModule (ref)
	local addedAssets = p1:getState().analyticsInfo.addedAssets or {}
	local removedAssets = p1:getState().analyticsInfo.removedAssets or {}
	getConformedHumanoidDescriptionModule(p1:getState().promptInfo.humanoidDescription, false):andThen(function(p2)
		-- upvalues: avatarEditorService (copy), addedAssets (ref), removedAssets (ref)
		avatarEditorService:PerformSaveAvatarWithDescription(p2, addedAssets, removedAssets)
	end, function(_)
		-- upvalues: avatarEditorService (copy)
		avatarEditorService:SignalSaveAvatarFailed()
	end)
	p1:dispatch(closeOpenPromptModule())
end