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
local var1 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(script.Parent.Parent.Parent.Telemetry.useScrollPerformanceTracker) else nil
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
	local var2 = if fFlagBuildExperienceMyCreationsUseAudiencesModule then universeConfigurationModule.getPrivacyTypeForAudiences(p1.audiences) else p1.privacyType
	
	if fFlagBuildRehydrateOnPublishModule and p1.isActive == true and var2 == privacyType.Public then
		return if p2 == nil then nil elseif p2 then p3.publiclyUnavailable elseif var2 == privacyType.Public then p3["public"] elseif var2 == privacyType.FriendsOnly then p3.restricted else p3.private
	end
end

local _ = function(p1, p2)
	-- upvalues: fFlagBuildExperienceMyCreationsUseAudiencesModule (ref), universeConfigurationModule (ref), privacyType (ref)
	local _ = nil
	local var2 = if fFlagBuildExperienceMyCreationsUseAudiencesModule and p1.audiences ~= nil then universeConfigurationModule.getPrivacyTypeForAudiences(p1.audiences) else p1.privacyType
	
	return if var2 == privacyType.Public then p2["public"] elseif var2 == privacyType.FriendsOnly then p2.restricted else p2.private
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
	local var2 = if roblox then roblox.sessionStatus else nil
	
	return if var2 == nil then nil else p2[var2]
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
			local var2 = p1.state(false)
			
			if var2.status == "succeeded" then
				p2(var2.result)
				
				return
			end
			p3(var2.error)
		end)
	end)
end

local function ignorePromiseRejection() end

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
		local var2, universeId
		local sessionId = v.sessionId
		local roblox = v._meta and v._meta._roblox
		
		if roblox == nil then
			var2 = nil
		else
			universeId = roblox.universeId
			var2 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
		end
		if typeof(sessionId) == "string" and sessionId ~= "" and (var2 ~= nil and not t[var2]) then
			t[var2] = true
			local var3 = if p6 then p6[var2] else nil
			universeId = nil
			universeId = if fFlagBuildLocalization then if var3 then var3.experienceName else v.title or p9(var2) elseif var3 then var3.experienceName else v.title or localizationStringsModule.formatMyCreationsUniverseName(var2)
			local t_2 = {
				sessionId = sessionId,
				universeId = var2,
				placeId = if var3 then var3.placeId else nil,
				experienceName = universeId,
				creatorName = if var3 then var3.creatorName else nil
			}
			local roblox_1 = v._meta and v._meta._roblox
			local var4 = if roblox_1 then roblox_1.sessionStatus else nil
			t_2.description = if var4 == nil then nil else p7[var4]
			t_2.visibilityLabel = if var3 then var3.visibilityLabel else p8.private
			t_2.gameIcon = if var3 then var3.gameIcon else string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", var2)
			table.insert(t_1, t_2)
		end
	end
	return t_1
end

local function buildLatestSessionByUniverseId(p10)
	local t = {}
	
	for i, v in p10 do
		local var5
		local roblox = v._meta and v._meta._roblox
		
		if roblox == nil then
			var5 = nil
		else
			local universeId = roblox.universeId
			var5 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
		end
		if var5 ~= nil and t[var5] == nil then
			t[var5] = v
		end
	end
	return t
end

local function buildUniverseItems(p11, p12, p13, p14, p15)
	-- upvalues: buildLatestSessionByUniverseId (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref), fFlagBuildExperienceMyCreationsUseAudiencesModule (ref), universeConfigurationModule (ref), privacyType (ref)
	local var6 = buildLatestSessionByUniverseId(p12)
	local t = {}
	
	for i, v in p11 do
		if not v.isArchived then
			local var7
			local id = v.id
			local var8 = var6[id]
			local name = v.name
			local _ = nil
			local t_1 = {
				sessionId = if var8 then var8.sessionId else nil,
				universeId = id,
				placeId = v.rootPlaceId,
				experienceName = if typeof(name) == "string" and name ~= "" then name elseif fFlagBuildLocalization then p15(id) else localizationStringsModule.formatMyCreationsUniverseName(id),
				creatorName = if typeof(v.creatorName) == "string" and v.creatorName ~= "" then v.creatorName else nil
			}
			
			if var8 then
				local roblox = var8._meta and var8._meta._roblox
				local var9 = if roblox then roblox.sessionStatus else nil
				var7 = if var9 == nil then nil else p13[var9]
			else
				var7 = nil
			end
			t_1.description = var7
			local _ = nil
			local var10 = if fFlagBuildExperienceMyCreationsUseAudiencesModule and v.audiences ~= nil then universeConfigurationModule.getPrivacyTypeForAudiences(v.audiences) else v.privacyType
			t_1.visibilityLabel = if var10 == privacyType.Public then p14["public"] elseif var10 == privacyType.FriendsOnly then p14.restricted else p14.private
			t_1.gameIcon = string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", id)
			table.insert(t, t_1)
		end
	end
	return t
end

local function useUniverseSearchList(p16, p17, p18, p19, p20, p21, p22, p23)
	-- upvalues: reactModule (ref), signalsModule (ref), t_1 (ref), useSignalState (ref), ignorePromiseRejection (ref), buildUniverseItems (ref)
	local var11 = reactModule.useRef({})
	local var12 = reactModule.useRef(p18)
	var12.current = p18
	local var13, var14 = reactModule.useState({ query = p18, pageIndexes = { 0 } })
	local var15 = reactModule.useMemo(function()
		-- upvalues: var13 (ref), p16 (ref), p17 (ref)
		local t = {}
		
		for i, v in var13.pageIndexes do
			local query = var13.query
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
	end, { var13, p16, p17 })
	local var16 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var15 (ref), t_1 (copy), var13 (ref)
		return signalsModule.createComputed(function(p24)
			-- upvalues: var15 (copy), t_1 (copy), var13 (copy)
			local t = {}
			local t_2 = {}
			local var17 = nil
			local totalResults = nil
			local var18 = 0
			local var19 = "NotReady"
			local var20 = "NotReady"
			
			for i, v in var15 do
				local var21 = v.data(p24)
				var19 = v.status(p24)
				
				if i == 1 then
					var20 = var19
				end
				if var21 ~= nil then
					var17 = var21
					totalResults = var21.totalResults or (var21.totalHits or totalResults)
					local data = var21.data or t_1
					var18 += #data
					
					for i_1, v_1 in data do
						if not t_2[v_1.id] then
							t_2[v_1.id] = true
							table.insert(t, v_1)
						end
					end
				end
			end
			local var22 = nil
			local var23 = nil
			
			if var19 == "Ready" and var17 ~= nil then
				local nextResultIndex = var17.nextResultIndex
				
				if nextResultIndex ~= nil then
					var22 = nextResultIndex / 50
				elseif totalResults ~= nil and var18 < totalResults then
					var22 = var13.pageIndexes[#var13.pageIndexes] + 1
				end
				if var22 ~= nil and (var22 < 0 or table.find(var13.pageIndexes, var22)) then
					var22 = nil
				end
			elseif var19 == "Failed" and #var15 > 1 then
				var23 = var13.pageIndexes[#var13.pageIndexes]
			end
			return {
				items = t,
				status = var20,
				nextPageIndex = var22,
				failedPageIndex = var23,
				isLoadingMore = #var15 > 1 and var19 == "NotReady"
			}
		end)
	end, { var13.pageIndexes, var15 }))
	local var24 = reactModule.useCallback(function(p25, p26, p27)
		-- upvalues: var11 (ref), p16 (ref), p17 (ref)
		local var25 = `{p26}\0{p25}`
		
		if p27 then
			var11.current[var25] = nil
		end
		var25 = var11.current[var25]
		
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
				-- upvalues: var11 (copy), var25 (ref), var26 (write)
				if var11.current[var25] == var26 then
					var11.current[var25] = nil
				end
			end)
			var11.current[var25] = var26
			
			return var26
		end
		return var25
	end, { p16, p17 })
	local var25 = reactModule.useCallback(function(p25)
		-- upvalues: var12 (ref), var14 (ref), var24 (ref)
		p25 = p25 or var12.current
		var14({ query = p25, pageIndexes = { 0 } })
		
		return var24(p25, 0)
	end, { var24 })
	reactModule.useEffect(function()
		-- upvalues: p19 (ref), var13 (ref), p18 (ref), var25 (ref), ignorePromiseRejection (copy)
		if p19 and var13.query ~= p18 then
			var25(p18):catch(ignorePromiseRejection)
		end
	end, { p18, p19, var25, var13.query })
	
	return {
		items = reactModule.useMemo(function()
			-- upvalues: buildUniverseItems (copy), var16 (ref), p20 (ref), p21 (ref), p22 (ref), p23 (ref)
			return buildUniverseItems(var16.items, p20, p21, p22, p23)
		end, {
			p21,
			var16.items,
			p20,
			p22,
			p23
		}),
		status = var16.status,
		sourceItemCount = #var16.items,
		failedPageIndex = var16.failedPageIndex,
		isLoadingMore = var16.isLoadingMore,
		refresh = var25,
		loadMore = reactModule.useCallback(function()
			-- upvalues: var16 (ref), var13 (ref), var12 (ref), var14 (ref), var24 (ref), ignorePromiseRejection (copy)
			local failedPageIndex = var16.failedPageIndex or var16.nextPageIndex
			local query = var13.query
			
			if var16.isLoadingMore or failedPageIndex == nil or var12.current ~= query then return end
			if var16.failedPageIndex == nil then
				var14(function(p25)
					-- upvalues: query (ref), failedPageIndex (ref)
					if p25.query == query and not table.find(p25.pageIndexes, failedPageIndex) then
						local cloned = table.clone(p25.pageIndexes)
						table.insert(cloned, failedPageIndex)
						
						return { query = p25.query, pageIndexes = cloned }
					end
					return p25
				end)
			end
			var24(query, failedPageIndex, var16.failedPageIndex ~= nil):catch(ignorePromiseRejection)
		end, { var16, var24, var13.query })
	}
end

local function useLegacySessionList(p24, p25, p26, p27, p28, p29, p30)
	-- upvalues: reactModule (ref), signalsModule (ref), useSignalState (ref), fFlagBuildRehydrateOnPublishModule (ref), privacyType (ref), contentMaturityUtilsModule (ref), t (ref), buildExperienceMetadataByUniverseId (ref), buildSessionItems (ref), matchesSearchQueryModule (ref)
	local var17 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p24 (ref), p25 (ref)
		return signalsModule.createComputed(function(p31)
			-- upvalues: p24 (copy), p25 (copy)
			local t = {}
			local t_1 = {}
			
			for i, v in p24 do
				local var18
				local roblox = v._meta and v._meta._roblox
				
				if roblox == nil then
					var18 = nil
				else
					local universeId = roblox.universeId
					var18 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
				end
				if var18 ~= nil and not t_1[var18] then
					t_1[var18] = true
					local var19 = p25.getAndFetchSummary(var18).data(p31)
					
					if var19 ~= nil then
						t[var18] = var19
					end
				end
			end
			return t
		end)
	end, { p25, p24 }))
	local var18 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), fFlagBuildRehydrateOnPublishModule (copy), p26 (ref), var17 (ref), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
		return signalsModule.createComputed(function(p31)
			-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), p26 (copy), var17 (copy), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
			local t_1 = {}
			
			if fFlagBuildRehydrateOnPublishModule and p26 ~= nil then
				for i, v in var17 do
					if v.isActive == true and v.privacyType == privacyType.Public and p26.getAndFetchEligibility(i).data(p31) ~= nil then
						t_1[i] = contentMaturityUtilsModule.isSealBroken(i) and contentMaturityUtilsModule.isContentUnrated(i)
					end
				end
			end
			return if next(t_1) == nil then t else t_1
		end)
	end, { p26, var17 }))
	local var19 = reactModule.useMemo(function()
		-- upvalues: buildExperienceMetadataByUniverseId (copy), var17 (ref), var18 (ref), p29 (ref)
		return buildExperienceMetadataByUniverseId(var17, var18, p29)
	end, { var18, var17, p29 })
	local var20 = reactModule.useMemo(function()
		-- upvalues: buildSessionItems (copy), p24 (ref), var19 (ref), p28 (ref), p29 (ref), p30 (ref), var17 (ref)
		local t = {}
		
		for i, v in buildSessionItems(p24, var19, p28, p29, p30) do
			local universeId = var17[v.universeId]
			
			if universeId ~= nil and not universeId.isArchived then
				table.insert(t, v)
			end
		end
		return t
	end, {
		p28, var19, p24, var17, p29, p30
	})
	
	return {
		displayedItems = var20,
		joinableItems = reactModule.useMemo(function()
			-- upvalues: p27 (ref), var20 (ref), matchesSearchQueryModule (copy)
			if p27 == "" then
				return var20
			end
			local t = {}
			
			for i, v in var20 do
				if matchesSearchQueryModule(v.experienceName, p27) then
					table.insert(t, v)
				end
			end
			return t
		end, { p27, var20 }),
		hasPendingSummary = reactModule.useMemo(function()
			-- upvalues: p24 (ref), var17 (ref)
			local t = {}
			
			for i, v in p24 do
				local var21
				local roblox = v._meta and v._meta._roblox
				
				if roblox == nil then
					var21 = nil
				else
					local universeId = roblox.universeId
					var21 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
				end
				if var21 ~= nil and not t[var21] then
					t[var21] = true
					
					if var17[var21] == nil then
						return true
					end
				end
			end
			return false
		end, { p24, var17 })
	}
end

local function renderLoadingExperienceSkeleton(p31, p32, p33)
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium",
		LayoutOrder = p32,
		Size = UDim2.new(1, 0, 0, p33.Size.Size_2000),
		testId = `MyCreationsTab.LoadingSkeleton.{p31}`
	}, {
		ThumbnailContainer = reactModule.createElement(view, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(p33.Size.Size_1400, p33.Size.Size_1400)
		}, {
			Thumbnail = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1), radius = radius.Medium })
		}),
		Details = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col fill gap-small size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.72, 0, 0, p33.Size.Size_400),
				radius = radius.Small
			}),
			Description = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.44, 0, 0, p33.Size.Size_250),
				radius = radius.Small
			})
		})
	})
end

local var21 = reactModule.memo(function(p31)
	-- upvalues: reactModule (ref), view (ref), badge (ref), badgeShape (ref), badgeSize (ref), badgeVariant (ref), list (ref)
	return reactModule.createElement(list.Item, {
		LayoutOrder = p31.LayoutOrder,
		leading = reactModule.useMemo(function()
			-- upvalues: p31 (ref)
			return { type = nil, iconVariant = nil, iconName = p31.gameIcon }
		end, { p31.gameIcon }),
		title = p31.experienceName,
		description = p31.description,
		testId = `MyCreationsTab.ExperienceRow.{p31.universeId}`,
		onActivated = reactModule.useCallback(function()
			-- upvalues: p31 (ref)
			p31.onOpenChat({
				universeId = p31.universeId,
				placeId = p31.placeId,
				sessionId = p31.sessionId,
				experienceName = p31.experienceName,
				creatorName = p31.creatorName,
				gameIcon = p31.gameIcon
			})
		end, {
			p31.creatorName, p31.experienceName, p31.gameIcon, p31.onOpenChat, p31.placeId,
			p31.sessionId, p31.universeId
		}),
		trailing = reactModule.useMemo(function()
			-- upvalues: p31 (ref), reactModule (copy), view (copy), badge (copy), badgeShape (copy), badgeSize (copy), badgeVariant (copy)
			return if p31.visibilityLabel == nil then nil else reactModule.createElement(view, { tag = "row align-y-center auto-xy" }, {
				VisibilityBadge = reactModule.createElement(badge, {
					text = p31.visibilityLabel,
					shape = badgeShape.Box,
					size = badgeSize.Small,
					variant = badgeVariant.Neutral,
					testId = `MyCreationsTab.VisibilityBadge.{p31.universeId}`
				})
			})
		end, { p31.universeId, p31.visibilityLabel })
	})
end)

return function(p31)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationRoactContext (ref), localizationModule (ref), t_2 (ref), t_3 (ref), creatorAgentChatModule (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (ref), universeSearchModule (ref), fFlagBuildRehydrateOnPublishModule (ref), universeActivationModule (ref), universeConfigurationModule (ref), getSearchQueryStoreModule (ref), getBuildExperienceRefreshStoreModule (ref), appLifecycleObserverService (ref), useTokens (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var1 (ref), useSignalState (ref), playersService (ref), useUniverseSearchList (ref), useLegacySessionList (ref), promiseModule (ref), ignorePromiseRejection (ref), signalsModule (ref), myCreationsSessionListPollingIntervalSeconds (ref), chatConstantsModule (ref), requestHandleToPromise (ref), renderLoadingExperienceSkeleton (ref), view (ref), list (ref), inputSize (ref), iconName (ref), buildEmptyStateModule (ref), fFlagBuildExperienceStableMyCreationsListItemsModule (ref), var21 (ref), badge (ref), badgeShape (ref), badgeSize (ref), badgeVariant (ref), refreshScrollingFrame (ref), fFlagBuildDesktopReadinessModule (ref)
	local mYCREATIONSBUILDWITHAI, mYCREATIONSLOADERROR, mYCREATIONSNEWGAME
	local var22 = if fFlagBuildLocalization then useLocalization({
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
	local var23 = if fFlagBuildLocalization then reactModule.useContext(localizationRoactContext) else nil
	local var24 = if fFlagBuildLocalization then reactModule.useCallback(function(p32)
		-- upvalues: var23 (ref), localizationStringsModule (copy)
		return var23:Format(localizationStringsModule.MY_CREATIONS_UNIVERSE_NAME, { UNIVERSE_ID = p32 })
	end, {
		var23,
		if fFlagBuildLocalization then var22[localizationModule.RobloxLocaleIdKey] else nil
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		mYCREATIONSBUILDWITHAI = var22.buildWithAI
		mYCREATIONSLOADERROR = var22.loadError
		mYCREATIONSNEWGAME = var22.newGame
	else
		mYCREATIONSBUILDWITHAI = localizationStringsModule.MY_CREATIONS_BUILD_WITH_AI
		mYCREATIONSLOADERROR = localizationStringsModule.MY_CREATIONS_LOAD_ERROR
		mYCREATIONSNEWGAME = localizationStringsModule.MY_CREATIONS_NEW_GAME
	end
	local var25 = if fFlagBuildLocalization then if fFlagBuildLocalization then reactModule.useMemo(function()
		-- upvalues: var22 (ref)
		return {
			waiting_on_client = var22.inputNeeded,
			idle = var22.ready,
			working = var22.building
		}
	end, { var22.inputNeeded, var22.ready, var22.building }) else nil else t_2
	local var26 = if fFlagBuildLocalization then if fFlagBuildLocalization then reactModule.useMemo(function()
		-- upvalues: var22 (ref)
		return {
			private = var22.private,
			["public"] = var22["public"],
			publiclyUnavailable = var22.publiclyUnavailable,
			restricted = var22.restricted
		}
	end, {
		var22.private,
		var22["public"],
		var22.publiclyUnavailable,
		var22.restricted
	}) else nil else t_3
	local creatorAgentChatStore = p31.creatorAgentChatStore or creatorAgentChatModule.getCreatorAgentChatStore()
	local searchStore = p31.searchStore
	
	if fFlagBuildExperienceMyCreationsUseUniverseListModule and searchStore == nil then
		searchStore = universeSearchModule.getUniverseSearchStore()
	end
	local var27 = if fFlagBuildRehydrateOnPublishModule and not fFlagBuildExperienceMyCreationsUseUniverseListModule then universeActivationModule.getUniverseActivationStore() else nil
	local var28 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then nil else p31.configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
	local searchQueryStore = p31.searchQueryStore or getSearchQueryStoreModule()
	local var29 = getBuildExperienceRefreshStoreModule()
	local appLifecycleObserverService_1 = p31.appLifecycleObserverService or appLifecycleObserverService
	local var30 = p31.isFocused ~= false
	local var31 = useTokens()
	local var32 = reactModule.useRef(nil)
	local var33 = reactModule.useRef(false)
	local var34, var35 = reactModule.useState(false)
	
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var1("LuaApp_Build_Home_Scroll", var32)
	end
	local var36
	local var37 = searchQueryStore.useDebouncedQuery()
	local var38 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then searchQueryStore.useDraftQuery() else nil
	local var39 = useSignalState(var29.getRefreshTick)
	local sessionListStore = creatorAgentChatStore.getSessionListStore()
	local var40 = useSignalState(sessionListStore.getSessions)
	local var41 = useSignalState(sessionListStore.getNextPageToken)
	local var42 = useSignalState(sessionListStore.getStatus)
	local var43 = useSignalState(sessionListStore.getLoadMoreStatus)
	local var44 = if var42 == "pending" then "NotReady" elseif var42 == "succeeded" then "Ready" else "Failed"
	local var45 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then useUniverseSearchList(searchStore, p31.userId or (if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0), var37, var30, var40, var25, var26, var24) else nil
	local var46 = if not fFlagBuildExperienceMyCreationsUseUniverseListModule then useLegacySessionList(var40, var28, var27, var37, var25, var26, var24) else nil
	local var47 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var45.refresh else nil
	local var48 = reactModule.useCallback(function()
		-- upvalues: sessionListStore (ref), promiseModule (copy), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var47 (ref)
		local var49 = sessionListStore.refresh()
		local var50 = promiseModule.new(function(p32, p33)
			-- upvalues: var49 (ref)
			task.spawn(function()
				-- upvalues: var49 (copy), p32 (ref), p33 (ref)
				while true do
					while var49.state(false).status == "pending" do
						task.wait()
					end
					local var51 = var49.state(false)
					
					if var51.status == "succeeded" then
						p32(var51.result)
						
						return
					end
					p33(var51.error)
				end
			end)
		end)
		
		return if fFlagBuildExperienceMyCreationsUseUniverseListModule then promiseModule.all({ var47(), var50 }) else var50
	end, { var47, sessionListStore })
	reactModule.useEffect(function()
		-- upvalues: appLifecycleObserverService_1 (ref), var30 (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var47 (ref), ignorePromiseRejection (copy), sessionListStore (ref)
		local onUnhideConnection = appLifecycleObserverService_1.OnUnhide:Connect(function()
			-- upvalues: var30 (copy), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var47 (copy), ignorePromiseRejection (copy), sessionListStore (copy)
			if var30 then
				if fFlagBuildExperienceMyCreationsUseUniverseListModule then
					var47():catch(ignorePromiseRejection)
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
		var30,
		var47,
		sessionListStore
	})
	reactModule.useEffect(function()
		-- upvalues: var30 (ref), var35 (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var47 (ref), ignorePromiseRejection (copy), sessionListStore (ref), signalsModule (copy)
		if not var30 then
			var35(false)
			
			return
		end
		var35(false)
		
		if fFlagBuildExperienceMyCreationsUseUniverseListModule then
			var47():catch(ignorePromiseRejection)
		end
		local var51 = sessionListStore.refresh()
		
		return signalsModule.createEffect(function(p34)
			-- upvalues: var51 (ref), var35 (copy)
			if var51.state(p34).status == "succeeded" then
				var35(true)
			end
		end)
	end, { var30, var39, var47, sessionListStore })
	local maxValue = math.max(0, p31.pollingIntervalSeconds or myCreationsSessionListPollingIntervalSeconds)
	reactModule.useEffect(function()
		-- upvalues: var30 (ref), maxValue (ref), sessionListStore (ref)
		if var30 and maxValue ~= 0 then
			local var51 = false
			
			local function scheduleNextPoll()
				-- upvalues: maxValue (copy), var51 (write), sessionListStore (copy), scheduleNextPoll (ref)
				task.delay(maxValue, function()
					-- upvalues: var51 (copy), sessionListStore (copy), scheduleNextPoll (copy)
					if var51 then
						return
					end
					sessionListStore.refresh()
					scheduleNextPoll()
				end)
			end
			
			task.delay(maxValue, function()
				-- upvalues: var51 (write), sessionListStore (copy), scheduleNextPoll (ref)
				if var51 then
					return
				end
				sessionListStore.refresh()
				scheduleNextPoll()
			end)
			
			return function()
				-- upvalues: var51 (write)
				var51 = true
			end
		end
	end, { var30, maxValue, sessionListStore })
	local var51 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var45.items else var46.displayedItems
	local var52 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var45.items else var46.joinableItems
	local var53 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then false else var46.hasPendingSummary
	local var54 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var45.status else var44
	local var55 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var45.sourceItemCount else #var40
	local var56 = if var54 ~= "Ready" then var55 > 0 else true
	local isPending = var43 == "pending"
	local var57 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var45.failedPageIndex else nil
	local var58 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var45.isLoadingMore else false
	local var59 = reactModule.useCallback(function()
		-- upvalues: var33 (ref), p31 (ref), chatConstantsModule (copy), playersService (copy)
		var33.current = true
		p31.onOpenChat({
			isNewGameTarget = true,
			experienceName = chatConstantsModule.BUILD_CHAT_PAGE_TITLE,
			creatorName = if playersService.LocalPlayer then playersService.LocalPlayer.Name else nil
		})
	end, { p31.onOpenChat })
	
	if fFlagBuildExperienceMyCreationsUseUniverseListModule then
		var36 = var34
		
		if var36 then
			var36 = false
			
			if var44 == "Ready" then
				var36 = false
				
				if #var40 == 0 then
					var36 = var38 == ""
					var36 = nil
				end
			end
		end
	else
		var36 = var34 and (var54 == "Ready" and var55 == 0)
	end
	local t_1
	reactModule.useEffect(function()
		-- upvalues: p31 (ref), var30 (ref), var36 (ref), var33 (ref), var59 (ref)
		if p31.autoOpenNewGame ~= false and var30 and (var36 and not var33.current) then
			var59()
		end
	end, { var36, var59, var30, p31.autoOpenNewGame })
	local var60 = reactModule.useCallback(function()
		-- upvalues: sessionListStore (ref), promiseModule (copy), requestHandleToPromise (copy)
		local var61 = sessionListStore.loadMore()
		
		return if var61 == nil then promiseModule.resolve() else requestHandleToPromise(var61)
	end, { isPending, var41, var44, sessionListStore })
	local var61 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var45.loadMore else nil
	local var62 = reactModule.useCallback(function(p34)
		-- upvalues: fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var61 (ref), var41 (ref), isPending (ref), var44 (ref), var60 (ref)
		local y = p34.AbsoluteCanvasSize.Y
		
		if p34.CanvasPosition.Y <= 0 or y <= 0 or p34.AbsoluteWindowSize.Y <= 0 then return end
		if math.max(0, y - p34.AbsoluteWindowSize.Y - 250) < p34.CanvasPosition.Y then
			if fFlagBuildExperienceMyCreationsUseUniverseListModule then
				var61()
				
				if var41 == nil or isPending or var44 ~= "Ready" then
					return
				else
					var60()
					
					return
				end
			elseif var41 ~= nil and not isPending and var44 == "Ready" then
				var60()
			end
		end
	end, {
		isPending,
		var60,
		var61,
		var41,
		var44
	})
	local var63 = reactModule.useCallback(function()
		-- upvalues: fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var58 (ref), isPending (ref), renderLoadingExperienceSkeleton (copy), var31 (ref)
		return if if fFlagBuildExperienceMyCreationsUseUniverseListModule then var58 else isPending then renderLoadingExperienceSkeleton(1, 1, var31) else nil
	end, { isPending, var58, var31 })
	local _ = nil
	
	if var56 and not var53 and #var51 == 0 then
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
						onActivated = var59
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
				onActivated = var59
			})
		}
		
		if var56 and #var51 > 0 then
			for i, v in var52 do
				local var64 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then "U" .. v.universeId else "S" .. v.sessionId
				
				if fFlagBuildExperienceStableMyCreationsListItemsModule then
					t[var64] = reactModule.createElement(var21, {
						LayoutOrder = i + 1,
						sessionId = v.sessionId,
						universeId = v.universeId,
						placeId = v.placeId,
						experienceName = v.experienceName,
						creatorName = v.creatorName,
						description = v.description,
						visibilityLabel = v.visibilityLabel,
						gameIcon = v.gameIcon,
						onOpenChat = p31.onOpenChat
					})
				else
					local experienceName = v.experienceName
					local gameIcon = v.gameIcon
					local placeId = v.placeId
					local visibilityLabel = v.visibilityLabel
					t[var64] = reactModule.createElement(list.Item, {
						LayoutOrder = i + 1,
						leading = { iconName = gameIcon },
						title = experienceName,
						description = v.description,
						testId = `MyCreationsTab.ExperienceRow.{v.universeId}`,
						onActivated = function()
							-- upvalues: p31 (ref), v (ref), placeId (ref), experienceName (ref), gameIcon (ref)
							p31.onOpenChat({
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
		elseif var54 == "NotReady" or var53 then
			t[`Loading{1}`] = renderLoadingExperienceSkeleton(1, 2, var31)
			t[`Loading{2}`] = renderLoadingExperienceSkeleton(2, 3, var31)
		elseif var54 == "Failed" then
			t.Error = reactModule.createElement(list.Item, { LayoutOrder = 2, title = mYCREATIONSLOADERROR })
		end
		if var57 ~= nil then
			t.LoadMoreError = reactModule.createElement(list.Item, {
				testId = "MyCreationsTab.LoadMoreError",
				LayoutOrder = #var52 + 2,
				title = mYCREATIONSLOADERROR,
				onActivated = var61
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
	local var65 = reactModule.createElement(view, {
		tag = "composition-content-body col size-full-0 auto-y",
		testId = "MyCreationsTab.ContentBody"
	}, t_1)
	
	return reactModule.createElement(refreshScrollingFrame, {
		usesBuilderIcon = true,
		refresh = var48,
		ref = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then var32 else nil,
		onCanvasPositionChangedCallback = var62,
		onCanvasSizeChangedCallback = var62,
		createFooter = var63,
		scrollingElementProps = {
			LayoutOrder = p31.LayoutOrder,
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
		}, { ContentBody = var65 })
	} else { ContentBody = var65 })
end