local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local robloxGui = game:GetService("CoreGui").RobloxGui
local accessoryType = require(corePackagesService.Packages.Foundation).Enums.AccessoryType
local promiseModule = require(corePackagesService.Packages.Promise)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default

return {
	type = "listItem",
	fetch = function(_)
		-- upvalues: default (ref), promiseModule (ref), playersService (ref), accessoryType (ref)
		local ok, status = pcall(function()
			-- upvalues: default (copy)
			return default:getRecentUsersInteractionData()
		end)
		
		if not ok then
			return promiseModule.reject("Failed to fetch voice users")
		elseif not status then
			return promiseModule.resolve({})
		end
		local localPlayer = playersService.LocalPlayer
		local t = {}
		
		for i, v in pairs(status) do
			local var1
			local player = v.player
			
			if localPlayer then
				var1 = player.UserId == localPlayer.UserId
				var1 = nil
			else
				var1 = false
			end
			if player and not var1 then
				table.insert(t, {
					leading = { type = accessoryType.Avatar, userId = player.UserId },
					id = tostring(player.UserId),
					label = player.DisplayName,
					description = "@" .. player.Name,
					meta = { username = player.Name, displayName = player.DisplayName }
				})
			end
		end
		table.sort(t, function(p1, p2)
			return p1.label < p2.label
		end)
		
		return promiseModule.resolve(t)
	end
}