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

local function _(p0) --[[ line: 147 | named "thumbForUniverseId" ]]
	return string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", p0)
end

local function privacyLabelForSummary(p1, p2, p3) --[[ line: 151 ]]
	-- upvalues: fFlagBuildExperienceMyCreationsUseAudiencesModule (ref), universeConfigurationModule (ref), fFlagBuildRehydrateOnPublishModule (ref), privacyType (ref)
	local var36 = if fFlagBuildExperienceMyCreationsUseAudiencesModule then universeConfigurationModule.getPrivacyTypeForAudiences(p1.audiences) else p1.privacyType
	
	if fFlagBuildRehydrateOnPublishModule and p1.isActive == true and var36 == privacyType.Public then
		return if p2 == nil then nil elseif p2 then p3.publiclyUnavailable elseif var36 == privacyType.Public then p3["public"] elseif var36 == privacyType.FriendsOnly then p3.restricted else p3.private
	end
end

local _ = function(p4, p5) --[[ line: 181 | named "privacyLabelForSearchItem" ]]
	-- upvalues: fFlagBuildExperienceMyCreationsUseAudiencesModule (ref), universeConfigurationModule (ref), privacyType (ref)
	local _ = nil
	local var37 = if fFlagBuildExperienceMyCreationsUseAudiencesModule and p4.audiences ~= nil then universeConfigurationModule.getPrivacyTypeForAudiences(p4.audiences) else p4.privacyType
	
	return if var37 == privacyType.Public then p5["public"] elseif var37 == privacyType.FriendsOnly then p5.restricted else p5.private
end

local _ = function(p6, p7, p8) --[[ line: 197 | named "universeSearchParamsForPage" ]]
	return {
		creatorType = "User",
		surface = "CreatorHubCreations",
		isArchived = false,
		isTeamCreateEnabled = true,
		sortParam = "LastUpdated",
		sortOrder = "Desc",
		pageSize = 50,
		creatorTargetId = p6,
		pageIndex = p8,
		search = if p7 ~= "" then nil else p7
	}
end

local _ = function(p9, p10) --[[ line: 216 | named "descriptionForSessionStatus" ]]
	local roblox = p9._meta and p9._meta._roblox
	local var39 = if roblox then roblox.sessionStatus else nil
	
	return if var39 == nil then nil else p10[var39]
end

local function requestHandleToPromise(p11) --[[ line: 225 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p12, p13) --[[ line: 226 ]]
		-- upvalues: p11 (ref)
		task.spawn(function() --[[ line: 227 ]]
			-- upvalues: p11 (copy), p12 (ref), p13 (ref)
			while p11.state(false).status == "pending" do
				task.wait()
			end
			local var40 = p11.state(false)
			
			if var40.status == "succeeded" then
				p12(var40.result)
				
				return
			end
			p13(var40.error)
		end)
	end)
end

local function ignorePromiseRejection() --[[ line: 242 ]] end

local function noOp() --[[ line: 244 ]] end

local _ = function(p14) --[[ line: 246 | named "getSessionUniverseId" ]]
	local roblox = p14._meta and p14._meta._roblox
	
	if roblox == nil then
		return nil
	end
	local universeId = roblox.universeId
	
	return if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
end

local function buildExperienceMetadataByUniverseId(p15, p16, p17) --[[ line: 258 ]]
	-- upvalues: privacyLabelForSummary (ref)
	local t = {}
	
	for i, v in p15 do
		local name = v.name
		
		if typeof(name) == "string" and name ~= "" and not v.isArchived then
			local creatorName = v.creatorName
			t[i] = {
				placeId = v.rootPlaceId,
				experienceName = name,
				creatorName = if typeof(creatorName) == "string" and creatorName ~= "" then creatorName else nil,
				visibilityLabel = privacyLabelForSummary(v, p16[i], p17),
				gameIcon = string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", i)
			}
		end
	end
	return t
end

local function buildSessionItems(p18, p19, p20, p21, p22) --[[ line: 285 ]]
	-- upvalues: fFlagBuildLocalization (ref), localizationStringsModule (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in p18 do
		local var46, universeId
		local sessionId = v.sessionId
		local roblox = v._meta and v._meta._roblox
		
		if roblox == nil then
			var46 = nil
		else
			universeId = roblox.universeId
			var46 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
		end
		if typeof(sessionId) == "string" and sessionId ~= "" and (var46 ~= nil and not t[var46]) then
			t[var46] = true
			local var47 = if p19 then p19[var46] else nil
			universeId = nil
			universeId = if fFlagBuildLocalization then if var47 then var47.experienceName else v.title or p22(var46) elseif var47 then var47.experienceName else v.title or localizationStringsModule.formatMyCreationsUniverseName(var46)
			local t_2 = {
				sessionId = sessionId,
				universeId = var46,
				placeId = if var47 then var47.placeId else nil,
				experienceName = universeId,
				creatorName = if var47 then var47.creatorName else nil
			}
			local roblox_1 = v._meta and v._meta._roblox
			local var50 = if roblox_1 then roblox_1.sessionStatus else nil
			t_2.description = if var50 == nil then nil else p20[var50]
			t_2.visibilityLabel = if var47 then var47.visibilityLabel else p21.private
			t_2.gameIcon = if var47 then var47.gameIcon else string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", var46)
			table.insert(t_1, t_2)
		end
	end
	return t_1
end

local function buildLatestSessionByUniverseId(p23) --[[ line: 332 ]]
	local t = {}
	
	for i, v in p23 do
		local var53
		local roblox = v._meta and v._meta._roblox
		
		if roblox == nil then
			var53 = nil
		else
			local universeId = roblox.universeId
			var53 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
		end
		if var53 ~= nil and t[var53] == nil then
			t[var53] = v
		end
	end
	return t
end

local function buildUniverseItems(p24, p25, p26, p27, p28) --[[ line: 343 ]]
	-- upvalues: buildLatestSessionByUniverseId (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref), fFlagBuildExperienceMyCreationsUseAudiencesModule (ref), universeConfigurationModule (ref), privacyType (ref)
	local var54 = buildLatestSessionByUniverseId(p25)
	local t = {}
	
	for i, v in p24 do
		if not v.isArchived then
			local var58
			local id = v.id
			local var56 = var54[id]
			local name = v.name
			local _ = nil
			local t_1 = {
				sessionId = if var56 then var56.sessionId else nil,
				universeId = id,
				placeId = v.rootPlaceId,
				experienceName = if typeof(name) == "string" and name ~= "" then name elseif fFlagBuildLocalization then p28(id) else localizationStringsModule.formatMyCreationsUniverseName(id),
				creatorName = if typeof(v.creatorName) == "string" and v.creatorName ~= "" then v.creatorName else nil
			}
			
			if var56 then
				local roblox = var56._meta and var56._meta._roblox
				local var60 = if roblox then roblox.sessionStatus else nil
				var58 = if var60 == nil then nil else p26[var60]
			else
				var58 = nil
			end
			t_1.description = var58
			local _ = nil
			local var61 = if fFlagBuildExperienceMyCreationsUseAudiencesModule and v.audiences ~= nil then universeConfigurationModule.getPrivacyTypeForAudiences(v.audiences) else v.privacyType
			t_1.visibilityLabel = if var61 == privacyType.Public then p27["public"] elseif var61 == privacyType.FriendsOnly then p27.restricted else p27.private
			t_1.gameIcon = string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", id)
			table.insert(t, t_1)
		end
	end
	return t
end

local function useUniverseSearchList(p29, p30, p31, p32, p33, p34, p35, p36) --[[ line: 384 ]]
	-- upvalues: reactModule (ref), signalsModule (ref), t_1 (ref), useSignalState (ref), ignorePromiseRejection (ref), buildUniverseItems (ref)
	local var62 = reactModule.useRef({})
	local var63 = reactModule.useRef(p31)
	var63.current = p31
	local var64, var65 = reactModule.useState({ query = p31, pageIndexes = { 0 } })
	local var66 = reactModule.useMemo(function() --[[ line: 402 ]]
		-- upvalues: var64 (ref), p29 (ref), p30 (ref)
		local t = {}
		
		for i, v in var64.pageIndexes do
			local query = var64.query
			table.insert(t, p29.getSearch({
				creatorType = "User",
				surface = "CreatorHubCreations",
				isArchived = false,
				isTeamCreateEnabled = true,
				sortParam = "LastUpdated",
				sortOrder = "Desc",
				pageSize = 50,
				creatorTargetId = p30,
				pageIndex = v,
				search = if query ~= "" then nil else query
			}))
		end
		return t
	end, { var64, p29, p30 })
	local var67 = useSignalState(reactModule.useMemo(function() --[[ line: 411 ]]
		-- upvalues: signalsModule (copy), var66 (ref), t_1 (copy), var64 (ref)
		return signalsModule.createComputed(function(p37) --[[ line: 412 ]]
			-- upvalues: var66 (copy), t_1 (copy), var64 (copy)
			local t = {}
			local t_2 = {}
			local var73 = nil
			local totalResults = nil
			local var75 = 0
			local var76 = "NotReady"
			local var77 = "NotReady"
			
			for i, v in var66 do
				local var80 = v.data(p37)
				var76 = v.status(p37)
				
				if i == 1 then
					var77 = var76
				end
				if var80 ~= nil then
					var73 = var80
					totalResults = var80.totalResults or (var80.totalHits or totalResults)
					local data = var80.data or t_1
					var75 += #data
					
					for i_1, v_1 in data do
						if not t_2[v_1.id] then
							t_2[v_1.id] = true
							table.insert(t, v_1)
						end
					end
				end
			end
			local var78 = nil
			local var79 = nil
			
			if var76 == "Ready" and var73 ~= nil then
				local nextResultIndex = var73.nextResultIndex
				
				if nextResultIndex ~= nil then
					var78 = nextResultIndex / 50
				elseif totalResults ~= nil and var75 < totalResults then
					var78 = var64.pageIndexes[#var64.pageIndexes] + 1
				end
				if var78 ~= nil and (var78 < 0 or table.find(var64.pageIndexes, var78)) then
					var78 = nil
				end
			elseif var76 == "Failed" and #var66 > 1 then
				var79 = var64.pageIndexes[#var64.pageIndexes]
			end
			return {
				items = t,
				status = var77,
				nextPageIndex = var78,
				failedPageIndex = var79,
				isLoadingMore = #var66 > 1 and var76 == "NotReady"
			}
		end)
	end, { var64.pageIndexes, var66 }))
	local var68 = reactModule.useCallback(function(p38, p39, p40) --[[ line: 473 ]]
		-- upvalues: var62 (ref), p29 (ref), p30 (ref)
		local var82 = `{p39}\0{p38}`
		
		if p40 then
			var62.current[var82] = nil
		end
		var82 = var62.current[var82]
		
		if var82 == nil then
			local var83 = nil
			var83 = p29.refreshSearch({
				creatorType = "User",
				surface = "CreatorHubCreations",
				isArchived = false,
				isTeamCreateEnabled = true,
				sortParam = "LastUpdated",
				sortOrder = "Desc",
				pageSize = 50,
				creatorTargetId = p30,
				pageIndex = p39,
				search = if p38 ~= "" then nil else p38
			}):finally(function() --[[ line: 486 ]]
				-- upvalues: var62 (copy), var82 (ref), var83 (write)
				if var62.current[var82] == var83 then
					var62.current[var82] = nil
				end
			end)
			var62.current[var82] = var83
			
			return var83
		end
		return var82
	end, { p29, p30 })
	local var69 = reactModule.useCallback(function(p41) --[[ line: 495 ]]
		-- upvalues: var63 (ref), var65 (ref), var68 (ref)
		p41 = p41 or var63.current
		var65({ query = p41, pageIndexes = { 0 } })
		
		return var68(p41, 0)
	end, { var68 })
	reactModule.useEffect(function() --[[ line: 504 ]]
		-- upvalues: p32 (ref), var64 (ref), p31 (ref), var69 (ref), ignorePromiseRejection (copy)
		if p32 and var64.query ~= p31 then
			var69(p31):catch(ignorePromiseRejection)
		end
	end, { p31, p32, var69, var64.query })
	
	return {
		items = reactModule.useMemo(function() --[[ line: 533 ]]
			-- upvalues: buildUniverseItems (copy), var67 (ref), p33 (ref), p34 (ref), p35 (ref), p36 (ref)
			return buildUniverseItems(var67.items, p33, p34, p35, p36)
		end, {
			p34,
			var67.items,
			p33,
			p35,
			p36
		}),
		status = var67.status,
		sourceItemCount = #var67.items,
		failedPageIndex = var67.failedPageIndex,
		isLoadingMore = var67.isLoadingMore,
		query = var64.query,
		refresh = var69,
		loadMore = reactModule.useCallback(function() --[[ line: 510 ]]
			-- upvalues: var67 (ref), var64 (ref), var63 (ref), var65 (ref), var68 (ref), ignorePromiseRejection (copy)
			local failedPageIndex = var67.failedPageIndex or var67.nextPageIndex
			local query = var64.query
			
			if var67.isLoadingMore or failedPageIndex == nil or var63.current ~= query then return end
			if var67.failedPageIndex == nil then
				var65(function(p42) --[[ line: 517 ]]
					-- upvalues: query (ref), failedPageIndex (ref)
					if p42.query == query and not table.find(p42.pageIndexes, failedPageIndex) then
						local cloned = table.clone(p42.pageIndexes)
						table.insert(cloned, failedPageIndex)
						
						return { query = p42.query, pageIndexes = cloned }
					end
					return p42
				end)
			end
			var68(query, failedPageIndex, var67.failedPageIndex ~= nil):catch(ignorePromiseRejection)
		end, { var67, var68, var64.query })
	}
end

local function useLegacySessionList(p43, p44, p45, p46, p47, p48, p49) --[[ line: 563 ]]
	-- upvalues: reactModule (ref), signalsModule (ref), useSignalState (ref), fFlagBuildRehydrateOnPublishModule (ref), privacyType (ref), contentMaturityUtilsModule (ref), t (ref), buildExperienceMetadataByUniverseId (ref), buildSessionItems (ref), matchesSearchQueryModule (ref)
	local var87 = useSignalState(reactModule.useMemo(function() --[[ line: 572 ]]
		-- upvalues: signalsModule (copy), p43 (ref), p44 (ref)
		return signalsModule.createComputed(function(p50) --[[ line: 573 ]]
			-- upvalues: p43 (copy), p44 (copy)
			local t = {}
			local t_1 = {}
			
			for i, v in p43 do
				local var94
				local roblox = v._meta and v._meta._roblox
				
				if roblox == nil then
					var94 = nil
				else
					local universeId = roblox.universeId
					var94 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
				end
				if var94 ~= nil and not t_1[var94] then
					t_1[var94] = true
					local var95 = p44.getAndFetchSummary(var94).data(p50)
					
					if var95 ~= nil then
						t[var94] = var95
					end
				end
			end
			return t
		end)
	end, { p44, p43 }))
	local var88 = useSignalState(reactModule.useMemo(function() --[[ line: 593 ]]
		-- upvalues: signalsModule (copy), fFlagBuildRehydrateOnPublishModule (copy), p45 (ref), var87 (ref), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
		return signalsModule.createComputed(function(p51) --[[ line: 594 ]]
			-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), p45 (copy), var87 (copy), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
			local t_1 = {}
			
			if fFlagBuildRehydrateOnPublishModule and p45 ~= nil then
				for i, v in var87 do
					if v.isActive == true and v.privacyType == privacyType.Public and p45.getAndFetchEligibility(i).data(p51) ~= nil then
						t_1[i] = contentMaturityUtilsModule.isSealBroken(i) and contentMaturityUtilsModule.isContentUnrated(i)
					end
				end
			end
			return if next(t_1) == nil then t else t_1
		end)
	end, { p45, var87 }))
	local var89 = reactModule.useMemo(function() --[[ line: 616 ]]
		-- upvalues: buildExperienceMetadataByUniverseId (copy), var87 (ref), var88 (ref), p48 (ref)
		return buildExperienceMetadataByUniverseId(var87, var88, p48)
	end, { var88, var87, p48 })
	local var90 = reactModule.useMemo(function() --[[ line: 624 ]]
		-- upvalues: buildSessionItems (copy), p43 (ref), var89 (ref), p47 (ref), p48 (ref), p49 (ref), var87 (ref)
		local t = {}
		
		for i, v in buildSessionItems(p43, var89, p47, p48, p49) do
			local universeId = var87[v.universeId]
			
			if universeId ~= nil and not universeId.isArchived then
				table.insert(t, v)
			end
		end
		return t
	end, {
		p47, var89, p43, var87, p48, p49
	})
	
	return {
		displayedItems = var90,
		joinableItems = reactModule.useMemo(function() --[[ line: 663 ]]
			-- upvalues: p46 (ref), var90 (ref), matchesSearchQueryModule (copy)
			if p46 == "" then
				return var90
			end
			local t = {}
			
			for i, v in var90 do
				if matchesSearchQueryModule(v.experienceName, p46) then
					table.insert(t, v)
				end
			end
			return t
		end, { p46, var90 }),
		hasPendingSummary = reactModule.useMemo(function() --[[ line: 650 ]]
			-- upvalues: p43 (ref), var87 (ref)
			local t = {}
			
			for i, v in p43 do
				local var101
				local roblox = v._meta and v._meta._roblox
				
				if roblox == nil then
					var101 = nil
				else
					local universeId = roblox.universeId
					var101 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
				end
				if var101 ~= nil and not t[var101] then
					t[var101] = true
					
					if var87[var101] == nil then
						return true
					end
				end
			end
			return false
		end, { p43, var87 })
	}
end

return function(p52) --[[ line: 683 | named "useMyCreationsResults" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationRoactContext (ref), localizationModule (ref), t_2 (ref), t_3 (ref), creatorAgentChatModule (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (ref), universeSearchModule (ref), fFlagBuildRehydrateOnPublishModule (ref), universeActivationModule (ref), universeConfigurationModule (ref), getSearchQueryStoreModule (ref), getBuildExperienceRefreshStoreModule (ref), appLifecycleObserverService (ref), useSignalState (ref), playersService (ref), useUniverseSearchList (ref), useLegacySessionList (ref), promiseModule (ref), ignorePromiseRejection (ref), signalsModule (ref), fIntMyCreationsSessionListPollingIntervalSecondsModule (ref), requestHandleToPromise (ref), noOp (ref)
	local var102 = if fFlagBuildLocalization then useLocalization({
		building = localizationStringsModule.MY_CREATIONS_BUILDING,
		inputNeeded = localizationStringsModule.MY_CREATIONS_INPUT_NEEDED,
		loadError = localizationStringsModule.MY_CREATIONS_LOAD_ERROR,
		private = localizationStringsModule.MY_CREATIONS_PRIVATE,
		["public"] = localizationStringsModule.MY_CREATIONS_PUBLIC,
		publiclyUnavailable = localizationStringsModule.MY_CREATIONS_PUBLICLY_UNAVAILABLE,
		ready = localizationStringsModule.MY_CREATIONS_READY,
		restricted = localizationStringsModule.MY_CREATIONS_RESTRICTED
	}) else nil
	local var103 = if fFlagBuildLocalization then reactModule.useContext(localizationRoactContext) else nil
	local var104 = if fFlagBuildLocalization then reactModule.useCallback(function(p53) --[[ line: 699 ]]
		-- upvalues: var103 (ref), localizationStringsModule (copy)
		return var103:Format(localizationStringsModule.MY_CREATIONS_UNIVERSE_NAME, { UNIVERSE_ID = p53 })
	end, {
		var103,
		if fFlagBuildLocalization then var102[localizationModule.RobloxLocaleIdKey] else nil
	}) else nil
	local var105 = if fFlagBuildLocalization then var102.loadError else localizationStringsModule.MY_CREATIONS_LOAD_ERROR
	local var106 = if fFlagBuildLocalization then if fFlagBuildLocalization then reactModule.useMemo(function() --[[ line: 710 ]]
		-- upvalues: var102 (ref)
		return {
			waiting_on_client = var102.inputNeeded,
			idle = var102.ready,
			working = var102.building
		}
	end, { var102.inputNeeded, var102.ready, var102.building }) else nil else t_2
	local var107 = if fFlagBuildLocalization then if fFlagBuildLocalization then reactModule.useMemo(function() --[[ line: 729 ]]
		-- upvalues: var102 (ref)
		return {
			private = var102.private,
			["public"] = var102["public"],
			publiclyUnavailable = var102.publiclyUnavailable,
			restricted = var102.restricted
		}
	end, {
		var102.private,
		var102["public"],
		var102.publiclyUnavailable,
		var102.restricted
	}) else nil else t_3
	local creatorAgentChatStore = p52.creatorAgentChatStore or creatorAgentChatModule.getCreatorAgentChatStore()
	local searchStore = p52.searchStore
	
	if fFlagBuildExperienceMyCreationsUseUniverseListModule and searchStore == nil then
		searchStore = universeSearchModule.getUniverseSearchStore()
	end
	local var109 = if fFlagBuildRehydrateOnPublishModule and not fFlagBuildExperienceMyCreationsUseUniverseListModule then universeActivationModule.getUniverseActivationStore() else nil
	local var110 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then nil else p52.configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
	local searchQueryStore = p52.searchQueryStore or getSearchQueryStoreModule()
	local var112 = getBuildExperienceRefreshStoreModule()
	local appLifecycleObserverService_1 = p52.appLifecycleObserverService or appLifecycleObserverService
	local var114 = p52.isFocused ~= false
	local var115, var116 = reactModule.useState(false)
	local var117 = searchQueryStore.useDebouncedQuery()
	local var118 = useSignalState(var112.getRefreshTick)
	local sessionListStore = creatorAgentChatStore.getSessionListStore()
	local var120 = useSignalState(sessionListStore.getSessions)
	local var121 = useSignalState(sessionListStore.getNextPageToken)
	local var122 = useSignalState(sessionListStore.getStatus)
	local var123 = useSignalState(sessionListStore.getLoadMoreStatus)
	local var124 = if var122 == "pending" then "NotReady" elseif var122 == "succeeded" then "Ready" else "Failed"
	local var125 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then useUniverseSearchList(searchStore, p52.userId or (if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0), var117, var114, var120, var106, var107, var104) else nil
	local var126 = if not fFlagBuildExperienceMyCreationsUseUniverseListModule then useLegacySessionList(var120, var110, var109, var117, var106, var107, var104) else nil
	local var127 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var125.refresh else nil
	local var128 = reactModule.useCallback(function() --[[ line: 803 ]]
		-- upvalues: sessionListStore (ref), promiseModule (copy), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var127 (ref)
		local var142 = sessionListStore.refresh()
		local var143 = promiseModule.new(function(p54, p55) --[[ line: 226 ]]
			-- upvalues: var142 (ref)
			task.spawn(function() --[[ line: 227 ]]
				-- upvalues: var142 (copy), p54 (ref), p55 (ref)
				while true do
					while var142.state(false).status == "pending" do
						task.wait()
					end
					local var40 = var142.state(false)
					
					if var40.status == "succeeded" then
						p54(var40.result)
						
						return
					end
					p55(var40.error)
				end
			end)
		end)
		
		return if fFlagBuildExperienceMyCreationsUseUniverseListModule then promiseModule.all({ var127(), var143 }) else var143
	end, { var127, sessionListStore })
	reactModule.useEffect(function() --[[ line: 814 ]]
		-- upvalues: appLifecycleObserverService_1 (ref), var114 (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var127 (ref), ignorePromiseRejection (copy), sessionListStore (ref)
		local onUnhideConnection = appLifecycleObserverService_1.OnUnhide:Connect(function() --[[ line: 815 ]]
			-- upvalues: var114 (copy), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var127 (copy), ignorePromiseRejection (copy), sessionListStore (copy)
			if var114 then
				if fFlagBuildExperienceMyCreationsUseUniverseListModule then
					var127():catch(ignorePromiseRejection)
				end
				sessionListStore.refresh()
			end
		end)
		
		return function() --[[ line: 824 ]]
			-- upvalues: onUnhideConnection (ref)
			onUnhideConnection:Disconnect()
		end
	end, {
		appLifecycleObserverService_1,
		var114,
		var127,
		sessionListStore
	})
	reactModule.useEffect(function() --[[ line: 829 ]]
		-- upvalues: var114 (ref), var116 (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var127 (ref), ignorePromiseRejection (copy), sessionListStore (ref), signalsModule (copy)
		if not var114 then
			var116(false)
			
			return
		end
		var116(false)
		
		if fFlagBuildExperienceMyCreationsUseUniverseListModule then
			var127():catch(ignorePromiseRejection)
		end
		local var145 = sessionListStore.refresh()
		
		return signalsModule.createEffect(function(p56) --[[ line: 840 ]]
			-- upvalues: var145 (ref), var116 (copy)
			if var145.state(p56).status == "succeeded" then
				var116(true)
			end
		end)
	end, { var114, var118, var127, sessionListStore })
	local maxValue = math.max(0, p52.pollingIntervalSeconds or fIntMyCreationsSessionListPollingIntervalSecondsModule)
	reactModule.useEffect(function() --[[ line: 849 ]]
		-- upvalues: var114 (ref), maxValue (ref), sessionListStore (ref)
		if var114 and maxValue ~= 0 then
			local var146 = false
			
			local function scheduleNextPoll() --[[ line: 855 ]]
				-- upvalues: maxValue (copy), var146 (write), sessionListStore (copy), scheduleNextPoll (ref)
				task.delay(maxValue, function() --[[ line: 856 ]]
					-- upvalues: var146 (copy), sessionListStore (copy), scheduleNextPoll (copy)
					if var146 then
						return
					end
					sessionListStore.refresh()
					scheduleNextPoll()
				end)
			end
			
			task.delay(maxValue, function() --[[ line: 856 ]]
				-- upvalues: var146 (write), sessionListStore (copy), scheduleNextPoll (ref)
				if var146 then
					return
				end
				sessionListStore.refresh()
				scheduleNextPoll()
			end)
			
			return function() --[[ line: 866 ]]
				-- upvalues: var146 (write)
				var146 = true
			end
		end
	end, { var114, maxValue, sessionListStore })
	local var130 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var125.items else var126.displayedItems
	local var131 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var125.items else var126.joinableItems
	local var132 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then false else var126.hasPendingSummary
	local var133 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var125.status else var124
	local var134 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var125.sourceItemCount else #var120
	local var135 = if var133 ~= "Ready" then var134 > 0 else true
	local isPending = var123 == "pending"
	local var137 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var125.failedPageIndex else nil
	local var138 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var125.isLoadingMore else false
	local var139 = reactModule.useCallback(function() --[[ line: 895 ]]
		-- upvalues: sessionListStore (ref), promiseModule (copy), requestHandleToPromise (copy)
		local var148 = sessionListStore.loadMore()
		
		return if var148 == nil then promiseModule.resolve() else requestHandleToPromise(var148)
	end, { isPending, var121, var124, sessionListStore })
	local var140 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var125.loadMore else nil
	local var141 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var125.query else var117
	
	return {
		displayedItems = var130,
		items = var131,
		listStatus = var133,
		hasDisplayedResult = var135,
		hasPendingSummary = var132,
		isSettledNoResults = var141 == var117 and (var135 and (not var132 and #var131 == 0)),
		query = var141,
		sourceItemCount = var134,
		sessionCount = #var120,
		sessionListStatus = var124,
		hasCompletedFocusedRefresh = var115,
		loadError = var105,
		refresh = var128,
		loadMoreIfNeeded = reactModule.useCallback(function(p57) --[[ line: 908 ]]
			-- upvalues: fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var140 (ref), var121 (ref), isPending (ref), var124 (ref), var139 (ref)
			local y = p57.AbsoluteCanvasSize.Y
			
			if p57.CanvasPosition.Y <= 0 or y <= 0 or p57.AbsoluteWindowSize.Y <= 0 then return end
			if math.max(0, y - p57.AbsoluteWindowSize.Y - 250) < p57.CanvasPosition.Y then
				if fFlagBuildExperienceMyCreationsUseUniverseListModule then
					var140()
					
					if var121 == nil or isPending or var124 ~= "Ready" then
						return
					else
						var139()
						
						return
					end
				elseif var121 ~= nil and not isPending and var124 == "Ready" then
					var139()
				end
			end
		end, {
			isPending,
			var139,
			var140,
			var121,
			var124
		}),
		failedLoadMore = var137 ~= nil,
		retryLoadMore = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var140 else noOp,
		isLoadingMore = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var138 else isPending
	}
end