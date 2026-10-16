local AvatarEditorService = game:GetService("AvatarEditorService")
local Parent = script.Parent.Parent
local CloseOpenPromptModule = require(Parent.Actions.CloseOpenPrompt)
local GetConformedHumanoidDescriptionModule = require(Parent.GetConformedHumanoidDescription)

return function(p1) --[[ Line: 8 ]]
	-- upvalues: GetConformedHumanoidDescriptionModule (copy), AvatarEditorService (copy), CloseOpenPromptModule (copy)
	local AddedAssets = p1:getState().analyticsInfo.addedAssets or {}
	local RemovedAssets = p1:getState().analyticsInfo.removedAssets or {}
	GetConformedHumanoidDescriptionModule(p1:getState().promptInfo.humanoidDescription, false):andThen(function(Result) --[[ Line: 15 ]]
		-- upvalues: AvatarEditorService (upval), AddedAssets (copy), RemovedAssets (copy)
		AvatarEditorService:PerformSaveAvatarWithDescription(Result, AddedAssets, RemovedAssets)
	end, function(_) --[[ Line: 17 ]]
		-- upvalues: AvatarEditorService (upval)
		AvatarEditorService:SignalSaveAvatarFailed()
	end)
	p1:dispatch(CloseOpenPromptModule())
end