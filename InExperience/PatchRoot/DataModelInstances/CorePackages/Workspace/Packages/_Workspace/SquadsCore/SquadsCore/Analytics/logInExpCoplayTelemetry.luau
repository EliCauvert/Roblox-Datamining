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
local var8 = if fFlagEncodeSquadMembersUpdatedModule then require(squadsCore.Common.encodeUserIds) else function(p0)
	-- upvalues: httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p0 (ref)
		return httpService:JSONEncode(p0)
	end)
	
	return if ok then status else "[]"
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: squadLocationEnumModule (ref), playersService (ref), fFlagEncodeSquadMembersUpdatedModule (ref), var8 (ref), encodeSquadMembersModule (ref), cryoModule (ref), eventNamesModule (ref)
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
		local var12, var13
		local var11 = nil
		local _ = nil
		local _ = nil
		
		if fFlagEncodeSquadMembersUpdatedModule then
			var12 = var8(t_1)
			var13 = encodeSquadMembersModule(p2)
		else
			var11 = cryoModule.List.map(p2, function(p6)
				return p6.userId
			end)
			var12 = var8(t_1)
			var13 = var8(var11)
		end
		p5(eventNamesModule.PartyCoplay, {
			partyCoplayEvent = p4,
			partyId = p1,
			partyPlayersInGameInstanceCount = #t_1,
			partyPlayersInGameInstanceUserIds = var12,
			partyTotalSize = if fFlagEncodeSquadMembersUpdatedModule then #p2 else #var11,
			partyTotalSizeUserIds = var13
		})
	end
end