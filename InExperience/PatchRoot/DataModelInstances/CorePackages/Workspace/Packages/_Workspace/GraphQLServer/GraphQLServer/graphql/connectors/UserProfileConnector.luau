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
local var1 = urlBuilder.new({
	path = "user-profile-api/v1/user/profiles/get-profiles",
	base = url.APIS_URL
})()

return {
	fetchProfilesByIds = function(p1, p2, p3)
		-- upvalues: fetch (ref), promiseModule (ref), var1 (ref), httpService (ref), fFlagUserProfileBetterErrorsModule (ref), response (ref), graphQLError (ref)
		local var2 = p3 or fetch
		
		return promiseModule.new(function(p4, p5)
			-- upvalues: var2 (ref), var1 (copy), httpService (copy), p1 (ref), p2 (ref), fFlagUserProfileBetterErrorsModule (copy), response (copy), graphQLError (copy)
			local var3 = var2(var1, {
				method = "POST",
				body = httpService:JSONEncode({ UserIds = p1, Fields = p2 }),
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				}
			}):catch(function(p6)
				-- upvalues: fFlagUserProfileBetterErrorsModule (copy), response (copy)
				if fFlagUserProfileBetterErrorsModule then
					local var4 = response.error()
					var4.statusText = p6.message
					
					return var4
				end
				return response.error()
			end):expect()
			
			if var3.ok then
				local var4 = var3:json():catch(function()
					return nil
				end):expect()
				
				if var3 then
					p4(var4.profileDetails)
					
					return
				end
				p5(graphQLError.new(`Failed to decode HTTP response as JSON for user matching id: {p1[1]}`))
				
				return
			elseif fFlagUserProfileBetterErrorsModule then
				p5(graphQLError.new(var3.statusText, nil, nil, nil, nil, {
					extensions = { status = var3.status, statusText = var3.statusText }
				}))
				
				return
			end
			p5(graphQLError.new(`Failed to fetch user profiles. Error code: {var3.status}`))
		end)
	end
}