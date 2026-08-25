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

local function dispatchIfPlayerExists(p0, p1, p2)
	local var23 = false
	
	for i, v in ipairs(p0:getState().players) do
		if p1 == v then
			var23 = true
			break
		end
	end
	if var23 then
		p0:dispatch(p2)
	end
end

local function _(p3)
	-- upvalues: fFlagInExperienceUserProfileSettingsEnabledModule (ref), playerPermissionsModule (ref)
	return fFlagInExperienceUserProfileSettingsEnabledModule and playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(p3)
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
			local var24 = playerIconInfoStore.getPlayerIconInfoReactive(p5.UserId)(false)
			playerIconInfoStore.setPlayerIconInfo(p5.UserId, {
				isPlaceOwner = var24.isPlaceOwner,
				avatarIcon = var24.avatarIcon,
				specialGroupIcon = intern
			})
			
			return
		end
		dispatchIfPlayerExists(p4, p5, setPlayerSpecialGroupIconModule(p5, if not (if fFlagInExperienceUserProfileSettingsEnabledModule and playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(p5) then true else false) then intern else nil))
		
		return
	elseif playerPermissionsModule.IsPlayerAdminAsync(p5) then
		if fFlagReplacePlayerIconRoduxWithSignal then
			local var25 = playerIconInfoStore.getPlayerIconInfoReactive(p5.UserId)(false)
			playerIconInfoStore.setPlayerIconInfo(p5.UserId, {
				isPlaceOwner = var25.isPlaceOwner,
				avatarIcon = var25.avatarIcon,
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
			local var26 = playerIconInfoStore.getPlayerIconInfoReactive(p5.UserId)(false)
			playerIconInfoStore.setPlayerIconInfo(p5.UserId, {
				isPlaceOwner = var26.isPlaceOwner,
				avatarIcon = var26.avatarIcon,
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
			local var27 = playerIconInfoStore.getPlayerIconInfoReactive(p5.UserId)(false)
			playerIconInfoStore.setPlayerIconInfo(p5.UserId, {
				isPlaceOwner = var27.isPlaceOwner,
				avatarIcon = var27.avatarIcon,
				specialGroupIcon = t.Intern
			})
			
			return
		elseif not (if fFlagInExperienceUserProfileSettingsEnabledModule and playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(p5) then true else false) then
			dispatchIfPlayerExists(p4, p5, setPlayerSpecialGroupIconModule(p5, t.Intern))
		end
	end
end

local function getGameCreator(p6, p7)
	-- upvalues: enableBadgeCheckForUserCreator (ref), playerPermissionsModule (ref), fFlagReplacePlayerIconRoduxWithSignal (ref), playerIconInfoStore (ref), fFlagInExperienceUserProfileSettingsEnabledModule (ref), dispatchIfPlayerExists (ref), setPlayerIsCreatorModule (ref)
	if not enableBadgeCheckForUserCreator and game.CreatorType ~= Enum.CreatorType.Group then return end
	if playerPermissionsModule.CanPlayerManagePlaceAsync(p7) then
		if fFlagReplacePlayerIconRoduxWithSignal then
			local var28 = playerIconInfoStore.getPlayerIconInfoReactive(p7.UserId)(false)
			playerIconInfoStore.setPlayerIconInfo(p7.UserId, {
				isPlaceOwner = true,
				avatarIcon = var28.avatarIcon,
				specialGroupIcon = var28.specialGroupIcon
			})
			
			return
		elseif not (if fFlagInExperienceUserProfileSettingsEnabledModule and playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(p7) then true else false) then
			dispatchIfPlayerExists(p6, p7, setPlayerIsCreatorModule(p7, true))
		end
	end
end

local function getPlayerAvatarIcon(p8, p9)
	-- upvalues: fFlagEnableMobilePlayerListOnConsole (ref), tenFootInterfaceModule (ref), fFlagReplacePlayerIconRoduxWithSignal (ref), playerIconInfoStore (ref), dispatchIfPlayerExists (ref), setPlayerAvatarIconModule (ref)
	if fFlagEnableMobilePlayerListOnConsole or not tenFootInterfaceModule:IsEnabled() then return end
	local text = "rbxthumb://type=Avatar&id=" .. p9.UserId .. "&w=100&h=100"
	
	if fFlagReplacePlayerIconRoduxWithSignal then
		local var30 = playerIconInfoStore.getPlayerIconInfoReactive(p9.UserId)(false)
		playerIconInfoStore.setPlayerIconInfo(p9.UserId, {
			isPlaceOwner = var30.isPlaceOwner,
			avatarIcon = text,
			specialGroupIcon = var30.specialGroupIcon
		})
		
		return
	end
	dispatchIfPlayerExists(p8, p9, setPlayerAvatarIconModule(p9, text))
end

local function getPlayerIsBlocked(p10, p11)
	-- upvalues: blockingUtilityModule (ref), dispatchIfPlayerExists (ref), setPlayerIsBlockedModule (ref)
	if blockingUtilityModule:IsPlayerBlockedByUserId(p11.UserId) then
		dispatchIfPlayerExists(p10, p11, setPlayerIsBlockedModule(p11, true))
	end
end

local function getPlayerFriendStatus(p12, p13)
	-- upvalues: playersService (ref), dispatchIfPlayerExists (ref), setPlayerFriendStatusModule (ref)
	if p13 ~= playersService.LocalPlayer and p13.Parent == playersService and playersService.LocalPlayer.Parent == playersService then
		dispatchIfPlayerExists(p12, p13, setPlayerFriendStatusModule(p13, playersService.LocalPlayer:GetFriendStatus(p13)))
	end
end

return function(p14)
	-- upvalues: fFlagReplacePlayerIconRoduxWithSignal (ref), fFlagInExperienceUserProfileSettingsEnabledModule (ref), playerPermissionsModule (ref), playerIconInfoStore (ref), getGroupsPermissionsInfo (ref), getGameCreator (ref), getPlayerAvatarIcon (ref), getPlayerIsBlocked (ref), getPlayerFriendStatus (ref)
	return function(p15)
		-- upvalues: fFlagReplacePlayerIconRoduxWithSignal (copy), p14 (ref), fFlagInExperienceUserProfileSettingsEnabledModule (copy), playerPermissionsModule (copy), playerIconInfoStore (copy), getGroupsPermissionsInfo (copy), getGameCreator (copy), getPlayerAvatarIcon (copy), getPlayerIsBlocked (copy), getPlayerFriendStatus (copy)
		if fFlagReplacePlayerIconRoduxWithSignal then
			coroutine.wrap(function()
				-- upvalues: p14 (copy), fFlagInExperienceUserProfileSettingsEnabledModule (copy), playerPermissionsModule (copy), playerIconInfoStore (copy), getGroupsPermissionsInfo (copy), p15 (ref), getGameCreator (copy), getPlayerAvatarIcon (copy)
				if if fFlagInExperienceUserProfileSettingsEnabledModule and playerPermissionsModule.IsPlayerInExperienceNameEnabledAsync(p14) then true else false then
					playerIconInfoStore.setPlayerIconInfo(p14.UserId, {
						isPlaceOwner = false,
						avatarIcon = nil,
						specialGroupIcon = nil
					})
					
					return
				end
				coroutine.wrap(getGroupsPermissionsInfo)(p15, p14)
				coroutine.wrap(getGameCreator)(p15, p14)
				coroutine.wrap(getPlayerAvatarIcon)(p15, p14)
			end)()
		else
			coroutine.wrap(getGroupsPermissionsInfo)(p15, p14)
			coroutine.wrap(getGameCreator)(p15, p14)
			coroutine.wrap(getPlayerAvatarIcon)(p15, p14)
		end
		coroutine.wrap(getPlayerIsBlocked)(p15, p14)
		coroutine.wrap(getPlayerFriendStatus)(p15, p14)
	end
end