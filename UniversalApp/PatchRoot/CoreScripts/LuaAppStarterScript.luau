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
	load = function(p1)
		-- upvalues: t (write)
		if not t.cache[p1] then
			t.cache[p1] = { c = t[p1]() }
		end
		return t.cache[p1].c
	end
}

local function _(_)
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
		-- upvalues: t (ref), p2 (ref), resolveChunk (ref)
		local var1 = t[p2]
		
		if var1 then
			return var1
		end
		local mount = p2(p2).mount
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