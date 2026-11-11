local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("GraphQLServer").Parent
local _ = require(Parent.LuauPolyfill)
local UrlBuilderModule = require(Parent.UrlBuilder)
local PromiseModule = require(Parent.Promise)
local FetchModule = require(Parent.Fetch)
local GraphQLError = require(Parent.GraphQL).GraphQLError
local Fetch = FetchModule.fetch
local Response = FetchModule.Response
local _ = require(script.Parent.Parent.generatedTypes)
local v1 = UrlBuilderModule.UrlBuilder.new({
	path = "sharelinks/v1/get-or-create-link",
	base = UrlBuilderModule.UrlBase.APIS
})()

return {
	fetchShareLink = function(p1, p2)
		-- upvalues: Fetch (copy), HttpService (copy), PromiseModule (copy), v1 (copy), Response (copy), GraphQLError (copy)
		local Fetch1 = if p2 then p2 else Fetch
		local Json = HttpService:JSONEncode({
			linkType = p1.linkType,
			data = HttpService:JSONEncode(p1.data)
		})
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
			-- upvalues: Fetch1 (copy), v1 (upval), Json (copy), Response (upval), GraphQLError (upval)
			local v2 = Fetch1(v1, {
				method = "POST",
				body = Json,
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				}
			}):catch(function(Err)
				-- upvalues: Response (upval)
				local v3 = Response.error()
				v3.statusText = Err.message
				
				return v3
			end):expect()
			
			if not v2.ok then
				print(v2.statusText .. " " .. v2.status)
				Callback(GraphQLError.new(v2.statusText, nil, nil, nil, nil, {
					extensions = { status = v2.status, statusText = v2.statusText }
				}))
				
				return
			end
			local v3 = v2:json():catch(function()
				return nil
			end):expect()
			
			if v2 then
				Callback1(v3)
				
				return
			else
				Callback(GraphQLError.new(`Failed to decode HTTP response as JSON for share link matching type: {type}`))
			end
		end)
	end
}