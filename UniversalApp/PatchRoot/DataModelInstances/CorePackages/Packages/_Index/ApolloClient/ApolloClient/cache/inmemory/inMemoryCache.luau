local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local map = luauPolyfillModule.Map
local object = luauPolyfillModule.Object
local set = luauPolyfillModule.Set
local instanceof = luauPolyfillModule.instanceof
local NULL = require(parent.utilities).NULL
local promiseModule = require(parent_1.Promise)
local t = {}
local _ = require(parent_1.GraphQL)
local wrap = require(parent.optimism).wrap
local equalModule = require(parent.jsutils.equal)
local apolloCache = require(script.Parent.Parent.core.cache).ApolloCache
local _ = require(script.Parent.Parent.core.types.Cache)
local missingFieldError = require(script.Parent.Parent.core.types.common).MissingFieldError
local utilitiesModule = require(script.Parent.Parent.Parent.utilities)
local addTypenameToDocument = utilitiesModule.addTypenameToDocument
local isReference = utilitiesModule.isReference
local _ = require(script.Parent.types)
local storeReader = require(script.Parent.readFromStore).StoreReader
local storeWriter = require(script.Parent.writeToStore).StoreWriter
local entityStoreModule = require(script.Parent.entityStore)
local entityStoreRoot = entityStoreModule.EntityStore_Root
local supportsResultCaching = entityStoreModule.supportsResultCaching
local reactiveVarsModule = require(script.Parent.reactiveVars)
local makeVar = reactiveVarsModule.makeVar
local forgetCache = reactiveVarsModule.forgetCache
local recallCache = reactiveVarsModule.recallCache
local policiesModule = require(script.Parent.policies)
local defaultDataIdFromObject = policiesModule.defaultDataIdFromObject
local policies = policiesModule.Policies
local hasOwn = require(script.Parent.helpers).hasOwn
local canonicalStringify = require(script.Parent["object-canon"]).canonicalStringify
local t_1 = {
	addTypename = true,
	resultCaching = true,
	dataIdFromObject = defaultDataIdFromObject,
	typePolicies = {}
}
local tbl = setmetatable({}, { __index = apolloCache })
tbl.__index = tbl

function tbl.new(p1)
	-- upvalues: apolloCache (ref), tbl (ref), set (ref), map (ref), makeVar (ref), object (ref), t_1 (ref), policies (ref)
	local tbl_1 = setmetatable(apolloCache.new(), tbl)
	
	if p1 == nil then
		p1 = {}
	end
	tbl_1.watches = set.new()
	tbl_1.typenameDocumentCache = map.new(nil)
	tbl_1.makeVar = makeVar
	tbl_1.txCount = 0
	tbl_1.config = object.assign({}, t_1, p1)
	tbl_1.addTypename = tbl_1.config.addTypename
	tbl_1.policies = policies.new({
		cache = tbl_1,
		dataIdFromObject = tbl_1.config.dataIdFromObject,
		possibleTypes = tbl_1.config.possibleTypes,
		typePolicies = tbl_1.config.typePolicies
	})
	tbl_1:init()
	
	return tbl_1
end

function tbl:init()
	-- upvalues: entityStoreRoot (ref)
	self.data = entityStoreRoot.new({
		policies = self.policies,
		resultCaching = self.config.resultCaching
	})
	self.optimisticData = self.data.stump
	self:resetResultCache()
end

function tbl:resetResultCache(p1)
	-- upvalues: storeReader (ref), storeWriter (ref), wrap (ref), supportsResultCaching (ref), canonicalStringify (ref), set (ref)
	local storeReader_1 = self.storeReader
	self.storeReader = storeReader.new({
		cache = self,
		addTypename = self.addTypename,
		resultCacheMaxSize = self.config.resultCacheMaxSize,
		canon = if p1 then nil elseif storeReader_1 then storeReader_1.canon else nil
	})
	self.storeWriter = storeWriter.new(self, self.storeReader)
	self.maybeBroadcastWatch = wrap(function(_, p2, p3)
		-- upvalues: self (write)
		return self:broadcastWatch(p2, p3)
	end, {
		max = self.config.resultCacheMaxSize,
		makeCacheKey = function(_, p2)
			-- upvalues: self (write), supportsResultCaching (copy), canonicalStringify (copy)
			local var1 = if p2.optimistic then self.optimisticData else self.data
			
			if supportsResultCaching(var1) then
				return var1:makeCacheKey(p2.query, p2.callback, canonicalStringify({
					optimistic = p2.optimistic,
					rootId = p2.rootId,
					variables = p2.variables
				}))
			end
		end
	}, self)
	set.new({ self.data.group, self.optimisticData.group }):forEach(function(p2)
		return p2:resetCaching()
	end)
end

function tbl:restore(p1)
	self:init()
	
	if p1 then
		self.data:replace(p1)
	end
	return self
end

function tbl:extract(p1)
	if p1 == nil then
		p1 = false
	end
	return if p1 then self.optimisticData:extract() else self.data:extract()
end

function tbl.read(p1, p2)
	-- upvalues: object (ref), NULL (ref), instanceof (ref), missingFieldError (ref)
	local var1 = if p2.returnPartialData == nil then false else p2.returnPartialData
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), object (copy), p2 (ref), var1 (write), NULL (copy)
		return p1.storeReader:diffQueryAgainstStore(object.assign({}, p2, {
			store = if p2.optimistic then p1.optimisticData else p1.data,
			config = p1.config,
			returnPartialData = var1
		})).result or NULL
	end)
	
	if not ok then
		if instanceof(status, missingFieldError) then
			return NULL
		end
		error(status)
	end
	return status
end

function tbl:write(p1)
	local ok, status = pcall(function()
		-- upvalues: self (write), p1 (ref)
		self.txCount += 1
		
		return self.storeWriter:writeToStore(self.data, p1)
	end)
	self.txCount -= 1
	
	if self.txCount == 0 and p1.broadcast ~= false then
		self:broadcastWatches()
	end
	if not ok then
		error(status)
	end
	return status
end

function tbl:modify(p1)
	-- upvalues: hasOwn (ref)
	if hasOwn(p1, "id") and not p1.id then
		return false
	end
	local var1 = if p1.optimistic then self.optimisticData else self.data
	local ok, status = pcall(function()
		-- upvalues: self (write), var1 (write), p1 (ref)
		self.txCount += 1
		
		return var1:modify(p1.id or "ROOT_QUERY", p1.fields)
	end)
	self.txCount -= 1
	
	if self.txCount == 0 and p1.broadcast ~= false then
		self:broadcastWatches()
	end
	if not ok then
		error(status)
	end
	return status
end

function tbl:diff(p1)
	-- upvalues: object (ref)
	return self.storeReader:diffQueryAgainstStore(object.assign({}, p1, {
		store = if p1.optimistic then self.optimisticData else self.data,
		rootId = p1.id or "ROOT_QUERY",
		config = self.config
	}))
end

function tbl:watch(p1)
	-- upvalues: recallCache (ref), forgetCache (ref)
	if self.watches.size == 0 then
		recallCache(self)
	end
	self.watches:add(p1)
	
	if p1.immediate then
		self:maybeBroadcastWatch(p1)
	end
	return function()
		-- upvalues: self (write), p1 (ref), forgetCache (copy)
		if self.watches:delete(p1) and self.watches.size == 0 then
			forgetCache(self)
		end
		self.maybeBroadcastWatch:forget(p1)
	end
end

function tbl:gc(p1)
	-- upvalues: canonicalStringify (ref)
	canonicalStringify:reset()
	local var1 = self.optimisticData:gc()
	
	if p1 and self.txCount == 0 then
		if p1.resetResultCache then
			self:resetResultCache(p1.resetResultIdentities)
			
			return var1
		elseif p1.resetResultIdentities then
			self.storeReader:resetCanon()
		end
	end
	return var1
end

function tbl:retain(p1, p2)
	return if p2 then self.optimisticData:retain(p1) else self.data:retain(p1)
end

function tbl:release(p1, p2)
	return if p2 then self.optimisticData:release(p1) else self.data:release(p1)
end

function tbl:identify(p1)
	-- upvalues: isReference (ref)
	return if isReference(p1) then p1.__ref else self.policies:identify(p1)[1]
end

function tbl:evict(p1)
	-- upvalues: hasOwn (ref), object (ref)
	if not p1.id then
		if hasOwn(p1, "id") then
			return false
		end
		p1 = object.assign(table.clone(p1), { id = "ROOT_QUERY" })
	end
	local ok, status = pcall(function()
		-- upvalues: self (write), p1 (write)
		self.txCount += 1
		
		return self.optimisticData:evict(p1)
	end)
	self.txCount -= 1
	
	if self.txCount == 0 and p1.broadcast ~= false then
		self:broadcastWatches()
	end
	if not ok then
		error(status)
	end
	return status
end

function tbl:reset()
	-- upvalues: canonicalStringify (ref), promiseModule (ref)
	self:init()
	self:broadcastWatches()
	canonicalStringify:reset()
	
	return promiseModule.delay(0)
end

function tbl:removeOptimistic(p1)
	local var1 = self.optimisticData:removeLayer(p1)
	
	if var1 ~= self.optimisticData then
		self.optimisticData = var1
		self:broadcastWatches()
	end
end

function tbl:batch(p1)
	-- upvalues: set (ref), object (ref)
	local var1 = p1.optimistic == nil or p1.optimistic
	local removeOptimistic = p1.removeOptimistic
	local onWatchUpdated = p1.onWatchUpdated
	
	local function perform(p2)
		-- upvalues: self (write), p1 (ref)
		local data = self.data
		local optimisticData = self.optimisticData
		self.txCount += 1
		
		if p2 then
			self.optimisticData = p2
			self.data = self.optimisticData
		end
		local ok, status = pcall(p1.update, p1, self)
		self.txCount -= 1
		self.data = data
		self.optimisticData = optimisticData
		
		if not ok then
			error(status)
		end
	end
	
	local var2 = set.new()
	
	if onWatchUpdated and self.txCount == 0 then
		self:broadcastWatches(object.assign(table.clone(p1), {
			onWatchUpdated = function(_, p2)
				-- upvalues: var2 (ref)
				var2:add(p2)
				
				return false
			end
		}))
	end
	if typeof(var1) == "string" then
		self.optimisticData = self.optimisticData:addLayer(var1, perform)
	elseif var1 == false then
		perform(self.data)
	else
		perform()
	end
	if typeof(removeOptimistic) == "string" then
		self.optimisticData = self.optimisticData:removeLayer(removeOptimistic)
	end
	if onWatchUpdated and var2.size > 0 then
		self:broadcastWatches(object.assign(table.clone(p1), {
			onWatchUpdated = function(p2, p3, p4)
				-- upvalues: onWatchUpdated (ref), var2 (ref)
				local var3 = onWatchUpdated(p2, p3, p4)
				
				if var3 ~= false then
					var2:delete(p3)
				end
				return var3
			end
		}))
		
		if var2.size > 0 then
			var2:forEach(function(p2)
				-- upvalues: self (write)
				return self.maybeBroadcastWatch:dirty(p2)
			end)
		end
	else
		self:broadcastWatches(p1)
	end
end

function tbl:performTransaction(p1, p2)
	-- upvalues: NULL (ref)
	return self:batch({
		update = function(_, ...)
			-- upvalues: p1 (ref)
			return p1(...)
		end,
		optimistic = p2 or p2 ~= NULL
	})
end

function tbl:transformDocument(p1)
	-- upvalues: addTypenameToDocument (ref)
	if not self.addTypename then
		return p1
	end
	local var1 = self.typenameDocumentCache:get(p1)
	
	if not var1 then
		var1 = addTypenameToDocument(p1)
		self.typenameDocumentCache:set(p1, var1)
		self.typenameDocumentCache:set(var1, var1)
	end
	return var1
end

function tbl:broadcastWatches(p1)
	if self.txCount == 0 then
		self.watches:forEach(function(p2)
			-- upvalues: self (ref), p1 (ref)
			return self:maybeBroadcastWatch(p2, p1)
		end)
	end
end

function tbl:broadcastWatch(p1, p2)
	-- upvalues: equalModule (ref)
	local lastDiff = p1.lastDiff
	local var1 = self:diff({
		query = p1.query,
		variables = p1.variables,
		optimistic = p1.optimistic
	})
	
	if p2 then
		if p1.optimistic and typeof(p2.optimistic) == "string" then
			var1.fromOptimisticTransaction = true
		end
		local onWatchUpdated = p2.onWatchUpdated
		
		if onWatchUpdated and onWatchUpdated(self, p1, var1, lastDiff) == false then return end
	end
	if not lastDiff or not equalModule(lastDiff.result, var1.result) then
		p1.lastDiff = var1
		p1:callback(p1.lastDiff, lastDiff)
	end
end

t.InMemoryCache = tbl

return t