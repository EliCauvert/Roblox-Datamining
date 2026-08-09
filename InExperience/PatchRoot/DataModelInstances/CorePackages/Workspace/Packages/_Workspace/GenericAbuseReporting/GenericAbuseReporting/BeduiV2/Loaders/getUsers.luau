local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local playersService = game:GetService("Players")
local localPlayer = playersService.LocalPlayer
local promiseModule = require(parent.Promise)
local accessoryType = require(parent.Foundation).Enums.AccessoryType

return function() --[[ line: 15 | named "getUsers" ]]
	-- upvalues: promiseModule (ref), playersService (ref), localPlayer (ref), accessoryType (ref)
	return promiseModule.new(function(p0, p1) --[[ line: 16 ]]
		-- upvalues: playersService (copy), localPlayer (copy), accessoryType (copy)
		local ok, status = pcall(function() --[[ line: 17 ]]
			-- upvalues: playersService (copy), localPlayer (copy), accessoryType (copy)
			local players = playersService:GetPlayers()
			table.sort(players, function(p2, p3) --[[ line: 19 ]]
				return p2.Name:lower() < p3.Name:lower()
			end)
			local t = {}
			
			for i, v in ipairs(players) do
				if not localPlayer or v.UserId ~= localPlayer.UserId then
					table.insert(t, {
						leading = { type = accessoryType.Avatar, userId = v.UserId },
						id = tostring(v.UserId),
						label = v.DisplayName,
						description = v.Name,
						meta = { username = v.Name, displayName = v.DisplayName }
					})
				end
			end
			return t
		end)
		
		if ok then
			p0(status)
			
			return
		end
		p1(status)
	end)
end