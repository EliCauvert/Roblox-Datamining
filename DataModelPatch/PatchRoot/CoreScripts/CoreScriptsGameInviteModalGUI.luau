local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local VRService = game:GetService("VRService")
local PlayerListManagerModule = require(CoreGui:WaitForChild("RobloxGui").Modules.PlayerList.PlayerListManager)
local MouseIconOverrideService = require(CorePackages.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local FFlagGameInviteModalUnlockMouse = require(CorePackages.Workspace.Packages.SharedFlags).FFlagGameInviteModalUnlockMouse
local GameInviteModule = require(CorePackages.Workspace.Packages.GameInvite)
local GameInviteModalManager = GameInviteModule.GameInviteModalManager

local function Callback(p1)
	-- upvalues: PlayerListManagerModule (copy), FFlagGameInviteModalUnlockMouse (copy), UserInputService (copy), VRService (copy), MouseIconOverrideService (copy)
	if p1 then
		PlayerListManagerModule:HideTemp("GameInviteMenu", true)
		
		if FFlagGameInviteModalUnlockMouse and UserInputService.MouseEnabled and not VRService.VREnabled then
			MouseIconOverrideService.push("GameInviteModal", Enum.OverrideMouseIconBehavior.ForceShow)
			
			return
		end
	else
		PlayerListManagerModule:HideTemp("GameInviteMenu", false)
		
		if FFlagGameInviteModalUnlockMouse then
			MouseIconOverrideService.pop("GameInviteModal")
		end
	end
end

GameInviteModule.renderCoreScriptGameInviteModalContainer((require(CoreGui.RobloxGui.Modules.ApolloClient)))
GameInviteModalManager.ToggleGameInviteModalEvent.Event:Connect(Callback)