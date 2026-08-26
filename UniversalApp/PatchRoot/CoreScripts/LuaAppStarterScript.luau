_G.LUAUFORGE_SENTRY_DEBUG_IDS = _G.LUAUFORGE_SENTRY_DEBUG_IDS or {}
local debugInfo = debug.info(1, "s")

if debugInfo and type(debugInfo) == "string" then
	_G.LUAUFORGE_SENTRY_DEBUG_IDS[debugInfo] = "3cbc27f1-415e-5264-bad7-f2b30e40c0aa"
end
local _ = _G.LUAUFORGE_SENTRY_DEBUG_IDS
_G.IS_PRODUCTION = true
_ = "apps/UniversalApp/build/app/bootstrap.luau"
local t = nil
t = {
	cache = {},
	load = function(p1)
		-- upvalues: t (write)
		if not t.cache[p1] then
			t.cache[p1] = { c = t[p1]() }
		end
		return t.cache[p1].c
	end,
	b = function()
		return {}
	end,
	c = function()
		return {
			chunkMounted = function(p1, p2, p3)
				if p1 ~= nil then
					pcall(p1, table.freeze({ chunkName = p2, loadingMs = p3 }))
				end
			end,
			chunkError = function(p1, p2, p3, p4)
				if p1 ~= nil then
					pcall(p1, table.freeze({ chunkName = p2, loadingMs = p4, error = p3 }))
				end
			end,
			moduleLoaded = function(p1, p2, p3, p4)
				if p1 ~= nil then
					pcall(p1, table.freeze({ chunkName = p2, moduleId = p3, loadingMs = p4 }))
				end
			end,
			moduleError = function(p1, p2, p3, p4, p5)
				if p1 ~= nil then
					pcall(p1, table.freeze({
						chunkName = p2,
						moduleId = p3,
						loadingMs = p5,
						error = p4
					}))
				end
			end
		}
	end
}

function t.LuaAppLoadChunksFallbackToEmbedded()
	-- upvalues: t (write)
	local _ = t.load("b")
	local c = t.load("c")
	
	local function newSlot()
		return {
			state = "loading",
			value = nil,
			error = nil,
			waiters = {},
			loadingThread = coroutine.running()
		}
	end
	
	local frozen = table.freeze({})
	
	local function wakeWaiters(p1)
		-- upvalues: frozen (ref)
		local frozen_1 = table.freeze(p1.waiters)
		p1.waiters = frozen
		table.freeze(p1)
		
		for i, v in frozen_1 do
			coroutine.resume(v)
		end
	end
	
	local function waitForSlot(p2, p3)
		if p2.state == "ready" then
			return p2.value
		elseif p2.state == "errored" then
			error(p2.error)
		elseif p2.loadingThread == coroutine.running() then
			error(`circular require: {p3}`)
		elseif not coroutine.isyieldable() then
			error("cannot yield from non-yieldable coroutine")
		end
		table.insert(p2.waiters, coroutine.running())
		coroutine.yield()
		
		if p2.state == "ready" then
			return p2.value
		elseif p2.state == "errored" then
			error(p2.error)
		end
		error(`unexpected slot state: {p2.state}`)
	end
	
	local function fillSlot(p2, p3)
		-- upvalues: wakeWaiters (ref)
		local processTime = os.clock()
		local ok, status = pcall(p3)
		local var1 = os.clock() - processTime
		p2.loadingThread = nil
		
		if ok then
			p2.state = "ready"
			p2.value = status
		else
			p2.state = "errored"
			p2.error = status
		end
		wakeWaiters(p2)
		
		return ok, status, var1 * 1000
	end
	
	return {
		createContainer = function(p2)
			-- upvalues: waitForSlot (ref), newSlot (ref), fillSlot (ref), c (ref)
			local t = {}
			
			local function _(p3)
				-- upvalues: waitForSlot (copy), newSlot (copy), fillSlot (copy), c (copy), p2 (ref)
				local t = {}
				
				return function(p4, p5)
					-- upvalues: t (ref), waitForSlot (copy), p3 (ref), newSlot (copy), fillSlot (copy), c (copy), p2 (copy)
					local var1 = t[p4]
					
					if var1 then
						return waitForSlot(var1, `{p3}:{p4}`)
					end
					local var2 = newSlot()
					t[p4] = var2
					var2, var30, var31 = fillSlot(var2, p5)
					
					if var2 then
						c.moduleLoaded(p2.onModuleLoaded, p3, p4, var31)
						
						return var30
					end
					c.moduleError(p2.onModuleError, p3, p4, var30, var31)
					error(var30)
				end
			end
			
			local function resolveChunk(p3)
				-- upvalues: t (ref), waitForSlot (copy), newSlot (copy), fillSlot (copy), p2 (ref), resolveChunk (ref), c (copy)
				local var1 = t[p3]
				
				if var1 then
					return waitForSlot(var1, `chunk {p3}`)
				end
				local var2 = newSlot()
				t[p3] = var2
				var2, var34, var35 = fillSlot(var2, function()
					-- upvalues: p2 (copy), p3 (ref), resolveChunk (copy), waitForSlot (copy), newSlot (copy), fillSlot (copy), c (copy)
					local mount = p2.loadChunk(p3).mount
					local freeze = table.freeze
					local t = { resolveChunk = resolveChunk }
					local t_1 = {}
					
					function t.loadModule(p4, p5)
						-- upvalues: t_1 (ref), waitForSlot (copy), p3 (ref), newSlot (copy), fillSlot (copy), c (copy), p2 (copy)
						local var3 = t_1[p4]
						
						if var3 then
							return waitForSlot(var3, `{p3}:{p4}`)
						end
						local var4 = newSlot()
						t_1[p4] = var4
						var4, var30, var31 = fillSlot(var4, p5)
						
						if var4 then
							c.moduleLoaded(p2.onModuleLoaded, p3, p4, var31)
							
							return var30
						end
						c.moduleError(p2.onModuleError, p3, p4, var30, var31)
						error(var30)
					end
					
					return mount(freeze(t))
				end)
				
				if var2 then
					c.chunkMounted(p2.onChunkMounted, p3, var35)
					
					return var34
				end
				c.chunkError(p2.onChunkError, p3, var34, var35)
				error(var34)
			end
			
			return table.freeze({
				resolveChunk = resolveChunk,
				preloadChunk = function(p3, p4)
					-- upvalues: resolveChunk (ref)
					coroutine.resume(coroutine.create(function()
						-- upvalues: resolveChunk (copy), p3 (ref), p4 (ref)
						local var1 = resolveChunk(p3)
						
						if p4 then
							var1.loadModule(p4)
						end
					end))
				end
			})
		end
	}
end

local luaAppLoadChunksFallbackToEmbedded = game:DefineFastFlag("LuaAppLoadChunksFallbackToEmbedded", false)

if game:DefineFastFlag("LuaAppLoadChunksFromManifest", false) then
	local a = t.load("a")
	local insertService = game:GetService("InsertService")
	local telemetryService = game:GetService("TelemetryService")
	local frozen = table.freeze({
		eventName = "LuauForgeChunkError",
		throttlingPercentage = 10000,
		description = "Fired when a LuauForge container chunk fails to mount.",
		backends = { "EventIngest" },
		lastUpdated = { 2026, 8, 24 }
	})
	local frozen_1 = table.freeze({
		eventName = "LuauForgeModuleError",
		throttlingPercentage = 10000,
		description = "Fired when a module factory inside a LuauForge chunk errors.",
		backends = { "EventIngest" },
		lastUpdated = { 2026, 8, 24 }
	})
	
	local function onChunkError(p1)
		-- upvalues: telemetryService (ref), frozen (ref)
		telemetryService:LogEvent(frozen, {
			customFields = {
				chunkName = p1.chunkName,
				loadingMs = p1.loadingMs,
				error = tostring(p1.error)
			}
		})
	end
	
	local function onModuleError(p1)
		-- upvalues: telemetryService (ref), frozen_1 (ref)
		telemetryService:LogEvent(frozen_1, {
			customFields = {
				chunkName = p1.chunkName,
				moduleId = p1.moduleId,
				loadingMs = p1.loadingMs,
				error = tostring(p1.error)
			}
		})
	end
	
	local function _()
		return require("@game/CorePackages/LuauForgeContentManifest")
	end
	
	local function resolveEmbeddedChunk(p1)
		return require(`@game/CorePackages/LuauForgeChunks/{p1}`)
	end
	
	local function unpackChunk(p1)
		local bundle = p1:FindFirstChild("bundle")
		
		if bundle == nil or not bundle:IsA("ModuleScript") then
			error("Chunk is not a ModuleScript named bundle")
			
			return
		end
		return require(bundle)
	end
	
	local function resolveContentChunk(p1)
		-- upvalues: insertService (ref), unpackChunk (ref)
		return unpackChunk(insertService:LoadAssetWithBytecodeAsync(p1))
	end
	
	a.createContainer(table.freeze({
		loadChunk = function(p1)
			-- upvalues: luaAppLoadChunksFallbackToEmbedded (ref), resolveContentChunk (ref), onChunkError (ref), resolveEmbeddedChunk (ref)
			print(`Loading chunk {p1}`)
			local var1 = require("@game/CorePackages/LuauForgeContentManifest")[p1]
			
			if var1 ~= nil then
				print(`Loading content chunk {var1}`)
				
				if not luaAppLoadChunksFallbackToEmbedded then
					return resolveContentChunk(var1)
				end
				local processTime = os.clock()
				local ok, status = pcall(resolveContentChunk, var1)
				
				if ok then
					return status
				end
				onChunkError({
					chunkName = p1,
					loadingMs = (os.clock() - processTime) * 1000,
					error = status
				})
			end
			print(`Loading embedded chunk {p1}`)
			
			return resolveEmbeddedChunk(p1)
		end,
		onChunkError = onChunkError,
		onModuleError = onModuleError
	})).resolveChunk("bundled").loadModule("LUAUFORGE_MAIN")
else
	local _ = function(_)
		local t = {}
		
		return function(p1, p2)
			-- upvalues: t (ref)
			local var1 = t[p1]
			
			if var1 == nil then
				local var2 = p2()
				t[p1] = { c = var2 }
				
				return var2
			end
			return var1.c
		end
	end
	
	local _ = function(p1)
		local t = {}
		
		local function resolveChunk(p2)
			-- upvalues: t (ref), p1 (ref), resolveChunk (ref)
			local var1 = t[p2]
			
			if var1 then
				return var1
			end
			local mount = p1(p2).mount
			local freeze = table.freeze
			local t_1 = { resolveChunk = resolveChunk }
			local t_2 = {}
			
			function t_1.loadModule(p3, p4)
				-- upvalues: t_2 (ref)
				local var2 = t_2[p3]
				
				if var2 == nil then
					local var3 = p4()
					t_2[p3] = { c = var3 }
					
					return var3
				end
				return var2.c
			end
			
			mount = mount(freeze(t_1))
			t[p2] = mount
			
			return mount
		end
		
		return resolveChunk
	end
	
	local function requireChunk(p1)
		return require(`@game/CorePackages/LuauForgeChunks/{p1}`)
	end
	
	local t_1 = {}
	
	local function resolveChunk(p1)
		-- upvalues: t_1 (ref), requireChunk (ref), resolveChunk (ref)
		local var1 = t_1[p1]
		
		if var1 then
			return var1
		end
		local mount = requireChunk(p1).mount
		local freeze = table.freeze
		local t_1 = { resolveChunk = resolveChunk }
		local t_2 = {}
		
		function t_1.loadModule(p2, p3)
			-- upvalues: t_2 (ref)
			local var2 = t_2[p2]
			
			if var2 == nil then
				local var3 = p3()
				t_2[p2] = { c = var3 }
				
				return var3
			end
			return var2.c
		end
		
		mount = mount(freeze(t_1))
		t_1[p1] = mount
		
		return mount
	end
	
	resolveChunk("bundled").loadModule("LUAUFORGE_MAIN")
end