local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)
local _ = require(parent.MomentsTypes)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local constructApiUrlModule = require(dataHydration.Moments.Util.constructApiUrl)
local convertApiCommentToCommentModule = require(dataHydration.Moments.Util.convertApiCommentToComment)

local function _(p1)
	return `moment-comments-api/v1/moments/{p1}/comments`
end

local function decodeCommentsPage(p1)
	-- upvalues: convertApiCommentToCommentModule (ref)
	local t = {}
	
	if type(p1) == "table" and type(p1.comments) == "table" then
		for i, v in p1.comments do
			local var1 = convertApiCommentToCommentModule(v)
			
			if var1 ~= nil then
				table.insert(t, var1)
			end
		end
	end
	return {
		comments = t,
		nextCursor = if type(p1) == "table" and type(p1.nextCursor) == "string" then p1.nextCursor else nil,
		hasMore = type(p1) == "table" and p1.hasMore == true
	}
end

return function(p2, p3)
	-- upvalues: constructApiUrlModule (ref), httpModule (ref), httpClientModule (ref), decodeCommentsPage (ref)
	local var2, var3 = constructApiUrlModule(`moment-comments-api/v1/moments/{p2.feedItemId}/comments`)
	local var4 = httpModule.Url:makeQueryString({ cursor = p2.cursor, limit = p2.limit, sort = p2.sort })
	
	return httpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-comments",
		url = if var4 ~= "" then var2 else `{var2}?{var4}`,
		headers = var3,
		network = p3,
		decode = decodeCommentsPage
	})
end