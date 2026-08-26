local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local map = luauPolyfillModule.Map
local object = luauPolyfillModule.Object
local t = {}
local graphQLModule = require(parent.GraphQL)
local isObjectType = graphQLModule.isObjectType
local getNamedType = graphQLModule.getNamedType
local isUnionType = graphQLModule.isUnionType
local isNonNullType = graphQLModule.isNonNullType
local isScalarType = graphQLModule.isScalarType
local isListType = graphQLModule.isListType
local isInterfaceType = graphQLModule.isInterfaceType
local isEnumType = graphQLModule.isEnumType
local kind = graphQLModule.Kind
local rootTypesModule = require(script.Parent.rootTypes)
local getDefinedRootType = rootTypesModule.getDefinedRootType
local getRootTypeNames = rootTypesModule.getRootTypeNames
local buildOperationAndCollectVariables = nil
local resolveVariable = nil
local hasCircularRef = nil
local resolveField = nil
local t_1 = {}
local t_2 = {}
local var1 = map.new()

local function _(p1)
	-- upvalues: t_2 (write)
	table.insert(t_2, p1)
end

local _ = function()
	-- upvalues: t_2 (write)
	t_2 = {}
end

local _ = function()
	-- upvalues: var1 (write), map (ref)
	var1 = map.new()
end

function t.buildOperationNodeForField(p1)
	-- upvalues: t_2 (write), var1 (write), map (ref), getRootTypeNames (ref), buildOperationAndCollectVariables (write), boolean (ref), array (ref)
	local schema = p1.schema
	local kind = p1.kind
	local field = p1.field
	local models = p1.models
	local var2 = if p1.ignore == nil then {} else p1.ignore
	local depthLimit = p1.depthLimit
	local circularReferenceDepth = p1.circularReferenceDepth
	local argNames = p1.argNames
	local var3 = p1.selectedFields == nil or p1.selectedFields
	t_2 = {}
	var1 = map.new()
	local var4 = buildOperationAndCollectVariables({
		schema = schema,
		fieldName = field,
		kind = kind,
		models = if boolean.toJSBoolean(models) then models else {},
		ignore = var2,
		depthLimit = if boolean.toJSBoolean(depthLimit) then depthLimit else 1e999,
		circularReferenceDepth = if boolean.toJSBoolean(circularReferenceDepth) then circularReferenceDepth else 1,
		argNames = argNames,
		selectedFields = var3,
		rootTypeNames = getRootTypeNames(schema)
	})
	var4.variableDefinitions = array.concat({}, t_2)
	t_2 = {}
	var1 = map.new()
	
	return var4
end

buildOperationAndCollectVariables = function(p1)
	-- upvalues: getDefinedRootType (ref), array (ref), resolveVariable (write), t_2 (write), kind (ref), resolveField (write)
	local schema = p1.schema
	local fieldName = p1.fieldName
	local kind_1 = p1.kind
	local models = p1.models
	local ignore = p1.ignore
	local depthLimit = p1.depthLimit
	local circularReferenceDepth = p1.circularReferenceDepth
	local argNames = p1.argNames
	local selectedFields = p1.selectedFields
	local rootTypeNames = p1.rootTypeNames
	local var2 = getDefinedRootType(schema, kind_1)
	local var3 = var2:getFields():get(fieldName)
	local var4 = ("%s_%s"):format(tostring(fieldName), tostring(kind_1))
	
	if var3 and var3.args then
		for i, v in var3.args do
			local name = v.name
			
			if not argNames or array.includes(argNames, name) then
				table.insert(t_2, resolveVariable(v, name))
			end
		end
	end
	return {
		kind = kind.OPERATION_DEFINITION,
		operation = kind_1,
		name = { kind = kind.NAME, value = var4 },
		variableDefinitions = {},
		selectionSet = {
			kind = kind.SELECTION_SET,
			selections = {
				resolveField({
					firstCall = true,
					depth = 0,
					type = var2,
					field = var3,
					models = models,
					path = {},
					ancestors = {},
					ignore = ignore,
					depthLimit = depthLimit,
					circularReferenceDepth = circularReferenceDepth,
					schema = schema,
					argNames = argNames,
					selectedFields = selectedFields,
					rootTypeNames = rootTypeNames
				})
			}
		}
	}
end

local function resolveSelectionSet(value)
	-- upvalues: boolean (ref), isUnionType (ref), kind (ref), array (ref), hasCircularRef (write), resolveSelectionSet (ref), t_1 (ref), isInterfaceType (ref), isObjectType (ref), getNamedType (ref), resolveField (write), object (ref)
	local parent = value.parent
	local type = value.type
	local models = value.models
	local firstCall = value.firstCall
	local path = value.path
	local ancestors = value.ancestors
	local ignore = value.ignore
	local depthLimit = value.depthLimit
	local circularReferenceDepth = value.circularReferenceDepth
	local schema = value.schema
	local depth = value.depth
	local argNames = value.argNames
	local selectedFields = value.selectedFields
	local rootTypeNames = value.rootTypeNames
	
	if typeof(selectedFields) == "boolean" and depthLimit < depth then return end
	if boolean.toJSBoolean(isUnionType(type)) then
		return {
			kind = kind.SELECTION_SET,
			selections = array.filter(array.map(array.filter(type:getTypes(), function(p2)
				-- upvalues: hasCircularRef (copy), array (copy), ancestors (ref), circularReferenceDepth (ref)
				return not hasCircularRef(array.concat({}, ancestors, { p2 }), { depth = circularReferenceDepth })
			end), function(p2)
				-- upvalues: kind (copy), resolveSelectionSet (copy), type (ref), models (ref), path (ref), ancestors (ref), ignore (ref), depthLimit (ref), circularReferenceDepth (ref), schema (ref), depth (ref), argNames (ref), selectedFields (ref), rootTypeNames (ref)
				return {
					kind = kind.INLINE_FRAGMENT,
					typeCondition = {
						kind = kind.NAMED_TYPE,
						name = { kind = kind.NAME, value = p2.name }
					},
					selectionSet = resolveSelectionSet({
						parent = type,
						type = p2,
						models = models,
						path = path,
						ancestors = ancestors,
						ignore = ignore,
						depthLimit = depthLimit,
						circularReferenceDepth = circularReferenceDepth,
						schema = schema,
						depth = depth,
						argNames = argNames,
						selectedFields = selectedFields,
						rootTypeNames = rootTypeNames
					})
				}
			end), function(p2)
				-- upvalues: t_1 (copy)
				return typeof(p2) == "table" and (p2.selectionSet ~= t_1 and (typeof(p2.selectionSet) == "table" and (typeof(p2.selectionSet.selections) == "table" and #p2.selectionSet.selections > 0)))
			end)
		}
	elseif boolean.toJSBoolean(isInterfaceType(type)) then
		return {
			kind = kind.SELECTION_SET,
			selections = array.filter(array.map(array.filter(array.filter(schema:getTypeMap():values(), function(p2)
				-- upvalues: isObjectType (copy), boolean (copy), array (copy), type (ref)
				local var5 = isObjectType(p2)
				
				return if boolean.toJSBoolean(var5) then array.includes(p2:getInterfaces(), type) else var5
			end), function(p2)
				-- upvalues: hasCircularRef (copy), array (copy), ancestors (ref), circularReferenceDepth (ref)
				return not hasCircularRef(array.concat({}, ancestors, { p2 }), { depth = circularReferenceDepth })
			end), function(p2)
				-- upvalues: kind (copy), resolveSelectionSet (copy), type (ref), models (ref), path (ref), ancestors (ref), ignore (ref), depthLimit (ref), circularReferenceDepth (ref), schema (ref), depth (ref), argNames (ref), selectedFields (ref), rootTypeNames (ref)
				return {
					kind = kind.INLINE_FRAGMENT,
					typeCondition = {
						kind = kind.NAMED_TYPE,
						name = { kind = kind.NAME, value = p2.name }
					},
					selectionSet = resolveSelectionSet({
						parent = type,
						type = p2,
						models = models,
						path = path,
						ancestors = ancestors,
						ignore = ignore,
						depthLimit = depthLimit,
						circularReferenceDepth = circularReferenceDepth,
						schema = schema,
						depth = depth,
						argNames = argNames,
						selectedFields = selectedFields,
						rootTypeNames = rootTypeNames
					})
				}
			end), function(p2)
				-- upvalues: t_1 (copy)
				return typeof(p2) == "table" and p2.selectionSet ~= t_1 and (typeof(p2.selectionSet) == "table" and typeof(p2.selectionSet.selections) == "table") and #p2.selectionSet.selections > 0
			end)
		}
	end
	local var5 = isObjectType(type)
	
	if not boolean.toJSBoolean(if boolean.toJSBoolean(var5) then not boolean.toJSBoolean(rootTypeNames:has(type.name)) else var5) then
		return nil
	end
	local var6 = array.includes(ignore, type.name)
	local var7 = not boolean.toJSBoolean(firstCall) and array.includes(models, type.name)
	
	if boolean.toJSBoolean(if boolean.toJSBoolean(var7) then not boolean.toJSBoolean(if boolean.toJSBoolean(var6) then var6 else array.includes(ignore, ("%s.%s"):format(parent.name, tostring(path[#path])))) else var7) then
		return {
			kind = kind.SELECTION_SET,
			selections = {
				{
					kind = kind.FIELD,
					name = { value = "id", kind = kind.NAME }
				}
			}
		}
	end
	local fields = type:getFields()
	
	return {
		kind = kind.SELECTION_SET,
		selections = array.filter(array.map(array.filter(fields:keys(), function(p2)
			-- upvalues: hasCircularRef (copy), array (copy), ancestors (ref), getNamedType (copy), fields (ref), circularReferenceDepth (ref)
			return not hasCircularRef(array.concat({}, ancestors, { getNamedType(fields:get(p2).type) }), { depth = circularReferenceDepth })
		end), function(p2)
			-- upvalues: selectedFields (ref), boolean (copy), resolveField (copy), type (ref), fields (ref), models (ref), array (copy), path (ref), ancestors (ref), ignore (ref), depthLimit (ref), circularReferenceDepth (ref), schema (ref), depth (ref), argNames (ref), rootTypeNames (ref), t_1 (copy)
			local var8 = if typeof(selectedFields) == "table" then selectedFields[tostring(p2)] else true
			
			return if boolean.toJSBoolean(var8) then resolveField({
				type = type,
				field = fields:get(p2),
				models = models,
				path = array.concat({}, path, { p2 }),
				ancestors = ancestors,
				ignore = ignore,
				depthLimit = depthLimit,
				circularReferenceDepth = circularReferenceDepth,
				schema = schema,
				depth = depth,
				argNames = argNames,
				selectedFields = var8,
				rootTypeNames = rootTypeNames
			}) else t_1
		end), function(p2)
			-- upvalues: t_1 (copy), array (copy), object (copy), boolean (copy)
			return if p2 == nil or p2 == t_1 then false else array.indexOf(object.keys(p2), "selectionSet") == -1 or boolean.toJSBoolean(if typeof(p2.selectionSet) == "table" and typeof(p2.selectionSet.selections) == "table" then #p2.selectionSet.selections else nil)
		end)
	}
end

resolveVariable = function(p2, p3)
	-- upvalues: boolean (ref), isListType (ref), kind (ref), isNonNullType (ref)
	local function resolveVariableType(p4)
		-- upvalues: boolean (copy), isListType (copy), kind (copy), resolveVariableType (ref), isNonNullType (copy)
		return if boolean.toJSBoolean(isListType(p4)) then {
			kind = kind.LIST_TYPE,
			type = resolveVariableType(p4.ofType)
		} elseif boolean.toJSBoolean(isNonNullType(p4)) then {
			kind = kind.NON_NULL_TYPE,
			type = resolveVariableType(p4.ofType)
		} else {
			kind = kind.NAMED_TYPE,
			name = { kind = kind.NAME, value = p4.name }
		}
	end
	
	return {
		kind = kind.VARIABLE_DEFINITION,
		variable = {
			kind = kind.VARIABLE,
			name = {
				kind = kind.NAME,
				value = if boolean.toJSBoolean(p3) then p3 else p2.name
			}
		},
		type = resolveVariableType(p2.type)
	}
end

local function getArgumentName(p2, p3)
	-- upvalues: array (ref)
	return array.join(array.concat({}, p3, { p2 }), "_")
end

resolveField = function(p2)
	-- upvalues: getNamedType (ref), boolean (ref), array (ref), getArgumentName (ref), isNonNullType (ref), resolveVariable (write), t_2 (write), kind (ref), var1 (write), isScalarType (ref), isEnumType (ref), resolveSelectionSet (ref), object (ref), t_1 (ref)
	local type = p2.type
	local field = p2.field
	local models = p2.models
	local firstCall = p2.firstCall
	local path = p2.path
	local ancestors = p2.ancestors
	local ignore = p2.ignore
	local depthLimit = p2.depthLimit
	local circularReferenceDepth = p2.circularReferenceDepth
	local schema = p2.schema
	local depth = p2.depth
	local argNames = p2.argNames
	local selectedFields = p2.selectedFields
	local rootTypeNames = p2.rootTypeNames
	local var5 = getNamedType(field.type)
	local t = {}
	local var6 = false
	
	if boolean.toJSBoolean(field.args) and #field.args ~= 0 then
		t = array.filter(array.map(field.args, function(p3)
			-- upvalues: getArgumentName (copy), path (ref), argNames (ref), array (copy), boolean (copy), isNonNullType (copy), var6 (write), firstCall (ref), resolveVariable (copy), t_2 (copy), kind (copy)
			local var7 = getArgumentName(p3.name, path)
			
			if if argNames then not array.includes(argNames, var7) else boolean.toJSBoolean(argNames) then
				if boolean.toJSBoolean(isNonNullType(p3.type)) then
					var6 = true
				end
				return nil
			elseif not boolean.toJSBoolean(firstCall) then
				table.insert(t_2, resolveVariable(p3, var7))
			end
			return {
				kind = kind.ARGUMENT,
				name = { kind = kind.NAME, value = p3.name },
				value = {
					kind = kind.VARIABLE,
					name = {
						kind = kind.NAME,
						value = getArgumentName(p3.name, path)
					}
				}
			}
		end), boolean.toJSBoolean)
	end
	if boolean.toJSBoolean(var6) then
		return nil
	end
	local var7
	local var8 = array.concat({}, path, { field.name })
	local var9 = array.join(var8, ".")
	local name = field.name
	local toJSBoolean = boolean.toJSBoolean
	local var10 = var1:has(var9)
	
	if boolean.toJSBoolean(var10) then
		var7 = var1:get(var9) ~= tostring(field.type)
		var7 = nil
	else
		var7 = var10
	end
	if toJSBoolean(var7) then
		name ..= tostring(field.type):gsub("!", "NonNull")
	end
	var1:set(var9, tostring(field.type))
	
	if boolean.toJSBoolean(isScalarType(var5)) or boolean.toJSBoolean(isEnumType(var5)) then
		return object.assign({}, {
			kind = kind.FIELD,
			name = { kind = kind.NAME, value = field.name }
		}, name ~= field.name and { alias = { kind = kind.NAME, value = name } }, { arguments = t })
	end
	local var11 = resolveSelectionSet({
		parent = type,
		type = var5,
		models = models,
		firstCall = firstCall,
		path = var8,
		ancestors = array.concat({}, ancestors, { type }),
		ignore = ignore,
		depthLimit = depthLimit,
		circularReferenceDepth = circularReferenceDepth,
		schema = schema,
		depth = depth + 1,
		argNames = argNames,
		selectedFields = selectedFields,
		rootTypeNames = rootTypeNames
	})
	local var12 = if boolean.toJSBoolean(var11) then var11 else nil
	
	return object.assign({}, {
		kind = kind.FIELD,
		name = { kind = kind.NAME, value = field.name }
	}, name ~= field.name and { alias = { kind = kind.NAME, value = name } }, {
		selectionSet = if boolean.toJSBoolean(var12) then var12 else t_1,
		arguments = t
	})
end

hasCircularRef = function(p2, p3)
	-- upvalues: boolean (ref), isScalarType (ref), array (ref)
	local var5 = p2[#p2]
	
	return if boolean.toJSBoolean(isScalarType(var5)) then false else (if p3 ~= nil then { depth = 1 } else p3).depth < #array.filter(p2, function(p4)
		-- upvalues: var5 (ref)
		return p4.name == var5.name
	end)
end

return t