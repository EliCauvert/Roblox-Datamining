local Gifting = script:FindFirstAncestor("Gifting")
local Parent = Gifting.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Gifting.Stores.createCanGiftStore)
local _ = require(Gifting.Models.FindRecipientsResponseModel)
local GetCanGiftStoreModule = require(Gifting.Stores.getCanGiftStore)
local _ = require(Gifting.Types)
local DataStatus = require(Parent.DataHydration).DataStatus
local BuildItemGiftabilityKeyFunction = require(Gifting.Stores.itemGiftabilityCacheKey).buildItemGiftabilityKey
local t = {}
local config = {
	isLoading = false,
	isLoadingMore = false,
	hasFailed = false,
	nextCursor = nil,
	recipients = {}
}

local function buildItemsSignature(Current): string?
	-- upvalues: BuildItemGiftabilityKeyFunction (copy)
	if Current == nil or #Current == 0 then
		return nil
	end
	local List = {}
	
	for _, value in Current do
		table.insert(List, BuildItemGiftabilityKeyFunction(value))
	end
	return table.concat(List, ",")
end

local function requestPages(p1, Items, SearchTerm, Cursors, p2)
	local List = {}
	
	local function requestPage(Cursor)
		-- upvalues: p2 (copy), List (copy), Items (copy), SearchTerm (copy), p1 (copy)
		local v1 = p2[#List + 1]
		
		if v1 == nil or v1.query.cursor ~= Cursor then
			local Query = { items = Items, searchTerm = SearchTerm, cursor = Cursor }
			table.insert(List, { query = Query, result = p1.getAndFetchRecipients(Query) })
			
			return
		else
			table.insert(List, v1)
		end
	end
	
	requestPage(nil)
	
	for _, cursor in Cursors do
		requestPage(cursor)
	end
	return List
end

local function createPagesSignal(UseMemoResult)
	-- upvalues: SignalsModule (copy), DataStatus (copy)
	return SignalsModule.createComputed(function(p3)
		-- upvalues: UseMemoResult (copy), DataStatus (upval)
		local Recipients = {}
		local IsLoading = false
		local IsLoadingMore = false
		local HasFailed = false
		local NextCursor = nil
		
		for i, value in UseMemoResult do
			local StatusResult = value.result.status(p3)
			local DataResult = value.result.data(p3)
			
			if StatusResult == DataStatus.NotReady then
				if i == 1 then
					IsLoading = true
				else
					IsLoadingMore = true
				end
			elseif StatusResult == DataStatus.Failed then
				HasFailed = true
			end
			if DataResult ~= nil and StatusResult ~= DataStatus.Failed then
				for _, recipient in DataResult.recipients do
					table.insert(Recipients, recipient)
				end
			end
			if i == #UseMemoResult then
				NextCursor = if StatusResult == DataStatus.Ready and DataResult ~= nil then DataResult.nextCursor else nil
			end
		end
		return {
			recipients = Recipients,
			isLoading = IsLoading,
			isLoadingMore = IsLoadingMore,
			hasFailed = HasFailed,
			nextCursor = NextCursor
		}
	end)
end

local Computed = SignalsModule.createComputed(function()
	-- upvalues: config (copy)
	return config
end)

return function(Current, p4)
	-- upvalues: GetCanGiftStoreModule (copy), ReactModule (copy), buildItemsSignature (copy), t (copy), requestPages (copy), Computed (copy), createPagesSignal (copy), SignalsReactModule (copy), DataStatus (copy)
	local CanGiftStoreModule = GetCanGiftStoreModule(false)
	local P10 = p4 or ""
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local ItemsSignature = buildItemsSignature(Current)
	local Text: string = `{ItemsSignature or ""}\0{P10}`
	local T = if UseStateResult == nil or UseStateResult.searchKey ~= Text then t else UseStateResult.cursors
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseRefResult (copy), ItemsSignature (copy), UseRefResult1 (copy), Text (copy), requestPages (upval), CanGiftStoreModule (copy), P10 (copy), T (copy)
		local Current = UseRefResult.current
		
		if Current == nil or ItemsSignature == nil then
			return {}
		else
			local Current1 = UseRefResult1.current
			local RequestPagesResult = requestPages(CanGiftStoreModule, Current, P10, T, if Current1 == nil or Current1.searchKey ~= Text then {} else Current1.pages)
			UseRefResult1.current = { searchKey = Text, pages = RequestPagesResult }
			
			return RequestPagesResult
		end
	end, { CanGiftStoreModule, ItemsSignature, P10, T })
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), Computed (upval), createPagesSignal (upval)
		return if #UseMemoResult == 0 then Computed else createPagesSignal(UseMemoResult)
	end, { UseMemoResult })))
	local NextCursor = UseSignalStateResult.nextCursor
	
	return {
		recipients = UseSignalStateResult.recipients,
		isLoading = UseSignalStateResult.isLoading,
		isLoadingMore = UseSignalStateResult.isLoadingMore,
		hasFailed = UseSignalStateResult.hasFailed,
		hasMore = NextCursor ~= nil,
		loadMore = ReactModule.useCallback(function()
			-- upvalues: NextCursor (copy), T (copy), UseStateResult2 (copy), Text (copy)
			if NextCursor ~= nil then
				local Copy = table.clone(T)
				table.insert(Copy, NextCursor)
				UseStateResult2({ searchKey = Text, cursors = Copy })
				
				return
			end
		end, { NextCursor, T, Text }),
		retry = ReactModule.useCallback(function()
			-- upvalues: UseMemoResult (copy), DataStatus (upval), CanGiftStoreModule (copy)
			for _, value in UseMemoResult do
				if value.result.status(false) == DataStatus.Failed then
					CanGiftStoreModule.getAndFetchRecipients(value.query)
				end
			end
		end, { CanGiftStoreModule, UseMemoResult })
	}
end