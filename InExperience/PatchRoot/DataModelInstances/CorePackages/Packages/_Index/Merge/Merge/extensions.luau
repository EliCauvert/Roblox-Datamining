local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local _ = require(Parent.GraphQL)
local MergeDeepFunction = require(Parent.Utils).mergeDeep

local function applyExtensionObject(GetResult, Extensions)
	-- upvalues: MergeDeepFunction (copy), Boolean (copy)
	if GetResult then
		GetResult.extensions = MergeDeepFunction({
			Boolean.toJSBoolean(GetResult.extensions) and GetResult.extensions or {},
			Boolean.toJSBoolean(Extensions) and Extensions or {}
		})
		
		return
	end
end

return {
	extractExtensionsFromSchema = require(Parent.Utils).extractExtensionsFromSchema,
	mergeExtensions = function(p1)
		-- upvalues: MergeDeepFunction (copy)
		return MergeDeepFunction(p1)
	end,
	applyExtensions = function(p1, p2)
		-- upvalues: applyExtensionObject (copy), Object (copy), Boolean (copy), Array (copy)
		applyExtensionObject(p1, p2.schemaExtensions)
		local EntriesFunction = Object.entries
		local Types = Boolean.toJSBoolean(p2.types) and p2.types or {}
		for _, value in EntriesFunction(Types) do
			local v1 = value[2]
			local Type = p1:getType(value[1])
			
			if Boolean.toJSBoolean(Type) then
				applyExtensionObject(Type, v1.extensions)
				
				if v1.type == "object" or v1.type == "interface" then
					for _, value1 in Object.entries(v1.fields) do
						local v2 = value1[2]
						local GetResult = Type:getFields():get(value1[1])
						
						if Boolean.toJSBoolean(GetResult) then
							applyExtensionObject(GetResult, v2.extensions)
							
							for _, value2 in Object.entries(v2.arguments) do
								local Unpacked, Unpacked2 = table.unpack(value2, 1, 2)
								applyExtensionObject(Array.find(GetResult.args, function(p3): boolean
									-- upvalues: Unpacked (copy)
									return p3.name == Unpacked
								end), Unpacked2)
							end
						end
					end
				else
					if v1.type == "input" then
						for _, value3 in Object.entries(v1.fields) do
							local Unpacked1, Unpacked2_1 = table.unpack(value3, 1, 2)
							applyExtensionObject(Type:getFields():get(Unpacked1), Unpacked2_1.extensions)
						end
					elseif v1.type == "enum" then
						for _, value4 in Object.entries(v1.values) do
							local Unpacked3, Unpacked2_2 = table.unpack(value4, 1, 2)
							applyExtensionObject(Type:getValue(Unpacked3), Unpacked2_2)
						end
					end
				end
			end
		end
		return p1
	end
}