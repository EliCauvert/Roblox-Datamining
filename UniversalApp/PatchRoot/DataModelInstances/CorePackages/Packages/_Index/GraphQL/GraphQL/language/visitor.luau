local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local inspect = require(parent.jsutils.inspect).inspect
local _ = require(parent.language.ast)
local isNode = require(script.Parent.ast).isNode
local t = {
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
local var1 = object.freeze({})
local nullModule = require(parent.luaUtils.null)
local _ = nil
local var2 = nil

return {
	BREAK = var1,
	REMOVE = nullModule,
	visit = function(p1, p2, p3)
		-- upvalues: t (ref), array (ref), nullModule (ref), isNode (ref), inspect (ref), var2 (write), var1 (ref)
		p3 = p3 or t
		local t_1 = nil
		local var3 = array.isArray(p1)
		local list = { p1 }
		local var4 = 0
		local t_2 = {}
		local _ = nil
		local _ = nil
		local var5 = nil
		local t_3 = {}
		local t_4 = {}
		local var6 = p1
		local var7, var8, t_5
		repeat
			var4 += 1
			local var9 = var4 == #list + 1
			local var10 = var9 and #t_2 ~= 0
			if not var9 then
				var7 = if var5 then if var3 then var4 else list[var4] else nil
				var8 = if var5 then var5[var7] else var6
				
				if var8 == nil or var8 == nullModule then continue end
				if var5 then
					table.insert(t_3, var7)
				end
				t_5 = nil
				
				if not array.isArray(var8) then
					if not isNode(var8) then
						error("Invalid AST Node: " .. inspect(var8) .. ".")
					end
					local var11 = var2(p2, var8.kind, var9)
					
					if var11 then
						t_5 = var11(p2, var8, var7, var5, t_3, t_4)
						
						if t_5 == var1 then break end
						if t_5 == false then
							if var9 then
								if t_5 == nil and var10 then
									table.insert(t_2, { var7, var8 })
								end
								if var9 then
									table.remove(t_3)
								else
									t_1 = {
										inArray = var3,
										index = var4,
										keys = list,
										edits = t_2,
										prev = t_1
									}
									var3 = array.isArray(var8)
									list = if var3 then var8 else p3[var8.kind] or {}
									var4 = 0
									t_2 = {}
									
									if var5 then
										table.insert(t_4, var5)
									end
									var5 = var8
								end
							else
								table.remove(t_3)
							end
						elseif t_5 ~= nil or t_5 == nullModule then
							if t_5 == nullModule then
								t_5 = nil
							end
							table.insert(t_2, { var7, t_5 })
							
							if not var9 then
								if isNode(t_5) then
									var8 = t_5
								else
									table.remove(t_3)
								end
							end
						end
					end
				end
			end
			var7 = if #t_4 == 0 then nil else t_3[#t_3]
			var8 = var5
			var5 = table.remove(t_4)
			
			if var10 then
				local i
				if var3 then
					var8 = array.slice(var8)
				else
					t_5 = {}
					
					for i in pairs(var8) do
						t_5[i] = var8[i]
					end
					var8 = t_5
				end
				t_5 = 0
				
				for i_1 = 1, #t_2 do
					i = t_2[i_1][1]
					local var12 = t_2[i_1][2]
					
					if var3 then
						i -= t_5
					end
					if var3 and var12 == nil then
						array.splice(var8, i, 1)
						t_5 += 1
					else
						var8[i] = var12
					end
				end
			end
			var4 = t_1.index
			list = t_1.keys
			t_2 = t_1.edits
			var3 = t_1.inArray
			t_1 = t_1.prev
		until t_1 == nil
		if #t_2 ~= 0 then
			var6 = t_2[#t_2][2]
		end
		return var6
	end,
	visitInParallel = function(p1)
		-- upvalues: var2 (write), var1 (ref)
		local t = {}
		
		return {
			enter = function(_, p2, ...)
				-- upvalues: p1 (ref), t (ref), var2 (copy), var1 (copy)
				for i = 1, #p1 do
					if t[i] == nil then
						local var3 = var2(p1[i], p2.kind, false)
						
						if var3 then
							local var4 = var3(p1[i], p2, ...)
							
							if var4 == false then
								t[i] = p2
							elseif var4 == var1 then
								t[i] = var1
							elseif var4 == nil then
								continue
							end
							return var4
						end
					end
				end
			end,
			leave = function(_, ...)
				-- upvalues: p1 (ref), t (ref), var2 (copy), var1 (copy)
				local var5
				local var6 = ...
				
				for i = 1, #p1 do
					if t[i] == nil then
						local var7 = var2(p1[i], var6.kind, true)
						
						if var7 then
							var5 = var7(p1[i], ...)
							
							if var5 == var1 then
								t[i] = var1
							elseif var5 == nil or var5 == false then
								continue
							end
							return var5
						end
					elseif t[i] == var6 then
						t[i] = nil
					end
				end
			end
		}
	end,
	getVisitFn = function(p2, p3, p4)
		local var3 = p2[p3]
		
		if var3 then
			if not p4 and type(var3) == "function" then
				return var3
			end
			local var4 = if typeof(var3) ~= "function" then if p4 then var3.leave else var3.enter else nil
			
			if type(var4) == "function" then
				return var4
			end
		else
			local var5 = if p4 then p2.leave else p2.enter
			
			if var5 then
				if type(var5) == "function" then
					return var5
				end
				local var6 = var5[p3]
				
				if type(var6) == "function" then
					return var6
				end
			end
		end
	end,
	QueryDocumentKeys = t
}