local AvatarEditorService = game:GetService("AvatarEditorService")
local Parent = script.Parent.Parent
local OpenPromptModule = require(Parent.Actions.OpenPrompt)
local GetOutfitNameModule = require(Parent.Network.GetOutfitName)
local PromptTypeModule = require(Parent.PromptType)

return function(OutfitId, HumanoidDescription, RigType) --[[ Line: 10 ]]
	-- upvalues: GetOutfitNameModule (copy), OpenPromptModule (copy), PromptTypeModule (copy), AvatarEditorService (copy)
	return function(p1) --[[ Line: 11 ]]
		-- upvalues: GetOutfitNameModule (upval), OutfitId (copy), OpenPromptModule (upval), PromptTypeModule (upval), HumanoidDescription (copy), RigType (copy), AvatarEditorService (upval)
		GetOutfitNameModule(OutfitId):andThen(function(Result) --[[ Line: 12 ]]
			-- upvalues: p1 (copy), OpenPromptModule (upval), PromptTypeModule (upval), OutfitId (upval), HumanoidDescription (upval), RigType (upval)
			p1:dispatch(OpenPromptModule(PromptTypeModule.UpdateOutfit, {
				outfitId = OutfitId,
				outfitName = Result,
				humanoidDescription = HumanoidDescription,
				rigType = RigType
			}))
		end, function(_) --[[ Line: 19 ]]
			-- upvalues: AvatarEditorService (upval)
			AvatarEditorService:SignalUpdateOutfitFailed()
		end)
	end
end