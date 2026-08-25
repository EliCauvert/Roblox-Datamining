local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local chromeModule = require(corePackagesService.Workspace.Packages.Chrome)
local gameInviteModalManager = require(corePackagesService.Workspace.Packages.GameInvite).GameInviteModalManager
local appCommonLibModule = require(corePackagesService.Workspace.Packages.AppCommonLib)
local serviceModule = require(chrome.Service)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local mappedSignal = require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local sideSheetPlacement = chromeModule.Enums.SideSheetPlacement
local signal = appCommonLibModule.Signal
local inGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local fFlagConnectionsToFriendsRename = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagConnectionsToFriendsRename
local var9 = signal.new()
local var10 = mappedSignal.new(var9, function()
	-- upvalues: gameInviteModalManager (ref)
	return gameInviteModalManager:isGameModalOpen()
end)
gameInviteModalManager.ToggleGameInviteModalEvent.Event:Connect(function()
	-- upvalues: var9 (ref)
	var9:fire()
end)

local function _()
	-- upvalues: runService (ref), playersService (ref)
	return not runService:IsStudio() and (playersService.LocalPlayer ~= nil and playersService.LocalPlayer.UserId > 0)
end

return serviceModule:register({
	id = "invite_friends",
	initialAvailability = if not runService:IsStudio() and (playersService.LocalPlayer ~= nil and playersService.LocalPlayer.UserId > 0) then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable,
	label = if fFlagConnectionsToFriendsRename then "CoreScripts.InGameMenu.PageTitle.InviteFriends" else "CommonUI.Features.Label.InviteConnections",
	sideSheetPlacement = sideSheetPlacement.Vertical,
	activated = inGameMenuIntegrationUtilsModule.toggleInviteFriendsPage,
	isActivated = var10,
	components = {
		Icon = function()
			-- upvalues: commonIconModule (ref), var10 (ref)
			return commonIconModule("PersonArrowFromBottomRight", nil, var10)
		end
	}
})