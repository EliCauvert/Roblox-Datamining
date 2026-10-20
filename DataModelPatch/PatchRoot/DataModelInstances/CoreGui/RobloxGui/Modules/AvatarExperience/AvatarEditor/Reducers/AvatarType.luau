local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag

return require(CorePackages.Packages.Rodux).createReducer(ConstantsModule.AvatarType.R15, {
	[require(Modules.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData).name] = function(p1, p2)
		-- upvalues: ConstantsModule (copy)
		local PlayerAvatarType = p2.avatarData.playerAvatarType
		
		return if PlayerAvatarType and ConstantsModule.AvatarType[PlayerAvatarType] == PlayerAvatarType then PlayerAvatarType else p1
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.SetAvatarType).name] = function(_, p1)
		return p1.avatarType
	end,
	[require(CorePackages.Workspace.Packages.AvatarExperienceCommon).State.Actions.CharacterHistoryStateChangeButtonActivated.name] = function(p1, p2)
		-- upvalues: FFlagAXRootSlotBasedEditorFlag (copy)
		return if FFlagAXRootSlotBasedEditorFlag and p2.equipped and p2.equipped.AvatarType then p2.equipped.AvatarType else p1
	end
})