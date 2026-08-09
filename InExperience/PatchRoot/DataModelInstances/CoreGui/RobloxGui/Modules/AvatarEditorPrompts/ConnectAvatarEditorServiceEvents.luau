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
local fFlagAXAvatarTimeoutFlowIE = require(corePackagesService.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE

return function(p0) --[[ line: 18 | named "ConnectAvatarEditorServiceEvents" ]]
	-- upvalues: avatarEditorService (ref), fFlagAXAvatarTimeoutFlowIE (ref), avatarExperienceCommonModule (ref), openPromptModule (ref), promptTypeModule (ref), openSaveAvatarPromptModule (ref), openSetFavoritePromptModule (ref), openDeleteOutfitPromptModule (ref), openRenameOutfitPromptModule (ref), openUpdateOutfitPromptModule (ref)
	local t = {}
	table.insert(t, avatarEditorService.OpenPromptSaveAvatar:Connect(function(p1, p2) --[[ line: 21 ]]
		-- upvalues: fFlagAXAvatarTimeoutFlowIE (copy), avatarExperienceCommonModule (copy), p0 (ref), openPromptModule (copy), promptTypeModule (copy), openSaveAvatarPromptModule (copy)
		if fFlagAXAvatarTimeoutFlowIE then
			avatarExperienceCommonModule.Stores.getTimeoutStatusStore().fetchStatusAsync():andThen(function(p3) --[[ line: 24 ]]
				-- upvalues: p0 (copy), openPromptModule (copy), promptTypeModule (copy), openSaveAvatarPromptModule (copy), p1 (ref), p2 (ref)
				if p3.isTimedOut then
					p0:dispatch(openPromptModule(promptTypeModule.SaveAvatarTimeout, {}))
					
					return
				end
				p0:dispatch(openSaveAvatarPromptModule(p1, p2))
			end)
			
			return
		end
		p0:dispatch(openSaveAvatarPromptModule(p1, p2))
	end))
	table.insert(t, avatarEditorService.OpenAllowInventoryReadAccess:Connect(function() --[[ line: 36 ]]
		-- upvalues: p0 (ref), openPromptModule (copy), promptTypeModule (copy)
		p0:dispatch(openPromptModule(promptTypeModule.AllowInventoryReadAccess, {}))
	end))
	table.insert(t, avatarEditorService.OpenPromptCreateOufit:Connect(function(p4, p5) --[[ line: 40 ]]
		-- upvalues: p0 (ref), openPromptModule (copy), promptTypeModule (copy)
		p0:dispatch(openPromptModule(promptTypeModule.CreateOutfit, { humanoidDescription = p4, rigType = p5 }))
	end))
	table.insert(t, avatarEditorService.OpenPromptSetFavorite:Connect(function(p6, p7, p8) --[[ line: 47 ]]
		-- upvalues: p0 (ref), openSetFavoritePromptModule (copy)
		p0:dispatch(openSetFavoritePromptModule(p6, p7, p8))
	end))
	table.insert(t, avatarEditorService.OpenPromptDeleteOutfit:Connect(function(p9) --[[ line: 51 ]]
		-- upvalues: p0 (ref), openDeleteOutfitPromptModule (copy)
		p0:dispatch(openDeleteOutfitPromptModule(p9))
	end))
	table.insert(t, avatarEditorService.OpenPromptRenameOutfit:Connect(function(p10) --[[ line: 55 ]]
		-- upvalues: p0 (ref), openRenameOutfitPromptModule (copy)
		p0:dispatch(openRenameOutfitPromptModule(p10))
	end))
	table.insert(t, avatarEditorService.OpenPromptUpdateOutfit:Connect(function(p11, p12, p13) --[[ line: 59 ]]
		-- upvalues: p0 (ref), openUpdateOutfitPromptModule (copy)
		p0:dispatch(openUpdateOutfitPromptModule(p11, p12, p13))
	end))
	
	return t
end