local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("GraphQLServer").Parent
local _ = require(parent.LuauPolyfill)
local urlBuilderModule = require(parent.UrlBuilder)
local promiseModule = require(parent.Promise)
local fetchModule = require(parent.Fetch)
local urlBuilder = urlBuilderModule.UrlBuilder
local urlBase = urlBuilderModule.UrlBase
local graphQLError = require(parent.GraphQL).GraphQLError
local fetch = fetchModule.fetch
local response = fetchModule.Response
local _ = require(script.Parent.Parent.generatedTypes)
local var1 = urlBuilder.new({
	path = "sharelinks/v1/get-or-create-link",
	base = urlBase.APIS
})()

return {
	fetchShareLink = function(p1, p2)
		-- upvalues: fetch (ref), httpService (ref), promiseModule (ref), var1 (ref), response (ref), graphQLError (ref)
		local var2 = p2 or fetch
		local var3 = httpService:JSONEncode({
			linkType = p1.linkType,
			data = httpService:JSONEncode(p1.data)
		})
		
		return promiseModule.new(function(p3, p4)
			-- upvalues: var2 (ref), var1 (copy), var3 (ref), response (copy), graphQLError (copy)
			local var4 = var2(var1, {
				method = "POST",
				body = var3,
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				}
			}):catch(function(p5)
				-- upvalues: response (copy)
				local var5 = response.error()
				var5.statusText = p5.message
				
				return var5
			end):expect()
			
			if not var4.ok then
				print(var4.statusText .. " " .. var7.status)
				p4(graphQLError.new(var4.statusText, nil, nil, nil, nil, {
					extensions = { status = var4.status, statusText = var4.statusText }
				}))
				
				return
			end
			local var5 = var4:json():catch(function()
				return nil
			end):expect()
			
			if var4 then
				p3(var5)
				
				return
			end
			p4(graphQLError.new(`Failed to decode HTTP response as JSON for share link matching type: {type}`))
		end)
	end
}