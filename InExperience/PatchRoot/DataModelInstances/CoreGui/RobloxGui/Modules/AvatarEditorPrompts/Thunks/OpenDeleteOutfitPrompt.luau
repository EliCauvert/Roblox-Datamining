local AvatarEditorService = game:GetService("AvatarEditorService")
local _ = game:GetService("CorePackages")
local _ = game:GetService("HttpRbxApiService")
local Parent = script.Parent.Parent
local OpenPromptModule = require(Parent.Actions.OpenPrompt)
local GetOutfitNameModule = require(Parent.Network.GetOutfitName)
local PromptTypeModule = require(Parent.PromptType)

return function(OutfitId) --[[ Line: 16 ]]
	-- upvalues: GetOutfitNameModule (copy), OpenPromptModule (copy), PromptTypeModule (copy), AvatarEditorService (copy)
	return function(p1) --[[ Line: 17 ]]
		-- upvalues: GetOutfitNameModule (upval), OutfitId (copy), OpenPromptModule (upval), PromptTypeModule (upval), AvatarEditorService (upval)
		GetOutfitNameModule(OutfitId):andThen(function(Result) --[[ Line: 18 ]]
			-- upvalues: p1 (copy), OpenPromptModule (upval), PromptTypeModule (upval), OutfitId (upval)
			p1:dispatch(OpenPromptModule(PromptTypeModule.DeleteOutfit, { outfitId = OutfitId, outfitName = Result }))
		end, function(_) --[[ Line: 23 ]]
			-- upvalues: AvatarEditorService (upval)
			AvatarEditorService:SignalDeleteOutfitFailed()
		end)
	end
end