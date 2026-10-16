_G.LUAUFORGE_SENTRY_DEBUG_IDS = _G.LUAUFORGE_SENTRY_DEBUG_IDS or {}
local DebugInfo = debug.info(1, "s")

if DebugInfo and type(DebugInfo) == "string" then
	_G.LUAUFORGE_SENTRY_DEBUG_IDS[DebugInfo] = "2f8270c2-4143-5a1a-bcbf-683c30125946"
end
local _ = _G.LUAUFORGE_SENTRY_DEBUG_IDS
_G.ENVIRONMENT = "PRODUCTION"
_ = "apps/UniversalApp/build/app/bootstrap.luau"
local v1 = nil
v1 = {
	cache = {},
	load = function(p1) --[[ Line: 11 ]]
		-- upvalues: v1 (ref)
		if not v1.cache[p1] then
			v1.cache[p1] = { c = v1[p1]() }
		end
		return v1.cache[p1].c
	end,
	b = function() --[[ Line: 18 ]]
		return {}
	end,
	c = function() --[[ Line: 44 ]]
		return {
			chunkMounted = function(OnChunkMounted, ChunkName, LoadingMs) --[[ Line: 55 ]]
				if OnChunkMounted ~= nil then
					pcall(OnChunkMounted, table.freeze({ chunkName = ChunkName, loadingMs = LoadingMs }))
				end
			end,
			chunkError = function(OnChunkError, ChunkName, p1, LoadingMs) --[[ Line: 67 ]]
				if OnChunkError ~= nil then
					pcall(OnChunkError, table.freeze({ chunkName = ChunkName, loadingMs = LoadingMs, error = p1 }))
				end
			end,
			moduleLoaded = function(OnModuleLoaded, ChunkName, ModuleId, LoadingMs) --[[ Line: 80 ]]
				if OnModuleLoaded ~= nil then
					pcall(OnModuleLoaded, table.freeze({
						chunkName = ChunkName,
						moduleId = ModuleId,
						loadingMs = LoadingMs
					}))
				end
			end,
			moduleError = function(OnModuleError, ChunkName, ModuleId, p1, LoadingMs) --[[ Line: 93 ]]
				if OnModuleError ~= nil then
					pcall(OnModuleError, table.freeze({
						chunkName = ChunkName,
						moduleId = ModuleId,
						loadingMs = LoadingMs,
						error = p1
					}))
				end
			end
		}
	end
}

function v1.a() --[[ Line: 121 ]]
	-- upvalues: v1 (ref)
	local _ = v1.load("b")
	local C = v1.load("c")
	
	local function newSlot() --[[ Line: 156 ]]
		return {
			state = "loading",
			value = nil,
			error = nil,
			waiters = {},
			loadingThread = coroutine.running()
		}
	end
	
	local Frozen = table.freeze({})
	
	local function wakeWaiters(Tbl) --[[ Line: 168 ]]
		-- upvalues: Frozen (copy)
		local Frozen1 = table.freeze(Tbl.waiters)
		Tbl.waiters = Frozen
		table.freeze(Tbl)
		
		for _, value in Frozen1 do
			coroutine.resume(value)
		end
	end
	
	local function waitForSlot(Slot, ChunkName) --[[ Line: 182 ]]
		if Slot.state == "ready" then
			return Slot.value
		end
		if Slot.state == "errored" then
			error(Slot.error)
		elseif Slot.loadingThread == coroutine.running() then
			error(`circular require: {ChunkName}`)
		elseif not coroutine.isyieldable() then
			error("cannot yield from non-yieldable coroutine")
		end
		table.insert(Slot.waiters, coroutine.running())
		coroutine.yield()
		
		if Slot.state == "ready" then
			return Slot.value
		end
		if Slot.state == "errored" then
			error(Slot.error)
		end
		error(`unexpected slot state: {Slot.state}`)
	end
	
	local function fillSlot(Slot, p1) --[[ Line: 209 ]]
		-- upvalues: wakeWaiters (copy)
		local ClockTime = os.clock()
		local Success, Result = pcall(p1)
		local Elapsed = os.clock() - ClockTime
		Slot.loadingThread = nil
		
		if Success then
			Slot.state = "ready"
			Slot.value = Result
		else
			Slot.state = "errored"
			Slot.error = Result
		end
		wakeWaiters(Slot)
		
		return Success, Result, Elapsed * 1000
	end
	
	return {
		createContainer = function(p1) --[[ Line: 225 ]]
			-- upvalues: waitForSlot (copy), newSlot (copy), fillSlot (copy), C (copy)
			local t = {}
			
			local function _(p2) --[[ Line: 229 | Named "makeChunkLoadModule" ]]
				-- upvalues: waitForSlot (upval), newSlot (upval), fillSlot (upval), C (upval), p1 (copy)
				local t = {}
				
				return function(ModuleId, p3) --[[ Line: 231 ]]
					-- upvalues: t (copy), waitForSlot (upval), p2 (copy), newSlot (upval), fillSlot (upval), C (upval), p1 (upval)
					local v2 = t[ModuleId]
					
					if v2 then
						return waitForSlot(v2, `{p2}:{ModuleId}`)
					end
					local v3 = newSlot()
					t[ModuleId] = v3
					local v4, v5, LoadingMs = fillSlot(v3, p3)
					
					if v4 then
						C.moduleLoaded(p1.onModuleLoaded, p2, ModuleId, LoadingMs)
						
						return v5
					else
						C.moduleError(p1.onModuleError, p2, ModuleId, v5, LoadingMs)
						error(v5)
					end
				end
			end
			
			local function resolveChunk(ChunkName) --[[ Line: 249 ]]
				-- upvalues: t (copy), waitForSlot (upval), newSlot (upval), fillSlot (upval), p1 (copy), resolveChunk (copy), C (upval)
				local Entry = t[ChunkName]
				
				if Entry then
					return waitForSlot(Entry, `chunk {ChunkName}`)
				end
				local Slot = newSlot()
				t[ChunkName] = Slot
				local FillSlotResult, FillSlotResult2, FillSlotResult3 = fillSlot(Slot, function() --[[ Line: 256 ]]
					-- upvalues: p1 (upval), ChunkName (copy), resolveChunk (upval), waitForSlot (upval), newSlot (upval), fillSlot (upval), C (upval)
					local t = {}
					
					return p1.loadChunk(ChunkName).mount(table.freeze({
						resolveChunk = resolveChunk,
						loadModule = function(ModuleId, p2) --[[ Line: 231 ]]
							-- upvalues: t (copy), waitForSlot (upval), ChunkName (copy), newSlot (upval), fillSlot (upval), C (upval), p1 (upval)
							local v2 = t[ModuleId]
							
							if v2 then
								return waitForSlot(v2, `{ChunkName}:{ModuleId}`)
							end
							local v3 = newSlot()
							t[ModuleId] = v3
							local v4, v5, LoadingMs = fillSlot(v3, p2)
							
							if v4 then
								C.moduleLoaded(p1.onModuleLoaded, ChunkName, ModuleId, LoadingMs)
								
								return v5
							else
								C.moduleError(p1.onModuleError, ChunkName, ModuleId, v5, LoadingMs)
								error(v5)
							end
						end
					}))
				end)
				
				if FillSlotResult then
					C.chunkMounted(p1.onChunkMounted, ChunkName, FillSlotResult3)
					
					return FillSlotResult2
				else
					C.chunkError(p1.onChunkError, ChunkName, FillSlotResult2, FillSlotResult3)
					error(FillSlotResult2)
				end
			end
			
			return table.freeze({
				resolveChunk = resolveChunk,
				preloadChunk = function(ChunkName, p2) --[[ Line: 272 ]]
					-- upvalues: resolveChunk (copy)
					coroutine.resume((coroutine.create(function() --[[ Line: 273 ]]
						-- upvalues: resolveChunk (upval), ChunkName (copy), p2 (copy)
						local ResolveChunkResult = resolveChunk(ChunkName)
						
						if p2 then
							ResolveChunkResult.loadModule(p2)
						end
					end)))
				end
			})
		end
	}
end

local LuaAppLoadChunksFallbackToEmbedded = game:DefineFastFlag("LuaAppLoadChunksFallbackToEmbedded", false)

if game:DefineFastFlag("LuaAppLoadChunksFromManifest", false) then
	local InsertService = game:GetService("InsertService")
	local TelemetryService = game:GetService("TelemetryService")
	local Frozen = table.freeze({
		eventName = "LuauForgeChunkError",
		throttlingPercentage = 10000,
		description = "Fired when a LuauForge container chunk fails to mount.",
		backends = { "EventIngest" },
		lastUpdated = { 2026, 8, 24 }
	})
	local Frozen1 = table.freeze({
		eventName = "LuauForgeModuleError",
		throttlingPercentage = 10000,
		description = "Fired when a module factory inside a LuauForge chunk errors.",
		backends = { "EventIngest" },
		lastUpdated = { 2026, 8, 24 }
	})
	
	local function onChunkError(p1) --[[ Line: 321 ]]
		-- upvalues: TelemetryService (copy), Frozen (copy)
		TelemetryService:LogEvent(Frozen, {
			customFields = {
				chunkName = p1.chunkName,
				loadingMs = p1.loadingMs,
				error = tostring(p1.error)
			}
		})
	end
	
	local function _() --[[ Line: 342 | Named "getContentManifest" ]]
		return require("@game/CorePackages/LuauForgeContentManifest")
	end
	
	local function resolveEmbeddedChunk(ChunkName) --[[ Line: 346 ]]
		return require(`@game/CorePackages/LuauForgeChunks/{ChunkName}`)
	end
	
	local function unpackChunk(AssetWithBytecodeAsync) --[[ Line: 350 ]]
		local Bundle = AssetWithBytecodeAsync:FindFirstChild("bundle")
		
		if Bundle == nil or not Bundle:IsA("ModuleScript") then
			error("Chunk is not a ModuleScript named bundle")
			
			return
		else
			return require(Bundle)
		end
	end
	
	local function resolveContentChunk(LuauForgeContentManifestModuleEntry) --[[ Line: 359 ]]
		-- upvalues: InsertService (copy), unpackChunk (copy)
		return unpackChunk((InsertService:LoadAssetWithBytecodeAsync(LuauForgeContentManifestModuleEntry)))
	end
	
	v1.load("a").createContainer(table.freeze({
		loadChunk = function(ChunkName) --[[ Line: 364 ]]
			-- upvalues: LuaAppLoadChunksFallbackToEmbedded (copy), resolveContentChunk (copy), onChunkError (copy), resolveEmbeddedChunk (copy)
			print(`Loading chunk {ChunkName}`)
			local LuauForgeContentManifestModuleEntry = require("@game/CorePackages/LuauForgeContentManifest")[ChunkName]
			
			if LuauForgeContentManifestModuleEntry ~= nil then
				print(`Loading content chunk {LuauForgeContentManifestModuleEntry}`)
				
				if not LuaAppLoadChunksFallbackToEmbedded then
					return resolveContentChunk(LuauForgeContentManifestModuleEntry)
				end
				local ClockTime = os.clock()
				local Success, Result = pcall(resolveContentChunk, LuauForgeContentManifestModuleEntry)
				
				if Success then
					return Result
				end
				onChunkError({
					chunkName = ChunkName,
					loadingMs = (os.clock() - ClockTime) * 1000,
					error = Result
				})
			end
			print(`Loading embedded chunk {ChunkName}`)
			
			return resolveEmbeddedChunk(ChunkName)
		end,
		onChunkError = onChunkError,
		onModuleError = function(p1) --[[ Line: 331 ]]
			-- upvalues: TelemetryService (copy), Frozen1 (copy)
			TelemetryService:LogEvent(Frozen1, {
				customFields = {
					chunkName = p1.chunkName,
					moduleId = p1.moduleId,
					loadingMs = p1.loadingMs,
					error = tostring(p1.error)
				}
			})
		end
	})).resolveChunk("bundled").loadModule("LUAUFORGE_MAIN")
else
	local _ = function(_) --[[ Line: 396 | Named "createModuleLoader" ]]
		local t = {}
		
		return function(Key, Callback) --[[ Line: 398 | Named "loadModule" ]]
			-- upvalues: t (copy)
			local v2 = t[Key]
			
			if v2 == nil then
				local CallbackResult = Callback()
				t[Key] = { c = CallbackResult }
				
				return CallbackResult
			else
				return v2.c
			end
		end
	end
	
	local _ = function(Callback) --[[ Line: 410 | Named "createChunkLoader" ]]
		local MountResults = {}
		
		local function resolveChunk(Key) --[[ Line: 412 ]]
			-- upvalues: MountResults (copy), Callback (copy), resolveChunk (copy)
			local MountResult = MountResults[Key]
			
			if MountResult then
				return MountResult
			else
				local t = {}
				local MountResult1 = Callback(Key).mount(table.freeze({
					resolveChunk = resolveChunk,
					loadModule = function(Key, Callback) --[[ Line: 398 ]]
						-- upvalues: t (copy)
						local v2 = t[Key]
						
						if v2 == nil then
							local CallbackResult = Callback()
							t[Key] = { c = CallbackResult }
							
							return CallbackResult
						else
							return v2.c
						end
					end
				}))
				MountResults[Key] = MountResult1
				
				return MountResult1
			end
		end
		
		return resolveChunk
	end
	
	local function requireChunk(p1) --[[ Line: 428 ]]
		return require(`@game/CorePackages/LuauForgeChunks/{p1}`)
	end
	
	local MountResults = {}
	
	local function resolveChunk(Key) --[[ Line: 412 ]]
		-- upvalues: MountResults (copy), requireChunk (copy), resolveChunk (copy)
		local MountResult = MountResults[Key]
		
		if MountResult then
			return MountResult
		else
			local t = {}
			local MountResult1 = requireChunk(Key).mount(table.freeze({
				resolveChunk = resolveChunk,
				loadModule = function(Key, Callback) --[[ Line: 398 ]]
					-- upvalues: t (copy)
					local v2 = t[Key]
					
					if v2 == nil then
						local CallbackResult = Callback()
						t[Key] = { c = CallbackResult }
						
						return CallbackResult
					else
						return v2.c
					end
				end
			}))
			MountResults[Key] = MountResult1
			
			return MountResult1
		end
	end
	
	resolveChunk("bundled").loadModule("LUAUFORGE_MAIN")
end