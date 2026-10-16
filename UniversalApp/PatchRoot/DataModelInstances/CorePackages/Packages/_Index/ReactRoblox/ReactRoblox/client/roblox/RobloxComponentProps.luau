local CollectionService = game:GetService("CollectionService")
local Parent = script.Parent.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Object = LuauPolyfillModule.Object
local InspectFunction = LuauPolyfillModule.util.inspect
local DEV = require(Parent.ReactGlobals).__DEV__
local Console = require(Parent.Shared).console
local ReactModule = require(Parent.React)
local ReactSymbols = require(Parent.Shared).ReactSymbols
local SingleEventManagerModule = require(script.Parent.SingleEventManager)
local Type = require(Parent.Shared).Type
local GetDefaultInstancePropertyModule = require(script.Parent.getDefaultInstanceProperty)
local _ = require(script.Parent.Parent["ReactRobloxHostTypes.roblox"])
local Tag = require(Parent.React).Tag
local _instanceToEventManager = {}
local _instanceToBindings = {}

local function identity(...) --[[ Line: 72 ]]
	return ...
end

local function setRobloxInstanceProperty(p1, Key, p2) --[[ Line: 76 ]]
	-- upvalues: GetDefaultInstancePropertyModule (copy)
	if p2 == nil then
		local Success, _ = pcall(p1.ResetPropertyToDefault, p1, Key)
		
		if Success then return end
		local _, DefaultInstancePropertyModule2 = GetDefaultInstancePropertyModule(p1.ClassName, Key)
		p2 = DefaultInstancePropertyModule2
	end
	p1[Key] = p2
end

local function _(p1, Key) --[[ Line: 92 | Named "removeBinding" ]]
	-- upvalues: _instanceToBindings (copy)
	local InstanceToBinding = _instanceToBindings[p1]
	
	if InstanceToBinding ~= nil then
		InstanceToBinding[Key]()
		InstanceToBinding[Key] = nil
	end
end

local function attachBinding(Key, Key1, p1) --[[ Line: 101 ]]
	-- upvalues: setRobloxInstanceProperty (copy), identity (copy), Console (copy), _instanceToBindings (copy), ReactModule (copy)
	local function updateBoundProperty(p2) --[[ Line: 102 ]]
		-- upvalues: setRobloxInstanceProperty (upval), identity (upval), Key (copy), Key1 (copy), p1 (copy), Console (upval)
		local Success, Result = xpcall(setRobloxInstanceProperty, identity, Key, Key1, p2)
		
		if not Success then
			local Formatted = string.format("Error updating binding or ref assigned to key %s of '%s' (%s).\n\nUpdated value:\n  %s\n\nError:\n  %s\n\n%s\n", Key1, Key.Name, Key.ClassName, tostring(p2), Result, p1._source or "<enable DEV mode for stack>")
			Console.error(Formatted)
			error(Formatted, 0)
		end
	end
	
	if _instanceToBindings[Key] == nil then
		_instanceToBindings[Key] = {}
	end
	_instanceToBindings[Key][Key1] = ReactModule.__subscribeToBinding(p1, updateBoundProperty)
	updateBoundProperty(p1:getValue())
end

local function applyTags(Key, p1, p2) --[[ Line: 134 ]]
	-- upvalues: DEV (copy), Console (copy), InspectFunction (copy), CollectionService (copy)
	if DEV and p2 ~= nil and typeof(p2) ~= "string" then
		Console.error("Type provided for ReactRoblox.Tag is invalid - tags should be specified as a single string, with individual tags delimited by spaces. Instead received:\n%s", InspectFunction(p2))
		
		return
	end
	local t = {}
	
	for i in string.gmatch(p1 or "", "%S+") do
		t[i] = true
	end
	local t1 = {}
	
	for i1 in string.gmatch(p2 or "", "%S+") do
		t1[i1] = true
	end
	for Tag, _ in t do
		if not t1[Tag] then
			CollectionService:RemoveTag(Key, Tag)
		end
	end
	for Tag1, _ in t1 do
		if not t[Tag1] then
			CollectionService:AddTag(Key, Tag1)
		end
	end
end

local _ = function(p3) --[[ Line: 168 | Named "removeAllTags" ]]
	-- upvalues: CollectionService (copy)
	for _, tag in CollectionService:GetTags(p3) do
		CollectionService:RemoveTag(p3, tag)
	end
end

local function applyProp(Key, Key1, None, p4) --[[ Line: 174 ]]
	-- upvalues: Type (copy), _instanceToEventManager (copy), SingleEventManagerModule (copy), ReactSymbols (copy), _instanceToBindings (copy), attachBinding (copy), Tag (copy), applyTags (copy), GetDefaultInstancePropertyModule (copy)
	local OfResult = Type.of(Key1)
	
	if OfResult == Type.HostEvent or OfResult == Type.HostChangeEvent then
		local InstanceToEventManagerEntry = _instanceToEventManager[Key]
		
		if InstanceToEventManagerEntry == nil then
			InstanceToEventManagerEntry = SingleEventManagerModule.new(Key)
			_instanceToEventManager[Key] = InstanceToEventManagerEntry
		end
		local Name = Key1.name
		
		if OfResult == Type.HostChangeEvent then
			InstanceToEventManagerEntry:connectPropertyChange(Name, None)
			
			return
		else
			InstanceToEventManagerEntry:connectEvent(Name, None)
			
			return
		end
	else
		local IsTypeofMatch: boolean = typeof(None) == "table" and None["$$typeof"] == ReactSymbols.REACT_BINDING_TYPE
		
		if p4 ~= nil and (typeof(p4) == "table" and p4["$$typeof"] == ReactSymbols.REACT_BINDING_TYPE) then
			local InstanceToBinding = _instanceToBindings[Key]
			
			if InstanceToBinding ~= nil then
				InstanceToBinding[Key1]()
				InstanceToBinding[Key1] = nil
			end
		end
		if IsTypeofMatch then
			attachBinding(Key, Key1, None)
			
			return
		end
		if Key1 == Tag then
			applyTags(Key, p4, None)
			
			return
		end
		local None1 = None
		
		if None1 == nil then
			local Success, _ = pcall(Key.ResetPropertyToDefault, Key, Key1)
			
			if Success then return end
			local _, DefaultInstancePropertyModule2 = GetDefaultInstancePropertyModule(Key.ClassName, Key1)
			None1 = DefaultInstancePropertyModule2
		end
		Key[Key1] = None1
	end
end

local function applyProps(p4, List) --[[ Line: 219 ]]
	-- upvalues: applyProp (copy)
	for i, value in List do
		if i ~= "ref" and i ~= "children" then
			applyProp(p4, i, value)
		end
	end
end

local function setInitialProperties(p5, _, p6, _) --[[ Line: 230 ]]
	-- upvalues: applyProps (copy), identity (copy), Console (copy), _instanceToEventManager (copy)
	local Success, Result = xpcall(applyProps, identity, p5, p6)
	
	if not Success then
		local Formatted = string.format("Error applying initial props to Roblox Instance '%s' (%s):\n  %s\n", p5.Name, p5.ClassName, (tostring(Result)))
		Console.error(Formatted)
		error(Formatted, 0)
	end
	if _instanceToEventManager[p5] ~= nil then
		_instanceToEventManager[p5]:resume()
	end
end

local function safelyApplyProperties(p5, p6, p7) --[[ Line: 259 ]]
	-- upvalues: Object (copy), applyProp (copy)
	for i = 1, #p6, 2 do
		local Key = p6[i]
		local None = p6[i + 1]
		
		if None == Object.None then
			None = nil
		end
		if Key ~= "ref" and Key ~= "children" then
			applyProp(p5, Key, None, p7[Key])
		end
	end
end

local function updateProperties(p8, p9, p10) --[[ Line: 278 ]]
	-- upvalues: _instanceToEventManager (copy), safelyApplyProperties (copy), identity (copy), Console (copy)
	if _instanceToEventManager[p8] ~= nil then
		_instanceToEventManager[p8]:suspend()
	end
	local Success, Result = xpcall(safelyApplyProperties, identity, p8, p9, p10)
	
	if not Success then
		local Formatted = string.format("Error updating props on Roblox Instance '%s' (%s):\n  %s\n", p8.Name, p8.ClassName, Result)
		Console.error(Formatted)
		error(Formatted, 0)
	end
	if _instanceToEventManager[p8] ~= nil then
		_instanceToEventManager[p8]:resume()
	end
end

local _, Result = xpcall(function() --[[ Line: 312 ]]
	return game:DefineFastFlag("ReactFixBindingMemoryLeak", false)
end, function(): boolean --[[ Line: 314 ]]
	return true
end)

local _ = function(Key) --[[ Line: 318 | Named "cleanupBindings" ]]
	-- upvalues: _instanceToBindings (copy)
	local InstanceToBinding = _instanceToBindings[Key]
	
	if InstanceToBinding ~= nil then
		for _, value in InstanceToBinding do
			value()
		end
		_instanceToBindings[Key] = nil
	end
end

return {
	setInitialProperties = setInitialProperties,
	updateProperties = updateProperties,
	cleanupHostComponent = function(Key) --[[ Line: 331 ]]
		-- upvalues: _instanceToEventManager (copy), Result (copy), _instanceToBindings (copy), CollectionService (copy)
		if _instanceToEventManager[Key] ~= nil then
			_instanceToEventManager[Key] = nil
		end
		if Result then
			local InstanceToBinding = _instanceToBindings[Key]
			
			if InstanceToBinding ~= nil then
				for _, value in InstanceToBinding do
					value()
				end
				_instanceToBindings[Key] = nil
			end
		elseif _instanceToBindings[Key] ~= nil then
			_instanceToBindings[Key] = nil
		end
		if typeof(Key) ~= "Instance" then return end
		for _, tag in CollectionService:GetTags(Key) do
			CollectionService:RemoveTag(Key, tag)
		end
		for _, descendant in Key:GetDescendants() do
			if _instanceToEventManager[descendant] ~= nil then
				_instanceToEventManager[descendant] = nil
			end
			if Result then
				local InstanceToBinding = _instanceToBindings[descendant]
				
				if InstanceToBinding ~= nil then
					for _, value1 in InstanceToBinding do
						value1()
					end
					_instanceToBindings[descendant] = nil
				end
			elseif _instanceToBindings[descendant] ~= nil then
				_instanceToBindings[descendant] = nil
			end
			for _, tag1 in CollectionService:GetTags(Key) do
				CollectionService:RemoveTag(Key, tag1)
			end
		end
	end,
	_instanceToEventManager = _instanceToEventManager,
	_instanceToBindings = _instanceToBindings
}