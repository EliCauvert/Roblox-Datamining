-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:12 2026 Pacific Standard Time.

_G.LUAUFORGE_SENTRY_DEBUG_IDS = _G.LUAUFORGE_SENTRY_DEBUG_IDS or {}
local debugInfo = debug.info(1, "s")

if debugInfo and type(debugInfo) == "string" then
	_G.LUAUFORGE_SENTRY_DEBUG_IDS[debugInfo] = "88877336-86b9-58e9-9c2b-1044656acec3"
end
local _ = _G.LUAUFORGE_SENTRY_DEBUG_IDS
_G.IS_PRODUCTION = true
_ = "apps/UniversalApp/build/app/bootstrap.luau"
local t = nil
t = {
	cache = {},
	load = function(p0) --[[ line: 11 ]]
		-- upvalues: t (write)
		if not t.cache[p0] then
			t.cache[p0] = { c = t[p0]() }
		end
		return t.cache[p0].c
	end
}

local function _(_) --[[ line: 21 | named "createModuleLoader" ]]
	local t = {}
	
	return function(p1, p2) --[[ line: 23 | named "loadModule" ]]
		-- upvalues: t (ref)
		local var6 = t[p1]
		
		if var6 == nil then
			local var7 = p2()
			t[p1] = { c = var7 }
			
			return var7
		end
		return var6.c
	end
end

local _ = function(p3) --[[ line: 35 | named "createChunkLoader" ]]
	local t = {}
	
	local function resolveChunk(p4) --[[ line: 37 ]]
		-- upvalues: t (ref), p3 (ref), resolveChunk (ref)
		local var10 = t[p4]
		
		if var10 then
			return var10
		end
		local mount = p3(p4).mount
		local freeze = table.freeze
		local t_1 = { resolveChunk = resolveChunk }
		local t_2 = {}
		
		function t_1.loadModule(p5, p6) --[[ line: 23 ]]
			-- upvalues: t_2 (ref)
			local var6 = t_2[p5]
			
			if var6 == nil then
				local var7 = p6()
				t_2[p5] = { c = var7 }
				
				return var7
			end
			return var6.c
		end
		
		mount = mount(freeze(t_1))
		t[p4] = mount
		
		return mount
	end
	
	return resolveChunk
end

local function requireChunk(p7) --[[ line: 53 ]]
	return require(`@game/CorePackages/LuauForgeChunks/{p7}`)
end

local t_1 = {}

local function resolveChunk(p8) --[[ line: 37 ]]
	-- upvalues: t_1 (ref), requireChunk (ref), resolveChunk (ref)
	local var10 = t_1[p8]
	
	if var10 then
		return var10
	end
	local mount = requireChunk(p8).mount
	local freeze = table.freeze
	local t_1 = { resolveChunk = resolveChunk }
	local t_2 = {}
	
	function t_1.loadModule(p9, p10) --[[ line: 23 ]]
		-- upvalues: t_2 (ref)
		local var6 = t_2[p9]
		
		if var6 == nil then
			local var7 = p10()
			t_2[p9] = { c = var7 }
			
			return var7
		end
		return var6.c
	end
	
	mount = mount(freeze(t_1))
	t_1[p8] = mount
	
	return mount
end

resolveChunk("bundled").loadModule("LUAUFORGE_MAIN")