local parent = script:FindFirstAncestor("GameInfosRodux").Parent
local cryoModule = require(parent.Cryo)
local dataHydrationModule = require(parent.DataHydration)
local _ = require(parent.DiscoveryTypes)
local tutilsModule = require(parent.tutils)
local t = { creator = true }

local function toStoreItem(p1)
	return {
		universeId = p1.universeId,
		rootPlaceId = p1.placeId,
		name = p1.name,
		playerCount = p1.playerCount,
		contentMaturity = p1.contentMaturity,
		gameMinimumAge = p1.minimumAge,
		gameAgeDisplayName = p1.ageRecommendationDisplayName,
		creator = if p1.creatorId or p1.creatorName then { id = p1.creatorId, name = p1.creatorName } else nil
	}
end

local function _(p1, p2)
	-- upvalues: tutilsModule (ref), cryoModule (ref), t (ref)
	if not p1 then
		return false
	elseif not tutilsModule.shallowEqual(p1, cryoModule.Dictionary.join(p1, p2), t) then
		return false
	end
	local creator = p2.creator
	
	return creator == nil or tutilsModule.shallowEqual(p1.creator, creator)
end

local function syncVotesToStore(p1)
	-- upvalues: dataHydrationModule (ref)
	local votesStore = dataHydrationModule.Game.getVotesStore(false)
	local t = {}
	local var1 = false
	
	for i, v in p1 do
		local totalUpVotes = v.totalUpVotes
		local totalDownVotes = v.totalDownVotes
		
		if totalUpVotes ~= nil and totalDownVotes ~= nil then
			local vote = votesStore.getVote(i)
			local var2 = vote and vote.data(false)
			
			if not var2 or var2.upVotes ~= totalUpVotes or var2.downVotes ~= totalDownVotes then
				t[i] = { upVotes = totalUpVotes, downVotes = totalDownVotes }
				var1 = true
			end
		end
	end
	if var1 then
		votesStore.updateVoteItems(t)
	end
end

return function(p2)
	-- upvalues: dataHydrationModule (ref), toStoreItem (ref), cryoModule (ref), tutilsModule (ref), t (ref), syncVotesToStore (ref)
	local gameInfoStore = dataHydrationModule.Game.getGameInfoStore(false)
	local t_1 = {}
	local var3 = false
	
	for i, v in p2 do
		local var4
		local var5 = toStoreItem(v)
		local gameInfo = gameInfoStore.getGameInfo(i)
		local var6 = if gameInfo then gameInfo.data(false) else nil
		local var7 = if var6 then var6.creator else nil
		
		if var7 and var5.creator then
			var5.creator = cryoModule.Dictionary.join(var7, var5.creator)
		end
		if not var6 then
			var4 = false
		elseif tutilsModule.shallowEqual(var6, cryoModule.Dictionary.join(var6, var5), t) then
			local creator = var5.creator
			var4 = creator == nil or tutilsModule.shallowEqual(var6.creator, creator)
		else
			var4 = false
		end
		if not var4 then
			t_1[i] = var5
			var3 = true
		end
	end
	if var3 then
		gameInfoStore.updateGameInfos(t_1, false)
	end
	syncVotesToStore(p2)
end