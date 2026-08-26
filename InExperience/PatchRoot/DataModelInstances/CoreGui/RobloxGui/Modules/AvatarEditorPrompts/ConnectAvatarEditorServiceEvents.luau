local avatarEditorService = game:GetService("AvatarEditorService")
local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent
local openPromptModule = require(parent.Actions.OpenPrompt)
local promptTypeModule = require(parent.PromptType)
local openSetFavoritePromptModule = require(parent.Thunks.OpenSetFavoritePrompt)
local openSaveAvatarPromptModule = require(parent.Thunks.OpenSaveAvatarPrompt)
local openDeleteOutfitPromptModule = require(parent.Thunks.OpenDeleteOutfitPrompt)
local openRenameOutfitPromptModule = require(parent.Thunks.OpenRenameOutfitPrompt)
local openUpdateOutfitPromptModule = require(parent.Thunks.OpenUpdateOutfitPrompt)
local avatarExperienceCommonModule = require(corePackagesService.Workspace.Packages.AvatarExperienceCommon)

return function(p1)
	-- upvalues: avatarEditorService (ref), avatarExperienceCommonModule (ref), openPromptModule (ref), promptTypeModule (ref), openSaveAvatarPromptModule (ref), openSetFavoritePromptModule (ref), openDeleteOutfitPromptModule (ref), openRenameOutfitPromptModule (ref), openUpdateOutfitPromptModule (ref)
	local t = {}
	table.insert(t, avatarEditorService.OpenPromptSaveAvatar:Connect(function(p2, p3)
		-- upvalues: avatarExperienceCommonModule (copy), p1 (ref), openPromptModule (copy), promptTypeModule (copy), openSaveAvatarPromptModule (copy)
		avatarExperienceCommonModule.Stores.getTimeoutStatusStore().fetchStatusAsync():andThen(function(p4)
			-- upvalues: p1 (copy), openPromptModule (copy), promptTypeModule (copy), openSaveAvatarPromptModule (copy), p2 (ref), p3 (ref)
			if p4.isTimedOut then
				p1:dispatch(openPromptModule(promptTypeModule.SaveAvatarTimeout, {}))
				
				return
			end
			p1:dispatch(openSaveAvatarPromptModule(p2, p3))
		end)
	end))
	table.insert(t, avatarEditorService.OpenAllowInventoryReadAccess:Connect(function()
		-- upvalues: p1 (ref), openPromptModule (copy), promptTypeModule (copy)
		p1:dispatch(openPromptModule(promptTypeModule.AllowInventoryReadAccess, {}))
	end))
	table.insert(t, avatarEditorService.OpenPromptCreateOufit:Connect(function(p2, p3)
		-- upvalues: p1 (ref), openPromptModule (copy), promptTypeModule (copy)
		p1:dispatch(openPromptModule(promptTypeModule.CreateOutfit, { humanoidDescription = p2, rigType = p3 }))
	end))
	table.insert(t, avatarEditorService.OpenPromptSetFavorite:Connect(function(p2, p3, p4)
		-- upvalues: p1 (ref), openSetFavoritePromptModule (copy)
		p1:dispatch(openSetFavoritePromptModule(p2, p3, p4))
	end))
	table.insert(t, avatarEditorService.OpenPromptDeleteOutfit:Connect(function(p2)
		-- upvalues: p1 (ref), openDeleteOutfitPromptModule (copy)
		p1:dispatch(openDeleteOutfitPromptModule(p2))
	end))
	table.insert(t, avatarEditorService.OpenPromptRenameOutfit:Connect(function(p2)
		-- upvalues: p1 (ref), openRenameOutfitPromptModule (copy)
		p1:dispatch(openRenameOutfitPromptModule(p2))
	end))
	table.insert(t, avatarEditorService.OpenPromptUpdateOutfit:Connect(function(p2, p3, p4)
		-- upvalues: p1 (ref), openUpdateOutfitPromptModule (copy)
		p1:dispatch(openUpdateOutfitPromptModule(p2, p3, p4))
	end))
	
	return t
end