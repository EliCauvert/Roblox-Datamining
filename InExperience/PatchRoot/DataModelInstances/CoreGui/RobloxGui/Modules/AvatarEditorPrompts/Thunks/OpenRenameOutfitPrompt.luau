local AvatarEditorService = game:GetService("AvatarEditorService")
local Parent = script.Parent.Parent
local OpenPromptModule = require(Parent.Actions.OpenPrompt)
local GetOutfitNameModule = require(Parent.Network.GetOutfitName)
local PromptTypeModule = require(Parent.PromptType)

return function(OutfitId)
	-- upvalues: GetOutfitNameModule (copy), OpenPromptModule (copy), PromptTypeModule (copy), AvatarEditorService (copy)
	return function(p1)
		-- upvalues: GetOutfitNameModule (upval), OutfitId (copy), OpenPromptModule (upval), PromptTypeModule (upval), AvatarEditorService (upval)
		GetOutfitNameModule(OutfitId):andThen(function(Result)
			-- upvalues: p1 (copy), OpenPromptModule (upval), PromptTypeModule (upval), OutfitId (upval)
			p1:dispatch(OpenPromptModule(PromptTypeModule.RenameOutfit, { outfitId = OutfitId, outfitName = Result }))
		end, function(_)
			-- upvalues: AvatarEditorService (upval)
			AvatarEditorService:SignalRenameOutfitFailed()
		end)
	end
end