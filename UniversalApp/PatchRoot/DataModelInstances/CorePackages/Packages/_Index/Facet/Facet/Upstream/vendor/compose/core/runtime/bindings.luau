--!native

local WeakModule = require("../weak")
local DiagnosticsModule = require("../diagnostics")
local DynamicModule = require("../dynamic")
local HostModule = require("../host")
local NodesModule = require("../ownership/nodes")
local CellModule = require("../reactive/cell")
local State = require("../reactive/evaluation").stats.state
local OwnerModule = require("../ownership/owner")
local _ = require("../reactive/types")
local PropsStateModule = require("./props-state")
local Mapped = PropsStateModule.mapped
local Applying = PropsStateModule.applying
local Unwritten = PropsStateModule.unwritten
local CreateFunction1 = table.create
local CreateFunction = table.create

local function _(p1)
	-- upvalues: DynamicModule (copy)
	if type(p1) == "table" and DynamicModule.raw(p1, "composeValue") == "static" then
		return DynamicModule.raw(p1, "value"), true
	else
		return nil, false
	end
end

local Registry = {}
WeakModule.keys(Registry)
local Registry1 = {}
WeakModule.keys(Registry1)

local function retireBinding(Previous, PendingKey)
	-- upvalues: retireBinding (copy)
	if Previous == nil then return end
	if Previous.pendingKey == PendingKey then
		retireBinding(Previous.previous, PendingKey)
		
		return
	end
	Previous.remaining -= 1
	
	if Previous.remaining == 0 then
		Previous.active = false
		
		if Previous.dispose ~= nil then
			Previous.dispose()
		end
	end
end

local _ = function(p1, Key, p2)
	-- upvalues: retireBinding (copy)
	local v1 = p1[Key]
	p1[Key] = p2
	
	if p2 ~= nil then
		p2.remaining += 1
		p2.active = true
	end
	if v1 == nil then return end
	if v1.pendingKey == Key then
		retireBinding(v1.previous, Key)
		
		return
	end
	v1.remaining -= 1
	
	if v1.remaining == 0 then
		v1.active = false
		
		if v1.dispose ~= nil then
			v1.dispose()
		end
	end
end

local _ = function(p1, p2, p3, PendingKey, p4, Previous): boolean
	if p1[p2] == p3 and p3[PendingKey] == Previous then
		p4.pendingKey = PendingKey
		p4.previous = Previous
		p3[PendingKey] = p4
		
		return true
	else
		return false
	end
end

local _ = function(p1, PendingKey, p2, p3)
	-- upvalues: retireBinding (copy)
	local Previous = p2.previous
	p2.previous = nil
	p2.pendingKey = nil
	
	if p1[PendingKey] ~= p2 then return end
	if p3 then
		p2.remaining += 1
		p2.active = true
		
		if Previous == nil then return end
		if Previous.pendingKey == PendingKey then
			retireBinding(Previous.previous, PendingKey)
			
			return
		end
		Previous.remaining -= 1
		
		if Previous.remaining == 0 then
			Previous.active = false
			
			if Previous.dispose ~= nil then
				Previous.dispose()
				
				return
			end
		end
	else
		p1[PendingKey] = if Previous == nil or not Previous.active and Previous.pendingKey ~= PendingKey then nil else Previous
	end
end

local _ = function(p1, Key)
	local v1 = p1[Key]
	
	if v1 == nil then
		v1 = {}
		p1[Key] = v1
	end
	return v1, { remaining = 0, active = false }
end

local _ = function(p1, Key, Key1)
	-- upvalues: retireBinding (copy)
	local v1 = p1[Key]
	
	if v1 ~= nil then
		local v2 = v1[Key1]
		v1[Key1] = nil
		
		if v2 ~= nil then
			if v2.pendingKey == Key1 then
				retireBinding(v2.previous, Key1)
			else
				v2.remaining -= 1
				
				if v2.remaining == 0 then
					v2.active = false
					
					if v2.dispose ~= nil then
						v2.dispose()
					end
				end
			end
		end
		if next(v1) == nil and p1[Key] == v1 then
			p1[Key] = nil
		end
	end
end

local _ = function(p1, p2, Previouses, PendingKey, p3, p4)
	-- upvalues: NodesModule (copy)
	local Inverted = not NodesModule.isDestructible(p2)
	
	return function()
		-- upvalues: p3 (copy), Previouses (copy), PendingKey (copy), p1 (copy), p2 (copy), Inverted (copy), p4 (copy)
		p3.active = false
		
		if Previouses[PendingKey] == p3 then
			if p3.pendingKey == PendingKey then
				Previouses[PendingKey] = p3.previous
				
				return
			end
			Previouses[PendingKey] = nil
			p3.remaining = 0
			
			if next(Previouses) == nil and p1[p2] == Previouses then
				p1[p2] = nil
			end
			if Inverted then
				p4(p2, PendingKey)
			end
			return
		elseif next(Previouses) == nil and p1[p2] == Previouses then
			p1[p2] = nil
		end
	end
end

local ClassifyKeyFunction = HostModule.classifyKey

local function writeOnce(p1, Key, p2, Key1, p3)
	-- upvalues: NodesModule (copy), retireBinding (copy), OwnerModule (copy)
	local Registry = p1.registry
	local Clear = p1.clear
	local RegistryEntry = Registry[Key]
	local RegistryEntry1 = if RegistryEntry == nil then nil else RegistryEntry[Key1]
	p1.write(Key, Key1, p3)
	local RegistryEntry2 = Registry[Key]
	
	if (if RegistryEntry2 == nil then nil else RegistryEntry2[Key1]) ~= RegistryEntry1 then return end
	if NodesModule.isDestructible(Key) then
		local RegistryEntry3 = Registry[Key]
		
		if RegistryEntry3 ~= nil then
			local RegistryEntry31 = RegistryEntry3[Key1]
			RegistryEntry3[Key1] = nil
			
			if RegistryEntry31 ~= nil then
				if RegistryEntry31.pendingKey == Key1 then
					retireBinding(RegistryEntry31.previous, Key1)
				else
					RegistryEntry31.remaining -= 1
					
					if RegistryEntry31.remaining == 0 then
						RegistryEntry31.active = false
						
						if RegistryEntry31.dispose ~= nil then
							RegistryEntry31.dispose()
						end
					end
				end
			end
			if next(RegistryEntry3) == nil and Registry[Key] == RegistryEntry3 then
				Registry[Key] = nil
			end
		end
		return
	else
		local RegistryEntry21 = Registry[Key]
		
		if RegistryEntry21 == nil then
			RegistryEntry21 = {}
			Registry[Key] = RegistryEntry21
		end
		local config = { remaining = 0, active = false }
		local Inverted = not NodesModule.isDestructible(Key)
		
		local function v49()
			-- upvalues: config (copy), RegistryEntry21 (copy), Key1 (copy), Registry (copy), Key (copy), Inverted (copy), Clear (copy)
			config.active = false
			
			if RegistryEntry21[Key1] == config then
				if config.pendingKey == Key1 then
					RegistryEntry21[Key1] = config.previous
					
					return
				end
				RegistryEntry21[Key1] = nil
				config.remaining = 0
				
				if next(RegistryEntry21) == nil and Registry[Key] == RegistryEntry21 then
					Registry[Key] = nil
				end
				if Inverted then
					Clear(Key, Key1)
				end
				return
			elseif next(RegistryEntry21) == nil and Registry[Key] == RegistryEntry21 then
				Registry[Key] = nil
			end
		end
		
		local RegistryEntry4 = RegistryEntry21[Key1]
		RegistryEntry21[Key1] = config
		
		if config ~= nil then
			config.remaining += 1
			config.active = true
		end
		if RegistryEntry4 ~= nil then
			if RegistryEntry4.pendingKey == Key1 then
				retireBinding(RegistryEntry4.previous, Key1)
			else
				RegistryEntry4.remaining -= 1
				
				if RegistryEntry4.remaining == 0 then
					RegistryEntry4.active = false
					
					if RegistryEntry4.dispose ~= nil then
						RegistryEntry4.dispose()
					end
				end
			end
		end
		config.dispose = OwnerModule.own(p2, v49)
	end
end

local function bind(p1, Key, p2, PendingKey, Callback)
	-- upvalues: CellModule (copy), Unwritten (copy), retireBinding (copy), State (copy), NodesModule (copy), HostModule (copy), Mapped (copy), OwnerModule (copy)
	local AsValueResult = if type(Callback) == "table" then CellModule.asValue(Callback) else nil
	local Registry = p1.registry
	local WriteFunction = p1.write
	local ClearFunction = p1.clear
	local Deduplicate = p1.deduplicate
	local RegistryEntry = Registry[Key]
	
	if RegistryEntry == nil then
		RegistryEntry = {}
		Registry[Key] = RegistryEntry
	end
	local Previouses = RegistryEntry
	local config = { remaining = 0, active = false }
	local Previous = Previouses[PendingKey]
	local Unwritten1 = Unwritten
	
	local function publish(TransformResult)
		-- upvalues: Unwritten1 (ref), Unwritten (upval), Registry (copy), Key (copy), Previouses (copy), PendingKey (copy), config (copy), Previous (ref), WriteFunction (copy), retireBinding (upval), Deduplicate (copy), State (upval)
		if Unwritten1 == Unwritten then
			local Previous1 = Previous
			local Flag = nil
			
			if Registry[Key] == Previouses and Previouses[PendingKey] == Previous1 then
				config.pendingKey = PendingKey
				config.previous = Previous1
				Previouses[PendingKey] = config
				Flag = true
			else
				Flag = false
			end
			if Flag then
				local Success, Result = pcall(WriteFunction, Key, PendingKey, TransformResult)
				local Previous2 = config.previous
				config.previous = nil
				config.pendingKey = nil
				
				if Previouses[PendingKey] == config then
					if Success then
						config.remaining += 1
						config.active = true
						
						if Previous2 ~= nil then
							if Previous2.pendingKey == PendingKey then
								retireBinding(Previous2.previous, PendingKey)
							else
								Previous2.remaining -= 1
								
								if Previous2.remaining == 0 then
									Previous2.active = false
									
									if Previous2.dispose ~= nil then
										Previous2.dispose()
									end
								end
							end
						end
					else
						Previouses[PendingKey] = if Previous2 == nil or not Previous2.active and Previous2.pendingKey ~= PendingKey then nil else Previous2
					end
				end
				if not Success then
					error(Result, 0)
				end
			else
				Unwritten1 = TransformResult
				
				if config.dispose then
					config.dispose()
				end
				return
			end
		else
			if not config.active or Deduplicate and TransformResult == Unwritten1 then return end
			WriteFunction(Key, PendingKey, TransformResult)
		end
		Unwritten1 = TransformResult
		
		if State.enabled then
			State.recorder.hostWrite()
		end
	end
	
	local Inverted = not NodesModule.isDestructible(Key)
	
	local function v61()
		-- upvalues: config (copy), Previouses (copy), PendingKey (copy), Registry (copy), Key (copy), Inverted (copy), ClearFunction (copy)
		config.active = false
		
		if Previouses[PendingKey] == config then
			if config.pendingKey == PendingKey then
				Previouses[PendingKey] = config.previous
				
				return
			end
			Previouses[PendingKey] = nil
			config.remaining = 0
			
			if next(Previouses) == nil and Registry[Key] == Previouses then
				Registry[Key] = nil
			end
			if Inverted then
				ClearFunction(Key, PendingKey)
			end
			return
		elseif next(Previouses) == nil and Registry[Key] == Previouses then
			Registry[Key] = nil
		end
	end
	
	if State.enabled then
		State.recorder.naming(("%s.%s%s"):format(HostModule.describeNode(p1.host, Key), p1.prefix, PendingKey))
	end
	local MappedEntry = Mapped[Callback]
	local WatchTerminalResult: () -> () = if MappedEntry == nil then if type(Callback) == "function" then OwnerModule.watchTerminal(p2, function(p3)
		-- upvalues: Unwritten1 (ref), Unwritten (upval), config (copy), publish (copy), Callback (copy)
		if Unwritten1 == Unwritten or config.active then
			publish(Callback(p3))
		end
	end, v61) else OwnerModule.watchStatic(p2, assert(AsValueResult), publish, v61) else OwnerModule.watchStatic(p2, MappedEntry.source, function(p3)
		-- upvalues: Unwritten1 (ref), Unwritten (upval), config (copy), publish (copy), MappedEntry (copy)
		if Unwritten1 == Unwritten or config.active then
			publish(MappedEntry.transform(p3))
		end
	end, v61)
	config.dispose = WatchTerminalResult
	
	if State.enabled then
		State.recorder.naming(nil)
	end
	Previous = nil
	
	if config.remaining == 0 then
		WatchTerminalResult()
	end
end

local function bindGroup(p1, Key, p2, List, Callback)
	-- upvalues: ClassifyKeyFunction (copy), DiagnosticsModule (copy), HostModule (copy), CreateFunction1 (copy), Unwritten (copy), Registry (copy), CreateFunction (copy), NodesModule (copy), State (copy), OwnerModule (copy), retireBinding (copy)
	local Render = p1.render
	local CountList = #List
	local Entry = nil
	
	for i = 1, CountList do
		Entry = List[i]
		
		if ClassifyKeyFunction(p1, Key, Entry) == "event" then
			return DiagnosticsModule.raise("props/group-names-an-event", "a group named a key the host classifies as an event", {
				contract = "a group writes properties; events are subscribed with event(name)",
				event = Entry,
				node = HostModule.describeNode(p1, Key),
				fix = ("move %q out of the group and onto its own [event(%q)] key"):format(Entry, Entry)
			})
		end
	end
	if type(Callback) ~= "function" then
		return DiagnosticsModule.raise("props/group-needs-a-body", "a group key was given something that is not a body", {
			expected = "a function taking `use` and returning one value per name",
			properties = table.concat(List, ", "),
			node = HostModule.describeNode(p1, Key),
			actual = DiagnosticsModule.describe(Callback)
		})
	end
	local CreateResult = CreateFunction1(CountList, Unwritten)
	local RegistryEntry = Registry[Key]
	
	if RegistryEntry == nil then
		RegistryEntry = {}
		Registry[Key] = RegistryEntry
	end
	local Previouses = RegistryEntry
	local config = { remaining = 0, active = false }
	local CreateResult1 = CreateFunction(CountList)
	
	for i1, value in List do
		CreateResult1[i1] = Previouses[value]
	end
	local Inverted = not NodesModule.isDestructible(Key)
	
	local function cleanup()
		-- upvalues: config (copy), List (copy), Previouses (copy), Inverted (copy), Render (copy), Key (copy), Registry (upval)
		config.active = false
		local v1 = nil
		
		for _, value in List do
			if Previouses[value] == config then
				if config.pendingKey == value then
					Previouses[value] = config.previous
				else
					Previouses[value] = nil
					
					if Inverted then
						local Success, Result = pcall(Render.clearProperty, Key, value)
						
						if not Success and v1 == nil then
							v1 = Result
						end
					end
				end
			end
		end
		config.remaining = 0
		
		if next(Previouses) == nil and Registry[Key] == Previouses then
			Registry[Key] = nil
		end
		if v1 ~= nil then
			error(v1, 0)
		end
	end
	
	if State.enabled then
		State.recorder.naming(("%s.{%s}"):format(HostModule.describeNode(p1, Key), table.concat(List, ",")))
	end
	local WatchResult: () -> () = OwnerModule.watch(p2, function(p3)
		-- upvalues: Callback (copy), CountList (copy), DiagnosticsModule (upval), List (copy), HostModule (upval), p1 (copy), Key (copy), CreateResult (copy), Unwritten (upval), Registry (upval), Previouses (copy), config (copy), CreateResult1 (copy), Render (copy), retireBinding (upval), State (upval)
		local Packed = table.pack(Callback(p3))
		
		if Packed.n ~= CountList then
			return DiagnosticsModule.raise("props/group-arity", "a group body returned the wrong number of values", {
				properties = table.concat(List, ", "),
				node = HostModule.describeNode(p1, Key),
				actual = ("%d value(s)"):format(Packed.n),
				expected = ("%d, one per name, in order"):format(CountList)
			})
		end
		for i = 1, CountList do
			local Entry = List[i]
			local Entry1 = Packed[i]
			
			if CreateResult[i] == Unwritten then
				local CreateResultEntry = CreateResult1[i]
				local Flag = nil
				
				if Registry[Key] == Previouses and Previouses[Entry] == CreateResultEntry then
					config.pendingKey = Entry
					config.previous = CreateResultEntry
					Previouses[Entry] = config
					Flag = true
				else
					Flag = false
				end
				if not Flag then
					CreateResult[i] = Entry1
					continue
				else
					local Success, Result = pcall(Render.setProperty, Key, Entry, Entry1)
					local Previous = config.previous
					config.previous = nil
					config.pendingKey = nil
					
					if Previouses[Entry] == config then
						if Success then
							config.remaining += 1
							config.active = true
							
							if Previous ~= nil then
								if Previous.pendingKey == Entry then
									retireBinding(Previous.previous, Entry)
								else
									Previous.remaining -= 1
									
									if Previous.remaining == 0 then
										Previous.active = false
										
										if Previous.dispose ~= nil then
											Previous.dispose()
										end
									end
								end
							end
						else
							Previouses[Entry] = if Previous == nil or not Previous.active and Previous.pendingKey ~= Entry then nil else Previous
						end
					end
					if not Success then
						error(Result, 0)
					end
				end
			else
				if Previouses[Entry] ~= config or Entry1 == CreateResult[i] then
					continue
				end
				Render.setProperty(Key, Entry, Entry1)
			end
			CreateResult[i] = Entry1
			
			if State.enabled then
				State.recorder.hostWrite()
			end
		end
		if config.remaining == 0 and config.dispose ~= nil then
			config.dispose()
		end
	end, nil, cleanup)
	config.dispose = WatchResult
	
	if State.enabled then
		State.recorder.naming(nil)
	end
	table.clear(CreateResult1)
	
	for i2 = 1, CountList do
		if CreateResult[i2] == Unwritten then
			CreateResult[i2] = nil
		end
	end
	if config.remaining == 0 then
		WatchResult()
	end
end

local function attributeWriter(Host, p4)
	-- upvalues: DiagnosticsModule (copy), HostModule (copy)
	local SetAttribute = Host.render.setAttribute
	
	return if SetAttribute == nil then DiagnosticsModule.raise("host/no-attributes", ("host %q cannot store attributes"):format(Host.name), {
		key = "Attributes",
		contract = "an Attributes prop requires the render.setAttribute capability",
		fix = "implement host.render.setAttribute, or write the value under an ordinary property key",
		node = HostModule.describeNode(Host, p4)
	}) else SetAttribute
end

local function writeAttribute(Host, p4, Callback, p5, p6)
	-- upvalues: DiagnosticsModule (copy), HostModule (copy)
	local CallbackResult, CallbackResult2 = Callback(p4, p5, p6)
	
	if CallbackResult then return end
	return DiagnosticsModule.raise("props/attribute-value", "the host refused an attribute value", {
		expected = "a value this host stores as an attribute",
		contract = "an attribute value must be one the host's attribute store accepts; nil clears it",
		key = ("%s.%s"):format("Attributes", p5),
		node = HostModule.describeNode(Host, p4),
		actual = DiagnosticsModule.describe(p6),
		detail = if CallbackResult2 == nil then "the host gave no reason" else CallbackResult2,
		fix = ("write a value the host accepts, or move %q onto an ordinary property key"):format(p5)
	})
end

local t = {}
WeakModule.entries(t)

local function attributeTarget(Host, p4)
	-- upvalues: attributeWriter (copy), t (copy), writeAttribute (copy), Registry1 (copy)
	local AttributeWriterResult = attributeWriter(Host, p4)
	local Entry = t[Host]
	
	if Entry == nil or Entry.attributeWrite ~= AttributeWriterResult then
		local config = {
			prefix = "Attributes.",
			deduplicate = true,
			registry = Registry1,
			write = function(Key, Key1, p5)
				-- upvalues: writeAttribute (upval), Host (copy), AttributeWriterResult (copy)
				writeAttribute(Host, Key, AttributeWriterResult, Key1, p5)
			end,
			clear = function(p5, p6)
				-- upvalues: AttributeWriterResult (copy)
				AttributeWriterResult(p5, p6, nil)
			end,
			host = Host,
			attributeWrite = AttributeWriterResult
		}
		t[Host] = config
		
		return config
	else
		return Entry
	end
end

local function refuseNodeAttribute(Host, Key, Key1, p4)
	-- upvalues: NodesModule (copy), DiagnosticsModule (copy), HostModule (copy)
	if not NodesModule.isDestructible(p4) then return end
	return DiagnosticsModule.raise("props/child-under-attribute", "a node was given as the value of an attribute", {
		expected = "a value the host can store in an attribute",
		contract = "an attribute holds data; children live in the array part of the props table",
		key = ("%s.%s"):format("Attributes", Key1),
		node = HostModule.describeNode(Host, Key),
		actual = ("a node this runtime will destroy: %s"):format(HostModule.describeNode(Host, p4)),
		fix = ("drop the attribute -- write the node as a positional child rather than as %s.%s"):format("Attributes", Key1)
	})
end

local function applyAttributes(Host, Key, p4, p5)
	-- upvalues: DiagnosticsModule (copy), HostModule (copy), DynamicModule (copy), attributeTarget (copy), Applying (copy), writeOnce (copy), CellModule (copy), bind (copy), refuseNodeAttribute (copy)
	if type(p5) ~= "table" then
		return DiagnosticsModule.raise("props/attributes-not-a-table", "the Attributes key was given something that is not a table", {
			key = "Attributes",
			expected = "a table of attribute name to value",
			contract = "Attributes is a reserved key naming a table of attributes to write",
			fix = "write Attributes = { Tier = 3 }, or [Compose.property \"Attributes\"] = value for a real property",
			node = HostModule.describeNode(Host, Key),
			actual = DiagnosticsModule.describe(p5)
		})
	end
	local t = {}
	local List = {}
	
	for i, value in DynamicModule.props(p5) do
		if type(i) ~= "string" or i == "" then
			return DiagnosticsModule.raise("props/attribute-name", "an attribute name is not a non-empty string", {
				key = "Attributes",
				expected = "a non-empty string",
				contract = "every key of an Attributes table names one attribute",
				fix = "give the attribute a name the host can address",
				node = HostModule.describeNode(Host, Key),
				actual = DiagnosticsModule.describe(i)
			})
		end
		t[i] = value
		table.insert(List, i)
	end
	table.sort(List)
	local AttributeTargetResult = attributeTarget(Host, Key)
	
	for _, Key1 in List do
		Applying.key = ("%s.%s"):format("Attributes", Key1)
		local Callback = t[Key1]
		local Flag = nil
		local v2 = nil
		
		if type(Callback) == "table" and DynamicModule.raw(Callback, "composeValue") == "static" then
			v2 = DynamicModule.raw(Callback, "value")
			Flag = true
		else
			v2 = nil
			Flag = false
		end
		if Flag then
			writeOnce(AttributeTargetResult, Key, p4, Key1, v2)
		elseif CellModule.isValue(Callback) or type(Callback) == "function" then
			bind(AttributeTargetResult, Key, p4, Key1, Callback)
		else
			refuseNodeAttribute(Host, Key, Key1, Callback)
			writeOnce(AttributeTargetResult, Key, p4, Key1, Callback)
		end
	end
end

local t1 = {}
WeakModule.entries(t1)

return {
	bind = bind,
	writeOnce = writeOnce,
	bindGroup = bindGroup,
	applyAttributes = applyAttributes,
	propertyTarget = function(Host)
		-- upvalues: t1 (copy), Registry (copy)
		local Render = Host.render
		local Entry = t1[Host]
		
		if Entry == nil or Entry.write ~= Render.setProperty or Entry.clear ~= Render.clearProperty then
			local config = {
				prefix = "",
				deduplicate = false,
				registry = Registry,
				write = Render.setProperty,
				clear = Render.clearProperty,
				host = Host
			}
			t1[Host] = config
			
			return config
		else
			return Entry
		end
	end
}