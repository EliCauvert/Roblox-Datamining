local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local _ = require(parent.MomentsTypes)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local isCanonicalNonzeroUuidModule = require(dataHydration.Moments.Util.isCanonicalNonzeroUuid)
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
	return string.match(p2, "/comments/([^/?]+)$")
end

local _ = function(p2)
	return string.match(p2, "/moments/([^/]+)/comments/([^/]+)/reactions$")
end

local _ = function(p2, p3)
	return `{p2}:{p3}`
end

local function decodeBody(p2)
	-- upvalues: httpService (ref)
	if type(p2) ~= "string" or p2 == "" then
		return {}
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, p2)
	
	return if ok then status else {}
end

local _ = function(p2, p3, p4)
	-- upvalues: httpService (ref)
	return {
		statusCode = p2,
		headers = p4,
		responseBody = if p3 == nil then nil else httpService:JSONEncode(p3)
	}
end

local function toApiComment(p2)
	return {
		commentId = p2.commentId,
		feedItemId = p2.feedItemId,
		authorUserId = if p2.author ~= nil then nil else p2.author.userId,
		text = p2.text,
		createdAt = p2.createdAt,
		isAuthoredByViewer = p2.isAuthoredByViewer,
		reactions = p2.reactions
	}
end

local function cloneReactions(p2)
	local list = table.create(#p2.counts)
	
	for i, v in p2.counts do
		table.insert(list, table.clone(v))
	end
	return {
		counts = list,
		userReaction = if p2.userReaction ~= nil then nil else table.clone(p2.userReaction)
	}
end

local function scheduleDelay(p3, p4)
	local delayedThread = task.delay(p3, p4)
	
	return function()
		-- upvalues: delayedThread (ref)
		if coroutine.status(delayedThread) == "suspended" then
			task.cancel(delayedThread)
		end
	end
end

return function(p3)
	-- upvalues: commentFixturesModule (ref), mockCommentsPagesModule (ref), toApiComment (ref), cloneReactions (ref), httpClientModule (ref), decodeBody (ref), isCanonicalNonzeroUuidModule (ref), httpService (ref), parseQuery (ref), scheduleDelay (ref)
	p3 = p3 or {}
	local unixTimestamp = DateTime.now().UnixTimestamp
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	
	local function _(p4)
		-- upvalues: t_3 (ref)
		local feedItemId = t_3[p4.feedItemId]
		
		if feedItemId == nil then
			feedItemId = {}
			t_3[p4.feedItemId] = feedItemId
		end
		feedItemId[p4.commentId] = p4
	end
	
	local _ = function(p4, p5)
		-- upvalues: t_3 (ref), t_2 (ref)
		local var1 = t_3[p4]
		
		return if var1 == nil or t_2[`{p4}:{p5}`] then nil else var1[p5]
	end
	
	for i, v in {
		commentFixturesModule.REACTION_IDS.feedItemId,
		commentFixturesModule.REACTION_IDS.otherFeedItemId
	} do
		for i_1, v_1 in mockCommentsPagesModule.reactionPage(v, unixTimestamp).comments do
			local feedItemId = t_3[v_1.feedItemId]
			
			if feedItemId == nil then
				feedItemId = {}
				t_3[v_1.feedItemId] = feedItemId
			end
			feedItemId[v_1.commentId] = v_1
		end
	end
	local function pageWithMutations(p4, p5, p6)
		-- upvalues: t_1 (ref), t_2 (ref), t_3 (ref), toApiComment (copy), t_4 (ref), p3 (ref), cloneReactions (copy)
		local t = {}
		
		if p5 == nil or p5 == "" then
			local var1 = t_1[p4]
			
			if var1 ~= nil then
				for i, v in var1 do
					if not t_2[`{v.feedItemId}:{v.commentId}`] then
						table.insert(t, v)
					end
				end
			end
		end
		for i, v in p6.comments do
			if not t_2[`{v.feedItemId}:{v.commentId}`] then
				table.insert(t, v)
			end
		end
		local t_5 = {}
		
		for i_1, v_1 in t do
			local feedItemId = t_3[v_1.feedItemId]
			
			if feedItemId == nil then
				feedItemId = {}
				t_3[v_1.feedItemId] = feedItemId
			end
			feedItemId[v_1.commentId] = v_1
			local var2 = toApiComment(v_1)
			local feedItemId_1 = t_4[`{v_1.feedItemId}:{v_1.commentId}`]
			
			if not feedItemId_1 then
				feedItemId_1 = (p3.reactionProjectionsByCommentId or {})[v_1.commentId]
			end
			if feedItemId_1 ~= nil then
				var2.reactions = cloneReactions(feedItemId_1)
			end
			table.insert(t_5, var2)
		end
		return {
			comments = t_5,
			nextCursor = p6.nextCursor,
			hasMore = p6.hasMore
		}
	end
	
	local var3 = httpClientModule.createMockNetwork({
		routes = {
			{
				pattern = "/reactions",
				respond = function(p7)
					-- upvalues: decodeBody (copy), isCanonicalNonzeroUuidModule (copy), httpService (copy), t_3 (ref), t_2 (ref), p3 (ref), commentFixturesModule (copy), t_4 (ref), cloneReactions (copy)
					local match, match_1 = string.match(p7.url, "/moments/([^/]+)/comments/([^/]+)/reactions$")
					local var4 = decodeBody(p7.body)
					
					if match == nil or match_1 == nil or (not isCanonicalNonzeroUuidModule(match) or not isCanonicalNonzeroUuidModule(match_1)) or (var4.reactionType ~= "thumbsup" or not isCanonicalNonzeroUuidModule(var4.emoteId)) then
						local t = {
							errorCode = "InvalidRequest",
							message = "invalid reaction request"
						}
						
						return {
							statusCode = 400,
							headers = nil,
							responseBody = if t == nil then nil else httpService:JSONEncode(t)
						}
					end
					match_1 = t_3[match]
					match = if match_1 == nil or t_2[`{match}:{match_1}`] then nil else match_1[match_1]
					
					if match == nil then
						local t = {
							errorCode = "CommentNotFound",
							message = "comment was not found for the requested moment"
						}
						
						return {
							statusCode = 404,
							headers = nil,
							responseBody = if t == nil then nil else httpService:JSONEncode(t)
						}
					end
					match_1 = p3.reactionOutcome or "success"
					
					if match_1 == "timeout" then
						error("createCommentsMockNetwork: simulated reaction timeout")
					end
					if match_1 == "ViewerNotEligibleToReact" then
						local viewerNotEligibleToReact = commentFixturesModule.ERRORS.ViewerNotEligibleToReact
						
						return {
							statusCode = 403,
							headers = nil,
							responseBody = if viewerNotEligibleToReact == nil then nil else httpService:JSONEncode(viewerNotEligibleToReact)
						}
					elseif match_1 == "RateLimited" then
						local rateLimited = commentFixturesModule.ERRORS.RateLimited
						
						return {
							statusCode = 429,
							headers = { ["retry-after"] = p3.reactionRetryAfter or "10" },
							responseBody = if rateLimited == nil then nil else httpService:JSONEncode(rateLimited)
						}
					end
					local var5 = `{match}:{match_1}`
					local var6 = cloneReactions(t_4[var5] or ((p3.reactionProjectionsByCommentId or {})[match_1] or (match.reactions or { counts = {} })))
					var6 = if var6.userReaction ~= nil then nil else var6.userReaction.emoteId
					
					if p7.method == "PUT" then
						if var6 ~= nil and var6 ~= var4.emoteId then
							local t = {
								errorCode = "ReactionTypeConflict",
								message = "a different reaction is selected"
							}
							
							return {
								statusCode = 409,
								headers = nil,
								responseBody = if t == nil then nil else httpService:JSONEncode(t)
							}
						elseif var6 == nil then
							local var7 = false
							
							for i, v in var6.counts do
								if v.emoteId == var4.emoteId then
									v.count += 1
									var7 = true
								end
							end
							if not var7 then
								table.insert(var6.counts, { count = 1, emoteId = var4.emoteId })
							end
							var6.userReaction = { emoteId = var4.emoteId }
						end
					elseif p7.method ~= "DELETE" then
						local t = {
							errorCode = "CommentsUnavailable",
							message = `unsupported reaction method {p7.method}`
						}
						
						return {
							statusCode = 405,
							headers = nil,
							responseBody = if t == nil then nil else httpService:JSONEncode(t)
						}
					elseif var6 == var4.emoteId then
						for i, v in var6.counts do
							if v.emoteId == var4.emoteId then
								v.count = math.max(0, v.count - 1)
							end
						end
						var6.userReaction = nil
					end
					t_4[var5] = var6
					
					return { statusCode = 204, responseBody = nil }
				end
			},
			{
				pattern = "/comments",
				respond = function(p8)
					-- upvalues: parseQuery (copy), mockCommentsPagesModule (copy), unixTimestamp (ref), pageWithMutations (ref), httpService (copy), decodeBody (copy), p3 (ref), commentFixturesModule (copy), t (ref), toApiComment (copy), t_1 (ref), t_3 (ref), t_2 (ref)
					local method = p8.method
					
					if method == "GET" then
						local url = string.match(p8.url, "/moments/([^/]+)/comments") or "feed-1"
						local var8 = parseQuery(p8.url)
						local var9 = pageWithMutations(url, var8.cursor, mockCommentsPagesModule.pageForCursor(url, var8.cursor, unixTimestamp))
						
						return {
							statusCode = 200,
							headers = nil,
							responseBody = if var9 == nil then nil else httpService:JSONEncode(var9)
						}
					elseif method == "POST" then
						local var10 = decodeBody(p8.body)
						local clientRequestId = var10.clientRequestId
						local url = string.match(p8.url, "/moments/([^/]+)/comments") or "feed-1"
						local var11 = if type(clientRequestId) == "string" then `{url}:{clientRequestId}` else nil
						local postOutcome = p3.postOutcome or "success"
						
						if postOutcome == "timeout" then
							error("createCommentsMockNetwork: simulated timeout")
						end
						if postOutcome == "TextFilterRejected" then
							local textFilterRejected = commentFixturesModule.ERRORS.TextFilterRejected
							
							return {
								statusCode = 422,
								headers = nil,
								responseBody = if textFilterRejected == nil then nil else httpService:JSONEncode(textFilterRejected)
							}
						elseif postOutcome == "RateLimited" then
							local rateLimited = commentFixturesModule.ERRORS.RateLimited
							
							return {
								statusCode = 429,
								headers = nil,
								responseBody = if rateLimited == nil then nil else httpService:JSONEncode(rateLimited)
							}
						elseif var11 ~= nil and t[var11] ~= nil then
							local var12 = toApiComment(t[var11])
							
							return {
								statusCode = 200,
								headers = nil,
								responseBody = if var12 == nil then nil else httpService:JSONEncode(var12)
							}
						end
						local cloned = table.clone(commentFixturesModule.AUTHORS.roblox)
						cloned.userId = p3.postAuthorUserId or cloned.userId
						local var13 = commentFixturesModule.makeComment({
							isAuthoredByViewer = true,
							commentId = `posted-{url}-{clientRequestId or httpService:GenerateGUID(false)}`,
							feedItemId = url,
							text = if type(var10.text) == "string" then var10.text else "",
							createdAt = DateTime.now():ToIsoDate(),
							author = cloned
						})
						
						if var11 ~= nil then
							t[var11] = var13
						end
						local var14 = t_1[url] or {}
						table.insert(var14, 1, var13)
						t_1[url] = var14
						local feedItemId = t_3[var13.feedItemId]
						
						if feedItemId == nil then
							feedItemId = {}
							t_3[var13.feedItemId] = feedItemId
						end
						feedItemId[var13.commentId] = var13
						
						if postOutcome == "replay" then
							local var15 = toApiComment(var13)
							
							return {
								statusCode = 200,
								headers = nil,
								responseBody = if var15 == nil then nil else httpService:JSONEncode(var15)
							}
						end
						local var16 = toApiComment(var13)
						
						return {
							statusCode = 201,
							headers = nil,
							responseBody = if var16 == nil then nil else httpService:JSONEncode(var16)
						}
					elseif method ~= "DELETE" then
						local t_4 = {
							errorCode = "CommentsUnavailable",
							message = `unsupported method {method}`
						}
						
						return {
							statusCode = 405,
							headers = nil,
							responseBody = if t_4 == nil then nil else httpService:JSONEncode(t_4)
						}
					end
					local url = string.match(p8.url, "/moments/([^/]+)/comments") or "feed-1"
					local match = string.match(p8.url, "/comments/([^/?]+)$")
					
					if match == nil then
						local t_4 = {
							errorCode = "CommentsUnavailable",
							message = "invalid author-comment DELETE path"
						}
						
						return {
							statusCode = 405,
							headers = nil,
							responseBody = if t_4 == nil then nil else httpService:JSONEncode(t_4)
						}
					end
					t_2[`{url}:{match}`] = true
					local var17 = t_3[url]
					
					if var17 ~= nil then
						var17[match] = nil
					end
					return { statusCode = 204, responseBody = nil }
				end
			}
		}
	})
	
	local _ = function(p8)
		-- upvalues: p3 (ref)
		if string.find(p8.url, "/reactions", 1, true) then
			return p3.reactionLatencySeconds or p3.latencySeconds
		end
		local method = p8.method
		
		return if method == "GET" then p3.fetchLatencySeconds or p3.latencySeconds elseif method == "POST" then p3.postLatencySeconds or p3.latencySeconds else p3.latencySeconds
	end
	
	return {
		request = function(p8, p9)
			-- upvalues: p3 (ref), var3 (ref), scheduleDelay (copy)
			local reactionLatencySeconds
			if string.find(p8.url, "/reactions", 1, true) then
				reactionLatencySeconds = p3.reactionLatencySeconds or p3.latencySeconds
			else
				local method = p8.method
				reactionLatencySeconds = if method == "GET" then p3.fetchLatencySeconds or p3.latencySeconds elseif method == "POST" then p3.postLatencySeconds or p3.latencySeconds else p3.latencySeconds
			end
			if type(reactionLatencySeconds) == "number" and reactionLatencySeconds > 0 then
				local var8 = false
				local var9 = nil
				local var10 = (p3.schedule or scheduleDelay)(reactionLatencySeconds, function()
					-- upvalues: var8 (write), var9 (write), var3 (copy), p8 (ref), p9 (ref)
					if not var8 then
						var9 = var3.request(p8, p9)
					end
				end)
				
				return function()
					-- upvalues: var8 (write), var10 (ref), var9 (write)
					if var8 then return end
					var8 = true
					var10()
					
					if var9 ~= nil then
						var9()
					end
				end
			end
			return var3.request(p8, p9)
		end
	}
end