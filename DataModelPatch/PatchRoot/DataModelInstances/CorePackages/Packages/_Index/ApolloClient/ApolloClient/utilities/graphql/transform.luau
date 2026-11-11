local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local Boolean = LuauPolyfillModule.Boolean
local String = LuauPolyfillModule.String
local GraphQLModule = require(Parent1.GraphQL)
local VisitFunction = GraphQLModule.visit
local REMOVE = GraphQLModule.REMOVE
local Invariant = require(Parent.jsutils.invariant).invariant
local GetFromASTModule = require(script.Parent.getFromAST)
local CheckDocumentFunction = GetFromASTModule.checkDocument
local GetOperationDefinitionFunction = GetFromASTModule.getOperationDefinition
local GetFragmentDefinitionFunction = GetFromASTModule.getFragmentDefinition
local GetFragmentDefinitionsFunction = GetFromASTModule.getFragmentDefinitions
local GetMainDefinitionFunction = GetFromASTModule.getMainDefinition
local FilterInPlaceFunction = require(script.Parent.Parent.common.filterInPlace).filterInPlace
local StoreUtilsModule = require(script.Parent.storeUtils)
local IsFieldFunction = StoreUtilsModule.isField
local IsInlineFragmentFunction = StoreUtilsModule.isInlineFragment

local function _(p1)
	-- upvalues: Array (copy)
	local t = {}
	Array.forEach(p1, function(p2)
		-- upvalues: t (copy)
		t[p2.name.value] = p2
	end)
	
	return t
end

local HasDirectivesInSelection = nil
local Callback = nil
local Callback1 = nil
local Callback2 = nil
local config = {
	kind = "Field",
	name = { kind = "Name", value = "__typename" }
}

local function isEmpty(p1, p2)
	-- upvalues: Array (copy), isEmpty (copy)
	return Array.every(p1.selectionSet.selections, function(p3)
		-- upvalues: isEmpty (upval), p2 (copy)
		return p3.kind == "FragmentSpread" and isEmpty(p2[p3.name.value], p2)
	end, nil)
end

local _ = function(p1)
	-- upvalues: GetOperationDefinitionFunction (copy), GetFragmentDefinitionFunction (copy), GetFragmentDefinitionsFunction (copy), Array (copy), isEmpty (copy)
	local OperationDefinition = GetOperationDefinitionFunction(p1) or GetFragmentDefinitionFunction(p1)
	local t = {}
	Array.forEach(GetFragmentDefinitionsFunction(p1), function(p2)
		-- upvalues: t (copy)
		t[p2.name.value] = p2
	end)
	
	return if Array.every(OperationDefinition.selectionSet.selections, function(p2)
		-- upvalues: isEmpty (upval), t (copy)
		return p2.kind == "FragmentSpread" and isEmpty(t[p2.name.value], t)
	end, nil) then nil else p1
end

local _ = function(p1)
	-- upvalues: Array (copy), Boolean (copy)
	return function(p2)
		-- upvalues: Array (upval), p1 (copy), Boolean (upval)
		return Array.some(p1, function(p3)
			-- upvalues: Boolean (upval), p2 (copy)
			return Boolean.toJSBoolean(p3.name) and p3.name == p2.name.value or Boolean.toJSBoolean(p3.test) and p3:test(p2)
		end)
	end
end

local function removeDirectivesFromDocument(p1, p2)
	-- upvalues: VisitFunction (copy), Boolean (copy), Array (copy), Callback2 (ref), REMOVE (copy), GetOperationDefinitionFunction (copy), GetFragmentDefinitionFunction (copy), GetFragmentDefinitionsFunction (copy), isEmpty (copy), FilterInPlaceFunction (copy), Callback (ref), Callback1 (ref)
	local t = {}
	local List = {}
	local t1 = {}
	local List1 = {}
	local VisitResult = VisitFunction(p2, {
		Variable = {
			enter = function(_, p3, _, p4)
				-- upvalues: t (copy)
				if p4.kind ~= "VariableDefinition" then
					t[p3.name.value] = true
				end
				return nil
			end
		},
		Field = {
			enter = function(_, p3)
				-- upvalues: Boolean (upval), p1 (copy), Array (upval), List (copy), Callback2 (upval), List1 (copy), REMOVE (upval)
				if not Boolean.toJSBoolean(p1) or not Boolean.toJSBoolean(p3.directives) or not Array.some(p1, function(p4)
					return p4.remove
				end) or not p3.directives or not Array.some(p3.directives, function(p4)
					-- upvalues: Array (upval), p1 (copy), Boolean (upval)
					return Array.some(p1, function(p5)
						-- upvalues: Boolean (upval), p4 (copy)
						return Boolean.toJSBoolean(p5.name) and p5.name == p4.name.value or Boolean.toJSBoolean(p5.test) and p5:test(p4)
					end)
				end) then
					return nil
				end
				if p3.arguments then
					Array.forEach(p3.arguments, function(p4)
						-- upvalues: List (upval)
						if p4.value.kind == "Variable" then
							table.insert(List, { name = p4.value.name.value })
						end
					end)
				end
				if p3.selectionSet then
					Array.forEach(Callback2(p3.selectionSet), function(p4)
						-- upvalues: List1 (upval)
						table.insert(List1, { name = p4.name.value })
					end)
				end
				return REMOVE
			end
		},
		FragmentSpread = {
			enter = function(_, p3)
				-- upvalues: t1 (copy)
				t1[p3.name.value] = true
			end
		},
		Directive = {
			enter = function(_, p3)
				-- upvalues: Boolean (upval), p1 (copy), Array (upval), REMOVE (upval)
				return if Boolean.toJSBoolean((function(p4)
					-- upvalues: Array (upval), p1 (copy), Boolean (upval)
					return Array.some(p1, function(p5)
						-- upvalues: Boolean (upval), p4 (copy)
						return Boolean.toJSBoolean(p5.name) and p5.name == p4.name.value or Boolean.toJSBoolean(p5.test) and p5:test(p4)
					end)
				end)(p3)) then REMOVE else nil
			end
		}
	})
	local OperationDefinition = GetOperationDefinitionFunction(VisitResult) or GetFragmentDefinitionFunction(VisitResult)
	local t2 = {}
	Array.forEach(GetFragmentDefinitionsFunction(VisitResult), function(p3)
		-- upvalues: t2 (copy)
		t2[p3.name.value] = p3
	end)
	local VisitResult1 = if Array.every(OperationDefinition.selectionSet.selections, function(p3)
		-- upvalues: isEmpty (upval), t2 (copy)
		return p3.kind == "FragmentSpread" and isEmpty(t2[p3.name.value], t2)
	end, nil) then nil else VisitResult
	
	if Boolean.toJSBoolean(VisitResult1) and Boolean.toJSBoolean(#FilterInPlaceFunction(List, function(p3): boolean
		-- upvalues: Boolean (upval), t (copy)
		return not not Boolean.toJSBoolean(p3.name) and not t[p3.name]
	end)) then
		VisitResult1 = Callback(List, VisitResult1)
	end
	if Boolean.toJSBoolean(VisitResult1) and Boolean.toJSBoolean(#FilterInPlaceFunction(List1, function(p3): boolean
		-- upvalues: Boolean (upval), t1 (copy)
		return not not Boolean.toJSBoolean(p3.name) and not t1[p3.name]
	end)) then
		VisitResult1 = Callback1(List1, VisitResult1)
	end
	return VisitResult1
end

local config1 = {
	test = function(_, p1): boolean
		-- upvalues: Boolean (copy), Array (copy), Invariant (copy)
		local IsConnection = p1.name.value == "connection"
		
		if IsConnection and (not Boolean.toJSBoolean(p1.arguments) or Array.some(p1.arguments, function(p2): boolean
			return p2.name.value == "key"
		end)) then
			Invariant.warn("Removing an @connection directive even though it does not have a key. You may want to use the key parameter to specify a store key.")
		end
		return IsConnection
	end
}

local _ = function(p1, p2, p3: boolean)
	-- upvalues: Array (copy), HasDirectivesInSelection (ref)
	if p3 == nil then
		p3 = true
	end
	return p2 and p2.selections and Array.some(p2.selections, function(p4)
		-- upvalues: HasDirectivesInSelection (upval), p1 (copy), p3 (ref)
		return HasDirectivesInSelection(p1, p4, p3)
	end) or false
end

HasDirectivesInSelection = function(p1, p2, p3: boolean)
	-- upvalues: IsFieldFunction (copy), Array (copy), Boolean (copy), HasDirectivesInSelection (ref)
	if p3 == nil then
		p3 = true
	end
	if not IsFieldFunction(p2) then
		return true
	end
	if not p2.directives then
		return false
	end
	local SomeResult = Array.some(p2.directives, function(p4)
		-- upvalues: Array (upval), p1 (copy), Boolean (upval)
		return Array.some(p1, function(p5)
			-- upvalues: Boolean (upval), p4 (copy)
			return Boolean.toJSBoolean(p5.name) and p5.name == p4.name.value or Boolean.toJSBoolean(p5.test) and p5:test(p4)
		end)
	end)
	
	if not SomeResult then
		if p3 then
			local SelectionSet = p2.selectionSet
			local Flag: boolean = p3
			
			if Flag == nil then
				Flag = true
			end
			SomeResult = SelectionSet and SelectionSet.selections and Array.some(SelectionSet.selections, function(p4)
				-- upvalues: HasDirectivesInSelection (upval), p1 (copy), Flag (ref)
				return HasDirectivesInSelection(p1, p4, Flag)
			end) or false or false
		else
			SomeResult = false
		end
	end
	return SomeResult
end

local _ = function(p1)
	-- upvalues: Array (copy)
	return function(p2)
		-- upvalues: Array (upval), p1 (copy)
		return Array.some(p1, function(p3)
			-- upvalues: p2 (copy)
			return p2.value and p2.value.kind == "Variable" and p2.value.name and (p3.name == p2.value.name.value or p3.test and p3.test(p3, p2)) or false
		end)
	end
end

Callback = function(p1, p2)
	-- upvalues: Array (copy), VisitFunction (copy), Object (copy), REMOVE (copy), Boolean (copy), GetOperationDefinitionFunction (copy), GetFragmentDefinitionFunction (copy), GetFragmentDefinitionsFunction (copy), isEmpty (copy)
	local function v38(p3)
		-- upvalues: Array (upval), p1 (copy)
		return Array.some(p1, function(p4)
			-- upvalues: p3 (copy)
			return p3.value and p3.value.kind == "Variable" and p3.value.name and (p4.name == p3.value.name.value or p4.test and p4.test(p4, p3)) or false
		end)
	end
	
	local VisitResult = VisitFunction(p2, {
		OperationDefinition = {
			enter = function(_, p3)
				-- upvalues: Object (upval), Array (upval), p1 (copy)
				return Object.assign({}, p3, {
					variableDefinitions = p3.variableDefinitions and Array.filter(p3.variableDefinitions, function(p4): boolean
						-- upvalues: Array (upval), p1 (upval)
						return not Array.some(p1, function(p5): boolean
							-- upvalues: p4 (copy)
							return p5.name == p4.variable.name.value
						end)
					end) or {}
				})
			end
		},
		Field = {
			enter = function(_, p3)
				-- upvalues: Array (upval), p1 (copy), v38 (copy), REMOVE (upval)
				if Array.some(p1, function(p4)
					return p4.remove
				end) then
					local Count = 0
					
					if p3.arguments then
						Array.forEach(p3.arguments, function(p4)
							-- upvalues: v38 (upval), Count (ref)
							if v38(p4) then
								Count += 1
							end
						end)
					end
					if Count == 1 then
						return REMOVE
					end
				end
				return nil
			end
		},
		Argument = {
			enter = function(_, p3)
				-- upvalues: Boolean (upval), v38 (copy), REMOVE (upval)
				return if Boolean.toJSBoolean(v38(p3)) then REMOVE else nil
			end
		}
	})
	local OperationDefinition = GetOperationDefinitionFunction(VisitResult) or GetFragmentDefinitionFunction(VisitResult)
	local t = {}
	Array.forEach(GetFragmentDefinitionsFunction(VisitResult), function(p3)
		-- upvalues: t (copy)
		t[p3.name.value] = p3
	end)
	
	return if Array.every(OperationDefinition.selectionSet.selections, function(p3)
		-- upvalues: isEmpty (upval), t (copy)
		return p3.kind == "FragmentSpread" and isEmpty(t[p3.name.value], t)
	end, nil) then nil else VisitResult
end

Callback1 = function(p1, p2)
	-- upvalues: Array (copy), REMOVE (copy), VisitFunction (copy), GetOperationDefinitionFunction (copy), GetFragmentDefinitionFunction (copy), GetFragmentDefinitionsFunction (copy), isEmpty (copy)
	local function enter(_, p3)
		-- upvalues: Array (upval), p1 (copy), REMOVE (upval)
		return if Array.some(p1, function(p4): boolean
			-- upvalues: p3 (copy)
			return p4.name == p3.name.value
		end) then REMOVE else nil
	end
	
	local VisitResult = VisitFunction(p2, {
		FragmentSpread = { enter = enter },
		FragmentDefinition = { enter = enter }
	})
	local OperationDefinition = GetOperationDefinitionFunction(VisitResult) or GetFragmentDefinitionFunction(VisitResult)
	local t = {}
	Array.forEach(GetFragmentDefinitionsFunction(VisitResult), function(p3)
		-- upvalues: t (copy)
		t[p3.name.value] = p3
	end)
	
	return if Array.every(OperationDefinition.selectionSet.selections, function(p3)
		-- upvalues: isEmpty (upval), t (copy)
		return p3.kind == "FragmentSpread" and isEmpty(t[p3.name.value], t)
	end, nil) then nil else VisitResult
end

Callback2 = function(SelectionSet)
	-- upvalues: Array (copy), IsFieldFunction (copy), IsInlineFragmentFunction (copy), Callback2 (ref)
	local List = {}
	Array.forEach(SelectionSet.selections, function(p1)
		-- upvalues: IsFieldFunction (upval), IsInlineFragmentFunction (upval), Array (upval), Callback2 (upval), List (copy)
		if (IsFieldFunction(p1) or IsInlineFragmentFunction(p1)) and p1.selectionSet then
			Array.forEach(Callback2(p1.selectionSet), function(p2)
				-- upvalues: List (upval)
				table.insert(List, p2)
			end)
			
			return
		end
		if p1.kind == "FragmentSpread" then
			table.insert(List, p1)
		end
	end)
	
	return List
end

return {
	removeDirectivesFromDocument = removeDirectivesFromDocument,
	addTypenameToDocument = Object.assign(setmetatable({}, {
		__call = function(_, p1)
			-- upvalues: VisitFunction (copy), CheckDocumentFunction (copy), Boolean (copy), Array (copy), IsFieldFunction (copy), String (copy), Object (copy), config (copy)
			return VisitFunction(CheckDocumentFunction(p1), {
				SelectionSet = {
					enter = function(_, p2, _, p3)
						-- upvalues: Boolean (upval), Array (upval), IsFieldFunction (upval), String (upval), Object (upval), config (upval)
						if Boolean.toJSBoolean(p3) and p3.kind == "OperationDefinition" then return end
						local Selections = p2.selections
						
						if not Boolean.toJSBoolean(Selections) then return end
						if Array.some(Selections, function(p4): boolean
							-- upvalues: IsFieldFunction (upval), String (upval)
							return IsFieldFunction(p4) and (p4.name.value == "__typename" or String.lastIndexOf(p4.name.value, "__", 1) == 1)
						end) then return end
						if IsFieldFunction(p3) and Boolean.toJSBoolean(p3.directives) and Boolean.toJSBoolean(Array.some(p3.directives, function(p4): boolean
							return p4.name.value == "export"
						end)) then return end
						return Object.assign({}, p2, { selections = Array.concat({}, Selections, { config }) })
					end
				}
			})
		end
	}), {
		added = function(_, p1): boolean
			-- upvalues: config (copy)
			return p1 == config
		end
	}),
	removeConnectionDirectiveFromDocument = function(p1)
		-- upvalues: removeDirectivesFromDocument (copy), config1 (copy), CheckDocumentFunction (copy)
		return (removeDirectivesFromDocument({ config1 }, CheckDocumentFunction(p1)))
	end,
	removeArgumentsFromDocument = Callback,
	removeFragmentSpreadFromDocument = Callback1,
	buildQueryFromSelectionSet = function(p1)
		-- upvalues: GetMainDefinitionFunction (copy), VisitFunction (copy), Object (copy)
		return if GetMainDefinitionFunction(p1).operation == "query" then p1 else VisitFunction(p1, {
			OperationDefinition = {
				enter = function(_, p2)
					-- upvalues: Object (upval)
					return Object.assign({}, p2, { operation = "query" })
				end
			}
		})
	end,
	removeClientSetsFromDocument = function(p1)
		-- upvalues: CheckDocumentFunction (copy), removeDirectivesFromDocument (copy), Boolean (copy), VisitFunction (copy), Array (copy), IsFieldFunction (copy), REMOVE (copy)
		CheckDocumentFunction(p1)
		local RemoveDirectivesFromDocumentResult = removeDirectivesFromDocument({
			{
				remove = true,
				test = function(_, p2): boolean
					return p2.name.value == "client"
				end
			}
		}, p1)
		
		if Boolean.toJSBoolean(RemoveDirectivesFromDocumentResult) then
			RemoveDirectivesFromDocumentResult = VisitFunction(RemoveDirectivesFromDocumentResult, {
				FragmentDefinition = {
					enter = function(_, p2)
						-- upvalues: Array (upval), IsFieldFunction (upval), Boolean (upval), REMOVE (upval)
						return if p2.selectionSet and Boolean.toJSBoolean((Array.every(p2.selectionSet.selections, function(p3): boolean
							-- upvalues: IsFieldFunction (upval)
							return IsFieldFunction(p3) and p3.name.value == "__typename"
						end))) then REMOVE else nil
					end
				}
			})
		end
		return RemoveDirectivesFromDocumentResult
	end
}