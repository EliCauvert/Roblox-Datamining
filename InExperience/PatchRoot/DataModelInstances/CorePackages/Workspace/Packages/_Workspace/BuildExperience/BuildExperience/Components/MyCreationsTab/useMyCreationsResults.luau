local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local appLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local playersService = game:GetService("Players")
local fIntMyCreationsSessionListPollingIntervalSecondsModule = require(buildExperience.Flags.FIntMyCreationsSessionListPollingIntervalSeconds)
local fFlagBuildExperienceMyCreationsUseUniverseListModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsUseUniverseList)
local fFlagBuildFixLiveStalenessModule = require(buildExperience.Flags.FFlagBuildFixLiveStaleness)
local fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsFindSessionsByUniverse)
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
local fFlagBuildPublishTerminologyChangeModule = require(buildExperience.Flags.FFlagBuildPublishTerminologyChange)
local fFlagBuildExperiencePinForBuild = sharedFlagsModule.FFlagBuildExperiencePinForBuild
local useSignalState = signalsReactModule.useSignalState
local var1 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then 15 else 50
local t = {}
local t_1 = {}

local function _(p1)
	return string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", p1)
end

local function privacyLabelForSummary(p1, p2, p3)
	-- upvalues: universeConfigurationModule (ref), fFlagBuildPublishTerminologyChangeModule (ref), privacyType (ref)
	local privacyTypeForAudiences = universeConfigurationModule.getPrivacyTypeForAudiences(p1.audiences)
	
	if fFlagBuildPublishTerminologyChangeModule then
		return if p1.isActive == true and privacyTypeForAudiences == privacyType.Public and (p2 == nil or p2) then nil elseif privacyTypeForAudiences == privacyType.Public then p3.live else nil
	elseif p1.isActive == true and privacyTypeForAudiences == privacyType.Public then
		return if p2 == nil then nil elseif p2 then p3.publiclyUnavailable elseif privacyTypeForAudiences == privacyType.Public then p3["public"] elseif privacyTypeForAudiences == privacyType.FriendsOnly then p3.restricted else p3.private
	end
end

local function privacyLabelForSearchItem(p1, p2)
	-- upvalues: fFlagBuildFixLiveStalenessModule (ref), universeConfigurationModule (ref), fFlagBuildPublishTerminologyChangeModule (ref), privacyType (ref)
	local var2 = if fFlagBuildFixLiveStalenessModule then universeConfigurationModule.getPrivacyTypeForAudiences(p1.audiences) elseif p1.audiences ~= nil then p1.privacyType else universeConfigurationModule.getPrivacyTypeForAudiences(p1.audiences)
	
	return if fFlagBuildPublishTerminologyChangeModule then if var2 == privacyType.Public then p2.live else nil elseif var2 == privacyType.Public then p2["public"] elseif var2 == privacyType.FriendsOnly then p2.restricted else p2.private
end

local _ = function(p1, p2, p3)
	-- upvalues: var1 (ref), fFlagBuildFixLiveStalenessModule (ref)
	return {
		creatorType = "User",
		surface = "CreatorHubCreations",
		isArchived = false,
		isTeamCreateEnabled = true,
		sortParam = "LastUpdated",
		sortOrder = "Desc",
		creatorTargetId = p1,
		pageIndex = p3,
		pageSize = var1,
		search = if p2 ~= "" then nil else p2,
		needsAssetOptions = if fFlagBuildFixLiveStalenessModule then true else nil
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
	-- upvalues: fFlagBuildPublishTerminologyChangeModule (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in p5 do
		local var2
		local sessionId = v.sessionId
		local roblox = v._meta and v._meta._roblox
		
		if roblox == nil then
			var2 = nil
		else
			local universeId = roblox.universeId
			var2 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
		end
		if typeof(sessionId) == "string" and sessionId ~= "" and (var2 ~= nil and not t[var2]) then
			t[var2] = true
			local var3 = if p6 then p6[var2] else nil
			local t_2 = {
				sessionId = sessionId,
				universeId = var2,
				placeId = if var3 then var3.placeId else nil,
				experienceName = if var3 then var3.experienceName else v.title or p9(var2),
				creatorName = if var3 then var3.creatorName else nil
			}
			local roblox_1 = v._meta and v._meta._roblox
			local var4 = if roblox_1 then roblox_1.sessionStatus else nil
			t_2.description = if var4 == nil then nil else p7[var4]
			t_2.visibilityLabel = if var3 then var3.visibilityLabel elseif fFlagBuildPublishTerminologyChangeModule then nil else p8.private
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

local function useUniverseSessions(p11, p12)
	-- upvalues: reactModule (ref), fFlagBuildExperiencePinForBuild (ref), promiseModule (ref), ignorePromiseRejection (ref), signalsModule (ref), useSignalState (ref)
	local var6, var7 = reactModule.useState({})
	local var8 = reactModule.useRef(var6)
	var8.current = var6
	local var9 = reactModule.useRef({})
	local var10 = reactModule.useRef(p12)
	var10.current = p12
	local var11 = reactModule.useRef(true)
	reactModule.useEffect(function()
		-- upvalues: var11 (ref)
		var11.current = true
		
		return function()
			-- upvalues: var11 (copy)
			var11.current = false
		end
	end, {})
	local var12 = reactModule.useCallback(function(p13)
		-- upvalues: var10 (ref), var9 (ref), var8 (ref), p11 (ref), fFlagBuildExperiencePinForBuild (copy), promiseModule (copy), var11 (ref), var7 (ref)
		local t = {}
		
		for i, v in var10.current do
			if not v.isArchived then
				local id = v.id
				local var13 = var9.current[id]
				
				if var13 ~= nil then
					table.insert(t, var13.promise)
				elseif p13 or var8.current[id] == nil then
					local var14 = p11.sessionFindByUniverse({
						sort = "desc",
						universeId = id,
						application = if fFlagBuildExperiencePinForBuild then "build" else nil,
						filterByPinForBuild = if fFlagBuildExperiencePinForBuild then true else nil
					})
					local t_1 = { promise = nil, handle = var14 }
					var9.current[id] = t_1
					local var15 = promiseModule.new(function(p14, p15)
						-- upvalues: var14 (ref)
						task.spawn(function()
							-- upvalues: var14 (copy), p14 (ref), p15 (ref)
							while true do
								while var14.state(false).status == "pending" do
									task.wait()
								end
								local var16 = var14.state(false)
								
								if var16.status == "succeeded" then
									p14(var16.result)
									
									return
								end
								p15(var16.error)
							end
						end)
					end):andThen(function()
						-- upvalues: var9 (copy), id (ref), var14 (ref), var11 (copy), var8 (copy), var7 (copy)
						local var17 = var9.current[id]
						
						if var17 == nil or var17.handle ~= var14 then return end
						var9.current[id] = nil
						
						if var11.current then
							local cloned = table.clone(var8.current)
							cloned[id] = var14
							var8.current = cloned
							var7(cloned)
						end
					end, function(p16)
						-- upvalues: var9 (copy), id (ref), var14 (ref), promiseModule (copy)
						local var17 = var9.current[id]
						
						if var17 ~= nil and var17.handle == var14 then
							var9.current[id] = nil
						end
						return promiseModule.reject(p16)
					end)
					t_1.promise = var15
					table.insert(t, var15)
				end
			end
		end
		return promiseModule.all(t)
	end, { p11 })
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), ignorePromiseRejection (copy)
		var12(false):catch(ignorePromiseRejection)
	end, { p12, var12 })
	
	return {
		entries = useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), p12 (ref), var6 (ref)
			return signalsModule.createComputed(function(p14)
				-- upvalues: p12 (copy), var6 (copy)
				local t = {}
				
				for i, v in p12 do
					local id = var6[v.id]
					local var16 = if id ~= nil then nil else id.state(p14)
					
					if var16 ~= nil and var16.status == "succeeded" and var16.result ~= nil then
						local sessions = var16.result.sessions
						local var17 = if typeof(sessions) == "table" then sessions[1] else nil
						
						if var17 ~= nil then
							table.insert(t, var17)
						end
					end
				end
				return t
			end)
		end, { p12, var6 })),
		refresh = reactModule.useCallback(function()
			-- upvalues: var12 (ref)
			return var12(true)
		end, { var12 })
	}
end

local function buildUniverseItems(p14, p15, p16, p17, p18)
	-- upvalues: buildLatestSessionByUniverseId (ref), privacyLabelForSearchItem (ref)
	local var16 = buildLatestSessionByUniverseId(p15)
	local t = {}
	
	for i, v in p14 do
		if not v.isArchived then
			local var17
			local id = v.id
			local var18 = var16[id]
			local name = v.name
			local _ = nil
			local t_1 = {
				sessionId = if var18 then var18.sessionId else nil,
				universeId = id,
				placeId = v.rootPlaceId,
				experienceName = if typeof(name) == "string" and name ~= "" then name else p18(id),
				creatorName = if typeof(v.creatorName) == "string" and v.creatorName ~= "" then v.creatorName else nil
			}
			
			if var18 then
				local roblox = var18._meta and var18._meta._roblox
				local var19 = if roblox then roblox.sessionStatus else nil
				var17 = if var19 == nil then nil else p16[var19]
			else
				var17 = nil
			end
			t_1.description = var17
			t_1.visibilityLabel = privacyLabelForSearchItem(v, p17)
			t_1.gameIcon = string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", id)
			table.insert(t, t_1)
		end
	end
	return t
end

local function useUniverseSearchList(p19, p20, p21, p22, p23, p24, p25, p26, p27)
	-- upvalues: reactModule (ref), var1 (ref), fFlagBuildFixLiveStalenessModule (ref), signalsModule (ref), t_1 (ref), useSignalState (ref), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (ref), useUniverseSessions (ref), ignorePromiseRejection (ref), buildUniverseItems (ref)
	local var20 = reactModule.useRef({})
	local var21 = reactModule.useRef(p21)
	var21.current = p21
	local var22, var23 = reactModule.useState({ query = p21, pageIndexes = { 0 } })
	local var24 = reactModule.useMemo(function()
		-- upvalues: var22 (ref), p19 (ref), p20 (ref), var1 (copy), fFlagBuildFixLiveStalenessModule (copy)
		local t = {}
		
		for i, v in var22.pageIndexes do
			local query = var22.query
			table.insert(t, p19.getSearch({
				creatorType = "User",
				surface = "CreatorHubCreations",
				isArchived = false,
				isTeamCreateEnabled = true,
				sortParam = "LastUpdated",
				sortOrder = "Desc",
				creatorTargetId = p20,
				pageIndex = v,
				pageSize = var1,
				search = if query ~= "" then nil else query,
				needsAssetOptions = if fFlagBuildFixLiveStalenessModule then true else nil
			}))
		end
		return t
	end, { var22, p19, p20 })
	local var25 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var24 (ref), t_1 (copy), var1 (copy), var22 (ref)
		return signalsModule.createComputed(function(p28)
			-- upvalues: var24 (copy), t_1 (copy), var1 (copy), var22 (copy)
			local t = {}
			local t_2 = {}
			local var26 = nil
			local totalResults = nil
			local var27 = 0
			local var28 = "NotReady"
			local var29 = "NotReady"
			
			for i, v in var24 do
				local var30 = v.data(p28)
				var28 = v.status(p28)
				
				if i == 1 then
					var29 = var28
				end
				if var30 ~= nil then
					var26 = var30
					totalResults = var30.totalResults or (var30.totalHits or totalResults)
					local data = var30.data or t_1
					var27 += #data
					
					for i_1, v_1 in data do
						if not t_2[v_1.id] then
							t_2[v_1.id] = true
							table.insert(t, v_1)
						end
					end
				end
			end
			local var31 = nil
			local var32 = nil
			
			if var28 == "Ready" and var26 ~= nil then
				local nextResultIndex = var26.nextResultIndex
				
				if nextResultIndex ~= nil then
					var31 = nextResultIndex / var1
				elseif totalResults ~= nil and var27 < totalResults then
					var31 = var22.pageIndexes[#var22.pageIndexes] + 1
				end
				if var31 ~= nil and (var31 < 0 or table.find(var22.pageIndexes, var31)) then
					var31 = nil
				end
			elseif var28 == "Failed" and #var24 > 1 then
				var32 = var22.pageIndexes[#var22.pageIndexes]
			end
			return {
				items = t,
				status = var29,
				nextPageIndex = var31,
				failedPageIndex = var32,
				isLoadingMore = #var24 > 1 and var28 == "NotReady"
			}
		end)
	end, { var22.pageIndexes, var24 }))
	local var33 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then useUniverseSessions(p27, var25.items) else nil
	local var34 = reactModule.useCallback(function(p29, p30, p31)
		-- upvalues: var20 (ref), p19 (ref), p20 (ref), var1 (copy), fFlagBuildFixLiveStalenessModule (copy)
		local var35 = `{p30}\0{p29}`
		
		if p31 then
			var20.current[var35] = nil
		end
		local var36 = var20.current[var35]
		
		if var36 == nil then
			local var37 = nil
			var37 = p19.refreshSearch({
				creatorType = "User",
				surface = "CreatorHubCreations",
				isArchived = false,
				isTeamCreateEnabled = true,
				sortParam = "LastUpdated",
				sortOrder = "Desc",
				creatorTargetId = p20,
				pageIndex = p30,
				pageSize = var1,
				search = if p29 ~= "" then nil else p29,
				needsAssetOptions = if fFlagBuildFixLiveStalenessModule then true else nil
			}):finally(function()
				-- upvalues: var20 (copy), var35 (ref), var37 (write)
				if var20.current[var35] == var37 then
					var20.current[var35] = nil
				end
			end)
			var20.current[var35] = var37
			
			return var37
		end
		return var36
	end, { p19, p20 })
	local var35 = reactModule.useCallback(function(p29)
		-- upvalues: var21 (ref), var23 (ref), var34 (ref)
		p29 = p29 or var21.current
		var23({ query = p29, pageIndexes = { 0 } })
		
		return var34(p29, 0)
	end, { var34 })
	reactModule.useEffect(function()
		-- upvalues: p22 (ref), var22 (ref), p21 (ref), var35 (ref), ignorePromiseRejection (copy)
		if p22 and var22.query ~= p21 then
			var35(p21):catch(ignorePromiseRejection)
		end
	end, { p21, p22, var35, var22.query })
	
	return {
		items = reactModule.useMemo(function()
			-- upvalues: buildUniverseItems (copy), var25 (ref), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var33 (ref), p23 (ref), p24 (ref), p25 (ref), p26 (ref)
			return buildUniverseItems(var25.items, if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then var33.entries else p23, p24, p25, p26)
		end, {
			p24,
			var25.items,
			if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then var33.entries else p23,
			p25,
			p26
		}),
		status = var25.status,
		sourceItemCount = #var25.items,
		failedPageIndex = var25.failedPageIndex,
		isLoadingMore = var25.isLoadingMore,
		query = var22.query,
		refresh = var35,
		refreshSessions = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then var33.refresh else nil,
		loadMore = reactModule.useCallback(function()
			-- upvalues: var25 (ref), var22 (ref), var21 (ref), var23 (ref), var34 (ref), ignorePromiseRejection (copy)
			local failedPageIndex = var25.failedPageIndex or var25.nextPageIndex
			local query = var22.query
			
			if var25.isLoadingMore or failedPageIndex == nil or var21.current ~= query then return end
			if var25.failedPageIndex == nil then
				var23(function(p29)
					-- upvalues: query (ref), failedPageIndex (ref)
					if p29.query == query and not table.find(p29.pageIndexes, failedPageIndex) then
						local cloned = table.clone(p29.pageIndexes)
						table.insert(cloned, failedPageIndex)
						
						return { query = p29.query, pageIndexes = cloned }
					end
					return p29
				end)
			end
			var34(query, failedPageIndex, var25.failedPageIndex ~= nil):catch(ignorePromiseRejection)
		end, { var25, var34, var22.query })
	}
end

local function useLegacySessionList(p28, p29, p30, p31, p32, p33, p34)
	-- upvalues: reactModule (ref), signalsModule (ref), useSignalState (ref), privacyType (ref), contentMaturityUtilsModule (ref), t (ref), buildExperienceMetadataByUniverseId (ref), buildSessionItems (ref), matchesSearchQueryModule (ref)
	local var26 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p28 (ref), p29 (ref)
		return signalsModule.createComputed(function(p35)
			-- upvalues: p28 (copy), p29 (copy)
			local t = {}
			local t_1 = {}
			
			for i, v in p28 do
				local var27
				local roblox = v._meta and v._meta._roblox
				
				if roblox == nil then
					var27 = nil
				else
					local universeId = roblox.universeId
					var27 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
				end
				if var27 ~= nil and not t_1[var27] then
					t_1[var27] = true
					local var28 = p29.getAndFetchSummary(var27).data(p35)
					
					if var28 ~= nil then
						t[var27] = var28
					end
				end
			end
			return t
		end)
	end, { p29, p28 }))
	local var27 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p30 (ref), var26 (ref), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
		return signalsModule.createComputed(function(p35)
			-- upvalues: p30 (copy), var26 (copy), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
			local t_1 = {}
			
			if p30 ~= nil then
				for i, v in var26 do
					if v.isActive == true and v.privacyType == privacyType.Public and p30.getAndFetchEligibility(i).data(p35) ~= nil then
						t_1[i] = contentMaturityUtilsModule.isSealBroken(i) and contentMaturityUtilsModule.isContentUnrated(i)
					end
				end
			end
			return if next(t_1) == nil then t else t_1
		end)
	end, { p30, var26 }))
	local var28 = reactModule.useMemo(function()
		-- upvalues: buildExperienceMetadataByUniverseId (copy), var26 (ref), var27 (ref), p33 (ref)
		return buildExperienceMetadataByUniverseId(var26, var27, p33)
	end, { var27, var26, p33 })
	local var29 = reactModule.useMemo(function()
		-- upvalues: buildSessionItems (copy), p28 (ref), var28 (ref), p32 (ref), p33 (ref), p34 (ref), var26 (ref)
		local t = {}
		
		for i, v in buildSessionItems(p28, var28, p32, p33, p34) do
			local universeId = var26[v.universeId]
			
			if universeId ~= nil and not universeId.isArchived then
				table.insert(t, v)
			end
		end
		return t
	end, {
		p32, var28, p28, var26, p33, p34
	})
	
	return {
		displayedItems = var29,
		joinableItems = reactModule.useMemo(function()
			-- upvalues: p31 (ref), var29 (ref), matchesSearchQueryModule (copy)
			if p31 == "" then
				return var29
			end
			local t = {}
			
			for i, v in var29 do
				if matchesSearchQueryModule(v.experienceName, p31) then
					table.insert(t, v)
				end
			end
			return t
		end, { p31, var29 }),
		hasPendingSummary = reactModule.useMemo(function()
			-- upvalues: p28 (ref), var26 (ref)
			local t = {}
			
			for i, v in p28 do
				local var30
				local roblox = v._meta and v._meta._roblox
				
				if roblox == nil then
					var30 = nil
				else
					local universeId = roblox.universeId
					var30 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
				end
				if var30 ~= nil and not t[var30] then
					t[var30] = true
					
					if var26[var30] == nil then
						return true
					end
				end
			end
			return false
		end, { p28, var26 })
	}
end

return function(p35)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationRoactContext (ref), localizationModule (ref), creatorAgentChatModule (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (ref), universeSearchModule (ref), universeActivationModule (ref), universeConfigurationModule (ref), getSearchQueryStoreModule (ref), getBuildExperienceRefreshStoreModule (ref), appLifecycleObserverService (ref), useSignalState (ref), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (ref), playersService (ref), useUniverseSearchList (ref), useLegacySessionList (ref), promiseModule (ref), ignorePromiseRejection (ref), signalsModule (ref), fIntMyCreationsSessionListPollingIntervalSecondsModule (ref), requestHandleToPromise (ref), noOp (ref)
	local var30 = useLocalization({
		building = localizationStringsModule.MY_CREATIONS_BUILDING,
		inputNeeded = localizationStringsModule.MY_CREATIONS_INPUT_NEEDED,
		loadError = localizationStringsModule.MY_CREATIONS_LOAD_ERROR,
		live = localizationStringsModule.MY_CREATIONS_LIVE,
		private = localizationStringsModule.MY_CREATIONS_PRIVATE,
		["public"] = localizationStringsModule.MY_CREATIONS_PUBLIC,
		publiclyUnavailable = localizationStringsModule.MY_CREATIONS_PUBLICLY_UNAVAILABLE,
		ready = localizationStringsModule.MY_CREATIONS_READY,
		restricted = localizationStringsModule.MY_CREATIONS_RESTRICTED
	})
	local var31 = reactModule.useContext(localizationRoactContext)
	local var32 = reactModule.useCallback(function(p36)
		-- upvalues: var31 (ref), localizationStringsModule (copy)
		return var31:Format(localizationStringsModule.MY_CREATIONS_UNIVERSE_NAME, { UNIVERSE_ID = p36 })
	end, { var31, var30[localizationModule.RobloxLocaleIdKey] })
	local loadError = var30.loadError
	local var33 = reactModule.useMemo(function()
		-- upvalues: var30 (ref)
		return {
			waiting_on_client = var30.inputNeeded,
			idle = var30.ready,
			working = var30.building
		}
	end, { var30.inputNeeded, var30.ready, var30.building })
	local var34 = reactModule.useMemo(function()
		-- upvalues: var30 (ref)
		return {
			live = var30.live,
			private = var30.private,
			["public"] = var30["public"],
			publiclyUnavailable = var30.publiclyUnavailable,
			restricted = var30.restricted
		}
	end, {
		var30.live,
		var30.private,
		var30["public"],
		var30.publiclyUnavailable,
		var30.restricted
	})
	local creatorAgentChatStore = p35.creatorAgentChatStore or creatorAgentChatModule.getCreatorAgentChatStore()
	local searchStore = p35.searchStore
	
	if fFlagBuildExperienceMyCreationsUseUniverseListModule and searchStore == nil then
		searchStore = universeSearchModule.getUniverseSearchStore()
	end
	local var35 = if not fFlagBuildExperienceMyCreationsUseUniverseListModule then universeActivationModule.getUniverseActivationStore() else nil
	local var36 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then nil else p35.configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
	local searchQueryStore = p35.searchQueryStore or getSearchQueryStoreModule()
	local var37 = getBuildExperienceRefreshStoreModule()
	local appLifecycleObserverService_1 = p35.appLifecycleObserverService or appLifecycleObserverService
	local var38 = p35.isFocused ~= false
	local var39, var40 = reactModule.useState(false)
	local var41 = searchQueryStore.useDebouncedQuery()
	local var42 = useSignalState(var37.getRefreshTick)
	local var43 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then reactModule.useRef(var42) else nil
	local var44 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then reactModule.useRef(var38) else nil
	local sessionListStore = creatorAgentChatStore.getSessionListStore()
	local var45 = useSignalState(sessionListStore.getSessions)
	local var46 = useSignalState(sessionListStore.getNextPageToken)
	local var47 = useSignalState(sessionListStore.getStatus)
	local var48 = useSignalState(sessionListStore.getLoadMoreStatus)
	local var49 = if var47 == "pending" then "NotReady" elseif var47 == "succeeded" then "Ready" else "Failed"
	local var50 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then useUniverseSearchList(searchStore, p35.userId or (if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0), var41, var38, var45, var33, var34, var32, if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then creatorAgentChatStore else nil) else nil
	local var51 = if not fFlagBuildExperienceMyCreationsUseUniverseListModule then useLegacySessionList(var45, var36, var35, var41, var33, var34, var32) else nil
	local var52 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var50.refresh else nil
	local var53 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule and fFlagBuildExperienceMyCreationsUseUniverseListModule then var50.refreshSessions else nil
	local var54 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then reactModule.useRef(var53) else nil
	
	if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
		var54.current = var53
	end
	local var55 = reactModule.useCallback(function()
		-- upvalues: sessionListStore (ref), promiseModule (copy), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var52 (ref), var54 (ref), ignorePromiseRejection (copy)
		local var56 = sessionListStore.refresh()
		local var57 = promiseModule.new(function(p36, p37)
			-- upvalues: var56 (ref)
			task.spawn(function()
				-- upvalues: var56 (copy), p36 (ref), p37 (ref)
				while true do
					while var56.state(false).status == "pending" do
						task.wait()
					end
					local var58 = var56.state(false)
					
					if var58.status == "succeeded" then
						p36(var58.result)
						
						return
					end
					p37(var58.error)
				end
			end)
		end)
		
		return if fFlagBuildExperienceMyCreationsUseUniverseListModule then if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then promiseModule.all({
			var52(),
			var57,
			var54.current():catch(ignorePromiseRejection)
		}) else promiseModule.all({ var52(), var57 }) else var57
	end, { var52, sessionListStore })
	reactModule.useEffect(function()
		-- upvalues: appLifecycleObserverService_1 (ref), var38 (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var52 (ref), ignorePromiseRejection (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var54 (ref), sessionListStore (ref)
		local onUnhideConnection = appLifecycleObserverService_1.OnUnhide:Connect(function()
			-- upvalues: var38 (copy), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var52 (copy), ignorePromiseRejection (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var54 (copy), sessionListStore (copy)
			if var38 then
				if fFlagBuildExperienceMyCreationsUseUniverseListModule then
					var52():catch(ignorePromiseRejection)
					
					if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
						var54.current():catch(ignorePromiseRejection)
					end
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
		var38,
		var52,
		sessionListStore
	})
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var43 (ref), var42 (ref), var38 (ref), var44 (ref), var40 (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var52 (ref), ignorePromiseRejection (copy), var54 (ref), sessionListStore (ref), signalsModule (copy)
		local var58 = false
		
		if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
			var58 = if var43.current == var42 then var38 and not var44.current else true
			var43.current = var42
			var44.current = var38
		end
		if not var38 then
			var40(false)
			
			return
		end
		var40(false)
		
		if fFlagBuildExperienceMyCreationsUseUniverseListModule then
			var52():catch(ignorePromiseRejection)
			
			if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule and var58 then
				var54.current():catch(ignorePromiseRejection)
			end
		end
		local var59 = sessionListStore.refresh()
		
		return signalsModule.createEffect(function(p38)
			-- upvalues: var59 (ref), var40 (copy)
			if var59.state(p38).status == "succeeded" then
				var40(true)
			end
		end)
	end, { var38, var42, var52, sessionListStore })
	local maxValue = math.max(0, p35.pollingIntervalSeconds or fIntMyCreationsSessionListPollingIntervalSecondsModule)
	reactModule.useEffect(function()
		-- upvalues: var38 (ref), maxValue (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var54 (ref), ignorePromiseRejection (copy), sessionListStore (ref)
		if var38 and maxValue ~= 0 then
			local var58 = false
			
			local function scheduleNextPoll()
				-- upvalues: maxValue (copy), var58 (write), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var54 (copy), ignorePromiseRejection (copy), sessionListStore (copy), scheduleNextPoll (ref)
				task.delay(maxValue, function()
					-- upvalues: var58 (copy), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var54 (copy), ignorePromiseRejection (copy), sessionListStore (copy), scheduleNextPoll (copy)
					if var58 then return end
					if fFlagBuildExperienceMyCreationsUseUniverseListModule and fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
						var54.current():catch(ignorePromiseRejection)
					end
					sessionListStore.refresh()
					scheduleNextPoll()
				end)
			end
			
			task.delay(maxValue, function()
				-- upvalues: var58 (write), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var54 (copy), ignorePromiseRejection (copy), sessionListStore (copy), scheduleNextPoll (ref)
				if var58 then return end
				if fFlagBuildExperienceMyCreationsUseUniverseListModule and fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
					var54.current():catch(ignorePromiseRejection)
				end
				sessionListStore.refresh()
				scheduleNextPoll()
			end)
			
			return function()
				-- upvalues: var58 (write)
				var58 = true
			end
		end
	end, { var38, maxValue, sessionListStore })
	local var58 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var50.items else var51.displayedItems
	local var59 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var50.items else var51.joinableItems
	local var60 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then false else var51.hasPendingSummary
	local var61 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var50.status else var49
	local var62 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var50.sourceItemCount else #var45
	local var63 = if var61 ~= "Ready" then var62 > 0 else true
	local isPending = var48 == "pending"
	local var64 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var50.failedPageIndex else nil
	local var65 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var50.isLoadingMore else false
	local var66 = reactModule.useCallback(function()
		-- upvalues: sessionListStore (ref), promiseModule (copy), requestHandleToPromise (copy)
		local var67 = sessionListStore.loadMore()
		
		return if var67 == nil then promiseModule.resolve() else requestHandleToPromise(var67)
	end, { isPending, var46, var49, sessionListStore })
	local var67 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var50.loadMore else nil
	local var68 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var50.query else var41
	
	return {
		displayedItems = var58,
		items = var59,
		listStatus = var61,
		hasDisplayedResult = var63,
		hasPendingSummary = var60,
		isSettledNoResults = var68 == var41 and (var63 and (not var60 and #var59 == 0)),
		query = var68,
		sourceItemCount = var62,
		sessionCount = #var45,
		sessionListStatus = var49,
		hasCompletedFocusedRefresh = var39,
		loadError = loadError,
		refresh = var55,
		loadMoreIfNeeded = reactModule.useCallback(function(p38)
			-- upvalues: fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var67 (ref), var46 (ref), isPending (ref), var49 (ref), var66 (ref)
			local y = p38.AbsoluteCanvasSize.Y
			
			if p38.CanvasPosition.Y <= 0 or y <= 0 or p38.AbsoluteWindowSize.Y <= 0 then return end
			if math.max(0, y - p38.AbsoluteWindowSize.Y - 250) < p38.CanvasPosition.Y then
				if fFlagBuildExperienceMyCreationsUseUniverseListModule then
					var67()
					
					if var46 == nil or isPending or var49 ~= "Ready" then
						return
					else
						var66()
						
						return
					end
				elseif var46 ~= nil and not isPending and var49 == "Ready" then
					var66()
				end
			end
		end, {
			isPending,
			var66,
			var67,
			var46,
			var49
		}),
		failedLoadMore = var64 ~= nil,
		retryLoadMore = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var67 else noOp,
		isLoadingMore = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var65 else isPending
	}
end