local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PromiseModule = require(Parent.Promise)
local FFlagAbuseReportInExpPlayerListV3 = require(Parent.SharedFlags).FFlagAbuseReportInExpPlayerListV3
local RecentlyLeftSignalsModule = require(GenericAbuseReporting.BeduiV2.Utils.Signals.recentlyLeftSignals)
local AccessoryType = require(Parent.Foundation).Enums.AccessoryType

local function appendRecentlyLeftItems(List, p1, Tbl)
	-- upvalues: AccessoryType (copy)
	local Copy = table.clone(Tbl)
	table.sort(Copy, function(A, B): boolean
		return A.username:lower() < B.username:lower()
	end)
	
	for _, value in ipairs(Copy) do
		if not p1[tostring(value.userId)] then
			table.insert(List, {
				leading = { type = AccessoryType.Avatar, userId = value.userId },
				id = tostring(value.userId),
				label = value.displayName,
				description = value.username,
				meta = {
					username = value.username,
					displayName = value.displayName
				}
			})
		end
	end
	return List
end

return function()
	-- upvalues: PromiseModule (copy), Players (copy), LocalPlayer (copy), FFlagAbuseReportInExpPlayerListV3 (copy), AccessoryType (copy), appendRecentlyLeftItems (copy), RecentlyLeftSignalsModule (copy)
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
		-- upvalues: Players (upval), LocalPlayer (upval), FFlagAbuseReportInExpPlayerListV3 (upval), AccessoryType (upval), appendRecentlyLeftItems (upval), RecentlyLeftSignalsModule (upval)
		local Success, Result = pcall(function()
			-- upvalues: Players (upval), LocalPlayer (upval), FFlagAbuseReportInExpPlayerListV3 (upval), AccessoryType (upval), appendRecentlyLeftItems (upval), RecentlyLeftSignalsModule (upval)
			local Players1 = Players:GetPlayers()
			table.sort(Players1, function(A, B): boolean
				return A.Name:lower() < B.Name:lower()
			end)
			local List = {}
			local t = {}
			
			for _, Player in ipairs(Players1) do
				if not LocalPlayer or Player.UserId ~= LocalPlayer.UserId then
					if FFlagAbuseReportInExpPlayerListV3 then
						t[tostring(Player.UserId)] = true
					end
					table.insert(List, {
						leading = { type = AccessoryType.Avatar, userId = Player.UserId },
						id = tostring(Player.UserId),
						label = Player.DisplayName,
						description = Player.Name,
						meta = { username = Player.Name, displayName = Player.DisplayName }
					})
				end
			end
			if FFlagAbuseReportInExpPlayerListV3 then
				appendRecentlyLeftItems(List, t, RecentlyLeftSignalsModule.getRecentlyLeft())
			end
			return List
		end)
		
		if Success then
			Callback(Result)
			
			return
		else
			Callback1(Result)
		end
	end)
end