local coreGuiService = game:GetService("CoreGui")
local playersService = game:GetService("Players")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local playerPermissionsModule = require(robloxGui.Modules.PlayerPermissionsModule)
local tenFootInterfaceModule = require(robloxGui.Modules.TenFootInterface)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local fFlagInExperienceUserProfileSettingsEnabledModule = require(robloxGui.Modules.Common.Flags.FFlagInExperienceUserProfileSettingsEnabled)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagBadgeVisibilitySettingEnabled = sharedFlagsModule.FFlagBadgeVisibilitySettingEnabled
local fFlagReplacePlayerIconRoduxWithSignal = sharedFlagsModule.FFlagReplacePlayerIconRoduxWithSignal
local fFlagEnableMobilePlayerListOnConsole = playerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local enableBadgeCheckForUserCreator = game:DefineFastFlag("EnableBadgeCheckForUserCreator", false)
local playerIconInfoStore = require(corePackagesService.Workspace.Packages.PlayerIconInfoStore).PlayerIconInfoStore
local images = require(corePackagesService.Packages.UIBlox).App.ImageSet.Images
local parent = script.Parent.Parent
local t = {
	Admin = images["icons/status/player/admin"],
	Intern = images["icons/status/player/intern"],
	Star = images["icons/status/player/videostar"]
}
local setPlayerSpecialGroupIconModule = require(parent.Actions.SetPlayerSpecialGroupIcon)
local setPlayerIsCreatorModule = require(parent.Actions.SetPlayerIsCreator)
local setPlayerAvatarIconModule = require(parent.Actions.SetPlayerAvatarIcon)
local setPlayerIsBlockedModule = require(parent.Actions.SetPlayerIsBlocked)
local setPlayerFriendStatusModule = require(parent.Actions.SetPlayerFriendStatus)

local function dispatchIfPlayerExists(p1, p2, p3)
	local var1 = false
	
	for i, v in ipairs(p1:getState().players) do
		if p2 == v then
			var1 = true
			break
		end
	end
	if var1 then
		p1:dispatch(p3)
	end
end

local function _(p4)
	-- upvalues: fFlagInExperienceUserProfileSettingsEnabledModule (ref), playerPermissionsModule (ref)
	return fFlagInExperienceUserProfileSettingsEnabledModule and playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(p4)
end

local function getGroupsPermissionsInfo(p4, p5)
	-- upvalues: fFlagBadgeVisibilitySettingEnabled (ref), playerPermissionsModule (ref), t (ref), fFlagReplacePlayerIconRoduxWithSignal (ref), playerIconInfoStore (ref), fFlagInExperienceUserProfileSettingsEnabledModule (ref), dispatchIfPlayerExists (ref), setPlayerSpecialGroupIconModule (ref)
	if fFlagBadgeVisibilitySettingEnabled then
		local intern = nil
		
		if playerPermissionsModule.IsPlayerAdminAsync(p5) then
			intern = t.Admin
		elseif playerPermissionsModule.IsPlayerStarAsync(p5) then
			intern = t.Star
		elseif playerPermissionsModule.IsPlayerInternAsync(p5) then
			intern = t.Intern
		end
		if not intern then return end
		if fFlagReplacePlayerIconRoduxWithSignal then
			local var2 = playerIconInfoStore.getPlayerIconInfoReactive(p5.UserId)(false)
			playerIconInfoStore.setPlayerIconInfo(p5.UserId, {
				isPlaceOwner = var2.isPlaceOwner,
				avatarIcon = var2.avatarIcon,
				specialGroupIcon = intern
			})
			
			return
		end
		dispatchIfPlayerExists(p4, p5, setPlayerSpecialGroupIconModule(p5, if not (if fFlagInExperienceUserProfileSettingsEnabledModule and playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(p5) then true else false) then intern else nil))
		
		return
	elseif playerPermissionsModule.IsPlayerAdminAsync(p5) then
		if fFlagReplacePlayerIconRoduxWithSignal then
			local var3 = playerIconInfoStore.getPlayerIconInfoReactive(p5.UserId)(false)
			playerIconInfoStore.setPlayerIconInfo(p5.UserId, {
				isPlaceOwner = var3.isPlaceOwner,
				avatarIcon = var3.avatarIcon,
				specialGroupIcon = t.Admin
			})
			
			return
		elseif if fFlagInExperienceUserProfileSettingsEnabledModule and playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(p5) then true else false then
		else
			dispatchIfPlayerExists(p4, p5, setPlayerSpecialGroupIconModule(p5, t.Admin))
			
			return
		end
	elseif playerPermissionsModule.IsPlayerStarAsync(p5) then
		if fFlagReplacePlayerIconRoduxWithSignal then
			local var4 = playerIconInfoStore.getPlayerIconInfoReactive(p5.UserId)(false)
			playerIconInfoStore.setPlayerIconInfo(p5.UserId, {
				isPlaceOwner = var4.isPlaceOwner,
				avatarIcon = var4.avatarIcon,
				specialGroupIcon = t.Star
			})
			
			return
		elseif if fFlagInExperienceUserProfileSettingsEnabledModule and playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(p5) then true else false then
		else
			dispatchIfPlayerExists(p4, p5, setPlayerSpecialGroupIconModule(p5, t.Star))
			
			return
		end
	elseif playerPermissionsModule.IsPlayerInternAsync(p5) then
		if fFlagReplacePlayerIconRoduxWithSignal then
			local var5 = playerIconInfoStore.getPlayerIconInfoReactive(p5.UserId)(false)
			playerIconInfoStore.setPlayerIconInfo(p5.UserId, {
				isPlaceOwner = var5.isPlaceOwner,
				avatarIcon = var5.avatarIcon,
				specialGroupIcon = t.Intern
			})
			
			return
		elseif not (if fFlagInExperienceUserProfileSettingsEnabledModule and playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(p5) then true else false) then
			dispatchIfPlayerExists(p4, p5, setPlayerSpecialGroupIconModule(p5, t.Intern))
		end
	end
end

local function getGameCreator(p4, p5)
	-- upvalues: enableBadgeCheckForUserCreator (ref), playerPermissionsModule (ref), fFlagReplacePlayerIconRoduxWithSignal (ref), playerIconInfoStore (ref), fFlagInExperienceUserProfileSettingsEnabledModule (ref), dispatchIfPlayerExists (ref), setPlayerIsCreatorModule (ref)
	if not enableBadgeCheckForUserCreator and game.CreatorType ~= Enum.CreatorType.Group then return end
	if playerPermissionsModule.CanPlayerManagePlaceAsync(p5) then
		if fFlagReplacePlayerIconRoduxWithSignal then
			local var2 = playerIconInfoStore.getPlayerIconInfoReactive(p5.UserId)(false)
			playerIconInfoStore.setPlayerIconInfo(p5.UserId, {
				isPlaceOwner = true,
				avatarIcon = var2.avatarIcon,
				specialGroupIcon = var2.specialGroupIcon
			})
			
			return
		elseif not (if fFlagInExperienceUserProfileSettingsEnabledModule and playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(p5) then true else false) then
			dispatchIfPlayerExists(p4, p5, setPlayerIsCreatorModule(p5, true))
		end
	end
end

local function getPlayerAvatarIcon(p4, p5)
	-- upvalues: fFlagEnableMobilePlayerListOnConsole (ref), tenFootInterfaceModule (ref), fFlagReplacePlayerIconRoduxWithSignal (ref), playerIconInfoStore (ref), dispatchIfPlayerExists (ref), setPlayerAvatarIconModule (ref)
	if fFlagEnableMobilePlayerListOnConsole or not tenFootInterfaceModule:IsEnabled() then return end
	local text = "rbxthumb://type=Avatar&id=" .. p9.UserId .. "&w=100&h=100"
	
	if fFlagReplacePlayerIconRoduxWithSignal then
		local var2 = playerIconInfoStore.getPlayerIconInfoReactive(p5.UserId)(false)
		playerIconInfoStore.setPlayerIconInfo(p5.UserId, {
			isPlaceOwner = var2.isPlaceOwner,
			avatarIcon = text,
			specialGroupIcon = var2.specialGroupIcon
		})
		
		return
	end
	dispatchIfPlayerExists(p4, p5, setPlayerAvatarIconModule(p5, text))
end

local function getPlayerIsBlocked(p4, p5)
	-- upvalues: blockingUtilityModule (ref), dispatchIfPlayerExists (ref), setPlayerIsBlockedModule (ref)
	if blockingUtilityModule:IsPlayerBlockedByUserId(p5.UserId) then
		dispatchIfPlayerExists(p4, p5, setPlayerIsBlockedModule(p5, true))
	end
end

local function getPlayerFriendStatus(p4, p5)
	-- upvalues: playersService (ref), dispatchIfPlayerExists (ref), setPlayerFriendStatusModule (ref)
	if p5 ~= playersService.LocalPlayer and p5.Parent == playersService and playersService.LocalPlayer.Parent == playersService then
		dispatchIfPlayerExists(p4, p5, setPlayerFriendStatusModule(p5, playersService.LocalPlayer:GetFriendStatus(p5)))
	end
end

return function(p4)
	-- upvalues: fFlagReplacePlayerIconRoduxWithSignal (ref), fFlagInExperienceUserProfileSettingsEnabledModule (ref), playerPermissionsModule (ref), playerIconInfoStore (ref), getGroupsPermissionsInfo (ref), getGameCreator (ref), getPlayerAvatarIcon (ref), getPlayerIsBlocked (ref), getPlayerFriendStatus (ref)
	return function(p5)
		-- upvalues: fFlagReplacePlayerIconRoduxWithSignal (copy), p4 (ref), fFlagInExperienceUserProfileSettingsEnabledModule (copy), playerPermissionsModule (copy), playerIconInfoStore (copy), getGroupsPermissionsInfo (copy), getGameCreator (copy), getPlayerAvatarIcon (copy), getPlayerIsBlocked (copy), getPlayerFriendStatus (copy)
		if fFlagReplacePlayerIconRoduxWithSignal then
			coroutine.wrap(function()
				-- upvalues: p4 (copy), fFlagInExperienceUserProfileSettingsEnabledModule (copy), playerPermissionsModule (copy), playerIconInfoStore (copy), getGroupsPermissionsInfo (copy), p5 (ref), getGameCreator (copy), getPlayerAvatarIcon (copy)
				if if fFlagInExperienceUserProfileSettingsEnabledModule and playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(p4) then true else false then
					playerIconInfoStore.setPlayerIconInfo(p4.UserId, {
						isPlaceOwner = false,
						avatarIcon = nil,
						specialGroupIcon = nil
					})
					
					return
				end
				coroutine.wrap(getGroupsPermissionsInfo)(p5, p4)
				coroutine.wrap(getGameCreator)(p5, p4)
				coroutine.wrap(getPlayerAvatarIcon)(p5, p4)
			end)()
		else
			coroutine.wrap(getGroupsPermissionsInfo)(p5, p4)
			coroutine.wrap(getGameCreator)(p5, p4)
			coroutine.wrap(getPlayerAvatarIcon)(p5, p4)
		end
		coroutine.wrap(getPlayerIsBlocked)(p5, p4)
		coroutine.wrap(getPlayerFriendStatus)(p5, p4)
	end
end