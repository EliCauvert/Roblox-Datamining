local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Error1 = LuauPolyfillModule.Error
local Console = LuauPolyfillModule.console
local GraphQLModule = require(Parent.GraphQL)
local GraphQLList = GraphQLModule.GraphQLList
local GraphQLNonNull = GraphQLModule.GraphQLNonNull
local IsNamedTypeFunction = GraphQLModule.isNamedType
local IsObjectTypeFunction = GraphQLModule.isObjectType
local IsInterfaceTypeFunction = GraphQLModule.isInterfaceType
local IsUnionTypeFunction = GraphQLModule.isUnionType
local IsInputObjectTypeFunction = GraphQLModule.isInputObjectType
local IsLeafTypeFunction = GraphQLModule.isLeafType
local IsListTypeFunction = GraphQLModule.isListType
local IsNonNullTypeFunction = GraphQLModule.isNonNullType
local Map = LuauPolyfillModule.Map
local String = LuauPolyfillModule.String
local Callback = nil

local function healSchema(p1)
	-- upvalues: Callback (ref)
	Callback(p1:getTypeMap(), p1:getDirectives())
	
	return p1
end

Callback = function(List, Directives)
	-- upvalues: Boolean (copy), IsObjectTypeFunction (copy), IsInterfaceTypeFunction (copy), IsUnionTypeFunction (copy), IsInputObjectTypeFunction (copy), IsLeafTypeFunction (copy), Error1 (copy), Array (copy), IsListTypeFunction (copy), GraphQLList (copy), IsNonNullTypeFunction (copy), GraphQLNonNull (copy), IsNamedTypeFunction (copy), Map (copy), String (copy), Console (copy)
	local Callback = nil
	local Callback1 = nil
	local Callback3 = nil
	local Callback2 = nil
	local Callback4 = nil
	
	local function healNamedType(GetResult)
		-- upvalues: Boolean (upval), IsObjectTypeFunction (upval), Callback (ref), Callback1 (ref), IsInterfaceTypeFunction (upval), IsUnionTypeFunction (upval), Callback2 (ref), IsInputObjectTypeFunction (upval), Callback3 (ref), IsLeafTypeFunction (upval), Error1 (upval)
		if Boolean.toJSBoolean(IsObjectTypeFunction(GetResult)) then
			Callback(GetResult)
			Callback1(GetResult)
			
			return
		end
		if Boolean.toJSBoolean(IsInterfaceTypeFunction(GetResult)) then
			Callback(GetResult)
			
			if GetResult.getInterfaces ~= nil then
				Callback1(GetResult)
			end
			return
		elseif Boolean.toJSBoolean(IsUnionTypeFunction(GetResult)) then
			Callback2(GetResult)
			
			return
		else
			if Boolean.toJSBoolean(IsInputObjectTypeFunction(GetResult)) then
				Callback3(GetResult)
				
				return
			end
			if not Boolean.toJSBoolean(IsLeafTypeFunction(GetResult)) then
				error(Error1.new(("Unexpected schema type: %s"):format((tostring(GetResult)))))
				
				return
			end
		end
	end
	
	Callback = function(p1)
		-- upvalues: Array (upval), Callback4 (ref), Boolean (upval)
		local Fields = p1:getFields()
		
		for _, value in Fields:entries() do
			local v1 = value[1]
			local v2 = value[2]
			Array.filter(Array.map(v2.args, function(p2)
				-- upvalues: Callback4 (upval)
				p2.type = Callback4(p2.type)
				
				return if p2.type == nil then nil else p2
			end), Boolean.toJSBoolean)
			v2.type = Callback4(v2.type)
			
			if v2.type == nil then
				Fields[tostring(v1)] = nil
			end
		end
	end
	
	Callback1 = function(p2)
		-- upvalues: Array (upval), Callback4 (ref), Boolean (upval)
		if p2.getInterfaces ~= nil then
			local Interfaces = p2:getInterfaces()
			local _ = Array.concat(Interfaces, Array.filter(Array.map(Array.splice(Interfaces, 1), function(p3)
				-- upvalues: Callback4 (upval)
				return (Callback4(p3))
			end), Boolean.toJSBoolean))
		end
	end
	
	Callback3 = function(p2)
		-- upvalues: Callback4 (ref)
		local Fields = p2:getFields()
		
		for _, value in Fields:entries() do
			local v3 = value[1]
			local v4 = value[2]
			v4.type = Callback4(v4.type)
			
			if v4.type == nil then
				Fields[tostring(v3)] = nil
			end
		end
	end
	
	Callback2 = function(p3)
		-- upvalues: Array (upval), Callback4 (ref), Boolean (upval)
		local Types = p3:getTypes()
		local _ = Array.concat(Types, Array.filter(Array.map(Array.splice(Types, 1), function(p4)
			-- upvalues: Callback4 (upval)
			return (Callback4(p4))
		end), Boolean.toJSBoolean))
	end
	
	Callback4 = function(Type)
		-- upvalues: Boolean (upval), IsListTypeFunction (upval), Callback4 (ref), GraphQLList (upval), IsNonNullTypeFunction (upval), GraphQLNonNull (upval), IsNamedTypeFunction (upval), List (copy)
		if Boolean.toJSBoolean(IsListTypeFunction(Type)) then
			local CallbackResult = Callback4(Type.ofType)
			
			return if CallbackResult == nil then nil else GraphQLList.new(CallbackResult)
		end
		if Boolean.toJSBoolean(IsNonNullTypeFunction(Type)) then
			local CallbackResult = Callback4(Type.ofType)
			
			return if CallbackResult == nil then nil else GraphQLNonNull.new(CallbackResult)
		end
		if Boolean.toJSBoolean(IsNamedTypeFunction(Type)) then
			local GetResult = List:get(Type.name)
			
			if Boolean.toJSBoolean(if Boolean.toJSBoolean(GetResult) then Type ~= GetResult else GetResult) then
				return GetResult
			end
		end
		return Type
	end
	
	local NewMap = Map.new()
	
	for _, value in List do
		local Unpacked = table.unpack(value)
		local GetResult = List:get(Unpacked)
		local NoGetResult = GetResult == nil or String.startsWith(Unpacked, "__")
		local Name = nil
		
		if not NoGetResult then
			Name = GetResult.name
			NoGetResult = String.startsWith(Name, "__")
		end
		if not NoGetResult then
			if NewMap:get(Name) == nil then
				NewMap:set(Name, GetResult)
			else
				Console.warn(("Duplicate schema type name %s found; keeping the existing one found in the schema"):format(Name))
			end
		end
	end
	for _, value1 in NewMap do
		local Unpacked = table.unpack(value1)
		List:set(Unpacked, (NewMap:get(Unpacked)))
	end
	for _, directive in Directives do
		directive.args = Array.filter(directive.args, function(p3): boolean
			-- upvalues: Callback4 (ref)
			p3.type = Callback4(p3.type)
			
			return p3.type ~= nil
		end)
	end
	for _, value2 in List do
		local Unpacked = table.unpack(value2)
		local GetResult = List:get(Unpacked)
		
		if not String.startsWith(Unpacked, "__") and Array.indexOf(NewMap:keys(), Unpacked) ~= -1 and GetResult ~= nil then
			healNamedType(GetResult)
		end
	end
	for _, value3 in List do
		local Unpacked = table.unpack(value3)
		
		if not String.startsWith(Unpacked, "__") and Array.indexOf(NewMap:keys(), Unpacked) == -1 then
			List:set(Unpacked, nil)
		end
	end
end

return { healSchema = healSchema, healTypes = Callback }