local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)
local commentFixturesModule = require(script.Parent.CommentFixtures)

local function page1(p1)
	-- upvalues: commentFixturesModule (ref)
	return {
		nextCursor = "page-empty",
		hasMore = true,
		comments = {
			commentFixturesModule.makeComment({
				commentId = "c-1",
				text = "Newest comment",
				createdAt = "2026-08-12T12:03:00Z",
				feedItemId = p1,
				author = commentFixturesModule.AUTHORS.alex
			}),
			commentFixturesModule.makeComment({
				commentId = "c-2",
				text = "Middle comment",
				createdAt = "2026-08-12T12:02:00Z",
				feedItemId = p1,
				author = commentFixturesModule.AUTHORS.bailey
			})
		}
	}
end

local function page3(p1)
	-- upvalues: commentFixturesModule (ref)
	return {
		nextCursor = nil,
		hasMore = false,
		comments = {
			commentFixturesModule.makeComment({
				commentId = "c-3",
				text = "Oldest visible comment",
				createdAt = "2026-08-12T12:01:00Z",
				feedItemId = p1,
				author = commentFixturesModule.AUTHORS.degraded
			}),
			commentFixturesModule.makeComment({
				commentId = "c-degraded",
				text = "nice clip",
				feedItemId = p1,
				author = commentFixturesModule.AUTHORS.degraded
			})
		}
	}
end

return {
	EMPTY_HAS_MORE_CURSOR = "page-empty",
	PAGE_3_CURSOR = "page-3",
	page1 = page1,
	emptyHasMorePage = function()
		return { nextCursor = "page-3", hasMore = true, comments = {} }
	end,
	page3 = page3,
	pageForCursor = function(p1, p2)
		-- upvalues: page1 (ref), page3 (ref)
		return if p2 == nil or p2 == "" then page1(p1) elseif p2 == "page-empty" then { nextCursor = "page-3", hasMore = true, comments = {} } elseif p2 == "page-3" then page3(p1) else { nextCursor = nil, hasMore = false, comments = {} }
	end
}