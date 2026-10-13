local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local appLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local playersService = game:GetService("Players")
local fIntMyCreationsSessionListPollingIntervalSecondsModule = require(buildExperience.Flags.FIntMyCreationsSessionListPollingIntervalSeconds)
local fFlagBuildExperienceMyCreationsUseUniverseListModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsUseUniverseList)
local fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsFindSessionsByUniverse)
local fFlagBuildWithGroupsModule = require(buildExperience.Flags.FFlagBuildWithGroups)
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
local creatorGroupsModule = require(parent.DataHydration.CreatorGroups)
local universeActivationModule = require(parent.DataHydration.UniverseActivation)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local universeSearchModule = require(parent.DataHydration.UniverseSearch)
local privacyType = universeConfigurationModule.PrivacyType
local contentMaturityUtilsModule = require(buildExperience.utils.ContentMaturityUtils)
local matchesSearchQueryModule = require(buildExperience.utils.matchesSearchQuery)
local getBuildExperienceRefreshStoreModule = require(buildExperience.Stores.GetBuildExperienceRefreshStore)
local _ = require(buildExperience.Stores.GetMyCreationsFilterStore)
local getSearchQueryStoreModule = require(buildExperience.Stores.GetSearchQueryStore)
local _ = require(buildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)
local fFlagBuildExperiencePinForBuild = sharedFlagsModule.FFlagBuildExperiencePinForBuild
local useSignalState = signalsReactModule.useSignalState
local var1 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then 15 else 50
local t = {}
local t_1 = {}
local t_2 = { games = "All" }

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

local _ = function(p1, p2, p3)
	-- upvalues: var1 (ref)
	return {
		surface = "Build",
		isArchived = false,
		isTeamCreateEnabled = true,
		sortParam = "LastUpdated",
		sortOrder = "Desc",
		needsAssetOptions = true,
		creators = p1,
		pageSize = var1,
		cursor = p3,
		search = if p2 ~= "" then nil else p2
	}
end

local function keyForCreators(p1)
	if p1 == nil then
		return nil
	end
	local list = table.create(#p1)
	
	for i, v in p1 do
		list[i] = `{v.creatorType}:{v.creatorTargetId}`
	end
	return table.concat(list, ",")
end

local _ = function(p2, p3)
	if p2 == nil then
		return false
	end
	for i, v in p2 do
		if v == p3 then
			return true
		end
	end
	return false
end

local _ = function(p4, p5)
	local roblox = p4._meta and p4._meta._roblox
	local var2 = if roblox then roblox.sessionStatus else nil
	
	return if var2 == nil then nil else p5[var2]
end

local function requestHandleToPromise(p4)
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p5, p6)
		-- upvalues: p4 (ref)
		task.spawn(function()
			-- upvalues: p4 (copy), p5 (ref), p6 (ref)
			while p4.state(false).status == "pending" do
				task.wait()
			end
			local var2 = p4.state(false)
			
			if var2.status == "succeeded" then
				p5(var2.result)
				
				return
			end
			p6(var2.error)
		end)
	end)
end

local function ignorePromiseRejection() end

local function noOp() end

local _ = function(p5)
	local roblox = p5._meta and p5._meta._roblox
	
	if roblox == nil then
		return nil
	end
	local universeId = roblox.universeId
	
	return if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
end

local function buildExperienceMetadataByUniverseId(p5, p6, p7)
	-- upvalues: universeConfigurationModule (ref), privacyType (ref)
	local t = {}
	
	for i, v in p5 do
		local name = v.name
		
		if typeof(name) == "string" and name ~= "" and not v.isArchived then
			local creatorName = v.creatorName
			local t_1 = {
				placeId = v.rootPlaceId,
				experienceName = name,
				creatorName = if typeof(creatorName) == "string" and creatorName ~= "" then creatorName else nil
			}
			local var2 = p6[i]
			local privacyTypeForAudiences = universeConfigurationModule.getPrivacyTypeForAudiences(v.audiences)
			t_1.visibilityLabel = if v.isActive == true and privacyTypeForAudiences == privacyType.Public and (var2 == nil or var2) then nil elseif privacyTypeForAudiences == privacyType.Public then p7.live else nil
			t_1.gameIcon = string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", i)
			t[i] = t_1
		end
	end
	return t
end

local function buildSessionItems(p8, p9, p10, _, p11)
	local t = {}
	local t_1 = {}
	
	for i, v in p8 do
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
			local var4 = if p9 then p9[var3] else nil
			local t_2 = {
				sessionId = sessionId,
				universeId = var3,
				placeId = if var4 then var4.placeId else nil,
				experienceName = if var4 then var4.experienceName else v.title or p11(var3),
				creatorName = if var4 then var4.creatorName else nil
			}
			local roblox_1 = v._meta and v._meta._roblox
			local var5 = if roblox_1 then roblox_1.sessionStatus else nil
			t_2.description = if var5 == nil then nil else p10[var5]
			t_2.visibilityLabel = if var4 then var4.visibilityLabel else nil
			t_2.gameIcon = if var4 then var4.gameIcon else string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", var3)
			table.insert(t_1, t_2)
		end
	end
	return t_1
end

local function buildLatestSessionByUniverseId(p12)
	local t = {}
	
	for i, v in p12 do
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

local function useUniverseSessions(p13, p14)
	-- upvalues: reactModule (ref), fFlagBuildExperiencePinForBuild (ref), promiseModule (ref), ignorePromiseRejection (ref), signalsModule (ref), useSignalState (ref)
	local var7, var8 = reactModule.useState({})
	local var9 = reactModule.useRef(var7)
	var9.current = var7
	local var10 = reactModule.useRef({})
	local var11 = reactModule.useRef(p14)
	var11.current = p14
	local var12 = reactModule.useRef(true)
	reactModule.useEffect(function()
		-- upvalues: var12 (ref)
		var12.current = true
		
		return function()
			-- upvalues: var12 (copy)
			var12.current = false
		end
	end, {})
	local var13 = reactModule.useCallback(function(p15)
		-- upvalues: var11 (ref), var10 (ref), var9 (ref), p13 (ref), fFlagBuildExperiencePinForBuild (copy), promiseModule (copy), var12 (ref), var8 (ref)
		local t = {}
		
		for i, v in var11.current do
			if not v.isArchived then
				local id = v.id
				local var14 = var10.current[id]
				
				if var14 ~= nil then
					table.insert(t, var14.promise)
				elseif p15 or var9.current[id] == nil then
					local var15 = p13.sessionFindByUniverse({
						sort = "desc",
						universeId = id,
						application = if fFlagBuildExperiencePinForBuild then "build" else nil,
						filterByPinForBuild = if fFlagBuildExperiencePinForBuild then true else nil
					})
					local t_1 = { promise = nil, handle = var15 }
					var10.current[id] = t_1
					local var16 = promiseModule.new(function(p16, p17)
						-- upvalues: var15 (ref)
						task.spawn(function()
							-- upvalues: var15 (copy), p16 (ref), p17 (ref)
							while true do
								while var15.state(false).status == "pending" do
									task.wait()
								end
								local var17 = var15.state(false)
								
								if var17.status == "succeeded" then
									p16(var17.result)
									
									return
								end
								p17(var17.error)
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
					end, function(p18)
						-- upvalues: var10 (copy), id (ref), var15 (ref), promiseModule (copy)
						local var18 = var10.current[id]
						
						if var18 ~= nil and var18.handle == var15 then
							var10.current[id] = nil
						end
						return promiseModule.reject(p18)
					end)
					t_1.promise = var16
					table.insert(t, var16)
				end
			end
		end
		return promiseModule.all(t)
	end, { p13 })
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), ignorePromiseRejection (copy)
		var13(false):catch(ignorePromiseRejection)
	end, { p14, var13 })
	
	return {
		entries = useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), p14 (ref), var7 (ref)
			return signalsModule.createComputed(function(p16)
				-- upvalues: p14 (copy), var7 (copy)
				local t = {}
				
				for i, v in p14 do
					local id = var7[v.id]
					local var17 = if id ~= nil then nil else id.state(p16)
					
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
		end, { p14, var7 })),
		refresh = reactModule.useCallback(function()
			-- upvalues: var13 (ref)
			return var13(true)
		end, { var13 })
	}
end

local function buildUniverseItems(p16, p17, p18, p19, p20)
	-- upvalues: buildLatestSessionByUniverseId (ref), universeConfigurationModule (ref), privacyType (ref), fFlagBuildWithGroupsModule (ref)
	local var17 = buildLatestSessionByUniverseId(p17)
	local t = {}
	
	for i, v in p16 do
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
				experienceName = if typeof(name) == "string" and name ~= "" then name else p20(id),
				creatorName = if typeof(v.creatorName) == "string" and v.creatorName ~= "" then v.creatorName else nil
			}
			
			if var19 then
				local roblox = var19._meta and var19._meta._roblox
				local var20 = if roblox then roblox.sessionStatus else nil
				var18 = if var20 == nil then nil else p18[var20]
			else
				var18 = nil
			end
			local isGroup
			t_1.description = var18
			t_1.visibilityLabel = if universeConfigurationModule.getPrivacyTypeForAudiences(v.audiences) == privacyType.Public then p19.live else nil
			t_1.gameIcon = string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", id)
			
			if fFlagBuildWithGroupsModule then
				isGroup = v.creatorType == "Group"
				isGroup = nil
			else
				isGroup = nil
			end
			t_1.isGroupGame = isGroup
			table.insert(t, t_1)
		end
	end
	return t
end

local function useUniverseSearchList(p21, p22, p23, p24, p25, p26, p27, p28, p29, p30)
	-- upvalues: reactModule (ref), fFlagBuildWithGroupsModule (ref), keyForCreators (ref), var1 (ref), signalsModule (ref), t_1 (ref), useSignalState (ref), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (ref), useUniverseSessions (ref), promiseModule (ref), ignorePromiseRejection (ref), buildUniverseItems (ref)
	local var21 = reactModule.useRef({})
	local var22 = reactModule.useRef(p23)
	var22.current = p23
	local var23 = if fFlagBuildWithGroupsModule then p30.creators else nil
	local var24 = if fFlagBuildWithGroupsModule then keyForCreators(var23) else nil
	local var25 = if fFlagBuildWithGroupsModule then reactModule.useRef(var23) else nil
	
	if fFlagBuildWithGroupsModule then
		var25.current = var23
	end
	local var26, var27 = reactModule.useState({
		query = p23,
		pageIndexes = { 0 },
		creators = var23,
		cursors = if fFlagBuildWithGroupsModule then {} else nil
	})
	local var28 = reactModule.useMemo(function()
		-- upvalues: fFlagBuildWithGroupsModule (copy), var26 (ref), var1 (copy), p21 (ref), p22 (ref)
		local t = {}
		
		if fFlagBuildWithGroupsModule then
			local creators = var26.creators
			
			if creators == nil then
				return t
			end
			local cursors = var26.cursors or {}
			
			for i, v in var26.pageIndexes do
				local query = var26.query
				table.insert(t, p21.getSearch({
					surface = "Build",
					isArchived = false,
					isTeamCreateEnabled = true,
					sortParam = "LastUpdated",
					sortOrder = "Desc",
					needsAssetOptions = true,
					creators = creators,
					pageSize = var1,
					cursor = cursors[v],
					search = if query ~= "" then nil else query
				}))
			end
			return t
		else
			for i, v in var26.pageIndexes do
				local query = var26.query
				table.insert(t, p21.getSearch({
					creatorType = "User",
					surface = "CreatorHubCreations",
					isArchived = false,
					isTeamCreateEnabled = true,
					sortParam = "LastUpdated",
					sortOrder = "Desc",
					needsAssetOptions = true,
					creatorTargetId = p22,
					pageIndex = v,
					pageSize = var1,
					search = if query ~= "" then nil else query
				}))
			end
		end
	end, { var26, p21, p22 })
	local var29 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var28 (ref), t_1 (copy), fFlagBuildWithGroupsModule (copy), var26 (ref), var1 (copy)
		return signalsModule.createComputed(function(p31)
			-- upvalues: var28 (copy), t_1 (copy), fFlagBuildWithGroupsModule (copy), var26 (copy), var1 (copy)
			local t = {}
			local t_2 = {}
			local var30 = nil
			local totalResults = nil
			local var31 = 0
			local var32 = 0
			local var33 = "NotReady"
			local var34 = "NotReady"
			
			for i, v in var28 do
				local var35 = v.data(p31)
				var33 = v.status(p31)
				
				if i == 1 then
					var34 = var33
				end
				if var35 ~= nil then
					var30 = var35
					totalResults = var35.totalResults or (var35.totalHits or totalResults)
					local data = var35.data or t_1
					var31 += #data
					var32 = 0
					
					for i_1, v_1 in data do
						if not t_2[v_1.id] then
							t_2[v_1.id] = true
							var32 += 1
							table.insert(t, v_1)
						end
					end
				end
			end
			local var36 = nil
			local var37 = nil
			local var38 = nil
			
			if fFlagBuildWithGroupsModule then
				if var33 == "Ready" and var30 ~= nil then
					local nextCursor = var30.nextCursor
					
					if nextCursor ~= nil and nextCursor ~= "" and var32 > 0 then
						local var39
						local cursors = var26.cursors
						
						if cursors == nil then
							var39 = false
						else
							for i_1, v_1 in cursors do
								if v_1 == nextCursor then
									var39 = true
								end
							end
							var39 = false
						end
						if not var39 then
							var36 = #var26.pageIndexes
							var37 = nextCursor
						end
					end
				elseif var33 == "Failed" and #var28 > 1 then
					var38 = var26.pageIndexes[#var26.pageIndexes]
				end
			elseif var33 == "Ready" and var30 ~= nil then
				local nextResultIndex = var30.nextResultIndex
				
				if nextResultIndex ~= nil then
					var36 = nextResultIndex / var1
				elseif totalResults ~= nil and var31 < totalResults then
					var36 = var26.pageIndexes[#var26.pageIndexes] + 1
				end
				if var36 ~= nil and (var36 < 0 or table.find(var26.pageIndexes, var36)) then
					var36 = nil
				end
			elseif var33 == "Failed" and #var28 > 1 then
				var38 = var26.pageIndexes[#var26.pageIndexes]
			end
			return {
				items = t,
				status = var34,
				nextPageIndex = var36,
				nextCursor = var37,
				failedPageIndex = var38,
				isLoadingMore = #var28 > 1 and var33 == "NotReady"
			}
		end)
	end, { var26.pageIndexes, var26.cursors, var28 }))
	local var40 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then useUniverseSessions(p29, var29.items) else nil
	local var41 = reactModule.useCallback(function(p32, p33, p34, p35, p36)
		-- upvalues: fFlagBuildWithGroupsModule (copy), keyForCreators (copy), var21 (ref), var1 (copy), p22 (ref), p21 (ref)
		local var42 = if fFlagBuildWithGroupsModule then `{p33}\0{p32}\0{p35 or ""}\0{keyForCreators(p36) or ""}` else `{p33}\0{p32}`
		
		if p34 then
			var21.current[var42] = nil
		end
		local var43 = var21.current[var42]
		
		if var43 == nil then
			local var44 = nil
			var44 = p21.refreshSearch(if fFlagBuildWithGroupsModule then {
				surface = "Build",
				isArchived = false,
				isTeamCreateEnabled = true,
				sortParam = "LastUpdated",
				sortOrder = "Desc",
				needsAssetOptions = true,
				creators = p36,
				pageSize = var1,
				cursor = p35,
				search = if p32 ~= "" then nil else p32
			} else {
				creatorType = "User",
				surface = "CreatorHubCreations",
				isArchived = false,
				isTeamCreateEnabled = true,
				sortParam = "LastUpdated",
				sortOrder = "Desc",
				needsAssetOptions = true,
				creatorTargetId = p22,
				pageIndex = p33,
				pageSize = var1,
				search = if p32 ~= "" then nil else p32
			}):finally(function()
				-- upvalues: var21 (copy), var42 (ref), var44 (write)
				if var21.current[var42] == var44 then
					var21.current[var42] = nil
				end
			end)
			var21.current[var42] = var44
			
			return var44
		end
		return var43
	end, { p21, p22 })
	local var42 = reactModule.useCallback(function(p32)
		-- upvalues: var22 (ref), fFlagBuildWithGroupsModule (copy), var25 (ref), var27 (ref), promiseModule (copy), var41 (ref)
		p32 = p32 or var22.current
		
		if not fFlagBuildWithGroupsModule then
			var27({ query = p32, pageIndexes = { 0 } })
			
			return var41(p32, 0)
		end
		local current = var25.current
		var27({
			query = p32,
			pageIndexes = { 0 },
			creators = current,
			cursors = {}
		})
		
		return if current == nil then promiseModule.resolve() else var41(p32, 0, nil, nil, current)
	end, { var41 })
	reactModule.useEffect(function()
		-- upvalues: p24 (ref), fFlagBuildWithGroupsModule (copy), keyForCreators (copy), var26 (ref), var24 (ref), p23 (ref), var42 (ref), ignorePromiseRejection (copy)
		if not p24 then return end
		if var26.query ~= p23 or fFlagBuildWithGroupsModule and keyForCreators(var26.creators) ~= var24 then
			var42(p23):catch(ignorePromiseRejection)
		end
	end, {
		var24, p23, p24, var42, var26.creators, var26.query
	})
	
	return {
		items = reactModule.useMemo(function()
			-- upvalues: buildUniverseItems (copy), var29 (ref), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var40 (ref), p25 (ref), p26 (ref), p27 (ref), p28 (ref)
			return buildUniverseItems(var29.items, if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then var40.entries else p25, p26, p27, p28)
		end, {
			p26,
			var29.items,
			if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then var40.entries else p25,
			p27,
			p28
		}),
		status = if fFlagBuildWithGroupsModule and p30.creators == nil then p30.status else var29.status,
		sourceItemCount = #var29.items,
		failedPageIndex = var29.failedPageIndex,
		isLoadingMore = var29.isLoadingMore,
		query = var26.query,
		refresh = var42,
		refreshSessions = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then var40.refresh else nil,
		loadMore = reactModule.useCallback(function()
			-- upvalues: var29 (ref), var26 (ref), var22 (ref), fFlagBuildWithGroupsModule (copy), keyForCreators (copy), var25 (ref), var27 (ref), var41 (ref), ignorePromiseRejection (copy)
			local failedPageIndex = var29.failedPageIndex or var29.nextPageIndex
			local query = var26.query
			
			if var29.isLoadingMore or failedPageIndex == nil or var22.current ~= query then return end
			if fFlagBuildWithGroupsModule then
				local creators = var26.creators
				
				if creators == nil or keyForCreators(creators) ~= keyForCreators(var25.current) then return end
				local var43 = var29.failedPageIndex ~= nil
				local var44 = if var43 then (var26.cursors or {})[failedPageIndex] else var29.nextCursor
				
				if not var43 then
					var27(function(p32)
						-- upvalues: query (ref), creators (ref), failedPageIndex (ref), var44 (ref)
						if p32.query == query and p32.creators == creators and not table.find(p32.pageIndexes, failedPageIndex) then
							local cloned = table.clone(p32.pageIndexes)
							table.insert(cloned, failedPageIndex)
							local cloned_1 = table.clone(p32.cursors or {})
							cloned_1[failedPageIndex] = var44
							
							return {
								query = p32.query,
								pageIndexes = cloned,
								creators = p32.creators,
								cursors = cloned_1
							}
						end
						return p32
					end)
				end
				var41(query, failedPageIndex, var43, var44, creators):catch(ignorePromiseRejection)
				
				return
			elseif var29.failedPageIndex == nil then
				var27(function(p32)
					-- upvalues: query (ref), failedPageIndex (ref)
					if p32.query == query and not table.find(p32.pageIndexes, failedPageIndex) then
						local cloned = table.clone(p32.pageIndexes)
						table.insert(cloned, failedPageIndex)
						
						return { query = p32.query, pageIndexes = cloned }
					end
					return p32
				end)
			end
			var41(query, failedPageIndex, var29.failedPageIndex ~= nil):catch(ignorePromiseRejection)
		end, {
			var29,
			var41,
			var26.creators,
			var26.cursors,
			var26.query
		})
	}
end

local function useBuildCreators(p32, p33, p34)
	-- upvalues: reactModule (ref), useSignalState (ref)
	local var43 = reactModule.useMemo(function()
		-- upvalues: p32 (ref)
		return p32.getAndFetchGroups("Build")
	end, { p32 })
	local var44 = useSignalState(var43.data)
	local var45 = useSignalState(var43.status)
	local games = p34.games
	local groupId = p34.groupId
	
	return reactModule.useMemo(function()
		-- upvalues: p33 (ref), games (ref), var44 (ref), var45 (ref), groupId (ref)
		local t = { creatorType = "User", creatorTargetId = p33 }
		
		if games == "MyGames" then
			return { status = "Ready", creators = { t } }
		elseif var44 == nil then
			return {
				creators = nil,
				status = if var45 == "Failed" then "Failed" else "NotReady"
			}
		elseif games == "GroupGames" and groupId ~= nil then
			for i, v in var44.groups do
				if v.id == groupId then
					return {
						status = "Ready",
						creators = { { creatorType = "Group", creatorTargetId = v.id } }
					}
				end
			end
		end
		if games == "GroupGames" and #var44.groups == 0 then
			return { creators = nil, status = "Ready" }
		end
		local var46 = if games == "GroupGames" then {} else { t }
		
		for v, v in var44.groups do
			table.insert(var46, { creatorType = "Group", creatorTargetId = v.id })
		end
		return { status = "Ready", creators = var46 }
	end, {
		games,
		groupId,
		var44,
		var45,
		p33
	})
end

local function useLegacySessionList(p35, p36, p37, p38, p39, p40, p41)
	-- upvalues: reactModule (ref), signalsModule (ref), useSignalState (ref), privacyType (ref), contentMaturityUtilsModule (ref), t (ref), buildExperienceMetadataByUniverseId (ref), buildSessionItems (ref), matchesSearchQueryModule (ref)
	local var47 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p35 (ref), p36 (ref)
		return signalsModule.createComputed(function(p42)
			-- upvalues: p35 (copy), p36 (copy)
			local t = {}
			local t_1 = {}
			
			for i, v in p35 do
				local var48
				local roblox = v._meta and v._meta._roblox
				
				if roblox == nil then
					var48 = nil
				else
					local universeId = roblox.universeId
					var48 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
				end
				if var48 ~= nil and not t_1[var48] then
					t_1[var48] = true
					local var49 = p36.getAndFetchSummary(var48).data(p42)
					
					if var49 ~= nil then
						t[var48] = var49
					end
				end
			end
			return t
		end)
	end, { p36, p35 }))
	local var48 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p37 (ref), var47 (ref), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
		return signalsModule.createComputed(function(p42)
			-- upvalues: p37 (copy), var47 (copy), privacyType (copy), contentMaturityUtilsModule (copy), t (copy)
			local t_1 = {}
			
			if p37 ~= nil then
				for i, v in var47 do
					if v.isActive == true and v.privacyType == privacyType.Public and p37.getAndFetchEligibility(i).data(p42) ~= nil then
						t_1[i] = contentMaturityUtilsModule.isSealBroken(i) and contentMaturityUtilsModule.isContentUnrated(i)
					end
				end
			end
			return if next(t_1) == nil then t else t_1
		end)
	end, { p37, var47 }))
	local var49 = reactModule.useMemo(function()
		-- upvalues: buildExperienceMetadataByUniverseId (copy), var47 (ref), var48 (ref), p40 (ref)
		return buildExperienceMetadataByUniverseId(var47, var48, p40)
	end, { var48, var47, p40 })
	local var50 = reactModule.useMemo(function()
		-- upvalues: buildSessionItems (copy), p35 (ref), var49 (ref), p39 (ref), p40 (ref), p41 (ref), var47 (ref)
		local t = {}
		
		for i, v in buildSessionItems(p35, var49, p39, p40, p41) do
			local universeId = var47[v.universeId]
			
			if universeId ~= nil and not universeId.isArchived then
				table.insert(t, v)
			end
		end
		return t
	end, {
		p39, var49, p35, var47, p40, p41
	})
	
	return {
		displayedItems = var50,
		joinableItems = reactModule.useMemo(function()
			-- upvalues: p38 (ref), var50 (ref), matchesSearchQueryModule (copy)
			if p38 == "" then
				return var50
			end
			local t = {}
			
			for i, v in var50 do
				if matchesSearchQueryModule(v.experienceName, p38) then
					table.insert(t, v)
				end
			end
			return t
		end, { p38, var50 }),
		hasPendingSummary = reactModule.useMemo(function()
			-- upvalues: p35 (ref), var47 (ref)
			local t = {}
			
			for i, v in p35 do
				local var51
				local roblox = v._meta and v._meta._roblox
				
				if roblox == nil then
					var51 = nil
				else
					local universeId = roblox.universeId
					var51 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
				end
				if var51 ~= nil and not t[var51] then
					t[var51] = true
					
					if var47[var51] == nil then
						return true
					end
				end
			end
			return false
		end, { p35, var47 })
	}
end

return function(p42)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationRoactContext (ref), localizationModule (ref), creatorAgentChatModule (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (ref), universeSearchModule (ref), universeActivationModule (ref), universeConfigurationModule (ref), getSearchQueryStoreModule (ref), getBuildExperienceRefreshStoreModule (ref), appLifecycleObserverService (ref), useSignalState (ref), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (ref), playersService (ref), fFlagBuildWithGroupsModule (ref), creatorGroupsModule (ref), useBuildCreators (ref), t_2 (ref), useUniverseSearchList (ref), useLegacySessionList (ref), promiseModule (ref), ignorePromiseRejection (ref), signalsModule (ref), fIntMyCreationsSessionListPollingIntervalSecondsModule (ref), requestHandleToPromise (ref), noOp (ref)
	local var51 = useLocalization({
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
	local var52 = reactModule.useContext(localizationRoactContext)
	local var53 = reactModule.useCallback(function(p43)
		-- upvalues: var52 (ref), localizationStringsModule (copy)
		return var52:Format(localizationStringsModule.MY_CREATIONS_UNIVERSE_NAME, { UNIVERSE_ID = p43 })
	end, { var52, var51[localizationModule.RobloxLocaleIdKey] })
	local loadError = var51.loadError
	local var54 = reactModule.useMemo(function()
		-- upvalues: var51 (ref)
		return {
			waiting_on_client = var51.inputNeeded,
			idle = var51.ready,
			working = var51.building
		}
	end, { var51.inputNeeded, var51.ready, var51.building })
	local var55 = reactModule.useMemo(function()
		-- upvalues: var51 (ref)
		return {
			live = var51.live,
			private = var51.private,
			["public"] = var51["public"],
			publiclyUnavailable = var51.publiclyUnavailable,
			restricted = var51.restricted
		}
	end, {
		var51.live,
		var51.private,
		var51["public"],
		var51.publiclyUnavailable,
		var51.restricted
	})
	local creatorAgentChatStore = p42.creatorAgentChatStore or creatorAgentChatModule.getCreatorAgentChatStore()
	local searchStore = p42.searchStore
	
	if fFlagBuildExperienceMyCreationsUseUniverseListModule and searchStore == nil then
		searchStore = universeSearchModule.getUniverseSearchStore()
	end
	local var56 = if not fFlagBuildExperienceMyCreationsUseUniverseListModule then universeActivationModule.getUniverseActivationStore() else nil
	local var57 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then nil else p42.configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
	local searchQueryStore = p42.searchQueryStore or getSearchQueryStoreModule()
	local var58 = getBuildExperienceRefreshStoreModule()
	local appLifecycleObserverService_1 = p42.appLifecycleObserverService or appLifecycleObserverService
	local var59 = p42.isFocused ~= false
	local var60, var61 = reactModule.useState(false)
	local var62 = searchQueryStore.useDebouncedQuery()
	local var63 = useSignalState(var58.getRefreshTick)
	local var64 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then reactModule.useRef(var63) else nil
	local var65 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then reactModule.useRef(var59) else nil
	local sessionListStore = creatorAgentChatStore.getSessionListStore()
	local var66 = useSignalState(sessionListStore.getSessions)
	local var67 = useSignalState(sessionListStore.getNextPageToken)
	local var68 = useSignalState(sessionListStore.getStatus)
	local var69 = useSignalState(sessionListStore.getLoadMoreStatus)
	local var70 = if var68 == "pending" then "NotReady" elseif var68 == "succeeded" then "Ready" else "Failed"
	local userId = p42.userId or (if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
	local var71 = if fFlagBuildWithGroupsModule then p42.creatorGroupsStore or creatorGroupsModule.getCreatorGroupsStore() else nil
	local var72 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then useUniverseSearchList(searchStore, userId, var62, var59, var66, var54, var55, var53, if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then creatorAgentChatStore else nil, if fFlagBuildWithGroupsModule then useBuildCreators(var71, userId, p42.filter or t_2) else nil) else nil
	local var73 = if not fFlagBuildExperienceMyCreationsUseUniverseListModule then useLegacySessionList(var66, var57, var56, var62, var54, var55, var53) else nil
	local var74 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var72.refresh else nil
	local var75 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule and fFlagBuildExperienceMyCreationsUseUniverseListModule then var72.refreshSessions else nil
	local var76 = if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then reactModule.useRef(var75) else nil
	
	if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
		var76.current = var75
	end
	local var77 = reactModule.useCallback(function()
		-- upvalues: sessionListStore (ref), promiseModule (copy), fFlagBuildWithGroupsModule (copy), var71 (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var74 (ref), var76 (ref), ignorePromiseRejection (copy)
		local var78 = sessionListStore.refresh()
		local var79 = promiseModule.new(function(p43, p44)
			-- upvalues: var78 (ref)
			task.spawn(function()
				-- upvalues: var78 (copy), p43 (ref), p44 (ref)
				while true do
					while var78.state(false).status == "pending" do
						task.wait()
					end
					local var80 = var78.state(false)
					
					if var80.status == "succeeded" then
						p43(var80.result)
						
						return
					end
					p44(var80.error)
				end
			end)
		end)
		
		if fFlagBuildWithGroupsModule then
			var71.fetchGroups("Build")
		end
		return if fFlagBuildExperienceMyCreationsUseUniverseListModule then if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then promiseModule.all({
			var74(),
			var79,
			var76.current():catch(ignorePromiseRejection)
		}) else promiseModule.all({ var74(), var79 }) else var79
	end, { var71, var74, sessionListStore })
	reactModule.useEffect(function()
		-- upvalues: appLifecycleObserverService_1 (ref), var59 (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var74 (ref), ignorePromiseRejection (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var76 (ref), sessionListStore (ref)
		local onUnhideConnection = appLifecycleObserverService_1.OnUnhide:Connect(function()
			-- upvalues: var59 (copy), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var74 (copy), ignorePromiseRejection (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var76 (copy), sessionListStore (copy)
			if var59 then
				if fFlagBuildExperienceMyCreationsUseUniverseListModule then
					var74():catch(ignorePromiseRejection)
					
					if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
						var76.current():catch(ignorePromiseRejection)
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
		var59,
		var74,
		sessionListStore
	})
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var64 (ref), var63 (ref), var59 (ref), var65 (ref), var61 (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var74 (ref), ignorePromiseRejection (copy), var76 (ref), sessionListStore (ref), signalsModule (copy)
		local var80 = false
		
		if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
			var80 = if var64.current == var63 then var59 and not var65.current else true
			var64.current = var63
			var65.current = var59
		end
		if not var59 then
			var61(false)
			
			return
		end
		var61(false)
		
		if fFlagBuildExperienceMyCreationsUseUniverseListModule then
			var74():catch(ignorePromiseRejection)
			
			if fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule and var80 then
				var76.current():catch(ignorePromiseRejection)
			end
		end
		local var81 = sessionListStore.refresh()
		
		return signalsModule.createEffect(function(p45)
			-- upvalues: var81 (ref), var61 (copy)
			if var81.state(p45).status == "succeeded" then
				var61(true)
			end
		end)
	end, { var59, var63, var74, sessionListStore })
	local maxValue = math.max(0, p42.pollingIntervalSeconds or fIntMyCreationsSessionListPollingIntervalSecondsModule)
	reactModule.useEffect(function()
		-- upvalues: var59 (ref), maxValue (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var76 (ref), ignorePromiseRejection (copy), sessionListStore (ref)
		if var59 and maxValue ~= 0 then
			local var80 = false
			
			local function scheduleNextPoll()
				-- upvalues: maxValue (copy), var80 (write), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var76 (copy), ignorePromiseRejection (copy), sessionListStore (copy), scheduleNextPoll (ref)
				task.delay(maxValue, function()
					-- upvalues: var80 (copy), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var76 (copy), ignorePromiseRejection (copy), sessionListStore (copy), scheduleNextPoll (copy)
					if var80 then return end
					if fFlagBuildExperienceMyCreationsUseUniverseListModule and fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
						var76.current():catch(ignorePromiseRejection)
					end
					sessionListStore.refresh()
					scheduleNextPoll()
				end)
			end
			
			task.delay(maxValue, function()
				-- upvalues: var80 (write), fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), var76 (copy), ignorePromiseRejection (copy), sessionListStore (copy), scheduleNextPoll (ref)
				if var80 then return end
				if fFlagBuildExperienceMyCreationsUseUniverseListModule and fFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
					var76.current():catch(ignorePromiseRejection)
				end
				sessionListStore.refresh()
				scheduleNextPoll()
			end)
			
			return function()
				-- upvalues: var80 (write)
				var80 = true
			end
		end
	end, { var59, maxValue, sessionListStore })
	local var80 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var72.items else var73.displayedItems
	local var81 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var72.items else var73.joinableItems
	local var82 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then false else var73.hasPendingSummary
	local var83 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var72.status else var70
	local var84 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var72.sourceItemCount else #var66
	local var85 = if var83 ~= "Ready" then var84 > 0 else true
	local isPending = var69 == "pending"
	local var86 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var72.failedPageIndex else nil
	local var87 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var72.isLoadingMore else false
	local var88 = reactModule.useCallback(function()
		-- upvalues: sessionListStore (ref), promiseModule (copy), requestHandleToPromise (copy)
		local var89 = sessionListStore.loadMore()
		
		return if var89 == nil then promiseModule.resolve() else requestHandleToPromise(var89)
	end, { isPending, var67, var70, sessionListStore })
	local var89 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var72.loadMore else nil
	local var90 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var72.query else var62
	
	return {
		displayedItems = var80,
		items = var81,
		listStatus = var83,
		hasDisplayedResult = var85,
		hasPendingSummary = var82,
		isSettledNoResults = var90 == var62 and (var85 and (not var82 and #var81 == 0)),
		query = var90,
		sourceItemCount = var84,
		sessionCount = #var66,
		sessionListStatus = var70,
		hasCompletedFocusedRefresh = var60,
		loadError = loadError,
		refresh = var77,
		loadMoreIfNeeded = reactModule.useCallback(function(p45)
			-- upvalues: fFlagBuildExperienceMyCreationsUseUniverseListModule (copy), var89 (ref), var67 (ref), isPending (ref), var70 (ref), var88 (ref)
			local y = p45.AbsoluteCanvasSize.Y
			
			if p45.CanvasPosition.Y <= 0 or y <= 0 or p45.AbsoluteWindowSize.Y <= 0 then return end
			if math.max(0, y - p45.AbsoluteWindowSize.Y - 250) < p45.CanvasPosition.Y then
				if fFlagBuildExperienceMyCreationsUseUniverseListModule then
					var89()
					
					if var67 == nil or isPending or var70 ~= "Ready" then
						return
					else
						var88()
						
						return
					end
				elseif var67 ~= nil and not isPending and var70 == "Ready" then
					var88()
				end
			end
		end, {
			isPending,
			var88,
			var89,
			var67,
			var70
		}),
		failedLoadMore = var86 ~= nil,
		retryLoadMore = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var89 else noOp,
		isLoadingMore = if fFlagBuildExperienceMyCreationsUseUniverseListModule then var87 else isPending
	}
end