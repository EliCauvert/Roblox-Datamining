local coreGuiService = game:GetService("CoreGui")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local playersService = game:GetService("Players")
local corePackagesService = game:GetService("CorePackages")
local localPlayer = playersService.LocalPlayer
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local friendingUtilityModule = require(robloxGui.Modules.FriendingUtility)
local sendNotificationInfo = robloxGui:WaitForChild("SendNotificationInfo")
local fFlagRemoveHardCodedFriendLimitPromptModule = require(robloxGui.Modules.Flags.FFlagRemoveHardCodedFriendLimitPrompt)

return function(p0, p1)
	-- upvalues: fFlagRemoveHardCodedFriendLimitPromptModule (ref), rbxAnalyticsService (ref), playersService (ref), localPlayer (ref), friendingUtilityModule (ref), sendNotificationInfo (ref), robloxTranslatorModule (ref)
	return function()
		-- upvalues: fFlagRemoveHardCodedFriendLimitPromptModule (copy), rbxAnalyticsService (copy), p0 (ref), playersService (copy), localPlayer (copy), friendingUtilityModule (copy), p1 (ref), sendNotificationInfo (copy), robloxTranslatorModule (copy)
		coroutine.wrap(function()
			-- upvalues: fFlagRemoveHardCodedFriendLimitPromptModule (copy), rbxAnalyticsService (copy), p0 (copy), playersService (copy), localPlayer (copy), friendingUtilityModule (copy), p1 (copy), sendNotificationInfo (copy), robloxTranslatorModule (copy)
			if fFlagRemoveHardCodedFriendLimitPromptModule then
				rbxAnalyticsService:ReportCounter("PlayerDropDown-RequestFriendship")
				rbxAnalyticsService:TrackEvent("Game", "RequestFriendship", "PlayerDropDown")
				
				if p0.Parent == playersService then
					localPlayer:RequestFriendship(p0)
					
					return
				end
			else
				local userIdFriendCountAsync = friendingUtilityModule:GetFriendCountAsync(p0.UserId)
				local userIdFriendCountAsync_1 = friendingUtilityModule:GetFriendCountAsync(localPlayer.UserId)
				
				if not userIdFriendCountAsync_1 or not userIdFriendCountAsync then return end
				if userIdFriendCountAsync_1 < 200 and userIdFriendCountAsync < 200 then
					rbxAnalyticsService:ReportCounter("PlayerDropDown-RequestFriendship")
					rbxAnalyticsService:TrackEvent("Game", "RequestFriendship", "PlayerDropDown")
					
					if p0.Parent == playersService then
						localPlayer:RequestFriendship(p0)
						
						return
					end
				elseif userIdFriendCountAsync_1 >= 200 then
					sendNotificationInfo:Fire({
						Text = "You are at the max friends limit.",
						Duration = 5,
						Title = if p1 then "Cannot accept friend request" else "Cannot send friend request"
					})
					
					return
				elseif userIdFriendCountAsync >= 200 then
					sendNotificationInfo:Fire({
						Duration = 5,
						Title = if p1 then "Cannot accept friend request" else "Cannot send friend request",
						Text = robloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.OtherPlayerFriendLimit", { RBX_NAME = p0.Name })
					})
				end
			end
		end)()
	end
end