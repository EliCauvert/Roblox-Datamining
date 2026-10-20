local HttpService = game:GetService("HttpService")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local _ = require(Parent.MomentsTypes)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local IsCanonicalNonzeroUuidModule = require(DataHydration.Moments.Util.isCanonicalNonzeroUuid)
local CommentFixturesModule = require(script.Parent.CommentFixtures)
local MockCommentsPagesModule = require(script.Parent.MockCommentsPages)

local function parseQuery(Text: string)
	local t = {}
	local FoundAt: number? = string.find(Text, "?", 1, true)
	
	if FoundAt == nil then
		return t
	end
	for i in string.gmatch(string.sub(Text, FoundAt + 1), "[^&]+") do
		local Match, Match2 = string.match(i, "([^=]+)=?(.*)")
		
		if Match ~= nil then
			t[Match] = Match2 or ""
		end
	end
	return t
end

local function _(Text: string): string
	return string.match(Text, "/moments/([^/]+)/comments") or "feed-1"
end

local _ = function(Text: string): string
	return string.match(Text, "/comments/([^/?]+)$")
end

local _ = function(Text: string): string
	return string.match(Text, "/moments/([^/]+)/comments/([^/]+)/reactions$")
end

local _ = function(p1, p2): string
	return `{p1}:{p2}`
end

local function decodeBody(Body)
	-- upvalues: HttpService (copy)
	if type(Body) == "string" and Body ~= "" then
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, Body)
		
		return if Success then Result else {}
	else
		return {}
	end
end

local _ = function(StatusCode, Input, Headers)
	-- upvalues: HttpService (copy)
	return {
		statusCode = StatusCode,
		headers = Headers,
		responseBody = if Input == nil then nil else HttpService:JSONEncode(Input)
	}
end

local function toApiComment(Comment)
	return {
		commentId = Comment.commentId,
		feedItemId = Comment.feedItemId,
		authorUserId = if Comment.author == nil then nil else Comment.author.userId,
		text = Comment.text,
		createdAt = Comment.createdAt,
		isAuthoredByViewer = Comment.isAuthoredByViewer,
		reactions = Comment.reactions
	}
end

local function cloneReactions(p1)
	local Buffer = table.create(#p1.counts)
	
	for _, count in p1.counts do
		table.insert(Buffer, table.clone(count))
	end
	return {
		counts = Buffer,
		userReaction = if p1.userReaction == nil then nil else table.clone(p1.userReaction)
	}
end

local function scheduleDelay(Delay, p2)
	local DelayedThread = task.delay(Delay, p2)
	
	return function()
		-- upvalues: DelayedThread (copy)
		if coroutine.status(DelayedThread) == "suspended" then
			task.cancel(DelayedThread)
		end
	end
end

return function(p2)
	-- upvalues: CommentFixturesModule (copy), MockCommentsPagesModule (copy), toApiComment (copy), cloneReactions (copy), HttpClientModule (copy), decodeBody (copy), IsCanonicalNonzeroUuidModule (copy), HttpService (copy), parseQuery (copy), scheduleDelay (copy)
	local P9 = p2 or {}
	local UnixTimestamp = DateTime.now().UnixTimestamp
	local Comments = {}
	local t = {}
	local t1 = {}
	local t2 = {}
	local t3 = {}
	
	local function _(ApiComment)
		-- upvalues: t2 (copy)
		local Entry = t2[ApiComment.feedItemId]
		
		if Entry == nil then
			Entry = {}
			t2[ApiComment.feedItemId] = Entry
		end
		Entry[ApiComment.commentId] = ApiComment
	end
	
	local _ = function(p3, p4)
		-- upvalues: t2 (copy), t1 (copy)
		local Entry = t2[p3]
		
		return if Entry == nil or t1[`{p3}:{p4}`] then nil else Entry[p4]
	end
	
	for _, value in {
		CommentFixturesModule.REACTION_IDS.feedItemId,
		CommentFixturesModule.REACTION_IDS.otherFeedItemId
	} do
		for _, comment in MockCommentsPagesModule.reactionPage(value, UnixTimestamp).comments do
			local Entry = t2[comment.feedItemId]
			
			if Entry == nil then
				Entry = {}
				t2[comment.feedItemId] = Entry
			end
			Entry[comment.commentId] = comment
		end
	end
	local function pageWithMutations(Match, Cursor, PageForCursorResult)
		-- upvalues: t (copy), t1 (copy), t2 (copy), toApiComment (upval), t3 (copy), P9 (copy), cloneReactions (upval)
		local List = {}
		
		if Cursor == nil or Cursor == "" then
			local Entry = t[Match]
			
			if Entry ~= nil then
				for _, ApiComment in Entry do
					if not t1[`{ApiComment.feedItemId}:{ApiComment.commentId}`] then
						table.insert(List, ApiComment)
					end
				end
			end
		end
		for _, comment in PageForCursorResult.comments do
			if not t1[`{comment.feedItemId}:{comment.commentId}`] then
				table.insert(List, comment)
			end
		end
		local Comments = {}
		
		for _, ApiComment1 in List do
			local Entry = t2[ApiComment1.feedItemId]
			
			if Entry == nil then
				Entry = {}
				t2[ApiComment1.feedItemId] = Entry
			end
			Entry[ApiComment1.commentId] = ApiComment1
			local ApiComment2 = toApiComment(ApiComment1)
			local Entry1 = t3[`{ApiComment1.feedItemId}:{ApiComment1.commentId}`] or (P9.reactionProjectionsByCommentId or {})[ApiComment1.commentId]
			
			if Entry1 ~= nil then
				ApiComment2.reactions = cloneReactions(Entry1)
			end
			table.insert(Comments, ApiComment2)
		end
		return {
			comments = Comments,
			nextCursor = PageForCursorResult.nextCursor,
			hasMore = PageForCursorResult.hasMore
		}
	end
	
	local MockNetwork = HttpClientModule.createMockNetwork({
		routes = {
			{
				pattern = "/reactions",
				respond = function(p3)
					-- upvalues: decodeBody (upval), IsCanonicalNonzeroUuidModule (upval), HttpService (upval), t2 (copy), t1 (copy), P9 (copy), CommentFixturesModule (upval), t3 (copy), cloneReactions (upval)
					local Match, Match2 = string.match(p3.url, "/moments/([^/]+)/comments/([^/]+)/reactions$")
					local DecodeBodyResult = decodeBody(p3.body)
					
					if Match == nil or Match2 == nil or not IsCanonicalNonzeroUuidModule(Match) or not IsCanonicalNonzeroUuidModule(Match2) or DecodeBodyResult.reactionType ~= "thumbsup" or not IsCanonicalNonzeroUuidModule(DecodeBodyResult.emoteId) then
						local config = {
							errorCode = "InvalidRequest",
							message = "invalid reaction request"
						}
						
						return {
							statusCode = 400,
							headers = nil,
							responseBody = if config == nil then nil else HttpService:JSONEncode(config)
						}
					end
					local Entry = t2[Match]
					local Entry1 = if Entry == nil or t1[`{Match}:{Match2}`] then nil else Entry[Match2]
					
					if Entry1 == nil then
						local config = {
							errorCode = "CommentNotFound",
							message = "comment was not found for the requested moment"
						}
						
						return {
							statusCode = 404,
							headers = nil,
							responseBody = if config == nil then nil else HttpService:JSONEncode(config)
						}
					end
					local ReactionOutcome = P9.reactionOutcome or "success"
					
					if ReactionOutcome == "timeout" then
						error("createCommentsMockNetwork: simulated reaction timeout")
					end
					if ReactionOutcome == "ViewerNotEligibleToReact" then
						local ViewerNotEligibleToReact = CommentFixturesModule.ERRORS.ViewerNotEligibleToReact
						
						return {
							statusCode = 403,
							headers = nil,
							responseBody = if ViewerNotEligibleToReact == nil then nil else HttpService:JSONEncode(ViewerNotEligibleToReact)
						}
					end
					if ReactionOutcome == "RateLimited" then
						local RateLimited = CommentFixturesModule.ERRORS.RateLimited
						
						return {
							statusCode = 429,
							headers = { ["retry-after"] = P9.reactionRetryAfter or "10" },
							responseBody = if RateLimited == nil then nil else HttpService:JSONEncode(RateLimited)
						}
					end
					local Text: string = `{Match}:{Match2}`
					local CloneReactionsResult = cloneReactions(t3[Text] or ((P9.reactionProjectionsByCommentId or {})[Match2] or (Entry1.reactions or { counts = {} })))
					local EmoteId = if CloneReactionsResult.userReaction == nil then nil else CloneReactionsResult.userReaction.emoteId
					
					if p3.method == "PUT" then
						if EmoteId ~= nil and EmoteId ~= DecodeBodyResult.emoteId then
							local config = {
								errorCode = "ReactionTypeConflict",
								message = "a different reaction is selected"
							}
							
							return {
								statusCode = 409,
								headers = nil,
								responseBody = if config == nil then nil else HttpService:JSONEncode(config)
							}
						end
						if EmoteId == nil then
							local Flag = false
							
							for _, count1 in CloneReactionsResult.counts do
								if count1.emoteId == DecodeBodyResult.emoteId then
									count1.count += 1
									Flag = true
								end
							end
							if not Flag then
								table.insert(CloneReactionsResult.counts, { count = 1, emoteId = DecodeBodyResult.emoteId })
							end
							CloneReactionsResult.userReaction = { emoteId = DecodeBodyResult.emoteId }
						end
					else
						if p3.method ~= "DELETE" then
							local config = {
								errorCode = "CommentsUnavailable",
								message = `unsupported reaction method {p3.method}`
							}
							
							return {
								statusCode = 405,
								headers = nil,
								responseBody = if config == nil then nil else HttpService:JSONEncode(config)
							}
						end
						if EmoteId == DecodeBodyResult.emoteId then
							for _, count in CloneReactionsResult.counts do
								if count.emoteId == DecodeBodyResult.emoteId then
									count.count = math.max(0, count.count - 1)
								end
							end
							CloneReactionsResult.userReaction = nil
						end
					end
					t3[Text] = CloneReactionsResult
					
					return { statusCode = 204, responseBody = nil }
				end
			},
			{
				pattern = "/comments",
				respond = function(p4)
					-- upvalues: parseQuery (upval), MockCommentsPagesModule (upval), UnixTimestamp (copy), pageWithMutations (copy), HttpService (upval), decodeBody (upval), P9 (copy), CommentFixturesModule (upval), Comments (copy), toApiComment (upval), t (copy), t2 (copy), t1 (copy)
					local Method = p4.method
					
					if Method == "GET" then
						local Match: string = string.match(p4.url, "/moments/([^/]+)/comments") or "feed-1"
						local ParseQueryResult = parseQuery(p4.url)
						local PageWithMutationsResult = pageWithMutations(Match, ParseQueryResult.cursor, (MockCommentsPagesModule.pageForCursor(Match, ParseQueryResult.cursor, UnixTimestamp)))
						
						return {
							statusCode = 200,
							headers = nil,
							responseBody = if PageWithMutationsResult == nil then nil else HttpService:JSONEncode(PageWithMutationsResult)
						}
					end
					if Method == "POST" then
						local DecodeBodyResult = decodeBody(p4.body)
						local ClientRequestId = DecodeBodyResult.clientRequestId
						local Match: string = string.match(p4.url, "/moments/([^/]+)/comments") or "feed-1"
						local Text = if type(ClientRequestId) == "string" then `{Match}:{ClientRequestId}` else nil
						local PostOutcome = P9.postOutcome or "success"
						
						if PostOutcome == "timeout" then
							error("createCommentsMockNetwork: simulated timeout")
						end
						if PostOutcome == "TextFilterRejected" then
							local TextFilterRejected = CommentFixturesModule.ERRORS.TextFilterRejected
							
							return {
								statusCode = 422,
								headers = nil,
								responseBody = if TextFilterRejected == nil then nil else HttpService:JSONEncode(TextFilterRejected)
							}
						end
						if PostOutcome == "RateLimited" then
							local RateLimited = CommentFixturesModule.ERRORS.RateLimited
							
							return {
								statusCode = 429,
								headers = nil,
								responseBody = if RateLimited == nil then nil else HttpService:JSONEncode(RateLimited)
							}
						end
						if Text ~= nil and Comments[Text] ~= nil then
							local ApiComment = toApiComment(Comments[Text])
							
							return {
								statusCode = 200,
								headers = nil,
								responseBody = if ApiComment == nil then nil else HttpService:JSONEncode(ApiComment)
							}
						end
						local Copy = table.clone(CommentFixturesModule.AUTHORS.roblox)
						Copy.userId = P9.postAuthorUserId or Copy.userId
						local Comment = CommentFixturesModule.makeComment({
							isAuthoredByViewer = true,
							commentId = `posted-{Match}-{ClientRequestId or HttpService:GenerateGUID(false)}`,
							feedItemId = Match,
							text = if type(DecodeBodyResult.text) == "string" then DecodeBodyResult.text else "",
							createdAt = DateTime.now():ToIsoDate(),
							author = Copy
						})
						
						if Text ~= nil then
							Comments[Text] = Comment
						end
						local Entry1 = t[Match] or {}
						table.insert(Entry1, 1, Comment)
						t[Match] = Entry1
						local Entry2 = t2[Comment.feedItemId]
						
						if Entry2 == nil then
							Entry2 = {}
							t2[Comment.feedItemId] = Entry2
						end
						Entry2[Comment.commentId] = Comment
						
						if PostOutcome == "replay" then
							local ApiComment = toApiComment(Comment)
							
							return {
								statusCode = 200,
								headers = nil,
								responseBody = if ApiComment == nil then nil else HttpService:JSONEncode(ApiComment)
							}
						else
							local ApiComment = toApiComment(Comment)
							
							return {
								statusCode = 201,
								headers = nil,
								responseBody = if ApiComment == nil then nil else HttpService:JSONEncode(ApiComment)
							}
						end
					else
						if Method ~= "DELETE" then
							local config = {
								errorCode = "CommentsUnavailable",
								message = `unsupported method {Method}`
							}
							
							return {
								statusCode = 405,
								headers = nil,
								responseBody = if config == nil then nil else HttpService:JSONEncode(config)
							}
						end
						local Match1: string = string.match(p4.url, "/moments/([^/]+)/comments") or "feed-1"
						local Match2: string? = string.match(p4.url, "/comments/([^/?]+)$")
						
						if Match2 == nil then
							local config = {
								errorCode = "CommentsUnavailable",
								message = "invalid author-comment DELETE path"
							}
							
							return {
								statusCode = 405,
								headers = nil,
								responseBody = if config == nil then nil else HttpService:JSONEncode(config)
							}
						end
						t1[`{Match1}:{Match2}`] = true
						local Entry = t2[Match1]
						
						if Entry ~= nil then
							Entry[Match2] = nil
						end
						return { statusCode = 204, responseBody = nil }
					end
				end
			}
		}
	})
	
	local _ = function(p4)
		-- upvalues: P9 (copy)
		if string.find(p4.url, "/reactions", 1, true) then
			return P9.reactionLatencySeconds or P9.latencySeconds
		else
			local Method = p4.method
			
			return (if Method == "GET" then P9.fetchLatencySeconds else Method == "POST" and P9.postLatencySeconds) or P9.latencySeconds
		end
	end
	
	return {
		request = function(p4, p5)
			-- upvalues: P9 (copy), MockNetwork (copy), scheduleDelay (upval)
			local ReactionLatencySeconds = nil
			if string.find(p4.url, "/reactions", 1, true) then
				ReactionLatencySeconds = P9.reactionLatencySeconds or P9.latencySeconds
			else
				local Method = p4.method
				ReactionLatencySeconds = (if Method == "GET" then P9.fetchLatencySeconds else Method == "POST" and P9.postLatencySeconds) or P9.latencySeconds
			end
			if type(ReactionLatencySeconds) == "number" and ReactionLatencySeconds > 0 then
				local Flag = false
				local RequestResult = nil
				local Callback = (P9.schedule or scheduleDelay)(ReactionLatencySeconds, function()
					-- upvalues: Flag (ref), RequestResult (ref), MockNetwork (upval), p4 (copy), p5 (copy)
					if not Flag then
						RequestResult = MockNetwork.request(p4, p5)
					end
				end)
				
				return function()
					-- upvalues: Flag (ref), Callback (copy), RequestResult (ref)
					if Flag then return end
					Flag = true
					Callback()
					
					if RequestResult ~= nil then
						RequestResult()
					end
				end
			else
				return MockNetwork.request(p4, p5)
			end
		end
	}
end