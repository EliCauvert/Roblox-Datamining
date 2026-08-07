-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:09 2026 Pacific Standard Time.

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

function t.pruneSchema(p0, p1) --[[ line: 69 ]]
	-- upvalues: visitSchema (write), string (ref), visitQueue (write), mapSchema (ref), mapperKind (ref), boolean (ref), isSpecifiedScalarType (ref), isUnionType (ref), isInputObjectType (ref), isInterfaceType (ref), isObjectType (ref), isScalarType (ref), object (ref)
	local var6 = if p1 ~= nil then {} else p1
	local skipEmptyCompositeTypePruning = var6.skipEmptyCompositeTypePruning
	local skipEmptyUnionPruning = var6.skipEmptyUnionPruning
	local skipPruning = var6.skipPruning
	local skipUnimplementedInterfacesPruning = var6.skipUnimplementedInterfacesPruning
	local skipUnusedTypesPruning = var6.skipUnusedTypesPruning
	local _ = {}
	local var7 = p0
	local t
	repeat
		local var8 = visitSchema(var7)
		if not skipPruning then
			t = {}
			var7 = mapSchema(var7, {
				[mapperKind.TYPE] = function(p2) --[[ line: 111 ]]
					-- upvalues: boolean (copy), var8 (write), isSpecifiedScalarType (copy), isUnionType (copy), isInputObjectType (copy), isInterfaceType (copy), isObjectType (copy), isScalarType (copy), skipUnusedTypesPruning (ref), skipEmptyUnionPruning (ref), skipEmptyCompositeTypePruning (ref), skipUnimplementedInterfacesPruning (ref), t (write), object (copy)
					if boolean.toJSBoolean(var8:has(p2.name)) or boolean.toJSBoolean(isSpecifiedScalarType(p2)) then
						return p2
					elseif isUnionType(p2) or isInputObjectType(p2) or (isInterfaceType(p2) or isObjectType(p2)) or isScalarType(p2) then
						if boolean.toJSBoolean(skipUnusedTypesPruning) then
							return p2
						elseif isUnionType(p2) and skipEmptyUnionPruning and not boolean.toJSBoolean(#p2:getTypes()) then
							return p2
						elseif (isInputObjectType(p2) or isInterfaceType(p2) or isObjectType(p2)) and (skipEmptyCompositeTypePruning and not boolean.toJSBoolean(#p2:getFields():keys())) then
							return p2
						elseif isInterfaceType(p2) and skipUnimplementedInterfacesPruning then
							return p2
						end
					end
					table.insert(t, p2.name)
					var8:delete(p2.name)
					
					return object.None
				end
			})
			continue
		end
		local t = {}
		
		for i, v in var7:getTypeMap() do
			local var10 = v[1]
			
			if not string.startsWith(var10, "__") then
				local var11 = var7:getType(var10)
				
				if var11 and skipPruning(var11) then
					table.insert(t, var10)
				end
			end
		end
		var8 = visitQueue(t, var7, var8)
	until #t == 0
	return var7
end

visitSchema = function(p3) --[[ line: 216 | named "visitSchema" ]]
	-- upvalues: getRootTypes (ref), visitQueue (write)
	local t = {}
	
	for i, v in getRootTypes(p3) do
		table.insert(t, v.name)
	end
	return visitQueue(t, p3)
end

visitQueue = function(p4, p5, p6) --[[ line: 227 | named "visitQueue" ]]
	-- upvalues: set (ref), map (ref), boolean (ref), isUnionType (ref), array (ref), isInterfaceType (ref), getImplementingTypes (ref), isEnumType (ref), getDirectivesArgumentsTypeNames (write), isObjectType (ref), getNamedType (ref)
	local var14 = if p6 ~= nil then set.new() else p6
	local var15 = map.new()
	while #p4 ~= 0 do
		local removed = table.remove(p4)
		
		if var14:has(removed) and var15[removed] ~= true then continue end
		local var17 = p5:getType(removed)
		
		if not boolean.toJSBoolean(var17) or not var17 then continue end
		if boolean.toJSBoolean(isUnionType(var17)) then
			p4 = array.concat(p4, array.map(var17:getTypes(), function(p7) --[[ line: 262 ]]
				return p7.name
			end))
		end
		if isInterfaceType(var17) and var15[removed] == true then
			p4 = array.concat(p4, getImplementingTypes(var17.name, p5))
			var15[tostring(removed)] = false
		end
		if boolean.toJSBoolean(isEnumType(var17)) then
			p4 = array.concat(p4, array.flatMap(var17:getValues(), function(p8) --[[ line: 301 ]]
				-- upvalues: getDirectivesArgumentsTypeNames (copy), p5 (ref)
				return if p8.astNode then getDirectivesArgumentsTypeNames(p5, p8.astNode) else {}
			end))
		end
		if var17.getInterfaces ~= nil then
			p4 = array.concat(p4, array.map(var17:getInterfaces(), function(p9) --[[ line: 322 ]]
				return p9.name
			end))
		end
		if var17.getFields == nil then
			if boolean.toJSBoolean(var17.astNode) then
				p4 = array.concat(p4, getDirectivesArgumentsTypeNames(p5, var17.astNode))
			end
			var14:add(removed)
		else
			local var18 = var17:getFields():entries()
			
			if #var18 == 0 then continue end
			for i, v in var18 do
				local var19 = v[2]
				
				if boolean.toJSBoolean(isObjectType(var17)) then
					p4 = array.concat(p4, array.flatMap(var19.args, function(p10) --[[ line: 368 ]]
						-- upvalues: getNamedType (copy), array (copy), getDirectivesArgumentsTypeNames (copy), p5 (ref)
						local list = { getNamedType(p10.type).name }
						
						if p10.astNode then
							list = array.concat(list, getDirectivesArgumentsTypeNames(p5, p10.astNode))
						end
						return list
					end))
				end
				local var20 = getNamedType(var19.type)
				table.insert(p4, var20.name)
				
				if boolean.toJSBoolean(var19.astNode) then
					p4 = array.concat(p4, getDirectivesArgumentsTypeNames(p5, var19.astNode))
				end
				if isInterfaceType(var20) and not var15:has(var20.name) then
					var15[tostring(var20.name)] = true
				end
			end
		end
	end
	return var14
end

getDirectivesArgumentsTypeNames = function(p11, p12) --[[ line: 421 | named "getDirectivesArgumentsTypeNames" ]]
	-- upvalues: array (ref), getNamedType (ref)
	return array.flatMap(p12.directives or {}, function(p13) --[[ line: 432 ]]
		-- upvalues: p11 (ref), array (copy), getNamedType (copy)
		local valueDirective = p11:getDirective(p13.name.value)
		local var23 = if typeof(valueDirective) == "table" then valueDirective.args else nil
		local var24 = if var23 ~= nil then nil else array.map(var23, function(p14) --[[ line: 436 ]]
			-- upvalues: getNamedType (copy)
			return getNamedType(p14.type).name
		end)
		
		return if var24 == nil then {} else var24
	end)
end

return t