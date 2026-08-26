local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local playersService = game:GetService("Players")
local localPlayer = playersService.LocalPlayer
local foundationModule = require(parent.Foundation)
local promiseModule = require(parent.Promise)
local fFlagAbuseReportInExpPlayerListV3 = require(parent.SharedFlags).FFlagAbuseReportInExpPlayerListV3
local recentlyLeftSignalsModule = require(genericAbuseReporting.BeduiV2.Utils.Signals.recentlyLeftSignals)
local accessoryType = foundationModule.Enums.AccessoryType

local function appendRecentlyLeftItems(p1, p2, p3)
	-- upvalues: accessoryType (ref)
	local cloned = table.clone(p3)
	table.sort(cloned, function(p4, p5)
		return p4.username:lower() < p5.username:lower()
	end)
	
	for i, v in ipairs(cloned) do
		if not p2[tostring(v.userId)] then
			table.insert(p1, {
				leading = { type = accessoryType.Avatar, userId = v.userId },
				id = tostring(v.userId),
				label = v.displayName,
				description = v.username,
				meta = { username = v.username, displayName = v.displayName }
			})
		end
	end
	return p1
end

return function()
	-- upvalues: promiseModule (ref), playersService (ref), localPlayer (ref), fFlagAbuseReportInExpPlayerListV3 (ref), accessoryType (ref), appendRecentlyLeftItems (ref), recentlyLeftSignalsModule (ref)
	return promiseModule.new(function(p4, p5)
		-- upvalues: playersService (copy), localPlayer (copy), fFlagAbuseReportInExpPlayerListV3 (copy), accessoryType (copy), appendRecentlyLeftItems (copy), recentlyLeftSignalsModule (copy)
		local ok, status = pcall(function()
			-- upvalues: playersService (copy), localPlayer (copy), fFlagAbuseReportInExpPlayerListV3 (copy), accessoryType (copy), appendRecentlyLeftItems (copy), recentlyLeftSignalsModule (copy)
			local players = playersService:GetPlayers()
			table.sort(players, function(p6, p7)
				return p6.Name:lower() < p7.Name:lower()
			end)
			local t = {}
			local t_1 = {}
			
			for i, v in ipairs(players) do
				if not localPlayer or v.UserId ~= localPlayer.UserId then
					if fFlagAbuseReportInExpPlayerListV3 then
						t_1[tostring(v.UserId)] = true
					end
					table.insert(t, {
						leading = { type = accessoryType.Avatar, userId = v.UserId },
						id = tostring(v.UserId),
						label = v.DisplayName,
						description = v.Name,
						meta = { username = v.Name, displayName = v.DisplayName }
					})
				end
			end
			if fFlagAbuseReportInExpPlayerListV3 then
				appendRecentlyLeftItems(t, t_1, recentlyLeftSignalsModule.getRecentlyLeft())
			end
			return t
		end)
		
		if ok then
			p4(status)
			
			return
		end
		p5(status)
	end)
end