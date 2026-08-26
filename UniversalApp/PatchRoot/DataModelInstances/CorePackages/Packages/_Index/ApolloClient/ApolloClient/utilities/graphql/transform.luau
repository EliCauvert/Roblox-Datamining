local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local boolean = luauPolyfillModule.Boolean
local string = luauPolyfillModule.String
local t = {}
local graphQLModule = require(parent_1.GraphQL)
local visit = graphQLModule.visit
local REMOVE = graphQLModule.REMOVE
local invariant = require(parent.jsutils.invariant).invariant
local getFromASTModule = require(script.Parent.getFromAST)
local checkDocument = getFromASTModule.checkDocument
local getOperationDefinition = getFromASTModule.getOperationDefinition
local getFragmentDefinition = getFromASTModule.getFragmentDefinition
local getFragmentDefinitions = getFromASTModule.getFragmentDefinitions
local getMainDefinition = getFromASTModule.getMainDefinition
local filterInPlace = require(script.Parent.Parent.common.filterInPlace).filterInPlace
local storeUtilsModule = require(script.Parent.storeUtils)
local isField = storeUtilsModule.isField
local isInlineFragment = storeUtilsModule.isInlineFragment

local function _(p1)
	-- upvalues: array (ref)
	local t = {}
	array.forEach(p1, function(p2)
		-- upvalues: t (ref)
		t[p2.name.value] = p2
	end)
	
	return t
end

local hasDirectivesInSelection = nil
local var1 = nil
local var2 = nil
local getAllFragmentSpreadsFromSelectionSet = nil
local t_1 = {
	kind = "Field",
	name = { kind = "Name", value = "__typename" }
}

local function isEmpty(p1, p2)
	-- upvalues: array (ref), isEmpty (ref)
	return array.every(p1.selectionSet.selections, function(p3)
		-- upvalues: isEmpty (copy), p2 (ref)
		return p3.kind == "FragmentSpread" and isEmpty(p2[p3.name.value], p2)
	end, nil)
end

local _ = function(p1)
	-- upvalues: getOperationDefinition (ref), getFragmentDefinition (ref), getFragmentDefinitions (ref), array (ref), isEmpty (ref)
	local var3 = getOperationDefinition(p1) or getFragmentDefinition(p1)
	local t = {}
	array.forEach(getFragmentDefinitions(p1), function(p2)
		-- upvalues: t (ref)
		t[p2.name.value] = p2
	end)
	
	return if array.every(var3.selectionSet.selections, function(p2)
		-- upvalues: isEmpty (copy), t (ref)
		return p2.kind == "FragmentSpread" and isEmpty(t[p2.name.value], t)
	end, nil) then nil else p1
end

local _ = function(p1)
	-- upvalues: array (ref), boolean (ref)
	return function(p2)
		-- upvalues: array (copy), p1 (ref), boolean (copy)
		return array.some(p1, function(p3)
			-- upvalues: boolean (copy), p2 (ref)
			return if boolean.toJSBoolean(p3.name) then true else boolean.toJSBoolean(p3.test) and p3:test(p2)
		end)
	end
end

local function removeDirectivesFromDocument(p1, p2)
	-- upvalues: visit (ref), boolean (ref), array (ref), getAllFragmentSpreadsFromSelectionSet (write), REMOVE (ref), getOperationDefinition (ref), getFragmentDefinition (ref), getFragmentDefinitions (ref), isEmpty (ref), filterInPlace (ref), var1 (write), var2 (write)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local var3 = visit(p2, {
		Variable = {
			enter = function(_, p3, _, p4)
				-- upvalues: t (ref)
				if p4.kind ~= "VariableDefinition" then
					t[p3.name.value] = true
				end
				return nil
			end
		},
		Field = {
			enter = function(_, p3)
				-- upvalues: boolean (copy), p1 (ref), array (copy), t_1 (ref), getAllFragmentSpreadsFromSelectionSet (copy), t_3 (ref), REMOVE (copy)
				if boolean.toJSBoolean(p1) and boolean.toJSBoolean(p3.directives) and (array.some(p1, function(p4)
					return p4.remove
				end) and p3.directives) then
					local var4 = p1
					
					if not array.some(p3.directives, function(p4)
						-- upvalues: array (copy), var4 (ref), boolean (copy)
						return array.some(var4, function(p5)
							-- upvalues: boolean (copy), p4 (ref)
							return if boolean.toJSBoolean(p5.name) then true else boolean.toJSBoolean(p5.test) and p5:test(p4)
						end)
					end) then
						return nil
					end
					if p3.arguments then
						array.forEach(p3.arguments, function(p4)
							-- upvalues: t_1 (copy)
							if p4.value.kind == "Variable" then
								table.insert(t_1, { name = p4.value.name.value })
							end
						end)
					end
					if p3.selectionSet then
						array.forEach(getAllFragmentSpreadsFromSelectionSet(p3.selectionSet), function(p4)
							-- upvalues: t_3 (copy)
							table.insert(t_3, { name = p4.name.value })
						end)
					end
					return REMOVE
				end
			end
		},
		FragmentSpread = {
			enter = function(_, p3)
				-- upvalues: t_2 (ref)
				t_2[p3.name.value] = true
			end
		},
		Directive = {
			enter = function(_, p3)
				-- upvalues: boolean (copy), p1 (ref), array (copy), REMOVE (copy)
				return if boolean.toJSBoolean((function(p4)
					-- upvalues: array (copy), p1 (ref), boolean (copy)
					return array.some(p1, function(p5)
						-- upvalues: boolean (copy), p4 (ref)
						return if boolean.toJSBoolean(p5.name) then true else boolean.toJSBoolean(p5.test) and p5:test(p4)
					end)
				end)(p3)) then REMOVE else nil
			end
		}
	})
	local var4 = getOperationDefinition(var3) or getFragmentDefinition(var3)
	local t_4 = {}
	array.forEach(getFragmentDefinitions(var3), function(p3)
		-- upvalues: t_4 (ref)
		t_4[p3.name.value] = p3
	end)
	local var5 = t_4
	local var6 = if array.every(var4.selectionSet.selections, function(p3)
		-- upvalues: isEmpty (copy), var5 (ref)
		return p3.kind == "FragmentSpread" and isEmpty(var5[p3.name.value], var5)
	end, nil) then nil else var3
	
	if boolean.toJSBoolean(var6) and boolean.toJSBoolean(#filterInPlace(t_1, function(p3)
		-- upvalues: boolean (copy), t (ref)
		return not not boolean.toJSBoolean(p3.name) and not t[p3.name]
	end)) then
		var6 = var1(t_1, var6)
	end
	if boolean.toJSBoolean(var6) and boolean.toJSBoolean(#filterInPlace(t_3, function(p3)
		-- upvalues: boolean (copy), t_2 (ref)
		return not not boolean.toJSBoolean(p3.name) and not t_2[p3.name]
	end)) then
		var6 = var2(t_3, var6)
	end
	return var6
end

t.removeDirectivesFromDocument = removeDirectivesFromDocument
t.addTypenameToDocument = object.assign(setmetatable({}, {
	__call = function(_, p1)
		-- upvalues: visit (ref), checkDocument (ref), boolean (ref), array (ref), isField (ref), string (ref), object (ref), t_1 (ref)
		return visit(checkDocument(p1), {
			SelectionSet = {
				enter = function(_, p2, _, p3)
					-- upvalues: boolean (copy), array (copy), isField (copy), string (copy), object (copy), t_1 (copy)
					if boolean.toJSBoolean(p3) and p3.kind == "OperationDefinition" then return end
					local selections = p2.selections
					
					if not boolean.toJSBoolean(selections) then return end
					if array.some(selections, function(p4)
						-- upvalues: isField (copy), string (copy)
						return isField(p4) and (if p4.name.value ~= "__typename" then string.lastIndexOf(p4.name.value, "__", 1) == 1 else true)
					end) then return end
					if isField(p3) and boolean.toJSBoolean(p3.directives) and boolean.toJSBoolean(array.some(p3.directives, function(p4)
						return p4.name.value == "export"
					end)) then
						return
					end
					return object.assign({}, p2, { selections = array.concat({}, selections, { t_1 }) })
				end
			}
		})
	end
}), {
	added = function(_, p1)
		-- upvalues: t_1 (ref)
		return p1 == t_1
	end
})
local t_2 = {
	test = function(_, p1)
		-- upvalues: boolean (ref), array (ref), invariant (ref)
		local isConnection = p1.name.value == "connection"
		
		if isConnection and (not boolean.toJSBoolean(p1.arguments) or array.some(p1.arguments, function(p2)
			return p2.name.value == "key"
		end)) then
			invariant.warn("Removing an @connection directive even though it does not have a key. You may want to use the key parameter to specify a store key.")
		end
		return isConnection
	end
}

function t.removeConnectionDirectiveFromDocument(p1)
	-- upvalues: removeDirectivesFromDocument (ref), t_2 (ref), checkDocument (ref)
	return removeDirectivesFromDocument({ t_2 }, checkDocument(p1))
end

local _ = function(value, p1, p2)
	-- upvalues: array (ref), hasDirectivesInSelection (write)
	local selections
	if p2 == nil then
		p2 = true
	end
	if p1 then
		selections = p1.selections and (array.some(p1.selections, function(p3)
			-- upvalues: hasDirectivesInSelection (copy), value (ref), p2 (write)
			return hasDirectivesInSelection(value, p3, p2)
		end) or false)
	end
	return selections
end

hasDirectivesInSelection = function(p1, p2, p3)
	-- upvalues: isField (ref), array (ref), boolean (ref), hasDirectivesInSelection (write)
	if p3 == nil then
		p3 = true
	end
	if not isField(p2) then
		return true
	elseif not p2.directives then
		return false
	end
	local var3 = array.some(p2.directives, function(p4)
		-- upvalues: array (copy), p1 (ref), boolean (copy)
		return array.some(p1, function(p5)
			-- upvalues: boolean (copy), p4 (ref)
			return if boolean.toJSBoolean(p5.name) then true else boolean.toJSBoolean(p5.test) and p5:test(p4)
		end)
	end)
	
	if not var3 and p3 then
		local selectionSet = p2.selectionSet
		local var4 = p3
		
		if var4 == nil then
			var4 = true
		end
		if selectionSet and selectionSet.selections then
			var3 = array.some(selectionSet.selections, function(p4)
				-- upvalues: hasDirectivesInSelection (copy), p1 (ref), var4 (write)
				return hasDirectivesInSelection(p1, p4, var4)
			end)
			
			if not var3 then
				var3 = false
			end
			var3 = var3 or false
		end
	end
	return var3
end

local _ = function(p1)
	-- upvalues: array (ref)
	return function(p2)
		-- upvalues: array (copy), p1 (ref)
		return array.some(p1, function(p3)
			-- upvalues: p2 (ref)
			local var3
			if p2.value and p2.value.kind == "Variable" and p2.value.name then
				var3 = if p3.name ~= p2.value.name.value then p3.test and (p3:test(p2) or false) else true
			end
			return var3
		end)
	end
end

function t.removeArgumentsFromDocument(p1, p2)
	-- upvalues: array (ref), visit (ref), object (ref), REMOVE (ref), boolean (ref), getOperationDefinition (ref), getFragmentDefinition (ref), getFragmentDefinitions (ref), isEmpty (ref)
	local var3 = function(p3)
		-- upvalues: array (copy), p1 (ref)
		return array.some(p1, function(p4)
			-- upvalues: p3 (ref)
			local var4
			if p3.value and p3.value.kind == "Variable" and p3.value.name then
				var4 = if p4.name ~= p3.value.name.value then p4.test and (p4:test(p3) or false) else true
			end
			return var4
		end)
	end
	
	local var4 = visit(p2, {
		OperationDefinition = {
			enter = function(_, p3)
				-- upvalues: object (copy), array (copy), p1 (ref)
				return object.assign({}, p3, {
					variableDefinitions = p3.variableDefinitions and array.filter(p3.variableDefinitions, function(p4)
						-- upvalues: array (copy), p1 (copy)
						return not array.some(p1, function(p5)
							-- upvalues: p4 (ref)
							return p5.name == p4.variable.name.value
						end)
					end) or {}
				})
			end
		},
		Field = {
			enter = function(_, p3)
				-- upvalues: array (copy), p1 (ref), var3 (ref), REMOVE (copy)
				if array.some(p1, function(p4)
					return p4.remove
				end) then
					local var5 = 0
					
					if p3.arguments then
						array.forEach(p3.arguments, function(p4)
							-- upvalues: var3 (copy), var5 (write)
							if var3(p4) then
								var5 += 1
							end
						end)
					end
					return if var5 == 1 then REMOVE else nil
				end
			end
		},
		Argument = {
			enter = function(_, p3)
				-- upvalues: boolean (copy), var3 (ref), REMOVE (copy)
				return if boolean.toJSBoolean(var3(p3)) then REMOVE else nil
			end
		}
	})
	local var5 = getOperationDefinition(var4) or getFragmentDefinition(var4)
	local t = {}
	array.forEach(getFragmentDefinitions(var4), function(p3)
		-- upvalues: t (ref)
		t[p3.name.value] = p3
	end)
	
	return if array.every(var5.selectionSet.selections, function(p3)
		-- upvalues: isEmpty (copy), t (ref)
		return p3.kind == "FragmentSpread" and isEmpty(t[p3.name.value], t)
	end, nil) then nil else var4
end

function t.removeFragmentSpreadFromDocument(p1, p2)
	-- upvalues: array (ref), REMOVE (ref), visit (ref), getOperationDefinition (ref), getFragmentDefinition (ref), getFragmentDefinitions (ref), isEmpty (ref)
	local function enter(_, p3)
		-- upvalues: array (copy), p1 (ref), REMOVE (copy)
		return if array.some(p1, function(p4)
			-- upvalues: p3 (ref)
			return p4.name == p3.name.value
		end) then REMOVE else nil
	end
	
	local var3 = visit(p2, {
		FragmentSpread = { enter = enter },
		FragmentDefinition = { enter = enter }
	})
	local var4 = getOperationDefinition(var3) or getFragmentDefinition(var3)
	local t = {}
	array.forEach(getFragmentDefinitions(var3), function(p3)
		-- upvalues: t (ref)
		t[p3.name.value] = p3
	end)
	
	return if array.every(var4.selectionSet.selections, function(p3)
		-- upvalues: isEmpty (copy), t (ref)
		return p3.kind == "FragmentSpread" and isEmpty(t[p3.name.value], t)
	end, nil) then nil else var3
end

getAllFragmentSpreadsFromSelectionSet = function(value)
	-- upvalues: array (ref), isField (ref), isInlineFragment (ref), getAllFragmentSpreadsFromSelectionSet (write)
	local t = {}
	array.forEach(value.selections, function(p1)
		-- upvalues: isField (copy), isInlineFragment (copy), array (copy), getAllFragmentSpreadsFromSelectionSet (copy), t (ref)
		if (isField(p1) or isInlineFragment(p1)) and p1.selectionSet then
			array.forEach(getAllFragmentSpreadsFromSelectionSet(p1.selectionSet), function(p2)
				-- upvalues: t (copy)
				table.insert(t, p2)
			end)
			
			return
		elseif p1.kind == "FragmentSpread" then
			table.insert(t, p1)
		end
	end)
	
	return t
end

function t.buildQueryFromSelectionSet(value)
	-- upvalues: getMainDefinition (ref), visit (ref), object (ref)
	return if getMainDefinition(value).operation == "query" then value else visit(value, {
		OperationDefinition = {
			enter = function(_, p1)
				-- upvalues: object (copy)
				return object.assign({}, p1, { operation = "query" })
			end
		}
	})
end

function t.removeClientSetsFromDocument(value)
	-- upvalues: checkDocument (ref), removeDirectivesFromDocument (ref), boolean (ref), visit (ref), array (ref), isField (ref), REMOVE (ref)
	checkDocument(value)
	local var3 = removeDirectivesFromDocument({
		{
			remove = true,
			test = function(_, p1)
				return p1.name.value == "client"
			end
		}
	}, value)
	
	if boolean.toJSBoolean(var3) then
		var3 = visit(var3, {
			FragmentDefinition = {
				enter = function(_, p1)
					-- upvalues: array (copy), isField (copy), boolean (copy), REMOVE (copy)
					return if p1.selectionSet and boolean.toJSBoolean(array.every(p1.selectionSet.selections, function(p2)
						-- upvalues: isField (copy)
						return isField(p2) and p2.name.value == "__typename"
					end)) then REMOVE else nil
				end
			}
		})
	end
	return var3
end

return t