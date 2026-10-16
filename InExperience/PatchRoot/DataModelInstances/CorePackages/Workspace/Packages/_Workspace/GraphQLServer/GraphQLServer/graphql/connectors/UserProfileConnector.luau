local HttpService = game:GetService("HttpService")
local GraphQLServer = script:FindFirstAncestor("GraphQLServer")
local Parent = GraphQLServer.Parent
local FFlagUserProfileBetterErrorsModule = require(GraphQLServer.Flags.FFlagUserProfileBetterErrors)
local FFlagUserProfilePlatformProfile = require(Parent.SharedFlags).FFlagUserProfilePlatformProfile
local FIntUserProfileStoreBatchSize = require(Parent.SharedFlags).FIntUserProfileStoreBatchSize
local PlatformProfileRequestModule = require(GraphQLServer.PlatformProfileRequest)
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

local function fetchProfilesByIds(Entry, Fields, p1) --[[ Line: 36 ]]
	-- upvalues: Fetch (copy), PromiseModule (copy), FFlagUserProfilePlatformProfile (copy), FIntUserProfileStoreBatchSize (copy), fetchProfilesByIds (copy), PlatformProfileRequestModule (copy), v1 (copy), HttpService (copy), FFlagUserProfileBetterErrorsModule (copy), Response (copy), GraphQLError (copy)
	local Fetch1 = if p1 then p1 else Fetch
	
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ()) --[[ Line: 42 ]]
		-- upvalues: FFlagUserProfilePlatformProfile (upval), Entry (copy), FIntUserProfileStoreBatchSize (upval), fetchProfilesByIds (upval), Fields (copy), Fetch1 (copy), PlatformProfileRequestModule (upval), v1 (upval), HttpService (upval), FFlagUserProfileBetterErrorsModule (upval), Response (upval), GraphQLError (upval)
		if FFlagUserProfilePlatformProfile and FIntUserProfileStoreBatchSize < #Entry then
			local List = {}
			
			for i = 1, #Entry, FIntUserProfileStoreBatchSize do
				local List1 = {}
				
				for i1 = i, math.min(i + FIntUserProfileStoreBatchSize - 1, #Entry) do
					table.insert(List1, Entry[i1])
				end
				for _, value in fetchProfilesByIds(List1, Fields, Fetch1):expect() do
					table.insert(List, value)
				end
			end
			Callback(List)
			
			return
		else
			local v2 = Fetch1(v1, {
				method = "POST",
				body = HttpService:JSONEncode({
					UserIds = Entry,
					Fields = Fields,
					includePlatformProfile = if FFlagUserProfilePlatformProfile and PlatformProfileRequestModule.hasPlatformFields(Fields) then true else nil
				}),
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json"
				}
			}):catch(function(Err) --[[ Line: 74 ]]
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
				local v3 = v2:json():catch(function() --[[ Line: 105 ]]
					return nil
				end):expect()
				
				if not v2 then
					Callback1(GraphQLError.new(`Failed to decode HTTP response as JSON for user matching id: {Entry[1]}`))
					
					return
				end
				local ProfileDetails = v3.profileDetails
				
				if FFlagUserProfilePlatformProfile then
					ProfileDetails = PlatformProfileRequestModule.normalizeProfiles(ProfileDetails, Fields)
				end
				Callback(ProfileDetails)
				
				return
			elseif FFlagUserProfileBetterErrorsModule then
				Callback1(GraphQLError.new(v2.statusText, nil, nil, nil, nil, {
					extensions = { status = v2.status, statusText = v2.statusText }
				}))
				
				return
			else
				Callback1(GraphQLError.new(`Failed to fetch user profiles. Error code: {v2.status}`))
			end
		end
	end)
end

return { fetchProfilesByIds = fetchProfilesByIds }