local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local AccessoryType = require(CorePackages.Packages.Foundation).Enums.AccessoryType
local PromiseModule = require(CorePackages.Packages.Promise)
local Default = require(game:GetService("CoreGui").RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default

return {
	type = "listItem",
	fetch = function(_) --[[ Line: 15 ]]
		-- upvalues: Default (copy), PromiseModule (copy), Players (copy), AccessoryType (copy)
		local Success, Result = pcall(function() --[[ Line: 16 ]]
			-- upvalues: Default (upval)
			return Default:getRecentUsersInteractionData()
		end)
		
		if not Success then
			return PromiseModule.reject("Failed to fetch voice users")
		end
		if not Result then
			return PromiseModule.resolve({})
		end
		local LocalPlayer = Players.LocalPlayer
		local List = {}
		
		for _, value in pairs(Result) do
			local Player = value.player
			local IsUserIdMatch: boolean = if LocalPlayer then Player.UserId == LocalPlayer.UserId else false
			
			if Player and not IsUserIdMatch then
				table.insert(List, {
					leading = { type = AccessoryType.Avatar, userId = Player.UserId },
					id = tostring(Player.UserId),
					label = Player.DisplayName,
					description = "@" .. Player.Name,
					meta = { username = Player.Name, displayName = Player.DisplayName }
				})
			end
		end
		table.sort(List, function(A, B): boolean --[[ Line: 43 ]]
			return A.label < B.label
		end)
		
		return PromiseModule.resolve(List)
	end
}