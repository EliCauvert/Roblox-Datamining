local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local _ = require(parent.MomentsTypes)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local commentFixturesModule = require(script.Parent.CommentFixtures)
local mockCommentsPagesModule = require(script.Parent.MockCommentsPages)

local function parseQuery(p1)
	local t = {}
	local matchIndex = string.find(p1, "?", 1, true)
	
	if matchIndex == nil then
		return t
	end
	for i in string.gmatch(string.sub(p1, matchIndex + 1), "[^&]+") do
		local match, match_1 = string.match(i, "([^=]+)=?(.*)")
		
		if match ~= nil then
			t[match] = match_1 or ""
		end
	end
	return t
end

local function _(p2)
	return string.match(p2, "/moments/([^/]+)/comments") or "feed-1"
end

local _ = function(p2)
	return string.match(p2, "/comments/([^/?]+)")
end

local function decodeBody(p2)
	-- upvalues: httpService (ref)
	if type(p2) ~= "string" or p2 == "" then
		return {}
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, p2)
	
	return if ok then status else {}
end

local _ = function(p2, p3)
	-- upvalues: httpService (ref)
	return {
		statusCode = p2,
		responseBody = if p3 == nil then nil else httpService:JSONEncode(p3)
	}
end

local _ = function(p2)
	return {
		commentId = p2.commentId,
		feedItemId = p2.feedItemId,
		authorUserId = if p2.author ~= nil then nil else p2.author.userId,
		text = p2.text,
		createdAt = p2.createdAt,
		isAuthoredByViewer = p2.isAuthoredByViewer
	}
end

return function(p2)
	-- upvalues: httpClientModule (ref), parseQuery (ref), mockCommentsPagesModule (ref), httpService (ref), decodeBody (ref), commentFixturesModule (ref)
	p2 = p2 or {}
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	local function pageWithMutations(p3, p4, p5)
		-- upvalues: t_1 (ref), t_2 (ref)
		local t = {}
		
		if p4 == nil or p4 == "" then
			local var1 = t_1[p3]
			
			if var1 ~= nil then
				for i, v in var1 do
					if not t_2[v.commentId] then
						table.insert(t, v)
					end
				end
			end
		end
		for i, v in p5.comments do
			if not t_2[v.commentId] then
				table.insert(t, v)
			end
		end
		local t_3 = {}
		
		for i_1, v_1 in t do
			table.insert(t_3, {
				commentId = v_1.commentId,
				feedItemId = v_1.feedItemId,
				authorUserId = if v_1.author ~= nil then nil else v_1.author.userId,
				text = v_1.text,
				createdAt = v_1.createdAt,
				isAuthoredByViewer = v_1.isAuthoredByViewer
			})
		end
		return {
			comments = t_3,
			nextCursor = p5.nextCursor,
			hasMore = p5.hasMore
		}
	end
	
	local function _()
		-- upvalues: p2 (ref)
		if type(p2.latencySeconds) == "number" and p2.latencySeconds > 0 then
			task.wait(p2.latencySeconds)
		end
	end
	
	return httpClientModule.createMockNetwork({
		routes = {
			{
				pattern = "/comments",
				respond = function(p6)
					-- upvalues: p2 (ref), parseQuery (copy), mockCommentsPagesModule (copy), pageWithMutations (ref), httpService (copy), decodeBody (copy), commentFixturesModule (copy), t (ref), t_1 (ref), t_2 (ref)
					if type(p2.latencySeconds) == "number" and p2.latencySeconds > 0 then
						task.wait(p2.latencySeconds)
					end
					local method = p6.method
					
					if method == "GET" then
						local url = string.match(p6.url, "/moments/([^/]+)/comments") or "feed-1"
						local var2 = parseQuery(p6.url)
						local var3 = pageWithMutations(url, var2.cursor, mockCommentsPagesModule.pageForCursor(url, var2.cursor))
						
						return {
							statusCode = 200,
							responseBody = if var3 == nil then nil else httpService:JSONEncode(var3)
						}
					elseif method == "POST" then
						local var4 = decodeBody(p6.body)
						local clientRequestId = var4.clientRequestId
						local url = string.match(p6.url, "/moments/([^/]+)/comments") or "feed-1"
						local var5 = if type(clientRequestId) == "string" then `{url}:{clientRequestId}` else nil
						local postOutcome = p2.postOutcome or "success"
						
						if postOutcome == "timeout" then
							error("createCommentsMockNetwork: simulated timeout")
						end
						if postOutcome == "TextFilterRejected" then
							local textFilterRejected = commentFixturesModule.ERRORS.TextFilterRejected
							
							return {
								statusCode = 422,
								responseBody = if textFilterRejected == nil then nil else httpService:JSONEncode(textFilterRejected)
							}
						elseif postOutcome == "RateLimited" then
							local rateLimited = commentFixturesModule.ERRORS.RateLimited
							
							return {
								statusCode = 429,
								responseBody = if rateLimited == nil then nil else httpService:JSONEncode(rateLimited)
							}
						elseif var5 ~= nil and t[var5] ~= nil then
							local var6 = t[var5]
							local t_3 = {
								commentId = var6.commentId,
								feedItemId = var6.feedItemId,
								authorUserId = if var6.author ~= nil then nil else var6.author.userId,
								text = var6.text,
								createdAt = var6.createdAt,
								isAuthoredByViewer = var6.isAuthoredByViewer
							}
							
							return {
								statusCode = 200,
								responseBody = if t_3 == nil then nil else httpService:JSONEncode(t_3)
							}
						end
						local var7 = commentFixturesModule.makeComment({
							createdAt = "2026-08-12T12:04:00Z",
							isAuthoredByViewer = true,
							commentId = `posted-{url}-{clientRequestId or httpService:GenerateGUID(false)}`,
							feedItemId = url,
							text = if type(var4.text) == "string" then var4.text else "",
							author = commentFixturesModule.AUTHORS.alex
						})
						
						if var5 ~= nil then
							t[var5] = var7
						end
						local var8 = t_1[url] or {}
						table.insert(var8, 1, var7)
						t_1[url] = var8
						
						if postOutcome == "replay" then
							local t_3 = {
								commentId = var7.commentId,
								feedItemId = var7.feedItemId,
								authorUserId = if var7.author ~= nil then nil else var7.author.userId,
								text = var7.text,
								createdAt = var7.createdAt,
								isAuthoredByViewer = var7.isAuthoredByViewer
							}
							
							return {
								statusCode = 200,
								responseBody = if t_3 == nil then nil else httpService:JSONEncode(t_3)
							}
						end
						local t_3 = {
							commentId = var7.commentId,
							feedItemId = var7.feedItemId,
							authorUserId = if var7.author ~= nil then nil else var7.author.userId,
							text = var7.text,
							createdAt = var7.createdAt,
							isAuthoredByViewer = var7.isAuthoredByViewer
						}
						
						return {
							statusCode = 201,
							responseBody = if t_3 == nil then nil else httpService:JSONEncode(t_3)
						}
					elseif method ~= "DELETE" then
						local t_3 = {
							errorCode = "CommentsUnavailable",
							message = `unsupported method {method}`
						}
						
						return {
							statusCode = 405,
							responseBody = if t_3 == nil then nil else httpService:JSONEncode(t_3)
						}
					end
					local match = string.match(p6.url, "/comments/([^/?]+)")
					
					if match ~= nil then
						t_2[match] = true
					end
					return { statusCode = 204, responseBody = nil }
				end
			}
		}
	})
end