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
	load = function(p0)
		-- upvalues: t (write)
		if not t.cache[p0] then
			t.cache[p0] = { c = t[p0]() }
		end
		return t.cache[p0].c
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
			chunkError = function(p4, p5, p6, p7)
				if p4 ~= nil then
					pcall(p4, table.freeze({ chunkName = p5, loadingMs = p7, error = p6 }))
				end
			end,
			moduleLoaded = function(p8, p9, p10, p11)
				if p8 ~= nil then
					pcall(p8, table.freeze({ chunkName = p9, moduleId = p10, loadingMs = p11 }))
				end
			end,
			moduleError = function(p12, p13, p14, p15, p16)
				if p12 ~= nil then
					pcall(p12, table.freeze({
						chunkName = p13,
						moduleId = p14,
						loadingMs = p16,
						error = p15
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
	
	local function wakeWaiters(p17)
		-- upvalues: frozen (ref)
		local frozen_1 = table.freeze(p17.waiters)
		p17.waiters = frozen
		table.freeze(p17)
		
		for i, v in frozen_1 do
			coroutine.resume(v)
		end
	end
	
	local function waitForSlot(p18, p19)
		if p18.state == "ready" then
			return p18.value
		elseif p18.state == "errored" then
			error(p18.error)
		elseif p18.loadingThread == coroutine.running() then
			error(`circular require: {p19}`)
		elseif not coroutine.isyieldable() then
			error("cannot yield from non-yieldable coroutine")
		end
		table.insert(p18.waiters, coroutine.running())
		coroutine.yield()
		
		if p18.state == "ready" then
			return p18.value
		elseif p18.state == "errored" then
			error(p18.error)
		end
		error(`unexpected slot state: {p18.state}`)
	end
	
	local function fillSlot(p20, p21)
		-- upvalues: wakeWaiters (ref)
		local processTime = os.clock()
		local ok, status = pcall(p21)
		local var24 = os.clock() - processTime
		p20.loadingThread = nil
		
		if ok then
			p20.state = "ready"
			p20.value = status
		else
			p20.state = "errored"
			p20.error = status
		end
		wakeWaiters(p20)
		
		return ok, status, var24 * 1000
	end
	
	return {
		createContainer = function(p22)
			-- upvalues: waitForSlot (ref), newSlot (ref), fillSlot (ref), c (ref)
			local t = {}
			
			local function _(p23)
				-- upvalues: waitForSlot (copy), newSlot (copy), fillSlot (copy), c (copy), p22 (ref)
				local t = {}
				
				return function(p24, p25)
					-- upvalues: t (ref), waitForSlot (copy), p23 (ref), newSlot (copy), fillSlot (copy), c (copy), p22 (copy)
					local var28 = t[p24]
					
					if var28 then
						return waitForSlot(var28, `{p23}:{p24}`)
					end
					local var29 = newSlot()
					t[p24] = var29
					var29, var30, var31 = fillSlot(var29, p25)
					
					if var29 then
						c.moduleLoaded(p22.onModuleLoaded, p23, p24, var31)
						
						return var30
					end
					c.moduleError(p22.onModuleError, p23, p24, var30, var31)
					error(var30)
				end
			end
			
			local function resolveChunk(p26)
				-- upvalues: t (ref), waitForSlot (copy), newSlot (copy), fillSlot (copy), p22 (ref), resolveChunk (ref), c (copy)
				local var32 = t[p26]
				
				if var32 then
					return waitForSlot(var32, `chunk {p26}`)
				end
				local var33 = newSlot()
				t[p26] = var33
				var33, var34, var35 = fillSlot(var33, function()
					-- upvalues: p22 (copy), p26 (ref), resolveChunk (copy), waitForSlot (copy), newSlot (copy), fillSlot (copy), c (copy)
					local mount = p22.loadChunk(p26).mount
					local freeze = table.freeze
					local t = { resolveChunk = resolveChunk }
					local t_1 = {}
					
					function t.loadModule(p27, p28)
						-- upvalues: t_1 (ref), waitForSlot (copy), p26 (ref), newSlot (copy), fillSlot (copy), c (copy), p22 (copy)
						local var28 = t_1[p27]
						
						if var28 then
							return waitForSlot(var28, `{p26}:{p27}`)
						end
						local var29 = newSlot()
						t_1[p27] = var29
						var29, var30, var31 = fillSlot(var29, p28)
						
						if var29 then
							c.moduleLoaded(p22.onModuleLoaded, p26, p27, var31)
							
							return var30
						end
						c.moduleError(p22.onModuleError, p26, p27, var30, var31)
						error(var30)
					end
					
					return mount(freeze(t))
				end)
				
				if var33 then
					c.chunkMounted(p22.onChunkMounted, p26, var35)
					
					return var34
				end
				c.chunkError(p22.onChunkError, p26, var34, var35)
				error(var34)
			end
			
			return table.freeze({
				resolveChunk = resolveChunk,
				preloadChunk = function(p29, p30)
					-- upvalues: resolveChunk (ref)
					coroutine.resume(coroutine.create(function()
						-- upvalues: resolveChunk (copy), p29 (ref), p30 (ref)
						local var38 = resolveChunk(p29)
						
						if p30 then
							var38.loadModule(p30)
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
	
	local function onChunkError(p31)
		-- upvalues: telemetryService (ref), frozen (ref)
		telemetryService:LogEvent(frozen, {
			customFields = {
				chunkName = p31.chunkName,
				loadingMs = p31.loadingMs,
				error = tostring(p31.error)
			}
		})
	end
	
	local function onModuleError(p32)
		-- upvalues: telemetryService (ref), frozen_1 (ref)
		telemetryService:LogEvent(frozen_1, {
			customFields = {
				chunkName = p32.chunkName,
				moduleId = p32.moduleId,
				loadingMs = p32.loadingMs,
				error = tostring(p32.error)
			}
		})
	end
	
	local function _()
		return require("@game/CorePackages/LuauForgeContentManifest")
	end
	
	local function resolveEmbeddedChunk(p33)
		return require(`@game/CorePackages/LuauForgeChunks/{p33}`)
	end
	
	local function unpackChunk(p34)
		local bundle = p34:FindFirstChild("bundle")
		
		if bundle == nil or not bundle:IsA("ModuleScript") then
			error("Chunk is not a ModuleScript named bundle")
			
			return
		end
		return require(bundle)
	end
	
	local function resolveContentChunk(p35)
		-- upvalues: insertService (ref), unpackChunk (ref)
		return unpackChunk(insertService:LoadAssetWithBytecodeAsync(p35))
	end
	
	a.createContainer(table.freeze({
		loadChunk = function(p36)
			-- upvalues: luaAppLoadChunksFallbackToEmbedded (ref), resolveContentChunk (ref), onChunkError (ref), resolveEmbeddedChunk (ref)
			print(`Loading chunk {p36}`)
			local var40 = require("@game/CorePackages/LuauForgeContentManifest")[p36]
			
			if var40 ~= nil then
				print(`Loading content chunk {var40}`)
				
				if not luaAppLoadChunksFallbackToEmbedded then
					return resolveContentChunk(var40)
				end
				local processTime = os.clock()
				local ok, status = pcall(resolveContentChunk, var40)
				
				if ok then
					return status
				end
				onChunkError({
					chunkName = p36,
					loadingMs = (os.clock() - processTime) * 1000,
					error = status
				})
			end
			print(`Loading embedded chunk {p36}`)
			
			return resolveEmbeddedChunk(p36)
		end,
		onChunkError = onChunkError,
		onModuleError = onModuleError
	})).resolveChunk("bundled").loadModule("LUAUFORGE_MAIN")
else
	local _ = function(_)
		local t = {}
		
		return function(p37, p38)
			-- upvalues: t (ref)
			local var43 = t[p37]
			
			if var43 == nil then
				local var44 = p38()
				t[p37] = { c = var44 }
				
				return var44
			end
			return var43.c
		end
	end
	
	local _ = function(p39)
		local t = {}
		
		local function resolveChunk(p40)
			-- upvalues: t (ref), p39 (ref), resolveChunk (ref)
			local var47 = t[p40]
			
			if var47 then
				return var47
			end
			local mount = p39(p40).mount
			local freeze = table.freeze
			local t_1 = { resolveChunk = resolveChunk }
			local t_2 = {}
			
			function t_1.loadModule(p41, p42)
				-- upvalues: t_2 (ref)
				local var43 = t_2[p41]
				
				if var43 == nil then
					local var44 = p42()
					t_2[p41] = { c = var44 }
					
					return var44
				end
				return var43.c
			end
			
			mount = mount(freeze(t_1))
			t[p40] = mount
			
			return mount
		end
		
		return resolveChunk
	end
	
	local function requireChunk(p43)
		return require(`@game/CorePackages/LuauForgeChunks/{p43}`)
	end
	
	local t_1 = {}
	
	local function resolveChunk(p44)
		-- upvalues: t_1 (ref), requireChunk (ref), resolveChunk (ref)
		local var47 = t_1[p44]
		
		if var47 then
			return var47
		end
		local mount = requireChunk(p44).mount
		local freeze = table.freeze
		local t_1 = { resolveChunk = resolveChunk }
		local t_2 = {}
		
		function t_1.loadModule(p45, p46)
			-- upvalues: t_2 (ref)
			local var43 = t_2[p45]
			
			if var43 == nil then
				local var44 = p46()
				t_2[p45] = { c = var44 }
				
				return var44
			end
			return var43.c
		end
		
		mount = mount(freeze(t_1))
		t_1[p44] = mount
		
		return mount
	end
	
	resolveChunk("bundled").loadModule("LUAUFORGE_MAIN")
end