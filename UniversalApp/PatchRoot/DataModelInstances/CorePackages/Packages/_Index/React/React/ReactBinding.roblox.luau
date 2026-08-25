local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local reactSymbols = require(parent.Shared).ReactSymbols
local _ = require(parent.Shared)
local unknownModule = require(script.Parent["createSignal.roblox"])
local bindingImpl = luauPolyfillModule.Symbol("BindingImpl")
local t = {}
local t_1 = {
	__index = {
		getValue = function(p0)
			-- upvalues: t (ref)
			return t.getValue(p0)
		end,
		map = function(p1, p2)
			-- upvalues: t (ref)
			return t.map(p1, p2)
		end
	},
	__tostring = function(p3)
		return string.format("RoactBinding(%s)", tostring(p3:getValue()))
	end
}

function t.update(p4, p5)
	-- upvalues: bindingImpl (ref)
	return p4[bindingImpl].update(p5)
end

function t.subscribe(p6, p7)
	-- upvalues: bindingImpl (ref)
	return p6[bindingImpl].subscribe(p7)
end

function t.getValue(p8)
	-- upvalues: bindingImpl (ref)
	return p8[bindingImpl]:getValue()
end

function t.create(p9)
	-- upvalues: unknownModule (ref), reactGlobalsModule (ref), reactSymbols (ref), bindingImpl (ref), t_1 (ref)
	local var6, var7 = unknownModule()
	local t = { value = p9, subscribe = var6 }
	
	function t.update(p10)
		-- upvalues: t (ref), var7 (ref)
		t.value = p10
		var7(p10)
	end
	
	function t.getValue()
		-- upvalues: t (ref)
		return t.value
	end
	
	return setmetatable({
		["$$typeof"] = reactSymbols.REACT_BINDING_TYPE,
		[bindingImpl] = t,
		_source = if reactGlobalsModule.__DEV__ then debug.traceback("Binding created at:", 3) else nil
	}, t_1), t.update
end

function t.map(p11, p12)
	-- upvalues: reactGlobalsModule (ref), reactSymbols (ref), t (ref), bindingImpl (ref), t_1 (ref)
	if reactGlobalsModule.__DEV__ then
		assert(typeof(p11) == "table" and p11["$$typeof"] == reactSymbols.REACT_BINDING_TYPE, "Expected `self` to be a binding")
		assert(typeof(p12) == "function", "Expected arg #1 to be a function")
	end
	return setmetatable({
		["$$typeof"] = reactSymbols.REACT_BINDING_TYPE,
		[bindingImpl] = {
			subscribe = function(p13)
				-- upvalues: t (copy), p11 (ref), p12 (ref)
				return t.subscribe(p11, function(p14)
					-- upvalues: p13 (ref), p12 (copy)
					p13(p12(p14))
				end)
			end,
			update = function(_)
				error("Bindings created by Binding:map(fn) cannot be updated directly", 2)
			end,
			getValue = function()
				-- upvalues: p12 (ref), p11 (ref)
				return p12(p11:getValue())
			end
		},
		_source = if reactGlobalsModule.__DEV__ then debug.traceback("Mapped binding created at:", 3) else nil
	}, t_1)
end

function t.join(p15)
	-- upvalues: reactGlobalsModule (ref), reactSymbols (ref), t (ref), bindingImpl (ref), t_1 (ref)
	if reactGlobalsModule.__DEV__ then
		assert(typeof(p15) == "table", "Expected arg #1 to be of type table")
		
		for i, v in p15 do
			if typeof(v) ~= "table" or v["$$typeof"] ~= reactSymbols.REACT_BINDING_TYPE then
				error(("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format(tostring(i)), 2)
			end
		end
	end
	local t_2 = {}
	
	local function getValue()
		-- upvalues: p15 (ref)
		local t = {}
		
		for i, v in pairs(p15) do
			t[i] = v:getValue()
		end
		return t
	end
	
	function t_2.subscribe(p16)
		-- upvalues: p15 (ref), t (copy), getValue (ref)
		local t_1 = {}
		
		for i, v in p15 do
			t_1[i] = t.subscribe(v, function(_)
				-- upvalues: p16 (ref), getValue (copy)
				p16(getValue())
			end)
		end
		return function()
			-- upvalues: t_1 (write)
			if t_1 == nil then return end
			for i, v in t_1 do
				v()
			end
			t_1 = nil
		end
	end
	
	function t_2.update(_)
		error("Bindings created by joinBindings(...) cannot be updated directly", 2)
	end
	
	function t_2.getValue()
		-- upvalues: getValue (ref)
		return getValue()
	end
	
	return setmetatable({
		["$$typeof"] = reactSymbols.REACT_BINDING_TYPE,
		[bindingImpl] = t_2,
		_source = if reactGlobalsModule.__DEV__ then debug.traceback("Joined binding created at:", 2) else nil
	}, t_1)
end

return t