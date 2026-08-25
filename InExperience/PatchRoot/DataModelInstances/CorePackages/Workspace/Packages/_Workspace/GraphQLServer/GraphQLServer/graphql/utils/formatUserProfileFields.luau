local graphQLServer = script:FindFirstAncestor("GraphQLServer")
local parent = graphQLServer.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local collectSubFields = require(parent.GraphqlToolsUtils).collectSubFields
local userProfileNestedFieldsModule = require(graphQLServer.graphql.enums.UserProfileNestedFields)

return function(p0, p1)
	-- upvalues: collectSubFields (ref), luauPolyfillModule (ref), userProfileNestedFieldsModule (ref)
	local var3 = p1 or collectSubFields
	local var4 = var3(p0.schema, p0.fragments, p0.variableValues, p0.returnType, p0.fieldNodes)
	local t = {}
	
	local _ = function(p2)
		-- upvalues: luauPolyfillModule (copy)
		return if p2 ~= nil then if p2 ~= "id" then luauPolyfillModule.String.endsWith(p2, "__typename") else true else true
	end
	
	for i, v in var4 do
		local var6 = v[1]
		
		if not userProfileNestedFieldsModule[var6] then
			if not (if var6 ~= nil then if var6 ~= "id" then luauPolyfillModule.String.endsWith(var6, "__typename") else true else true) then
				table.insert(t, var6)
			end
		end
		for i_1, v_1 in var3(p0.schema, p0.fragments, p0.variableValues, p0.returnType, var4[var6]) do
			local var7 = `{var6}.{v_1[1]}`
			
			if not (if var7 ~= nil then if var7 ~= "id" then luauPolyfillModule.String.endsWith(var7, "__typename") else true else true) then
				table.insert(t, var7)
			end
		end
	end
	return t
end