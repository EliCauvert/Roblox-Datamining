local Moments = script:FindFirstAncestor("Moments")
local _ = require(Moments.Components.Feed.FeedTypes)
local MomentsMomentFixturesModule = require(Moments.Parent.DataHydration.MomentsMomentFixtures)

return function(p1) --[[ Line: 58 | Named "createMockFeedSource" ]]
	-- upvalues: MomentsMomentFixturesModule (copy)
	local P0 = p1 or {}
	local PageSize = P0.pageSize or 5
	local Total = P0.total
	local LatencySeconds = P0.latencySeconds or 0
	local FailAfterPages = P0.failAfterPages
	local IsDeferred = P0.deferred == true
	local Count = 0
	local List = {}
	
	local function buildPage(p2: number) --[[ Line: 71 ]]
		-- upvalues: Total (copy), PageSize (copy), MomentsMomentFixturesModule (upval)
		local Smallest = math.min(PageSize, if Total == nil then PageSize else math.max(Total - (p2 - 1), 0))
		local NewSmallest = p2 + Smallest
		local NoTotal: boolean = Total == nil or NewSmallest <= Total
		
		return {
			items = MomentsMomentFixturesModule.buildMomentFeedItems(p2, Smallest),
			nextCursor = if NoTotal then NewSmallest else nil
		}
	end
	
	return {
		fetchAsync = function(p2) --[[ Line: 82 ]]
			-- upvalues: Count (ref), IsDeferred (copy), List (copy), LatencySeconds (copy), FailAfterPages (copy), buildPage (copy)
			local P2 = p2 or 1
			Count += 1
			local Count1: number = Count
			
			if IsDeferred then
				table.insert(List, coroutine.running())
				local YieldResult, YieldResult2 = coroutine.yield()
				
				if not YieldResult then
					error(YieldResult2 or "mock feed source fetch rejected")
				end
			else
				if LatencySeconds > 0 then
					task.wait(LatencySeconds)
				end
				if FailAfterPages ~= nil and FailAfterPages < Count1 then
					error(`mock feed source failed on page {Count1}`)
				end
			end
			return (buildPage(P2))
		end,
		id = P0.id or "mock",
		recommendationSource = P0.recommendationSource or "Trending",
		dispose = function() --[[ Line: 134 ]] end,
		getPendingCount = function(): number --[[ Line: 108 ]]
			-- upvalues: List (copy)
			return #List
		end,
		resolveNext = function() --[[ Line: 112 ]]
			-- upvalues: List (copy)
			local Removed = table.remove(List, 1)
			
			if Removed ~= nil then
				local Success, Result = coroutine.resume(Removed, true)
				
				if not Success then
					error(Result)
				end
			end
		end,
		rejectNext = function(p2) --[[ Line: 124 ]]
			-- upvalues: List (copy)
			local Removed = table.remove(List, 1)
			
			if Removed ~= nil then
				local Success, Result = coroutine.resume(Removed, false, p2)
				
				if not Success then
					error(Result)
				end
			end
		end
	}
end