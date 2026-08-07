local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local VRService = game:GetService("VRService")
local playerListManagerModule = require(coreGuiService:WaitForChild("RobloxGui").Modules.PlayerList.PlayerListManager)
local mouseIconOverrideService = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local fFlagGameInviteModalUnlockMouse = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagGameInviteModalUnlockMouse
local gameInviteModule = require(corePackagesService.Workspace.Packages.GameInvite)
local renderCoreScriptGameInviteModalContainer = gameInviteModule.renderCoreScriptGameInviteModalContainer
local gameInviteModalManager = gameInviteModule.GameInviteModalManager

local var6 = function(p0) --[[ line: 19 ]]
	-- upvalues: playerListManagerModule (ref), fFlagGameInviteModalUnlockMouse (ref), userInputService (ref), VRService (ref), mouseIconOverrideService (ref)
	if p0 then
		playerListManagerModule:HideTemp("GameInviteMenu", true)
		
		if fFlagGameInviteModalUnlockMouse and userInputService.MouseEnabled and not VRService.VREnabled then
			mouseIconOverrideService.push("GameInviteModal", Enum.OverrideMouseIconBehavior.ForceShow)
			
			return
		end
	else
		playerListManagerModule:HideTemp("GameInviteMenu", false)
		
		if fFlagGameInviteModalUnlockMouse then
			mouseIconOverrideService.pop("GameInviteModal")
		end
	end
end

renderCoreScriptGameInviteModalContainer(require(coreGuiService.RobloxGui.Modules.ApolloClient))
gameInviteModalManager.ToggleGameInviteModalEvent.Event:Connect(var6)