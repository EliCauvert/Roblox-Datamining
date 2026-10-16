local Parent = script:FindFirstAncestor("GameInfosRodux").Parent
local CryoModule = require(Parent.Cryo)
local DataHydrationModule = require(Parent.DataHydration)
local _ = require(Parent.DiscoveryTypes)
local TutilsModule = require(Parent.tutils)
local config = { creator = true }

local function toStoreItem(p1) --[[ Line: 19 ]]
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

local function _(p1, p2) --[[ Line: 43 | Named "isUnchanged" ]]
	-- upvalues: TutilsModule (copy), CryoModule (copy), config (copy)
	if not p1 then
		return false
	elseif TutilsModule.shallowEqual(p1, CryoModule.Dictionary.join(p1, p2), config) then
		local Creator = p2.creator
		
		return Creator == nil or TutilsModule.shallowEqual(p1.creator, Creator)
	else
		return false
	end
end

local function syncVotesToStore(List) --[[ Line: 63 ]]
	-- upvalues: DataHydrationModule (copy)
	local VotesStore = DataHydrationModule.Game.getVotesStore(false)
	local t = {}
	local Flag = false
	
	for i, value in List do
		local TotalUpVotes = value.totalUpVotes
		local TotalDownVotes = value.totalDownVotes
		local NoTotalUpVotes: boolean = TotalUpVotes == nil or TotalDownVotes == nil
		
		if not NoTotalUpVotes then
			local Vote = VotesStore.getVote(i)
			local DataResult = Vote and Vote.data(false)
			NoTotalUpVotes = DataResult and DataResult.upVotes == TotalUpVotes and DataResult.downVotes == TotalDownVotes
		end
		if not NoTotalUpVotes then
			t[i] = { upVotes = TotalUpVotes, downVotes = TotalDownVotes }
			Flag = true
		end
	end
	if Flag then
		VotesStore.updateVoteItems(t)
	end
end

return function(List) --[[ Line: 91 | Named "syncGameInfosToStore" ]]
	-- upvalues: DataHydrationModule (copy), toStoreItem (copy), CryoModule (copy), TutilsModule (copy), config (copy), syncVotesToStore (copy)
	local GameInfoStore = DataHydrationModule.Game.getGameInfoStore(false)
	local t = {}
	local Flag = false
	
	for i, value in List do
		local StoreItem = toStoreItem(value)
		local GameInfo = GameInfoStore.getGameInfo(i)
		local DataResult = if GameInfo then GameInfo.data(false) else nil
		local Creator = if DataResult then DataResult.creator else nil
		
		if Creator and StoreItem.creator then
			StoreItem.creator = CryoModule.Dictionary.join(Creator, StoreItem.creator)
		end
		local Flag1 = nil
		if DataResult then
			if TutilsModule.shallowEqual(DataResult, CryoModule.Dictionary.join(DataResult, StoreItem), config) then
				local Creator1 = StoreItem.creator
				Flag1 = Creator1 == nil or TutilsModule.shallowEqual(DataResult.creator, Creator1)
			else
				Flag1 = false
			end
		else
			Flag1 = false
		end
		if not Flag1 then
			t[i] = StoreItem
			Flag = true
		end
	end
	if Flag then
		GameInfoStore.updateGameInfos(t, false)
	end
	syncVotesToStore(List)
end