local httpService = game:GetService("HttpService")
local graphQLServer = script:FindFirstAncestor("GraphQLServer")
local parent = graphQLServer.Parent
local fFlagUserProfileBetterErrorsModule = require(graphQLServer.Flags.FFlagUserProfileBetterErrors)
local _ = require(parent.LuauPolyfill)
local urlBuilderModule = require(parent.UrlBuilder)
local promiseModule = require(parent.Promise)
local fetchModule = require(parent.Fetch)
local url = require(parent.Http).Url
local urlBuilder = urlBuilderModule.UrlBuilder
local graphQLError = require(parent.GraphQL).GraphQLError
local fetch = fetchModule.fetch
local response = fetchModule.Response
local _ = require(script.Parent.Parent.generatedTypes)
local var6 = urlBuilder.new({
	path = "user-profile-api/v1/user/profiles/get-profiles",
	base = url.APIS_URL
})()

return {
	fetchProfilesByIds = function(p0, p1, p2) --[[ line: 33 ]]
		-- upvalues: fetch (ref), promiseModule (ref), var6 (ref), httpService (ref), fFlagUserProfileBetterErrorsModule (ref), response (ref), graphQLError (ref)
		local var7 = p2 or fetch
		
		return promiseModule.new(function(p3, p4) --[[ line: 39 ]]
			-- upvalues: var7 (ref), var6 (copy), httpService (copy), p0 (ref), p1 (ref), fFlagUserProfileBetterErrorsModule (copy), response (copy), graphQLError (copy)
			local var8 = var7(var6, {
				method = "POST",
				body = httpService:JSONEncode({ UserIds = p0, Fields = p1 }),
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				}
			}):catch(function(p5) --[[ line: 51 ]]
				-- upvalues: fFlagUserProfileBetterErrorsModule (copy), response (copy)
				if fFlagUserProfileBetterErrorsModule then
					local var10 = response.error()
					var10.statusText = p5.message
					
					return var10
				end
				return response.error()
			end):expect()
			
			if var8.ok then
				local var9 = var8:json():catch(function() --[[ line: 82 ]]
					return nil
				end):expect()
				
				if var8 then
					p3(var9.profileDetails)
					
					return
				end
				p4(graphQLError.new(`Failed to decode HTTP response as JSON for user matching id: {p0[1]}`))
				
				return
			elseif fFlagUserProfileBetterErrorsModule then
				p4(graphQLError.new(var8.statusText, nil, nil, nil, nil, {
					extensions = { status = var8.status, statusText = var8.statusText }
				}))
				
				return
			end
			p4(graphQLError.new(`Failed to fetch user profiles. Error code: {var8.status}`))
		end)
	end
}