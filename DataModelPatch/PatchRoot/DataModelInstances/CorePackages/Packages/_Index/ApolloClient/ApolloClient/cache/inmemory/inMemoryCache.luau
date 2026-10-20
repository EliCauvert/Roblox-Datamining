local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Map = LuauPolyfillModule.Map
local Object = LuauPolyfillModule.Object
local Set = LuauPolyfillModule.Set
local InstanceofFunction = LuauPolyfillModule.instanceof
local NULL = require(Parent.utilities).NULL
local PromiseModule = require(Parent1.Promise)
local InMemoryCache = {}
local _ = require(Parent1.GraphQL)
local WrapFunction = require(Parent.optimism).wrap
local EqualModule = require(Parent.jsutils.equal)
local ApolloCache = require(script.Parent.Parent.core.cache).ApolloCache
local _ = require(script.Parent.Parent.core.types.Cache)
local MissingFieldError = require(script.Parent.Parent.core.types.common).MissingFieldError
local UtilitiesModule = require(script.Parent.Parent.Parent.utilities)
local AddTypenameToDocumentFunction = UtilitiesModule.addTypenameToDocument
local IsReferenceFunction = UtilitiesModule.isReference
local _ = require(script.Parent.types)
local StoreReader = require(script.Parent.readFromStore).StoreReader
local StoreWriter = require(script.Parent.writeToStore).StoreWriter
local EntityStoreModule = require(script.Parent.entityStore)
local EntityStoreRoot = EntityStoreModule.EntityStore_Root
local SupportsResultCachingFunction = EntityStoreModule.supportsResultCaching
local ReactiveVarsModule = require(script.Parent.reactiveVars)
local MakeVar = ReactiveVarsModule.makeVar
local ForgetCacheFunction = ReactiveVarsModule.forgetCache
local RecallCacheFunction = ReactiveVarsModule.recallCache
local PoliciesModule = require(script.Parent.policies)
local Policies = PoliciesModule.Policies
local HasOwnFunction = require(script.Parent.helpers).hasOwn
local CanonicalStringifyFunction = require(script.Parent["object-canon"]).canonicalStringify
local config = {
	addTypename = true,
	resultCaching = true,
	dataIdFromObject = PoliciesModule.defaultDataIdFromObject,
	typePolicies = {}
}
local self = setmetatable({}, { __index = ApolloCache })
self.__index = self

function self.new(Cache)
	-- upvalues: ApolloCache (copy), self (copy), Set (copy), Map (copy), MakeVar (copy), Object (copy), config (copy), Policies (copy)
	local self1 = setmetatable(ApolloCache.new(), self)
	
	if Cache == nil then
		Cache = {}
	end
	self1.watches = Set.new()
	self1.typenameDocumentCache = Map.new(nil)
	self1.makeVar = MakeVar
	self1.txCount = 0
	self1.config = Object.assign({}, config, Cache)
	self1.addTypename = self1.config.addTypename
	self1.policies = Policies.new({
		cache = self1,
		dataIdFromObject = self1.config.dataIdFromObject,
		possibleTypes = self1.config.possibleTypes,
		typePolicies = self1.config.typePolicies
	})
	self1:init()
	
	return self1
end

function self:init()
	-- upvalues: EntityStoreRoot (copy)
	self.data = EntityStoreRoot.new({
		policies = self.policies,
		resultCaching = self.config.resultCaching
	})
	self.optimisticData = self.data.stump
	self:resetResultCache()
end

function self:resetResultCache(ResetResultIdentities)
	-- upvalues: StoreReader (copy), StoreWriter (copy), WrapFunction (copy), SupportsResultCachingFunction (copy), CanonicalStringifyFunction (copy), Set (copy)
	local StoreReader1 = self.storeReader
	self.storeReader = StoreReader.new({
		cache = self,
		addTypename = self.addTypename,
		resultCacheMaxSize = self.config.resultCacheMaxSize,
		canon = if ResetResultIdentities then nil elseif StoreReader1 then StoreReader1.canon else nil
	})
	self.storeWriter = StoreWriter.new(self, self.storeReader)
	self.maybeBroadcastWatch = WrapFunction(function(_, p1, p2)
		-- upvalues: self (ref)
		return self:broadcastWatch(p1, p2)
	end, {
		max = self.config.resultCacheMaxSize,
		makeCacheKey = function(_, Query)
			-- upvalues: self (ref), SupportsResultCachingFunction (upval), CanonicalStringifyFunction (upval)
			local OptimisticData = if Query.optimistic then self.optimisticData else self.data
			
			if not SupportsResultCachingFunction(OptimisticData) then return end
			return OptimisticData:makeCacheKey(Query.query, Query.callback, CanonicalStringifyFunction({
				optimistic = Query.optimistic,
				rootId = Query.rootId,
				variables = Query.variables
			}))
		end
	}, self)
	Set.new({ self.data.group, self.optimisticData.group }):forEach(function(p1)
		return p1:resetCaching()
	end)
end

function self:restore(p1)
	self:init()
	
	if p1 then
		self.data:replace(p1)
	end
	return self
end

function self.extract(p1, p2: boolean)
	if p2 == nil then
		p2 = false
	end
	return if p2 then p1.optimisticData:extract() else p1.data:extract()
end

function self.read(p1, p2)
	-- upvalues: Object (copy), NULL (copy), InstanceofFunction (copy), MissingFieldError (copy)
	local ReturnPartialData = nil
	ReturnPartialData = p2.returnPartialData ~= nil and p2.returnPartialData
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy), Object (upval), p2 (copy), ReturnPartialData (ref), NULL (upval)
		return p1.storeReader:diffQueryAgainstStore(Object.assign({}, p2, {
			store = p2.optimistic and p1.optimisticData or p1.data,
			config = p1.config,
			returnPartialData = ReturnPartialData
		})).result or NULL
	end)
	
	if not Success then
		if InstanceofFunction(Result, MissingFieldError) then
			return NULL
		end
		error(Result)
	end
	return Result
end

function self:write(p1)
	local Success, Result = pcall(function()
		-- upvalues: self (ref), p1 (copy)
		local v1 = self
		v1.txCount += 1
		
		return self.storeWriter:writeToStore(self.data, p1)
	end)
	self.txCount -= 1
	
	if self.txCount == 0 and p1.broadcast ~= false then
		self:broadcastWatches()
	end
	if not Success then
		error(Result)
	end
	return Result
end

function self:modify(Id)
	-- upvalues: HasOwnFunction (copy)
	if HasOwnFunction(Id, "id") and not Id.id then
		return false
	end
	local OptimisticData = nil
	OptimisticData = if Id.optimistic then self.optimisticData else self.data
	local Success, Result = pcall(function()
		-- upvalues: self (ref), OptimisticData (ref), Id (copy)
		local v1 = self
		v1.txCount += 1
		
		return OptimisticData:modify(Id.id or "ROOT_QUERY", Id.fields)
	end)
	self.txCount -= 1
	
	if self.txCount == 0 and Id.broadcast ~= false then
		self:broadcastWatches()
	end
	if not Success then
		error(Result)
	end
	return Result
end

function self:diff(p1)
	-- upvalues: Object (copy)
	return self.storeReader:diffQueryAgainstStore(Object.assign({}, p1, {
		store = p1.optimistic and self.optimisticData or self.data,
		rootId = p1.id or "ROOT_QUERY",
		config = self.config
	}))
end

function self:watch(p1)
	-- upvalues: RecallCacheFunction (copy), ForgetCacheFunction (copy)
	if self.watches.size == 0 then
		RecallCacheFunction(self)
	end
	self.watches:add(p1)
	
	if p1.immediate then
		self:maybeBroadcastWatch(p1)
	end
	return function()
		-- upvalues: self (ref), p1 (copy), ForgetCacheFunction (upval)
		if self.watches:delete(p1) and self.watches.size == 0 then
			ForgetCacheFunction(self)
		end
		self.maybeBroadcastWatch:forget(p1)
	end
end

function self:gc(p1)
	-- upvalues: CanonicalStringifyFunction (copy)
	CanonicalStringifyFunction:reset()
	local v1 = self.optimisticData:gc()
	
	if p1 and self.txCount == 0 then
		if p1.resetResultCache then
			self:resetResultCache(p1.resetResultIdentities)
			
			return v1
		end
		if p1.resetResultIdentities then
			self.storeReader:resetCanon()
		end
	end
	return v1
end

function self.retain(p1, p2, p3)
	return if p3 then p1.optimisticData:retain(p2) else p1.data:retain(p2)
end

function self.release(p1, p2, p3)
	return if p3 then p1.optimisticData:release(p2) else p1.data:release(p2)
end

function self.identify(p1, p2)
	-- upvalues: IsReferenceFunction (copy)
	return if IsReferenceFunction(p2) then p2.__ref else p1.policies:identify(p2)[1]
end

function self:evict(Tbl)
	-- upvalues: HasOwnFunction (copy), Object (copy)
	if not Tbl.id then
		if HasOwnFunction(Tbl, "id") then
			return false
		end
		Tbl = Object.assign(table.clone(Tbl), { id = "ROOT_QUERY" })
	end
	local Success, Result = pcall(function()
		-- upvalues: self (ref), Tbl (ref)
		local v1 = self
		v1.txCount += 1
		
		return self.optimisticData:evict(Tbl)
	end)
	self.txCount -= 1
	
	if self.txCount == 0 and Tbl.broadcast ~= false then
		self:broadcastWatches()
	end
	if not Success then
		error(Result)
	end
	return Result
end

function self:reset()
	-- upvalues: CanonicalStringifyFunction (copy), PromiseModule (copy)
	self:init()
	self:broadcastWatches()
	CanonicalStringifyFunction:reset()
	
	return PromiseModule.delay(0)
end

function self:removeOptimistic(p1)
	local RemoveLayerResult = self.optimisticData:removeLayer(p1)
	
	if RemoveLayerResult ~= self.optimisticData then
		self.optimisticData = RemoveLayerResult
		self:broadcastWatches()
	end
end

function self:batch(Tbl)
	-- upvalues: Set (copy), Object (copy)
	local NoOptimistic = Tbl.optimistic == nil or Tbl.optimistic
	local RemoveOptimistic = Tbl.removeOptimistic
	local OnWatchUpdatedFunction = Tbl.onWatchUpdated
	
	local function perform(OptimisticData)
		-- upvalues: self (ref), Tbl (copy)
		local Data = self.data
		local OptimisticData1 = self.optimisticData
		local v1 = self
		v1.txCount += 1
		
		if OptimisticData then
			self.optimisticData = OptimisticData
			self.data = self.optimisticData
		end
		local Success, Result = pcall(Tbl.update, Tbl, self)
		local v2 = self
		v2.txCount -= 1
		self.data = Data
		self.optimisticData = OptimisticData1
		
		if not Success then
			error(Result)
		end
	end
	
	local NewSet = Set.new()
	
	if OnWatchUpdatedFunction and self.txCount == 0 then
		self:broadcastWatches(Object.assign(table.clone(Tbl), {
			onWatchUpdated = function(_, p1): boolean
				-- upvalues: NewSet (copy)
				NewSet:add(p1)
				
				return false
			end
		}))
	end
	if typeof(NoOptimistic) == "string" then
		self.optimisticData = self.optimisticData:addLayer(NoOptimistic, perform)
	elseif NoOptimistic == false then
		perform(self.data)
	else
		perform()
	end
	if typeof(RemoveOptimistic) == "string" then
		self.optimisticData = self.optimisticData:removeLayer(RemoveOptimistic)
	end
	if OnWatchUpdatedFunction and NewSet.size > 0 then
		self:broadcastWatches(Object.assign(table.clone(Tbl), {
			onWatchUpdated = function(p1, p2, p3)
				-- upvalues: OnWatchUpdatedFunction (copy), NewSet (copy)
				local OnWatchUpdatedResult = OnWatchUpdatedFunction(p1, p2, p3)
				
				if OnWatchUpdatedResult ~= false then
					NewSet:delete(p2)
				end
				return OnWatchUpdatedResult
			end
		}))
		
		if NewSet.size > 0 then
			NewSet:forEach(function(p1)
				-- upvalues: self (ref)
				return self.maybeBroadcastWatch:dirty(p1)
			end)
		end
	else
		self:broadcastWatches(Tbl)
	end
end

function self:performTransaction(Callback, NULL1)
	-- upvalues: NULL (copy)
	return self:batch({
		update = function(_, ...)
			-- upvalues: Callback (copy)
			return Callback(...)
		end,
		optimistic = NULL1 or NULL1 ~= NULL
	})
end

function self:transformDocument(p1)
	-- upvalues: AddTypenameToDocumentFunction (copy)
	if not self.addTypename then
		return p1
	end
	local GetResult = self.typenameDocumentCache:get(p1)
	
	if not GetResult then
		GetResult = AddTypenameToDocumentFunction(p1)
		self.typenameDocumentCache:set(p1, GetResult)
		self.typenameDocumentCache:set(GetResult, GetResult)
	end
	return GetResult
end

function self:broadcastWatches(AssignResult)
	if self.txCount == 0 then
		self.watches:forEach(function(p1)
			-- upvalues: self (copy), AssignResult (copy)
			return self:maybeBroadcastWatch(p1, AssignResult)
		end)
	end
end

function self:broadcastWatch(p1, p2)
	-- upvalues: EqualModule (copy)
	local LastDiff = p1.lastDiff
	local DiffResult = self:diff({
		query = p1.query,
		variables = p1.variables,
		optimistic = p1.optimistic
	})
	
	if p2 then
		if p1.optimistic and typeof(p2.optimistic) == "string" then
			DiffResult.fromOptimisticTransaction = true
		end
		local OnWatchUpdatedFunction = p2.onWatchUpdated
		
		if OnWatchUpdatedFunction and OnWatchUpdatedFunction(self, p1, DiffResult, LastDiff) == false then return end
	end
	if not LastDiff or not EqualModule(LastDiff.result, DiffResult.result) then
		p1.lastDiff = DiffResult
		p1:callback(p1.lastDiff, LastDiff)
	end
end

InMemoryCache.InMemoryCache = self

return InMemoryCache