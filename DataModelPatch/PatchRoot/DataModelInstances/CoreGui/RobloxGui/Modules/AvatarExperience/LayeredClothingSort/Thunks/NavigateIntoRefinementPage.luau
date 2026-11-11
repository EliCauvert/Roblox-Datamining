local CorePackages = game:GetService("CorePackages")
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SetEntryPageModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetEntryPage)
local LockCharacterUpdatesModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.LockCharacterUpdates)
local SendRefinementAnalyticsModule = require(Modules.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock

return function(p1, p2, p3, Callback)
	-- upvalues: SetEntryPageModule (copy), SendRefinementAnalyticsModule (copy), LockCharacterUpdatesModule (copy), AvatarScreen (copy), NavigateWithLockFunction (copy)
	return function(p4)
		-- upvalues: SetEntryPageModule (upval), p2 (copy), SendRefinementAnalyticsModule (upval), p3 (copy), Callback (copy), LockCharacterUpdatesModule (upval), p1 (copy), AvatarScreen (upval), NavigateWithLockFunction (upval)
		local State = p4:getState()
		
		if State.AvatarExperience.AvatarScene.Character.WaitingOnLayeredClothingUpdates or not State.AvatarExperience.AvatarEditor.Character.EquippedAssets then return end
		p4:dispatch(SetEntryPageModule(p2.opaque.name))
		p4:dispatch(SendRefinementAnalyticsModule(p3.avatarRefineButtonTap))
		
		if Callback then
			Callback()
		end
		p4:dispatch(NavigateWithLockFunction(function()
			-- upvalues: p4 (copy), LockCharacterUpdatesModule (upval), p1 (upval), AvatarScreen (upval)
			p4:dispatch(LockCharacterUpdatesModule())
			p1.navigate(AvatarScreen.AvatarRefinement)
		end))
	end
end