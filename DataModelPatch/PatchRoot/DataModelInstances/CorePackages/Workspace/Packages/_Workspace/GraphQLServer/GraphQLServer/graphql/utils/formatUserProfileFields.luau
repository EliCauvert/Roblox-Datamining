local GraphQLServer = script:FindFirstAncestor("GraphQLServer")
local Parent = GraphQLServer.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local CollectSubFields = require(Parent.GraphqlToolsUtils).collectSubFields
local UserProfileNestedFieldsModule = require(GraphQLServer.graphql.enums.UserProfileNestedFields)

return function(p1, p2)
	-- upvalues: CollectSubFields (copy), LuauPolyfillModule (copy), UserProfileNestedFieldsModule (copy)
	local CollectSubFields1 = if p2 then p2 else CollectSubFields
	local CollectSubFieldsResult = CollectSubFields1(p1.schema, p1.fragments, p1.variableValues, p1.returnType, p1.fieldNodes)
	local List = {}
	
	local function _(p3)
		-- upvalues: LuauPolyfillModule (upval)
		return p3 == nil or (p3 == "id" or LuauPolyfillModule.String.endsWith(p3, "__typename"))
	end
	
	for _, value in CollectSubFieldsResult do
		local v1 = value[1]
		
		if not UserProfileNestedFieldsModule[v1] then
			if v1 ~= nil and (v1 ~= "id" and not LuauPolyfillModule.String.endsWith(v1, "__typename")) then
				table.insert(List, v1)
				continue
			end
			continue
		end
		for _, value1 in CollectSubFields1(p1.schema, p1.fragments, p1.variableValues, p1.returnType, CollectSubFieldsResult[v1]) do
			local Text: string = `{v1}.{value1[1]}`
			
			if Text ~= nil and (Text ~= "id" and not LuauPolyfillModule.String.endsWith(Text, "__typename")) then
				table.insert(List, Text)
			end
		end
	end
	return List
end