local CorePackages = game:GetService("CorePackages")
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PromiseModule = require(CorePackages.Packages.Promise)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local RevokeOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Actions.RevokeOutfit)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local config = {
	toastMessage = "Feature.Avatar.Message.FailedDeleteCostume",
	isLocalized = false,
	toastType = require(Modules.LuaApp.Enum.ToastType).InformationMessage
}

local function _(Text): string
	-- upvalues: ConstantsModule (copy)
	return ConstantsModule.DeleteOutfitsKey .. Text
end

return function(p1)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), ConstantsModule (copy), PromiseModule (copy), UtilsModule (copy), RevokeOutfitModule (copy), SetCurrentToastMessageModule (copy), config (copy)
	ArgCheckModule.isType(p1, "string", "DeleteOutfit thunk expects id to be a string")
	
	return function(p2, p3)
		-- upvalues: PerformFetch (upval), p1 (copy), ConstantsModule (upval), PromiseModule (upval), UtilsModule (upval), RevokeOutfitModule (upval), SetCurrentToastMessageModule (upval), config (upval)
		local AvatarEditorService = p3.avatarEditorService
		
		return PerformFetch.Single(ConstantsModule.DeleteOutfitsKey .. p1, function(p4)
			-- upvalues: PromiseModule (upval), UtilsModule (upval), AvatarEditorService (copy), p1 (upval), RevokeOutfitModule (upval), SetCurrentToastMessageModule (upval), config (upval)
			return PromiseModule.new(function(Callback: () -> (), Callback1: () -> ())
				-- upvalues: UtilsModule (upval), AvatarEditorService (upval), p1 (upval), p4 (copy), RevokeOutfitModule (upval), SetCurrentToastMessageModule (upval), config (upval)
				if UtilsModule.doAESCallAndAwaitResult(AvatarEditorService, AvatarEditorService.NoPromptDeleteOutfit, AvatarEditorService.PromptDeleteOutfitCompleted, p1) == Enum.AvatarPromptResult.Success then
					p4:dispatch(RevokeOutfitModule(p1))
					Callback()
					
					return
				else
					p4:dispatch(SetCurrentToastMessageModule(config))
					Callback1()
				end
			end)
		end)(p2)
	end
end