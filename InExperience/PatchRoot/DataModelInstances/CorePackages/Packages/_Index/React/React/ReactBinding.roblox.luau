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
		getValue = function(p1)
			-- upvalues: t (ref)
			return t.getValue(p1)
		end,
		map = function(p1, p2)
			-- upvalues: t (ref)
			return t.map(p1, p2)
		end
	},
	__tostring = function(p1)
		return string.format("RoactBinding(%s)", tostring(p1:getValue()))
	end
}

function t.update(p1, p2)
	-- upvalues: bindingImpl (ref)
	return p1[bindingImpl].update(p2)
end

function t.subscribe(p1, p2)
	-- upvalues: bindingImpl (ref)
	return p1[bindingImpl].subscribe(p2)
end

function t.getValue(p1)
	-- upvalues: bindingImpl (ref)
	return p1[bindingImpl]:getValue()
end

function t.create(p1)
	-- upvalues: unknownModule (ref), reactGlobalsModule (ref), reactSymbols (ref), bindingImpl (ref), t_1 (ref)
	local var1, var2 = unknownModule()
	local t = { value = p1, subscribe = var1 }
	
	function t.update(p2)
		-- upvalues: t (ref), var2 (ref)
		t.value = p2
		var2(p2)
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

function t.map(p1, p2)
	-- upvalues: reactGlobalsModule (ref), reactSymbols (ref), t (ref), bindingImpl (ref), t_1 (ref)
	if reactGlobalsModule.__DEV__ then
		assert(typeof(p1) == "table" and p1["$$typeof"] == reactSymbols.REACT_BINDING_TYPE, "Expected `self` to be a binding")
		assert(typeof(p2) == "function", "Expected arg #1 to be a function")
	end
	return setmetatable({
		["$$typeof"] = reactSymbols.REACT_BINDING_TYPE,
		[bindingImpl] = {
			subscribe = function(p3)
				-- upvalues: t (copy), p1 (ref), p2 (ref)
				return t.subscribe(p1, function(p4)
					-- upvalues: p3 (ref), p2 (copy)
					p3(p2(p4))
				end)
			end,
			update = function(_)
				error("Bindings created by Binding:map(fn) cannot be updated directly", 2)
			end,
			getValue = function()
				-- upvalues: p2 (ref), p1 (ref)
				return p2(p1:getValue())
			end
		},
		_source = if reactGlobalsModule.__DEV__ then debug.traceback("Mapped binding created at:", 3) else nil
	}, t_1)
end

function t.join(p1)
	-- upvalues: reactGlobalsModule (ref), reactSymbols (ref), t (ref), bindingImpl (ref), t_1 (ref)
	if reactGlobalsModule.__DEV__ then
		assert(typeof(p1) == "table", "Expected arg #1 to be of type table")
		
		for i, v in p1 do
			if typeof(v) ~= "table" or v["$$typeof"] ~= reactSymbols.REACT_BINDING_TYPE then
				error(("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format(tostring(i)), 2)
			end
		end
	end
	local t_2 = {}
	
	local function getValue()
		-- upvalues: p1 (ref)
		local t = {}
		
		for i, v in pairs(p1) do
			t[i] = v:getValue()
		end
		return t
	end
	
	function t_2.subscribe(p2)
		-- upvalues: p1 (ref), t (copy), getValue (ref)
		local t_1 = {}
		
		for i, v in p1 do
			t_1[i] = t.subscribe(v, function(_)
				-- upvalues: p2 (ref), getValue (copy)
				p2(getValue())
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