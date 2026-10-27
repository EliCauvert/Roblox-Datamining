local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local Players = game:GetService("Players")
local FIntMyCreationsSessionListPollingIntervalSecondsModule = require(BuildExperience.Flags.FIntMyCreationsSessionListPollingIntervalSeconds)
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
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local UniverseSearchModule = require(Parent.DataHydration.UniverseSearch)
local PrivacyType = UniverseConfigurationModule.PrivacyType
local ThumbForUniverseIdModule = require(BuildExperience.utils.thumbForUniverseId)
local UseCursorSearchPagesModule = require(BuildExperience.utils.useCursorSearchPages)
local GetBuildExperienceRefreshStoreModule = require(BuildExperience.Stores.GetBuildExperienceRefreshStore)
local _ = require(BuildExperience.Stores.GetMyCreationsFilterStore)
local GetSearchQueryStoreModule = require(BuildExperience.Stores.GetSearchQueryStore)
local _ = require(BuildExperience.Stores.GetSearchQueryStore.createSearchQueryStore)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local PageSize: number = if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then 15 else 50
local t = {}
local config = { games = "All" }

local function _(p1, p2)
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

local _ = function(p2)
	local Roblox = p2._meta and p2._meta._roblox
	
	if Roblox == nil then
		return nil
	else
		local UniverseId = Roblox.universeId
		
		return if typeof(UniverseId) == "number" and UniverseId ~= 0 then UniverseId else nil
	end
end

local function buildLatestSessionByUniverseId(List)
	local t = {}
	
	for _, value in List do
		local Roblox = value._meta and value._meta._roblox
		local v1 = nil
		
		if Roblox == nil then
			v1 = nil
		else
			local UniverseId = Roblox.universeId
			v1 = if typeof(UniverseId) == "number" and UniverseId ~= 0 then UniverseId else nil
		end
		if v1 ~= nil and t[v1] == nil then
			t[v1] = value
		end
	end
	return t
end

local function useUniverseSessions(p2, Current)
	-- upvalues: ReactModule (copy), PromiseModule (copy), ignorePromiseRejection (copy), SignalsModule (copy), UseSignalStateFunction (copy)
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
	local UseResult = ReactModule.useCallback(function(p3)
		-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy), UseRefResult (copy), p2 (copy), PromiseModule (upval), UseRefResult3 (copy), UseStateResult2 (copy)
		local List = {}
		
		for _, value in UseRefResult2.current do
			if not value.isArchived then
				local Id = value.id
				local CurrentEntry = UseRefResult1.current[Id]
				
				if CurrentEntry ~= nil then
					table.insert(List, CurrentEntry.promise)
				elseif p3 or UseRefResult.current[Id] == nil then
					local SessionFindByUniverseResult = p2.sessionFindByUniverse({
						sort = "desc",
						application = "build",
						filterByPinForBuild = true,
						universeId = Id
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
					end, function(p4)
						-- upvalues: UseRefResult1 (upval), Id (copy), SessionFindByUniverseResult (copy), PromiseModule (upval)
						local CurrentEntry = UseRefResult1.current[Id]
						
						if CurrentEntry ~= nil and CurrentEntry.handle == SessionFindByUniverseResult then
							UseRefResult1.current[Id] = nil
						end
						return PromiseModule.reject(p4)
					end)
					config.promise = Promise
					table.insert(List, Promise)
				end
			end
		end
		return PromiseModule.all(List)
	end, { p2 })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy), ignorePromiseRejection (upval)
		UseResult(false):catch(ignorePromiseRejection)
	end, { Current, UseResult })
	
	return {
		entries = UseSignalStateFunction((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), Current (copy), UseStateResult (copy)
			return SignalsModule.createComputed(function(p4)
				-- upvalues: Current (upval), UseStateResult (upval)
				local List = {}
				
				for _, value in Current do
					local UseStateResultEntry = UseStateResult[value.id]
					local StateResult = if UseStateResultEntry == nil then nil else UseStateResultEntry.state(p4)
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

local function buildUniverseItems(Current, Entries, p4, p5, Callback)
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
				Description = if SessionStatus == nil then nil else p4[SessionStatus]
			else
				Description = nil
			end
			config.description = Description
			config.visibilityLabel = if UniverseConfigurationModule.getPrivacyTypeForAudiences(value.audiences) == PrivacyType.Public then p5.live else nil
			config.gameIcon = ThumbForUniverseIdModule(Id)
			config.isGroupGame = if FFlagBuildWithGroupsModule then value.creatorType == "Group" else nil
			table.insert(List, config)
		end
	end
	return List
end

local function useUniverseSearchList(SearchStore, CreatorTargetId, Query, IsIsFocused, p6, UseMemoResult, UseMemoResult1, UseResult, p7, p8)
	-- upvalues: ReactModule (copy), FFlagBuildWithGroupsModule (copy), keyForCreators (copy), PageSize (copy), SignalsModule (copy), t (copy), UseSignalStateFunction (copy), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), useUniverseSessions (copy), PromiseModule (copy), ignorePromiseRejection (copy), buildUniverseItems (copy)
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(Query)
	UseRefResult1.current = Query
	local Creators = if FFlagBuildWithGroupsModule then p8.creators else nil
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
		-- upvalues: SignalsModule (upval), UseMemoResult2 (copy), t (upval), FFlagBuildWithGroupsModule (upval), UseStateResult (copy), PageSize (upval)
		return SignalsModule.createComputed(function(p9)
			-- upvalues: UseMemoResult2 (upval), t (upval), FFlagBuildWithGroupsModule (upval), UseStateResult (upval), PageSize (upval)
			local Items = {}
			local t1 = {}
			local v2 = nil
			local TotalResults = nil
			local Total = 0
			local Count = 0
			local StatusResult = "NotReady"
			local Status = "NotReady"
			
			for i, value in UseMemoResult2 do
				local DataResult = value.data(p9)
				StatusResult = value.status(p9)
				
				if i == 1 then
					Status = StatusResult
				end
				if DataResult ~= nil then
					v2 = DataResult
					TotalResults = DataResult.totalResults or (DataResult.totalHits or TotalResults)
					local Data = DataResult.data or t
					Total += #Data
					Count = 0
					
					for _, entry in Data do
						if not t1[entry.id] then
							t1[entry.id] = true
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
				if StatusResult == "Ready" and v2 ~= nil then
					local NextCursor1 = v2.nextCursor
					
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
			elseif StatusResult == "Ready" and v2 ~= nil then
				local NextResultIndex = v2.nextResultIndex
				
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
	local UseUniverseSessionsResult = if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then useUniverseSessions(p7, UseSignalStateResult.items) else nil
	local UseResult1 = ReactModule.useCallback(function(p10, PageIndex, p11, Cursor, Creators)
		-- upvalues: FFlagBuildWithGroupsModule (upval), keyForCreators (upval), UseRefResult (copy), PageSize (upval), CreatorTargetId (copy), SearchStore (copy)
		local Text: string = if FFlagBuildWithGroupsModule then `{PageIndex}\0{p10}\0{Cursor or ""}\0{keyForCreators(Creators) or ""}` else `{PageIndex}\0{p10}`
		
		if p11 then
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
				search = if p10 == "" then nil else p10
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
				search = if p10 == "" then nil else p10
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
	local UseResult2 = ReactModule.useCallback(function(p10)
		-- upvalues: UseRefResult1 (copy), FFlagBuildWithGroupsModule (upval), UseRefResult2 (copy), UseStateResult2 (copy), PromiseModule (upval), UseResult1 (copy)
		local P41 = p10 or UseRefResult1.current
		
		if FFlagBuildWithGroupsModule then
			local Current = UseRefResult2.current
			UseStateResult2({
				query = P41,
				pageIndexes = { 0 },
				creators = Current,
				cursors = {}
			})
			
			return if Current == nil then PromiseModule.resolve() else UseResult1(P41, 0, nil, nil, Current)
		else
			UseStateResult2({ query = P41, pageIndexes = { 0 } })
			
			return UseResult1(P41, 0)
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
			-- upvalues: buildUniverseItems (upval), UseSignalStateResult (copy), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (upval), UseUniverseSessionsResult (copy), p6 (copy), UseMemoResult (copy), UseMemoResult1 (copy), UseResult (copy)
			return (buildUniverseItems(UseSignalStateResult.items, if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then UseUniverseSessionsResult.entries else p6, UseMemoResult, UseMemoResult1, UseResult))
		end, {
			UseMemoResult,
			UseSignalStateResult.items,
			if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then UseUniverseSessionsResult.entries else p6,
			UseMemoResult1,
			UseResult
		}),
		status = if FFlagBuildWithGroupsModule and p8.creators == nil then p8.status else UseSignalStateResult.status,
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
					UseStateResult2(function(p10)
						-- upvalues: Query (copy), Creators (copy), FailedPageIndex (copy), Cursor (copy)
						if p10.query == Query and p10.creators == Creators and not table.find(p10.pageIndexes, FailedPageIndex) then
							local Copy = table.clone(p10.pageIndexes)
							table.insert(Copy, FailedPageIndex)
							local Copy1 = table.clone(p10.cursors or {})
							Copy1[FailedPageIndex] = Cursor
							
							return {
								query = p10.query,
								pageIndexes = Copy,
								creators = p10.creators,
								cursors = Copy1
							}
						else
							return p10
						end
					end)
				end
				UseResult1(Query, FailedPageIndex, HasFailedPageIndex, Cursor, Creators):catch(ignorePromiseRejection)
				
				return
			else
				if UseSignalStateResult.failedPageIndex == nil then
					UseStateResult2(function(p10)
						-- upvalues: Query (copy), FailedPageIndex (copy)
						if p10.query == Query and not table.find(p10.pageIndexes, FailedPageIndex) then
							local Copy = table.clone(p10.pageIndexes)
							table.insert(Copy, FailedPageIndex)
							
							return { query = p10.query, pageIndexes = Copy }
						else
							return p10
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

local function useUniverseListItems(Current, p10, p11, p12, p13, p14)
	-- upvalues: FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), useUniverseSessions (copy), ReactModule (copy), buildUniverseItems (copy)
	local UseUniverseSessionsResult = if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then useUniverseSessions(p14, Current) else nil
	local Entries = if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then UseUniverseSessionsResult.entries else p10
	
	return {
		items = ReactModule.useMemo(function()
			-- upvalues: buildUniverseItems (upval), Current (copy), Entries (copy), p11 (copy), p12 (copy), p13 (copy)
			return (buildUniverseItems(Current, Entries, p11, p12, p13))
		end, {
			p11,
			Entries,
			Current,
			p12,
			p13
		}),
		refreshSessions = if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then UseUniverseSessionsResult.refresh else nil
	}
end

local function useCreatorSearchList(SearchStore, Current, IsIsFocused, p10, UseMemoResult, UseMemoResult1, UseResult, p11, p12)
	-- upvalues: keyForCreators (copy), ReactModule (copy), PageSize (copy), UseCursorSearchPagesModule (copy), useUniverseListItems (copy)
	local Creators = p12.creators
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
	local UseUniverseListItemsResult = useUniverseListItems(UseCursorSearchPagesModuleResult.items, p10, UseMemoResult, UseMemoResult1, UseResult, p11)
	
	return {
		items = UseUniverseListItemsResult.items,
		status = if Creators == nil then p12.status else UseCursorSearchPagesModuleResult.status,
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

return function(p10)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), LocalizationRoactContext (copy), LocalizationModule (copy), CreatorAgentChatModule (copy), UniverseSearchModule (copy), GetSearchQueryStoreModule (copy), GetBuildExperienceRefreshStoreModule (copy), AppLifecycleObserverService (copy), UseSignalStateFunction (copy), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (copy), Players (copy), FFlagBuildWithGroupsModule (copy), CreatorGroupsModule (copy), useBuildCreators (copy), config (copy), FFlagBuildExperienceCursorSearchPagesModule (copy), useCreatorSearchList (copy), useUniverseSearchList (copy), PromiseModule (copy), ignorePromiseRejection (copy), SignalsModule (copy), FIntMyCreationsSessionListPollingIntervalSecondsModule (copy), requestHandleToPromise (copy)
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
	local UseResult = ReactModule.useCallback(function(p11)
		-- upvalues: UseContextResult (copy), LocalizationStringsModule (upval)
		return UseContextResult:Format(LocalizationStringsModule.MY_CREATIONS_UNIVERSE_NAME, { UNIVERSE_ID = p11 })
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
	local CreatorAgentChatStore = p10.creatorAgentChatStore or CreatorAgentChatModule.getCreatorAgentChatStore()
	local SearchStore = p10.searchStore
	
	if SearchStore == nil then
		SearchStore = UniverseSearchModule.getUniverseSearchStore()
	end
	local SearchQueryStore = p10.searchQueryStore or GetSearchQueryStoreModule()
	local BuildExperienceRefreshStoreModule = GetBuildExperienceRefreshStoreModule()
	local AppLifecycleObserverService1 = p10.appLifecycleObserverService or AppLifecycleObserverService
	local IsIsFocused = p10.isFocused ~= false
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
	local UserId = p10.userId or (if Players.LocalPlayer then Players.LocalPlayer.UserId else 0)
	local CreatorGroupsStore = if FFlagBuildWithGroupsModule then p10.creatorGroupsStore or CreatorGroupsModule.getCreatorGroupsStore() else nil
	local UseBuildCreatorsResult = if FFlagBuildWithGroupsModule then useBuildCreators(CreatorGroupsStore, UserId, p10.filter or config) else nil
	local UseCreatorSearchListResult = if FFlagBuildExperienceCursorSearchPagesModule then useCreatorSearchList(SearchStore, UseDebouncedQueryResult, IsIsFocused, UseSignalStateResult1, UseMemoResult, UseMemoResult1, UseResult, if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then CreatorAgentChatStore else nil, UseBuildCreatorsResult) else useUniverseSearchList(SearchStore, UserId, UseDebouncedQueryResult, IsIsFocused, UseSignalStateResult1, UseMemoResult, UseMemoResult1, UseResult, if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then CreatorAgentChatStore else nil, UseBuildCreatorsResult)
	local RefreshFunction = UseCreatorSearchListResult.refresh
	local RefreshSessions = if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then UseCreatorSearchListResult.refreshSessions else nil
	local UseRefResult2 = if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then ReactModule.useRef(RefreshSessions) else nil
	
	if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
		UseRefResult2.current = RefreshSessions
	end
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: SessionListStore (copy), PromiseModule (upval), FFlagBuildWithGroupsModule (upval), CreatorGroupsStore (copy), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (upval), RefreshFunction (copy), UseRefResult2 (copy), ignorePromiseRejection (upval)
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
		return if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then PromiseModule.all({
			RefreshFunction(),
			NewPromise,
			UseRefResult2.current():catch(ignorePromiseRejection)
		}) else PromiseModule.all({ RefreshFunction(), NewPromise })
	end, { CreatorGroupsStore, RefreshFunction, SessionListStore })
	ReactModule.useEffect(function()
		-- upvalues: AppLifecycleObserverService1 (copy), IsIsFocused (copy), RefreshFunction (copy), ignorePromiseRejection (upval), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (upval), UseRefResult2 (copy), SessionListStore (copy)
		local OnUnhideConnection = AppLifecycleObserverService1.OnUnhide:Connect(function()
			-- upvalues: IsIsFocused (upval), RefreshFunction (upval), ignorePromiseRejection (upval), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (upval), UseRefResult2 (upval), SessionListStore (upval)
			if IsIsFocused then
				RefreshFunction():catch(ignorePromiseRejection)
				
				if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
					UseRefResult2.current():catch(ignorePromiseRejection)
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
		RefreshFunction,
		SessionListStore
	})
	ReactModule.useEffect(function()
		-- upvalues: FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (upval), UseRefResult (copy), UseSignalStateResult (copy), IsIsFocused (copy), UseRefResult1 (copy), UseStateResult2 (copy), RefreshFunction (copy), ignorePromiseRejection (upval), UseRefResult2 (copy), SessionListStore (copy), SignalsModule (upval)
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
		RefreshFunction():catch(ignorePromiseRejection)
		
		if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule and IsNotCurrentMatch then
			UseRefResult2.current():catch(ignorePromiseRejection)
		end
		local RefreshResult = SessionListStore.refresh()
		
		return SignalsModule.createEffect(function(p11)
			-- upvalues: RefreshResult (copy), UseStateResult2 (upval)
			if RefreshResult.state(p11).status == "succeeded" then
				UseStateResult2(true)
			end
		end)
	end, {
		IsIsFocused,
		UseSignalStateResult,
		RefreshFunction,
		SessionListStore
	})
	local Largest = math.max(0, p10.pollingIntervalSeconds or FIntMyCreationsSessionListPollingIntervalSecondsModule)
	ReactModule.useEffect(function()
		-- upvalues: IsIsFocused (copy), Largest (copy), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (upval), UseRefResult2 (copy), ignorePromiseRejection (upval), SessionListStore (copy)
		if not IsIsFocused or Largest == 0 then return end
		local Flag = false
		
		local function scheduleNextPoll()
			-- upvalues: Largest (upval), Flag (ref), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (upval), UseRefResult2 (upval), ignorePromiseRejection (upval), SessionListStore (upval), scheduleNextPoll (copy)
			task.delay(Largest, function()
				-- upvalues: Flag (upval), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (upval), UseRefResult2 (upval), ignorePromiseRejection (upval), SessionListStore (upval), scheduleNextPoll (upval)
				if Flag then return end
				if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
					UseRefResult2.current():catch(ignorePromiseRejection)
				end
				SessionListStore.refresh()
				scheduleNextPoll()
			end)
		end
		
		task.delay(Largest, function()
			-- upvalues: Flag (ref), FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule (upval), UseRefResult2 (upval), ignorePromiseRejection (upval), SessionListStore (upval), scheduleNextPoll (copy)
			if Flag then return end
			if FFlagBuildExperienceMyCreationsFindSessionsByUniverseModule then
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
	local Items = UseCreatorSearchListResult.items
	local Status = UseCreatorSearchListResult.status
	local SourceItemCount: number = UseCreatorSearchListResult.sourceItemCount
	local IsReady: boolean = Status == "Ready" or SourceItemCount > 0
	local IsPending = UseSignalStateResult4 == "pending"
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
	local LoadMoreFunction = UseCreatorSearchListResult.loadMore
	local Query = UseCreatorSearchListResult.query
	
	return {
		hasPendingSummary = false,
		displayedItems = UseCreatorSearchListResult.items,
		items = Items,
		listStatus = Status,
		hasDisplayedResult = IsReady,
		isSettledNoResults = Query == UseDebouncedQueryResult and (IsReady and #Items == 0),
		query = Query,
		sourceItemCount = SourceItemCount,
		sessionCount = #UseSignalStateResult1,
		sessionListStatus = NotReady,
		hasCompletedFocusedRefresh = UseStateResult,
		loadError = LoadError,
		refresh = UseResult1,
		loadMoreIfNeeded = ReactModule.useCallback(function(ScrollFrame)
			-- upvalues: LoadMoreFunction (copy), UseSignalStateResult2 (copy), IsPending (copy), NotReady (copy), UseResult11 (copy)
			local Y: number = ScrollFrame.AbsoluteCanvasSize.Y
			
			if ScrollFrame.CanvasPosition.Y <= 0 or Y <= 0 or ScrollFrame.AbsoluteWindowSize.Y <= 0 then return end
			if math.max(0, Y - ScrollFrame.AbsoluteWindowSize.Y - 250) < ScrollFrame.CanvasPosition.Y then
				LoadMoreFunction()
				
				if UseSignalStateResult2 ~= nil and not IsPending and NotReady == "Ready" then
					UseResult11()
				end
			end
		end, {
			IsPending,
			UseResult11,
			LoadMoreFunction,
			UseSignalStateResult2,
			NotReady
		}),
		failedLoadMore = UseCreatorSearchListResult.failedLoadMore,
		retryLoadMore = LoadMoreFunction,
		isLoadingMore = UseCreatorSearchListResult.isLoadingMore
	}
end