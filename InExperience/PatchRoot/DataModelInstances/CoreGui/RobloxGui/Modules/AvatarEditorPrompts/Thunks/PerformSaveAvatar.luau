local avatarEditorService = game:GetService("AvatarEditorService")
local parent = script.Parent.Parent
local closeOpenPromptModule = require(parent.Actions.CloseOpenPrompt)
local getConformedHumanoidDescriptionModule = require(parent.GetConformedHumanoidDescription)

return function(p0) --[[ line: 8 ]]
	-- upvalues: getConformedHumanoidDescriptionModule (ref), avatarEditorService (ref), closeOpenPromptModule (ref)
	local addedAssets = p0:getState().analyticsInfo.addedAssets or {}
	local removedAssets = p0:getState().analyticsInfo.removedAssets or {}
	getConformedHumanoidDescriptionModule(p0:getState().promptInfo.humanoidDescription, false):andThen(function(p1) --[[ line: 15 ]]
		-- upvalues: avatarEditorService (copy), addedAssets (ref), removedAssets (ref)
		avatarEditorService:PerformSaveAvatarWithDescription(p1, addedAssets, removedAssets)
	end, function(_) --[[ line: 17 ]]
		-- upvalues: avatarEditorService (copy)
		avatarEditorService:SignalSaveAvatarFailed()
	end)
	p0:dispatch(closeOpenPromptModule())
end