local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Map = LuauPolyfillModule.Map
local Object = LuauPolyfillModule.Object
local Set = LuauPolyfillModule.Set
local GraphQLModule = require(Parent.GraphQL)
local GetNamedTypeFunction = GraphQLModule.getNamedType
local IsObjectTypeFunction = GraphQLModule.isObjectType
local IsInterfaceTypeFunction = GraphQLModule.isInterfaceType
local IsUnionTypeFunction = GraphQLModule.isUnionType
local IsInputObjectTypeFunction = GraphQLModule.isInputObjectType
local IsSpecifiedScalarTypeFunction = GraphQLModule.isSpecifiedScalarType
local IsScalarTypeFunction = GraphQLModule.isScalarType
local IsEnumTypeFunction = GraphQLModule.isEnumType
local _ = require(script.Parent.types)
local MapSchemaFunction = require(script.Parent.mapSchema).mapSchema
local MapperKind = require(script.Parent.Interfaces).MapperKind
local GetRootTypesFunction = require(script.Parent.rootTypes).getRootTypes
local GetImplementingTypesFunction = require(script.Parent["get-implementing-types"]).getImplementingTypes
local String = LuauPolyfillModule.String
local Callback1 = nil
local Callback = nil
local Callback2 = nil
local PruneModule = {
	pruneSchema = function(p1, p2)
		-- upvalues: Callback1 (ref), String (copy), Callback (ref), MapSchemaFunction (copy), MapperKind (copy), Boolean (copy), IsSpecifiedScalarTypeFunction (copy), IsUnionTypeFunction (copy), IsInputObjectTypeFunction (copy), IsInterfaceTypeFunction (copy), IsObjectTypeFunction (copy), IsScalarTypeFunction (copy), Object (copy)
		local T = if p2 == nil then {} else p2
		local SkipEmptyCompositeTypePruning = T.skipEmptyCompositeTypePruning
		local SkipEmptyUnionPruning = T.skipEmptyUnionPruning
		local SkipPruningFunction = T.skipPruning
		local SkipUnimplementedInterfacesPruning = T.skipUnimplementedInterfacesPruning
		local SkipUnusedTypesPruning = T.skipUnusedTypesPruning
		local List = {}
		local v1 = p1
		repeat
			local CallbackResult = Callback1(v1)
			if SkipPruningFunction then
				local ConcatResult = {}
				
				for _, value in v1:getTypeMap() do
					local v2 = value[1]
					
					if not String.startsWith(v2, "__") then
						local Type = v1:getType(v2)
						
						if Type and SkipPruningFunction(Type) then
							table.insert(ConcatResult, v2)
						end
					end
				end
				CallbackResult = Callback(ConcatResult, v1, CallbackResult)
			end
			List = {}
			v1 = MapSchemaFunction(v1, {
				[MapperKind.TYPE] = function(p3)
					-- upvalues: Boolean (upval), CallbackResult (ref), IsSpecifiedScalarTypeFunction (upval), IsUnionTypeFunction (upval), IsInputObjectTypeFunction (upval), IsInterfaceTypeFunction (upval), IsObjectTypeFunction (upval), IsScalarTypeFunction (upval), SkipUnusedTypesPruning (copy), SkipEmptyUnionPruning (copy), SkipEmptyCompositeTypePruning (copy), SkipUnimplementedInterfacesPruning (copy), List (ref), Object (upval)
					if Boolean.toJSBoolean(CallbackResult:has(p3.name)) or Boolean.toJSBoolean(IsSpecifiedScalarTypeFunction(p3)) then
						return p3
					elseif IsUnionTypeFunction(p3) or IsInputObjectTypeFunction(p3) or IsInterfaceTypeFunction(p3) or IsObjectTypeFunction(p3) or IsScalarTypeFunction(p3) then
						if Boolean.toJSBoolean(SkipUnusedTypesPruning) then
							return p3
						elseif IsUnionTypeFunction(p3) and SkipEmptyUnionPruning and not Boolean.toJSBoolean(#p3.getTypes(p3)) then
							return p3
						elseif (IsInputObjectTypeFunction(p3) or IsInterfaceTypeFunction(p3) or IsObjectTypeFunction(p3)) and SkipEmptyCompositeTypePruning and not Boolean.toJSBoolean(#p3.getFields(p3):keys()) then
							return p3
						elseif IsInterfaceTypeFunction(p3) and SkipUnimplementedInterfacesPruning then
							return p3
						end
					end
					table.insert(List, p3.name)
					CallbackResult:delete(p3.name)
					
					return Object.None
				end
			})
		until #List == 0
		return v1
	end
}

Callback1 = function(p1)
	-- upvalues: GetRootTypesFunction (copy), Callback (ref)
	local ConcatResult = {}
	
	for _, value in GetRootTypesFunction(p1) do
		table.insert(ConcatResult, value.name)
	end
	return Callback(ConcatResult, p1)
end

Callback = function(List, p2, p3)
	-- upvalues: Set (copy), Map (copy), Boolean (copy), IsUnionTypeFunction (copy), Array (copy), IsInterfaceTypeFunction (copy), GetImplementingTypesFunction (copy), IsEnumTypeFunction (copy), Callback2 (ref), IsObjectTypeFunction (copy), GetNamedTypeFunction (copy)
	local NewSet = if p3 == nil then Set.new() else p3
	local NewMap = Map.new()
	while #List ~= 0 do
		local Removed = table.remove(List)
		
		if NewSet:has(Removed) and NewMap[Removed] ~= true then continue end
		local Type = p2:getType(Removed)
		
		if not Boolean.toJSBoolean(Type) or not Type then continue end
		if Boolean.toJSBoolean(IsUnionTypeFunction(Type)) then
			List = Array.concat(List, Array.map(Type:getTypes(), function(p4)
				return p4.name
			end))
		end
		if IsInterfaceTypeFunction(Type) and NewMap[Removed] == true then
			List = Array.concat(List, GetImplementingTypesFunction(Type.name, p2))
			NewMap[tostring(Removed)] = false
		end
		if Boolean.toJSBoolean(IsEnumTypeFunction(Type)) then
			List = Array.concat(List, Array.flatMap(Type:getValues(), function(p4)
				-- upvalues: Callback2 (upval), p2 (copy)
				return if p4.astNode then Callback2(p2, p4.astNode) else {}
			end))
		end
		if Type.getInterfaces ~= nil then
			List = Array.concat(List, Array.map(Type:getInterfaces(), function(p4)
				return p4.name
			end))
		end
		if Type.getFields ~= nil then
			local EntriesResult = Type:getFields():entries()
			
			if #EntriesResult == 0 then continue end
			for _, value in EntriesResult do
				local v1 = value[2]
				
				if Boolean.toJSBoolean(IsObjectTypeFunction(Type)) then
					List = Array.concat(List, Array.flatMap(v1.args, function(p4)
						-- upvalues: GetNamedTypeFunction (upval), Array (upval), Callback2 (upval), p2 (copy)
						local ConcatResult = { GetNamedTypeFunction(p4.type).name }
						
						if p4.astNode then
							ConcatResult = Array.concat(ConcatResult, Callback2(p2, p4.astNode))
						end
						return ConcatResult
					end))
				end
				local NamedType = GetNamedTypeFunction(v1.type)
				table.insert(List, NamedType.name)
				
				if Boolean.toJSBoolean(v1.astNode) then
					List = Array.concat(List, Callback2(p2, v1.astNode))
				end
				if IsInterfaceTypeFunction(NamedType) and not NewMap:has(NamedType.name) then
					NewMap[tostring(NamedType.name)] = true
				end
			end
		end
		if Boolean.toJSBoolean(Type.astNode) then
			List = Array.concat(List, Callback2(p2, Type.astNode))
		end
		NewSet:add(Removed)
	end
	return NewSet
end

Callback2 = function(p4, AstNode)
	-- upvalues: Array (copy), GetNamedTypeFunction (copy)
	return Array.flatMap(AstNode.directives or {}, function(p5)
		-- upvalues: p4 (copy), Array (upval), GetNamedTypeFunction (upval)
		local Directive = p4:getDirective(p5.name.value)
		local Args = if typeof(Directive) == "table" then Directive.args else nil
		local MapResult = if Args == nil then nil else Array.map(Args, function(p6)
			-- upvalues: GetNamedTypeFunction (upval)
			return GetNamedTypeFunction(p6.type).name
		end)
		
		return if MapResult == nil then {} else MapResult
	end)
end

return PruneModule