local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local Players = game:GetService("Players")
local FIntMyCreationsSessionListPollingIntervalSecondsModule = require(BuildExperience.Flags.FIntMyCreationsSessionListPollingIntervalSeconds)
local FFlagBuildExperienceMyCreationsUseUniverseListModule = require(BuildExperience.Flags.FFlagBuildExperienceMyCreationsUseUniverseList)
local FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule = require(BuildExperience.Flags.FFlagBuildExperienceMyCreationsFindSessionsByUniverse)
local FFlagBuildWithGroupsModule = require(BuildExperience.Flags.FFlagBuildWithGroups)
local FFlagBuildExperienceCursorSearchPagesModule = require(BuildExperience.Flags.FFlagBuildExperienceCursorSearchPages)
local LocalizationModule = require(Parent.Localization)
local PromiseModule = require(Parent.Promise)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local LocalizationRoactContext = LocalizationModule.LocalizationRoactContext
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local CreatorGroupsModule = require(Parent.DataHydration.CreatorGroups)
local UniverseActivationModule = require(Parent.DataHydration.UniverseActivation)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local UniverseSearchModule = require(Parent.DataHydration.UniverseSearch)
local PrivacyType = UniverseConfigurationModule.PrivacyType
local ContentMaturityUtilsModule = require(BuildExperience.utils.ContentMaturityUtils)
local MatchesSearchQueryModule = require(BuildExperience.utils.matchesSearchQuery)
local ThumbForUniverseIdModule = require(BuildExperience.utils.thumbForUniverseId)
local UseCursorSearchPagesModule = require(BuildExperience.utils.useCursorSearchPages)
local GetBuildExperienceRefreshStoreModule = require(BuildExperience.Stores.GetBuildExperienceRefreshStore)
local _ = require(BuildExperience.Stores.GetMyCreationsFilterStore)
local GetSearchQueryStoreModule = require(BuildExperience.Stores.GetSearchQueryStore)
local _ = require(BuildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)
local FFlagBuildExperiencePinForBuild = require(Parent.SharedFlags).FFlagBuildExperiencePinForBuild
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local PageSize: number = if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then 15 else 50
local t = {}
local t1 = {}
local config = { games = "All" }

local function _(p1, p2, p3)
	-- upvalues: UniverseConfigurationModule (copy), PrivacyType (copy)
	local PrivacyTypeForAudiences = UniverseConfigurationModule.getPrivacyTypeForAudiences(p1.audiences)
	
	return if p1.isActive == true and PrivacyTypeForAudiences == PrivacyType.Public and (p2 == nil or p2) then nil elseif PrivacyTypeForAudiences == PrivacyType.Public then p3.live else nil
end

local _ = function(p1, p2)
	-- upvalues: UniverseConfigurationModule (copy), PrivacyType (copy)
	return if UniverseConfigurationModule.getPrivacyTypeForAudiences(p1.audiences) == PrivacyType.Public then p2.live else nil
end

local _ = function(CreatorTargetId, p1, PageIndex)
	-- upvalues: PageSize (copy)
	return {
		creatorType = "User",
		surface = "CreatorHubCreations",
		isArchived = false,
		isTeamCreateEnabled = true,
		sortParam = "LastUpdated",
		sortOrder = "Desc",
		needsAssetOptions = true,
		creatorTargetId = CreatorTargetId,
		pageIndex = PageIndex,
		pageSize = PageSize,
		search = if p1 == "" then nil else p1
	}
end

local _ = function(Creators, p1, Cursor)
	-- upvalues: PageSize (copy)
	return {
		surface = "Build",
		isArchived = false,
		isTeamCreateEnabled = true,
		sortParam = "LastUpdated",
		sortOrder = "Desc",
		needsAssetOptions = true,
		creators = Creators,
		pageSize = PageSize,
		cursor = Cursor,
		search = if p1 == "" then nil else p1
	}
end

local function keyForCreators(Creators): string?
	if Creators == nil then
		return nil
	end
	local Buffer = table.create(#Creators)
	
	for i, creator in Creators do
		Buffer[i] = `{creator.creatorType}:{creator.creatorTargetId}`
	end
	return table.concat(Buffer, ",")
end

local _ = function(List, p1): boolean
	if List == nil then
		return false
	end
	for _, value in List do
		if value == p1 then
			return true
		end
	end
	return false
end

local _ = function(p2, p3)
	local Roblox = p2._meta and p2._meta._roblox
	local SessionStatus = if Roblox then Roblox.sessionStatus else nil
	
	return if SessionStatus == nil then nil else p3[SessionStatus]
end

local function requestHandleToPromise(More)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(Callback, Callback1)
		-- upvalues: More (copy)
		task.spawn(function()
			-- upvalues: More (upval), Callback (copy), Callback1 (copy)
			while More.state(false).status == "pending" do
				task.wait()
			end
			local StateResult = More.state(false)
			
			if StateResult.status == "succeeded" then
				Callback(StateResult.result)
				
				return
			else
				Callback1(StateResult.error)
			end
		end)
	end)
end

local function ignorePromiseRejection() end

local function noOp() end

local _ = function(p2)
	local Roblox = p2._meta and p2._meta._roblox
	
	if Roblox == nil then
		return nil
	else
		local UniverseId = Roblox.universeId
		
		return if typeof(UniverseId) == "number" and UniverseId ~= 0 then UniverseId else nil
	end
end

local function buildExperienceMetadataByUniverseId(List, p2, p3)
	-- upvalues: UniverseConfigurationModule (copy), PrivacyType (copy), ThumbForUniverseIdModule (copy)
	local t = {}
	
	for i, value in List do
		local Name = value.name
		
		if typeof(Name) == "string" and Name ~= "" and not value.isArchived then
			local CreatorName = value.creatorName
			local v1 = p2[i]
			local PrivacyTypeForAudiences = UniverseConfigurationModule.getPrivacyTypeForAudiences(value.audiences)
			t[i] = {
				placeId = value.rootPlaceId,
				experienceName = Name,
				creatorName = if typeof(CreatorName) == "string" and CreatorName ~= "" then CreatorName else nil,
				visibilityLabel = if value.isActive == true and PrivacyTypeForAudiences == PrivacyType.Public and (v1 == nil or v1) then nil elseif PrivacyTypeForAudiences == PrivacyType.Public then p3.live else nil,
				gameIcon = ThumbForUniverseIdModule(i)
			}
		end
	end
	return t
end

local function buildSessionItems(List, UseMemoResult, p4, _, Callback)
	-- upvalues: ThumbForUniverseIdModule (copy)
	local t = {}
	local List1 = {}
	
	for _, value in List do
		local SessionId = value.sessionId
		local Roblox = value._meta and value._meta._roblox
		local UniverseId = nil
		
		if Roblox == nil then
			UniverseId = nil
		else
			local UniverseId1 = Roblox.universeId
			UniverseId = if typeof(UniverseId1) == "number" and UniverseId1 ~= 0 then UniverseId1 else nil
		end
		if typeof(SessionId) == "string" and SessionId ~= "" and UniverseId ~= nil and not t[UniverseId] then
			t[UniverseId] = true
			local UseMemoResultEntry = if UseMemoResult then UseMemoResult[UniverseId] else nil
			local config = {
				sessionId = SessionId,
				universeId = UniverseId,
				placeId = if UseMemoResultEntry then UseMemoResultEntry.placeId else nil,
				experienceName = if UseMemoResultEntry then UseMemoResultEntry.experienceName else value.title or Callback(UniverseId),
				creatorName = if UseMemoResultEntry then UseMemoResultEntry.creatorName else nil,
				description = if SessionStatus == nil then nil else p4[SessionStatus],
				visibilityLabel = if UseMemoResultEntry then UseMemoResultEntry.visibilityLabel else nil,
				gameIcon = if UseMemoResultEntry then UseMemoResultEntry.gameIcon else ThumbForUniverseIdModule(UniverseId)
			}
			local Roblox1 = value._meta and value._meta._roblox
			local SessionStatus = if Roblox1 then Roblox1.sessionStatus else nil
			table.insert(List1, config)
		end
	end
	return List1
end

local function buildLatestSessionByUniverseId(List)
	local t = {}
	
	for _, value in List do
		local Roblox = value._meta and value._meta._roblox
		local v2 = nil
		
		if Roblox == nil then
			v2 = nil
		else
			local UniverseId = Roblox.universeId
			v2 = if typeof(UniverseId) == "number" and UniverseId ~= 0 then UniverseId else nil
		end
		if v2 ~= nil and t[v2] == nil then
			t[v2] = value
		end
	end
	return t
end

local function useUniverseSessions(p5, Current)
	-- upvalues: ReactModule (copy), FFlagBuildExperiencePinForBuild (copy), PromiseModule (copy), ignorePromiseRejection (copy), SignalsModule (copy), UseSignalStateFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseRefResult = ReactModule.useRef(UseStateResult)
	UseRefResult.current = UseStateResult
	local UseRefResult1 = ReactModule.useRef({})
	local UseRefResult2 = ReactModule.useRef(Current)
	UseRefResult2.current = Current
	local UseRefResult3 = ReactModule.useRef(true)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult3 (copy)
		UseRefResult3.current = true
		
		return function()
			-- upvalues: UseRefResult3 (upval)
			UseRefResult3.current = false
		end
	end, {})
	local UseResult = ReactModule.useCallback(function(p6)
		-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy), UseRefResult (copy), p5 (copy), FFlagBuildExperiencePinForBuild (upval), PromiseModule (upval), UseRefResult3 (copy), UseStateResult2 (copy)
		local List = {}
		
		for _, value in UseRefResult2.current do
			if not value.isArchived then
				local Id = value.id
				local CurrentEntry = UseRefResult1.current[Id]
				
				if CurrentEntry ~= nil then
					table.insert(List, CurrentEntry.promise)
				elseif p6 or UseRefResult.current[Id] == nil then
					local SessionFindByUniverseResult = p5.sessionFindByUniverse({
						sort = "desc",
						universeId = Id,
						application = if FFlagBuildExperiencePinForBuild then "build" else nil,
						filterByPinForBuild = if FFlagBuildExperiencePinForBuild then true else nil
					})
					local config = { promise = nil, handle = SessionFindByUniverseResult }
					UseRefResult1.current[Id] = config
					local Promise = PromiseModule.new(function(Callback, Callback1)
						-- upvalues: SessionFindByUniverseResult (copy)
						task.spawn(function()
							-- upvalues: SessionFindByUniverseResult (upval), Callback (copy), Callback1 (copy)
							while SessionFindByUniverseResult.state(false).status == "pending" do
								task.wait()
							end
							local StateResult = SessionFindByUniverseResult.state(false)
							
							if StateResult.status == "succeeded" then
								Callback(StateResult.result)
								
								return
							else
								Callback1(StateResult.error)
							end
						end)
					end):andThen(function()
						-- upvalues: UseRefResult1 (upval), Id (copy), SessionFindByUniverseResult (copy), UseRefResult3 (upval), UseRefResult (upval), UseStateResult2 (upval)
						local CurrentEntry = UseRefResult1.current[Id]
						
						if CurrentEntry == nil or CurrentEntry.handle ~= SessionFindByUniverseResult then return end
						UseRefResult1.current[Id] = nil
						
						if UseRefResult3.current then
							local Copy = table.clone(UseRefResult.current)
							Copy[Id] = SessionFindByUniverseResult
							UseRefResult.current = Copy
							UseStateResult2(Copy)
						end
					end, function(p7)
						-- upvalues: UseRefResult1 (upval), Id (copy), SessionFindByUniverseResult (copy), PromiseModule (upval)
						local CurrentEntry = UseRefResult1.current[Id]
						
						if CurrentEntry ~= nil and CurrentEntry.handle == SessionFindByUniverseResult then
							UseRefResult1.current[Id] = nil
						end
						return PromiseModule.reject(p7)
					end)
					config.promise = Promise
					table.insert(List, Promise)
				end
			end
		end
		return PromiseModule.all(List)
	end, { p5 })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy), ignorePromiseRejection (upval)
		UseResult(false):catch(ignorePromiseRejection)
	end, { Current, UseResult })
	
	return {
		entries = UseSignalStateFunction((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), Current (copy), UseStateResult (copy)
			return SignalsModule.createComputed(function(p7)
				-- upvalues: Current (upval), UseStateResult (upval)
				local List = {}
				
				for _, value in Current do
					local UseStateResultEntry = UseStateResult[value.id]
					local StateResult = if UseStateResultEntry == nil then nil else UseStateResultEntry.state(p7)
					local NoStateResult: boolean = StateResult == nil or StateResult.status ~= "succeeded" or StateResult.result == nil
					local Session = nil
					
					if not NoStateResult then
						local Sessions = StateResult.result.sessions
						Session = if typeof(Sessions) == "table" then Sessions[1] else nil
						NoStateResult = Session == nil
					end
					if not NoStateResult then
						table.insert(List, Session)
					end
				end
				return List
			end)
		end, { Current, UseStateResult }))),
		refresh = ReactModule.useCallback(function()
			-- upvalues: UseResult (copy)
			return UseResult(true)
		end, { UseResult })
	}
end

local function buildUniverseItems(Current, Entries, p7, p8, Callback)
	-- upvalues: buildLatestSessionByUniverseId (copy), UniverseConfigurationModule (copy), PrivacyType (copy), ThumbForUniverseIdModule (copy), FFlagBuildWithGroupsModule (copy)
	local LatestSessionByUniverseId = buildLatestSessionByUniverseId(Entries)
	local List = {}
	
	for _, value in Current do
		if not value.isArchived then
			local Id = value.id
			local LatestSessionByUniverseIdEntry = LatestSessionByUniverseId[Id]
			local Name = value.name
			local config = {
				sessionId = if LatestSessionByUniverseIdEntry then LatestSessionByUniverseIdEntry.sessionId else nil,
				universeId = Id,
				placeId = value.rootPlaceId,
				experienceName = if typeof(Name) == "string" and Name ~= "" then Name else Callback(Id),
				creatorName = if typeof(value.creatorName) == "string" and value.creatorName ~= "" then value.creatorName else nil
			}
			local Description = nil
			
			if LatestSessionByUniverseIdEntry then
				local Roblox = LatestSessionByUniverseIdEntry._meta and LatestSessionByUniverseIdEntry._meta._roblox
				local SessionStatus = if Roblox then Roblox.sessionStatus else nil
				Description = if SessionStatus == nil then nil else p7[SessionStatus]
			else
				Description = nil
			end
			config.description = Description
			config.visibilityLabel = if UniverseConfigurationModule.getPrivacyTypeForAudiences(value.audiences) == PrivacyType.Public then p8.live else nil
			config.gameIcon = ThumbForUniverseIdModule(Id)
			config.isGroupGame = if FFlagBuildWithGroupsModule then value.creatorType == "Group" else nil
			table.insert(List, config)
		end
	end
	return List
end

local function useUniverseSearchList(SearchStore, CreatorTargetId, Query, IsIsFocused, p9, UseMemoResult, UseMemoResult1, UseResult, p10, p11)
	-- upvalues: ReactModule (copy), FFlagBuildWithGroupsModule (copy), keyForCreators (copy), PageSize (copy), SignalsModule (copy), t1 (copy), UseSignalStateFunction (copy), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), useUniverseSessions (copy), PromiseModule (copy), ignorePromiseRejection (copy), buildUniverseItems (copy)
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(Query)
	UseRefResult1.current = Query
	local Creators = if FFlagBuildWithGroupsModule then p11.creators else nil
	local KeyForCreatorsResult = if FFlagBuildWithGroupsModule then keyForCreators(Creators) else nil
	local UseRefResult2 = if FFlagBuildWithGroupsModule then ReactModule.useRef(Creators) else nil
	
	if FFlagBuildWithGroupsModule then
		UseRefResult2.current = Creators
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState({
		query = Query,
		pageIndexes = { 0 },
		creators = Creators,
		cursors = if FFlagBuildWithGroupsModule then {} else nil
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: FFlagBuildWithGroupsModule (upval), UseStateResult (copy), PageSize (upval), SearchStore (copy), CreatorTargetId (copy)
		local List = {}
		
		if FFlagBuildWithGroupsModule then
			local Creators = UseStateResult.creators
			
			if Creators ~= nil then
				local Cursors = UseStateResult.cursors or {}
				for _, pageIndex in UseStateResult.pageIndexes do
					local Query = UseStateResult.query
					table.insert(List, (SearchStore.getSearch({
						surface = "Build",
						isArchived = false,
						isTeamCreateEnabled = true,
						sortParam = "LastUpdated",
						sortOrder = "Desc",
						needsAssetOptions = true,
						creators = Creators,
						pageSize = PageSize,
						cursor = Cursors[pageIndex],
						search = if Query == "" then nil else Query
					})))
				end
				return List
			end
		else
			for _, pageIndex1 in UseStateResult.pageIndexes do
				local Query = UseStateResult.query
				table.insert(List, (SearchStore.getSearch({
					creatorType = "User",
					surface = "CreatorHubCreations",
					isArchived = false,
					isTeamCreateEnabled = true,
					sortParam = "LastUpdated",
					sortOrder = "Desc",
					needsAssetOptions = true,
					creatorTargetId = CreatorTargetId,
					pageIndex = pageIndex1,
					pageSize = PageSize,
					search = if Query == "" then nil else Query
				})))
			end
		end
		return List
	end, { UseStateResult, SearchStore, CreatorTargetId })
	local UseSignalStateResult = UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseMemoResult2 (copy), t1 (upval), FFlagBuildWithGroupsModule (upval), UseStateResult (copy), PageSize (upval)
		return SignalsModule.createComputed(function(p12)
			-- upvalues: UseMemoResult2 (upval), t1 (upval), FFlagBuildWithGroupsModule (upval), UseStateResult (upval), PageSize (upval)
			local Items = {}
			local t = {}
			local v3 = nil
			local TotalResults = nil
			local Total = 0
			local Count = 0
			local StatusResult = "NotReady"
			local Status = "NotReady"
			
			for i, value in UseMemoResult2 do
				local DataResult = value.data(p12)
				StatusResult = value.status(p12)
				
				if i == 1 then
					Status = StatusResult
				end
				if DataResult ~= nil then
					v3 = DataResult
					TotalResults = DataResult.totalResults or (DataResult.totalHits or TotalResults)
					local Data = DataResult.data or t1
					Total += #Data
					Count = 0
					
					for _, entry in Data do
						if not t[entry.id] then
							t[entry.id] = true
							Count += 1
							table.insert(Items, entry)
						end
					end
				end
			end
			local Value: number? = nil
			local NextCursor = nil
			local PageIndex = nil
			
			if FFlagBuildWithGroupsModule then
				if StatusResult == "Ready" and v3 ~= nil then
					local NextCursor1 = v3.nextCursor
					
					if NextCursor1 ~= nil and NextCursor1 ~= "" and Count > 0 then
						local Cursors = UseStateResult.cursors
						local Flag = nil
						
						if Cursors == nil then
							Flag = false
						else
							Flag = false
							
							for _, cursor in Cursors do
								if cursor == NextCursor1 then
									Flag = true
									break
								end
							end
						end
						if not Flag then
							Value = #UseStateResult.pageIndexes
							NextCursor = NextCursor1
						end
					end
				elseif StatusResult == "Failed" and #UseMemoResult2 > 1 then
					PageIndex = UseStateResult.pageIndexes[#UseStateResult.pageIndexes]
				end
			elseif StatusResult == "Ready" and v3 ~= nil then
				local NextResultIndex = v3.nextResultIndex
				
				if NextResultIndex == nil then
					if TotalResults ~= nil and Total < TotalResults then
						Value = UseStateResult.pageIndexes[#UseStateResult.pageIndexes] + 1
					end
				else
					Value = NextResultIndex / PageSize
				end
				if Value ~= nil and (Value < 0 or table.find(UseStateResult.pageIndexes, Value)) then
					Value = nil
				end
			elseif StatusResult == "Failed" and #UseMemoResult2 > 1 then
				PageIndex = UseStateResult.pageIndexes[#UseStateResult.pageIndexes]
			end
			return {
				items = Items,
				status = Status,
				nextPageIndex = Value,
				nextCursor = NextCursor,
				failedPageIndex = PageIndex,
				isLoadingMore = #UseMemoResult2 > 1 and StatusResult == "NotReady"
			}
		end)
	end, {
		UseStateResult.pageIndexes,
		UseStateResult.cursors,
		UseMemoResult2
	})))
	local UseUniverseSessionsResult = if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then useUniverseSessions(p10, UseSignalStateResult.items) else nil
	local UseResult1 = ReactModule.useCallback(function(p13, PageIndex, p14, Cursor, Creators)
		-- upvalues: FFlagBuildWithGroupsModule (upval), keyForCreators (upval), UseRefResult (copy), PageSize (upval), CreatorTargetId (copy), SearchStore (copy)
		local Text: string = if FFlagBuildWithGroupsModule then `{PageIndex}\0{p13}\0{Cursor or ""}\0{keyForCreators(Creators) or ""}` else `{PageIndex}\0{p13}`
		
		if p14 then
			UseRefResult.current[Text] = nil
		end
		local CurrentEntry = UseRefResult.current[Text]
		
		if CurrentEntry == nil then
			local CurrentEntry1 = nil
			CurrentEntry1 = SearchStore.refreshSearch(if FFlagBuildWithGroupsModule then {
				surface = "Build",
				isArchived = false,
				isTeamCreateEnabled = true,
				sortParam = "LastUpdated",
				sortOrder = "Desc",
				needsAssetOptions = true,
				creators = Creators,
				pageSize = PageSize,
				cursor = Cursor,
				search = if p13 == "" then nil else p13
			} else {
				creatorType = "User",
				surface = "CreatorHubCreations",
				isArchived = false,
				isTeamCreateEnabled = true,
				sortParam = "LastUpdated",
				sortOrder = "Desc",
				needsAssetOptions = true,
				creatorTargetId = CreatorTargetId,
				pageIndex = PageIndex,
				pageSize = PageSize,
				search = if p13 == "" then nil else p13
			}):finally(function()
				-- upvalues: UseRefResult (upval), Text (copy), CurrentEntry1 (ref)
				if UseRefResult.current[Text] == CurrentEntry1 then
					UseRefResult.current[Text] = nil
				end
			end)
			UseRefResult.current[Text] = CurrentEntry1
			
			return CurrentEntry1
		else
			return CurrentEntry
		end
	end, { SearchStore, CreatorTargetId })
	local UseResult2 = ReactModule.useCallback(function(p13)
		-- upvalues: UseRefResult1 (copy), FFlagBuildWithGroupsModule (upval), UseRefResult2 (copy), UseStateResult2 (copy), PromiseModule (upval), UseResult1 (copy)
		local P51 = p13 or UseRefResult1.current
		
		if FFlagBuildWithGroupsModule then
			local Current = UseRefResult2.current
			UseStateResult2({
				query = P51,
				pageIndexes = { 0 },
				creators = Current,
				cursors = {}
			})
			
			return if Current == nil then PromiseModule.resolve() else UseResult1(P51, 0, nil, nil, Current)
		else
			UseStateResult2({ query = P51, pageIndexes = { 0 } })
			
			return UseResult1(P51, 0)
		end
	end, { UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: IsIsFocused (copy), FFlagBuildWithGroupsModule (upval), keyForCreators (upval), UseStateResult (copy), KeyForCreatorsResult (copy), Query (copy), UseResult2 (copy), ignorePromiseRejection (upval)
		if not IsIsFocused then return end
		local IsNotKeyForCreatorsResultMatch: boolean = FFlagBuildWithGroupsModule and keyForCreators(UseStateResult.creators) ~= KeyForCreatorsResult
		
		if UseStateResult.query ~= Query or IsNotKeyForCreatorsResultMatch then
			UseResult2(Query):catch(ignorePromiseRejection)
		end
	end, {
		KeyForCreatorsResult, Query, IsIsFocused, UseResult2, UseStateResult.creators,
		UseStateResult.query
	})
	
	return {
		items = ReactModule.useMemo(function()
			-- upvalues: buildUniverseItems (upval), UseSignalStateResult (copy), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (upval), UseUniverseSessionsResult (copy), p9 (copy), UseMemoResult (copy), UseMemoResult1 (copy), UseResult (copy)
			return (buildUniverseItems(UseSignalStateResult.items, if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then UseUniverseSessionsResult.entries else p9, UseMemoResult, UseMemoResult1, UseResult))
		end, {
			UseMemoResult,
			UseSignalStateResult.items,
			if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then UseUniverseSessionsResult.entries else p9,
			UseMemoResult1,
			UseResult
		}),
		status = if FFlagBuildWithGroupsModule and p11.creators == nil then p11.status else UseSignalStateResult.status,
		sourceItemCount = #UseSignalStateResult.items,
		failedLoadMore = UseSignalStateResult.failedPageIndex ~= nil,
		isLoadingMore = UseSignalStateResult.isLoadingMore,
		query = UseStateResult.query,
		refresh = UseResult2,
		refreshSessions = if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then UseUniverseSessionsResult.refresh else nil,
		loadMore = ReactModule.useCallback(function()
			-- upvalues: UseSignalStateResult (copy), UseStateResult (copy), UseRefResult1 (copy), FFlagBuildWithGroupsModule (upval), keyForCreators (upval), UseRefResult2 (copy), UseStateResult2 (copy), UseResult1 (copy), ignorePromiseRejection (upval)
			local FailedPageIndex = UseSignalStateResult.failedPageIndex or UseSignalStateResult.nextPageIndex
			local Query = UseStateResult.query
			
			if UseSignalStateResult.isLoadingMore or FailedPageIndex == nil or UseRefResult1.current ~= Query then return end
			if FFlagBuildWithGroupsModule then
				local Creators = UseStateResult.creators
				
				if Creators == nil or keyForCreators(Creators) ~= keyForCreators(UseRefResult2.current) then return end
				local HasFailedPageIndex = UseSignalStateResult.failedPageIndex ~= nil
				local Cursor = if HasFailedPageIndex then (UseStateResult.cursors or {})[FailedPageIndex] else UseSignalStateResult.nextCursor
				
				if not HasFailedPageIndex then
					UseStateResult2(function(p13)
						-- upvalues: Query (copy), Creators (copy), FailedPageIndex (copy), Cursor (copy)
						if p13.query == Query and p13.creators == Creators and not table.find(p13.pageIndexes, FailedPageIndex) then
							local Copy = table.clone(p13.pageIndexes)
							table.insert(Copy, FailedPageIndex)
							local Copy1 = table.clone(p13.cursors or {})
							Copy1[FailedPageIndex] = Cursor
							
							return {
								query = p13.query,
								pageIndexes = Copy,
								creators = p13.creators,
								cursors = Copy1
							}
						else
							return p13
						end
					end)
				end
				UseResult1(Query, FailedPageIndex, HasFailedPageIndex, Cursor, Creators):catch(ignorePromiseRejection)
				
				return
			else
				if UseSignalStateResult.failedPageIndex == nil then
					UseStateResult2(function(p13)
						-- upvalues: Query (copy), FailedPageIndex (copy)
						if p13.query == Query and not table.find(p13.pageIndexes, FailedPageIndex) then
							local Copy = table.clone(p13.pageIndexes)
							table.insert(Copy, FailedPageIndex)
							
							return { query = p13.query, pageIndexes = Copy }
						else
							return p13
						end
					end)
				end
				UseResult1(Query, FailedPageIndex, UseSignalStateResult.failedPageIndex ~= nil):catch(ignorePromiseRejection)
			end
		end, {
			UseSignalStateResult,
			UseResult1,
			UseStateResult.creators,
			UseStateResult.cursors,
			UseStateResult.query
		})
	}
end

local function useUniverseListItems(Current, p13, p14, p15, p16, p17)
	-- upvalues: FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), useUniverseSessions (copy), ReactModule (copy), buildUniverseItems (copy)
	local UseUniverseSessionsResult = if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then useUniverseSessions(p17, Current) else nil
	local Entries = if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then UseUniverseSessionsResult.entries else p13
	
	return {
		items = ReactModule.useMemo(function()
			-- upvalues: buildUniverseItems (upval), Current (copy), Entries (copy), p14 (copy), p15 (copy), p16 (copy)
			return (buildUniverseItems(Current, Entries, p14, p15, p16))
		end, {
			p14,
			Entries,
			Current,
			p15,
			p16
		}),
		refreshSessions = if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then UseUniverseSessionsResult.refresh else nil
	}
end

local function useCreatorSearchList(SearchStore, Current, IsIsFocused, p13, UseMemoResult, UseMemoResult1, UseResult, p14, p15)
	-- upvalues: keyForCreators (copy), ReactModule (copy), PageSize (copy), UseCursorSearchPagesModule (copy), useUniverseListItems (copy)
	local Creators = p15.creators
	local KeyForCreatorsResult = keyForCreators(Creators)
	local UseRefResult = ReactModule.useRef(Current)
	
	if IsIsFocused then
		UseRefResult.current = Current
	end
	local Current1 = UseRefResult.current
	local UseCursorSearchPagesModuleResult = UseCursorSearchPagesModule({
		searchStore = SearchStore,
		sources = ReactModule.useMemo(function()
			-- upvalues: Creators (copy), Current1 (copy), KeyForCreatorsResult (copy), PageSize (upval)
			return if Creators == nil then nil else {
				{
					key = `{Current1}\0{KeyForCreatorsResult}`,
					params = {
						surface = "Build",
						isArchived = false,
						isTeamCreateEnabled = true,
						sortParam = "LastUpdated",
						sortOrder = "Desc",
						cursor = nil,
						needsAssetOptions = true,
						creators = Creators,
						pageSize = PageSize,
						search = if Current1 == "" then nil else Current1
					}
				}
			}
		end, { Current1, Creators, KeyForCreatorsResult })
	})
	local UseUniverseListItemsResult = useUniverseListItems(UseCursorSearchPagesModuleResult.items, p13, UseMemoResult, UseMemoResult1, UseResult, p14)
	
	return {
		items = UseUniverseListItemsResult.items,
		status = if Creators == nil then p15.status else UseCursorSearchPagesModuleResult.status,
		sourceItemCount = #UseCursorSearchPagesModuleResult.items,
		failedLoadMore = UseCursorSearchPagesModuleResult.failedLoadMore,
		isLoadingMore = UseCursorSearchPagesModuleResult.isLoadingMore,
		query = Current1,
		refresh = UseCursorSearchPagesModuleResult.refresh,
		refreshSessions = UseUniverseListItemsResult.refreshSessions,
		loadMore = UseCursorSearchPagesModuleResult.loadMore
	}
end

local function useBuildCreators(CreatorGroupsStore, CreatorTargetId, Filter)
	-- upvalues: ReactModule (copy), UseSignalStateFunction (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CreatorGroupsStore (copy)
		return (CreatorGroupsStore.getAndFetchGroups("Build"))
	end, { CreatorGroupsStore })
	local UseSignalStateResult = UseSignalStateFunction(UseMemoResult.data)
	local UseSignalStateResult1 = UseSignalStateFunction(UseMemoResult.status)
	local Games = Filter.games
	local GroupId = Filter.groupId
	
	return ReactModule.useMemo(function()
		-- upvalues: CreatorTargetId (copy), Games (copy), UseSignalStateResult (copy), UseSignalStateResult1 (copy), GroupId (copy)
		local config = { creatorType = "User", creatorTargetId = CreatorTargetId }
		
		if Games == "MyGames" then
			return { status = "Ready", creators = { config } }
		end
		if Games == "SharedGames" then
			return {
				status = "Ready",
				creators = {
					{ creatorType = "Team", creatorTargetId = CreatorTargetId }
				}
			}
		end
		if UseSignalStateResult == nil then
			return {
				creators = nil,
				status = if UseSignalStateResult1 == "Failed" then "Failed" else "NotReady"
			}
		end
		if Games == "GroupGames" and GroupId ~= nil then
			for _, group in UseSignalStateResult.groups do
				if group.id == GroupId then
					return {
						status = "Ready",
						creators = { { creatorType = "Group", creatorTargetId = group.id } }
					}
				end
			end
		end
		if Games == "GroupGames" and #UseSignalStateResult.groups == 0 then
			return { creators = nil, status = "Ready" }
		end
		local T = if Games == "GroupGames" then {} else { config }
		for _, group1 in UseSignalStateResult.groups do
			table.insert(T, { creatorType = "Group", creatorTargetId = group1.id })
		end
		return { status = "Ready", creators = T }
	end, {
		Games,
		GroupId,
		UseSignalStateResult,
		UseSignalStateResult1,
		CreatorTargetId
	})
end

local function useLegacySessionList(p13, ConfigurationStore, UniverseActivationStore, UseDebouncedQueryResult, UseMemoResult, UseMemoResult1, UseResult)
	-- upvalues: ReactModule (copy), SignalsModule (copy), UseSignalStateFunction (copy), PrivacyType (copy), ContentMaturityUtilsModule (copy), t (copy), buildExperienceMetadataByUniverseId (copy), buildSessionItems (copy), MatchesSearchQueryModule (copy)
	local UseSignalStateResult = UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), p13 (copy), ConfigurationStore (copy)
		return SignalsModule.createComputed(function(p14)
			-- upvalues: p13 (upval), ConfigurationStore (upval)
			local DataResults = {}
			local t = {}
			
			for _, value in p13 do
				local Roblox = value._meta and value._meta._roblox
				local v4 = nil
				
				if Roblox == nil then
					v4 = nil
				else
					local UniverseId = Roblox.universeId
					v4 = if typeof(UniverseId) == "number" and UniverseId ~= 0 then UniverseId else nil
				end
				local v5 = v4 == nil or t[v4]
				local DataResult = nil
				
				if not v5 then
					t[v4] = true
					DataResult = ConfigurationStore.getAndFetchSummary(v4).data(p14)
					v5 = DataResult == nil
				end
				if not v5 then
					DataResults[v4] = DataResult
				end
			end
			return DataResults
		end)
	end, { ConfigurationStore, p13 })))
	local UseSignalStateResult1 = UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UniverseActivationStore (copy), UseSignalStateResult (copy), PrivacyType (upval), ContentMaturityUtilsModule (upval), t (upval)
		return SignalsModule.createComputed(function(p14)
			-- upvalues: UniverseActivationStore (upval), UseSignalStateResult (upval), PrivacyType (upval), ContentMaturityUtilsModule (upval), t (upval)
			local t2 = {}
			
			if UniverseActivationStore ~= nil then
				for i, value in UseSignalStateResult do
					if value.isActive == true and value.privacyType == PrivacyType.Public and UniverseActivationStore.getAndFetchEligibility(i).data(p14) ~= nil then
						t2[i] = ContentMaturityUtilsModule.isSealBroken(i) and ContentMaturityUtilsModule.isContentUnrated(i)
					end
				end
			end
			return if next(t2) == nil then t else t2
		end)
	end, { UniverseActivationStore, UseSignalStateResult })))
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: buildExperienceMetadataByUniverseId (upval), UseSignalStateResult (copy), UseSignalStateResult1 (copy), UseMemoResult1 (copy)
		return (buildExperienceMetadataByUniverseId(UseSignalStateResult, UseSignalStateResult1, UseMemoResult1))
	end, {
		UseSignalStateResult1,
		UseSignalStateResult,
		UseMemoResult1
	})
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: buildSessionItems (upval), p13 (copy), UseMemoResult2 (copy), UseMemoResult (copy), UseMemoResult1 (copy), UseResult (copy), UseSignalStateResult (copy)
		local List = {}
		
		for _, value in buildSessionItems(p13, UseMemoResult2, UseMemoResult, UseMemoResult1, UseResult) do
			local UseSignalStateResultEntry = UseSignalStateResult[value.universeId]
			
			if UseSignalStateResultEntry ~= nil and not UseSignalStateResultEntry.isArchived then
				table.insert(List, value)
			end
		end
		return List
	end, {
		UseMemoResult, UseMemoResult2, p13, UseSignalStateResult, UseMemoResult1,
		UseResult
	})
	
	return {
		displayedItems = UseMemoResult3,
		joinableItems = ReactModule.useMemo(function()
			-- upvalues: UseDebouncedQueryResult (copy), UseMemoResult3 (copy), MatchesSearchQueryModule (upval)
			if UseDebouncedQueryResult == "" then
				return UseMemoResult3
			end
			local List = {}
			
			for _, value in UseMemoResult3 do
				if MatchesSearchQueryModule(value.experienceName, UseDebouncedQueryResult) then
					table.insert(List, value)
				end
			end
			return List
		end, { UseDebouncedQueryResult, UseMemoResult3 }),
		hasPendingSummary = ReactModule.useMemo(function(): boolean
			-- upvalues: p13 (copy), UseSignalStateResult (copy)
			local t = {}
			
			for _, value in p13 do
				local Roblox = value._meta and value._meta._roblox
				local v4 = nil
				
				if Roblox == nil then
					v4 = nil
				else
					local UniverseId = Roblox.universeId
					v4 = if typeof(UniverseId) == "number" and UniverseId ~= 0 then UniverseId else nil
				end
				if v4 ~= nil and not t[v4] then
					t[v4] = true
					
					if UseSignalStateResult[v4] == nil then
						return true
					end
				end
			end
			return false
		end, { p13, UseSignalStateResult })
	}
end

return function(p14)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), LocalizationRoactContext (copy), LocalizationModule (copy), CreatorAgentChatModule (copy), FFlagBuildExperienceMyCreationsUseUniverseListModule (copy), UniverseSearchModule (copy), UniverseActivationModule (copy), UniverseConfigurationModule (copy), GetSearchQueryStoreModule (copy), GetBuildExperienceRefreshStoreModule (copy), AppLifecycleObserverService (copy), UseSignalStateFunction (copy), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), Players (copy), FFlagBuildWithGroupsModule (copy), CreatorGroupsModule (copy), useBuildCreators (copy), config (copy), FFlagBuildExperienceCursorSearchPagesModule (copy), useCreatorSearchList (copy), useUniverseSearchList (copy), useLegacySessionList (copy), PromiseModule (copy), ignorePromiseRejection (copy), SignalsModule (copy), FIntMyCreationsSessionListPollingIntervalSecondsModule (copy), requestHandleToPromise (copy), noOp (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		building = LocalizationStringsModule.MY_CREATIONS_BUILDING,
		inputNeeded = LocalizationStringsModule.MY_CREATIONS_INPUT_NEEDED,
		loadError = LocalizationStringsModule.MY_CREATIONS_LOAD_ERROR,
		live = LocalizationStringsModule.MY_CREATIONS_LIVE,
		private = LocalizationStringsModule.MY_CREATIONS_PRIVATE,
		public = LocalizationStringsModule.MY_CREATIONS_PUBLIC,
		publiclyUnavailable = LocalizationStringsModule.MY_CREATIONS_PUBLICLY_UNAVAILABLE,
		ready = LocalizationStringsModule.MY_CREATIONS_READY,
		restricted = LocalizationStringsModule.MY_CREATIONS_RESTRICTED
	})
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	local UseResult = ReactModule.useCallback(function(p15)
		-- upvalues: UseContextResult (copy), LocalizationStringsModule (upval)
		return UseContextResult:Format(LocalizationStringsModule.MY_CREATIONS_UNIVERSE_NAME, { UNIVERSE_ID = p15 })
	end, {
		UseContextResult,
		UseLocalizationResult[LocalizationModule.RobloxLocaleIdKey]
	})
	local LoadError = UseLocalizationResult.loadError
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseLocalizationResult (copy)
		return {
			waiting_on_client = UseLocalizationResult.inputNeeded,
			idle = UseLocalizationResult.ready,
			working = UseLocalizationResult.building
		}
	end, {
		UseLocalizationResult.inputNeeded,
		UseLocalizationResult.ready,
		UseLocalizationResult.building
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseLocalizationResult (copy)
		return {
			live = UseLocalizationResult.live,
			private = UseLocalizationResult.private,
			public = UseLocalizationResult.public,
			publiclyUnavailable = UseLocalizationResult.publiclyUnavailable,
			restricted = UseLocalizationResult.restricted
		}
	end, {
		UseLocalizationResult.live,
		UseLocalizationResult.private,
		UseLocalizationResult.public,
		UseLocalizationResult.publiclyUnavailable,
		UseLocalizationResult.restricted
	})
	local CreatorAgentChatStore = p14.creatorAgentChatStore or CreatorAgentChatModule.getCreatorAgentChatStore()
	local SearchStore = p14.searchStore
	
	if FFlagBuildExperienceMyCreationsUseUniverseListModule and SearchStore == nil then
		SearchStore = UniverseSearchModule.getUniverseSearchStore()
	end
	local UniverseActivationStore = if FFlagBuildExperienceMyCreationsUseUniverseListModule then nil else UniverseActivationModule.getUniverseActivationStore()
	local ConfigurationStore = if FFlagBuildExperienceMyCreationsUseUniverseListModule then nil else p14.configurationStore or UniverseConfigurationModule.getUniverseConfigurationStore()
	local SearchQueryStore = p14.searchQueryStore or GetSearchQueryStoreModule()
	local BuildExperienceRefreshStoreModule = GetBuildExperienceRefreshStoreModule()
	local AppLifecycleObserverService1 = p14.appLifecycleObserverService or AppLifecycleObserverService
	local IsIsFocused = p14.isFocused ~= false
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseDebouncedQueryResult = SearchQueryStore.useDebouncedQuery()
	local UseSignalStateResult = UseSignalStateFunction(BuildExperienceRefreshStoreModule.getRefreshTick)
	local UseRefResult = if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then ReactModule.useRef(UseSignalStateResult) else nil
	local UseRefResult1 = if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then ReactModule.useRef(IsIsFocused) else nil
	local SessionListStore = CreatorAgentChatStore.getSessionListStore()
	local UseSignalStateResult1 = UseSignalStateFunction(SessionListStore.getSessions)
	local UseSignalStateResult2 = UseSignalStateFunction(SessionListStore.getNextPageToken)
	local UseSignalStateResult3 = UseSignalStateFunction(SessionListStore.getStatus)
	local UseSignalStateResult4 = UseSignalStateFunction(SessionListStore.getLoadMoreStatus)
	local NotReady: string = if UseSignalStateResult3 == "pending" then "NotReady" elseif UseSignalStateResult3 == "succeeded" then "Ready" else "Failed"
	local UserId = p14.userId or (if Players.LocalPlayer then Players.LocalPlayer.UserId else 0)
	local CreatorGroupsStore = if FFlagBuildWithGroupsModule then p14.creatorGroupsStore or CreatorGroupsModule.getCreatorGroupsStore() else nil
	local UseBuildCreatorsResult = if FFlagBuildWithGroupsModule then useBuildCreators(CreatorGroupsStore, UserId, p14.filter or config) else nil
	local UseCreatorSearchListResult = if FFlagBuildExperienceMyCreationsUseUniverseListModule then if FFlagBuildExperienceCursorSearchPagesModule then useCreatorSearchList(SearchStore, UseDebouncedQueryResult, IsIsFocused, UseSignalStateResult1, UseMemoResult, UseMemoResult1, UseResult, if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then CreatorAgentChatStore else nil, UseBuildCreatorsResult) else useUniverseSearchList(SearchStore, UserId, UseDebouncedQueryResult, IsIsFocused, UseSignalStateResult1, UseMemoResult, UseMemoResult1, UseResult, if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then CreatorAgentChatStore else nil, UseBuildCreatorsResult) else nil
	local UseLegacySessionListResult = if FFlagBuildExperienceMyCreationsUseUniverseListModule then nil else useLegacySessionList(UseSignalStateResult1, ConfigurationStore, UniverseActivationStore, UseDebouncedQueryResult, UseMemoResult, UseMemoResult1, UseResult)
	local Refresh = if FFlagBuildExperienceMyCreationsUseUniverseListModule then UseCreatorSearchListResult.refresh else nil
	local RefreshSessions = if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule and FFlagBuildExperienceMyCreationsUseUniverseListModule then UseCreatorSearchListResult.refreshSessions else nil
	local UseRefResult2 = if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then ReactModule.useRef(RefreshSessions) else nil
	
	if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
		UseRefResult2.current = RefreshSessions
	end
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: SessionListStore (copy), PromiseModule (upval), FFlagBuildWithGroupsModule (upval), CreatorGroupsStore (copy), FFlagBuildExperienceMyCreationsUseUniverseListModule (upval), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (upval), Refresh (copy), UseRefResult2 (copy), ignorePromiseRejection (upval)
		local RefreshResult = SessionListStore.refresh()
		local NewPromise = PromiseModule.new(function(Callback, Callback1)
			-- upvalues: RefreshResult (copy)
			task.spawn(function()
				-- upvalues: RefreshResult (upval), Callback (copy), Callback1 (copy)
				while RefreshResult.state(false).status == "pending" do
					task.wait()
				end
				local StateResult = RefreshResult.state(false)
				
				if StateResult.status == "succeeded" then
					Callback(StateResult.result)
					
					return
				else
					Callback1(StateResult.error)
				end
			end)
		end)
		
		if FFlagBuildWithGroupsModule then
			CreatorGroupsStore.fetchGroups("Build")
		end
		return if FFlagBuildExperienceMyCreationsUseUniverseListModule then if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then PromiseModule.all({
			Refresh(),
			NewPromise,
			UseRefResult2.current():catch(ignorePromiseRejection)
		}) else PromiseModule.all({ Refresh(), NewPromise }) else NewPromise
	end, { CreatorGroupsStore, Refresh, SessionListStore })
	ReactModule.useEffect(function()
		-- upvalues: AppLifecycleObserverService1 (copy), IsIsFocused (copy), FFlagBuildExperienceMyCreationsUseUniverseListModule (upval), Refresh (copy), ignorePromiseRejection (upval), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (upval), UseRefResult2 (copy), SessionListStore (copy)
		local OnUnhideConnection = AppLifecycleObserverService1.OnUnhide:Connect(function()
			-- upvalues: IsIsFocused (upval), FFlagBuildExperienceMyCreationsUseUniverseListModule (upval), Refresh (upval), ignorePromiseRejection (upval), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (upval), UseRefResult2 (upval), SessionListStore (upval)
			if IsIsFocused then
				if FFlagBuildExperienceMyCreationsUseUniverseListModule then
					Refresh():catch(ignorePromiseRejection)
					
					if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
						UseRefResult2.current():catch(ignorePromiseRejection)
					end
				end
				SessionListStore.refresh()
			end
		end)
		
		return function()
			-- upvalues: OnUnhideConnection (copy)
			OnUnhideConnection:Disconnect()
		end
	end, {
		AppLifecycleObserverService1,
		IsIsFocused,
		Refresh,
		SessionListStore
	})
	ReactModule.useEffect(function()
		-- upvalues: FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (upval), UseRefResult (copy), UseSignalStateResult (copy), IsIsFocused (copy), UseRefResult1 (copy), UseStateResult2 (copy), FFlagBuildExperienceMyCreationsUseUniverseListModule (upval), Refresh (copy), ignorePromiseRejection (upval), UseRefResult2 (copy), SessionListStore (copy), SignalsModule (upval)
		local IsNotCurrentMatch = false
		
		if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
			IsNotCurrentMatch = UseRefResult.current ~= UseSignalStateResult or IsIsFocused and not UseRefResult1.current
			UseRefResult.current = UseSignalStateResult
			UseRefResult1.current = IsIsFocused
		end
		if not IsIsFocused then
			UseStateResult2(false)
			
			return
		end
		UseStateResult2(false)
		
		if FFlagBuildExperienceMyCreationsUseUniverseListModule then
			Refresh():catch(ignorePromiseRejection)
			
			if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule and IsNotCurrentMatch then
				UseRefResult2.current():catch(ignorePromiseRejection)
			end
		end
		local RefreshResult = SessionListStore.refresh()
		
		return SignalsModule.createEffect(function(p15)
			-- upvalues: RefreshResult (copy), UseStateResult2 (upval)
			if RefreshResult.state(p15).status == "succeeded" then
				UseStateResult2(true)
			end
		end)
	end, {
		IsIsFocused,
		UseSignalStateResult,
		Refresh,
		SessionListStore
	})
	local Largest = math.max(0, p14.pollingIntervalSeconds or FIntMyCreationsSessionListPollingIntervalSecondsModule)
	ReactModule.useEffect(function()
		-- upvalues: IsIsFocused (copy), Largest (copy), FFlagBuildExperienceMyCreationsUseUniverseListModule (upval), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (upval), UseRefResult2 (copy), ignorePromiseRejection (upval), SessionListStore (copy)
		if not IsIsFocused or Largest == 0 then return end
		local Flag = false
		
		local function scheduleNextPoll()
			-- upvalues: Largest (upval), Flag (ref), FFlagBuildExperienceMyCreationsUseUniverseListModule (upval), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (upval), UseRefResult2 (upval), ignorePromiseRejection (upval), SessionListStore (upval), scheduleNextPoll (copy)
			task.delay(Largest, function()
				-- upvalues: Flag (upval), FFlagBuildExperienceMyCreationsUseUniverseListModule (upval), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (upval), UseRefResult2 (upval), ignorePromiseRejection (upval), SessionListStore (upval), scheduleNextPoll (upval)
				if Flag then return end
				if FFlagBuildExperienceMyCreationsUseUniverseListModule and FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
					UseRefResult2.current():catch(ignorePromiseRejection)
				end
				SessionListStore.refresh()
				scheduleNextPoll()
			end)
		end
		
		task.delay(Largest, function()
			-- upvalues: Flag (ref), FFlagBuildExperienceMyCreationsUseUniverseListModule (upval), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (upval), UseRefResult2 (upval), ignorePromiseRejection (upval), SessionListStore (upval), scheduleNextPoll (copy)
			if Flag then return end
			if FFlagBuildExperienceMyCreationsUseUniverseListModule and FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
				UseRefResult2.current():catch(ignorePromiseRejection)
			end
			SessionListStore.refresh()
			scheduleNextPoll()
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { IsIsFocused, Largest, SessionListStore })
	local Items = if FFlagBuildExperienceMyCreationsUseUniverseListModule then UseCreatorSearchListResult.items else UseLegacySessionListResult.joinableItems
	local HasPendingSummary = not FFlagBuildExperienceMyCreationsUseUniverseListModule and UseLegacySessionListResult.hasPendingSummary
	local Status = if FFlagBuildExperienceMyCreationsUseUniverseListModule then UseCreatorSearchListResult.status else NotReady
	local SourceItemCount = if FFlagBuildExperienceMyCreationsUseUniverseListModule then UseCreatorSearchListResult.sourceItemCount else #UseSignalStateResult1
	local IsReady: boolean = Status == "Ready" or SourceItemCount > 0
	local IsPending = UseSignalStateResult4 == "pending"
	local IsLoadingMore = if FFlagBuildExperienceMyCreationsUseUniverseListModule then UseCreatorSearchListResult.isLoadingMore else false
	local UseResult11 = ReactModule.useCallback(function()
		-- upvalues: SessionListStore (copy), PromiseModule (upval), requestHandleToPromise (upval)
		local More = SessionListStore.loadMore()
		
		return if More == nil then PromiseModule.resolve() else requestHandleToPromise(More)
	end, {
		IsPending,
		UseSignalStateResult2,
		NotReady,
		SessionListStore
	})
	local LoadMore = if FFlagBuildExperienceMyCreationsUseUniverseListModule then UseCreatorSearchListResult.loadMore else nil
	local Query = if FFlagBuildExperienceMyCreationsUseUniverseListModule then UseCreatorSearchListResult.query else UseDebouncedQueryResult
	
	return {
		displayedItems = if FFlagBuildExperienceMyCreationsUseUniverseListModule then UseCreatorSearchListResult.items else UseLegacySessionListResult.displayedItems,
		items = Items,
		listStatus = Status,
		hasDisplayedResult = IsReady,
		hasPendingSummary = HasPendingSummary,
		isSettledNoResults = Query == UseDebouncedQueryResult and (IsReady and (not HasPendingSummary and #Items == 0)),
		query = Query,
		sourceItemCount = SourceItemCount,
		sessionCount = #UseSignalStateResult1,
		sessionListStatus = NotReady,
		hasCompletedFocusedRefresh = UseStateResult,
		loadError = LoadError,
		refresh = UseResult1,
		loadMoreIfNeeded = ReactModule.useCallback(function(ScrollFrame)
			-- upvalues: FFlagBuildExperienceMyCreationsUseUniverseListModule (upval), LoadMore (copy), UseSignalStateResult2 (copy), IsPending (copy), NotReady (copy), UseResult11 (copy)
			local Y: number = ScrollFrame.AbsoluteCanvasSize.Y
			
			if ScrollFrame.CanvasPosition.Y <= 0 or Y <= 0 or ScrollFrame.AbsoluteWindowSize.Y <= 0 then return end
			if math.max(0, Y - ScrollFrame.AbsoluteWindowSize.Y - 250) < ScrollFrame.CanvasPosition.Y then
				if FFlagBuildExperienceMyCreationsUseUniverseListModule then
					LoadMore()
					
					if UseSignalStateResult2 ~= nil and not IsPending and NotReady == "Ready" then
						UseResult11()
						
						return
					end
				elseif UseSignalStateResult2 ~= nil and not IsPending and NotReady == "Ready" then
					UseResult11()
				end
			end
		end, {
			IsPending,
			UseResult11,
			LoadMore,
			UseSignalStateResult2,
			NotReady
		}),
		failedLoadMore = if FFlagBuildExperienceMyCreationsUseUniverseListModule then UseCreatorSearchListResult.failedLoadMore else false,
		retryLoadMore = if FFlagBuildExperienceMyCreationsUseUniverseListModule then LoadMore else noOp,
		isLoadingMore = if FFlagBuildExperienceMyCreationsUseUniverseListModule then IsLoadingMore else IsPending
	}
end