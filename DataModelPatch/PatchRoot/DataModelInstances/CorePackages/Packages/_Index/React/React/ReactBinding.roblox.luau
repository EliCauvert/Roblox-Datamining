local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local ReactSymbols = require(Parent.Shared).ReactSymbols
local _ = require(Parent.Shared)
local CreateSignalRobloxModule = require(script.Parent["createSignal.roblox"])
local BindingImpl = require(Parent.LuauPolyfill).Symbol("BindingImpl")
local ReactBindingModule = {}
local config = {
	__index = {
		getValue = function(p1)
			-- upvalues: ReactBindingModule (copy)
			return ReactBindingModule.getValue(p1)
		end,
		map = function(p1, p2)
			-- upvalues: ReactBindingModule (copy)
			return ReactBindingModule.map(p1, p2)
		end
	},
	__tostring = function(p1): string
		return string.format("RoactBinding(%s)", (tostring(p1:getValue())))
	end
}

function ReactBindingModule.update(p1, p2)
	-- upvalues: BindingImpl (copy)
	return p1[BindingImpl].update(p2)
end

function ReactBindingModule.subscribe(p1, p2)
	-- upvalues: BindingImpl (copy)
	return p1[BindingImpl].subscribe(p2)
end

function ReactBindingModule.getValue(p1)
	-- upvalues: BindingImpl (copy)
	return p1[BindingImpl]:getValue()
end

function ReactBindingModule.create(Value)
	-- upvalues: CreateSignalRobloxModule (copy), ReactGlobalsModule (copy), ReactSymbols (copy), BindingImpl (copy), config (copy)
	local SignalRobloxModule, SignalRobloxModule2 = CreateSignalRobloxModule()
	local config1 = { value = Value, subscribe = SignalRobloxModule }
	
	function config1.update(Value)
		-- upvalues: config1 (copy), SignalRobloxModule2 (copy)
		config1.value = Value
		SignalRobloxModule2(Value)
	end
	
	function config1.getValue()
		-- upvalues: config1 (copy)
		return config1.value
	end
	
	return setmetatable({
		["$$typeof"] = ReactSymbols.REACT_BINDING_TYPE,
		[BindingImpl] = config1,
		_source = if ReactGlobalsModule.__DEV__ then debug.traceback("Binding created at:", 3) else nil
	}, config), config1.update
end

function ReactBindingModule.map(p1, Callback)
	-- upvalues: ReactGlobalsModule (copy), ReactSymbols (copy), ReactBindingModule (copy), BindingImpl (copy), config (copy)
	if ReactGlobalsModule.__DEV__ then
		assert(typeof(p1) == "table" and p1["$$typeof"] == ReactSymbols.REACT_BINDING_TYPE, "Expected `self` to be a binding")
		assert(typeof(Callback) == "function", "Expected arg #1 to be a function")
	end
	return (setmetatable({
		["$$typeof"] = ReactSymbols.REACT_BINDING_TYPE,
		[BindingImpl] = {
			subscribe = function(Callback1)
				-- upvalues: ReactBindingModule (upval), p1 (copy), Callback (copy)
				return ReactBindingModule.subscribe(p1, function(p2)
					-- upvalues: Callback1 (copy), Callback (upval)
					Callback1(Callback(p2))
				end)
			end,
			update = function(_)
				error("Bindings created by Binding:map(fn) cannot be updated directly", 2)
			end,
			getValue = function()
				-- upvalues: Callback (copy), p1 (copy)
				return Callback(p1:getValue())
			end
		},
		_source = if ReactGlobalsModule.__DEV__ then debug.traceback("Mapped binding created at:", 3) else nil
	}, config))
end

function ReactBindingModule.join(List)
	-- upvalues: ReactGlobalsModule (copy), ReactSymbols (copy), ReactBindingModule (copy), BindingImpl (copy), config (copy)
	if ReactGlobalsModule.__DEV__ then
		assert(typeof(List) == "table", "Expected arg #1 to be of type table")
		
		for i, value in List do
			if typeof(value) ~= "table" or value["$$typeof"] ~= ReactSymbols.REACT_BINDING_TYPE then
				error(("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format((tostring(i))), 2)
			end
		end
	end
	local function getValue()
		-- upvalues: List (copy)
		local t = {}
		
		for i, value in pairs(List) do
			t[i] = value:getValue()
		end
		return t
	end
	
	return (setmetatable({
		["$$typeof"] = ReactSymbols.REACT_BINDING_TYPE,
		[BindingImpl] = {
			subscribe = function(Callback)
				-- upvalues: List (copy), ReactBindingModule (upval), getValue (copy)
				local SubscribeResults = {}
				
				for i, value in List do
					SubscribeResults[i] = ReactBindingModule.subscribe(value, function(_)
						-- upvalues: Callback (copy), getValue (upval)
						Callback((getValue()))
					end)
				end
				return function()
					-- upvalues: SubscribeResults (ref)
					if SubscribeResults == nil then return end
					for _, subscribeResult in SubscribeResults do
						subscribeResult()
					end
					SubscribeResults = nil
				end
			end,
			update = function(_)
				error("Bindings created by joinBindings(...) cannot be updated directly", 2)
			end,
			getValue = function()
				-- upvalues: getValue (copy)
				return (getValue())
			end
		},
		_source = if ReactGlobalsModule.__DEV__ then debug.traceback("Joined binding created at:", 2) else nil
	}, config))
end

return ReactBindingModule