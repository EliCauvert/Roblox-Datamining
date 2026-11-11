local CorePackages = game:GetService("CorePackages")
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PromiseModule = require(CorePackages.Packages.Promise)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local OutfitRenamedModule = require(Modules.AvatarExperience.AvatarEditor.Actions.OutfitRenamed)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local FFlagAXUpdateSlotBasedEditorToastAndPrompts = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXUpdateSlotBasedEditorToastAndPrompts
local config = {
	isLocalized = false,
	toastMessage = if FFlagAXUpdateSlotBasedEditorToastAndPrompts then "Feature.Avatar.Message.AvatarRenamed" else "Feature.Avatar.Message.RenameCostumeSuccess",
	toastType = ToastTypeModule.InformationMessage
}
local config1 = {
	isLocalized = false,
	toastMessage = if FFlagAXUpdateSlotBasedEditorToastAndPrompts then "Feature.Avatar.Message.FailedAvatarRename" else "Feature.Avatar.Message.FailedRenameCostume",
	toastType = ToastTypeModule.InformationMessage
}

local function _(Text): string
	-- upvalues: ConstantsModule (copy)
	return ConstantsModule.RenameOutfitKey .. Text
end

return function(p1, p2, p3)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), ConstantsModule (copy), PromiseModule (copy), UtilsModule (copy), OutfitRenamedModule (copy), SetCurrentToastMessageModule (copy), config (copy), config1 (copy)
	ArgCheckModule.isType(p1, "table", "RenameOutfit thunk expects avatarEditorAnalytics to be a table")
	ArgCheckModule.isType(p2, "string", "RenameOutfit thunk expects id to be a string")
	ArgCheckModule.isType(p3, "string", "RenameOutfit thunk expects name to be a string")
	
	return function(p4, p5)
		-- upvalues: PerformFetch (upval), p2 (copy), ConstantsModule (upval), PromiseModule (upval), UtilsModule (upval), p3 (copy), OutfitRenamedModule (upval), SetCurrentToastMessageModule (upval), config (upval), config1 (upval)
		local AvatarEditorService = p5.avatarEditorService
		
		return PerformFetch.Single(ConstantsModule.RenameOutfitKey .. p2, function(p6)
			-- upvalues: PromiseModule (upval), UtilsModule (upval), AvatarEditorService (copy), p2 (upval), p3 (upval), OutfitRenamedModule (upval), SetCurrentToastMessageModule (upval), config (upval), config1 (upval)
			return PromiseModule.new(function(Callback: () -> (), Callback1: () -> ())
				-- upvalues: UtilsModule (upval), AvatarEditorService (upval), p2 (upval), p3 (upval), p6 (copy), OutfitRenamedModule (upval), SetCurrentToastMessageModule (upval), config (upval), config1 (upval)
				if UtilsModule.doAESCallAndAwaitResult(AvatarEditorService, AvatarEditorService.NoPromptRenameOutfit, AvatarEditorService.PromptRenameOutfitCompleted, p2, p3) == Enum.AvatarPromptResult.Success then
					p6:dispatch(OutfitRenamedModule(p2, p3))
					p6:dispatch(SetCurrentToastMessageModule(config))
					Callback()
					
					return
				else
					p6:dispatch(SetCurrentToastMessageModule(config1))
					Callback1()
				end
			end)
		end)(p4)
	end
end