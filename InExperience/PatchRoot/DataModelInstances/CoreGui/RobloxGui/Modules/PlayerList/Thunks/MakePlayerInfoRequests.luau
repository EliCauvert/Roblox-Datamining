local Players = game:GetService("Players")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local PlayerPermissionsModule = require(RobloxGui.Modules.PlayerPermissionsModule)
local TenFootInterfaceModule = require(RobloxGui.Modules.TenFootInterface)
local BlockingUtilityModule = require(CorePackages.Workspace.Packages.BlockingUtility)
local FFlagInExperienceUserProfileSettingsEnabledModule = require(RobloxGui.Modules.Common.Flags.FFlagInExperienceUserProfileSettingsEnabled)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagBadgeVisibilitySettingEnabled = SharedFlagsModule.FFlagBadgeVisibilitySettingEnabled
local FFlagReplacePlayerIconRoduxWithSignal = SharedFlagsModule.FFlagReplacePlayerIconRoduxWithSignal
local FFlagEnableMobilePlayerListOnConsole = require(CorePackages.Workspace.Packages.PlayerList).Flags.FFlagEnableMobilePlayerListOnConsole
local EnableBadgeCheckForUserCreator = game:DefineFastFlag("EnableBadgeCheckForUserCreator", false)
local PlayerIconInfoStore = require(CorePackages.Workspace.Packages.PlayerIconInfoStore).PlayerIconInfoStore
local Images = require(CorePackages.Packages.UIBlox).App.ImageSet.Images
local Parent = script.Parent.Parent
local config = {
	Admin = Images["icons/status/player/admin"],
	Intern = Images["icons/status/player/intern"],
	Star = Images["icons/status/player/videostar"]
}
local SetPlayerSpecialGroupIconModule = require(Parent.Actions.SetPlayerSpecialGroupIcon)
local SetPlayerIsCreatorModule = require(Parent.Actions.SetPlayerIsCreator)
local SetPlayerAvatarIconModule = require(Parent.Actions.SetPlayerAvatarIcon)
local SetPlayerIsBlockedModule = require(Parent.Actions.SetPlayerIsBlocked)
local SetPlayerFriendStatusModule = require(Parent.Actions.SetPlayerFriendStatus)

local function dispatchIfPlayerExists(p1, Player, p2) --[[ Line: 47 ]]
	local Flag = false
	
	for _, player in ipairs(p1:getState().players) do
		if Player == player then
			Flag = true
			break
		end
	end
	if Flag then
		p1:dispatch(p2)
	end
end

local function _(p3): boolean --[[ Line: 61 | Named "isInExperienceNameEnabled" ]]
	-- upvalues: FFlagInExperienceUserProfileSettingsEnabledModule (copy), PlayerPermissionsModule (copy)
	return if FFlagInExperienceUserProfileSettingsEnabledModule and PlayerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(p3) then true else false
end

local function getGroupsPermissionsInfo(p3, Player: Player) --[[ Line: 70 ]]
	-- upvalues: FFlagBadgeVisibilitySettingEnabled (copy), PlayerPermissionsModule (copy), config (copy), FFlagReplacePlayerIconRoduxWithSignal (copy), PlayerIconInfoStore (copy), FFlagInExperienceUserProfileSettingsEnabledModule (copy), dispatchIfPlayerExists (copy), SetPlayerSpecialGroupIconModule (copy)
	if FFlagBadgeVisibilitySettingEnabled then
		local Admin = nil
		
		if PlayerPermissionsModule.IsPlayerAdminAsync(Player) then
			Admin = config.Admin
		elseif PlayerPermissionsModule.IsPlayerStarAsync(Player) then
			Admin = config.Star
		elseif PlayerPermissionsModule.IsPlayerInternAsync(Player) then
			Admin = config.Intern
		end
		if Admin then
			if FFlagReplacePlayerIconRoduxWithSignal then
				local v1 = PlayerIconInfoStore.getPlayerIconInfoReactive(Player.UserId)(false)
				PlayerIconInfoStore.setPlayerIconInfo(Player.UserId, {
					isPlaceOwner = v1.isPlaceOwner,
					avatarIcon = v1.avatarIcon,
					specialGroupIcon = Admin
				})
				
				return
			else
				dispatchIfPlayerExists(p3, Player, SetPlayerSpecialGroupIconModule(Player, not (if FFlagInExperienceUserProfileSettingsEnabledModule and PlayerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(Player) then true else false) and Admin or nil))
				
				return
			end
		end
	elseif PlayerPermissionsModule.IsPlayerAdminAsync(Player) then
		if FFlagReplacePlayerIconRoduxWithSignal then
			local v2 = PlayerIconInfoStore.getPlayerIconInfoReactive(Player.UserId)(false)
			PlayerIconInfoStore.setPlayerIconInfo(Player.UserId, {
				isPlaceOwner = v2.isPlaceOwner,
				avatarIcon = v2.avatarIcon,
				specialGroupIcon = config.Admin
			})
			
			return
		end
		if not (if FFlagInExperienceUserProfileSettingsEnabledModule and PlayerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(Player) then true else false) then
			dispatchIfPlayerExists(p3, Player, SetPlayerSpecialGroupIconModule(Player, config.Admin))
			
			return
		end
	elseif PlayerPermissionsModule.IsPlayerStarAsync(Player) then
		if FFlagReplacePlayerIconRoduxWithSignal then
			local v3 = PlayerIconInfoStore.getPlayerIconInfoReactive(Player.UserId)(false)
			PlayerIconInfoStore.setPlayerIconInfo(Player.UserId, {
				isPlaceOwner = v3.isPlaceOwner,
				avatarIcon = v3.avatarIcon,
				specialGroupIcon = config.Star
			})
			
			return
		end
		if not (if FFlagInExperienceUserProfileSettingsEnabledModule and PlayerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(Player) then true else false) then
			dispatchIfPlayerExists(p3, Player, SetPlayerSpecialGroupIconModule(Player, config.Star))
			
			return
		end
	elseif PlayerPermissionsModule.IsPlayerInternAsync(Player) then
		if FFlagReplacePlayerIconRoduxWithSignal then
			local v4 = PlayerIconInfoStore.getPlayerIconInfoReactive(Player.UserId)(false)
			PlayerIconInfoStore.setPlayerIconInfo(Player.UserId, {
				isPlaceOwner = v4.isPlaceOwner,
				avatarIcon = v4.avatarIcon,
				specialGroupIcon = config.Intern
			})
			
			return
		end
		if not (if FFlagInExperienceUserProfileSettingsEnabledModule and PlayerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(Player) then true else false) then
			dispatchIfPlayerExists(p3, Player, SetPlayerSpecialGroupIconModule(Player, config.Intern))
		end
	end
end

local function getGameCreator(p3, Player: Player) --[[ Line: 142 ]]
	-- upvalues: EnableBadgeCheckForUserCreator (copy), PlayerPermissionsModule (copy), FFlagReplacePlayerIconRoduxWithSignal (copy), PlayerIconInfoStore (copy), FFlagInExperienceUserProfileSettingsEnabledModule (copy), dispatchIfPlayerExists (copy), SetPlayerIsCreatorModule (copy)
	if not EnableBadgeCheckForUserCreator and game.CreatorType ~= Enum.CreatorType.Group then return end
	if PlayerPermissionsModule.CanPlayerManagePlaceAsync(Player) then
		if FFlagReplacePlayerIconRoduxWithSignal then
			local v1 = PlayerIconInfoStore.getPlayerIconInfoReactive(Player.UserId)(false)
			PlayerIconInfoStore.setPlayerIconInfo(Player.UserId, {
				isPlaceOwner = true,
				avatarIcon = v1.avatarIcon,
				specialGroupIcon = v1.specialGroupIcon
			})
			
			return
		end
		if not (if FFlagInExperienceUserProfileSettingsEnabledModule and PlayerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(Player) then true else false) then
			dispatchIfPlayerExists(p3, Player, SetPlayerIsCreatorModule(Player, true))
		end
	end
end

local function getPlayerAvatarIcon(p3, Player: Player) --[[ Line: 164 ]]
	-- upvalues: FFlagEnableMobilePlayerListOnConsole (copy), TenFootInterfaceModule (copy), FFlagReplacePlayerIconRoduxWithSignal (copy), PlayerIconInfoStore (copy), dispatchIfPlayerExists (copy), SetPlayerAvatarIconModule (copy)
	if FFlagEnableMobilePlayerListOnConsole or not TenFootInterfaceModule:IsEnabled() then return end
	local Text = "rbxthumb://type=Avatar&id=" .. Player.UserId .. "&w=100&h=100"
	
	if FFlagReplacePlayerIconRoduxWithSignal then
		local v1 = PlayerIconInfoStore.getPlayerIconInfoReactive(Player.UserId)(false)
		PlayerIconInfoStore.setPlayerIconInfo(Player.UserId, {
			isPlaceOwner = v1.isPlaceOwner,
			avatarIcon = Text,
			specialGroupIcon = v1.specialGroupIcon
		})
		
		return
	else
		dispatchIfPlayerExists(p3, Player, SetPlayerAvatarIconModule(Player, Text))
	end
end

local function getPlayerIsBlocked(p3, Player) --[[ Line: 183 ]]
	-- upvalues: BlockingUtilityModule (copy), dispatchIfPlayerExists (copy), SetPlayerIsBlockedModule (copy)
	if BlockingUtilityModule:IsPlayerBlockedByUserId(Player.UserId) then
		dispatchIfPlayerExists(p3, Player, SetPlayerIsBlockedModule(Player, true))
	end
end

local function getPlayerFriendStatus(p3, LocalPlayer) --[[ Line: 189 ]]
	-- upvalues: Players (copy), dispatchIfPlayerExists (copy), SetPlayerFriendStatusModule (copy)
	if LocalPlayer ~= Players.LocalPlayer and LocalPlayer.Parent == Players and Players.LocalPlayer.Parent == Players then
		dispatchIfPlayerExists(p3, LocalPlayer, SetPlayerFriendStatusModule(LocalPlayer, Players.LocalPlayer:GetFriendStatus(LocalPlayer)))
	end
end

return function(Player) --[[ Line: 199 | Named "MakePlayerInfoRequests" ]]
	-- upvalues: FFlagReplacePlayerIconRoduxWithSignal (copy), FFlagInExperienceUserProfileSettingsEnabledModule (copy), PlayerPermissionsModule (copy), PlayerIconInfoStore (copy), getGroupsPermissionsInfo (copy), getGameCreator (copy), getPlayerAvatarIcon (copy), getPlayerIsBlocked (copy), getPlayerFriendStatus (copy)
	return function(p3) --[[ Line: 200 ]]
		-- upvalues: FFlagReplacePlayerIconRoduxWithSignal (upval), Player (copy), FFlagInExperienceUserProfileSettingsEnabledModule (upval), PlayerPermissionsModule (upval), PlayerIconInfoStore (upval), getGroupsPermissionsInfo (upval), getGameCreator (upval), getPlayerAvatarIcon (upval), getPlayerIsBlocked (upval), getPlayerFriendStatus (upval)
		if FFlagReplacePlayerIconRoduxWithSignal then
			coroutine.wrap(function() --[[ Line: 202 ]]
				-- upvalues: Player (upval), FFlagInExperienceUserProfileSettingsEnabledModule (upval), PlayerPermissionsModule (upval), PlayerIconInfoStore (upval), getGroupsPermissionsInfo (upval), p3 (copy), getGameCreator (upval), getPlayerAvatarIcon (upval)
				if if FFlagInExperienceUserProfileSettingsEnabledModule and PlayerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(Player) then true else false then
					PlayerIconInfoStore.setPlayerIconInfo(Player.UserId, {
						isPlaceOwner = false,
						avatarIcon = nil,
						specialGroupIcon = nil
					})
					
					return
				else
					coroutine.wrap(getGroupsPermissionsInfo)(p3, Player)
					coroutine.wrap(getGameCreator)(p3, Player)
					coroutine.wrap(getPlayerAvatarIcon)(p3, Player)
				end
			end)()
		else
			coroutine.wrap(getGroupsPermissionsInfo)(p3, Player)
			coroutine.wrap(getGameCreator)(p3, Player)
			coroutine.wrap(getPlayerAvatarIcon)(p3, Player)
		end
		coroutine.wrap(getPlayerIsBlocked)(p3, Player)
		coroutine.wrap(getPlayerFriendStatus)(p3, Player)
	end
end