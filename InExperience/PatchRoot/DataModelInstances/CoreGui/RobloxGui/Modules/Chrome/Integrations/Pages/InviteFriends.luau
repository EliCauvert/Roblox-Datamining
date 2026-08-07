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
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagChromeActivatedMappedSignal = sharedFlagsModule.FFlagChromeActivatedMappedSignal
local var10 = signal.new()
local var11 = mappedSignal.new(var10, function() --[[ line: 26 ]]
	-- upvalues: gameInviteModalManager (ref)
	return gameInviteModalManager:isGameModalOpen()
end)
gameInviteModalManager.ToggleGameInviteModalEvent.Event:Connect(function() --[[ line: 29 ]]
	-- upvalues: var10 (ref)
	var10:fire()
end)

local function _() --[[ line: 33 | named "shouldShowInviteFriends" ]]
	-- upvalues: runService (ref), playersService (ref)
	return not runService:IsStudio() and (playersService.LocalPlayer ~= nil and playersService.LocalPlayer.UserId > 0)
end

return serviceModule:register({
	id = "invite_friends",
	initialAvailability = if not runService:IsStudio() and (playersService.LocalPlayer ~= nil and playersService.LocalPlayer.UserId > 0) then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable,
	label = if fFlagConnectionsToFriendsRename then "CoreScripts.InGameMenu.PageTitle.InviteFriends" else "CommonUI.Features.Label.InviteConnections",
	sideSheetPlacement = sideSheetPlacement.Vertical,
	activated = inGameMenuIntegrationUtilsModule.toggleInviteFriendsPage,
	isActivated = if fFlagChromeActivatedMappedSignal then var11 else function() --[[ line: 49 ]]
		-- upvalues: var11 (ref)
		return var11:get()
	end,
	components = {
		Icon = function() --[[ line: 53 ]]
			-- upvalues: commonIconModule (ref), var11 (ref)
			return commonIconModule("PersonArrowFromBottomRight", nil, var11)
		end
	}
})