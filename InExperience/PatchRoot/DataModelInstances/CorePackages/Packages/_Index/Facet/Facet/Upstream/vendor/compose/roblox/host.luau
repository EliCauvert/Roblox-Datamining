--!native

local CoreModule = require("../core")
local EngineModule = require("./engine")
local ReadMemberFunction = EngineModule.readMember

local function raiseFailures(Entry)
	if #Entry == 1 then
		error(Entry[1], 0)
		
		return
	end
	if #Entry > 1 then
		local List = {}
		
		for _, value in Entry do
			table.insert(List, (tostring(value)))
		end
		error(table.concat(List, "\n"), 0)
	end
end

local function _(p1)
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy)
		p1()
		
		return nil
	end)
	
	if Success or Result ~= nil then
		return Success, Result
	else
		return Success, "ComposeRoblox styled observation raised nil"
	end
end

local _ = function(Signal, Callback)
	local Connection = Signal:Connect(Callback)
	local v1 = false
	
	return function()
		-- upvalues: v1 (ref), Connection (copy)
		if not v1 then
			v1 = true
			Connection:Disconnect()
		end
	end
end

local _ = function(p1, p2)
	-- upvalues: EngineModule (copy), ReadMemberFunction (copy)
	local Connect = EngineModule.invoke(ReadMemberFunction, p1, "Connect", p2)
	local v1 = false
	
	return function()
		-- upvalues: v1 (ref), EngineModule (upval), ReadMemberFunction (upval), Connect (copy)
		if not v1 then
			v1 = true
			EngineModule.invoke(ReadMemberFunction, Connect, "Disconnect")
		end
	end
end

return {
	createHost = function(p1)
		-- upvalues: ReadMemberFunction (copy), EngineModule (copy), CoreModule (copy), raiseFailures (copy)
		local ReadProperty = p1.readProperty or ReadMemberFunction
		local WriteProperty = p1.writeProperty or EngineModule.writeMember
		local t = {}
		local t1 = {}
		local t2 = {}
		local t3 = {}
		
		local function readClassName(p2)
			-- upvalues: ReadProperty (copy)
			local ClassName = ReadProperty(p2, "ClassName")
			assert(type(ClassName) == "string")
			
			return ClassName
		end
		
		local function hasConnectMethod(p2): boolean
			-- upvalues: ReadMemberFunction (upval)
			return type(ReadMemberFunction(p2, "Connect")) == "function"
		end
		
		local function _(p2)
			-- upvalues: readClassName (copy)
			local Success, Result = pcall(readClassName, p2)
			
			return if Success and type(Result) == "string" then Result else "<unknown class>"
		end
		
		local function defaultFor(p2, Text)
			-- upvalues: readClassName (copy), t (copy), t1 (copy), p1 (copy), ReadProperty (copy)
			local Success, Result = pcall(readClassName, p2)
			local Result1 = if Success and type(Result) == "string" then Result else "<unknown class>"
			local Text1 = Result1 .. "." .. Text
			local Entry = t[Text1]
			
			if Entry ~= nil then
				return Entry
			elseif t1[Result1] then
				return nil
			else
				local Success1, Result2 = pcall(p1.new, Result1)
				
				if not Success1 then
					t1[Result1] = true
					
					return nil
				end
				local Success2, Result3 = pcall(ReadProperty, Result2, Text)
				pcall(p1.destroy, Result2)
				
				if Success2 then
					t[Text1] = Result3
					
					return Result3
				else
					return nil
				end
			end
		end
		
		local function writeAttribute(p2, p3, p4): boolean
			-- upvalues: EngineModule (upval), ReadProperty (copy)
			EngineModule.invoke(ReadProperty, p2, "SetAttribute", p3, p4)
			
			return true
		end
		
		local _ = function(p2)
			-- upvalues: ReadProperty (copy), readClassName (copy)
			local Success, Result = pcall(ReadProperty, p2, "Name")
			
			if Success and type(Result) == "string" then
				return Result
			else
				local Success1, Result1 = pcall(readClassName, p2)
				
				return if Success1 and type(Result1) == "string" then Result1 else "<unknown class>"
			end
		end
		
		local function signalOf(p2, Event)
			-- upvalues: ReadProperty (copy), hasConnectMethod (copy), CoreModule (upval), readClassName (copy)
			local Success, Result = pcall(ReadProperty, p2, Event)
			local Result1 = if Success then Result else nil
			local Success1, Result2 = pcall(hasConnectMethod, Result1)
			
			if Result1 == nil or not Success1 or not Result2 then
				local Callback: (any, any) -> () = error
				local FormatDiagnosticFunction = CoreModule.formatDiagnostic
				local v1 = "host/not-an-event"
				local v2 = "%s has no event named %s"
				local Success2, Result3 = pcall(readClassName, p2)
				local FormatResult: string = v2:format(if Success2 and type(Result3) == "string" then Result3 else "<unknown class>", Event)
				local Success3, Result4 = pcall(readClassName, p2)
				Callback(FormatDiagnosticFunction(v1, FormatResult, {
					contract = "an event key must name something the object can be subscribed to",
					fix = "check the spelling, or use Compose.property(name) if it is a property",
					event = Event,
					node = if Success3 and type(Result4) == "string" then Result4 else "<unknown class>"
				}), 0)
			end
			return Result1
		end
		
		local function publish(p2)
			-- upvalues: raiseFailures (upval)
			if not p2.live then return end
			local List = {}
			
			for subscriber in p2.subscribers do
				table.insert(List, subscriber)
			end
			local ComposeRobloxStyledObservationRaisedNils = {}
			
			for _, value in List do
				if value.live then
					local Listener = value.listener
					local Success, Result = pcall(function()
						-- upvalues: Listener (copy)
						Listener()
						
						return nil
					end)
					local Result1 = if Success or Result ~= nil then Result else "ComposeRoblox styled observation raised nil"
					
					if not Success then
						table.insert(ComposeRobloxStyledObservationRaisedNils, Result1)
					end
				end
			end
			raiseFailures(ComposeRobloxStyledObservationRaisedNils)
		end
		
		local _ = function(Key, p3)
			-- upvalues: t2 (copy)
			p3.live = false
			t2[Key] = nil
			local StopStyledFunction: () -> () = p3.stopStyled
			p3.stopStyled = nil
			
			if StopStyledFunction then
				StopStyledFunction()
			end
		end
		
		return {
			name = "roblox",
			render = {
				createNode = p1.new,
				setProperty = WriteProperty,
				setAttribute = function(p3, p4, p5)
					-- upvalues: writeAttribute (copy)
					local Success, Result = pcall(writeAttribute, p3, p4, p5)
					
					if Success then
						return true, nil
					else
						return false, (tostring(Result))
					end
				end,
				clearProperty = function(p3, p4)
					-- upvalues: defaultFor (copy), WriteProperty (copy)
					local DefaultForResult = defaultFor(p3, p4)
					
					if DefaultForResult ~= nil then
						WriteProperty(p3, p4, DefaultForResult)
						
						return
					end
				end,
				insertChild = function(p3, p4, _)
					-- upvalues: WriteProperty (copy), CoreModule (upval), ReadProperty (copy), readClassName (copy)
					local Success, Result = pcall(WriteProperty, p4, "Parent", p3)
					
					if Success then return end
					if string.find(tostring(Result), "Parent property", 1, true) == nil then
						error(Result, 0)
					end
					local Callback: (any, any) -> () = error
					local FormatDiagnosticFunction = CoreModule.formatDiagnostic
					local v1 = "host/node-destroyed"
					local v2 = "%s was placed in %s after it was destroyed"
					local Success1, Result1 = pcall(ReadProperty, p4, "Name")
					local Result3 = nil
					
					if Success1 and type(Result1) == "string" then
						Result3 = Result1
					else
						local Success2, Result2 = pcall(readClassName, p4)
						Result3 = if Success2 and type(Result2) == "string" then Result2 else "<unknown class>"
					end
					local Success3, Result4 = pcall(ReadProperty, p3, "Name")
					local Result6 = nil
					
					if Success3 and type(Result4) == "string" then
						Result6 = Result4
					else
						local Success4, Result5 = pcall(readClassName, p3)
						Result6 = if Success4 and type(Result5) == "string" then Result5 else "<unknown class>"
					end
					local FormatResult: string = v2:format(Result3, Result6)
					local config = {
						contract = "a node lives in one place; destroying the branch that holds it destroys the node",
						fix = "build the node inside the builder, page or component that places it, so each branch makes its own; a node made once outside a show, switch or page and placed in two branches is gone after the first branch closes"
					}
					local Success5, Result7 = pcall(ReadProperty, p4, "Name")
					local Result9 = nil
					
					if Success5 and type(Result7) == "string" then
						Result9 = Result7
					else
						local Success6, Result8 = pcall(readClassName, p4)
						Result9 = if Success6 and type(Result8) == "string" then Result8 else "<unknown class>"
					end
					config.node = Result9
					local Success7, Result10 = pcall(ReadProperty, p3, "Name")
					local Result12 = nil
					
					if Success7 and type(Result10) == "string" then
						Result12 = Result10
					else
						local Success8, Result11 = pcall(readClassName, p3)
						Result12 = if Success8 and type(Result11) == "string" then Result11 else "<unknown class>"
					end
					config.parent = Result12
					config.cause = tostring(Result)
					Callback(FormatDiagnosticFunction(v1, FormatResult, config), 0)
				end,
				removeChild = function(Parent, p3)
					-- upvalues: ReadProperty (copy), WriteProperty (copy)
					if ReadProperty(p3, "Parent") == Parent then
						WriteProperty(p3, "Parent", nil)
					end
				end,
				destroyNode = p1.destroy
			},
			events = {
				connectEvent = function(p3, Event, p4)
					-- upvalues: signalOf (copy), EngineModule (upval), ReadMemberFunction (upval)
					local Connect = EngineModule.invoke(ReadMemberFunction, signalOf(p3, Event), "Connect", p4)
					local v1 = false
					
					return function()
						-- upvalues: v1 (ref), EngineModule (upval), ReadMemberFunction (upval), Connect (copy)
						if not v1 then
							v1 = true
							EngineModule.invoke(ReadMemberFunction, Connect, "Disconnect")
						end
					end
				end,
				attachEvent = function(p3, Event, p4)
					-- upvalues: EngineModule (upval), ReadMemberFunction (upval), signalOf (copy)
					return (EngineModule.invoke(ReadMemberFunction, signalOf(p3, Event), "Connect", p4))
				end,
				detachEvent = function(p3)
					-- upvalues: EngineModule (upval), ReadMemberFunction (upval)
					EngineModule.invoke(ReadMemberFunction, p3, "Disconnect")
				end,
				classifyKey = function(p3, Key)
					-- upvalues: readClassName (copy), t3 (copy), ReadProperty (copy), hasConnectMethod (copy)
					local Success, Result = pcall(readClassName, p3)
					local Result1 = if Success and type(Result) == "string" then Result else "<unknown class>"
					local Entry = t3[Result1]
					
					if Entry ~= nil then
						local Entry1 = Entry[Key]
						
						if Entry1 ~= nil then
							return Entry1
						end
					end
					local v1 = "property"
					local Success1, Result2 = pcall(ReadProperty, p3, Key)
					
					if Success1 and Result2 ~= nil then
						local Success2, Result3 = pcall(hasConnectMethod, Result2)
						
						if Success2 and Result3 then
							v1 = "event"
						end
					end
					if Result1 ~= "<unknown class>" then
						if Entry == nil then
							local t = {}
							t3[Result1] = t
							Entry = t
						end
						Entry[Key] = v1
					end
					return v1
				end
			},
			observation = {
				readProperty = ReadProperty,
				observeProperty = function(p3, p4, Callback)
					-- upvalues: p1 (copy)
					local Connection = p1.propertyChanged(p3, p4):Connect(Callback)
					local v1 = false
					
					return function()
						-- upvalues: v1 (ref), Connection (copy)
						if not v1 then
							v1 = true
							Connection:Disconnect()
						end
					end
				end,
				readStyledProperty = function(p3, p4)
					-- upvalues: EngineModule (upval), ReadProperty (copy)
					return (EngineModule.invoke(ReadProperty, p3, "GetStyled", p4))
				end,
				observeStyledProperty = function(Key, p3, Callback)
					-- upvalues: t2 (copy), ReadProperty (copy), publish (copy), EngineModule (upval), ReadMemberFunction (upval), raiseFailures (upval), p1 (copy)
					local Entry = t2[Key]
					local Entry1 = nil
					
					if Entry == nil then
						local config = { live = true, subscribers = {} }
						t2[Key] = config
						
						local function v109()
							-- upvalues: config (copy), ReadProperty (upval), Key (copy), publish (upval), EngineModule (upval), ReadMemberFunction (upval)
							local Connect = EngineModule.invoke(ReadMemberFunction, ReadProperty(Key, "StyledPropertiesChanged"), "Connect", function()
								-- upvalues: publish (upval), config (upval)
								publish(config)
							end)
							local v1 = false
							
							function config.stopStyled()
								-- upvalues: v1 (ref), EngineModule (upval), ReadMemberFunction (upval), Connect (copy)
								if not v1 then
									v1 = true
									EngineModule.invoke(ReadMemberFunction, Connect, "Disconnect")
								end
							end
						end
						
						local Success, Result = pcall(function()
							-- upvalues: v109 (copy)
							v109()
							
							return nil
						end)
						local Result1 = if Success or Result ~= nil then Result else "ComposeRoblox styled observation raised nil"
						
						if not Success then
							local ComposeRobloxStyledObservationRaisedNils = { Result1 }
							
							local function v115()
								-- upvalues: Key (copy), config (copy), t2 (upval)
								config.live = false
								t2[Key] = nil
								local StopStyledFunction: () -> () = config.stopStyled
								config.stopStyled = nil
								
								if StopStyledFunction then
									StopStyledFunction()
								end
							end
							
							local Success1, Result2 = pcall(function()
								-- upvalues: v115 (copy)
								v115()
								
								return nil
							end)
							local Result3 = if Success1 or Result2 ~= nil then Result2 else "ComposeRoblox styled observation raised nil"
							
							if not Success1 then
								table.insert(ComposeRobloxStyledObservationRaisedNils, Result3)
							end
							raiseFailures(ComposeRobloxStyledObservationRaisedNils)
						end
						Entry1 = config
					else
						Entry1 = Entry
					end
					local config1 = { live = true, listener = Callback }
					Entry1.subscribers[config1] = true
					
					local function release()
						-- upvalues: config1 (copy), Entry1 (ref), Key (copy), t2 (upval), raiseFailures (upval)
						if not config1.live then return end
						config1.live = false
						Entry1.subscribers[config1] = nil
						local ComposeRobloxStyledObservationRaisedNils = {}
						
						if config1.stopRaw then
							local StopRaw = config1.stopRaw
							local Success, Result = pcall(function()
								-- upvalues: StopRaw (copy)
								StopRaw()
								
								return nil
							end)
							local Result1 = if Success or Result ~= nil then Result else "ComposeRoblox styled observation raised nil"
							
							if not Success then
								table.insert(ComposeRobloxStyledObservationRaisedNils, Result1)
							end
							config1.stopRaw = nil
						end
						if next(Entry1.subscribers) == nil then
							local function v136()
								-- upvalues: Key (upval), Entry1 (upval), t2 (upval)
								local Entry = Entry1
								Entry.live = false
								t2[Key] = nil
								local StopStyledFunction: () -> () = Entry.stopStyled
								Entry.stopStyled = nil
								
								if StopStyledFunction then
									StopStyledFunction()
								end
							end
							
							local Success1, Result2 = pcall(function()
								-- upvalues: v136 (copy)
								v136()
								
								return nil
							end)
							local Result3 = if Success1 or Result2 ~= nil then Result2 else "ComposeRoblox styled observation raised nil"
							
							if not Success1 then
								table.insert(ComposeRobloxStyledObservationRaisedNils, Result3)
							end
						end
						raiseFailures(ComposeRobloxStyledObservationRaisedNils)
					end
					
					local function v121()
						-- upvalues: config1 (copy), Key (copy), p3 (copy), Callback (copy), p1 (upval)
						local Connection = p1.propertyChanged(Key, p3):Connect(function()
							-- upvalues: config1 (upval), Callback (upval)
							if config1.live then
								Callback()
							end
						end)
						local v1 = false
						
						function config1.stopRaw()
							-- upvalues: v1 (ref), Connection (copy)
							if not v1 then
								v1 = true
								Connection:Disconnect()
							end
						end
					end
					
					local Success2, Result4 = pcall(function()
						-- upvalues: v121 (copy)
						v121()
						
						return nil
					end)
					local Result5 = if Success2 or Result4 ~= nil then Result4 else "ComposeRoblox styled observation raised nil"
					
					if not Success2 then
						local ComposeRobloxStyledObservationRaisedNils = { Result5 }
						local Success3, Result6 = pcall(function()
							-- upvalues: release (copy)
							release()
							
							return nil
						end)
						local Result7 = if Success3 or Result6 ~= nil then Result6 else "ComposeRoblox styled observation raised nil"
						
						if not Success3 then
							table.insert(ComposeRobloxStyledObservationRaisedNils, Result7)
						end
						raiseFailures(ComposeRobloxStyledObservationRaisedNils)
					end
					return release
				end
			},
			naming = {
				setName = function(p3, p4)
					-- upvalues: WriteProperty (copy)
					WriteProperty(p3, "Name", p4)
				end
			},
			frames = {
				onFrame = function(Callback)
					-- upvalues: p1 (copy)
					local HeartbeatConnection = p1.heartbeat:Connect(Callback)
					local v1 = false
					
					return function()
						-- upvalues: v1 (ref), HeartbeatConnection (copy)
						if not v1 then
							v1 = true
							HeartbeatConnection:Disconnect()
						end
					end
				end,
				now = p1.clock
			},
			describeNode = function(p3)
				-- upvalues: ReadProperty (copy)
				local Success, Result = pcall(function(): string
					-- upvalues: ReadProperty (upval), p3 (copy)
					local Name = ReadProperty(p3, "Name")
					assert(type(Name) == "string")
					local v1 = "%s %q"
					local ClassName = ReadProperty(p3, "ClassName")
					assert(type(ClassName) == "string")
					
					return v1:format(ClassName, Name)
				end)
				
				return if Success then Result else tostring(p3)
			end,
			typeNameOf = function(p3)
				-- upvalues: p1 (copy)
				return p1.typeName(p3)
			end
		}
	end,
	readMember = ReadMemberFunction
}