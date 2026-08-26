local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local map = luauPolyfillModule.Map
local object = luauPolyfillModule.Object
local set = luauPolyfillModule.Set
local t = {}
local graphQLModule = require(parent.GraphQL)
local getNamedType = graphQLModule.getNamedType
local isObjectType = graphQLModule.isObjectType
local isInterfaceType = graphQLModule.isInterfaceType
local isUnionType = graphQLModule.isUnionType
local isInputObjectType = graphQLModule.isInputObjectType
local isSpecifiedScalarType = graphQLModule.isSpecifiedScalarType
local isScalarType = graphQLModule.isScalarType
local isEnumType = graphQLModule.isEnumType
local _ = require(script.Parent.types)
local mapSchema = require(script.Parent.mapSchema).mapSchema
local mapperKind = require(script.Parent.Interfaces).MapperKind
local getRootTypes = require(script.Parent.rootTypes).getRootTypes
local getImplementingTypes = require(script.Parent["get-implementing-types"]).getImplementingTypes
local string = luauPolyfillModule.String
local visitSchema = nil
local visitQueue = nil
local getDirectivesArgumentsTypeNames = nil

function t.pruneSchema(p1, p2)
	-- upvalues: visitSchema (write), string (ref), visitQueue (write), mapSchema (ref), mapperKind (ref), boolean (ref), isSpecifiedScalarType (ref), isUnionType (ref), isInputObjectType (ref), isInterfaceType (ref), isObjectType (ref), isScalarType (ref), object (ref)
	local var1 = if p2 ~= nil then {} else p2
	local skipEmptyCompositeTypePruning = var1.skipEmptyCompositeTypePruning
	local skipEmptyUnionPruning = var1.skipEmptyUnionPruning
	local skipPruning = var1.skipPruning
	local skipUnimplementedInterfacesPruning = var1.skipUnimplementedInterfacesPruning
	local skipUnusedTypesPruning = var1.skipUnusedTypesPruning
	local _ = {}
	local var2 = p1
	local t
	repeat
		local var3 = visitSchema(var2)
		if not skipPruning then
			t = {}
			var2 = mapSchema(var2, {
				[mapperKind.TYPE] = function(p3)
					-- upvalues: boolean (copy), var3 (write), isSpecifiedScalarType (copy), isUnionType (copy), isInputObjectType (copy), isInterfaceType (copy), isObjectType (copy), isScalarType (copy), skipUnusedTypesPruning (ref), skipEmptyUnionPruning (ref), skipEmptyCompositeTypePruning (ref), skipUnimplementedInterfacesPruning (ref), t (write), object (copy)
					if boolean.toJSBoolean(var3:has(p3.name)) or boolean.toJSBoolean(isSpecifiedScalarType(p3)) then
						return p3
					elseif isUnionType(p3) or isInputObjectType(p3) or (isInterfaceType(p3) or isObjectType(p3)) or isScalarType(p3) then
						if boolean.toJSBoolean(skipUnusedTypesPruning) then
							return p3
						elseif isUnionType(p3) and skipEmptyUnionPruning and not boolean.toJSBoolean(#p3:getTypes()) then
							return p3
						elseif (isInputObjectType(p3) or isInterfaceType(p3) or isObjectType(p3)) and (skipEmptyCompositeTypePruning and not boolean.toJSBoolean(#p3:getFields():keys())) then
							return p3
						elseif isInterfaceType(p3) and skipUnimplementedInterfacesPruning then
							return p3
						end
					end
					table.insert(t, p3.name)
					var3:delete(p3.name)
					
					return object.None
				end
			})
			continue
		end
		local t = {}
		
		for i, v in var2:getTypeMap() do
			local var4 = v[1]
			
			if not string.startsWith(var4, "__") then
				local var5 = var2:getType(var4)
				
				if var5 and skipPruning(var5) then
					table.insert(t, var4)
				end
			end
		end
		var3 = visitQueue(t, var2, var3)
	until #t == 0
	return var2
end

visitSchema = function(p1)
	-- upvalues: getRootTypes (ref), visitQueue (write)
	local t = {}
	
	for i, v in getRootTypes(p1) do
		table.insert(t, v.name)
	end
	return visitQueue(t, p1)
end

visitQueue = function(p2, p3, p4)
	-- upvalues: set (ref), map (ref), boolean (ref), isUnionType (ref), array (ref), isInterfaceType (ref), getImplementingTypes (ref), isEnumType (ref), getDirectivesArgumentsTypeNames (write), isObjectType (ref), getNamedType (ref)
	local var1 = if p4 ~= nil then set.new() else p4
	local var2 = map.new()
	while #p2 ~= 0 do
		local removed = table.remove(p2)
		
		if var1:has(removed) and var2[removed] ~= true then continue end
		local var3 = p3:getType(removed)
		
		if not boolean.toJSBoolean(var3) or not var3 then continue end
		if boolean.toJSBoolean(isUnionType(var3)) then
			p2 = array.concat(p2, array.map(var3:getTypes(), function(p5)
				return p5.name
			end))
		end
		if isInterfaceType(var3) and var2[removed] == true then
			p2 = array.concat(p2, getImplementingTypes(var3.name, p3))
			var2[tostring(removed)] = false
		end
		if boolean.toJSBoolean(isEnumType(var3)) then
			p2 = array.concat(p2, array.flatMap(var3:getValues(), function(p5)
				-- upvalues: getDirectivesArgumentsTypeNames (copy), p3 (ref)
				return if p5.astNode then getDirectivesArgumentsTypeNames(p3, p5.astNode) else {}
			end))
		end
		if var3.getInterfaces ~= nil then
			p2 = array.concat(p2, array.map(var3:getInterfaces(), function(p5)
				return p5.name
			end))
		end
		if var3.getFields == nil then
			if boolean.toJSBoolean(var3.astNode) then
				p2 = array.concat(p2, getDirectivesArgumentsTypeNames(p3, var3.astNode))
			end
			var1:add(removed)
		else
			local var4 = var3:getFields():entries()
			
			if #var4 == 0 then continue end
			for i, v in var4 do
				local var5 = v[2]
				
				if boolean.toJSBoolean(isObjectType(var3)) then
					p2 = array.concat(p2, array.flatMap(var5.args, function(p5)
						-- upvalues: getNamedType (copy), array (copy), getDirectivesArgumentsTypeNames (copy), p3 (ref)
						local list = { getNamedType(p5.type).name }
						
						if p5.astNode then
							list = array.concat(list, getDirectivesArgumentsTypeNames(p3, p5.astNode))
						end
						return list
					end))
				end
				local var6 = getNamedType(var5.type)
				table.insert(p2, var6.name)
				
				if boolean.toJSBoolean(var5.astNode) then
					p2 = array.concat(p2, getDirectivesArgumentsTypeNames(p3, var5.astNode))
				end
				if isInterfaceType(var6) and not var2:has(var6.name) then
					var2[tostring(var6.name)] = true
				end
			end
		end
	end
	return var1
end

getDirectivesArgumentsTypeNames = function(p5, p6)
	-- upvalues: array (ref), getNamedType (ref)
	return array.flatMap(p6.directives or {}, function(p7)
		-- upvalues: p5 (ref), array (copy), getNamedType (copy)
		local valueDirective = p5:getDirective(p7.name.value)
		local var7 = if typeof(valueDirective) == "table" then valueDirective.args else nil
		local var8 = if var7 ~= nil then nil else array.map(var7, function(p8)
			-- upvalues: getNamedType (copy)
			return getNamedType(p8.type).name
		end)
		
		return if var8 == nil then {} else var8
	end)
end

return t