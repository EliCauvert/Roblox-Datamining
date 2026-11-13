--!native

local WeakModule = require("../weak")
local DiagnosticsModule = require("../diagnostics")
local DynamicModule = require("../dynamic")
local HostModule = require("../host")
local NodesModule = require("../ownership/nodes")
local NodeModule = require("../reactive/node")
local CellModule = require("../reactive/cell")
local State = require("../reactive/evaluation").stats.state
local OwnerModule = require("../ownership/owner")
local _ = require("../reactive/types")
local WatchModule = require("../reactive/watch")
local FreezeFunction = table.freeze
local CreateFunction = table.create
local t = {}
local t1 = {}

local function event(Name)
	-- upvalues: t (copy), FreezeFunction (copy)
	local Entry = t[Name]
	
	if Entry == nil then
		local config = { composeKey = "event", name = Name }
		FreezeFunction(config)
		t[Name] = config
		
		return config
	else
		return Entry
	end
end

local function property(Name)
	-- upvalues: t1 (copy), FreezeFunction (copy)
	local Entry = t1[Name]
	
	if Entry == nil then
		local config = { composeKey = "property", name = Name }
		FreezeFunction(config)
		t1[Name] = config
		
		return config
	else
		return Entry
	end
end

local function group(List)
	-- upvalues: CreateFunction (copy), FreezeFunction (copy)
	if #List == 0 then
		error("group needs at least one property name", 2)
	end
	local CreateResult = CreateFunction(#List)
	
	for i, value in List do
		if type(value) ~= "string" then
			error(("group names must be strings; entry %d is %s"):format(i, (typeof(value))), 2)
		end
		CreateResult[i] = value
	end
	FreezeFunction(CreateResult)
	local config = { composeKey = "group", names = CreateResult }
	FreezeFunction(config)
	
	return config
end

local function static(Value)
	-- upvalues: FreezeFunction (copy)
	local config = { composeValue = "static", value = Value }
	FreezeFunction(config)
	
	return config
end

local function readKey(Key)
	-- upvalues: DynamicModule (copy)
	if type(Key) ~= "table" then
		return nil, "", nil
	end
	local ComposeKey = DynamicModule.raw(Key, "composeKey")
	
	if ComposeKey == "event" then
		return "event", tostring(DynamicModule.raw(Key, "name")), nil
	end
	if ComposeKey == "property" then
		return "property", tostring(DynamicModule.raw(Key, "name")), nil
	end
	if ComposeKey == "group" then
		local Names = Key.names
		
		if Names ~= nil then
			return "group", table.concat(Names, "+"), Names
		end
	end
	return nil, "", nil
end

local PropsStateModule = require("./props-state")
local Unwritten = PropsStateModule.unwritten
local Mapped = PropsStateModule.mapped
local v1 = nil
local EffectHeldResults = {}
local Count = 0
local Largest = 0
WeakModule.keys(EffectHeldResults)
local t2 = {}
local t3 = {}
WeakModule.keys(t2)
WeakModule.keys(t3)
local Applying = PropsStateModule.applying
local ClassifyKeyFunction = HostModule.classifyKey

local function remember(Key, p1)
	-- upvalues: t3 (copy), t2 (copy), NodesModule (copy)
	local Entry = t3[Key]
	
	if Entry ~= nil then
		table.insert(Entry, p1)
		
		return
	end
	local Entry1 = t2[Key]
	
	if Entry1 == nil then
		if NodesModule.rememberEvent(Key, p1) then return end
		Entry1 = NodesModule.takeEvent(Key)
	end
	if Entry1 == nil then
		t2[Key] = p1
		
		return
	else
		t2[Key] = nil
		t3[Key] = { Entry1, p1 }
	end
end

local function detach(p1, Key)
	-- upvalues: t2 (copy), t3 (copy), NodesModule (copy)
	local Entry = t2[Key]
	local Entry1 = t3[Key]
	
	if Entry == nil then
		Entry = NodesModule.takeEvent(Key)
	end
	if Entry == nil and Entry1 == nil then return end
	t2[Key] = nil
	t3[Key] = nil
	local Events = p1.events
	local DetachEvent: (any) -> () = if Events == nil then nil else Events.detachEvent
	
	if DetachEvent == nil then return end
	if Entry ~= nil then
		DetachEvent(Entry)
	end
	if Entry1 ~= nil then
		for _, value in Entry1 do
			DetachEvent(value)
		end
	end
end

local function subscribe(p2, Key, p3, Event, p4, NoDisposed)
	-- upvalues: DiagnosticsModule (copy), HostModule (copy), DynamicModule (copy), remember (copy), OwnerModule (copy)
	local Events = p2.events
	
	if Events == nil then
		return DiagnosticsModule.raise("host/no-events", ("host %q cannot subscribe to events"):format(p2.name), {
			contract = "subscribing requires the host events capability",
			fix = "implement host.events.connectEvent, or stop passing event keys to this host",
			event = Event,
			node = HostModule.describeNode(p2, Key)
		})
	end
	local HandlerResult = DynamicModule.handler(p4)
	local AttachEventFunction = Events.attachEvent
	
	if NoDisposed and AttachEventFunction ~= nil and Events.detachEvent ~= nil then
		remember(Key, AttachEventFunction(Key, Event, HandlerResult))
		
		return
	else
		OwnerModule.adopt(p3, Events.connectEvent(Key, Event, HandlerResult))
	end
end

local function refuseNodeValue(p2, Key, Key1, p3)
	-- upvalues: NodesModule (copy), DiagnosticsModule (copy), HostModule (copy)
	if not NodesModule.isDestructible(p3) then return end
	return DiagnosticsModule.raise("props/child-under-string-key", "a node was given as the value of a property", {
		expected = "a value the host can store in a property",
		contract = "a string key names a property to write; children live in the array part of the props table",
		key = Key1,
		node = HostModule.describeNode(p2, Key),
		actual = ("a node this runtime will destroy: %s"):format(HostModule.describeNode(p2, p3)),
		fix = ("drop the key -- write the node as a positional child rather than as %s = ...; "):format(Key1) .. ("if this host really does take a node there, say so with %s = static(node)"):format(Key1)
	})
end

local function map(Source, Callback)
	-- upvalues: Mapped (copy)
	local function body(Callback1)
		-- upvalues: Callback (copy), Source (copy)
		return Callback(Callback1(Source))
	end
	
	Mapped[body] = {
		source = Source,
		transform = function(_)
			-- upvalues: Source (copy), Callback (copy)
			local Cache = Source.cache
			
			return Callback(if Cache == nil then Source:peek() else Cache.value)
		end
	}
	
	return body
end

local Listeners = {}
WeakModule.entries(Listeners)

local function _(Key)
	-- upvalues: Listeners (copy)
	local Listener = Listeners[Key]
	
	if Listener == nil then
		local function listener(p2, p3)
			-- upvalues: Key (copy)
			if p3 == nil then return end
			local Subject = p3.subject
			local FastKey = p3.fastKey
			
			if Subject ~= nil and FastKey ~= nil then
				Key(Subject, FastKey, p2)
			end
		end
		
		Listeners[Key] = listener
		
		return listener
	else
		return Listener
	end
end

local Listeners1 = {}
WeakModule.entries(Listeners1)
local ReadProperties = {}
WeakModule.keys(ReadProperties)

local _ = function(Key, p2)
	-- upvalues: Listeners1 (copy), ReadProperties (copy), Unwritten (copy)
	local Listener = Listeners1[Key]
	
	if Listener == nil or ReadProperties[Listener] ~= p2 then
		local function listener(p3, p4)
			-- upvalues: Unwritten (upval), p2 (copy), Key (copy)
			if p4 == nil then return end
			local Subject = p4.subject
			local FastKey = p4.fastKey
			local TransformFunction = p4.transform
			
			if Subject == nil or FastKey == nil or TransformFunction == nil then return end
			local TransformResult = TransformFunction(p3)
			local Written = p4.written
			
			if Written ~= Unwritten and TransformResult == Written and p2 ~= nil then
				local Success, Result = pcall(p2, Subject, FastKey)
				
				if Success and Result == TransformResult then return end
			end
			p4.written = TransformResult
			Key(Subject, FastKey, TransformResult)
		end
		
		Listeners1[Key] = listener
		ReadProperties[listener] = p2
		
		return listener
	else
		return Listener
	end
end

local function forgetFast(Key)
	-- upvalues: EffectHeldResults (ref), Count (ref), Largest (ref), WeakModule (copy)
	if EffectHeldResults[Key] ~= nil then
		EffectHeldResults[Key] = nil
		Count -= 1
		
		if Count * 4 <= Largest then
			local t = {}
			
			for i, effectHeldResult in EffectHeldResults do
				t[i] = effectHeldResult
			end
			WeakModule.keys(t)
			EffectHeldResults = t
			Largest = Count
		end
	end
end

local function retireFast(Key, Event)
	-- upvalues: EffectHeldResults (ref), forgetFast (copy), WatchModule (copy)
	local EffectHeldResult = EffectHeldResults[Key]
	local v2 = nil
	while EffectHeldResult ~= nil do
		local FastNext = EffectHeldResult.fastNext
		
		if EffectHeldResult.fastKey == Event then
			if v2 == nil then
				if FastNext == nil then
					forgetFast(Key)
				else
					EffectHeldResults[Key] = FastNext
				end
			else
				v2.fastNext = FastNext
			end
			WatchModule.releaseEdge(EffectHeldResult)
		else
			v2 = EffectHeldResult
		end
		EffectHeldResult = FastNext
	end
end

local _ = function(Key, p2)
	-- upvalues: EffectHeldResults (ref), Count (ref), Largest (ref)
	local EffectHeldResult = EffectHeldResults[Key]
	
	if EffectHeldResult == nil then
		Count += 1
		Largest = math.max(Largest, Count)
	else
		p2.fastNext = EffectHeldResult
	end
	EffectHeldResults[Key] = p2
end

local function bindFunction(p2, Key, p3, Key1, Callback2, Callback1)
	-- upvalues: Mapped (copy), OwnerModule (copy), Listeners1 (copy), ReadProperties (copy), Unwritten (copy), EffectHeldResults (ref), Count (ref), Largest (ref), CellModule (copy)
	local Observation = p2.observation
	local ReadProperty = if Observation then Observation.readProperty else nil
	local MappedEntry = Mapped[Callback2]
	
	if MappedEntry == nil or p3.boundary ~= nil then
		local AsValueResult = if type(Callback2) == "table" then CellModule.asValue(Callback2) else nil
		local Callback: ((any) -> any)? = nil
		
		if AsValueResult == nil then
			if type(Callback2) ~= "function" then return end
			Callback = Callback2
		else
			Callback = function(Callback)
				-- upvalues: AsValueResult (copy)
				return Callback(AsValueResult)
			end
		end
		local Unwritten1 = Unwritten
		local EffectHeldResult = OwnerModule.effectHeld(p3, function(p4)
			-- upvalues: Callback (ref), Unwritten1 (ref), Unwritten (upval), ReadProperty (copy), Key (copy), Key1 (copy), Callback1 (copy)
			local CallbackResult = Callback(p4)
			
			if Unwritten1 ~= Unwritten and CallbackResult == Unwritten1 and ReadProperty ~= nil then
				local Success, Result = pcall(ReadProperty, Key, Key1)
				
				if Success and Result == CallbackResult then return end
			end
			Unwritten1 = CallbackResult
			Callback1(Key, Key1, CallbackResult)
		end)
		
		if EffectHeldResult == nil then return end
		EffectHeldResult.fastKey = Key1
		local EffectHeldResult1 = EffectHeldResults[Key]
		
		if EffectHeldResult1 == nil then
			Count += 1
			Largest = math.max(Largest, Count)
		else
			EffectHeldResult.fastNext = EffectHeldResult1
		end
		EffectHeldResults[Key] = EffectHeldResult
		
		return
	else
		local ListenHeldFunction = OwnerModule.listenHeld
		local v3 = p3
		local Source = MappedEntry.source
		local Listener = Listeners1[Callback1]
		local Listener1 = nil
		
		if Listener == nil or ReadProperties[Listener] ~= ReadProperty then
			local function listener(p4, p5)
				-- upvalues: Unwritten (upval), ReadProperty (copy), Callback1 (copy)
				if p5 == nil then return end
				local Subject = p5.subject
				local FastKey = p5.fastKey
				local TransformFunction = p5.transform
				
				if Subject == nil or FastKey == nil or TransformFunction == nil then return end
				local TransformResult = TransformFunction(p4)
				local Written = p5.written
				
				if Written ~= Unwritten and TransformResult == Written and ReadProperty ~= nil then
					local Success, Result = pcall(ReadProperty, Subject, FastKey)
					
					if Success and Result == TransformResult then return end
				end
				p5.written = TransformResult
				Callback1(Subject, FastKey, TransformResult)
			end
			
			Listeners1[Callback1] = listener
			ReadProperties[listener] = ReadProperty
			Listener1 = listener
		else
			Listener1 = Listener
		end
		local ListenHeldResult = ListenHeldFunction(v3, Source, Listener1, Key, Key1, MappedEntry.transform, Unwritten)
		local EffectHeldResult = EffectHeldResults[Key]
		
		if EffectHeldResult == nil then
			Count += 1
			Largest = math.max(Largest, Count)
		else
			ListenHeldResult.fastNext = EffectHeldResult
		end
		EffectHeldResults[Key] = ListenHeldResult
	end
end

return {
	event = event,
	group = group,
	property = property,
	static = static,
	applying = Applying,
	apply = function(p2, Key, p3, p4, Enabled)
		-- upvalues: DynamicModule (copy), State (copy), EffectHeldResults (ref), readKey (copy), Applying (copy), retireFast (copy), v1 (ref), DiagnosticsModule (copy), HostModule (copy), subscribe (copy), CellModule (copy), refuseNodeValue (copy), NodeModule (copy), bindFunction (copy), OwnerModule (copy), Listeners (copy), Count (ref), Largest (ref), ClassifyKeyFunction (copy)
		assert(type(p3) == "table")
		local PropsResult = DynamicModule.props(p3)
		local NoDisposed: boolean = Enabled == true and (not State.enabled and not p4.disposed)
		local SetPropertyFunction: (any, any, any) -> () = p2.render.setProperty
		local HasEffectHeldResult: boolean = not NoDisposed and EffectHeldResults[Key] ~= nil
		local CountPropsResult = #PropsResult
		local Key2_1 = nil
		
		for Key1, value in PropsResult do
			if type(Key1) ~= "string" then
				if type(Key1) ~= "number" or Key1 < 1 or Key1 > CountPropsResult or Key1 % 1 ~= 0 then
					local Key2, Key3
					Key2, Key2_1, Key3 = readKey(Key1)
					
					if Key2 == nil then
						return DiagnosticsModule.raise("props/unsupported-key", "a props key is neither a string nor a wrapped key", {
							expected = "a string, event(\"Name\"), or property(\"Name\")",
							contract = "props keys name properties and events; array entries are children",
							actual = DiagnosticsModule.describe(Key1)
						})
					end
					Applying.key = Key2_1
					
					if HasEffectHeldResult then
						if Key2 == "group" then
							for _, value1 in assert(Key3) do
								retireFast(Key, value1)
							end
						else
							retireFast(Key, Key2_1)
						end
					end
					if Key2 == "group" then
						local V21 = v1 or require("./bindings")
						v1 = V21
						V21.bindGroup(p2, Key, p4, assert(Key3), value)
						continue
					elseif Key2 == "event" then
						if type(value) ~= "function" then
							return DiagnosticsModule.raise("props/event-needs-handler", "an event key was given something that is not a handler", {
								expected = "a function",
								event = Key2_1,
								node = HostModule.describeNode(p2, Key),
								actual = DiagnosticsModule.describe(value)
							})
						end
						subscribe(p2, Key, p4, Key2_1, value, NoDisposed)
						continue
					elseif type(value) == "function" or CellModule.isValue(value) then
						local V21 = v1 or require("./bindings")
						v1 = V21
						V21.bind(V21.propertyTarget(p2), Key, p4, Key2_1, value)
						continue
					else
						refuseNodeValue(p2, Key, Key2_1, value)
						local V21 = v1 or require("./bindings")
						v1 = V21
						V21.writeOnce(V21.propertyTarget(p2), Key, p4, Key2_1, value)
						continue
					end
					continue
				end
				continue
			end
			if HasEffectHeldResult then
				retireFast(Key, Key1)
			end
			if Key1 == "Attributes" then
				Applying.key = "Attributes"
				local V21 = v1 or require("./bindings")
				v1 = V21
				V21.applyAttributes(p2, Key, p4, value)
			else
				Applying.key = Key1
				
				if type(value) == "table" then
					if DynamicModule.raw(value, "composeValue") == "static" then
						local Value = DynamicModule.raw(value, "value")
						
						if NoDisposed then
							SetPropertyFunction(Key, Key1, Value)
							continue
						else
							local V21 = v1 or require("./bindings")
							v1 = V21
							V21.writeOnce(V21.propertyTarget(p2), Key, p4, Key1, Value)
							continue
						end
					else
						local AsValueNodeResult = NodeModule.asValueNode(value)
						
						if AsValueNodeResult == nil then
							refuseNodeValue(p2, Key, Key1, value)
						else
							if NoDisposed and p4.boundary ~= nil then
								bindFunction(p2, Key, p4, Key1, value, SetPropertyFunction)
								continue
							else
								if not NoDisposed then
									local V21 = v1 or require("./bindings")
									v1 = V21
									V21.bind(V21.propertyTarget(p2), Key, p4, Key1, value)
									continue
								end
								local ListenHeldFunction = OwnerModule.listenHeld
								local Listener = Listeners[SetPropertyFunction]
								local Listener1 = nil
								
								if Listener == nil then
									local function listener(p5, p6)
										-- upvalues: SetPropertyFunction (copy)
										if p6 == nil then return end
										local Subject = p6.subject
										local FastKey = p6.fastKey
										
										if Subject ~= nil and FastKey ~= nil then
											SetPropertyFunction(Subject, FastKey, p5)
										end
									end
									
									Listeners[SetPropertyFunction] = listener
									Listener1 = listener
								else
									Listener1 = Listener
								end
								local ListenHeldResult = ListenHeldFunction(p4, AsValueNodeResult, Listener1, Key, Key1)
								local EffectHeldResult = EffectHeldResults[Key]
								
								if EffectHeldResult == nil then
									Count += 1
									Largest = math.max(Largest, Count)
								else
									ListenHeldResult.fastNext = EffectHeldResult
								end
								EffectHeldResults[Key] = ListenHeldResult
								continue
							end
						end
					end
				elseif type(value) ~= "function" then
					if type(value) == "userdata" then
						refuseNodeValue(p2, Key, Key1, value)
					end
				else
					if ClassifyKeyFunction(p2, Key, Key1) == "event" then
						subscribe(p2, Key, p4, Key1, value, NoDisposed)
						continue
					elseif NoDisposed then
						bindFunction(p2, Key, p4, Key1, value, SetPropertyFunction)
						continue
					else
						local V21 = v1 or require("./bindings")
						v1 = V21
						V21.bind(V21.propertyTarget(p2), Key, p4, Key1, value)
						continue
					end
				end
				if NoDisposed then
					SetPropertyFunction(Key, Key1, value)
				else
					local V21 = v1 or require("./bindings")
					v1 = V21
					V21.writeOnce(V21.propertyTarget(p2), Key, p4, Key1, value)
				end
			end
		end
	end,
	forget = function(Key)
		-- upvalues: t2 (copy), t3 (copy), forgetFast (copy)
		t2[Key] = nil
		t3[Key] = nil
		forgetFast(Key)
	end,
	detach = detach,
	map = map
}