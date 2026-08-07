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
local var2 = object.freeze({})
local nullModule = require(parent.luaUtils.null)
local _ = nil
local var4 = nil

return {
	BREAK = var2,
	REMOVE = nullModule,
	visit = function(p0, p1, p2) --[[ line: 249 ]]
		-- upvalues: t (ref), array (ref), nullModule (ref), isNode (ref), inspect (ref), var4 (write), var2 (ref)
		p2 = p2 or t
		local t_1 = nil
		local var7 = array.isArray(p0)
		local list = { p0 }
		local var9 = 0
		local t_2 = {}
		local _ = nil
		local _ = nil
		local var11 = nil
		local t_3 = {}
		local t_4 = {}
		local var14 = p0
		local var17, var18, t_5
		repeat
			var9 += 1
			local var15 = var9 == #list + 1
			local var16 = var15 and #t_2 ~= 0
			if not var15 then
				var17 = if var11 then if var7 then var9 else list[var9] else nil
				var18 = if var11 then var11[var17] else var14
				
				if var18 == nil or var18 == nullModule then continue end
				if var11 then
					table.insert(t_3, var17)
				end
				t_5 = nil
				
				if not array.isArray(var18) then
					if not isNode(var18) then
						error("Invalid AST Node: " .. inspect(var18) .. ".")
					end
					local var21 = var4(p1, var18.kind, var15)
					
					if var21 then
						t_5 = var21(p1, var18, var17, var11, t_3, t_4)
						
						if t_5 == var2 then break end
						if t_5 == false then
							if var15 then
								if t_5 == nil and var16 then
									table.insert(t_2, { var17, var18 })
								end
								if var15 then
									table.remove(t_3)
								else
									t_1 = {
										inArray = var7,
										index = var9,
										keys = list,
										edits = t_2,
										prev = t_1
									}
									var7 = array.isArray(var18)
									list = if var7 then var18 else p2[var18.kind] or {}
									var9 = 0
									t_2 = {}
									
									if var11 then
										table.insert(t_4, var11)
									end
									var11 = var18
								end
							else
								table.remove(t_3)
							end
						elseif t_5 ~= nil or t_5 == nullModule then
							if t_5 == nullModule then
								t_5 = nil
							end
							table.insert(t_2, { var17, t_5 })
							
							if not var15 then
								if isNode(t_5) then
									var18 = t_5
								else
									table.remove(t_3)
								end
							end
						end
					end
				end
			end
			var17 = if #t_4 == 0 then nil else t_3[#t_3]
			var18 = var11
			var11 = table.remove(t_4)
			
			if var16 then
				local i
				if var7 then
					var18 = array.slice(var18)
				else
					t_5 = {}
					
					for i in pairs(var18) do
						t_5[i] = var18[i]
					end
					var18 = t_5
				end
				t_5 = 0
				
				for i_1 = 1, #t_2 do
					i = t_2[i_1][1]
					local var20 = t_2[i_1][2]
					
					if var7 then
						i -= t_5
					end
					if var7 and var20 == nil then
						array.splice(var18, i, 1)
						t_5 += 1
					else
						var18[i] = var20
					end
				end
			end
			var9 = t_1.index
			list = t_1.keys
			t_2 = t_1.edits
			var7 = t_1.inArray
			t_1 = t_1.prev
		until t_1 == nil
		if #t_2 ~= 0 then
			var14 = t_2[#t_2][2]
		end
		return var14
	end,
	visitInParallel = function(p3) --[[ line: 412 ]]
		-- upvalues: var4 (write), var2 (ref)
		local t = {}
		
		return {
			enter = function(_, p4, ...) --[[ line: 417 ]]
				-- upvalues: p3 (ref), t (ref), var4 (copy), var2 (copy)
				for i = 1, #p3 do
					if t[i] == nil then
						local var23 = var4(p3[i], p4.kind, false)
						
						if var23 then
							local var24 = var23(p3[i], p4, ...)
							
							if var24 == false then
								t[i] = p4
							elseif var24 == var2 then
								t[i] = var2
							elseif var24 == nil then
								continue
							end
							return var24
						end
					end
				end
			end,
			leave = function(_, ...) --[[ line: 439 ]]
				-- upvalues: p3 (ref), t (ref), var4 (copy), var2 (copy)
				local var27
				local var25 = ...
				
				for i = 1, #p3 do
					if t[i] == nil then
						local var26 = var4(p3[i], var25.kind, true)
						
						if var26 then
							var27 = var26(p3[i], ...)
							
							if var27 == var2 then
								t[i] = var2
							elseif var27 == nil or var27 == false then
								continue
							end
							return var27
						end
					elseif t[i] == var25 then
						t[i] = nil
					end
				end
			end
		}
	end,
	getVisitFn = function(p5, p6, p7) --[[ line: 465 ]]
		local var28 = p5[p6]
		
		if var28 then
			if not p7 and type(var28) == "function" then
				return var28
			end
			local var29 = if typeof(var28) ~= "function" then if p7 then var28.leave else var28.enter else nil
			
			if type(var29) == "function" then
				return var29
			end
		else
			local var30 = if p7 then p5.leave else p5.enter
			
			if var30 then
				if type(var30) == "function" then
					return var30
				end
				local var31 = var30[p6]
				
				if type(var31) == "function" then
					return var31
				end
			end
		end
	end,
	QueryDocumentKeys = t
}