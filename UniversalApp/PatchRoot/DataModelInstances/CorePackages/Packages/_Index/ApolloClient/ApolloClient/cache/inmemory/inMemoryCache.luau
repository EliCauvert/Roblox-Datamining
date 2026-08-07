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

function tbl.new(p0) --[[ line: 199 ]]
	-- upvalues: apolloCache (ref), tbl (ref), set (ref), map (ref), makeVar (ref), object (ref), t_1 (ref), policies (ref)
	local tbl_1 = setmetatable(apolloCache.new(), tbl)
	
	if p0 == nil then
		p0 = {}
	end
	tbl_1.watches = set.new()
	tbl_1.typenameDocumentCache = map.new(nil)
	tbl_1.makeVar = makeVar
	tbl_1.txCount = 0
	tbl_1.config = object.assign({}, t_1, p0)
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

function tbl:init() --[[ line: 227 ]]
	-- upvalues: entityStoreRoot (ref)
	self.data = entityStoreRoot.new({
		policies = self.policies,
		resultCaching = self.config.resultCaching
	})
	self.optimisticData = self.data.stump
	self:resetResultCache()
end

function tbl:resetResultCache(p1) --[[ line: 247 ]]
	-- upvalues: storeReader (ref), storeWriter (ref), wrap (ref), supportsResultCaching (ref), canonicalStringify (ref), set (ref)
	local storeReader_1 = self.storeReader
	self.storeReader = storeReader.new({
		cache = self,
		addTypename = self.addTypename,
		resultCacheMaxSize = self.config.resultCacheMaxSize,
		canon = if p1 then nil elseif storeReader_1 then storeReader_1.canon else nil
	})
	self.storeWriter = storeWriter.new(self, self.storeReader)
	self.maybeBroadcastWatch = wrap(function(_, p2, p3) --[[ line: 264 ]]
		-- upvalues: self (write)
		return self:broadcastWatch(p2, p3)
	end, {
		max = self.config.resultCacheMaxSize,
		makeCacheKey = function(_, p4) --[[ line: 268 ]]
			-- upvalues: self (write), supportsResultCaching (copy), canonicalStringify (copy)
			local var11 = if p4.optimistic then self.optimisticData else self.data
			
			if supportsResultCaching(var11) then
				return var11:makeCacheKey(p4.query, p4.callback, canonicalStringify({
					optimistic = p4.optimistic,
					rootId = p4.rootId,
					variables = p4.variables
				}))
			end
		end
	}, self)
	set.new({ self.data.group, self.optimisticData.group }):forEach(function(p5) --[[ line: 304 ]]
		return p5:resetCaching()
	end)
end

function tbl:restore(p6) --[[ line: 309 ]]
	self:init()
	
	if p6 then
		self.data:replace(p6)
	end
	return self
end

function tbl:extract(p7) --[[ line: 322 ]]
	if p7 == nil then
		p7 = false
	end
	return if p7 then self.optimisticData:extract() else self.data:extract()
end

function tbl.read(p8, p9) --[[ line: 334 ]]
	-- upvalues: object (ref), NULL (ref), instanceof (ref), missingFieldError (ref)
	local var12 = if p9.returnPartialData == nil then false else p9.returnPartialData
	local ok, status = pcall(function() --[[ line: 349 ]]
		-- upvalues: p8 (ref), object (copy), p9 (ref), var12 (write), NULL (copy)
		return p8.storeReader:diffQueryAgainstStore(object.assign({}, p9, {
			store = if p9.optimistic then p8.optimisticData else p8.data,
			config = p8.config,
			returnPartialData = var12
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

function tbl:write(p10) --[[ line: 374 ]]
	local ok, status = pcall(function() --[[ line: 376 ]]
		-- upvalues: self (write), p10 (ref)
		self.txCount += 1
		
		return self.storeWriter:writeToStore(self.data, p10)
	end)
	self.txCount -= 1
	
	if self.txCount == 0 and p10.broadcast ~= false then
		self:broadcastWatches()
	end
	if not ok then
		error(status)
	end
	return status
end

function tbl:modify(p11) --[[ line: 394 ]]
	-- upvalues: hasOwn (ref)
	if hasOwn(p11, "id") and not p11.id then
		return false
	end
	local var13 = if p11.optimistic then self.optimisticData else self.data
	local ok, status = pcall(function() --[[ line: 419 ]]
		-- upvalues: self (write), var13 (write), p11 (ref)
		self.txCount += 1
		
		return var13:modify(p11.id or "ROOT_QUERY", p11.fields)
	end)
	self.txCount -= 1
	
	if self.txCount == 0 and p11.broadcast ~= false then
		self:broadcastWatches()
	end
	if not ok then
		error(status)
	end
	return status
end

function tbl:diff(p12) --[[ line: 439 ]]
	-- upvalues: object (ref)
	return self.storeReader:diffQueryAgainstStore(object.assign({}, p12, {
		store = if p12.optimistic then self.optimisticData else self.data,
		rootId = p12.id or "ROOT_QUERY",
		config = self.config
	}))
end

function tbl:watch(p13) --[[ line: 449 ]]
	-- upvalues: recallCache (ref), forgetCache (ref)
	if self.watches.size == 0 then
		recallCache(self)
	end
	self.watches:add(p13)
	
	if p13.immediate then
		self:maybeBroadcastWatch(p13)
	end
	return function() --[[ line: 470 ]]
		-- upvalues: self (write), p13 (ref), forgetCache (copy)
		if self.watches:delete(p13) and self.watches.size == 0 then
			forgetCache(self)
		end
		self.maybeBroadcastWatch:forget(p13)
	end
end

function tbl:gc(p14) --[[ line: 486 ]]
	-- upvalues: canonicalStringify (ref)
	canonicalStringify:reset()
	local var14 = self.optimisticData:gc()
	
	if p14 and self.txCount == 0 then
		if p14.resetResultCache then
			self:resetResultCache(p14.resetResultIdentities)
			
			return var14
		elseif p14.resetResultIdentities then
			self.storeReader:resetCanon()
		end
	end
	return var14
end

function tbl:retain(p15, p16) --[[ line: 518 ]]
	return if p16 then self.optimisticData:retain(p15) else self.data:retain(p15)
end

function tbl:release(p17, p18) --[[ line: 533 ]]
	return if p18 then self.optimisticData:release(p17) else self.data:release(p17)
end

function tbl:identify(p19) --[[ line: 549 ]]
	-- upvalues: isReference (ref)
	return if isReference(p19) then p19.__ref else self.policies:identify(p19)[1]
end

function tbl:evict(p20) --[[ line: 557 ]]
	-- upvalues: hasOwn (ref), object (ref)
	if not p20.id then
		if hasOwn(p20, "id") then
			return false
		end
		p20 = object.assign(table.clone(p20), { id = "ROOT_QUERY" })
	end
	local ok, status = pcall(function() --[[ line: 572 ]]
		-- upvalues: self (write), p20 (write)
		self.txCount += 1
		
		return self.optimisticData:evict(p20)
	end)
	self.txCount -= 1
	
	if self.txCount == 0 and p20.broadcast ~= false then
		self:broadcastWatches()
	end
	if not ok then
		error(status)
	end
	return status
end

function tbl:reset() --[[ line: 594 ]]
	-- upvalues: canonicalStringify (ref), promiseModule (ref)
	self:init()
	self:broadcastWatches()
	canonicalStringify:reset()
	
	return promiseModule.delay(0)
end

function tbl:removeOptimistic(p21) --[[ line: 601 ]]
	local var15 = self.optimisticData:removeLayer(p21)
	
	if var15 ~= self.optimisticData then
		self.optimisticData = var15
		self:broadcastWatches()
	end
end

function tbl:batch(p22) --[[ line: 609 ]]
	-- upvalues: set (ref), object (ref)
	local var16 = p22.optimistic == nil or p22.optimistic
	local removeOptimistic = p22.removeOptimistic
	local onWatchUpdated = p22.onWatchUpdated
	
	local function perform(p23) --[[ line: 614 ]]
		-- upvalues: self (write), p22 (ref)
		local data = self.data
		local optimisticData = self.optimisticData
		self.txCount += 1
		
		if p23 then
			self.optimisticData = p23
			self.data = self.optimisticData
		end
		local ok, status = pcall(p22.update, p22, self)
		self.txCount -= 1
		self.data = data
		self.optimisticData = optimisticData
		
		if not ok then
			error(status)
		end
	end
	
	local var18 = set.new()
	
	if onWatchUpdated and self.txCount == 0 then
		self:broadcastWatches(object.assign(table.clone(p22), {
			onWatchUpdated = function(_, p24) --[[ line: 651 ]]
				-- upvalues: var18 (ref)
				var18:add(p24)
				
				return false
			end
		}))
	end
	if typeof(var16) == "string" then
		self.optimisticData = self.optimisticData:addLayer(var16, perform)
	elseif var16 == false then
		perform(self.data)
	else
		perform()
	end
	if typeof(removeOptimistic) == "string" then
		self.optimisticData = self.optimisticData:removeLayer(removeOptimistic)
	end
	if onWatchUpdated and var18.size > 0 then
		self:broadcastWatches(object.assign(table.clone(p22), {
			onWatchUpdated = function(p25, p26, p27) --[[ line: 687 ]]
				-- upvalues: onWatchUpdated (ref), var18 (ref)
				local var19 = onWatchUpdated(p25, p26, p27)
				
				if var19 ~= false then
					var18:delete(p26)
				end
				return var19
			end
		}))
		
		if var18.size > 0 then
			var18:forEach(function(p28) --[[ line: 703 ]]
				-- upvalues: self (write)
				return self.maybeBroadcastWatch:dirty(p28)
			end)
		end
	else
		self:broadcastWatches(p22)
	end
end

function tbl:performTransaction(p29, p30) --[[ line: 724 ]]
	-- upvalues: NULL (ref)
	return self:batch({
		update = function(_, ...) --[[ line: 727 ]]
			-- upvalues: p29 (ref)
			return p29(...)
		end,
		optimistic = p30 or p30 ~= NULL
	})
end

function tbl:transformDocument(p31) --[[ line: 736 ]]
	-- upvalues: addTypenameToDocument (ref)
	if not self.addTypename then
		return p31
	end
	local var20 = self.typenameDocumentCache:get(p31)
	
	if not var20 then
		var20 = addTypenameToDocument(p31)
		self.typenameDocumentCache:set(p31, var20)
		self.typenameDocumentCache:set(var20, var20)
	end
	return var20
end

function tbl:broadcastWatches(p32) --[[ line: 752 ]]
	if self.txCount == 0 then
		self.watches:forEach(function(p33) --[[ line: 755 ]]
			-- upvalues: self (ref), p32 (ref)
			return self:maybeBroadcastWatch(p33, p32)
		end)
	end
end

function tbl:broadcastWatch(p34, p35) --[[ line: 767 ]]
	-- upvalues: equalModule (ref)
	local lastDiff = p34.lastDiff
	local var21 = self:diff({
		query = p34.query,
		variables = p34.variables,
		optimistic = p34.optimistic
	})
	
	if p35 then
		if p34.optimistic and typeof(p35.optimistic) == "string" then
			var21.fromOptimisticTransaction = true
		end
		local onWatchUpdated = p35.onWatchUpdated
		
		if onWatchUpdated and onWatchUpdated(self, p34, var21, lastDiff) == false then return end
	end
	if not lastDiff or not equalModule(lastDiff.result, var21.result) then
		p34.lastDiff = var21
		p34:callback(p34.lastDiff, lastDiff)
	end
end

t.InMemoryCache = tbl

return t