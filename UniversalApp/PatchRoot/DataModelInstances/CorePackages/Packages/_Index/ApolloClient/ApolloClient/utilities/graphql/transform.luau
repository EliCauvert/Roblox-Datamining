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

local function _(p0)
	-- upvalues: array (ref)
	local t = {}
	array.forEach(p0, function(p1)
		-- upvalues: t (ref)
		t[p1.name.value] = p1
	end)
	
	return t
end

local hasDirectivesInSelection = nil
local var6 = nil
local var7 = nil
local getAllFragmentSpreadsFromSelectionSet = nil
local t_1 = {
	kind = "Field",
	name = { kind = "Name", value = "__typename" }
}

local function isEmpty(p2, p3)
	-- upvalues: array (ref), isEmpty (ref)
	return array.every(p2.selectionSet.selections, function(p4)
		-- upvalues: isEmpty (copy), p3 (ref)
		return p4.kind == "FragmentSpread" and isEmpty(p3[p4.name.value], p3)
	end, nil)
end

local _ = function(p5)
	-- upvalues: getOperationDefinition (ref), getFragmentDefinition (ref), getFragmentDefinitions (ref), array (ref), isEmpty (ref)
	local var14 = getOperationDefinition(p5) or getFragmentDefinition(p5)
	local t = {}
	array.forEach(getFragmentDefinitions(p5), function(p6)
		-- upvalues: t (ref)
		t[p6.name.value] = p6
	end)
	
	return if array.every(var14.selectionSet.selections, function(p7)
		-- upvalues: isEmpty (copy), t (ref)
		return p7.kind == "FragmentSpread" and isEmpty(t[p7.name.value], t)
	end, nil) then nil else p5
end

local _ = function(p8)
	-- upvalues: array (ref), boolean (ref)
	return function(p9)
		-- upvalues: array (copy), p8 (ref), boolean (copy)
		return array.some(p8, function(p10)
			-- upvalues: boolean (copy), p9 (ref)
			return if boolean.toJSBoolean(p10.name) then true else boolean.toJSBoolean(p10.test) and p10:test(p9)
		end)
	end
end

local function removeDirectivesFromDocument(p11, p12)
	-- upvalues: visit (ref), boolean (ref), array (ref), getAllFragmentSpreadsFromSelectionSet (write), REMOVE (ref), getOperationDefinition (ref), getFragmentDefinition (ref), getFragmentDefinitions (ref), isEmpty (ref), filterInPlace (ref), var6 (write), var7 (write)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local var20 = visit(p12, {
		Variable = {
			enter = function(_, p13, _, p14)
				-- upvalues: t (ref)
				if p14.kind ~= "VariableDefinition" then
					t[p13.name.value] = true
				end
				return nil
			end
		},
		Field = {
			enter = function(_, p15)
				-- upvalues: boolean (copy), p11 (ref), array (copy), t_1 (ref), getAllFragmentSpreadsFromSelectionSet (copy), t_3 (ref), REMOVE (copy)
				if boolean.toJSBoolean(p11) and boolean.toJSBoolean(p15.directives) and (array.some(p11, function(p16)
					return p16.remove
				end) and p15.directives) then
					local var25 = p11
					
					if not array.some(p15.directives, function(p17)
						-- upvalues: array (copy), var25 (ref), boolean (copy)
						return array.some(var25, function(p18)
							-- upvalues: boolean (copy), p17 (ref)
							return if boolean.toJSBoolean(p18.name) then true else boolean.toJSBoolean(p18.test) and p18:test(p17)
						end)
					end) then
						return nil
					end
					if p15.arguments then
						array.forEach(p15.arguments, function(p19)
							-- upvalues: t_1 (copy)
							if p19.value.kind == "Variable" then
								table.insert(t_1, { name = p19.value.name.value })
							end
						end)
					end
					if p15.selectionSet then
						array.forEach(getAllFragmentSpreadsFromSelectionSet(p15.selectionSet), function(p20)
							-- upvalues: t_3 (copy)
							table.insert(t_3, { name = p20.name.value })
						end)
					end
					return REMOVE
				end
			end
		},
		FragmentSpread = {
			enter = function(_, p21)
				-- upvalues: t_2 (ref)
				t_2[p21.name.value] = true
			end
		},
		Directive = {
			enter = function(_, p22)
				-- upvalues: boolean (copy), p11 (ref), array (copy), REMOVE (copy)
				return if boolean.toJSBoolean((function(p23)
					-- upvalues: array (copy), p11 (ref), boolean (copy)
					return array.some(p11, function(p24)
						-- upvalues: boolean (copy), p23 (ref)
						return if boolean.toJSBoolean(p24.name) then true else boolean.toJSBoolean(p24.test) and p24:test(p23)
					end)
				end)(p22)) then REMOVE else nil
			end
		}
	})
	local var21 = getOperationDefinition(var20) or getFragmentDefinition(var20)
	local t_4 = {}
	array.forEach(getFragmentDefinitions(var20), function(p25)
		-- upvalues: t_4 (ref)
		t_4[p25.name.value] = p25
	end)
	local var23 = t_4
	local var24 = if array.every(var21.selectionSet.selections, function(p26)
		-- upvalues: isEmpty (copy), var23 (ref)
		return p26.kind == "FragmentSpread" and isEmpty(var23[p26.name.value], var23)
	end, nil) then nil else var20
	
	if boolean.toJSBoolean(var24) and boolean.toJSBoolean(#filterInPlace(t_1, function(p27)
		-- upvalues: boolean (copy), t (ref)
		return not not boolean.toJSBoolean(p27.name) and not t[p27.name]
	end)) then
		var24 = var6(t_1, var24)
	end
	if boolean.toJSBoolean(var24) and boolean.toJSBoolean(#filterInPlace(t_3, function(p28)
		-- upvalues: boolean (copy), t_2 (ref)
		return not not boolean.toJSBoolean(p28.name) and not t_2[p28.name]
	end)) then
		var24 = var7(t_3, var24)
	end
	return var24
end

t.removeDirectivesFromDocument = removeDirectivesFromDocument
t.addTypenameToDocument = object.assign(setmetatable({}, {
	__call = function(_, p29)
		-- upvalues: visit (ref), checkDocument (ref), boolean (ref), array (ref), isField (ref), string (ref), object (ref), t_1 (ref)
		return visit(checkDocument(p29), {
			SelectionSet = {
				enter = function(_, p30, _, p31)
					-- upvalues: boolean (copy), array (copy), isField (copy), string (copy), object (copy), t_1 (copy)
					if boolean.toJSBoolean(p31) and p31.kind == "OperationDefinition" then return end
					local selections = p30.selections
					
					if not boolean.toJSBoolean(selections) then return end
					if array.some(selections, function(p32)
						-- upvalues: isField (copy), string (copy)
						return isField(p32) and (if p32.name.value ~= "__typename" then string.lastIndexOf(p32.name.value, "__", 1) == 1 else true)
					end) then return end
					if isField(p31) and boolean.toJSBoolean(p31.directives) and boolean.toJSBoolean(array.some(p31.directives, function(p33)
						return p33.name.value == "export"
					end)) then
						return
					end
					return object.assign({}, p30, { selections = array.concat({}, selections, { t_1 }) })
				end
			}
		})
	end
}), {
	added = function(_, p34)
		-- upvalues: t_1 (ref)
		return p34 == t_1
	end
})
local t_2 = {
	test = function(_, p35)
		-- upvalues: boolean (ref), array (ref), invariant (ref)
		local isConnection = p35.name.value == "connection"
		
		if isConnection and (not boolean.toJSBoolean(p35.arguments) or array.some(p35.arguments, function(p36)
			return p36.name.value == "key"
		end)) then
			invariant.warn("Removing an @connection directive even though it does not have a key. You may want to use the key parameter to specify a store key.")
		end
		return isConnection
	end
}

function t.removeConnectionDirectiveFromDocument(p37)
	-- upvalues: removeDirectivesFromDocument (ref), t_2 (ref), checkDocument (ref)
	return removeDirectivesFromDocument({ t_2 }, checkDocument(p37))
end

local _ = function(value, p38, p39)
	-- upvalues: array (ref), hasDirectivesInSelection (write)
	local selections
	if p39 == nil then
		p39 = true
	end
	if p38 then
		selections = p38.selections and (array.some(p38.selections, function(p40)
			-- upvalues: hasDirectivesInSelection (copy), value (ref), p39 (write)
			return hasDirectivesInSelection(value, p40, p39)
		end) or false)
	end
	return selections
end

hasDirectivesInSelection = function(p41, p42, p43)
	-- upvalues: isField (ref), array (ref), boolean (ref), hasDirectivesInSelection (write)
	if p43 == nil then
		p43 = true
	end
	if not isField(p42) then
		return true
	elseif not p42.directives then
		return false
	end
	local var28 = array.some(p42.directives, function(p44)
		-- upvalues: array (copy), p41 (ref), boolean (copy)
		return array.some(p41, function(p45)
			-- upvalues: boolean (copy), p44 (ref)
			return if boolean.toJSBoolean(p45.name) then true else boolean.toJSBoolean(p45.test) and p45:test(p44)
		end)
	end)
	
	if not var28 and p43 then
		local selectionSet = p42.selectionSet
		local var29 = p43
		
		if var29 == nil then
			var29 = true
		end
		if selectionSet and selectionSet.selections then
			var28 = array.some(selectionSet.selections, function(p46)
				-- upvalues: hasDirectivesInSelection (copy), p41 (ref), var29 (write)
				return hasDirectivesInSelection(p41, p46, var29)
			end)
			
			if not var28 then
				var28 = false
			end
			var28 = var28 or false
		end
	end
	return var28
end

local _ = function(p47)
	-- upvalues: array (ref)
	return function(p48)
		-- upvalues: array (copy), p47 (ref)
		return array.some(p47, function(p49)
			-- upvalues: p48 (ref)
			local var30
			if p48.value and p48.value.kind == "Variable" and p48.value.name then
				var30 = if p49.name ~= p48.value.name.value then p49.test and (p49:test(p48) or false) else true
			end
			return var30
		end)
	end
end

function t.removeArgumentsFromDocument(p50, p51)
	-- upvalues: array (ref), visit (ref), object (ref), REMOVE (ref), boolean (ref), getOperationDefinition (ref), getFragmentDefinition (ref), getFragmentDefinitions (ref), isEmpty (ref)
	local var31 = function(p52)
		-- upvalues: array (copy), p50 (ref)
		return array.some(p50, function(p53)
			-- upvalues: p52 (ref)
			local var30
			if p52.value and p52.value.kind == "Variable" and p52.value.name then
				var30 = if p53.name ~= p52.value.name.value then p53.test and (p53:test(p52) or false) else true
			end
			return var30
		end)
	end
	
	local var32 = visit(p51, {
		OperationDefinition = {
			enter = function(_, p54)
				-- upvalues: object (copy), array (copy), p50 (ref)
				return object.assign({}, p54, {
					variableDefinitions = p54.variableDefinitions and array.filter(p54.variableDefinitions, function(p55)
						-- upvalues: array (copy), p50 (copy)
						return not array.some(p50, function(p56)
							-- upvalues: p55 (ref)
							return p56.name == p55.variable.name.value
						end)
					end) or {}
				})
			end
		},
		Field = {
			enter = function(_, p57)
				-- upvalues: array (copy), p50 (ref), var31 (ref), REMOVE (copy)
				if array.some(p50, function(p58)
					return p58.remove
				end) then
					local var35 = 0
					
					if p57.arguments then
						array.forEach(p57.arguments, function(p59)
							-- upvalues: var31 (copy), var35 (write)
							if var31(p59) then
								var35 += 1
							end
						end)
					end
					return if var35 == 1 then REMOVE else nil
				end
			end
		},
		Argument = {
			enter = function(_, p60)
				-- upvalues: boolean (copy), var31 (ref), REMOVE (copy)
				return if boolean.toJSBoolean(var31(p60)) then REMOVE else nil
			end
		}
	})
	local var33 = getOperationDefinition(var32) or getFragmentDefinition(var32)
	local t = {}
	array.forEach(getFragmentDefinitions(var32), function(p61)
		-- upvalues: t (ref)
		t[p61.name.value] = p61
	end)
	
	return if array.every(var33.selectionSet.selections, function(p62)
		-- upvalues: isEmpty (copy), t (ref)
		return p62.kind == "FragmentSpread" and isEmpty(t[p62.name.value], t)
	end, nil) then nil else var32
end

function t.removeFragmentSpreadFromDocument(p63, p64)
	-- upvalues: array (ref), REMOVE (ref), visit (ref), getOperationDefinition (ref), getFragmentDefinition (ref), getFragmentDefinitions (ref), isEmpty (ref)
	local function enter(_, p65)
		-- upvalues: array (copy), p63 (ref), REMOVE (copy)
		return if array.some(p63, function(p66)
			-- upvalues: p65 (ref)
			return p66.name == p65.name.value
		end) then REMOVE else nil
	end
	
	local var37 = visit(p64, {
		FragmentSpread = { enter = enter },
		FragmentDefinition = { enter = enter }
	})
	local var38 = getOperationDefinition(var37) or getFragmentDefinition(var37)
	local t = {}
	array.forEach(getFragmentDefinitions(var37), function(p67)
		-- upvalues: t (ref)
		t[p67.name.value] = p67
	end)
	
	return if array.every(var38.selectionSet.selections, function(p68)
		-- upvalues: isEmpty (copy), t (ref)
		return p68.kind == "FragmentSpread" and isEmpty(t[p68.name.value], t)
	end, nil) then nil else var37
end

getAllFragmentSpreadsFromSelectionSet = function(value)
	-- upvalues: array (ref), isField (ref), isInlineFragment (ref), getAllFragmentSpreadsFromSelectionSet (write)
	local t = {}
	array.forEach(value.selections, function(p69)
		-- upvalues: isField (copy), isInlineFragment (copy), array (copy), getAllFragmentSpreadsFromSelectionSet (copy), t (ref)
		if (isField(p69) or isInlineFragment(p69)) and p69.selectionSet then
			array.forEach(getAllFragmentSpreadsFromSelectionSet(p69.selectionSet), function(p70)
				-- upvalues: t (copy)
				table.insert(t, p70)
			end)
			
			return
		elseif p69.kind == "FragmentSpread" then
			table.insert(t, p69)
		end
	end)
	
	return t
end

function t.buildQueryFromSelectionSet(value)
	-- upvalues: getMainDefinition (ref), visit (ref), object (ref)
	return if getMainDefinition(value).operation == "query" then value else visit(value, {
		OperationDefinition = {
			enter = function(_, p71)
				-- upvalues: object (copy)
				return object.assign({}, p71, { operation = "query" })
			end
		}
	})
end

function t.removeClientSetsFromDocument(value)
	-- upvalues: checkDocument (ref), removeDirectivesFromDocument (ref), boolean (ref), visit (ref), array (ref), isField (ref), REMOVE (ref)
	checkDocument(value)
	local var41 = removeDirectivesFromDocument({
		{
			remove = true,
			test = function(_, p72)
				return p72.name.value == "client"
			end
		}
	}, value)
	
	if boolean.toJSBoolean(var41) then
		var41 = visit(var41, {
			FragmentDefinition = {
				enter = function(_, p73)
					-- upvalues: array (copy), isField (copy), boolean (copy), REMOVE (copy)
					return if p73.selectionSet and boolean.toJSBoolean(array.every(p73.selectionSet.selections, function(p74)
						-- upvalues: isField (copy)
						return isField(p74) and p74.name.value == "__typename"
					end)) then REMOVE else nil
				end
			}
		})
	end
	return var41
end

return t