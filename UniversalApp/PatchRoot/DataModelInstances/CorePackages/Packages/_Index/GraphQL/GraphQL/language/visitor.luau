local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local InspectFunction = require(Parent.jsutils.inspect).inspect
local _ = require(Parent.language.ast)
local IsNodeFunction = require(script.Parent.ast).isNode
local QueryDocumentKeys = {
	Name = {},
	Document = { "definitions" },
	OperationDefinition = {
		"name",
		"variableDefinitions",
		"directives",
		"selectionSet"
	},
	VariableDefinition = { "variable", "type", "defaultValue", "directives" },
	Variable = { "name" },
	SelectionSet = { "selections" },
	Field = {
		"alias",
		"name",
		"arguments",
		"directives",
		"selectionSet"
	},
	Argument = { "name", "value" },
	FragmentSpread = { "name", "directives" },
	InlineFragment = { "typeCondition", "directives", "selectionSet" },
	FragmentDefinition = {
		"name",
		"variableDefinitions",
		"typeCondition",
		"directives",
		"selectionSet"
	},
	IntValue = {},
	FloatValue = {},
	StringValue = {},
	BooleanValue = {},
	NullValue = {},
	EnumValue = {},
	ListValue = { "values" },
	ObjectValue = { "fields" },
	ObjectField = { "name", "value" },
	Directive = { "name", "arguments" },
	NamedType = { "name" },
	ListType = { "type" },
	NonNullType = { "type" },
	SchemaDefinition = { "description", "directives", "operationTypes" },
	OperationTypeDefinition = { "type" },
	ScalarTypeDefinition = { "description", "name", "directives" },
	ObjectTypeDefinition = {
		"description",
		"name",
		"interfaces",
		"directives",
		"fields"
	},
	FieldDefinition = {
		"description",
		"name",
		"arguments",
		"type",
		"directives"
	},
	InputValueDefinition = {
		"description",
		"name",
		"type",
		"defaultValue",
		"directives"
	},
	InterfaceTypeDefinition = {
		"description",
		"name",
		"interfaces",
		"directives",
		"fields"
	},
	UnionTypeDefinition = { "description", "name", "directives", "types" },
	EnumTypeDefinition = { "description", "name", "directives", "values" },
	EnumValueDefinition = { "description", "name", "directives" },
	InputObjectTypeDefinition = { "description", "name", "directives", "fields" },
	DirectiveDefinition = { "description", "name", "arguments", "locations" },
	SchemaExtension = { "directives", "operationTypes" },
	ScalarTypeExtension = { "name", "directives" },
	ObjectTypeExtension = { "name", "interfaces", "directives", "fields" },
	InterfaceTypeExtension = { "name", "interfaces", "directives", "fields" },
	UnionTypeExtension = { "name", "directives", "types" },
	EnumTypeExtension = { "name", "directives", "values" },
	InputObjectTypeExtension = { "name", "directives", "fields" }
}
local FreezeResult = LuauPolyfillModule.Object.freeze({})
local NullModule = require(Parent.luaUtils.null)
local Callback = nil

local function visit(p1, p2, p3) --[[ Line: 249 ]]
	-- upvalues: QueryDocumentKeys (copy), Array (copy), NullModule (copy), IsNodeFunction (copy), InspectFunction (copy), Callback (ref), FreezeResult (copy)
	local P2 = p3 or QueryDocumentKeys
	local Prev = nil
	local IsArray = Array.isArray(p1)
	local Keys = { p1 }
	local Index = 0
	local Edits = {}
	local Removed = nil
	local List = {}
	local List1 = {}
	local v1 = p1
	local SliceResult = nil
	local Entry = nil
	repeat
		Index += 1
		local IsIndexMatch = Index == #Keys + 1
		local v2: boolean = IsIndexMatch and #Edits ~= 0
		if IsIndexMatch then
			Entry = if #List1 == 0 then nil else List[#List]
			SliceResult = Removed
			Removed = table.remove(List1)
			
			if v2 then
				if IsArray then
					SliceResult = Array.slice(SliceResult)
				else
					local t = {}
					
					for i1 in pairs(SliceResult) do
						t[i1] = SliceResult[i1]
					end
					SliceResult = t
				end
				local Count = 0
				
				for i = 1, #Edits do
					local EditEntry = Edits[i][1]
					local EditEntry1 = Edits[i][2]
					
					if IsArray then
						EditEntry -= Count
					end
					if IsArray and EditEntry1 == nil then
						Array.splice(SliceResult, EditEntry, 1)
						Count += 1
					else
						SliceResult[EditEntry] = EditEntry1
					end
				end
			end
			Index = Prev.index
			Keys = Prev.keys
			Edits = Prev.edits
			IsArray = Prev.inArray
			Prev = Prev.prev
		else
			Entry = if Removed then if IsArray then Index else Keys[Index] else nil
			SliceResult = if Removed then Removed[Entry] else v1
			
			if SliceResult == nil or SliceResult == NullModule then continue end
			if Removed then
				table.insert(List, Entry)
			end
		end
		local Enabled = nil
		
		if not Array.isArray(SliceResult) then
			if not IsNodeFunction(SliceResult) then
				error("Invalid AST Node: " .. InspectFunction(SliceResult) .. ".")
			end
			local CallbackResult = Callback(p2, SliceResult.kind, IsIndexMatch)
			
			if CallbackResult then
				Enabled = CallbackResult(p2, SliceResult, Entry, Removed, List, List1)
				
				if Enabled == FreezeResult then break end
				if Enabled == false then
					if not IsIndexMatch then
						table.remove(List)
						continue
					end
				elseif Enabled ~= nil or Enabled == NullModule then
					if Enabled == NullModule then
						Enabled = nil
					end
					table.insert(Edits, { Entry, Enabled })
					
					if not IsIndexMatch then
						if not IsNodeFunction(Enabled) then
							table.remove(List)
							continue
						else
							SliceResult = Enabled
						end
					end
				end
			end
		end
		if Enabled == nil and v2 then
			table.insert(Edits, { Entry, SliceResult })
		end
		if IsIndexMatch then
			table.remove(List)
		else
			Prev = {
				inArray = IsArray,
				index = Index,
				keys = Keys,
				edits = Edits,
				prev = Prev
			}
			IsArray = Array.isArray(SliceResult)
			Keys = if IsArray then SliceResult else P2[SliceResult.kind] or {}
			Index = 0
			Edits = {}
			
			if Removed then
				table.insert(List1, Removed)
			end
			Removed = SliceResult
		end
	until Prev == nil
	if #Edits ~= 0 then
		v1 = Edits[#Edits][2]
	end
	return v1
end

local function visitInParallel(p1) --[[ Line: 412 ]]
	-- upvalues: Callback (ref), FreezeResult (copy)
	local FreezeResults = {}
	
	return {
		enter = function(_, p2, ...) --[[ Line: 417 ]]
			-- upvalues: p1 (copy), FreezeResults (copy), Callback (upval), FreezeResult (upval)
			local CallbackResultResult = nil
			for i = 1, #p1 do
				if FreezeResults[i] == nil then
					local CallbackResult = Callback(p1[i], p2.kind, false)
					
					if CallbackResult then
						CallbackResultResult = CallbackResult(p1[i], p2, ...)
						
						if CallbackResultResult == false then
							FreezeResults[i] = p2
						elseif CallbackResultResult == FreezeResult then
							FreezeResults[i] = FreezeResult
						elseif CallbackResultResult ~= nil then
							return CallbackResultResult
						end
					end
				end
			end
		end,
		leave = function(_, ...) --[[ Line: 439 ]]
			-- upvalues: p1 (copy), FreezeResults (copy), Callback (upval), FreezeResult (upval)
			local v1 = (...)
			local CallbackResultResult = nil
			
			for i = 1, #p1 do
				if FreezeResults[i] == nil then
					local CallbackResult = Callback(p1[i], v1.kind, true)
					
					if CallbackResult then
						CallbackResultResult = CallbackResult(p1[i], ...)
						
						if CallbackResultResult == FreezeResult then
							FreezeResults[i] = FreezeResult
						elseif CallbackResultResult ~= nil and CallbackResultResult ~= false then
							return CallbackResultResult
						end
					end
				elseif FreezeResults[i] == v1 then
					FreezeResults[i] = nil
				end
			end
		end
	}
end

Callback = function(p3, Kind, p4) --[[ Line: 465 | Named "getVisitFn" ]]
	local Callback = p3[Kind]
	
	if not Callback then
		local Leave = if p4 then p3.leave else p3.enter
		
		if Leave then
			if type(Leave) == "function" then
				return Leave
			end
			local Callback1 = Leave[Kind]
			
			if type(Callback1) == "function" then
				return Callback1
			end
		end
	elseif not p4 and type(Callback) == "function" then
		return Callback
	else
		local Leave1 = if typeof(Callback) ~= "function" then if p4 then Callback.leave else Callback.enter else nil
		
		if type(Leave1) == "function" then
			return Leave1
		end
	end
end

return {
	BREAK = FreezeResult,
	REMOVE = NullModule,
	visit = visit,
	visitInParallel = visitInParallel,
	getVisitFn = Callback,
	QueryDocumentKeys = QueryDocumentKeys
}