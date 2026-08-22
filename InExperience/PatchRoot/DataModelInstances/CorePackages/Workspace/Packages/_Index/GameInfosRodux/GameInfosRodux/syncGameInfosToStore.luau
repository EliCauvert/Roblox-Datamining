local parent = script:FindFirstAncestor("GameInfosRodux").Parent
local cryoModule = require(parent.Cryo)
local dataHydrationModule = require(parent.DataHydration)
local _ = require(parent.DiscoveryTypes)
local tutilsModule = require(parent.tutils)
local t = { creator = true }

local function toStoreItem(p0) --[[ line: 19 ]]
	return {
		universeId = p0.universeId,
		rootPlaceId = p0.placeId,
		name = p0.name,
		playerCount = p0.playerCount,
		contentMaturity = p0.contentMaturity,
		gameMinimumAge = p0.minimumAge,
		gameAgeDisplayName = p0.ageRecommendationDisplayName,
		creator = if p0.creatorId or p0.creatorName then { id = p0.creatorId, name = p0.creatorName } else nil
	}
end

local function _(p1, p2) --[[ line: 43 | named "isUnchanged" ]]
	-- upvalues: tutilsModule (ref), cryoModule (ref), t (ref)
	if not p1 then
		return false
	elseif not tutilsModule.shallowEqual(p1, cryoModule.Dictionary.join(p1, p2), t) then
		return false
	end
	local creator = p2.creator
	
	return creator == nil or tutilsModule.shallowEqual(p1.creator, creator)
end

local function syncVotesToStore(p3) --[[ line: 63 ]]
	-- upvalues: dataHydrationModule (ref)
	local votesStore = dataHydrationModule.Game.getVotesStore(false)
	local t = {}
	local var8 = false
	
	for i, v in p3 do
		local totalUpVotes = v.totalUpVotes
		local totalDownVotes = v.totalDownVotes
		
		if totalUpVotes ~= nil and totalDownVotes ~= nil then
			local vote = votesStore.getVote(i)
			local var10 = vote and vote.data(false)
			
			if not var10 or var10.upVotes ~= totalUpVotes or var10.downVotes ~= totalDownVotes then
				t[i] = { upVotes = totalUpVotes, downVotes = totalDownVotes }
				var8 = true
			end
		end
	end
	if var8 then
		votesStore.updateVoteItems(t)
	end
end

return function(p4) --[[ line: 91 | named "syncGameInfosToStore" ]]
	-- upvalues: dataHydrationModule (ref), toStoreItem (ref), cryoModule (ref), tutilsModule (ref), t (ref), syncVotesToStore (ref)
	local gameInfoStore = dataHydrationModule.Game.getGameInfoStore(false)
	local t_1 = {}
	local var13 = false
	
	for i, v in p4 do
		local var18
		local var14 = toStoreItem(v)
		local gameInfo = gameInfoStore.getGameInfo(i)
		local var16 = if gameInfo then gameInfo.data(false) else nil
		local var17 = if var16 then var16.creator else nil
		
		if var17 and var14.creator then
			var14.creator = cryoModule.Dictionary.join(var17, var14.creator)
		end
		if not var16 then
			var18 = false
		elseif tutilsModule.shallowEqual(var16, cryoModule.Dictionary.join(var16, var14), t) then
			local creator = var14.creator
			var18 = creator == nil or tutilsModule.shallowEqual(var16.creator, creator)
		else
			var18 = false
		end
		if not var18 then
			t_1[i] = var14
			var13 = true
		end
	end
	if var13 then
		gameInfoStore.updateGameInfos(t_1, false)
	end
	syncVotesToStore(p4)
end