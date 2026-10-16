local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RobloxTranslatorModule = require(game:GetService("CorePackages").Workspace.Packages.RobloxTranslator)
local FriendingUtilityModule = require(RobloxGui.Modules.FriendingUtility)
local SendNotificationInfo = RobloxGui:WaitForChild("SendNotificationInfo")
local FFlagRemoveHardCodedFriendLimitPromptModule = require(RobloxGui.Modules.Flags.FFlagRemoveHardCodedFriendLimitPrompt)

return function(Player, p1) --[[ Line: 18 | Named "RequestFriendship" ]]
	-- upvalues: FFlagRemoveHardCodedFriendLimitPromptModule (copy), RbxAnalyticsService (copy), Players (copy), LocalPlayer (copy), FriendingUtilityModule (copy), SendNotificationInfo (copy), RobloxTranslatorModule (copy)
	return function() --[[ Line: 19 ]]
		-- upvalues: FFlagRemoveHardCodedFriendLimitPromptModule (upval), RbxAnalyticsService (upval), Player (copy), Players (upval), LocalPlayer (upval), FriendingUtilityModule (upval), p1 (copy), SendNotificationInfo (upval), RobloxTranslatorModule (upval)
		coroutine.wrap(function() --[[ Line: 20 ]]
			-- upvalues: FFlagRemoveHardCodedFriendLimitPromptModule (upval), RbxAnalyticsService (upval), Player (upval), Players (upval), LocalPlayer (upval), FriendingUtilityModule (upval), p1 (upval), SendNotificationInfo (upval), RobloxTranslatorModule (upval)
			if FFlagRemoveHardCodedFriendLimitPromptModule then
				RbxAnalyticsService:ReportCounter("PlayerDropDown-RequestFriendship")
				RbxAnalyticsService:TrackEvent("Game", "RequestFriendship", "PlayerDropDown")
				
				if Player.Parent == Players then
					LocalPlayer:RequestFriendship(Player)
					
					return
				end
			else
				local FriendCountAsync: number = FriendingUtilityModule:GetFriendCountAsync(Player.UserId)
				local FriendCountAsync1: number = FriendingUtilityModule:GetFriendCountAsync(LocalPlayer.UserId)
				
				if not FriendCountAsync1 or not FriendCountAsync then return end
				if FriendCountAsync1 < 200 and FriendCountAsync < 200 then
					RbxAnalyticsService:ReportCounter("PlayerDropDown-RequestFriendship")
					RbxAnalyticsService:TrackEvent("Game", "RequestFriendship", "PlayerDropDown")
					
					if Player.Parent == Players then
						LocalPlayer:RequestFriendship(Player)
						
						return
					end
				elseif FriendCountAsync1 >= 200 then
					SendNotificationInfo:Fire({
						Text = "You are at the max friends limit.",
						Duration = 5,
						Title = if p1 then "Cannot accept friend request" else "Cannot send friend request"
					})
					
					return
				else
					if FriendCountAsync >= 200 then
						SendNotificationInfo:Fire({
							Duration = 5,
							Title = if p1 then "Cannot accept friend request" else "Cannot send friend request",
							Text = RobloxTranslatorModule:FormatByKey("InGame.PlayerDropDown.OtherPlayerFriendLimit", { RBX_NAME = Player.Name })
						})
					end
				end
			end
		end)()
	end
end