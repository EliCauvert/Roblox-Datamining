local HttpService = game:GetService("HttpService")
local GraphQLServer = script:FindFirstAncestor("GraphQLServer")
local Parent = GraphQLServer.Parent
local FFlagUserProfileBetterErrorsModule = require(GraphQLServer.Flags.FFlagUserProfileBetterErrors)
local _ = require(Parent.LuauPolyfill)
local PromiseModule = require(Parent.Promise)
local FetchModule = require(Parent.Fetch)
local GraphQLError = require(Parent.GraphQL).GraphQLError
local Fetch = FetchModule.fetch
local Response = FetchModule.Response
local _ = require(script.Parent.Parent.generatedTypes)
local v1 = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "user-profile-api/v1/user/profiles/get-profiles",
	base = require(Parent.Http).Url.APIS_URL
})()

return {
	fetchProfilesByIds = function(Entry, Fields, p1)
		-- upvalues: Fetch (copy), PromiseModule (copy), v1 (copy), HttpService (copy), FFlagUserProfileBetterErrorsModule (copy), Response (copy), GraphQLError (copy)
		local Fetch1 = if p1 then p1 else Fetch
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
			-- upvalues: Fetch1 (copy), v1 (upval), HttpService (upval), Entry (copy), Fields (copy), FFlagUserProfileBetterErrorsModule (upval), Response (upval), GraphQLError (upval)
			local v2 = Fetch1(v1, {
				method = "POST",
				body = HttpService:JSONEncode({ UserIds = Entry, Fields = Fields }),
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				}
			}):catch(function(Err)
				-- upvalues: FFlagUserProfileBetterErrorsModule (upval), Response (upval)
				if FFlagUserProfileBetterErrorsModule then
					local v3 = Response.error()
					v3.statusText = Err.message
					
					return v3
				else
					return Response.error()
				end
			end):expect()
			
			if v2.ok then
				local v3 = v2:json():catch(function()
					return nil
				end):expect()
				
				if v2 then
					Callback1(v3.profileDetails)
					
					return
				else
					Callback(GraphQLError.new(`Failed to decode HTTP response as JSON for user matching id: {Entry[1]}`))
					
					return
				end
			elseif FFlagUserProfileBetterErrorsModule then
				Callback(GraphQLError.new(v2.statusText, nil, nil, nil, nil, {
					extensions = { status = v2.status, statusText = v2.statusText }
				}))
				
				return
			else
				Callback(GraphQLError.new(`Failed to fetch user profiles. Error code: {v2.status}`))
			end
		end)
	end
}