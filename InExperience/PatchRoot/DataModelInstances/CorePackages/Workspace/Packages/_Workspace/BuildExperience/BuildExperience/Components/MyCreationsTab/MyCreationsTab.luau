local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local appLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local playersService = game:GetService("Players")
local myCreationsSessionListPollingIntervalSeconds = game:DefineFastInt("MyCreationsSessionListPollingIntervalSeconds", 60)
local fFlagBuildExperienceMyCreationsUseUniverseListModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsUseUniverseList)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
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
local badge = foundationModule.Badge
local privacyType = universeConfigurationModule.PrivacyType
local list = foundationModule.List
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local refreshScrollingFrame = luaSocialLibrariesDepsModule.SocialLibraries.config({}).Components.RefreshScrollingFrame
local badgeShape = foundationModule.Enums.BadgeShape
local badgeSize = foundationModule.Enums.BadgeSize
local badgeVariant = foundationModule.Enums.BadgeVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local buildEmptyStateModule = require(script.Parent.Parent.BuildEmptyState.BuildEmptyState)
local contentMaturityUtilsModule = require(script.Parent.Parent.Parent.utils.ContentMaturityUtils)
local matchesSearchQueryModule = require(script.Parent.Parent.Parent.utils.matchesSearchQuery)
local chatConstantsModule = require(script.Parent.Parent.Parent.Chat.chatConstants)
local _ = require(script.Parent.Parent.Parent.Chat.chatTypes)
local getBuildExperienceRefreshStoreModule = require(script.Parent.Parent.Parent.Stores.GetBuildExperienceRefreshStore)
local getSearchQueryStoreModule = require(script.Parent.Parent.Parent.Stores.GetSearchQueryStore)
local _ = require(script.Parent.Parent.Parent.Stores.GetSearchQueryStore.createSearchQueryStore)
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(script.Parent.Parent.Parent.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local fFlagBuildExperienceMyCreationsUseAudiencesModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsUseAudiences)
local fFlagBuildRehydrateOnPublishModule = require(buildExperience.Flags.FFlagBuildRehydrateOnPublish)
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local fFlagBuildExperienceStableMyCreationsListItemsModule = require(buildExperience.Flags.FFlagBuildExperienceStableMyCreationsListItems)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local var29 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(script.Parent.Parent.Parent.Telemetry.useScrollPerformanceTracker) else nil
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

local function _(p0)
	return string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", p0)
end

local function privacyLabelForSummary(p1, p2, p3)
	-- upvalues: fFlagBuildExperienceMyCreationsUseAudiencesModule (ref), universeConfigurationModule (ref), fFlagBuildRehydrateOnPublishModule (ref), privacyType (ref)
	local var45 = if fFlagBuildExperienceMyCreationsUseAudiencesModule then universeConfigurationModule.getPrivacyTypeForAudiences(p1.audiences) else p1.privacyType
	
	if fFlagBuildRehydrateOnPublishModule and p1.isActive == true and var45 == privacyType.Public then
		return if p2 == nil then nil elseif p2 then p3.publiclyUnavailable elseif var45 == privacyType.Public then p3["public"] elseif var45 == privacyType.FriendsOnly then p3.restricted else p3.private
	end
end

local _ = function(p4, p5)
	-- upvalues: fFlagBuildExperienceMyCreationsUseAudiencesModule (ref), universeConfigurationModule (ref), privacyType (ref)
	local _ = nil
	local var46 = if fFlagBuildExperienceMyCreationsUseAudiencesModule and p4.audiences ~= nil then universeConfigurationModule.getPrivacyTypeForAudiences(p4.audiences) else p4.privacyType
	
	return if var46 == privacyType.Public then p5["public"] elseif var46 == privacyType.FriendsOnly then p5.restricted else p5.private
end

local _ = function(p6, p7, p8)
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

local _ = function(p9, p10)
	local roblox = p9._meta and p9._meta._roblox
	local var48 = if roblox then roblox.sessionStatus else nil
	
	return if var48 == nil then nil else p10[var48]
end

local function requestHandleToPromise(p11)
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p12, p13)
		-- upvalues: p11 (ref)
		task.spawn(function()
			-- upvalues: p11 (copy), p12 (ref), p13 (ref)
			while p11.state(false).status == "pending" do
				task.wait()
			end
			local var49 = p11.state(false)
			
			if var49.status == "succeeded" then
				p12(var49.result)
				
				return
			end
			p13(var49.error)
		end)
	end)
end

local function ignorePromiseRejection() end

local _ = function(p14)
	local roblox = p14._meta and p14._meta._roblox
	
	if roblox == nil then
		return nil
	end
	local universeId = roblox.universeId
	
	return if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
end

local function buildExperienceMetadataByUniverseId(p15, p16, p17)
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

local function buildSessionItems(p18, p19, p20, p21, p22)
	-- upvalues: fFlagBuildLocalization (ref), localizationStringsModule (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in p18 do
		local var55, universeId
		local sessionId = v.sessionId
		local roblox = v._meta and v._meta._roblox
		
		if roblox == nil then
			var55 = nil
		else
			universeId = roblox.universeId
			var55 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
		end
		if typeof(sessionId) == "string" and sessionId ~= "" and (var55 ~= nil and not t[var55]) then
			t[var55] = true
			local var56 = if p19 then p19[var55] else nil
			universeId = nil
			universeId = if fFlagBuildLocalization then if var56 then var56.experienceName else v.title or p22(var55) elseif var56 then var56.experienceName else v.title or localizationStringsModule.formatMyCreationsUniverseName(var55)
			local t_2 = {
				sessionId = sessionId,
				universeId = var55,
				placeId = if var56 then var56.placeId else nil,
				experienceName = universeId,
				creatorName = if var56 then var56.creatorName else nil
			}
			local roblox_1 = v._meta and v._meta._roblox
			local var59 = if roblox_1 then roblox_1.sessionStatus else nil
			t_2.description = if var59 == nil then nil else p20[var59]
			t_2.visibilityLabel = if var56 then var56.visibilityLabel else p21.private
			t_2.gameIcon = if var56 then var56.gameIcon else string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", var55)
			table.insert(t_1, t_2)
		end
	end
	return t_1
end

local function buildLatestSessionByUniverseId(p23)
	local t = {}
	
	for i, v in p23 do
		local var62
		local roblox = v._meta and v._meta._roblox
		
		if roblox == nil then
			var62 = nil
		else
			local universeId = roblox.universeId
			var62 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
		end
		if var62 ~= nil and t[var62] == nil then
			t[var62] = v
		end
	end
	return t
end

local function buildUniverseItems(p24, p25, p26, p27, p28)
	-- upvalues: buildLatestSessionByUniverseId (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref), fFlagBuildExperienceMyCreationsUseAudiencesModule (ref), universeConfigurationModule (ref), privacyType (ref)
	local var63 = buildLatestSessionByUniverseId(p25)
	local t = {}
	
	for i, v in p24 do
		if not v.isArchived then
			local var67
			local id = v.id
			local var65 = var63[id]
			local name = v.name
			local _ = nil
			local t_1 = {
				sessionId = if var65 then var65.sessionId else nil,
				universeId = id,
				placeId = v.rootPlaceId,
				experienceName = if typeof(name) == "string" and name ~= "" then name elseif fFlagBuildLocalization then p28(id) else localizationStringsModule.formatMyCreationsUniverseName(id),
				creatorName = if typeof(v.creatorName) == "string" and v.creatorName ~= "" then v.creatorName else nil
			}
			
			if var65 then
				local roblox = var65._meta and var65._meta._roblox
				local var69 = if roblox then roblox.sessionStatus else nil
				var67 = if var69 == nil then nil else p26[var69]
			else
				var67 = nil
			end
			t_1.description = var67
			local _ = nil
			local var70 = if fFlagBuildExperienceMyCreationsUseAudiencesModule and v.audiences ~= nil then universeConfigurationModule.getPrivacyTypeForAudiences(v.audiences) else v.privacyType
			t_1.visibilityLabel = if var70 == privacyType.Public then p27["public"] elseif var70 == privacyType.FriendsOnly then p27.restricted else p27.private
			t_1.gameIcon = string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", id)
			table.insert(t, t_1)
		end
	end
	return t
end

local function useUniverseSearchList(p29, p30, p31, p32, p33, p34, p35, p36)
	-- upvalues: reactModule (ref), signalsModule (ref), t_1 (ref), useSignalState (ref), ignorePromiseRejection (ref), buildUniverseItems (ref)
	local var71 = reactModule.useRef({})
	local var72 = reactModule.useRef(p31)
	var72.current = p31
	local var73, var74 = reactModule.useState({ query = p31, pageIndexes = { 0 } })
	local var75 = reactModule.useMemo(function()
		-- upvalues: var73 (ref), p29 (ref), p30 (ref)
		local t = {}
		
		for i, v in var73.pageIndexes do
			local query = var73.query
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
	end, { var73, p29, p30 })
	local var76 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var75 (ref), t_1 (copy), var73 (ref)
		return signalsModule.createComputed(function(p37)
			-- upvalues: var75 (copy), t_1 (copy), var73 (copy)
			local t = {}
			local t_2 = {}
			local var82 = nil
			local totalResults = nil
			local var84 = 0
			local var85 = "NotReady"
			local var86 = "NotReady"
			
			for i, v in var75 do
				local var89 = v.data(p37)
				var85 = v.status(p37)
				
				if i == 1 then
					var86 = var85
				end
				if var89 ~= nil then
					var82 = var89
					totalResults = var89.totalResults or (var89.totalHits or totalResults)
					local data = var89.data or t_1
					var84 += #data
					
					for i_1, v_1 in data do
						if not t_2[v_1.id] then
							t_2[v_1.id] = true
							table.insert(t, v_1)
						end
					end
				end
			end
			local var87 = nil
			local var88 = nil
			
			if var85 == "Ready" and var82 ~= nil then
				local nextResultIndex = var82.nextResultIndex
				
				if nextResultIndex ~= nil then
					var87 = nextResultIndex / 50
				elseif totalResults ~= nil and var84 < totalResults then
					var87 = var73.pageIndexes[#var73.pageIndexes] + 1
				end
				if var87 ~= nil and (var87 < 0 or table.find(var73.pageIndexes, var87)) then
					var87 = nil
				end
			elseif var85 == "Failed" and #var75 > 1 then
				var88 = var73.pageIndexes[#var73.pageIndexes]
			end
			return {
				items = t,
				status = var86,
				nextPageIndex = var87,
				failedPageIndex = var88,
				isLoadingMore = #var75 > 1 and var85 == "NotReady"
			}
		end)
	end, { var73.pageIndexes, var75 }))
	local var77 = reactModule.useCallback(function(p38, p39, p40)
		-- upvalues: var71 (ref), p29 (ref), p30 (ref)
		local var91 = `{p39}\0{p38}`
		
		if p40 then
			var71.current[var91] = nil
		end
		var91 = var71.current[var91]
		
		if var91 == nil then
			local var92 = nil
			var92 = p29.refreshSearch({
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
			}):finally(function()
				-- upvalues: var71 (copy), var91 (ref), var92 (write)
				if var71.current[var91] == var92 then
					var71.current[var91] = nil
				end
			end)
			var71.current[var91] = var92
			
			return var92
		end
		return var91
	end, { p29, p30 })
	local var78 = reactModule.useCallback(function(p41)
		-- upvalues: var72 (ref), var74 (ref), var77 (ref)
		p41 = p41 or var72.current
		var74({ query = p41, pageIndexes = { 0 } })
		
		return var77(p41, 0)
	end, { var77 })
	reactModule.useEffect(function()
		-- upvalues: p32 (ref), var73 (ref), p31 (ref), var78 (ref), ignorePromiseRejection (copy)
		if p32 and var73.query ~= p31 then
			var78(p31):catch(ignorePromiseRejection)
		end
	end, { p31, p32, var78, var73.query })
	
	return {
		items = reactModule.useMemo(function()
			-- upvalues: buildUniverseItems (copy), var76 (ref), p33 (ref), p34 (ref), p35 (ref), p36 (ref)
			return buildUniverseItems(var76.items, p33, p34, p35, p36)
		end, {
			p34,
			var76.items,
			p33,
			p35,
			p36
		}),
		status = var76.status,
		sourceItemCount = #var76.items,
		failedPageIndex = var76.failedPageIndex,
		isLoadingMore = var76.isLoadingMore,
		refresh = var78,
		loadMore = reactModule.useCallback(function()
			-- upvalues: var76 (ref), var73 (ref), var72 (ref), var74 (ref), var77 (ref), ignorePromiseRejection (copy)
			local failedPageIndex = var76.failedPageIndex or var76.nextPageIndex
			local query = var73.query
			
			if var76.isLoadingMore or failedPageIndex == nil or var72.current ~= query then return end
			if var76.failedPageIndex == nil then
				var74(function(p42)
					-- upvalues: query (ref), failedPageIndex (ref)
					if p42.query == query and not table.find(p42.pageIndexes, failedPageIndex) then
						local cloned = table.clone(p42.pageIndexes)
						table.insert(cloned, failedPageIndex)
						
						return { query = p42.query, pageIndexes = cloned }
					end
					return p42
				end)
			end
			var77(query, failedPageIndex, var76.failedPageIndex ~= nil):catch(ignorePromiseRejection)
		end, { var76, var77, var73.query })
	}
end

local function useLegacySessionList(p43, p44, p45, p46, p47, p48, p49)
	-- upvalues: reactModule (ref), signalsModule (ref), useSignalState (ref), fFlagBuildRehydrateOnPublishModule (ref), privacyType (ref), contentMaturityUtilsModule (ref), t (ref), buildExperienceMetadataByUniverseId (ref), buildSessionItems (ref), matchesSearchQueryModule (ref)
	local var96 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p43 (ref), p44 (ref)
		return signalsModule.createComputed(function(p50)
			-- upvalues: p43 (copy), p44 (copy)
			local t = {}
			local t_1 = {}
			
			for i, v in p43 do
				local var103
				local roblox = v._meta and v._meta._roblox
				
				if roblox == nil then
					var103 = nil
				else
					local universeId = roblox.universeId
					var103 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
				end
				if var103 ~= nil and not t_1[var103] then
					t_1[var103] = true
					local var104 = p44.getAndFetchSummary(var103).data(p50)
					
					if var104 ~= nil then
						t[var103] = var104
					end
				end
			end
			return t
		end)
	end, { p44, p43 }))
	local var97 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), fFlagBuildRehydrateOnPublishModule (copy), p45 (ref), var96 (ref), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
		return signalsModule.createComputed(function(p51)
			-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), p45 (copy), var96 (copy), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
			local t_1 = {}
			
			if fFlagBuildRehydrateOnPublishModule and p45 ~= nil then
				for i, v in var96 do
					if v.isActive == true and v.privacyType == privacyType.Public and p45.getAndFetchEligibility(i).data(p51) ~= nil then
						t_1[i] = contentMaturityUtilsModule.isSealBroken(i) and contentMaturityUtilsModule.isContentUnrated(i)
					end
				end
			end
			return if next(t_1) == nil then t else t_1
		end)
	end, { p45, var96 }))
	local var98 = reactModule.useMemo(function()
		-- upvalues: buildExperienceMetadataByUniverseId (copy), var96 (ref), var97 (ref), p48 (ref)
		return buildExperienceMetadataByUniverseId(var96, var97, p48)
	end, { var97, var96, p48 })
	local var99 = reactModule.useMemo(function()
		-- upvalues: buildSessionItems (copy), p43 (ref), var98 (ref), p47 (ref), p48 (ref), p49 (ref), var96 (ref)
		local t = {}
		
		for i, v in buildSessionItems(p43, var98, p47, p48, p49) do
			local universeId = var96[v.universeId]
			
			if universeId ~= nil and not universeId.isArchived then
				table.insert(t, v)
			end
		end
		return t
	end, {
		p47, var98, p43, var96, p48, p49
	})
	
	return {
		displayedItems = var99,
		joinableItems = reactModule.useMemo(function()
			-- upvalues: p46 (ref), var99 (ref), matchesSearchQueryModule (copy)
			if p46 == "" then
				return var99
			end
			local t = {}
			
			for i, v in var99 do
				if matchesSearchQueryModule(v.experienceName, p46) then
					table.insert(t, v)
				end
			end
			return t
		end, { p46, var99 }),
		hasPendingSummary = reactModule.useMemo(function()
			-- upvalues: p43 (ref), var96 (ref)
			local t = {}
			
			for i, v in p43 do
				local var110
				local roblox = v._meta and v._meta._roblox
				
				if roblox == nil then
					var110 = nil
				else
					local universeId = roblox.universeId
					var110 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
				end
				if var110 ~= nil and not t[var110] then
					t[var110] = true
					
					if var96[var110] == nil then
						return true
					end
				end
			end
			return false
		end, { p43, var96 })
	}
end

local function renderLoadingExperienceSkeleton(p52, p53, p54)
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium",
		LayoutOrder = p53,
		Size = UDim2.new(1, 0, 0, p54.Size.Size_2000),
		testId = `MyCreationsTab.LoadingSkeleton.{p52}`
	}, {
		ThumbnailContainer = reactModule.createElement(view, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(p54.Size.Size_1400, p54.Size.Size_1400)
		}, {
			Thumbnail = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1), radius = radius.Medium })
		}),
		Details = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col fill gap-small size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.72, 0, 0, p54.Size.Size_400),
				radius = radius.Small
			}),
			Description = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.44, 0, 0, p54.Size.Size_250),
				radius = radius.Small
			})
		})
	})
end

local var44 = reactModule.memo(function(p55)
	-- upvalues: reactModule (ref), view (ref), badge (ref), badgeShape (ref), badgeSize (ref), badgeVariant (ref), list (ref)
	return reactModule.createElement(list.Item, {
		LayoutOrder = p55.LayoutOrder,
		leading = reactModule.useMemo(function()
			-- upvalues: p55 (ref)
			return { type = nil, iconVariant = nil, iconName = p55.gameIcon }
		end, { p55.gameIcon }),
		title = p55.experienceName,
		description = p55.description,
		testId = `MyCreationsTab.ExperienceRow.{p55.universeId}`,
		onActivated = reactModule.useCallback(function()
			-- upvalues: p55 (ref)
			p55.onOpenChat({
				universeId = p55.universeId,
				placeId = p55.placeId,
				sessionId = p55.sessionId,
				experienceName = p55.experienceName,
				creatorName = p55.creatorName,
				gameIcon = p55.gameIcon
			})
		end, {
			p55.creatorName, p55.experienceName, p55.gameIcon, p55.onOpenChat, p55.placeId,
			p55.sessionId, p55.universeId
		}),
		trailing = reactModule.useMemo(function()
			-- upvalues: p55 (ref), reactModule (copy), view (copy), badge (copy), badgeShape (copy), badgeSize (copy), badgeVariant (copy)
			return if p55.visibilityLabel == nil then nil else reactModule.createElement(view, { tag = "row align-y-center auto-xy" }, {
				VisibilityBadge = reactModule.createElement(badge, {
					text = p55.visibilityLabel,
					shape = badgeShape.Box,
					size = badgeSize.Small,
					variant = badgeVariant.Neutral,
					testId = `MyCreationsTab.VisibilityBadge.{p55.universeId}`
				})
			})
		end, { p55.universeId, p55.visibilityLabel })
	})
end)

return function(p56)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationRoactContext (ref), localizationModule (ref), t_2 (ref), t_3 (ref), creatorAgentChatModule (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (ref), universeSearchModule (ref), fFlagBuildRehydrateOnPublishModule (ref), universeActivationModule (ref), universeConfigurationModule (ref), getSearchQueryStoreModule (ref), getBuildExperienceRefreshStoreModule (ref), appLifecycleObserverService (ref), useTokens (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var29 (ref), useSignalState (ref), playersService (ref), useUniverseSearchList (ref), useLegacySessionList (ref), promiseModule (ref), ignorePromiseRejection (ref), signalsModule (ref), myCreationsSessionListPollingIntervalSeconds (ref), chatConstantsModule (ref), requestHandleToPromise (ref), renderLoadingExperienceSkeleton (ref), view (ref), list (ref), inputSize (ref), iconName (ref), buildEmptyStateModule (ref), fFlagBuildExperienceStableMyCreationsListItemsModule (ref), var44 (ref), badge (ref), badgeShape (ref), badgeSize (ref), badgeVariant (ref), refreshScrollingFrame (ref), fFlagBuildDesktopReadinessModule (ref)
	local mYCREATIONSBUILDWITHAI, mYCREATIONSLOADERROR, mYCREATIONSNEWGAME
	local var111 = if fFlagBuildLocalization then useLocalization({
		building = localizationStringsModule.MY_CREATIONS_BUILDING,
		buildWithAI = localizationStringsModule.MY_CREATIONS_BUILD_WITH_AI,
		inputNeeded = localizationStringsModule.MY_CREATIONS_INPUT_NEEDED,
		loadError = localizationStringsModule.MY_CREATIONS_LOAD_ERROR,
		newGame = localizationStringsModule.MY_CREATIONS_NEW_GAME,
		private = localizationStringsModule.MY_CREATIONS_PRIVATE,
		["public"] = localizationStringsModule.MY_CREATIONS_PUBLIC,
		publiclyUnavailable = localizationStringsModule.MY_CREATIONS_PUBLICLY_UNAVAILABLE,
		ready = localizationStringsModule.MY_CREATIONS_READY,
		restricted = localizationStringsModule.MY_CREATIONS_RESTRICTED
	}) else nil
	local var112 = if fFlagBuildLocalization then reactModule.useContext(localizationRoactContext) else nil
	local var113 = if fFlagBuildLocalization then reactModule.useCallback(function(p57)
		-- upvalues: var112 (ref), localizationStringsModule (copy)
		return var112:Format(localizationStringsModule.MY_CREATIONS_UNIVERSE_NAME, { UNIVERSE_ID = p57 })
	end, {
		var112,
		if fFlagBuildLocalization then var111[localizationModule.RobloxLocaleIdKey] else nil
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		mYCREATIONSBUILDWITHAI = var111.buildWithAI
		mYCREATIONSLOADERROR = var111.loadError
		mYCREATIONSNEWGAME = var111.newGame
	else
		mYCREATIONSBUILDWITHAI = localizationStringsModule.MY_CREATIONS_BUILD_WITH_AI
		mYCREATIONSLOADERROR = localizationStringsModule.MY_CREATIONS_LOAD_ERROR
		mYCREATIONSNEWGAME = localizationStringsModule.MY_CREATIONS_NEW_GAME
	end
	local var114 = if fFlagBuildLocalization then if fFlagBuildLocalization then reactModule.useMemo(function()
		-- upvalues: var111 (ref)
		return {
			waiting_on_client = var111.inputNeeded,
			idle = var111.ready,
			working = var111.building
		}
	end, { var111.inputNeeded, var111.ready, var111.building }) else nil else t_2
	local var115 = if fFlagBuildLocalization then if fFlagBuildLocalization then reactModule.useMemo(function()
		-- upvalues: var111 (ref)
		return {
			private = var111.private,
			["public"] = var111["public"],
			publiclyUnavailable = var111.publiclyUnavailable,
			restricted = var111.restricted
		}
	end, {
		var111.private,
		var111["public"],
		var111.publiclyUnavailable,
		var111.restricted
	}) else nil else t_3
	local creatorAgentChatStore = p56.creatorAgentChatStore or creatorAgentChatModule.getCreatorAgentChatStore()
	local searchStore = p56.searchStore
	
	if fFlagBuildExperienceMyCreationsUseUniverseListModule and searchStore == nil then
		searchStore = universeSearchModule.getUniverseSearchStore()
	end
	local var117 = if fFlagBuildRehydrateOnPublishModule and not fFlagBuildExperienceMyCreationsUseUniverseListModule then universeActivationModule.getUniverseActivationStore() else nil
	local var118 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then nil else p56.configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
	local searchQueryStore = p56.searchQueryStore or getSearchQueryStoreModule()
	local var120 = getBuildExperienceRefreshStoreModule()
	local appLifecycleObserverService_1 = p56.appLifecycleObserverService or appLifecycleObserverService
	local var122 = p56.isFocused ~= false
	local var123 = useTokens()
	local var124 = reactModule.useRef(nil)
	local var125 = reactModule.useRef(false)
	local var126, var127 = reactModule.useState(false)
	
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var29("LuaApp_Build_Home_Scroll", var124)
	end
	local var152
	local var128 = searchQueryStore.useDebouncedQuery()
	local var129 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then searchQueryStore.useDraftQuery() else nil
	local var130 = useSignalState(var120.getRefreshTick)
	local sessionListStore = creatorAgentChatStore.getSessionListStore()
	local var132 = useSignalState(sessionListStore.getSessions)
	local var133 = useSignalState(sessionListStore.getNextPageToken)
	local var134 = useSignalState(sessionListStore.getStatus)
	local var135 = useSignalState(sessionListStore.getLoadMoreStatus)
	local var136 = if var134 == "pending" then "NotReady" elseif var134 == "succeeded" then "Ready" else "Failed"
	local var137 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then useUniverseSearchList(searchStore, p56.userId or (if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0), var128, var122, var132, var114, var115, var113) else nil
	local var138 = if not fFlagBuildExperienceMyCreationsUseUniverseListModule then useLegacySessionList(var132, var118, var117, var128, var114, var115, var113) else nil
	local var139 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var137.refresh else nil
	local var140 = reactModule.useCallback(function()
		-- upvalues: sessionListStore (ref), promiseModule (copy), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var139 (ref)
		local var161 = sessionListStore.refresh()
		local var162 = promiseModule.new(function(p58, p59)
			-- upvalues: var161 (ref)
			task.spawn(function()
				-- upvalues: var161 (copy), p58 (ref), p59 (ref)
				while true do
					while var161.state(false).status == "pending" do
						task.wait()
					end
					local var49 = var161.state(false)
					
					if var49.status == "succeeded" then
						p58(var49.result)
						
						return
					end
					p59(var49.error)
				end
			end)
		end)
		
		return if fFlagBuildExperienceMyCreationsUseUniverseListModule then promiseModule.all({ var139(), var162 }) else var162
	end, { var139, sessionListStore })
	reactModule.useEffect(function()
		-- upvalues: appLifecycleObserverService_1 (ref), var122 (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var139 (ref), ignorePromiseRejection (copy), sessionListStore (ref)
		local onUnhideConnection = appLifecycleObserverService_1.OnUnhide:Connect(function()
			-- upvalues: var122 (copy), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var139 (copy), ignorePromiseRejection (copy), sessionListStore (copy)
			if var122 then
				if fFlagBuildExperienceMyCreationsUseUniverseListModule then
					var139():catch(ignorePromiseRejection)
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
		var122,
		var139,
		sessionListStore
	})
	reactModule.useEffect(function()
		-- upvalues: var122 (ref), var127 (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var139 (ref), ignorePromiseRejection (copy), sessionListStore (ref), signalsModule (copy)
		if not var122 then
			var127(false)
			
			return
		end
		var127(false)
		
		if fFlagBuildExperienceMyCreationsUseUniverseListModule then
			var139():catch(ignorePromiseRejection)
		end
		local var164 = sessionListStore.refresh()
		
		return signalsModule.createEffect(function(p60)
			-- upvalues: var164 (ref), var127 (copy)
			if var164.state(p60).status == "succeeded" then
				var127(true)
			end
		end)
	end, { var122, var130, var139, sessionListStore })
	local maxValue = math.max(0, p56.pollingIntervalSeconds or myCreationsSessionListPollingIntervalSeconds)
	reactModule.useEffect(function()
		-- upvalues: var122 (ref), maxValue (ref), sessionListStore (ref)
		if var122 and maxValue ~= 0 then
			local var165 = false
			
			local function scheduleNextPoll()
				-- upvalues: maxValue (copy), var165 (write), sessionListStore (copy), scheduleNextPoll (ref)
				task.delay(maxValue, function()
					-- upvalues: var165 (copy), sessionListStore (copy), scheduleNextPoll (copy)
					if var165 then
						return
					end
					sessionListStore.refresh()
					scheduleNextPoll()
				end)
			end
			
			task.delay(maxValue, function()
				-- upvalues: var165 (write), sessionListStore (copy), scheduleNextPoll (ref)
				if var165 then
					return
				end
				sessionListStore.refresh()
				scheduleNextPoll()
			end)
			
			return function()
				-- upvalues: var165 (write)
				var165 = true
			end
		end
	end, { var122, maxValue, sessionListStore })
	local var142 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var137.items else var138.displayedItems
	local var143 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var137.items else var138.joinableItems
	local var144 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then false else var138.hasPendingSummary
	local var145 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var137.status else var136
	local var146 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var137.sourceItemCount else #var132
	local var147 = if var145 ~= "Ready" then var146 > 0 else true
	local isPending = var135 == "pending"
	local var149 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var137.failedPageIndex else nil
	local var150 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var137.isLoadingMore else false
	local var151 = reactModule.useCallback(function()
		-- upvalues: var125 (ref), p56 (ref), chatConstantsModule (copy), playersService (copy)
		var125.current = true
		p56.onOpenChat({
			isNewGameTarget = true,
			experienceName = chatConstantsModule.BUILD_CHAT_PAGE_TITLE,
			creatorName = if playersService.LocalPlayer then playersService.LocalPlayer.Name else nil
		})
	end, { p56.onOpenChat })
	
	if fFlagBuildExperienceMyCreationsUseUniverseListModule then
		var152 = var126
		
		if var152 then
			var152 = false
			
			if var136 == "Ready" then
				var152 = false
				
				if #var132 == 0 then
					var152 = var129 == ""
					var152 = nil
				end
			end
		end
	else
		var152 = var126 and (var145 == "Ready" and var146 == 0)
	end
	local t_1
	reactModule.useEffect(function()
		-- upvalues: p56 (ref), var122 (ref), var152 (ref), var125 (ref), var151 (ref)
		if p56.autoOpenNewGame ~= false and var122 and (var152 and not var125.current) then
			var151()
		end
	end, { var152, var151, var122, p56.autoOpenNewGame })
	local var153 = reactModule.useCallback(function()
		-- upvalues: sessionListStore (ref), promiseModule (copy), requestHandleToPromise (copy)
		local var167 = sessionListStore.loadMore()
		
		return if var167 == nil then promiseModule.resolve() else requestHandleToPromise(var167)
	end, { isPending, var133, var136, sessionListStore })
	local var154 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var137.loadMore else nil
	local var155 = reactModule.useCallback(function(p61)
		-- upvalues: fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var154 (ref), var133 (ref), isPending (ref), var136 (ref), var153 (ref)
		local y = p61.AbsoluteCanvasSize.Y
		
		if p61.CanvasPosition.Y <= 0 or y <= 0 or p61.AbsoluteWindowSize.Y <= 0 then return end
		if math.max(0, y - p61.AbsoluteWindowSize.Y - 250) < p61.CanvasPosition.Y then
			if fFlagBuildExperienceMyCreationsUseUniverseListModule then
				var154()
				
				if var133 == nil or isPending or var136 ~= "Ready" then
					return
				else
					var153()
					
					return
				end
			elseif var133 ~= nil and not isPending and var136 == "Ready" then
				var153()
			end
		end
	end, {
		isPending,
		var153,
		var154,
		var133,
		var136
	})
	local var156 = reactModule.useCallback(function()
		-- upvalues: fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var150 (ref), isPending (ref), renderLoadingExperienceSkeleton (copy), var123 (ref)
		return if if fFlagBuildExperienceMyCreationsUseUniverseListModule then var150 else isPending then renderLoadingExperienceSkeleton(1, 1, var123) else nil
	end, { isPending, var150, var123 })
	local _ = nil
	
	if var147 and not var144 and #var142 == 0 then
		t_1 = {
			EmptyContent = reactModule.createElement(view, { tag = "col size-full" }, {
				CreateList = reactModule.createElement(list.Root, {
					LayoutOrder = 1,
					hasDivider = false,
					isContained = { isContained = false, hasMargin = false },
					size = inputSize.Large
				}, {
					CreateRow = reactModule.createElement(list.Item, {
						LayoutOrder = 1,
						leading = iconName.PlusLarge,
						title = mYCREATIONSNEWGAME,
						description = mYCREATIONSBUILDWITHAI,
						onActivated = var151
					})
				}),
				EmptyState = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "col align-x-center align-y-center fill size-full-0 padding-large",
					testId = "MyCreationsTab.Empty"
				}, {
					Content = reactModule.createElement(buildEmptyStateModule)
				})
			})
		}
	else
		local t = {
			CreateRow = reactModule.createElement(list.Item, {
				LayoutOrder = 1,
				leading = iconName.PlusLarge,
				title = mYCREATIONSNEWGAME,
				description = mYCREATIONSBUILDWITHAI,
				onActivated = var151
			})
		}
		
		if var147 and #var142 > 0 then
			for i, v in var143 do
				local var158 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then "U" .. v.universeId else "S" .. v.sessionId
				
				if fFlagBuildExperienceStableMyCreationsListItemsModule then
					t[var158] = reactModule.createElement(var44, {
						LayoutOrder = i + 1,
						sessionId = v.sessionId,
						universeId = v.universeId,
						placeId = v.placeId,
						experienceName = v.experienceName,
						creatorName = v.creatorName,
						description = v.description,
						visibilityLabel = v.visibilityLabel,
						gameIcon = v.gameIcon,
						onOpenChat = p56.onOpenChat
					})
				else
					local experienceName = v.experienceName
					local gameIcon = v.gameIcon
					local placeId = v.placeId
					local visibilityLabel = v.visibilityLabel
					t[var158] = reactModule.createElement(list.Item, {
						LayoutOrder = i + 1,
						leading = { iconName = gameIcon },
						title = experienceName,
						description = v.description,
						testId = `MyCreationsTab.ExperienceRow.{v.universeId}`,
						onActivated = function()
							-- upvalues: p56 (ref), v (ref), placeId (ref), experienceName (ref), gameIcon (ref)
							p56.onOpenChat({
								universeId = v.universeId,
								placeId = placeId,
								sessionId = v.sessionId,
								experienceName = experienceName,
								creatorName = v.creatorName,
								gameIcon = gameIcon
							})
						end,
						trailing = if visibilityLabel ~= nil then nil else reactModule.createElement(view, { tag = "row align-y-center auto-xy" }, {
							VisibilityBadge = reactModule.createElement(badge, {
								text = visibilityLabel,
								shape = badgeShape.Box,
								size = badgeSize.Small,
								variant = badgeVariant.Neutral,
								testId = `MyCreationsTab.VisibilityBadge.{v.universeId}`
							})
						})
					})
				end
			end
		elseif var145 == "NotReady" or var144 then
			t[`Loading{1}`] = renderLoadingExperienceSkeleton(1, 2, var123)
			t[`Loading{2}`] = renderLoadingExperienceSkeleton(2, 3, var123)
		elseif var145 == "Failed" then
			t.Error = reactModule.createElement(list.Item, { LayoutOrder = 2, title = mYCREATIONSLOADERROR })
		end
		if var149 ~= nil then
			t.LoadMoreError = reactModule.createElement(list.Item, {
				testId = "MyCreationsTab.LoadMoreError",
				LayoutOrder = #var143 + 2,
				title = mYCREATIONSLOADERROR,
				onActivated = var154
			})
		end
		t_1 = {
			ExperienceList = reactModule.createElement(list.Root, {
				hasDivider = false,
				isContained = { isContained = false, hasMargin = false },
				size = inputSize.Large
			}, t)
		}
	end
	local var160 = reactModule.createElement(view, {
		tag = "composition-content-body col size-full-0 auto-y",
		testId = "MyCreationsTab.ContentBody"
	}, t_1)
	
	return reactModule.createElement(refreshScrollingFrame, {
		usesBuilderIcon = true,
		refresh = var140,
		ref = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then var124 else nil,
		onCanvasPositionChangedCallback = var155,
		onCanvasSizeChangedCallback = var155,
		createFooter = var156,
		scrollingElementProps = {
			LayoutOrder = p56.LayoutOrder,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			CanvasSize = UDim2.new(1, 0, 1, 1),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			[reactModule.Tag] = "fill"
		}
	}, if fFlagBuildDesktopReadinessModule then {
		ContentLayout = reactModule.createElement(view, {
			testId = "MyCreationsTab.ContentLayout",
			tag = {
				["composition-layout-detail"] = true,
				["size-full-0 auto-y"] = true
			}
		}, { ContentBody = var160 })
	} else { ContentBody = var160 })
end