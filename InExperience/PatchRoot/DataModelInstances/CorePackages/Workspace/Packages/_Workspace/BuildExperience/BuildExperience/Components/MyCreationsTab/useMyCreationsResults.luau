local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local appLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local playersService = game:GetService("Players")
local fIntMyCreationsSessionListPollingIntervalSecondsModule = require(buildExperience.Flags.FIntMyCreationsSessionListPollingIntervalSeconds)
local fFlagBuildExperienceMyCreationsUseUniverseListModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsUseUniverseList)
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
local fFlagBuildExperienceMyCreationsUseAudiencesModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsUseAudiences)
local fFlagBuildPublishTerminologyChangeModule = require(buildExperience.Flags.FFlagBuildPublishTerminologyChange)
local fFlagBuildRehydrateOnPublishModule = require(buildExperience.Flags.FFlagBuildRehydrateOnPublish)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagBuildExperiencePinForBuild = sharedFlagsModule.FFlagBuildExperiencePinForBuild
local useSignalState = signalsReactModule.useSignalState
local var1 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then 15 else 50
local t = {}
local t_1 = {}
local t_2 = {
	waiting_on_client = localizationStringsModule.MY_CREATIONS_INPUT_NEEDED,
	idle = localizationStringsModule.MY_CREATIONS_READY,
	working = localizationStringsModule.MY_CREATIONS_BUILDING
}
local t_3 = {
	live = localizationStringsModule.MY_CREATIONS_LIVE,
	private = localizationStringsModule.MY_CREATIONS_PRIVATE,
	["public"] = localizationStringsModule.MY_CREATIONS_PUBLIC,
	publiclyUnavailable = localizationStringsModule.MY_CREATIONS_PUBLICLY_UNAVAILABLE,
	restricted = localizationStringsModule.MY_CREATIONS_RESTRICTED
}

local function _(p1)
	return string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", p1)
end

local function privacyLabelForSummary(p1, p2, p3)
	-- upvalues: fFlagBuildExperienceMyCreationsUseAudiencesModule (ref), universeConfigurationModule (ref), fFlagBuildPublishTerminologyChangeModule (ref), fFlagBuildRehydrateOnPublishModule (ref), privacyType (ref)
	local var2 = if fFlagBuildExperienceMyCreationsUseAudiencesModule then universeConfigurationModule.getPrivacyTypeForAudiences(p1.audiences) else p1.privacyType
	
	if fFlagBuildPublishTerminologyChangeModule then
		return if fFlagBuildRehydrateOnPublishModule and p1.isActive == true and var2 == privacyType.Public and (p2 == nil or p2) then nil elseif var2 == privacyType.Public then p3.live else nil
	elseif fFlagBuildRehydrateOnPublishModule and p1.isActive == true and var2 == privacyType.Public then
		return if p2 == nil then nil elseif p2 then p3.publiclyUnavailable elseif var2 == privacyType.Public then p3["public"] elseif var2 == privacyType.FriendsOnly then p3.restricted else p3.private
	end
end

local _ = function(p1, p2)
	-- upvalues: fFlagBuildExperienceMyCreationsUseAudiencesModule (ref), universeConfigurationModule (ref), fFlagBuildPublishTerminologyChangeModule (ref), privacyType (ref)
	local _ = nil
	local var2 = if fFlagBuildExperienceMyCreationsUseAudiencesModule and p1.audiences ~= nil then universeConfigurationModule.getPrivacyTypeForAudiences(p1.audiences) else p1.privacyType
	
	return if fFlagBuildPublishTerminologyChangeModule then if var2 == privacyType.Public then p2.live else nil elseif var2 == privacyType.Public then p2["public"] elseif var2 == privacyType.FriendsOnly then p2.restricted else p2.private
end

local _ = function(p1, p2, p3)
	-- upvalues: var1 (ref)
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
	-- upvalues: fFlagBuildLocalization (ref), localizationStringsModule (ref), fFlagBuildPublishTerminologyChangeModule (ref)
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
	-- upvalues: buildLatestSessionByUniverseId (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref), fFlagBuildExperienceMyCreationsUseAudiencesModule (ref), universeConfigurationModule (ref), fFlagBuildPublishTerminologyChangeModule (ref), privacyType (ref)
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
				experienceName = if typeof(name) == "string" and name ~= "" then name elseif fFlagBuildLocalization then p18(id) else localizationStringsModule.formatMyCreationsUniverseName(id),
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
			local _ = nil
			local var20 = if fFlagBuildExperienceMyCreationsUseAudiencesModule and v.audiences ~= nil then universeConfigurationModule.getPrivacyTypeForAudiences(v.audiences) else v.privacyType
			t_1.visibilityLabel = if fFlagBuildPublishTerminologyChangeModule then if var20 == privacyType.Public then p17.live else nil elseif var20 == privacyType.Public then p17["public"] elseif var20 == privacyType.FriendsOnly then p17.restricted else p17.private
			t_1.gameIcon = string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", id)
			table.insert(t, t_1)
		end
	end
	return t
end

local function useUniverseSearchList(p19, p20, p21, p22, p23, p24, p25, p26, p27)
	-- upvalues: reactModule (ref), var1 (ref), signalsModule (ref), t_1 (ref), useSignalState (ref), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (ref), useUniverseSessions (ref), ignorePromiseRejection (ref), buildUniverseItems (ref)
	local var21 = reactModule.useRef({})
	local var22 = reactModule.useRef(p21)
	var22.current = p21
	local var23, var24 = reactModule.useState({ query = p21, pageIndexes = { 0 } })
	local var25 = reactModule.useMemo(function()
		-- upvalues: var23 (ref), p19 (ref), p20 (ref), var1 (copy)
		local t = {}
		
		for i, v in var23.pageIndexes do
			local query = var23.query
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
				search = if query ~= "" then nil else query
			}))
		end
		return t
	end, { var23, p19, p20 })
	local var26 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var25 (ref), t_1 (copy), var1 (copy), var23 (ref)
		return signalsModule.createComputed(function(p28)
			-- upvalues: var25 (copy), t_1 (copy), var1 (copy), var23 (copy)
			local t = {}
			local t_2 = {}
			local var27 = nil
			local totalResults = nil
			local var28 = 0
			local var29 = "NotReady"
			local var30 = "NotReady"
			
			for i, v in var25 do
				local var31 = v.data(p28)
				var29 = v.status(p28)
				
				if i == 1 then
					var30 = var29
				end
				if var31 ~= nil then
					var27 = var31
					totalResults = var31.totalResults or (var31.totalHits or totalResults)
					local data = var31.data or t_1
					var28 += #data
					
					for i_1, v_1 in data do
						if not t_2[v_1.id] then
							t_2[v_1.id] = true
							table.insert(t, v_1)
						end
					end
				end
			end
			local var32 = nil
			local var33 = nil
			
			if var29 == "Ready" and var27 ~= nil then
				local nextResultIndex = var27.nextResultIndex
				
				if nextResultIndex ~= nil then
					var32 = nextResultIndex / var1
				elseif totalResults ~= nil and var28 < totalResults then
					var32 = var23.pageIndexes[#var23.pageIndexes] + 1
				end
				if var32 ~= nil and (var32 < 0 or table.find(var23.pageIndexes, var32)) then
					var32 = nil
				end
			elseif var29 == "Failed" and #var25 > 1 then
				var33 = var23.pageIndexes[#var23.pageIndexes]
			end
			return {
				items = t,
				status = var30,
				nextPageIndex = var32,
				failedPageIndex = var33,
				isLoadingMore = #var25 > 1 and var29 == "NotReady"
			}
		end)
	end, { var23.pageIndexes, var25 }))
	local var34 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then useUniverseSessions(p27, var26.items) else nil
	local var35 = reactModule.useCallback(function(p29, p30, p31)
		-- upvalues: var21 (ref), p19 (ref), p20 (ref), var1 (copy)
		local var36 = `{p30}\0{p29}`
		
		if p31 then
			var21.current[var36] = nil
		end
		local var37 = var21.current[var36]
		
		if var37 == nil then
			local var38 = nil
			var38 = p19.refreshSearch({
				creatorType = "User",
				surface = "CreatorHubCreations",
				isArchived = false,
				isTeamCreateEnabled = true,
				sortParam = "LastUpdated",
				sortOrder = "Desc",
				creatorTargetId = p20,
				pageIndex = p30,
				pageSize = var1,
				search = if p29 ~= "" then nil else p29
			}):finally(function()
				-- upvalues: var21 (copy), var36 (ref), var38 (write)
				if var21.current[var36] == var38 then
					var21.current[var36] = nil
				end
			end)
			var21.current[var36] = var38
			
			return var38
		end
		return var37
	end, { p19, p20 })
	local var36 = reactModule.useCallback(function(p29)
		-- upvalues: var22 (ref), var24 (ref), var35 (ref)
		p29 = p29 or var22.current
		var24({ query = p29, pageIndexes = { 0 } })
		
		return var35(p29, 0)
	end, { var35 })
	reactModule.useEffect(function()
		-- upvalues: p22 (ref), var23 (ref), p21 (ref), var36 (ref), ignorePromiseRejection (copy)
		if p22 and var23.query ~= p21 then
			var36(p21):catch(ignorePromiseRejection)
		end
	end, { p21, p22, var36, var23.query })
	
	return {
		items = reactModule.useMemo(function()
			-- upvalues: buildUniverseItems (copy), var26 (ref), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var34 (ref), p23 (ref), p24 (ref), p25 (ref), p26 (ref)
			return buildUniverseItems(var26.items, if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then var34.entries else p23, p24, p25, p26)
		end, {
			p24,
			var26.items,
			if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then var34.entries else p23,
			p25,
			p26
		}),
		status = var26.status,
		sourceItemCount = #var26.items,
		failedPageIndex = var26.failedPageIndex,
		isLoadingMore = var26.isLoadingMore,
		query = var23.query,
		refresh = var36,
		refreshSessions = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then var34.refresh else nil,
		loadMore = reactModule.useCallback(function()
			-- upvalues: var26 (ref), var23 (ref), var22 (ref), var24 (ref), var35 (ref), ignorePromiseRejection (copy)
			local failedPageIndex = var26.failedPageIndex or var26.nextPageIndex
			local query = var23.query
			
			if var26.isLoadingMore or failedPageIndex == nil or var22.current ~= query then return end
			if var26.failedPageIndex == nil then
				var24(function(p29)
					-- upvalues: query (ref), failedPageIndex (ref)
					if p29.query == query and not table.find(p29.pageIndexes, failedPageIndex) then
						local cloned = table.clone(p29.pageIndexes)
						table.insert(cloned, failedPageIndex)
						
						return { query = p29.query, pageIndexes = cloned }
					end
					return p29
				end)
			end
			var35(query, failedPageIndex, var26.failedPageIndex ~= nil):catch(ignorePromiseRejection)
		end, { var26, var35, var23.query })
	}
end

local function useLegacySessionList(p28, p29, p30, p31, p32, p33, p34)
	-- upvalues: reactModule (ref), signalsModule (ref), useSignalState (ref), fFlagBuildRehydrateOnPublishModule (ref), privacyType (ref), contentMaturityUtilsModule (ref), t (ref), buildExperienceMetadataByUniverseId (ref), buildSessionItems (ref), matchesSearchQueryModule (ref)
	local var27 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p28 (ref), p29 (ref)
		return signalsModule.createComputed(function(p35)
			-- upvalues: p28 (copy), p29 (copy)
			local t = {}
			local t_1 = {}
			
			for i, v in p28 do
				local var28
				local roblox = v._meta and v._meta._roblox
				
				if roblox == nil then
					var28 = nil
				else
					local universeId = roblox.universeId
					var28 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
				end
				if var28 ~= nil and not t_1[var28] then
					t_1[var28] = true
					local var29 = p29.getAndFetchSummary(var28).data(p35)
					
					if var29 ~= nil then
						t[var28] = var29
					end
				end
			end
			return t
		end)
	end, { p29, p28 }))
	local var28 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), fFlagBuildRehydrateOnPublishModule (copy), p30 (ref), var27 (ref), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
		return signalsModule.createComputed(function(p35)
			-- upvalues: fFlagBuildRehydrateOnPublishModule (copy), p30 (copy), var27 (copy), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
			local t_1 = {}
			
			if fFlagBuildRehydrateOnPublishModule and p30 ~= nil then
				for i, v in var27 do
					if v.isActive == true and v.privacyType == privacyType.Public and p30.getAndFetchEligibility(i).data(p35) ~= nil then
						t_1[i] = contentMaturityUtilsModule.isSealBroken(i) and contentMaturityUtilsModule.isContentUnrated(i)
					end
				end
			end
			return if next(t_1) == nil then t else t_1
		end)
	end, { p30, var27 }))
	local var29 = reactModule.useMemo(function()
		-- upvalues: buildExperienceMetadataByUniverseId (copy), var27 (ref), var28 (ref), p33 (ref)
		return buildExperienceMetadataByUniverseId(var27, var28, p33)
	end, { var28, var27, p33 })
	local var30 = reactModule.useMemo(function()
		-- upvalues: buildSessionItems (copy), p28 (ref), var29 (ref), p32 (ref), p33 (ref), p34 (ref), var27 (ref)
		local t = {}
		
		for i, v in buildSessionItems(p28, var29, p32, p33, p34) do
			local universeId = var27[v.universeId]
			
			if universeId ~= nil and not universeId.isArchived then
				table.insert(t, v)
			end
		end
		return t
	end, {
		p32, var29, p28, var27, p33, p34
	})
	
	return {
		displayedItems = var30,
		joinableItems = reactModule.useMemo(function()
			-- upvalues: p31 (ref), var30 (ref), matchesSearchQueryModule (copy)
			if p31 == "" then
				return var30
			end
			local t = {}
			
			for i, v in var30 do
				if matchesSearchQueryModule(v.experienceName, p31) then
					table.insert(t, v)
				end
			end
			return t
		end, { p31, var30 }),
		hasPendingSummary = reactModule.useMemo(function()
			-- upvalues: p28 (ref), var27 (ref)
			local t = {}
			
			for i, v in p28 do
				local var31
				local roblox = v._meta and v._meta._roblox
				
				if roblox == nil then
					var31 = nil
				else
					local universeId = roblox.universeId
					var31 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
				end
				if var31 ~= nil and not t[var31] then
					t[var31] = true
					
					if var27[var31] == nil then
						return true
					end
				end
			end
			return false
		end, { p28, var27 })
	}
end

return function(p35)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationRoactContext (ref), localizationModule (ref), t_2 (ref), t_3 (ref), creatorAgentChatModule (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (ref), universeSearchModule (ref), fFlagBuildRehydrateOnPublishModule (ref), universeActivationModule (ref), universeConfigurationModule (ref), getSearchQueryStoreModule (ref), getBuildExperienceRefreshStoreModule (ref), appLifecycleObserverService (ref), useSignalState (ref), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (ref), playersService (ref), useUniverseSearchList (ref), useLegacySessionList (ref), promiseModule (ref), ignorePromiseRejection (ref), signalsModule (ref), fIntMyCreationsSessionListPollingIntervalSecondsModule (ref), requestHandleToPromise (ref), noOp (ref)
	local var31 = if fFlagBuildLocalization then useLocalization({
		building = localizationStringsModule.MY_CREATIONS_BUILDING,
		inputNeeded = localizationStringsModule.MY_CREATIONS_INPUT_NEEDED,
		loadError = localizationStringsModule.MY_CREATIONS_LOAD_ERROR,
		live = localizationStringsModule.MY_CREATIONS_LIVE,
		private = localizationStringsModule.MY_CREATIONS_PRIVATE,
		["public"] = localizationStringsModule.MY_CREATIONS_PUBLIC,
		publiclyUnavailable = localizationStringsModule.MY_CREATIONS_PUBLICLY_UNAVAILABLE,
		ready = localizationStringsModule.MY_CREATIONS_READY,
		restricted = localizationStringsModule.MY_CREATIONS_RESTRICTED
	}) else nil
	local var32 = if fFlagBuildLocalization then reactModule.useContext(localizationRoactContext) else nil
	local var33 = if fFlagBuildLocalization then reactModule.useCallback(function(p36)
		-- upvalues: var32 (ref), localizationStringsModule (copy)
		return var32:Format(localizationStringsModule.MY_CREATIONS_UNIVERSE_NAME, { UNIVERSE_ID = p36 })
	end, {
		var32,
		if fFlagBuildLocalization then var31[localizationModule.RobloxLocaleIdKey] else nil
	}) else nil
	local var34 = if fFlagBuildLocalization then var31.loadError else localizationStringsModule.MY_CREATIONS_LOAD_ERROR
	local var35 = if fFlagBuildLocalization then if fFlagBuildLocalization then reactModule.useMemo(function()
		-- upvalues: var31 (ref)
		return {
			waiting_on_client = var31.inputNeeded,
			idle = var31.ready,
			working = var31.building
		}
	end, { var31.inputNeeded, var31.ready, var31.building }) else nil else t_2
	local var36 = if fFlagBuildLocalization then if fFlagBuildLocalization then reactModule.useMemo(function()
		-- upvalues: var31 (ref)
		return {
			live = var31.live,
			private = var31.private,
			["public"] = var31["public"],
			publiclyUnavailable = var31.publiclyUnavailable,
			restricted = var31.restricted
		}
	end, {
		var31.live,
		var31.private,
		var31["public"],
		var31.publiclyUnavailable,
		var31.restricted
	}) else nil else t_3
	local creatorAgentChatStore = p35.creatorAgentChatStore or creatorAgentChatModule.getCreatorAgentChatStore()
	local searchStore = p35.searchStore
	
	if fFlagBuildExperienceMyCreationsUseUniverseListModule and searchStore == nil then
		searchStore = universeSearchModule.getUniverseSearchStore()
	end
	local var37 = if fFlagBuildRehydrateOnPublishModule and not fFlagBuildExperienceMyCreationsUseUniverseListModule then universeActivationModule.getUniverseActivationStore() else nil
	local var38 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then nil else p35.configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
	local searchQueryStore = p35.searchQueryStore or getSearchQueryStoreModule()
	local var39 = getBuildExperienceRefreshStoreModule()
	local appLifecycleObserverService_1 = p35.appLifecycleObserverService or appLifecycleObserverService
	local var40 = p35.isFocused ~= false
	local var41, var42 = reactModule.useState(false)
	local var43 = searchQueryStore.useDebouncedQuery()
	local var44 = useSignalState(var39.getRefreshTick)
	local var45 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then reactModule.useRef(var44) else nil
	local var46 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then reactModule.useRef(var40) else nil
	local sessionListStore = creatorAgentChatStore.getSessionListStore()
	local var47 = useSignalState(sessionListStore.getSessions)
	local var48 = useSignalState(sessionListStore.getNextPageToken)
	local var49 = useSignalState(sessionListStore.getStatus)
	local var50 = useSignalState(sessionListStore.getLoadMoreStatus)
	local var51 = if var49 == "pending" then "NotReady" elseif var49 == "succeeded" then "Ready" else "Failed"
	local var52 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then useUniverseSearchList(searchStore, p35.userId or (if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0), var43, var40, var47, var35, var36, var33, if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then creatorAgentChatStore else nil) else nil
	local var53 = if not fFlagBuildExperienceMyCreationsUseUniverseListModule then useLegacySessionList(var47, var38, var37, var43, var35, var36, var33) else nil
	local var54 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var52.refresh else nil
	local var55 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule and fFlagBuildExperienceMyCreationsUseUniverseListModule then var52.refreshSessions else nil
	local var56 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then reactModule.useRef(var55) else nil
	
	if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
		var56.current = var55
	end
	local var57 = reactModule.useCallback(function()
		-- upvalues: sessionListStore (ref), promiseModule (copy), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var54 (ref), var56 (ref), ignorePromiseRejection (copy)
		local var58 = sessionListStore.refresh()
		local var59 = promiseModule.new(function(p36, p37)
			-- upvalues: var58 (ref)
			task.spawn(function()
				-- upvalues: var58 (copy), p36 (ref), p37 (ref)
				while true do
					while var58.state(false).status == "pending" do
						task.wait()
					end
					local var60 = var58.state(false)
					
					if var60.status == "succeeded" then
						p36(var60.result)
						
						return
					end
					p37(var60.error)
				end
			end)
		end)
		
		return if fFlagBuildExperienceMyCreationsUseUniverseListModule then if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then promiseModule.all({
			var54(),
			var59,
			var56.current():catch(ignorePromiseRejection)
		}) else promiseModule.all({ var54(), var59 }) else var59
	end, { var54, sessionListStore })
	reactModule.useEffect(function()
		-- upvalues: appLifecycleObserverService_1 (ref), var40 (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var54 (ref), ignorePromiseRejection (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var56 (ref), sessionListStore (ref)
		local onUnhideConnection = appLifecycleObserverService_1.OnUnhide:Connect(function()
			-- upvalues: var40 (copy), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var54 (copy), ignorePromiseRejection (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var56 (copy), sessionListStore (copy)
			if var40 then
				if fFlagBuildExperienceMyCreationsUseUniverseListModule then
					var54():catch(ignorePromiseRejection)
					
					if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
						var56.current():catch(ignorePromiseRejection)
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
		var40,
		var54,
		sessionListStore
	})
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var45 (ref), var44 (ref), var40 (ref), var46 (ref), var42 (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var54 (ref), ignorePromiseRejection (copy), var56 (ref), sessionListStore (ref), signalsModule (copy)
		local var60 = false
		
		if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
			var60 = if var45.current == var44 then var40 and not var46.current else true
			var45.current = var44
			var46.current = var40
		end
		if not var40 then
			var42(false)
			
			return
		end
		var42(false)
		
		if fFlagBuildExperienceMyCreationsUseUniverseListModule then
			var54():catch(ignorePromiseRejection)
			
			if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule and var60 then
				var56.current():catch(ignorePromiseRejection)
			end
		end
		local var61 = sessionListStore.refresh()
		
		return signalsModule.createEffect(function(p38)
			-- upvalues: var61 (ref), var42 (copy)
			if var61.state(p38).status == "succeeded" then
				var42(true)
			end
		end)
	end, { var40, var44, var54, sessionListStore })
	local maxValue = math.max(0, p35.pollingIntervalSeconds or fIntMyCreationsSessionListPollingIntervalSecondsModule)
	reactModule.useEffect(function()
		-- upvalues: var40 (ref), maxValue (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var56 (ref), ignorePromiseRejection (copy), sessionListStore (ref)
		if var40 and maxValue ~= 0 then
			local var60 = false
			
			local function scheduleNextPoll()
				-- upvalues: maxValue (copy), var60 (write), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var56 (copy), ignorePromiseRejection (copy), sessionListStore (copy), scheduleNextPoll (ref)
				task.delay(maxValue, function()
					-- upvalues: var60 (copy), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var56 (copy), ignorePromiseRejection (copy), sessionListStore (copy), scheduleNextPoll (copy)
					if var60 then return end
					if fFlagBuildExperienceMyCreationsUseUniverseListModule and fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
						var56.current():catch(ignorePromiseRejection)
					end
					sessionListStore.refresh()
					scheduleNextPoll()
				end)
			end
			
			task.delay(maxValue, function()
				-- upvalues: var60 (write), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var56 (copy), ignorePromiseRejection (copy), sessionListStore (copy), scheduleNextPoll (ref)
				if var60 then return end
				if fFlagBuildExperienceMyCreationsUseUniverseListModule and fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
					var56.current():catch(ignorePromiseRejection)
				end
				sessionListStore.refresh()
				scheduleNextPoll()
			end)
			
			return function()
				-- upvalues: var60 (write)
				var60 = true
			end
		end
	end, { var40, maxValue, sessionListStore })
	local var60 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var52.items else var53.displayedItems
	local var61 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var52.items else var53.joinableItems
	local var62 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then false else var53.hasPendingSummary
	local var63 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var52.status else var51
	local var64 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var52.sourceItemCount else #var47
	local var65 = if var63 ~= "Ready" then var64 > 0 else true
	local isPending = var50 == "pending"
	local var66 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var52.failedPageIndex else nil
	local var67 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var52.isLoadingMore else false
	local var68 = reactModule.useCallback(function()
		-- upvalues: sessionListStore (ref), promiseModule (copy), requestHandleToPromise (copy)
		local var69 = sessionListStore.loadMore()
		
		return if var69 == nil then promiseModule.resolve() else requestHandleToPromise(var69)
	end, { isPending, var48, var51, sessionListStore })
	local var69 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var52.loadMore else nil
	local var70 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var52.query else var43
	
	return {
		displayedItems = var60,
		items = var61,
		listStatus = var63,
		hasDisplayedResult = var65,
		hasPendingSummary = var62,
		isSettledNoResults = var70 == var43 and (var65 and (not var62 and #var61 == 0)),
		query = var70,
		sourceItemCount = var64,
		sessionCount = #var47,
		sessionListStatus = var51,
		hasCompletedFocusedRefresh = var41,
		loadError = var34,
		refresh = var57,
		loadMoreIfNeeded = reactModule.useCallback(function(p38)
			-- upvalues: fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var69 (ref), var48 (ref), isPending (ref), var51 (ref), var68 (ref)
			local y = p38.AbsoluteCanvasSize.Y
			
			if p38.CanvasPosition.Y <= 0 or y <= 0 or p38.AbsoluteWindowSize.Y <= 0 then return end
			if math.max(0, y - p38.AbsoluteWindowSize.Y - 250) < p38.CanvasPosition.Y then
				if fFlagBuildExperienceMyCreationsUseUniverseListModule then
					var69()
					
					if var48 == nil or isPending or var51 ~= "Ready" then
						return
					else
						var68()
						
						return
					end
				elseif var48 ~= nil and not isPending and var51 == "Ready" then
					var68()
				end
			end
		end, {
			isPending,
			var68,
			var69,
			var48,
			var51
		}),
		failedLoadMore = var66 ~= nil,
		retryLoadMore = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var69 else noOp,
		isLoadingMore = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var67 else isPending
	}
end