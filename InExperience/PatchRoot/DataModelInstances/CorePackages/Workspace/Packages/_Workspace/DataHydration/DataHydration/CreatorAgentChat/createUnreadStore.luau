local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.Signals)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local OnTerminalModule = require(script.Parent.onTerminal)
local _ = require(script.Parent.types)

return function(p1)
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), HttpClientModule (copy), PromiseModule (copy), OnTerminalModule (copy)
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = CreateDataCacheModule(),
		fetchFn = function()
			-- upvalues: HttpClientModule (upval), p1 (copy)
			return HttpClientModule.asPromise(p1.unreadSummary())
		end
	})
	local DataResolverModule1 = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = CreateDataCacheModule(),
		fetchFn = function(Kind)
			-- upvalues: HttpClientModule (upval), p1 (copy), PromiseModule (upval)
			local Entries = {}
			local t = {}
			
			local function page(Cursor)
				-- upvalues: HttpClientModule (upval), p1 (upval), Kind (copy), Entries (copy), t (copy), PromiseModule (upval), page (copy)
				return HttpClientModule.asPromise(p1.unreadList({ limit = 100, kind = Kind, cursor = Cursor })):andThen(function(Result)
					-- upvalues: Entries (upval), t (upval), PromiseModule (upval), page (upval)
					for _, entry in Result.entries do
						table.insert(Entries, entry)
					end
					local NextCursor = Result.nextCursor
					
					if NextCursor == nil then
						return { entries = Entries }
					elseif t[NextCursor] then
						return PromiseModule.reject("Unread list returned a repeated cursor")
					else
						t[NextCursor] = true
						
						return page(NextCursor)
					end
				end)
			end
			
			return page(nil)
		end
	})
	
	local function _(p2, UniverseId): boolean
		-- upvalues: DataResolverModule1 (copy)
		local DataResult = DataResolverModule1.getCachedItem(p2).data(false)
		
		if DataResult == nil then
			return false
		end
		for _, entry in DataResult.entries do
			if entry.universeId == UniverseId then
				return true
			end
		end
		return false
	end
	
	return {
		getSummary = function()
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getCachedItem("summary")
		end,
		refreshSummary = function()
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.refetchItem("summary")
		end,
		getAndFetchSummary = function()
			-- upvalues: DataResolverModule (copy)
			return (DataResolverModule.getAndFetchItem("summary"))
		end,
		getAccountGeneration = DataResolverModule.getAccountGeneration,
		getCategory = function(p3)
			-- upvalues: DataResolverModule1 (copy)
			return DataResolverModule1.getCachedItem(p3)
		end,
		refreshCategory = function(p3)
			-- upvalues: DataResolverModule1 (copy)
			return DataResolverModule1.refetchItem(p3)
		end,
		acknowledge = function(p3)
			-- upvalues: DataResolverModule1 (copy), p1 (copy), OnTerminalModule (upval), DataResolverModule (copy)
			local UniverseId = p3.universeId
			local DataResult = DataResolverModule1.getCachedItem(p3.kind).data(false)
			local Flag = nil
			
			if DataResult == nil then
				Flag = false
			else
				Flag = false
				
				for _, entry in DataResult.entries do
					if entry.universeId == UniverseId then
						Flag = true
						break
					end
				end
			end
			local UnreadAckResult = p1.unreadAck(p3)
			OnTerminalModule(UnreadAckResult.state, function(p4)
				-- upvalues: Flag (copy), DataResolverModule1 (upval), p3 (copy), DataResolverModule (upval)
				if p4.cleared or Flag then
					DataResolverModule1.refetchItem(p3.kind)
					DataResolverModule.refetchItem("summary")
				end
			end)
			
			return UnreadAckResult
		end,
		dispose = function()
			-- upvalues: DataResolverModule (copy), DataResolverModule1 (copy)
			DataResolverModule.dispose()
			DataResolverModule1.dispose()
		end
	}
end