local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local reactSymbols = require(parent.Shared).ReactSymbols
local _ = require(parent.Shared)
local symbol = luauPolyfillModule.Symbol
local unknownModule = require(script.Parent["createSignal.roblox"])
local enableAllocationTrims = require(parent.Shared).ReactFeatureFlags.enableAllocationTrims
local var1 = symbol("BindingImpl")
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
local t_2 = {
	getValue = function(p1)
		return p1.value
	end,
	update = function(p1, p2)
		p1.value = p2
		local fire = p1.fire
		
		if fire ~= nil then
			fire(p2)
		end
	end,
	subscribe = function(p1, p2)
		-- upvalues: unknownModule (ref)
		local subscribeToSignal = p1.subscribeToSignal
		
		if subscribeToSignal == nil then
			local var2, var3 = unknownModule()
			p1.fire = var3
			subscribeToSignal = var2
			p1.subscribeToSignal = subscribeToSignal
		end
		return subscribeToSignal(p2)
	end
}
local t_3 = { __index = t_2 }

function t.update(p1, p2)
	-- upvalues: enableAllocationTrims (ref), var1 (ref), t_3 (ref), t_2 (ref)
	if not enableAllocationTrims then
		return p1[var1].update(p2)
	end
	local var2 = p1[var1]
	
	return if getmetatable(var2) == t_3 then t_2.update(var2, p2) else var2.update(p2)
end

function t.subscribe(p1, p2)
	-- upvalues: enableAllocationTrims (ref), var1 (ref), t_3 (ref), t_2 (ref)
	if not enableAllocationTrims then
		return p1[var1].subscribe(p2)
	end
	local var2 = p1[var1]
	
	return if getmetatable(var2) == t_3 then t_2.subscribe(var2, p2) else var2.subscribe(p2)
end

function t.getValue(p1)
	-- upvalues: var1 (ref)
	return p1[var1]:getValue()
end

function t.createWithoutUpdater(p1, p2)
	-- upvalues: t_3 (ref), reactSymbols (ref), var1 (ref), t_1 (ref)
	return setmetatable({
		["$$typeof"] = reactSymbols.REACT_BINDING_TYPE,
		[var1] = setmetatable({ value = p1 }, t_3),
		_source = p2
	}, t_1)
end

function t.create(p1)
	-- upvalues: enableAllocationTrims (ref), reactGlobalsModule (ref), t (ref), var1 (ref), t_2 (ref), unknownModule (ref), reactSymbols (ref), t_1 (ref)
	if enableAllocationTrims then
		local var2 = t.createWithoutUpdater(p1, if reactGlobalsModule.__DEV__ then debug.traceback("Binding created at:", 3) else nil)
		local var3 = var2[var1]
		
		return var2, function(p2)
			-- upvalues: t_2 (copy), var3 (ref)
			t_2.update(var3, p2)
		end
	end
	local var4, var5 = unknownModule()
	local t_3 = { value = p1, subscribe = var4 }
	
	function t_3.update(p2)
		-- upvalues: t_3 (ref), var5 (ref)
		t_3.value = p2
		var5(p2)
	end
	
	function t_3.getValue()
		-- upvalues: t_3 (ref)
		return t_3.value
	end
	
	return setmetatable({
		["$$typeof"] = reactSymbols.REACT_BINDING_TYPE,
		[var1] = t_3,
		_source = if reactGlobalsModule.__DEV__ then debug.traceback("Binding created at:", 3) else nil
	}, t_1), t_3.update
end

function t.map(p1, p2)
	-- upvalues: reactGlobalsModule (ref), reactSymbols (ref), t (ref), var1 (ref), t_1 (ref)
	if reactGlobalsModule.__DEV__ then
		assert(typeof(p1) == "table" and p1["$$typeof"] == reactSymbols.REACT_BINDING_TYPE, "Expected `self` to be a binding")
		assert(typeof(p2) == "function", "Expected arg #1 to be a function")
	end
	return setmetatable({
		["$$typeof"] = reactSymbols.REACT_BINDING_TYPE,
		[var1] = {
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
	-- upvalues: reactGlobalsModule (ref), reactSymbols (ref), t (ref), var1 (ref), t_1 (ref)
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
		[var1] = t_2,
		_source = if reactGlobalsModule.__DEV__ then debug.traceback("Joined binding created at:", 2) else nil
	}, t_1)
end

return t