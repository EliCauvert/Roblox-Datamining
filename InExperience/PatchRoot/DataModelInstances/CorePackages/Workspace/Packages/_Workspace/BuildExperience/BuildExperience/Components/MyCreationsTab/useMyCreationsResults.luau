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
local fFlagBuildExperiencePinForBuild = sharedFlagsModule.FFlagBuildExperiencePinForBuild
local useSignalState = signalsReactModule.useSignalState
local var1 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then 15 else 50
local t = {}
local t_1 = {}

local function _(p1)
	return string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", p1)
end

local _ = function(p1, p2, p3)
	-- upvalues: universeConfigurationModule (ref), privacyType (ref)
	local privacyTypeForAudiences = universeConfigurationModule.getPrivacyTypeForAudiences(p1.audiences)
	
	return if p1.isActive == true and privacyTypeForAudiences == privacyType.Public and (p2 == nil or p2) then nil elseif privacyTypeForAudiences == privacyType.Public then p3.live else nil
end

local _ = function(p1, p2)
	-- upvalues: universeConfigurationModule (ref), privacyType (ref)
	return if universeConfigurationModule.getPrivacyTypeForAudiences(p1.audiences) == privacyType.Public then p2.live else nil
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
		needsAssetOptions = true,
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
	-- upvalues: universeConfigurationModule (ref), privacyType (ref)
	local t = {}
	
	for i, v in p2 do
		local name = v.name
		
		if typeof(name) == "string" and name ~= "" and not v.isArchived then
			local creatorName = v.creatorName
			local t_1 = {
				placeId = v.rootPlaceId,
				experienceName = name,
				creatorName = if typeof(creatorName) == "string" and creatorName ~= "" then creatorName else nil
			}
			local var2 = p3[i]
			local privacyTypeForAudiences = universeConfigurationModule.getPrivacyTypeForAudiences(v.audiences)
			t_1.visibilityLabel = if v.isActive == true and privacyTypeForAudiences == privacyType.Public and (var2 == nil or var2) then nil elseif privacyTypeForAudiences == privacyType.Public then p4.live else nil
			t_1.gameIcon = string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", i)
			t[i] = t_1
		end
	end
	return t
end

local function buildSessionItems(p5, p6, p7, _, p8)
	local t = {}
	local t_1 = {}
	
	for i, v in p5 do
		local var3
		local sessionId = v.sessionId
		local roblox = v._meta and v._meta._roblox
		
		if roblox == nil then
			var3 = nil
		else
			local universeId = roblox.universeId
			var3 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
		end
		if typeof(sessionId) == "string" and sessionId ~= "" and (var3 ~= nil and not t[var3]) then
			t[var3] = true
			local var4 = if p6 then p6[var3] else nil
			local t_2 = {
				sessionId = sessionId,
				universeId = var3,
				placeId = if var4 then var4.placeId else nil,
				experienceName = if var4 then var4.experienceName else v.title or p8(var3),
				creatorName = if var4 then var4.creatorName else nil
			}
			local roblox_1 = v._meta and v._meta._roblox
			local var5 = if roblox_1 then roblox_1.sessionStatus else nil
			t_2.description = if var5 == nil then nil else p7[var5]
			t_2.visibilityLabel = if var4 then var4.visibilityLabel else nil
			t_2.gameIcon = if var4 then var4.gameIcon else string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", var3)
			table.insert(t_1, t_2)
		end
	end
	return t_1
end

local function buildLatestSessionByUniverseId(p9)
	local t = {}
	
	for i, v in p9 do
		local var6
		local roblox = v._meta and v._meta._roblox
		
		if roblox == nil then
			var6 = nil
		else
			local universeId = roblox.universeId
			var6 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
		end
		if var6 ~= nil and t[var6] == nil then
			t[var6] = v
		end
	end
	return t
end

local function useUniverseSessions(p10, p11)
	-- upvalues: reactModule (ref), fFlagBuildExperiencePinForBuild (ref), promiseModule (ref), ignorePromiseRejection (ref), signalsModule (ref), useSignalState (ref)
	local var7, var8 = reactModule.useState({})
	local var9 = reactModule.useRef(var7)
	var9.current = var7
	local var10 = reactModule.useRef({})
	local var11 = reactModule.useRef(p11)
	var11.current = p11
	local var12 = reactModule.useRef(true)
	reactModule.useEffect(function()
		-- upvalues: var12 (ref)
		var12.current = true
		
		return function()
			-- upvalues: var12 (copy)
			var12.current = false
		end
	end, {})
	local var13 = reactModule.useCallback(function(p12)
		-- upvalues: var11 (ref), var10 (ref), var9 (ref), p10 (ref), fFlagBuildExperiencePinForBuild (copy), promiseModule (copy), var12 (ref), var8 (ref)
		local t = {}
		
		for i, v in var11.current do
			if not v.isArchived then
				local id = v.id
				local var14 = var10.current[id]
				
				if var14 ~= nil then
					table.insert(t, var14.promise)
				elseif p12 or var9.current[id] == nil then
					local var15 = p10.sessionFindByUniverse({
						sort = "desc",
						universeId = id,
						application = if fFlagBuildExperiencePinForBuild then "build" else nil,
						filterByPinForBuild = if fFlagBuildExperiencePinForBuild then true else nil
					})
					local t_1 = { promise = nil, handle = var15 }
					var10.current[id] = t_1
					local var16 = promiseModule.new(function(p13, p14)
						-- upvalues: var15 (ref)
						task.spawn(function()
							-- upvalues: var15 (copy), p13 (ref), p14 (ref)
							while true do
								while var15.state(false).status == "pending" do
									task.wait()
								end
								local var17 = var15.state(false)
								
								if var17.status == "succeeded" then
									p13(var17.result)
									
									return
								end
								p14(var17.error)
							end
						end)
					end):andThen(function()
						-- upvalues: var10 (copy), id (ref), var15 (ref), var12 (copy), var9 (copy), var8 (copy)
						local var18 = var10.current[id]
						
						if var18 == nil or var18.handle ~= var15 then return end
						var10.current[id] = nil
						
						if var12.current then
							local cloned = table.clone(var9.current)
							cloned[id] = var15
							var9.current = cloned
							var8(cloned)
						end
					end, function(p15)
						-- upvalues: var10 (copy), id (ref), var15 (ref), promiseModule (copy)
						local var18 = var10.current[id]
						
						if var18 ~= nil and var18.handle == var15 then
							var10.current[id] = nil
						end
						return promiseModule.reject(p15)
					end)
					t_1.promise = var16
					table.insert(t, var16)
				end
			end
		end
		return promiseModule.all(t)
	end, { p10 })
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), ignorePromiseRejection (copy)
		var13(false):catch(ignorePromiseRejection)
	end, { p11, var13 })
	
	return {
		entries = useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), p11 (ref), var7 (ref)
			return signalsModule.createComputed(function(p13)
				-- upvalues: p11 (copy), var7 (copy)
				local t = {}
				
				for i, v in p11 do
					local id = var7[v.id]
					local var17 = if id ~= nil then nil else id.state(p13)
					
					if var17 ~= nil and var17.status == "succeeded" and var17.result ~= nil then
						local sessions = var17.result.sessions
						local var18 = if typeof(sessions) == "table" then sessions[1] else nil
						
						if var18 ~= nil then
							table.insert(t, var18)
						end
					end
				end
				return t
			end)
		end, { p11, var7 })),
		refresh = reactModule.useCallback(function()
			-- upvalues: var13 (ref)
			return var13(true)
		end, { var13 })
	}
end

local function buildUniverseItems(p13, p14, p15, p16, p17)
	-- upvalues: buildLatestSessionByUniverseId (ref), universeConfigurationModule (ref), privacyType (ref)
	local var17 = buildLatestSessionByUniverseId(p14)
	local t = {}
	
	for i, v in p13 do
		if not v.isArchived then
			local var18
			local id = v.id
			local var19 = var17[id]
			local name = v.name
			local _ = nil
			local t_1 = {
				sessionId = if var19 then var19.sessionId else nil,
				universeId = id,
				placeId = v.rootPlaceId,
				experienceName = if typeof(name) == "string" and name ~= "" then name else p17(id),
				creatorName = if typeof(v.creatorName) == "string" and v.creatorName ~= "" then v.creatorName else nil
			}
			
			if var19 then
				local roblox = var19._meta and var19._meta._roblox
				local var20 = if roblox then roblox.sessionStatus else nil
				var18 = if var20 == nil then nil else p15[var20]
			else
				var18 = nil
			end
			t_1.description = var18
			t_1.visibilityLabel = if universeConfigurationModule.getPrivacyTypeForAudiences(v.audiences) == privacyType.Public then p16.live else nil
			t_1.gameIcon = string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", id)
			table.insert(t, t_1)
		end
	end
	return t
end

local function useUniverseSearchList(p18, p19, p20, p21, p22, p23, p24, p25, p26)
	-- upvalues: reactModule (ref), var1 (ref), signalsModule (ref), t_1 (ref), useSignalState (ref), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (ref), useUniverseSessions (ref), ignorePromiseRejection (ref), buildUniverseItems (ref)
	local var21 = reactModule.useRef({})
	local var22 = reactModule.useRef(p20)
	var22.current = p20
	local var23, var24 = reactModule.useState({ query = p20, pageIndexes = { 0 } })
	local var25 = reactModule.useMemo(function()
		-- upvalues: var23 (ref), p18 (ref), p19 (ref), var1 (copy)
		local t = {}
		
		for i, v in var23.pageIndexes do
			local query = var23.query
			table.insert(t, p18.getSearch({
				creatorType = "User",
				surface = "CreatorHubCreations",
				isArchived = false,
				isTeamCreateEnabled = true,
				sortParam = "LastUpdated",
				sortOrder = "Desc",
				needsAssetOptions = true,
				creatorTargetId = p19,
				pageIndex = v,
				pageSize = var1,
				search = if query ~= "" then nil else query
			}))
		end
		return t
	end, { var23, p18, p19 })
	local var26 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var25 (ref), t_1 (copy), var1 (copy), var23 (ref)
		return signalsModule.createComputed(function(p27)
			-- upvalues: var25 (copy), t_1 (copy), var1 (copy), var23 (copy)
			local t = {}
			local t_2 = {}
			local var27 = nil
			local totalResults = nil
			local var28 = 0
			local var29 = "NotReady"
			local var30 = "NotReady"
			
			for i, v in var25 do
				local var31 = v.data(p27)
				var29 = v.status(p27)
				
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
	local var34 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then useUniverseSessions(p26, var26.items) else nil
	local var35 = reactModule.useCallback(function(p28, p29, p30)
		-- upvalues: var21 (ref), p18 (ref), p19 (ref), var1 (copy)
		local var36 = `{p29}\0{p28}`
		
		if p30 then
			var21.current[var36] = nil
		end
		local var37 = var21.current[var36]
		
		if var37 == nil then
			local var38 = nil
			var38 = p18.refreshSearch({
				creatorType = "User",
				surface = "CreatorHubCreations",
				isArchived = false,
				isTeamCreateEnabled = true,
				sortParam = "LastUpdated",
				sortOrder = "Desc",
				needsAssetOptions = true,
				creatorTargetId = p19,
				pageIndex = p29,
				pageSize = var1,
				search = if p28 ~= "" then nil else p28
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
	end, { p18, p19 })
	local var36 = reactModule.useCallback(function(p28)
		-- upvalues: var22 (ref), var24 (ref), var35 (ref)
		p28 = p28 or var22.current
		var24({ query = p28, pageIndexes = { 0 } })
		
		return var35(p28, 0)
	end, { var35 })
	reactModule.useEffect(function()
		-- upvalues: p21 (ref), var23 (ref), p20 (ref), var36 (ref), ignorePromiseRejection (copy)
		if p21 and var23.query ~= p20 then
			var36(p20):catch(ignorePromiseRejection)
		end
	end, { p20, p21, var36, var23.query })
	
	return {
		items = reactModule.useMemo(function()
			-- upvalues: buildUniverseItems (copy), var26 (ref), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var34 (ref), p22 (ref), p23 (ref), p24 (ref), p25 (ref)
			return buildUniverseItems(var26.items, if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then var34.entries else p22, p23, p24, p25)
		end, {
			p23,
			var26.items,
			if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then var34.entries else p22,
			p24,
			p25
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
				var24(function(p28)
					-- upvalues: query (ref), failedPageIndex (ref)
					if p28.query == query and not table.find(p28.pageIndexes, failedPageIndex) then
						local cloned = table.clone(p28.pageIndexes)
						table.insert(cloned, failedPageIndex)
						
						return { query = p28.query, pageIndexes = cloned }
					end
					return p28
				end)
			end
			var35(query, failedPageIndex, var26.failedPageIndex ~= nil):catch(ignorePromiseRejection)
		end, { var26, var35, var23.query })
	}
end

local function useLegacySessionList(p27, p28, p29, p30, p31, p32, p33)
	-- upvalues: reactModule (ref), signalsModule (ref), useSignalState (ref), privacyType (ref), contentMaturityUtilsModule (ref), t (ref), buildExperienceMetadataByUniverseId (ref), buildSessionItems (ref), matchesSearchQueryModule (ref)
	local var27 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p27 (ref), p28 (ref)
		return signalsModule.createComputed(function(p34)
			-- upvalues: p27 (copy), p28 (copy)
			local t = {}
			local t_1 = {}
			
			for i, v in p27 do
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
					local var29 = p28.getAndFetchSummary(var28).data(p34)
					
					if var29 ~= nil then
						t[var28] = var29
					end
				end
			end
			return t
		end)
	end, { p28, p27 }))
	local var28 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p29 (ref), var27 (ref), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
		return signalsModule.createComputed(function(p34)
			-- upvalues: p29 (copy), var27 (copy), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
			local t_1 = {}
			
			if p29 ~= nil then
				for i, v in var27 do
					if v.isActive == true and v.privacyType == privacyType.Public and p29.getAndFetchEligibility(i).data(p34) ~= nil then
						t_1[i] = contentMaturityUtilsModule.isSealBroken(i) and contentMaturityUtilsModule.isContentUnrated(i)
					end
				end
			end
			return if next(t_1) == nil then t else t_1
		end)
	end, { p29, var27 }))
	local var29 = reactModule.useMemo(function()
		-- upvalues: buildExperienceMetadataByUniverseId (copy), var27 (ref), var28 (ref), p32 (ref)
		return buildExperienceMetadataByUniverseId(var27, var28, p32)
	end, { var28, var27, p32 })
	local var30 = reactModule.useMemo(function()
		-- upvalues: buildSessionItems (copy), p27 (ref), var29 (ref), p31 (ref), p32 (ref), p33 (ref), var27 (ref)
		local t = {}
		
		for i, v in buildSessionItems(p27, var29, p31, p32, p33) do
			local universeId = var27[v.universeId]
			
			if universeId ~= nil and not universeId.isArchived then
				table.insert(t, v)
			end
		end
		return t
	end, {
		p31, var29, p27, var27, p32, p33
	})
	
	return {
		displayedItems = var30,
		joinableItems = reactModule.useMemo(function()
			-- upvalues: p30 (ref), var30 (ref), matchesSearchQueryModule (copy)
			if p30 == "" then
				return var30
			end
			local t = {}
			
			for i, v in var30 do
				if matchesSearchQueryModule(v.experienceName, p30) then
					table.insert(t, v)
				end
			end
			return t
		end, { p30, var30 }),
		hasPendingSummary = reactModule.useMemo(function()
			-- upvalues: p27 (ref), var27 (ref)
			local t = {}
			
			for i, v in p27 do
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
		end, { p27, var27 })
	}
end

return function(p34)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationRoactContext (ref), localizationModule (ref), creatorAgentChatModule (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (ref), universeSearchModule (ref), universeActivationModule (ref), universeConfigurationModule (ref), getSearchQueryStoreModule (ref), getBuildExperienceRefreshStoreModule (ref), appLifecycleObserverService (ref), useSignalState (ref), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (ref), playersService (ref), useUniverseSearchList (ref), useLegacySessionList (ref), promiseModule (ref), ignorePromiseRejection (ref), signalsModule (ref), fIntMyCreationsSessionListPollingIntervalSecondsModule (ref), requestHandleToPromise (ref), noOp (ref)
	local var31 = useLocalization({
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
	local var32 = reactModule.useContext(localizationRoactContext)
	local var33 = reactModule.useCallback(function(p35)
		-- upvalues: var32 (ref), localizationStringsModule (copy)
		return var32:Format(localizationStringsModule.MY_CREATIONS_UNIVERSE_NAME, { UNIVERSE_ID = p35 })
	end, { var32, var31[localizationModule.RobloxLocaleIdKey] })
	local loadError = var31.loadError
	local var34 = reactModule.useMemo(function()
		-- upvalues: var31 (ref)
		return {
			waiting_on_client = var31.inputNeeded,
			idle = var31.ready,
			working = var31.building
		}
	end, { var31.inputNeeded, var31.ready, var31.building })
	local var35 = reactModule.useMemo(function()
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
	})
	local creatorAgentChatStore = p34.creatorAgentChatStore or creatorAgentChatModule.getCreatorAgentChatStore()
	local searchStore = p34.searchStore
	
	if fFlagBuildExperienceMyCreationsUseUniverseListModule and searchStore == nil then
		searchStore = universeSearchModule.getUniverseSearchStore()
	end
	local var36 = if not fFlagBuildExperienceMyCreationsUseUniverseListModule then universeActivationModule.getUniverseActivationStore() else nil
	local var37 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then nil else p34.configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
	local searchQueryStore = p34.searchQueryStore or getSearchQueryStoreModule()
	local var38 = getBuildExperienceRefreshStoreModule()
	local appLifecycleObserverService_1 = p34.appLifecycleObserverService or appLifecycleObserverService
	local var39 = p34.isFocused ~= false
	local var40, var41 = reactModule.useState(false)
	local var42 = searchQueryStore.useDebouncedQuery()
	local var43 = useSignalState(var38.getRefreshTick)
	local var44 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then reactModule.useRef(var43) else nil
	local var45 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then reactModule.useRef(var39) else nil
	local sessionListStore = creatorAgentChatStore.getSessionListStore()
	local var46 = useSignalState(sessionListStore.getSessions)
	local var47 = useSignalState(sessionListStore.getNextPageToken)
	local var48 = useSignalState(sessionListStore.getStatus)
	local var49 = useSignalState(sessionListStore.getLoadMoreStatus)
	local var50 = if var48 == "pending" then "NotReady" elseif var48 == "succeeded" then "Ready" else "Failed"
	local var51 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then useUniverseSearchList(searchStore, p34.userId or (if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0), var42, var39, var46, var34, var35, var33, if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then creatorAgentChatStore else nil) else nil
	local var52 = if not fFlagBuildExperienceMyCreationsUseUniverseListModule then useLegacySessionList(var46, var37, var36, var42, var34, var35, var33) else nil
	local var53 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var51.refresh else nil
	local var54 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule and fFlagBuildExperienceMyCreationsUseUniverseListModule then var51.refreshSessions else nil
	local var55 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then reactModule.useRef(var54) else nil
	
	if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
		var55.current = var54
	end
	local var56 = reactModule.useCallback(function()
		-- upvalues: sessionListStore (ref), promiseModule (copy), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var53 (ref), var55 (ref), ignorePromiseRejection (copy)
		local var57 = sessionListStore.refresh()
		local var58 = promiseModule.new(function(p35, p36)
			-- upvalues: var57 (ref)
			task.spawn(function()
				-- upvalues: var57 (copy), p35 (ref), p36 (ref)
				while true do
					while var57.state(false).status == "pending" do
						task.wait()
					end
					local var59 = var57.state(false)
					
					if var59.status == "succeeded" then
						p35(var59.result)
						
						return
					end
					p36(var59.error)
				end
			end)
		end)
		
		return if fFlagBuildExperienceMyCreationsUseUniverseListModule then if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then promiseModule.all({
			var53(),
			var58,
			var55.current():catch(ignorePromiseRejection)
		}) else promiseModule.all({ var53(), var58 }) else var58
	end, { var53, sessionListStore })
	reactModule.useEffect(function()
		-- upvalues: appLifecycleObserverService_1 (ref), var39 (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var53 (ref), ignorePromiseRejection (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var55 (ref), sessionListStore (ref)
		local onUnhideConnection = appLifecycleObserverService_1.OnUnhide:Connect(function()
			-- upvalues: var39 (copy), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var53 (copy), ignorePromiseRejection (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var55 (copy), sessionListStore (copy)
			if var39 then
				if fFlagBuildExperienceMyCreationsUseUniverseListModule then
					var53():catch(ignorePromiseRejection)
					
					if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
						var55.current():catch(ignorePromiseRejection)
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
		var39,
		var53,
		sessionListStore
	})
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var44 (ref), var43 (ref), var39 (ref), var45 (ref), var41 (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var53 (ref), ignorePromiseRejection (copy), var55 (ref), sessionListStore (ref), signalsModule (copy)
		local var59 = false
		
		if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
			var59 = if var44.current == var43 then var39 and not var45.current else true
			var44.current = var43
			var45.current = var39
		end
		if not var39 then
			var41(false)
			
			return
		end
		var41(false)
		
		if fFlagBuildExperienceMyCreationsUseUniverseListModule then
			var53():catch(ignorePromiseRejection)
			
			if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule and var59 then
				var55.current():catch(ignorePromiseRejection)
			end
		end
		local var60 = sessionListStore.refresh()
		
		return signalsModule.createEffect(function(p37)
			-- upvalues: var60 (ref), var41 (copy)
			if var60.state(p37).status == "succeeded" then
				var41(true)
			end
		end)
	end, { var39, var43, var53, sessionListStore })
	local maxValue = math.max(0, p34.pollingIntervalSeconds or fIntMyCreationsSessionListPollingIntervalSecondsModule)
	reactModule.useEffect(function()
		-- upvalues: var39 (ref), maxValue (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var55 (ref), ignorePromiseRejection (copy), sessionListStore (ref)
		if var39 and maxValue ~= 0 then
			local var59 = false
			
			local function scheduleNextPoll()
				-- upvalues: maxValue (copy), var59 (write), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var55 (copy), ignorePromiseRejection (copy), sessionListStore (copy), scheduleNextPoll (ref)
				task.delay(maxValue, function()
					-- upvalues: var59 (copy), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var55 (copy), ignorePromiseRejection (copy), sessionListStore (copy), scheduleNextPoll (copy)
					if var59 then return end
					if fFlagBuildExperienceMyCreationsUseUniverseListModule and fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
						var55.current():catch(ignorePromiseRejection)
					end
					sessionListStore.refresh()
					scheduleNextPoll()
				end)
			end
			
			task.delay(maxValue, function()
				-- upvalues: var59 (write), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var55 (copy), ignorePromiseRejection (copy), sessionListStore (copy), scheduleNextPoll (ref)
				if var59 then return end
				if fFlagBuildExperienceMyCreationsUseUniverseListModule and fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
					var55.current():catch(ignorePromiseRejection)
				end
				sessionListStore.refresh()
				scheduleNextPoll()
			end)
			
			return function()
				-- upvalues: var59 (write)
				var59 = true
			end
		end
	end, { var39, maxValue, sessionListStore })
	local var59 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var51.items else var52.displayedItems
	local var60 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var51.items else var52.joinableItems
	local var61 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then false else var52.hasPendingSummary
	local var62 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var51.status else var50
	local var63 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var51.sourceItemCount else #var46
	local var64 = if var62 ~= "Ready" then var63 > 0 else true
	local isPending = var49 == "pending"
	local var65 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var51.failedPageIndex else nil
	local var66 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var51.isLoadingMore else false
	local var67 = reactModule.useCallback(function()
		-- upvalues: sessionListStore (ref), promiseModule (copy), requestHandleToPromise (copy)
		local var68 = sessionListStore.loadMore()
		
		return if var68 == nil then promiseModule.resolve() else requestHandleToPromise(var68)
	end, { isPending, var47, var50, sessionListStore })
	local var68 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var51.loadMore else nil
	local var69 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var51.query else var42
	
	return {
		displayedItems = var59,
		items = var60,
		listStatus = var62,
		hasDisplayedResult = var64,
		hasPendingSummary = var61,
		isSettledNoResults = var69 == var42 and (var64 and (not var61 and #var60 == 0)),
		query = var69,
		sourceItemCount = var63,
		sessionCount = #var46,
		sessionListStatus = var50,
		hasCompletedFocusedRefresh = var40,
		loadError = loadError,
		refresh = var56,
		loadMoreIfNeeded = reactModule.useCallback(function(p37)
			-- upvalues: fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var68 (ref), var47 (ref), isPending (ref), var50 (ref), var67 (ref)
			local y = p37.AbsoluteCanvasSize.Y
			
			if p37.CanvasPosition.Y <= 0 or y <= 0 or p37.AbsoluteWindowSize.Y <= 0 then return end
			if math.max(0, y - p37.AbsoluteWindowSize.Y - 250) < p37.CanvasPosition.Y then
				if fFlagBuildExperienceMyCreationsUseUniverseListModule then
					var68()
					
					if var47 == nil or isPending or var50 ~= "Ready" then
						return
					else
						var67()
						
						return
					end
				elseif var47 ~= nil and not isPending and var50 == "Ready" then
					var67()
				end
			end
		end, {
			isPending,
			var67,
			var68,
			var47,
			var50
		}),
		failedLoadMore = var65 ~= nil,
		retryLoadMore = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var68 else noOp,
		isLoadingMore = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var66 else isPending
	}
end