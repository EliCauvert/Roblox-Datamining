local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local ReactSymbols = require(Parent.Shared).ReactSymbols
local _ = require(Parent.Shared)
local CreateSignalRobloxModule = require(script.Parent["createSignal.roblox"])
local EnableAllocationTrims = require(Parent.Shared).ReactFeatureFlags.enableAllocationTrims
local BindingImpl = require(Parent.LuauPolyfill).Symbol("BindingImpl")
local ReactBindingModule = {}
local config = {
	__index = {
		getValue = function(p1) --[[ Line: 50 ]]
			-- upvalues: ReactBindingModule (copy)
			return ReactBindingModule.getValue(p1)
		end,
		map = function(p1, p2) --[[ Line: 54 ]]
			-- upvalues: ReactBindingModule (copy)
			return ReactBindingModule.map(p1, p2)
		end
	},
	__tostring = function(p1): string --[[ Line: 63 ]]
		return string.format("RoactBinding(%s)", (tostring(p1:getValue())))
	end
}
local config1 = {
	getValue = function(p1) --[[ Line: 73 ]]
		return p1.value
	end,
	update = function(p1, Value) --[[ Line: 77 ]]
		p1.value = Value
		local FireFunction: (any) -> () = p1.fire
		
		if FireFunction ~= nil then
			FireFunction(Value)
		end
	end,
	subscribe = function(p1, p2) --[[ Line: 85 ]]
		-- upvalues: CreateSignalRobloxModule (copy)
		local SubscribeToSignalFunction = p1.subscribeToSignal
		
		if SubscribeToSignalFunction == nil then
			local SignalRobloxModule, SignalRobloxModule2 = CreateSignalRobloxModule()
			p1.fire = SignalRobloxModule2
			SubscribeToSignalFunction = SignalRobloxModule
			p1.subscribeToSignal = SubscribeToSignalFunction
		end
		return SubscribeToSignalFunction(p2)
	end
}
local config2 = { __index = config1 }

function ReactBindingModule.update(p1, p2) --[[ Line: 96 ]]
	-- upvalues: EnableAllocationTrims (copy), BindingImpl (copy), config2 (copy), config1 (copy)
	if EnableAllocationTrims then
		local v1 = p1[BindingImpl]
		
		return if getmetatable(v1) == config2 then config1.update(v1, p2) else v1.update(p2)
	else
		return p1[BindingImpl].update(p2)
	end
end

function ReactBindingModule.subscribe(p1, p2) --[[ Line: 108 ]]
	-- upvalues: EnableAllocationTrims (copy), BindingImpl (copy), config2 (copy), config1 (copy)
	if EnableAllocationTrims then
		local v1 = p1[BindingImpl]
		
		return if getmetatable(v1) == config2 then config1.subscribe(v1, p2) else v1.subscribe(p2)
	else
		return p1[BindingImpl].subscribe(p2)
	end
end

function ReactBindingModule.getValue(p1) --[[ Line: 120 ]]
	-- upvalues: BindingImpl (copy)
	return p1[BindingImpl]:getValue()
end

function ReactBindingModule.createWithoutUpdater(Value, _source) --[[ Line: 126 ]]
	-- upvalues: config2 (copy), ReactSymbols (copy), BindingImpl (copy), config (copy)
	return (setmetatable({
		["$$typeof"] = ReactSymbols.REACT_BINDING_TYPE,
		[BindingImpl] = setmetatable({ value = Value }, config2),
		_source = _source
	}, config))
end

function ReactBindingModule.create(Value) --[[ Line: 141 ]]
	-- upvalues: EnableAllocationTrims (copy), ReactGlobalsModule (copy), ReactBindingModule (copy), BindingImpl (copy), config1 (copy), CreateSignalRobloxModule (copy), ReactSymbols (copy), config (copy)
	if EnableAllocationTrims then
		local WithoutUpdater = ReactBindingModule.createWithoutUpdater(Value, if ReactGlobalsModule.__DEV__ then debug.traceback("Binding created at:", 3) else nil)
		local WithoutUpdaterEntry = WithoutUpdater[BindingImpl]
		
		return WithoutUpdater, function(p1) --[[ Line: 151 ]]
			-- upvalues: config1 (upval), WithoutUpdaterEntry (copy)
			config1.update(WithoutUpdaterEntry, p1)
		end
	else
		local SignalRobloxModule, SignalRobloxModule2 = CreateSignalRobloxModule()
		local config2 = { value = Value, subscribe = SignalRobloxModule }
		
		function config2.update(Value) --[[ Line: 162 ]]
			-- upvalues: config2 (copy), SignalRobloxModule2 (copy)
			config2.value = Value
			SignalRobloxModule2(Value)
		end
		
		function config2.getValue() --[[ Line: 167 ]]
			-- upvalues: config2 (copy)
			return config2.value
		end
		
		return setmetatable({
			["$$typeof"] = ReactSymbols.REACT_BINDING_TYPE,
			[BindingImpl] = config2,
			_source = if ReactGlobalsModule.__DEV__ then debug.traceback("Binding created at:", 3) else nil
		}, config), config2.update
	end
end

function ReactBindingModule.map(p1, Callback) --[[ Line: 185 ]]
	-- upvalues: ReactGlobalsModule (copy), ReactSymbols (copy), ReactBindingModule (copy), BindingImpl (copy), config (copy)
	if ReactGlobalsModule.__DEV__ then
		assert(typeof(p1) == "table" and p1["$$typeof"] == ReactSymbols.REACT_BINDING_TYPE, "Expected `self` to be a binding")
		assert(typeof(Callback) == "function", "Expected arg #1 to be a function")
	end
	return (setmetatable({
		["$$typeof"] = ReactSymbols.REACT_BINDING_TYPE,
		[BindingImpl] = {
			subscribe = function(Callback1) --[[ Line: 201 ]]
				-- upvalues: ReactBindingModule (upval), p1 (copy), Callback (copy)
				return ReactBindingModule.subscribe(p1, function(p2) --[[ Line: 202 ]]
					-- upvalues: Callback1 (copy), Callback (upval)
					Callback1(Callback(p2))
				end)
			end,
			update = function(_) --[[ Line: 207 ]]
				error("Bindings created by Binding:map(fn) cannot be updated directly", 2)
			end,
			getValue = function() --[[ Line: 211 ]]
				-- upvalues: Callback (copy), p1 (copy)
				return Callback(p1:getValue())
			end
		},
		_source = if ReactGlobalsModule.__DEV__ then debug.traceback("Mapped binding created at:", 3) else nil
	}, config))
end

function ReactBindingModule.join(List) --[[ Line: 232 ]]
	-- upvalues: ReactGlobalsModule (copy), ReactSymbols (copy), ReactBindingModule (copy), BindingImpl (copy), config (copy)
	if ReactGlobalsModule.__DEV__ then
		assert(typeof(List) == "table", "Expected arg #1 to be of type table")
		
		for i, value in List do
			if typeof(value) ~= "table" or value["$$typeof"] ~= ReactSymbols.REACT_BINDING_TYPE then
				error(("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format((tostring(i))), 2)
			end
		end
	end
	local function getValue() --[[ Line: 253 ]]
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
			subscribe = function(Callback) --[[ Line: 264 ]]
				-- upvalues: List (copy), ReactBindingModule (upval), getValue (copy)
				local SubscribeResults = {}
				
				for i, value in List do
					SubscribeResults[i] = ReactBindingModule.subscribe(value, function(_) --[[ Line: 269 ]]
						-- upvalues: Callback (copy), getValue (upval)
						Callback((getValue()))
					end)
				end
				return function() --[[ Line: 274 ]]
					-- upvalues: SubscribeResults (ref)
					if SubscribeResults == nil then return end
					for _, subscribeResult in SubscribeResults do
						subscribeResult()
					end
					SubscribeResults = nil
				end
			end,
			update = function(_) --[[ Line: 287 ]]
				error("Bindings created by joinBindings(...) cannot be updated directly", 2)
			end,
			getValue = function() --[[ Line: 291 ]]
				-- upvalues: getValue (copy)
				return (getValue())
			end
		},
		_source = if ReactGlobalsModule.__DEV__ then debug.traceback("Joined binding created at:", 2) else nil
	}, config))
end

return ReactBindingModule