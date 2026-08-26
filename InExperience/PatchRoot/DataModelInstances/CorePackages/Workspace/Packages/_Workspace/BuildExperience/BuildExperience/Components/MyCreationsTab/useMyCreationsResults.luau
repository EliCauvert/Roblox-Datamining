local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local appLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local playersService = game:GetService("Players")
local fIntMyCreationsSessionListPollingIntervalSecondsModule = require(buildExperience.Flags.FIntMyCreationsSessionListPollingIntervalSeconds)
local fFlagBuildExperienceMyCreationsUseUniverseListModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsUseUniverseList)
local localizationModule = require(parent.Localization)
local promiseModule = require(parent.Promise)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = localizationModule.Hooks.useLocalization
local localizationRoactContext = localizationModule.LocalizationRoactContext
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local universeActivationModule = require(parent.DataHydration.UniverseActivation)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local universeSearchModule = require(parent.DataHydration.UniverseSearch)
local privacyType = universeConfigurationModule.PrivacyType
local contentMaturityUtilsModule = require(buildExperience.utils.ContentMaturityUtils)
local matchesSearchQueryModule = require(buildExperience.utils.matchesSearchQuery)
local getBuildExperienceRefreshStoreModule = require(buildExperience.Stores.GetBuildExperienceRefreshStore)
local getSearchQueryStoreModule = require(buildExperience.Stores.GetSearchQueryStore)
local _ = require(buildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)
local fFlagBuildExperienceMyCreationsUseAudiencesModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsUseAudiences)
local fFlagBuildRehydrateOnPublishModule = require(buildExperience.Flags.FFlagBuildRehydrateOnPublish)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local useSignalState = signalsReactModule.useSignalState
local t = {}
local t_1 = {}
local t_2 = {
	waiting_on_client = localizationStringsModule.MY_CREATIONS_INPUT_NEEDED,
	idle = localizationStringsModule.MY_CREATIONS_READY,
	working = localizationStringsModule.MY_CREATIONS_BUILDING
}
local t_3 = {
	private = localizationStringsModule.MY_CREATIONS_PRIVATE,
	["public"] = localizationStringsModule.MY_CREATIONS_PUBLIC,
	publiclyUnavailable = localizationStringsModule.MY_CREATIONS_PUBLICLY_UNAVAILABLE,
	restricted = localizationStringsModule.MY_CREATIONS_RESTRICTED
}

local function _(p1)
	return string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", p1)
end

local function privacyLabelForSummary(p1, p2, p3)
	-- upvalues: fFlagBuildExperienceMyCreationsUseAudiencesModule (ref), universeConfigurationModule (ref), fFlagBuildRehydrateOnPublishModule (ref), privacyType (ref)
	local var1 = if fFlagBuildExperienceMyCreationsUseAudiencesModule then universeConfigurationModule.getPrivacyTypeForAudiences(p1.audiences) else p1.privacyType
	
	if fFlagBuildRehydrateOnPublishModule and p1.isActive == true and var1 == privacyType.Public then
		return if p2 == nil then nil elseif p2 then p3.publiclyUnavailable elseif var1 == privacyType.Public then p3["public"] elseif var1 == privacyType.FriendsOnly then p3.restricted else p3.private
	end
end

local _ = function(p1, p2)
	-- upvalues: fFlagBuildExperienceMyCreationsUseAudiencesModule (ref), universeConfigurationModule (ref), privacyType (ref)
	local _ = nil
	local var1 = if fFlagBuildExperienceMyCreationsUseAudiencesModule and p1.audiences ~= nil then universeConfigurationModule.getPrivacyTypeForAudiences(p1.audiences) else p1.privacyType
	
	return if var1 == privacyType.Public then p2["public"] elseif var1 == privacyType.FriendsOnly then p2.restricted else p2.private
end

local _ = function(p1, p2, p3)
	return {
		creatorType = "User",
		surface = "CreatorHubCreations",
		isArchived = false,
		isTeamCreateEnabled = true,
		sortParam = "LastUpdated",
		sortOrder = "Desc",
		pageSize = 50,
		creatorTargetId = p1,
		pageIndex = p3,
		search = if p2 ~= "" then nil else p2
	}
end

local _ = function(p1, p2)
	local roblox = p1._meta and p1._meta._roblox
	local var1 = if roblox then roblox.sessionStatus else nil
	
	return if var1 == nil then nil else p2[var1]
end

local function requestHandleToPromise(p1)
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p2, p3)
		-- upvalues: p1 (ref)
		task.spawn(function()
			-- upvalues: p1 (copy), p2 (ref), p3 (ref)
			while p1.state(false).status == "pending" do
				task.wait()
			end
			local var1 = p1.state(false)
			
			if var1.status == "succeeded" then
				p2(var1.result)
				
				return
			end
			p3(var1.error)
		end)
	end)
end

local function ignorePromiseRejection() end

local function noOp() end

local _ = function(p2)
	local roblox = p2._meta and p2._meta._roblox
	
	if roblox == nil then
		return nil
	end
	local universeId = roblox.universeId
	
	return if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
end

local function buildExperienceMetadataByUniverseId(p2, p3, p4)
	-- upvalues: privacyLabelForSummary (ref)
	local t = {}
	
	for i, v in p2 do
		local name = v.name
		
		if typeof(name) == "string" and name ~= "" and not v.isArchived then
			local creatorName = v.creatorName
			t[i] = {
				placeId = v.rootPlaceId,
				experienceName = name,
				creatorName = if typeof(creatorName) == "string" and creatorName ~= "" then creatorName else nil,
				visibilityLabel = privacyLabelForSummary(v, p3[i], p4),
				gameIcon = string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", i)
			}
		end
	end
	return t
end

local function buildSessionItems(p5, p6, p7, p8, p9)
	-- upvalues: fFlagBuildLocalization (ref), localizationStringsModule (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in p5 do
		local var1, universeId
		local sessionId = v.sessionId
		local roblox = v._meta and v._meta._roblox
		
		if roblox == nil then
			var1 = nil
		else
			universeId = roblox.universeId
			var1 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
		end
		if typeof(sessionId) == "string" and sessionId ~= "" and (var1 ~= nil and not t[var1]) then
			t[var1] = true
			local var2 = if p6 then p6[var1] else nil
			universeId = nil
			universeId = if fFlagBuildLocalization then if var2 then var2.experienceName else v.title or p9(var1) elseif var2 then var2.experienceName else v.title or localizationStringsModule.formatMyCreationsUniverseName(var1)
			local t_2 = {
				sessionId = sessionId,
				universeId = var1,
				placeId = if var2 then var2.placeId else nil,
				experienceName = universeId,
				creatorName = if var2 then var2.creatorName else nil
			}
			local roblox_1 = v._meta and v._meta._roblox
			local var3 = if roblox_1 then roblox_1.sessionStatus else nil
			t_2.description = if var3 == nil then nil else p7[var3]
			t_2.visibilityLabel = if var2 then var2.visibilityLabel else p8.private
			t_2.gameIcon = if var2 then var2.gameIcon else string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", var1)
			table.insert(t_1, t_2)
		end
	end
	return t_1
end

local function buildLatestSessionByUniverseId(p10)
	local t = {}
	
	for i, v in p10 do
		local var4
		local roblox = v._meta and v._meta._roblox
		
		if roblox == nil then
			var4 = nil
		else
			local universeId = roblox.universeId
			var4 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
		end
		if var4 ~= nil and t[var4] == nil then
			t[var4] = v
		end
	end
	return t
end

local function buildUniverseItems(p11, p12, p13, p14, p15)
	-- upvalues: buildLatestSessionByUniverseId (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref), fFlagBuildExperienceMyCreationsUseAudiencesModule (ref), universeConfigurationModule (ref), privacyType (ref)
	local var5 = buildLatestSessionByUniverseId(p12)
	local t = {}
	
	for i, v in p11 do
		if not v.isArchived then
			local var6
			local id = v.id
			local var7 = var5[id]
			local name = v.name
			local _ = nil
			local t_1 = {
				sessionId = if var7 then var7.sessionId else nil,
				universeId = id,
				placeId = v.rootPlaceId,
				experienceName = if typeof(name) == "string" and name ~= "" then name elseif fFlagBuildLocalization then p15(id) else localizationStringsModule.formatMyCreationsUniverseName(id),
				creatorName = if typeof(v.creatorName) == "string" and v.creatorName ~= "" then v.creatorName else nil
			}
			
			if var7 then
				local roblox = var7._meta and var7._meta._roblox
				local var8 = if roblox then roblox.sessionStatus else nil
				var6 = if var8 == nil then nil else p13[var8]
			else
				var6 = nil
			end
			t_1.description = var6
			local _ = nil
			local var9 = if fFlagBuildExperienceMyCreationsUseAudiencesModule and v.audiences ~= nil then universeConfigurationModule.getPrivacyTypeForAudiences(v.audiences) else v.privacyType
			t_1.visibilityLabel = if var9 == privacyType.Public then p14["public"] elseif var9 == privacyType.FriendsOnly then p14.restricted else p14.private
			t_1.gameIcon = string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", id)
			table.insert(t, t_1)
		end
	end
	return t
end

local function useUniverseSearchList(p16, p17, p18, p19, p20, p21, p22, p23)
	-- upvalues: reactModule (ref), signalsModule (ref), t_1 (ref), useSignalState (ref), ignorePromiseRejection (ref), buildUniverseItems (ref)
	local var10 = reactModule.useRef({})
	local var11 = reactModule.useRef(p18)
	var11.current = p18
	local var12, var13 = reactModule.useState({ query = p18, pageIndexes = { 0 } })
	local var14 = reactModule.useMemo(function()
		-- upvalues: var12 (ref), p16 (ref), p17 (ref)
		local t = {}
		
		for i, v in var12.pageIndexes do
			local query = var12.query
			table.insert(t, p16.getSearch({
				creatorType = "User",
				surface = "CreatorHubCreations",
				isArchived = false,
				isTeamCreateEnabled = true,
				sortParam = "LastUpdated",
				sortOrder = "Desc",
				pageSize = 50,
				creatorTargetId = p17,
				pageIndex = v,
				search = if query ~= "" then nil else query
			}))
		end
		return t
	end, { var12, p16, p17 })
	local var15 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var14 (ref), t_1 (copy), var12 (ref)
		return signalsModule.createComputed(function(p24)
			-- upvalues: var14 (copy), t_1 (copy), var12 (copy)
			local t = {}
			local t_2 = {}
			local var16 = nil
			local totalResults = nil
			local var17 = 0
			local var18 = "NotReady"
			local var19 = "NotReady"
			
			for i, v in var14 do
				local var20 = v.data(p24)
				var18 = v.status(p24)
				
				if i == 1 then
					var19 = var18
				end
				if var20 ~= nil then
					var16 = var20
					totalResults = var20.totalResults or (var20.totalHits or totalResults)
					local data = var20.data or t_1
					var17 += #data
					
					for i_1, v_1 in data do
						if not t_2[v_1.id] then
							t_2[v_1.id] = true
							table.insert(t, v_1)
						end
					end
				end
			end
			local var21 = nil
			local var22 = nil
			
			if var18 == "Ready" and var16 ~= nil then
				local nextResultIndex = var16.nextResultIndex
				
				if nextResultIndex ~= nil then
					var21 = nextResultIndex / 50
				elseif totalResults ~= nil and var17 < totalResults then
					var21 = var12.pageIndexes[#var12.pageIndexes] + 1
				end
				if var21 ~= nil and (var21 < 0 or table.find(var12.pageIndexes, var21)) then
					var21 = nil
				end
			elseif var18 == "Failed" and #var14 > 1 then
				var22 = var12.pageIndexes[#var12.pageIndexes]
			end
			return {
				items = t,
				status = var19,
				nextPageIndex = var21,
				failedPageIndex = var22,
				isLoadingMore = #var14 > 1 and var18 == "NotReady"
			}
		end)
	end, { var12.pageIndexes, var14 }))
	local var23 = reactModule.useCallback(function(p25, p26, p27)
		-- upvalues: var10 (ref), p16 (ref), p17 (ref)
		local var24 = `{p26}\0{p25}`
		
		if p27 then
			var10.current[var24] = nil
		end
		local var25 = var10.current[var24]
		
		if var25 == nil then
			local var26 = nil
			var26 = p16.refreshSearch({
				creatorType = "User",
				surface = "CreatorHubCreations",
				isArchived = false,
				isTeamCreateEnabled = true,
				sortParam = "LastUpdated",
				sortOrder = "Desc",
				pageSize = 50,
				creatorTargetId = p17,
				pageIndex = p26,
				search = if p25 ~= "" then nil else p25
			}):finally(function()
				-- upvalues: var10 (copy), var24 (ref), var26 (write)
				if var10.current[var24] == var26 then
					var10.current[var24] = nil
				end
			end)
			var10.current[var24] = var26
			
			return var26
		end
		return var25
	end, { p16, p17 })
	local var24 = reactModule.useCallback(function(p25)
		-- upvalues: var11 (ref), var13 (ref), var23 (ref)
		p25 = p25 or var11.current
		var13({ query = p25, pageIndexes = { 0 } })
		
		return var23(p25, 0)
	end, { var23 })
	reactModule.useEffect(function()
		-- upvalues: p19 (ref), var12 (ref), p18 (ref), var24 (ref), ignorePromiseRejection (copy)
		if p19 and var12.query ~= p18 then
			var24(p18):catch(ignorePromiseRejection)
		end
	end, { p18, p19, var24, var12.query })
	
	return {
		items = reactModule.useMemo(function()
			-- upvalues: buildUniverseItems (copy), var15 (ref), p20 (ref), p21 (ref), p22 (ref), p23 (ref)
			return buildUniverseItems(var15.items, p20, p21, p22, p23)
		end, {
			p21,
			var15.items,
			p20,
			p22,
			p23
		}),
		status = var15.status,
		sourceItemCount = #var15.items,
		failedPageIndex = var15.failedPageIndex,
		isLoadingMore = var15.isLoadingMore,
		query = var12.query,
		refresh = var24,
		loadMore = reactModule.useCallback(function()
			-- upvalues: var15 (ref), var12 (ref), var11 (ref), var13 (ref), var23 (ref), ignorePromiseRejection (copy)
			local failedPageIndex = var15.failedPageIndex or var15.nextPageIndex
			local query = var12.query
			
			if var15.isLoadingMore or failedPageIndex == nil or var11.current ~= query then return end
			if var15.failedPageIndex == nil then
				var13(function(p25)
					-- upvalues: query (ref), failedPageIndex (ref)
					if p25.query == query and not table.find(p25.pageIndexes, failedPageIndex) then
						local cloned = table.clone(p25.pageIndexes)
						table.insert(cloned, failedPageIndex)
						
						return { query = p25.query, pageIndexes = cloned }
					end
					return p25
				end)
			end
			var23(query, failedPageIndex, var15.failedPageIndex ~= nil):catch(ignorePromiseRejection)
		end, { var15, var23, var12.query })
	}
end

local function useLegacySessionList(p24, p25, p26, p27, p28, p29, p30)
	-- upvalues: reactModule (ref), signalsModule (ref), useSignalState (ref), fFlagBuildRehydrateOnPublishModule (ref), privacyType (ref), contentMaturityUtilsModule (ref), t (ref), buildExperienceMetadataByUniverseId (ref), buildSessionItems (ref), matchesSearchQueryModule (ref)
	local var16 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p24 (ref), p25 (ref)
		return signalsModule.createComputed(function(p31)
			-- upvalues: p24 (copy), p25 (copy)
			local t = {}
			local t_1 = {}
			
			for i, v in p24 do
				local var17
				local roblox = v._meta and v._meta._roblox
				
				if roblox == nil then
					var17 = nil
				else
					local universeId = roblox.universeId
					var17 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
				end
				if var17 ~= nil and not t_1[var17] then
					t_1[var17] = true
					local var18 = p25.getAndFetchSummary(var17).data(p31)
					
					if var18 ~= nil then
						t[var17] = var18
					end
				end
			end
			return t
		end)
	end, { p25, p24 }))
	local var17 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), fFlagBuildRehydrateOnPublishModule (copy), p26 (ref), var16 (ref), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
		return signalsModule.createComputed(function(p31)
			-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), p26 (copy), var16 (copy), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
			local t_1 = {}
			
			if fFlagBuildRehydrateOnPublishModule and p26 ~= nil then
				for i, v in var16 do
					if v.isActive == true and v.privacyType == privacyType.Public and p26.getAndFetchEligibility(i).data(p31) ~= nil then
						t_1[i] = contentMaturityUtilsModule.isSealBroken(i) and contentMaturityUtilsModule.isContentUnrated(i)
					end
				end
			end
			return if next(t_1) == nil then t else t_1
		end)
	end, { p26, var16 }))
	local var18 = reactModule.useMemo(function()
		-- upvalues: buildExperienceMetadataByUniverseId (copy), var16 (ref), var17 (ref), p29 (ref)
		return buildExperienceMetadataByUniverseId(var16, var17, p29)
	end, { var17, var16, p29 })
	local var19 = reactModule.useMemo(function()
		-- upvalues: buildSessionItems (copy), p24 (ref), var18 (ref), p28 (ref), p29 (ref), p30 (ref), var16 (ref)
		local t = {}
		
		for i, v in buildSessionItems(p24, var18, p28, p29, p30) do
			local universeId = var16[v.universeId]
			
			if universeId ~= nil and not universeId.isArchived then
				table.insert(t, v)
			end
		end
		return t
	end, {
		p28, var18, p24, var16, p29, p30
	})
	
	return {
		displayedItems = var19,
		joinableItems = reactModule.useMemo(function()
			-- upvalues: p27 (ref), var19 (ref), matchesSearchQueryModule (copy)
			if p27 == "" then
				return var19
			end
			local t = {}
			
			for i, v in var19 do
				if matchesSearchQueryModule(v.experienceName, p27) then
					table.insert(t, v)
				end
			end
			return t
		end, { p27, var19 }),
		hasPendingSummary = reactModule.useMemo(function()
			-- upvalues: p24 (ref), var16 (ref)
			local t = {}
			
			for i, v in p24 do
				local var20
				local roblox = v._meta and v._meta._roblox
				
				if roblox == nil then
					var20 = nil
				else
					local universeId = roblox.universeId
					var20 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
				end
				if var20 ~= nil and not t[var20] then
					t[var20] = true
					
					if var16[var20] == nil then
						return true
					end
				end
			end
			return false
		end, { p24, var16 })
	}
end

return function(p31)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationRoactContext (ref), localizationModule (ref), t_2 (ref), t_3 (ref), creatorAgentChatModule (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (ref), universeSearchModule (ref), fFlagBuildRehydrateOnPublishModule (ref), universeActivationModule (ref), universeConfigurationModule (ref), getSearchQueryStoreModule (ref), getBuildExperienceRefreshStoreModule (ref), appLifecycleObserverService (ref), useSignalState (ref), playersService (ref), useUniverseSearchList (ref), useLegacySessionList (ref), promiseModule (ref), ignorePromiseRejection (ref), signalsModule (ref), fIntMyCreationsSessionListPollingIntervalSecondsModule (ref), requestHandleToPromise (ref), noOp (ref)
	local var20 = if fFlagBuildLocalization then useLocalization({
		building = localizationStringsModule.MY_CREATIONS_BUILDING,
		inputNeeded = localizationStringsModule.MY_CREATIONS_INPUT_NEEDED,
		loadError = localizationStringsModule.MY_CREATIONS_LOAD_ERROR,
		private = localizationStringsModule.MY_CREATIONS_PRIVATE,
		["public"] = localizationStringsModule.MY_CREATIONS_PUBLIC,
		publiclyUnavailable = localizationStringsModule.MY_CREATIONS_PUBLICLY_UNAVAILABLE,
		ready = localizationStringsModule.MY_CREATIONS_READY,
		restricted = localizationStringsModule.MY_CREATIONS_RESTRICTED
	}) else nil
	local var21 = if fFlagBuildLocalization then reactModule.useContext(localizationRoactContext) else nil
	local var22 = if fFlagBuildLocalization then reactModule.useCallback(function(p32)
		-- upvalues: var21 (ref), localizationStringsModule (copy)
		return var21:Format(localizationStringsModule.MY_CREATIONS_UNIVERSE_NAME, { UNIVERSE_ID = p32 })
	end, {
		var21,
		if fFlagBuildLocalization then var20[localizationModule.RobloxLocaleIdKey] else nil
	}) else nil
	local var23 = if fFlagBuildLocalization then var20.loadError else localizationStringsModule.MY_CREATIONS_LOAD_ERROR
	local var24 = if fFlagBuildLocalization then if fFlagBuildLocalization then reactModule.useMemo(function()
		-- upvalues: var20 (ref)
		return {
			waiting_on_client = var20.inputNeeded,
			idle = var20.ready,
			working = var20.building
		}
	end, { var20.inputNeeded, var20.ready, var20.building }) else nil else t_2
	local var25 = if fFlagBuildLocalization then if fFlagBuildLocalization then reactModule.useMemo(function()
		-- upvalues: var20 (ref)
		return {
			private = var20.private,
			["public"] = var20["public"],
			publiclyUnavailable = var20.publiclyUnavailable,
			restricted = var20.restricted
		}
	end, {
		var20.private,
		var20["public"],
		var20.publiclyUnavailable,
		var20.restricted
	}) else nil else t_3
	local creatorAgentChatStore = p31.creatorAgentChatStore or creatorAgentChatModule.getCreatorAgentChatStore()
	local searchStore = p31.searchStore
	
	if fFlagBuildExperienceMyCreationsUseUniverseListModule and searchStore == nil then
		searchStore = universeSearchModule.getUniverseSearchStore()
	end
	local var26 = if fFlagBuildRehydrateOnPublishModule and not fFlagBuildExperienceMyCreationsUseUniverseListModule then universeActivationModule.getUniverseActivationStore() else nil
	local var27 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then nil else p31.configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
	local searchQueryStore = p31.searchQueryStore or getSearchQueryStoreModule()
	local var28 = getBuildExperienceRefreshStoreModule()
	local appLifecycleObserverService_1 = p31.appLifecycleObserverService or appLifecycleObserverService
	local var29 = p31.isFocused ~= false
	local var30, var31 = reactModule.useState(false)
	local var32 = searchQueryStore.useDebouncedQuery()
	local var33 = useSignalState(var28.getRefreshTick)
	local sessionListStore = creatorAgentChatStore.getSessionListStore()
	local var34 = useSignalState(sessionListStore.getSessions)
	local var35 = useSignalState(sessionListStore.getNextPageToken)
	local var36 = useSignalState(sessionListStore.getStatus)
	local var37 = useSignalState(sessionListStore.getLoadMoreStatus)
	local var38 = if var36 == "pending" then "NotReady" elseif var36 == "succeeded" then "Ready" else "Failed"
	local var39 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then useUniverseSearchList(searchStore, p31.userId or (if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0), var32, var29, var34, var24, var25, var22) else nil
	local var40 = if not fFlagBuildExperienceMyCreationsUseUniverseListModule then useLegacySessionList(var34, var27, var26, var32, var24, var25, var22) else nil
	local var41 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var39.refresh else nil
	local var42 = reactModule.useCallback(function()
		-- upvalues: sessionListStore (ref), promiseModule (copy), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var41 (ref)
		local var43 = sessionListStore.refresh()
		local var44 = promiseModule.new(function(p32, p33)
			-- upvalues: var43 (ref)
			task.spawn(function()
				-- upvalues: var43 (copy), p32 (ref), p33 (ref)
				while true do
					while var43.state(false).status == "pending" do
						task.wait()
					end
					local var45 = var43.state(false)
					
					if var45.status == "succeeded" then
						p32(var45.result)
						
						return
					end
					p33(var45.error)
				end
			end)
		end)
		
		return if fFlagBuildExperienceMyCreationsUseUniverseListModule then promiseModule.all({ var41(), var44 }) else var44
	end, { var41, sessionListStore })
	reactModule.useEffect(function()
		-- upvalues: appLifecycleObserverService_1 (ref), var29 (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var41 (ref), ignorePromiseRejection (copy), sessionListStore (ref)
		local onUnhideConnection = appLifecycleObserverService_1.OnUnhide:Connect(function()
			-- upvalues: var29 (copy), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var41 (copy), ignorePromiseRejection (copy), sessionListStore (copy)
			if var29 then
				if fFlagBuildExperienceMyCreationsUseUniverseListModule then
					var41():catch(ignorePromiseRejection)
				end
				sessionListStore.refresh()
			end
		end)
		
		return function()
			-- upvalues: onUnhideConnection (ref)
			onUnhideConnection:Disconnect()
		end
	end, {
		appLifecycleObserverService_1,
		var29,
		var41,
		sessionListStore
	})
	reactModule.useEffect(function()
		-- upvalues: var29 (ref), var31 (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var41 (ref), ignorePromiseRejection (copy), sessionListStore (ref), signalsModule (copy)
		if not var29 then
			var31(false)
			
			return
		end
		var31(false)
		
		if fFlagBuildExperienceMyCreationsUseUniverseListModule then
			var41():catch(ignorePromiseRejection)
		end
		local var45 = sessionListStore.refresh()
		
		return signalsModule.createEffect(function(p34)
			-- upvalues: var45 (ref), var31 (copy)
			if var45.state(p34).status == "succeeded" then
				var31(true)
			end
		end)
	end, { var29, var33, var41, sessionListStore })
	local maxValue = math.max(0, p31.pollingIntervalSeconds or fIntMyCreationsSessionListPollingIntervalSecondsModule)
	reactModule.useEffect(function()
		-- upvalues: var29 (ref), maxValue (ref), sessionListStore (ref)
		if var29 and maxValue ~= 0 then
			local var45 = false
			
			local function scheduleNextPoll()
				-- upvalues: maxValue (copy), var45 (write), sessionListStore (copy), scheduleNextPoll (ref)
				task.delay(maxValue, function()
					-- upvalues: var45 (copy), sessionListStore (copy), scheduleNextPoll (copy)
					if var45 then
						return
					end
					sessionListStore.refresh()
					scheduleNextPoll()
				end)
			end
			
			task.delay(maxValue, function()
				-- upvalues: var45 (write), sessionListStore (copy), scheduleNextPoll (ref)
				if var45 then
					return
				end
				sessionListStore.refresh()
				scheduleNextPoll()
			end)
			
			return function()
				-- upvalues: var45 (write)
				var45 = true
			end
		end
	end, { var29, maxValue, sessionListStore })
	local var45 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var39.items else var40.displayedItems
	local var46 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var39.items else var40.joinableItems
	local var47 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then false else var40.hasPendingSummary
	local var48 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var39.status else var38
	local var49 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var39.sourceItemCount else #var34
	local var50 = if var48 ~= "Ready" then var49 > 0 else true
	local isPending = var37 == "pending"
	local var51 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var39.failedPageIndex else nil
	local var52 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var39.isLoadingMore else false
	local var53 = reactModule.useCallback(function()
		-- upvalues: sessionListStore (ref), promiseModule (copy), requestHandleToPromise (copy)
		local var54 = sessionListStore.loadMore()
		
		return if var54 == nil then promiseModule.resolve() else requestHandleToPromise(var54)
	end, { isPending, var35, var38, sessionListStore })
	local var54 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var39.loadMore else nil
	local var55 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var39.query else var32
	
	return {
		displayedItems = var45,
		items = var46,
		listStatus = var48,
		hasDisplayedResult = var50,
		hasPendingSummary = var47,
		isSettledNoResults = var55 == var32 and (var50 and (not var47 and #var46 == 0)),
		query = var55,
		sourceItemCount = var49,
		sessionCount = #var34,
		sessionListStatus = var38,
		hasCompletedFocusedRefresh = var30,
		loadError = var23,
		refresh = var42,
		loadMoreIfNeeded = reactModule.useCallback(function(p34)
			-- upvalues: fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var54 (ref), var35 (ref), isPending (ref), var38 (ref), var53 (ref)
			local y = p34.AbsoluteCanvasSize.Y
			
			if p34.CanvasPosition.Y <= 0 or y <= 0 or p34.AbsoluteWindowSize.Y <= 0 then return end
			if math.max(0, y - p34.AbsoluteWindowSize.Y - 250) < p34.CanvasPosition.Y then
				if fFlagBuildExperienceMyCreationsUseUniverseListModule then
					var54()
					
					if var35 == nil or isPending or var38 ~= "Ready" then
						return
					else
						var53()
						
						return
					end
				elseif var35 ~= nil and not isPending and var38 == "Ready" then
					var53()
				end
			end
		end, {
			isPending,
			var53,
			var54,
			var35,
			var38
		}),
		failedLoadMore = var51 ~= nil,
		retryLoadMore = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var54 else noOp,
		isLoadingMore = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var52 else isPending
	}
end