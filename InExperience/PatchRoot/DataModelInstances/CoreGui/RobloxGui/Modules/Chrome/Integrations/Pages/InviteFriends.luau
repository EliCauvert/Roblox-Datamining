local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ChromeModule = require(CorePackages.Workspace.Packages.Chrome)
local GameInviteModalManager = require(CorePackages.Workspace.Packages.GameInvite).GameInviteModalManager
local FFlagGameInviteInExpJoinOrInviteLabelModule = require(CorePackages.Workspace.Packages.GameInvite.FFlagGameInviteInExpJoinOrInviteLabel)
local IsPlatformInviteUIEnabledModule = require(CorePackages.Workspace.Packages.GameInvite.isPlatformInviteUIEnabled)
local AppCommonLibModule = require(CorePackages.Workspace.Packages.AppCommonLib)
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local SideSheetPlacement = ChromeModule.Enums.SideSheetPlacement
local Signal = AppCommonLibModule.Signal
local InGameMenuIntegrationUtilsModule = require(script.Parent.InGameMenuIntegrationUtils)
local NewSignal = Signal.new()
local NewResult = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(NewSignal, function()
	-- upvalues: GameInviteModalManager (copy)
	return GameInviteModalManager:isGameModalOpen()
end)
GameInviteModalManager.ToggleGameInviteModalEvent.Event:Connect(function()
	-- upvalues: NewSignal (copy)
	NewSignal:fire()
end)

local function _(): boolean
	-- upvalues: RunService (copy), Players (copy)
	return not RunService:IsStudio() and (Players.LocalPlayer ~= nil and Players.LocalPlayer.UserId > 0)
end

local IsUserIdAbove: boolean = not RunService:IsStudio() and (Players.LocalPlayer ~= nil and Players.LocalPlayer.UserId > 0)

return ServiceModule:register({
	id = "invite_friends",
	initialAvailability = if IsUserIdAbove then ServiceModule.AvailabilitySignal.Available else ServiceModule.AvailabilitySignal.Unavailable,
	label = if FFlagGameInviteInExpJoinOrInviteLabelModule and not IsPlatformInviteUIEnabledModule() then "CoreScripts.InGameMenu.PageTitle.JoinOrInvite" else "CoreScripts.InGameMenu.PageTitle.InviteFriends",
	sideSheetPlacement = SideSheetPlacement.AboveFold,
	activated = InGameMenuIntegrationUtilsModule.toggleInviteFriendsPage,
	isActivated = NewResult,
	components = {
		Icon = function()
			-- upvalues: CommonIconModule (copy), NewResult (copy)
			return CommonIconModule("PersonArrowFromBottomRight", nil, NewResult)
		end
	}
})