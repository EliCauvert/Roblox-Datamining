local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local squadsCore = script:FindFirstAncestor("SquadsCore")
local parent = squadsCore.Parent
local eventNamesModule = require(squadsCore.Analytics.EventNames)
local _ = require(squadsCore.Enums.SquadCoplayJoin)
local squadLocationEnumModule = require(squadsCore.Enums.SquadLocationEnum)
local fFlagEncodeSquadMembersUpdatedModule = require(squadsCore.Flags.FFlagEncodeSquadMembersUpdated)
local encodeSquadMembersModule = require(squadsCore.Common.encodeSquadMembers)
local cryoModule = require(parent.Cryo)
local _ = require(parent.RoduxSquads)
local var1 = if fFlagEncodeSquadMembersUpdatedModule then require(squadsCore.Common.encodeUserIds) else function(p1)
	-- upvalues: httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p1 (ref)
		return httpService:JSONEncode(p1)
	end)
	
	return if ok then status else "[]"
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: squadLocationEnumModule (ref), playersService (ref), fFlagEncodeSquadMembersUpdatedModule (ref), var1 (ref), encodeSquadMembersModule (ref), cryoModule (ref), eventNamesModule (ref)
	if p3 == squadLocationEnumModule.InExperience then
		local t = {}
		local t_1 = {}
		
		for i, v in ipairs(p2) do
			t[v.userId] = true
		end
		for i, v_1 in playersService:GetPlayers() do
			if t[v_1.UserId] then
				table.insert(t_1, v_1.UserId)
			end
		end
		local var2, var3
		local var4 = nil
		local _ = nil
		local _ = nil
		
		if fFlagEncodeSquadMembersUpdatedModule then
			var2 = var1(t_1)
			var3 = encodeSquadMembersModule(p2)
		else
			var4 = cryoModule.List.map(p2, function(p6)
				return p6.userId
			end)
			var2 = var1(t_1)
			var3 = var1(var4)
		end
		p5(eventNamesModule.PartyCoplay, {
			partyCoplayEvent = p4,
			partyId = p1,
			partyPlayersInGameInstanceCount = #t_1,
			partyPlayersInGameInstanceUserIds = var2,
			partyTotalSize = if fFlagEncodeSquadMembersUpdatedModule then #p2 else #var4,
			partyTotalSizeUserIds = var3
		})
	end
end