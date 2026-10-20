local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpModule = require(Parent.Http)
local HttpClientModule = require(Parent.HttpClient)
local _ = require(Parent.MomentsTypes)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local ConstructApiUrlModule = require(DataHydration.Moments.Util.constructApiUrl)
local ConvertApiCommentToCommentModule = require(DataHydration.Moments.Util.convertApiCommentToComment)
local FFlagEnableMomentsCommentReporting = require(Parent.SharedFlags).FFlagEnableMomentsCommentReporting

local function _(p1): string
	return `moment-comments-api/v1/moments/{p1}/comments`
end

local function decodeCommentsPage(p1)
	-- upvalues: ConvertApiCommentToCommentModule (copy), FFlagEnableMomentsCommentReporting (copy)
	local Comments = {}
	
	if type(p1) == "table" and type(p1.comments) == "table" then
		for _, comment in p1.comments do
			local ConvertApiCommentToCommentModuleResult = ConvertApiCommentToCommentModule(comment)
			
			if ConvertApiCommentToCommentModuleResult ~= nil then
				table.insert(Comments, ConvertApiCommentToCommentModuleResult)
			end
		end
	end
	return {
		comments = Comments,
		channelId = if FFlagEnableMomentsCommentReporting and type(p1) == "table" and type(p1.channelId) == "string" and p1.channelId ~= "" then p1.channelId else nil,
		nextCursor = if type(p1) == "table" and type(p1.nextCursor) == "string" then p1.nextCursor else nil,
		hasMore = type(p1) == "table" and p1.hasMore == true
	}
end

return function(p2, Network)
	-- upvalues: ConstructApiUrlModule (copy), HttpModule (copy), HttpClientModule (copy), decodeCommentsPage (copy)
	local ConstructApiUrlModuleResult, ConstructApiUrlModuleResult2 = ConstructApiUrlModule(`moment-comments-api/v1/moments/{p2.feedItemId}/comments`)
	local QueryString = HttpModule.Url:makeQueryString({ cursor = p2.cursor, limit = p2.limit, sort = p2.sort })
	
	return HttpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-comments",
		url = if QueryString == "" then ConstructApiUrlModuleResult else `{ConstructApiUrlModuleResult}?{QueryString}`,
		headers = ConstructApiUrlModuleResult2,
		network = Network,
		decode = decodeCommentsPage
	})
end