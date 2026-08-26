local graphQLServer = script:FindFirstAncestor("GraphQLServer")
local parent = graphQLServer.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local collectSubFields = require(parent.GraphqlToolsUtils).collectSubFields
local userProfileNestedFieldsModule = require(graphQLServer.graphql.enums.UserProfileNestedFields)

return function(p1, p2)
	-- upvalues: collectSubFields (ref), luauPolyfillModule (ref), userProfileNestedFieldsModule (ref)
	local var1 = p2 or collectSubFields
	local var2 = var1(p1.schema, p1.fragments, p1.variableValues, p1.returnType, p1.fieldNodes)
	local t = {}
	
	local _ = function(p3)
		-- upvalues: luauPolyfillModule (copy)
		return if p3 ~= nil then if p3 ~= "id" then luauPolyfillModule.String.endsWith(p3, "__typename") else true else true
	end
	
	for i, v in var2 do
		local var3 = v[1]
		
		if not userProfileNestedFieldsModule[var3] then
			if not (if var3 ~= nil then if var3 ~= "id" then luauPolyfillModule.String.endsWith(var3, "__typename") else true else true) then
				table.insert(t, var3)
			end
		end
		for i_1, v_1 in var1(p1.schema, p1.fragments, p1.variableValues, p1.returnType, var2[var3]) do
			local var4 = `{var3}.{v_1[1]}`
			
			if not (if var4 ~= nil then if var4 ~= "id" then luauPolyfillModule.String.endsWith(var4, "__typename") else true else true) then
				table.insert(t, var4)
			end
		end
	end
	return t
end