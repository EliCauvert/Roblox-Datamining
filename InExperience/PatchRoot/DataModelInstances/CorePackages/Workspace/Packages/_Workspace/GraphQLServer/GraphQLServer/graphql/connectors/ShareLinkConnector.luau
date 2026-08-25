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
local var4 = urlBuilder.new({
	path = "sharelinks/v1/get-or-create-link",
	base = urlBase.APIS
})()

return {
	fetchShareLink = function(p0, p1)
		-- upvalues: fetch (ref), httpService (ref), promiseModule (ref), var4 (ref), response (ref), graphQLError (ref)
		local var5 = p1 or fetch
		local var6 = httpService:JSONEncode({
			linkType = p0.linkType,
			data = httpService:JSONEncode(p0.data)
		})
		
		return promiseModule.new(function(p2, p3)
			-- upvalues: var5 (ref), var4 (copy), var6 (ref), response (copy), graphQLError (copy)
			local var7 = var5(var4, {
				method = "POST",
				body = var6,
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				}
			}):catch(function(p4)
				-- upvalues: response (copy)
				local var9 = response.error()
				var9.statusText = p4.message
				
				return var9
			end):expect()
			
			if not var7.ok then
				print(var7.statusText .. " " .. var7.status)
				p3(graphQLError.new(var7.statusText, nil, nil, nil, nil, {
					extensions = { status = var7.status, statusText = var7.statusText }
				}))
				
				return
			end
			local var8 = var7:json():catch(function()
				return nil
			end):expect()
			
			if var7 then
				p2(var8)
				
				return
			end
			p3(graphQLError.new(`Failed to decode HTTP response as JSON for share link matching type: {type}`))
		end)
	end
}