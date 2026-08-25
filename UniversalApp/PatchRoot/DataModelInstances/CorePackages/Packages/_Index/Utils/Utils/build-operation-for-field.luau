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
local var10 = map.new()

local function _(p0)
	-- upvalues: t_2 (write)
	table.insert(t_2, p0)
end

local _ = function()
	-- upvalues: t_2 (write)
	t_2 = {}
end

local _ = function()
	-- upvalues: var10 (write), map (ref)
	var10 = map.new()
end

function t.buildOperationNodeForField(p1)
	-- upvalues: t_2 (write), var10 (write), map (ref), getRootTypeNames (ref), buildOperationAndCollectVariables (write), boolean (ref), array (ref)
	local schema = p1.schema
	local kind = p1.kind
	local field = p1.field
	local models = p1.models
	local var13 = if p1.ignore == nil then {} else p1.ignore
	local depthLimit = p1.depthLimit
	local circularReferenceDepth = p1.circularReferenceDepth
	local argNames = p1.argNames
	local var14 = p1.selectedFields == nil or p1.selectedFields
	t_2 = {}
	var10 = map.new()
	local var15 = buildOperationAndCollectVariables({
		schema = schema,
		fieldName = field,
		kind = kind,
		models = if boolean.toJSBoolean(models) then models else {},
		ignore = var13,
		depthLimit = if boolean.toJSBoolean(depthLimit) then depthLimit else 1e999,
		circularReferenceDepth = if boolean.toJSBoolean(circularReferenceDepth) then circularReferenceDepth else 1,
		argNames = argNames,
		selectedFields = var14,
		rootTypeNames = getRootTypeNames(schema)
	})
	var15.variableDefinitions = array.concat({}, t_2)
	t_2 = {}
	var10 = map.new()
	
	return var15
end

buildOperationAndCollectVariables = function(p2)
	-- upvalues: getDefinedRootType (ref), array (ref), resolveVariable (write), t_2 (write), kind (ref), resolveField (write)
	local schema = p2.schema
	local fieldName = p2.fieldName
	local kind_1 = p2.kind
	local models = p2.models
	local ignore = p2.ignore
	local depthLimit = p2.depthLimit
	local circularReferenceDepth = p2.circularReferenceDepth
	local argNames = p2.argNames
	local selectedFields = p2.selectedFields
	local rootTypeNames = p2.rootTypeNames
	local var16 = getDefinedRootType(schema, kind_1)
	local var17 = var16:getFields():get(fieldName)
	local var18 = ("%s_%s"):format(tostring(fieldName), tostring(kind_1))
	
	if var17 and var17.args then
		for i, v in var17.args do
			local name = v.name
			
			if not argNames or array.includes(argNames, name) then
				table.insert(t_2, resolveVariable(v, name))
			end
		end
	end
	return {
		kind = kind.OPERATION_DEFINITION,
		operation = kind_1,
		name = { kind = kind.NAME, value = var18 },
		variableDefinitions = {},
		selectionSet = {
			kind = kind.SELECTION_SET,
			selections = {
				resolveField({
					firstCall = true,
					depth = 0,
					type = var16,
					field = var17,
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
			selections = array.filter(array.map(array.filter(type:getTypes(), function(p3)
				-- upvalues: hasCircularRef (copy), array (copy), ancestors (ref), circularReferenceDepth (ref)
				return not hasCircularRef(array.concat({}, ancestors, { p3 }), { depth = circularReferenceDepth })
			end), function(p4)
				-- upvalues: kind (copy), resolveSelectionSet (copy), type (ref), models (ref), path (ref), ancestors (ref), ignore (ref), depthLimit (ref), circularReferenceDepth (ref), schema (ref), depth (ref), argNames (ref), selectedFields (ref), rootTypeNames (ref)
				return {
					kind = kind.INLINE_FRAGMENT,
					typeCondition = {
						kind = kind.NAMED_TYPE,
						name = { kind = kind.NAME, value = p4.name }
					},
					selectionSet = resolveSelectionSet({
						parent = type,
						type = p4,
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
			end), function(p5)
				-- upvalues: t_1 (copy)
				return typeof(p5) == "table" and (p5.selectionSet ~= t_1 and (typeof(p5.selectionSet) == "table" and (typeof(p5.selectionSet.selections) == "table" and #p5.selectionSet.selections > 0)))
			end)
		}
	elseif boolean.toJSBoolean(isInterfaceType(type)) then
		return {
			kind = kind.SELECTION_SET,
			selections = array.filter(array.map(array.filter(array.filter(schema:getTypeMap():values(), function(p6)
				-- upvalues: isObjectType (copy), boolean (copy), array (copy), type (ref)
				local var23 = isObjectType(p6)
				
				return if boolean.toJSBoolean(var23) then array.includes(p6:getInterfaces(), type) else var23
			end), function(p7)
				-- upvalues: hasCircularRef (copy), array (copy), ancestors (ref), circularReferenceDepth (ref)
				return not hasCircularRef(array.concat({}, ancestors, { p7 }), { depth = circularReferenceDepth })
			end), function(p8)
				-- upvalues: kind (copy), resolveSelectionSet (copy), type (ref), models (ref), path (ref), ancestors (ref), ignore (ref), depthLimit (ref), circularReferenceDepth (ref), schema (ref), depth (ref), argNames (ref), selectedFields (ref), rootTypeNames (ref)
				return {
					kind = kind.INLINE_FRAGMENT,
					typeCondition = {
						kind = kind.NAMED_TYPE,
						name = { kind = kind.NAME, value = p8.name }
					},
					selectionSet = resolveSelectionSet({
						parent = type,
						type = p8,
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
			end), function(p9)
				-- upvalues: t_1 (copy)
				return typeof(p9) == "table" and p9.selectionSet ~= t_1 and (typeof(p9.selectionSet) == "table" and typeof(p9.selectionSet.selections) == "table") and #p9.selectionSet.selections > 0
			end)
		}
	end
	local var19 = isObjectType(type)
	
	if not boolean.toJSBoolean(if boolean.toJSBoolean(var19) then not boolean.toJSBoolean(rootTypeNames:has(type.name)) else var19) then
		return nil
	end
	local var20 = array.includes(ignore, type.name)
	local var21 = not boolean.toJSBoolean(firstCall) and array.includes(models, type.name)
	
	if boolean.toJSBoolean(if boolean.toJSBoolean(var21) then not boolean.toJSBoolean(if boolean.toJSBoolean(var20) then var20 else array.includes(ignore, ("%s.%s"):format(parent.name, tostring(path[#path])))) else var21) then
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
		selections = array.filter(array.map(array.filter(fields:keys(), function(p10)
			-- upvalues: hasCircularRef (copy), array (copy), ancestors (ref), getNamedType (copy), fields (ref), circularReferenceDepth (ref)
			return not hasCircularRef(array.concat({}, ancestors, { getNamedType(fields:get(p10).type) }), { depth = circularReferenceDepth })
		end), function(p11)
			-- upvalues: selectedFields (ref), boolean (copy), resolveField (copy), type (ref), fields (ref), models (ref), array (copy), path (ref), ancestors (ref), ignore (ref), depthLimit (ref), circularReferenceDepth (ref), schema (ref), depth (ref), argNames (ref), rootTypeNames (ref), t_1 (copy)
			local var24 = if typeof(selectedFields) == "table" then selectedFields[tostring(p11)] else true
			
			return if boolean.toJSBoolean(var24) then resolveField({
				type = type,
				field = fields:get(p11),
				models = models,
				path = array.concat({}, path, { p11 }),
				ancestors = ancestors,
				ignore = ignore,
				depthLimit = depthLimit,
				circularReferenceDepth = circularReferenceDepth,
				schema = schema,
				depth = depth,
				argNames = argNames,
				selectedFields = var24,
				rootTypeNames = rootTypeNames
			}) else t_1
		end), function(p12)
			-- upvalues: t_1 (copy), array (copy), object (copy), boolean (copy)
			return if p12 == nil or p12 == t_1 then false else array.indexOf(object.keys(p12), "selectionSet") == -1 or boolean.toJSBoolean(if typeof(p12.selectionSet) == "table" and typeof(p12.selectionSet.selections) == "table" then #p12.selectionSet.selections else nil)
		end)
	}
end

resolveVariable = function(p13, p14)
	-- upvalues: boolean (ref), isListType (ref), kind (ref), isNonNullType (ref)
	local function resolveVariableType(p15)
		-- upvalues: boolean (copy), isListType (copy), kind (copy), resolveVariableType (ref), isNonNullType (copy)
		return if boolean.toJSBoolean(isListType(p15)) then {
			kind = kind.LIST_TYPE,
			type = resolveVariableType(p15.ofType)
		} elseif boolean.toJSBoolean(isNonNullType(p15)) then {
			kind = kind.NON_NULL_TYPE,
			type = resolveVariableType(p15.ofType)
		} else {
			kind = kind.NAMED_TYPE,
			name = { kind = kind.NAME, value = p15.name }
		}
	end
	
	return {
		kind = kind.VARIABLE_DEFINITION,
		variable = {
			kind = kind.VARIABLE,
			name = {
				kind = kind.NAME,
				value = if boolean.toJSBoolean(p14) then p14 else p13.name
			}
		},
		type = resolveVariableType(p13.type)
	}
end

local function getArgumentName(p16, p17)
	-- upvalues: array (ref)
	return array.join(array.concat({}, p17, { p16 }), "_")
end

resolveField = function(p18)
	-- upvalues: getNamedType (ref), boolean (ref), array (ref), getArgumentName (ref), isNonNullType (ref), resolveVariable (write), t_2 (write), kind (ref), var10 (write), isScalarType (ref), isEnumType (ref), resolveSelectionSet (ref), object (ref), t_1 (ref)
	local type = p18.type
	local field = p18.field
	local models = p18.models
	local firstCall = p18.firstCall
	local path = p18.path
	local ancestors = p18.ancestors
	local ignore = p18.ignore
	local depthLimit = p18.depthLimit
	local circularReferenceDepth = p18.circularReferenceDepth
	local schema = p18.schema
	local depth = p18.depth
	local argNames = p18.argNames
	local selectedFields = p18.selectedFields
	local rootTypeNames = p18.rootTypeNames
	local var26 = getNamedType(field.type)
	local t = {}
	local var28 = false
	
	if boolean.toJSBoolean(field.args) and #field.args ~= 0 then
		t = array.filter(array.map(field.args, function(p19)
			-- upvalues: getArgumentName (copy), path (ref), argNames (ref), array (copy), boolean (copy), isNonNullType (copy), var28 (write), firstCall (ref), resolveVariable (copy), t_2 (copy), kind (copy)
			local var35 = getArgumentName(p19.name, path)
			
			if if argNames then not array.includes(argNames, var35) else boolean.toJSBoolean(argNames) then
				if boolean.toJSBoolean(isNonNullType(p19.type)) then
					var28 = true
				end
				return nil
			elseif not boolean.toJSBoolean(firstCall) then
				table.insert(t_2, resolveVariable(p19, var35))
			end
			return {
				kind = kind.ARGUMENT,
				name = { kind = kind.NAME, value = p19.name },
				value = {
					kind = kind.VARIABLE,
					name = {
						kind = kind.NAME,
						value = getArgumentName(p19.name, path)
					}
				}
			}
		end), boolean.toJSBoolean)
	end
	if boolean.toJSBoolean(var28) then
		return nil
	end
	local var32
	local var29 = array.concat({}, path, { field.name })
	local var30 = array.join(var29, ".")
	local name = field.name
	local toJSBoolean = boolean.toJSBoolean
	local var31 = var10:has(var30)
	
	if boolean.toJSBoolean(var31) then
		var32 = var10:get(var30) ~= tostring(field.type)
		var32 = nil
	else
		var32 = var31
	end
	if toJSBoolean(var32) then
		name ..= tostring(field.type):gsub("!", "NonNull")
	end
	var10:set(var30, tostring(field.type))
	
	if boolean.toJSBoolean(isScalarType(var26)) or boolean.toJSBoolean(isEnumType(var26)) then
		return object.assign({}, {
			kind = kind.FIELD,
			name = { kind = kind.NAME, value = field.name }
		}, name ~= field.name and { alias = { kind = kind.NAME, value = name } }, { arguments = t })
	end
	local var33 = resolveSelectionSet({
		parent = type,
		type = var26,
		models = models,
		firstCall = firstCall,
		path = var29,
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
	local var34 = if boolean.toJSBoolean(var33) then var33 else nil
	
	return object.assign({}, {
		kind = kind.FIELD,
		name = { kind = kind.NAME, value = field.name }
	}, name ~= field.name and { alias = { kind = kind.NAME, value = name } }, {
		selectionSet = if boolean.toJSBoolean(var34) then var34 else t_1,
		arguments = t
	})
end

hasCircularRef = function(p20, p21)
	-- upvalues: boolean (ref), isScalarType (ref), array (ref)
	local var36 = p20[#p20]
	
	return if boolean.toJSBoolean(isScalarType(var36)) then false else (if p21 ~= nil then { depth = 1 } else p21).depth < #array.filter(p20, function(p22)
		-- upvalues: var36 (ref)
		return p22.name == var36.name
	end)
end

return t