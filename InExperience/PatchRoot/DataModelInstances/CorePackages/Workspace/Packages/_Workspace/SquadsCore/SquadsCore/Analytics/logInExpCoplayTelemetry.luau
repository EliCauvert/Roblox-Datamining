local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local SquadsCore = script:FindFirstAncestor("SquadsCore")
local Parent = SquadsCore.Parent
local EventNamesModule = require(SquadsCore.Analytics.EventNames)
local _ = require(SquadsCore.Enums.SquadCoplayJoin)
local SquadLocationEnumModule = require(SquadsCore.Enums.SquadLocationEnum)
local FFlagEncodeSquadMembersUpdatedModule = require(SquadsCore.Flags.FFlagEncodeSquadMembersUpdated)
local EncodeSquadMembersModule = require(SquadsCore.Common.encodeSquadMembers)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.RoduxSquads)
local EncodeUserIdsModule = if FFlagEncodeSquadMembersUpdatedModule then require(SquadsCore.Common.encodeUserIds) else function(Input)
	-- upvalues: HttpService (copy)
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), Input (copy)
		return HttpService:JSONEncode(Input)
	end)
	
	return if Success then Result else "[]"
end

return function(PartyId, List, InExperience, PartyCoplayEvent, Callback: (any, any) -> ())
	-- upvalues: SquadLocationEnumModule (copy), Players (copy), FFlagEncodeSquadMembersUpdatedModule (copy), EncodeUserIdsModule (copy), EncodeSquadMembersModule (copy), CryoModule (copy), EventNamesModule (copy)
	if InExperience == SquadLocationEnumModule.InExperience then
		local t = {}
		local List1 = {}
		
		for _, value in ipairs(List) do
			t[value.userId] = true
		end
		for _, player in Players:GetPlayers() do
			if t[player.UserId] then
				table.insert(List1, player.UserId)
			end
		end
		local MapResult = nil
		local EncodeSquadMembersModuleResult = nil
		local EncodeUserIdsModuleResult = nil
		
		if FFlagEncodeSquadMembersUpdatedModule then
			EncodeUserIdsModuleResult = EncodeUserIdsModule(List1)
			EncodeSquadMembersModuleResult = EncodeSquadMembersModule(List)
		else
			MapResult = CryoModule.List.map(List, function(p1)
				return p1.userId
			end)
			EncodeUserIdsModuleResult = EncodeUserIdsModule(List1)
			EncodeSquadMembersModuleResult = EncodeUserIdsModule(MapResult)
		end
		Callback(EventNamesModule.PartyCoplay, {
			partyCoplayEvent = PartyCoplayEvent,
			partyId = PartyId,
			partyPlayersInGameInstanceCount = #List1,
			partyPlayersInGameInstanceUserIds = EncodeUserIdsModuleResult,
			partyTotalSize = if FFlagEncodeSquadMembersUpdatedModule then #List else #MapResult,
			partyTotalSizeUserIds = EncodeSquadMembersModuleResult
		})
	end
end