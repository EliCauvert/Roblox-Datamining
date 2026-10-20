local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local GameInviteModalManager = require(CorePackages.Workspace.Packages.GameInvite).GameInviteModalManager
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local InGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagConnectionsToFriendsRename = SharedFlagsModule.FFlagConnectionsToFriendsRename
local FFlagChromeActivatedMappedSignal = SharedFlagsModule.FFlagChromeActivatedMappedSignal
local NewResult = require(CorePackages.Workspace.Packages.AppCommonLib).Signal.new()
local NewResult1 = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(NewResult, function()
	-- upvalues: GameInviteModalManager (copy)
	return GameInviteModalManager:isGameModalOpen()
end)
GameInviteModalManager.ToggleGameInviteModalEvent.Event:Connect(function()
	-- upvalues: NewResult (copy)
	NewResult:fire()
end)

local function _(): boolean
	-- upvalues: RunService (copy), Players (copy)
	return not RunService:IsStudio() and (Players.LocalPlayer ~= nil and Players.LocalPlayer.UserId > 0)
end

local config = {
	id = "invite_friends",
	initialAvailability = if IsUserIdAbove then ServiceModule.AvailabilitySignal.Available else ServiceModule.AvailabilitySignal.Unavailable,
	label = if FFlagConnectionsToFriendsRename then "CoreScripts.InGameMenu.PageTitle.InviteFriends" else "CommonUI.Features.Label.InviteConnections",
	sideSheetPlacement = SideSheetPlacement.Vertical,
	activated = InGameMenuIntegrationUtilsModule.toggleInviteFriendsPage,
	isActivated = if FFlagChromeActivatedMappedSignal then NewResult1 else function()
		-- upvalues: NewResult1 (copy)
		return NewResult1:get()
	end,
	components = {
		Icon = function()
			-- upvalues: CommonIconModule (copy), NewResult1 (copy)
			return CommonIconModule("PersonArrowFromBottomRight", nil, NewResult1)
		end
	}
}
local IsUserIdAbove: boolean = not RunService:IsStudio() and (Players.LocalPlayer ~= nil and Players.LocalPlayer.UserId > 0)

return ServiceModule:register(config)