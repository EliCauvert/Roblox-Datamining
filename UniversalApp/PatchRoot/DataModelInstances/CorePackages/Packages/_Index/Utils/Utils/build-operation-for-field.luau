local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Map = LuauPolyfillModule.Map
local Object = LuauPolyfillModule.Object
local GraphQLModule = require(Parent.GraphQL)
local IsObjectTypeFunction = GraphQLModule.isObjectType
local GetNamedTypeFunction = GraphQLModule.getNamedType
local IsUnionTypeFunction = GraphQLModule.isUnionType
local IsNonNullTypeFunction = GraphQLModule.isNonNullType
local IsScalarTypeFunction = GraphQLModule.isScalarType
local IsListTypeFunction = GraphQLModule.isListType
local IsInterfaceTypeFunction = GraphQLModule.isInterfaceType
local IsEnumTypeFunction = GraphQLModule.isEnumType
local Kind = GraphQLModule.Kind
local RootTypesModule = require(script.Parent.rootTypes)
local GetDefinedRootTypeFunction = RootTypesModule.getDefinedRootType
local GetRootTypeNamesFunction = RootTypesModule.getRootTypeNames
local Callback = nil
local Callback2 = nil
local Callback3 = nil
local Callback1 = nil
local SelectionSet = {}
local List = {}
local NewMap = Map.new()

local function _(p1) --[[ Line: 89 | Named "addOperationVariable" ]]
	-- upvalues: List (ref)
	table.insert(List, p1)
end

local _ = function() --[[ Line: 92 | Named "resetOperationVariables" ]]
	-- upvalues: List (ref)
	List = {}
end

local _ = function() --[[ Line: 95 | Named "resetFieldMap" ]]
	-- upvalues: NewMap (ref), Map (copy)
	NewMap = Map.new()
end

local Module = {
	buildOperationNodeForField = function(p1) --[[ Line: 102 ]]
		-- upvalues: List (ref), NewMap (ref), Map (copy), GetRootTypeNamesFunction (copy), Callback (ref), Boolean (copy), Array (copy)
		local Schema = p1.schema
		local Models = p1.models
		local DepthLimit = p1.depthLimit
		local CircularReferenceDepth = p1.circularReferenceDepth
		List = {}
		NewMap = Map.new()
		local CallbackResult = Callback({
			schema = Schema,
			fieldName = p1.field,
			kind = p1.kind,
			models = if Boolean.toJSBoolean(Models) then Models else {},
			ignore = if p1.ignore == nil then {} else p1.ignore,
			depthLimit = if Boolean.toJSBoolean(DepthLimit) then DepthLimit else 1e999,
			circularReferenceDepth = Boolean.toJSBoolean(CircularReferenceDepth) and CircularReferenceDepth or 1,
			argNames = p1.argNames,
			selectedFields = p1.selectedFields == nil or p1.selectedFields,
			rootTypeNames = GetRootTypeNamesFunction(Schema)
		})
		CallbackResult.variableDefinitions = Array.concat({}, List)
		List = {}
		NewMap = Map.new()
		
		return CallbackResult
	end
}

Callback = function(p1) --[[ Line: 174 | Named "buildOperationAndCollectVariables" ]]
	-- upvalues: GetDefinedRootTypeFunction (copy), Array (copy), Callback2 (ref), List (ref), Kind (copy), Callback1 (ref)
	local Schema = p1.schema
	local FieldName = p1.fieldName
	local Kind1 = p1.kind
	local Models = p1.models
	local Ignore = p1.ignore
	local DepthLimit = p1.depthLimit
	local CircularReferenceDepth = p1.circularReferenceDepth
	local ArgNames = p1.argNames
	local SelectedFields = p1.selectedFields
	local RootTypeNames = p1.rootTypeNames
	local DefinedRootType = GetDefinedRootTypeFunction(Schema, Kind1)
	local GetResult = DefinedRootType:getFields():get(FieldName)
	local Text: string = ("%s_%s"):format(tostring(FieldName), (tostring(Kind1)))
	
	if GetResult and GetResult.args then
		for _, arg in GetResult.args do
			local Name = arg.name
			
			if not ArgNames or Array.includes(ArgNames, Name) then
				table.insert(List, (Callback2(arg, Name)))
			end
		end
	end
	return {
		kind = Kind.OPERATION_DEFINITION,
		operation = Kind1,
		name = { kind = Kind.NAME, value = Text },
		variableDefinitions = {},
		selectionSet = {
			kind = Kind.SELECTION_SET,
			selections = {
				Callback1({
					firstCall = true,
					depth = 0,
					type = DefinedRootType,
					field = GetResult,
					models = Models,
					path = {},
					ancestors = {},
					ignore = Ignore,
					depthLimit = DepthLimit,
					circularReferenceDepth = CircularReferenceDepth,
					schema = Schema,
					argNames = ArgNames,
					selectedFields = SelectedFields,
					rootTypeNames = RootTypeNames
				})
			}
		}
	}
end

local function resolveSelectionSet(p2) --[[ Line: 259 ]]
	-- upvalues: Boolean (copy), IsUnionTypeFunction (copy), Kind (copy), Array (copy), Callback3 (ref), resolveSelectionSet (copy), SelectionSet (copy), IsInterfaceTypeFunction (copy), IsObjectTypeFunction (copy), GetNamedTypeFunction (copy), Callback1 (ref), Object (copy)
	local Parent = p2.parent
	local Type = p2.type
	local Models = p2.models
	local FirstCall = p2.firstCall
	local Path = p2.path
	local Ancestors = p2.ancestors
	local Ignore = p2.ignore
	local DepthLimit = p2.depthLimit
	local CircularReferenceDepth = p2.circularReferenceDepth
	local Schema = p2.schema
	local Depth = p2.depth
	local ArgNames = p2.argNames
	local SelectedFields = p2.selectedFields
	local RootTypeNames = p2.rootTypeNames
	
	if typeof(SelectedFields) == "boolean" and DepthLimit < Depth then return end
	if Boolean.toJSBoolean(IsUnionTypeFunction(Type)) then
		return {
			kind = Kind.SELECTION_SET,
			selections = Array.filter(Array.map(Array.filter(Type:getTypes(), function(p3): boolean --[[ Line: 305 ]]
				-- upvalues: Callback3 (upval), Array (upval), Ancestors (copy), CircularReferenceDepth (copy)
				return not Callback3(Array.concat({}, Ancestors, { p3 }), { depth = CircularReferenceDepth })
			end), function(p3) --[[ Line: 319 ]]
				-- upvalues: Kind (upval), resolveSelectionSet (upval), Type (copy), Models (copy), Path (copy), Ancestors (copy), Ignore (copy), DepthLimit (copy), CircularReferenceDepth (copy), Schema (copy), Depth (copy), ArgNames (copy), SelectedFields (copy), RootTypeNames (copy)
				return {
					kind = Kind.INLINE_FRAGMENT,
					typeCondition = {
						kind = Kind.NAMED_TYPE,
						name = { kind = Kind.NAME, value = p3.name }
					},
					selectionSet = resolveSelectionSet({
						parent = Type,
						type = p3,
						models = Models,
						path = Path,
						ancestors = Ancestors,
						ignore = Ignore,
						depthLimit = DepthLimit,
						circularReferenceDepth = CircularReferenceDepth,
						schema = Schema,
						depth = Depth,
						argNames = ArgNames,
						selectedFields = SelectedFields,
						rootTypeNames = RootTypeNames
					})
				}
			end), function(p3): boolean --[[ Line: 344 ]]
				-- upvalues: SelectionSet (upval)
				return typeof(p3) == "table" and (p3.selectionSet ~= SelectionSet and (typeof(p3.selectionSet) == "table" and typeof(p3.selectionSet.selections) == "table" and #p3.selectionSet.selections > 0))
			end)
		}
	elseif Boolean.toJSBoolean(IsInterfaceTypeFunction(Type)) then
		return {
			kind = Kind.SELECTION_SET,
			selections = Array.filter(Array.map(Array.filter(Array.filter(Schema:getTypeMap():values(), function(p3) --[[ Line: 376 ]]
				-- upvalues: IsObjectTypeFunction (upval), Boolean (upval), Array (upval), Type (copy)
				local IsObjectType = IsObjectTypeFunction(p3)
				
				return if Boolean.toJSBoolean(IsObjectType) then Array.includes(p3:getInterfaces(), Type) else IsObjectType
			end), function(p3): boolean --[[ Line: 387 ]]
				-- upvalues: Callback3 (upval), Array (upval), Ancestors (copy), CircularReferenceDepth (copy)
				return not Callback3(Array.concat({}, Ancestors, { p3 }), { depth = CircularReferenceDepth })
			end), function(p3) --[[ Line: 401 ]]
				-- upvalues: Kind (upval), resolveSelectionSet (upval), Type (copy), Models (copy), Path (copy), Ancestors (copy), Ignore (copy), DepthLimit (copy), CircularReferenceDepth (copy), Schema (copy), Depth (copy), ArgNames (copy), SelectedFields (copy), RootTypeNames (copy)
				return {
					kind = Kind.INLINE_FRAGMENT,
					typeCondition = {
						kind = Kind.NAMED_TYPE,
						name = { kind = Kind.NAME, value = p3.name }
					},
					selectionSet = resolveSelectionSet({
						parent = Type,
						type = p3,
						models = Models,
						path = Path,
						ancestors = Ancestors,
						ignore = Ignore,
						depthLimit = DepthLimit,
						circularReferenceDepth = CircularReferenceDepth,
						schema = Schema,
						depth = Depth,
						argNames = ArgNames,
						selectedFields = SelectedFields,
						rootTypeNames = RootTypeNames
					})
				}
			end), function(p3): boolean --[[ Line: 426 ]]
				-- upvalues: SelectionSet (upval)
				return typeof(p3) == "table" and p3.selectionSet ~= SelectionSet and typeof(p3.selectionSet) == "table" and typeof(p3.selectionSet.selections) == "table" and #p3.selectionSet.selections > 0
			end)
		}
	else
		local ToJSBooleanFunction = Boolean.toJSBoolean
		local IsObjectType = IsObjectTypeFunction(Type)
		
		if not ToJSBooleanFunction(if Boolean.toJSBoolean(IsObjectType) then not Boolean.toJSBoolean(RootTypeNames:has(Type.name)) else IsObjectType) then
			return nil
		end
		local IncludesResult = Array.includes(Ignore, Type.name)
		local IncludesResult1 = Boolean.toJSBoolean(IncludesResult) and IncludesResult or Array.includes(Ignore, ("%s.%s"):format(Parent.name, (tostring(Path[#Path]))))
		local IncludesResult2 = Array.includes(Models, Type.name)
		local IncludesResult21 = not Boolean.toJSBoolean(FirstCall) and IncludesResult2
		
		if Boolean.toJSBoolean(if Boolean.toJSBoolean(IncludesResult21) then not Boolean.toJSBoolean(IncludesResult1) else IncludesResult21) then
			return {
				kind = Kind.SELECTION_SET,
				selections = {
					{
						kind = Kind.FIELD,
						name = { value = "id", kind = Kind.NAME }
					}
				}
			}
		else
			local Fields = Type:getFields()
			
			return {
				kind = Kind.SELECTION_SET,
				selections = Array.filter(Array.map(Array.filter(Fields:keys(), function(p3): boolean --[[ Line: 504 ]]
					-- upvalues: Callback3 (upval), Array (upval), Ancestors (copy), GetNamedTypeFunction (upval), Fields (copy), CircularReferenceDepth (copy)
					return not Callback3(Array.concat({}, Ancestors, { GetNamedTypeFunction(Fields:get(p3).type) }), { depth = CircularReferenceDepth })
				end), function(p3) --[[ Line: 517 ]]
					-- upvalues: SelectedFields (copy), Boolean (upval), Callback1 (upval), Type (copy), Fields (copy), Models (copy), Array (upval), Path (copy), Ancestors (copy), Ignore (copy), DepthLimit (copy), CircularReferenceDepth (copy), Schema (copy), Depth (copy), ArgNames (copy), RootTypeNames (copy), SelectionSet (upval)
					local IsNotTable = typeof(SelectedFields) ~= "table" or SelectedFields[tostring(p3)]
					
					return if Boolean.toJSBoolean(IsNotTable) then Callback1({
						type = Type,
						field = Fields:get(p3),
						models = Models,
						path = Array.concat({}, Path, { p3 }),
						ancestors = Ancestors,
						ignore = Ignore,
						depthLimit = DepthLimit,
						circularReferenceDepth = CircularReferenceDepth,
						schema = Schema,
						depth = Depth,
						argNames = ArgNames,
						selectedFields = IsNotTable,
						rootTypeNames = RootTypeNames
					}) else SelectionSet
				end), function(SelectionSet1) --[[ Line: 552 ]]
					-- upvalues: SelectionSet (upval), Array (upval), Object (upval), Boolean (upval)
					return SelectionSet1 ~= nil and SelectionSet1 ~= SelectionSet and (Array.indexOf(Object.keys(SelectionSet1), "selectionSet") == -1 or Boolean.toJSBoolean(if typeof(SelectionSet1.selectionSet) == "table" and typeof(SelectionSet1.selectionSet.selections) == "table" then #SelectionSet1.selectionSet.selections else nil))
				end)
			}
		end
	end
end

Callback2 = function(p2, Name) --[[ Line: 592 | Named "resolveVariable" ]]
	-- upvalues: Boolean (copy), IsListTypeFunction (copy), Kind (copy), IsNonNullTypeFunction (copy)
	local function resolveVariableType(OfType) --[[ Line: 599 ]]
		-- upvalues: Boolean (upval), IsListTypeFunction (upval), Kind (upval), resolveVariableType (copy), IsNonNullTypeFunction (upval)
		return if Boolean.toJSBoolean(IsListTypeFunction(OfType)) then {
			kind = Kind.LIST_TYPE,
			type = resolveVariableType(OfType.ofType)
		} elseif Boolean.toJSBoolean(IsNonNullTypeFunction(OfType)) then {
			kind = Kind.NON_NULL_TYPE,
			type = resolveVariableType(OfType.ofType)
		} else {
			kind = Kind.NAMED_TYPE,
			name = { kind = Kind.NAME, value = OfType.name }
		}
	end
	
	return {
		kind = Kind.VARIABLE_DEFINITION,
		variable = {
			kind = Kind.VARIABLE,
			name = {
				kind = Kind.NAME,
				value = Boolean.toJSBoolean(Name) and Name or p2.name
			}
		},
		type = resolveVariableType(p2.type)
	}
end

local function getArgumentName(Name, Path) --[[ Line: 622 ]]
	-- upvalues: Array (copy)
	return Array.join(Array.concat({}, Path, { Name }), "_")
end

Callback1 = function(p2) --[[ Line: 646 | Named "resolveField" ]]
	-- upvalues: GetNamedTypeFunction (copy), Boolean (copy), Array (copy), getArgumentName (copy), IsNonNullTypeFunction (copy), Callback2 (ref), List (ref), Kind (copy), NewMap (ref), IsScalarTypeFunction (copy), IsEnumTypeFunction (copy), resolveSelectionSet (copy), Object (copy), SelectionSet (copy)
	local Type = p2.type
	local Field = p2.field
	local Models = p2.models
	local FirstCall = p2.firstCall
	local Path = p2.path
	local Ancestors = p2.ancestors
	local Ignore = p2.ignore
	local DepthLimit = p2.depthLimit
	local CircularReferenceDepth = p2.circularReferenceDepth
	local Schema = p2.schema
	local Depth: number = p2.depth
	local ArgNames = p2.argNames
	local SelectedFields = p2.selectedFields
	local RootTypeNames = p2.rootTypeNames
	local NamedType = GetNamedTypeFunction(Field.type)
	local Arguments = {}
	local Flag = false
	
	if Boolean.toJSBoolean(Field.args) and #Field.args ~= 0 then
		Arguments = Array.filter(Array.map(Field.args, function(p3) --[[ Line: 686 ]]
			-- upvalues: getArgumentName (upval), Path (copy), ArgNames (copy), Array (upval), Boolean (upval), IsNonNullTypeFunction (upval), Flag (ref), FirstCall (copy), Callback2 (upval), List (upval), Kind (upval)
			local ArgumentName = getArgumentName(p3.name, Path)
			
			if if ArgNames then not Array.includes(ArgNames, ArgumentName) else Boolean.toJSBoolean(ArgNames) then
				if Boolean.toJSBoolean(IsNonNullTypeFunction(p3.type)) then
					Flag = true
				end
				return nil
			else
				if not Boolean.toJSBoolean(FirstCall) then
					table.insert(List, (Callback2(p3, ArgumentName)))
				end
				return {
					kind = Kind.ARGUMENT,
					name = { kind = Kind.NAME, value = p3.name },
					value = {
						kind = Kind.VARIABLE,
						name = {
							kind = Kind.NAME,
							value = getArgumentName(p3.name, Path)
						}
					}
				}
			end
		end), Boolean.toJSBoolean)
	end
	if Boolean.toJSBoolean(Flag) then
		return nil
	end
	local ConcatResult = Array.concat({}, Path, { Field.name })
	local v1 = Array.join(ConcatResult, ".")
	local Name = Field.name
	local HasResult = NewMap:has(v1)
	
	if Boolean.toJSBoolean(if Boolean.toJSBoolean(HasResult) then NewMap:get(v1) ~= tostring(Field.type) else HasResult) then
		Name ..= tostring(Field.type):gsub("!", "NonNull")
	end
	NewMap:set(v1, (tostring(Field.type)))
	
	if Boolean.toJSBoolean(IsScalarTypeFunction(NamedType)) or Boolean.toJSBoolean(IsEnumTypeFunction(NamedType)) then
		return Object.assign({}, {
			kind = Kind.FIELD,
			name = { kind = Kind.NAME, value = Field.name }
		}, Name ~= Field.name and { alias = { kind = Kind.NAME, value = Name } }, { arguments = Arguments })
	else
		local ResolveSelectionSetResult = resolveSelectionSet({
			parent = Type,
			type = NamedType,
			models = Models,
			firstCall = FirstCall,
			path = ConcatResult,
			ancestors = Array.concat({}, Ancestors, { Type }),
			ignore = Ignore,
			depthLimit = DepthLimit,
			circularReferenceDepth = CircularReferenceDepth,
			schema = Schema,
			depth = Depth + 1,
			argNames = ArgNames,
			selectedFields = SelectedFields,
			rootTypeNames = RootTypeNames
		})
		local ResolveSelectionSetResult1 = if Boolean.toJSBoolean(ResolveSelectionSetResult) then ResolveSelectionSetResult else nil
		
		return Object.assign({}, {
			kind = Kind.FIELD,
			name = { kind = Kind.NAME, value = Field.name }
		}, Name ~= Field.name and { alias = { kind = Kind.NAME, value = Name } }, {
			selectionSet = Boolean.toJSBoolean(ResolveSelectionSetResult1) and ResolveSelectionSetResult1 or SelectionSet,
			arguments = Arguments
		})
	end
end

Callback3 = function(ConcatResult, p2): boolean --[[ Line: 782 | Named "hasCircularRef" ]]
	-- upvalues: Boolean (copy), IsScalarTypeFunction (copy), Array (copy)
	local Config = if p2 == nil then { depth = 1 } else p2
	local ConcatResultEntry = ConcatResult[#ConcatResult]
	
	return not Boolean.toJSBoolean(IsScalarTypeFunction(ConcatResultEntry)) and Config.depth < #Array.filter(ConcatResult, function(p3): boolean --[[ Line: 798 ]]
		-- upvalues: ConcatResultEntry (copy)
		return p3.name == ConcatResultEntry.name
	end)
end

return Module