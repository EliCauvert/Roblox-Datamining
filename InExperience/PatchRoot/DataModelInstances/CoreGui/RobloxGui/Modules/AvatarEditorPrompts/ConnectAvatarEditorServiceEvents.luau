local AvatarEditorService = game:GetService("AvatarEditorService")
local Parent = script.Parent
local OpenPromptModule = require(Parent.Actions.OpenPrompt)
local PromptTypeModule = require(Parent.PromptType)
local OpenSetFavoritePromptModule = require(Parent.Thunks.OpenSetFavoritePrompt)
local OpenSaveAvatarPromptModule = require(Parent.Thunks.OpenSaveAvatarPrompt)
local OpenDeleteOutfitPromptModule = require(Parent.Thunks.OpenDeleteOutfitPrompt)
local OpenRenameOutfitPromptModule = require(Parent.Thunks.OpenRenameOutfitPrompt)
local OpenUpdateOutfitPromptModule = require(Parent.Thunks.OpenUpdateOutfitPrompt)
local AvatarExperienceCommonModule = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceCommon)

return function(p1) --[[ Line: 17 | Named "ConnectAvatarEditorServiceEvents" ]]
	-- upvalues: AvatarEditorService (copy), AvatarExperienceCommonModule (copy), OpenPromptModule (copy), PromptTypeModule (copy), OpenSaveAvatarPromptModule (copy), OpenSetFavoritePromptModule (copy), OpenDeleteOutfitPromptModule (copy), OpenRenameOutfitPromptModule (copy), OpenUpdateOutfitPromptModule (copy)
	local List = {}
	table.insert(List, AvatarEditorService.OpenPromptSaveAvatar:Connect(function(HumanoidDescription, RigType) --[[ Line: 22 ]]
		-- upvalues: AvatarExperienceCommonModule (upval), p1 (copy), OpenPromptModule (upval), PromptTypeModule (upval), OpenSaveAvatarPromptModule (upval)
		AvatarExperienceCommonModule.Stores.getTimeoutStatusStore().fetchStatusAsync():andThen(function(Result) --[[ Line: 24 ]]
			-- upvalues: p1 (upval), OpenPromptModule (upval), PromptTypeModule (upval), OpenSaveAvatarPromptModule (upval), HumanoidDescription (copy), RigType (copy)
			if Result.isTimedOut then
				p1:dispatch(OpenPromptModule(PromptTypeModule.SaveAvatarTimeout, {}))
				
				return
			else
				p1:dispatch(OpenSaveAvatarPromptModule(HumanoidDescription, RigType))
			end
		end)
	end))
	table.insert(List, AvatarEditorService.OpenAllowInventoryReadAccess:Connect(function() --[[ Line: 36 ]]
		-- upvalues: p1 (copy), OpenPromptModule (upval), PromptTypeModule (upval)
		p1:dispatch(OpenPromptModule(PromptTypeModule.AllowInventoryReadAccess, {}))
	end))
	table.insert(List, AvatarEditorService.OpenPromptCreateOufit:Connect(function(HumanoidDescription, RigType) --[[ Line: 43 ]]
		-- upvalues: p1 (copy), OpenPromptModule (upval), PromptTypeModule (upval)
		p1:dispatch(OpenPromptModule(PromptTypeModule.CreateOutfit, {
			humanoidDescription = HumanoidDescription,
			rigType = RigType
		}))
	end))
	table.insert(List, AvatarEditorService.OpenPromptSetFavorite:Connect(function(ItemId, ItemType, ShouldFavorite) --[[ Line: 53 ]]
		-- upvalues: p1 (copy), OpenSetFavoritePromptModule (upval)
		p1:dispatch(OpenSetFavoritePromptModule(ItemId, ItemType, ShouldFavorite))
	end))
	table.insert(List, AvatarEditorService.OpenPromptDeleteOutfit:Connect(function(OutfitId) --[[ Line: 60 ]]
		-- upvalues: p1 (copy), OpenDeleteOutfitPromptModule (upval)
		p1:dispatch(OpenDeleteOutfitPromptModule(OutfitId))
	end))
	table.insert(List, AvatarEditorService.OpenPromptRenameOutfit:Connect(function(OutfitId) --[[ Line: 67 ]]
		-- upvalues: p1 (copy), OpenRenameOutfitPromptModule (upval)
		p1:dispatch(OpenRenameOutfitPromptModule(OutfitId))
	end))
	table.insert(List, AvatarEditorService.OpenPromptUpdateOutfit:Connect(function(OutfitId, HumanoidDescription, RigType) --[[ Line: 74 ]]
		-- upvalues: p1 (copy), OpenUpdateOutfitPromptModule (upval)
		p1:dispatch(OpenUpdateOutfitPromptModule(OutfitId, HumanoidDescription, RigType))
	end))
	
	return List
end