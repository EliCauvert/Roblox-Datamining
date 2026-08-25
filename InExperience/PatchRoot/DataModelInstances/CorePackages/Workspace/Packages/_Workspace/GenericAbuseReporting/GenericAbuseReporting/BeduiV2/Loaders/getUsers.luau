local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local playersService = game:GetService("Players")
local localPlayer = playersService.LocalPlayer
local foundationModule = require(parent.Foundation)
local promiseModule = require(parent.Promise)
local fFlagAbuseReportInExpPlayerListV3 = require(parent.SharedFlags).FFlagAbuseReportInExpPlayerListV3
local recentlyLeftSignalsModule = require(genericAbuseReporting.BeduiV2.Utils.Signals.recentlyLeftSignals)
local accessoryType = foundationModule.Enums.AccessoryType

local function appendRecentlyLeftItems(p0, p1, p2)
	-- upvalues: accessoryType (ref)
	local cloned = table.clone(p2)
	table.sort(cloned, function(p3, p4)
		return p3.username:lower() < p4.username:lower()
	end)
	
	for i, v in ipairs(cloned) do
		if not p1[tostring(v.userId)] then
			table.insert(p0, {
				leading = { type = accessoryType.Avatar, userId = v.userId },
				id = tostring(v.userId),
				label = v.displayName,
				description = v.username,
				meta = { username = v.username, displayName = v.displayName }
			})
		end
	end
	return p0
end

return function()
	-- upvalues: promiseModule (ref), playersService (ref), localPlayer (ref), fFlagAbuseReportInExpPlayerListV3 (ref), accessoryType (ref), appendRecentlyLeftItems (ref), recentlyLeftSignalsModule (ref)
	return promiseModule.new(function(p5, p6)
		-- upvalues: playersService (copy), localPlayer (copy), fFlagAbuseReportInExpPlayerListV3 (copy), accessoryType (copy), appendRecentlyLeftItems (copy), recentlyLeftSignalsModule (copy)
		local ok, status = pcall(function()
			-- upvalues: playersService (copy), localPlayer (copy), fFlagAbuseReportInExpPlayerListV3 (copy), accessoryType (copy), appendRecentlyLeftItems (copy), recentlyLeftSignalsModule (copy)
			local players = playersService:GetPlayers()
			table.sort(players, function(p7, p8)
				return p7.Name:lower() < p8.Name:lower()
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
			p5(status)
			
			return
		end
		p6(status)
	end)
end