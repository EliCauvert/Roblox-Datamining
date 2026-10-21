local Parent = script:FindFirstAncestor("BuildExperience").Parent
local PromiseModule = require(Parent.Promise)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.DataHydration.UniverseSearch)
local DataStatus = require(Parent.DataHydration).DataStatus
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local t = {}

local function _(List): string?
	if List == nil then
		return nil
	end
	local Buffer = table.create(#List)
	
	for i, value in List do
		Buffer[i] = value.key
	end
	return table.concat(Buffer, ";")
end

local function firstPages(Sources)
	local List = {}
	local Sources1 = Sources or {}
	for SourceIndex in Sources1 do
		table.insert(List, { cursor = "", sourceIndex = SourceIndex })
	end
	return List
end

local _ = function(List, p1): boolean
	for _, value in List do
		if value.sourceIndex == p1.sourceIndex and value.cursor == p1.cursor then
			return true
		end
	end
	return false
end

local _ = function(p2, p3)
	local Copy = table.clone(p2.params)
	Copy.cursor = if p3 == "" then nil else p3
	
	return Copy
end

local function refreshFirstPages(SearchStore, Sources)
	-- upvalues: PromiseModule (copy)
	local Buffer = table.create(#Sources)
	
	for _, source in Sources do
		local Copy = table.clone(source.params)
		Copy.cursor = nil
		table.insert(Buffer, SearchStore.refreshSearch(Copy))
	end
	return PromiseModule.all(Buffer)
end

local function ignorePromiseRejection() end

return function(p2)
	-- upvalues: ReactModule (copy), firstPages (copy), refreshFirstPages (copy), ignorePromiseRejection (copy), SignalsModule (copy), DataStatus (copy), t (copy), UseSignalStateFunction (copy), PromiseModule (copy)
	local SearchStore = p2.searchStore
	local Sources = p2.sources
	local SourcesKey = nil
	
	if Sources == nil then
		SourcesKey = nil
	else
		local Buffer = table.create(#Sources)
		
		for i, source in Sources do
			Buffer[i] = source.key
		end
		SourcesKey = table.concat(Buffer, ";")
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState({ sourcesKey = SourcesKey, pages = firstPages(Sources) })
	local UseStateResult1 = UseStateResult
	
	if UseStateResult.sourcesKey ~= SourcesKey then
		UseStateResult1 = { sourcesKey = SourcesKey, pages = firstPages(Sources) }
		UseStateResult2(UseStateResult1)
	end
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Sources (copy), UseStateResult1 (ref), SearchStore (copy)
		local List = {}
		
		if Sources ~= nil then
			for _, page in UseStateResult1.pages do
				local Cursor = page.cursor
				local Copy = table.clone(Sources[page.sourceIndex].params)
				Copy.cursor = if Cursor == "" then nil else Cursor
				table.insert(List, (SearchStore.getSearch(Copy)))
			end
		end
		return List
	end, { UseStateResult1, SearchStore, Sources })
	local UseRefResult = ReactModule.useRef({ sources = Sources, sourcesKey = SourcesKey })
	UseRefResult.current = { sources = Sources, sourcesKey = SourcesKey }
	local UseRefResult1 = ReactModule.useRef(SourcesKey)
	local UseRefResult2 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), SourcesKey (copy), refreshFirstPages (upval), SearchStore (copy), UseRefResult2 (copy), ignorePromiseRejection (upval)
		local Sources = UseRefResult.current.sources
		
		if Sources == nil then
			UseRefResult1.current = nil
			
			return
		end
		if UseRefResult1.current ~= SourcesKey then
			UseRefResult1.current = SourcesKey
			local Current = {
				sourcesKey = SourcesKey,
				load = refreshFirstPages(SearchStore, Sources)
			}
			UseRefResult2.current = Current
			Current.load:catch(ignorePromiseRejection):finally(function()
				-- upvalues: UseRefResult2 (upval), Current (copy)
				if UseRefResult2.current == Current then
					UseRefResult2.current = nil
				end
			end)
			
			return
		end
	end, { SearchStore, SourcesKey })
	local UseSignalStateResult = UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseStateResult1 (ref), Sources (copy), DataStatus (upval), UseMemoResult (copy), t (upval)
		return SignalsModule.createComputed(function(p3)
			-- upvalues: UseStateResult1 (upval), Sources (upval), DataStatus (upval), UseMemoResult (upval), t (upval)
			local Pages = UseStateResult1.pages
			local t1 = {}
			local t2 = {}
			local Sources1 = Sources or {}
			for i, _ in Sources1 do
				t2[i] = {
					lastResponse = nil,
					lastPageIndex = nil,
					newItemCount = 0,
					items = {},
					seen = {}
				}
			end
			local IsLoadingMore = false
			local FailedPage = nil
			local Ready = if #Pages == 0 then DataStatus.Ready else DataStatus.NotReady
			local Count = 0
			
			for LastPageIndex, value in UseMemoResult do
				local Page = Pages[LastPageIndex]
				local StatusResult = value.status(p3)
				local IsCursorMatch = Page.cursor == ""
				
				if StatusResult == DataStatus.NotReady then
					IsLoadingMore = IsLoadingMore or not IsCursorMatch
				elseif StatusResult == DataStatus.Failed then
					if IsCursorMatch then
						Ready = DataStatus.Failed
					else
						FailedPage = Page
					end
				elseif IsCursorMatch then
					Count += 1
				end
				local DataResult = value.data(p3)
				
				if DataResult ~= nil then
					local Entry = t2[Page.sourceIndex]
					Entry.lastResponse = DataResult
					Entry.lastPageIndex = LastPageIndex
					local NewItemCount = 0
					local Data = DataResult.data or t
					for _, entry in Data do
						if not Entry.seen[entry.id] then
							Entry.seen[entry.id] = true
							NewItemCount += 1
						end
						if not t1[entry.id] then
							t1[entry.id] = true
							table.insert(Entry.items, entry)
						end
					end
					Entry.newItemCount = NewItemCount
				end
			end
			if Ready ~= DataStatus.Failed and #Pages > 0 and Count == #(Sources or {}) then
				Ready = DataStatus.Ready
			end
			local Items = {}
			local NextPage = nil
			local Flag = nil
			
			for SourceIndex, value1 in t2 do
				for _, item in value1.items do
					table.insert(Items, item)
				end
				local LastPageIndex1 = value1.lastPageIndex
				local LastResponse = value1.lastResponse
				local NextCursor = if LastResponse == nil then nil else LastResponse.nextCursor
				
				if NextPage == nil and LastPageIndex1 ~= nil and UseMemoResult[LastPageIndex1].status(p3) == DataStatus.Ready and NextCursor ~= nil and NextCursor ~= "" and value1.newItemCount > 0 then
					local config = { sourceIndex = SourceIndex, cursor = NextCursor }
					Flag = false
					
					for _, page in Pages do
						if page.sourceIndex == config.sourceIndex and page.cursor == config.cursor then
							Flag = true
							break
						end
					end
					if not Flag then
						NextPage = { sourceIndex = SourceIndex, cursor = NextCursor }
					end
				end
			end
			return {
				sourcesKey = UseStateResult1.sourcesKey,
				items = Items,
				status = Ready,
				nextPage = NextPage,
				isLoadingMore = IsLoadingMore,
				failedPage = FailedPage
			}
		end)
	end, { UseMemoResult, UseStateResult1, Sources })))
	local IsNotSourcesKeyMatch: boolean = Sources ~= nil and UseSignalStateResult.sourcesKey ~= SourcesKey
	local UseRefResult3 = ReactModule.useRef({})
	
	return {
		items = if IsNotSourcesKeyMatch then t else UseSignalStateResult.items,
		status = if Sources == nil then DataStatus.NotReady elseif IsNotSourcesKeyMatch then DataStatus.NotReady else UseSignalStateResult.status,
		isLoadingMore = UseSignalStateResult.isLoadingMore,
		failedLoadMore = UseSignalStateResult.failedPage ~= nil,
		refresh = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), PromiseModule (upval), UseStateResult2 (copy), firstPages (upval), UseRefResult2 (copy), refreshFirstPages (upval), SearchStore (copy)
			local Current = UseRefResult.current
			local Sources = Current.sources
			
			if Sources == nil then
				return PromiseModule.resolve()
			else
				UseStateResult2({
					sourcesKey = Current.sourcesKey,
					pages = firstPages(Sources)
				})
				local Current1 = UseRefResult2.current
				
				return if Current1 == nil or Current1.sourcesKey ~= Current.sourcesKey then refreshFirstPages(SearchStore, Sources) else Current1.load
			end
		end, { SearchStore }),
		loadMore = ReactModule.useCallback(function()
			-- upvalues: Sources (copy), IsNotSourcesKeyMatch (copy), UseRefResult (copy), SourcesKey (copy), UseRefResult3 (copy), SearchStore (copy), ignorePromiseRejection (upval), UseSignalStateResult (copy), UseStateResult2 (copy)
			if Sources == nil or IsNotSourcesKeyMatch or UseRefResult.current.sourcesKey ~= SourcesKey then return end
			local function loadPage(FailedPage)
				-- upvalues: SourcesKey (upval), UseRefResult3 (upval), Sources (upval), SearchStore (upval), ignorePromiseRejection (upval)
				local Text: string = `{FailedPage.sourceIndex}|{FailedPage.cursor}|{SourcesKey}`
				
				if not UseRefResult3.current[Text] then
					UseRefResult3.current[Text] = true
					local Cursor = FailedPage.cursor
					local Copy = table.clone(Sources[FailedPage.sourceIndex].params)
					Copy.cursor = if Cursor == "" then nil else Cursor
					SearchStore.getSearch(Copy)
					SearchStore.refreshSearch(Copy):catch(ignorePromiseRejection):finally(function()
						-- upvalues: UseRefResult3 (upval), Text (copy)
						UseRefResult3.current[Text] = nil
					end)
					
					return
				end
			end
			
			local FailedPage = UseSignalStateResult.failedPage
			
			if FailedPage ~= nil then
				loadPage(FailedPage)
				
				return
			end
			local NextPage = UseSignalStateResult.nextPage
			
			if not UseSignalStateResult.isLoadingMore and NextPage ~= nil then
				loadPage(NextPage)
				UseStateResult2(function(p4)
					-- upvalues: SourcesKey (upval), NextPage (copy)
					if p4.sourcesKey == SourcesKey then
						local Flag = false
						
						for _, page in p4.pages do
							if page.sourceIndex == NextPage.sourceIndex and page.cursor == NextPage.cursor then
								Flag = true
								break
							end
						end
						if not Flag then
							local Copy = table.clone(p4.pages)
							table.insert(Copy, NextPage)
							
							return { sourcesKey = SourcesKey, pages = Copy }
						end
					end
					return p4
				end)
				
				return
			end
		end, {
			IsNotSourcesKeyMatch,
			UseSignalStateResult,
			SearchStore,
			Sources,
			SourcesKey
		})
	}
end