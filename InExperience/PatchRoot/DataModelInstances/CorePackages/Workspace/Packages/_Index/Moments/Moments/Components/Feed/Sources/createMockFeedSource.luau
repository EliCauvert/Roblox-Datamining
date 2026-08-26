local moments = script:FindFirstAncestor("Moments")
local _ = require(moments.Components.Feed.FeedTypes)
local momentsMomentFixturesModule = require(moments.Parent.DataHydration.MomentsMomentFixtures)

return function(p1)
	-- upvalues: momentsMomentFixturesModule (ref)
	p1 = p1 or {}
	local pageSize = p1.pageSize or 5
	local total = p1.total
	local latencySeconds = p1.latencySeconds or 0
	local failAfterPages = p1.failAfterPages
	local var1 = p1.deferred == true
	local var2 = 0
	local t = {}
	
	local function buildPage(p2)
		-- upvalues: total (ref), pageSize (ref), momentsMomentFixturesModule (copy)
		local var3
		local minValue = math.min(pageSize, if total ~= nil then pageSize else math.max(total - (p2 - 1), 0))
		local var4 = p2 + minValue
		
		if total == nil then
			var3 = true
		else
			var3 = var4 <= total
			var3 = nil
		end
		return {
			items = momentsMomentFixturesModule.buildMomentFeedItems(p2, minValue),
			nextCursor = if var3 then var4 else nil
		}
	end
	
	return {
		fetchAsync = function(p2)
			-- upvalues: var2 (write), var1 (ref), t (ref), latencySeconds (ref), failAfterPages (ref), buildPage (ref)
			p2 = p2 or 1
			var2 += 1
			local var3 = var2
			
			if var1 then
				table.insert(t, coroutine.running())
				local yieldResult, yieldResult_1 = coroutine.yield()
				
				if not yieldResult then
					error(yieldResult_1 or "mock feed source fetch rejected")
				end
			elseif latencySeconds > 0 then
				task.wait(latencySeconds)
			end
			if failAfterPages ~= nil and failAfterPages < var3 then
				error(`mock feed source failed on page {var3}`)
			end
			return buildPage(p2)
		end,
		id = p1.id or "mock",
		recommendationSource = p1.recommendationSource or "Trending",
		dispose = function() end,
		getPendingCount = function()
			-- upvalues: t (ref)
			return #t
		end,
		resolveNext = function()
			-- upvalues: t (ref)
			local removed = table.remove(t, 1)
			
			if removed ~= nil then
				local var3, var4 = coroutine.resume(removed, true)
				
				if not var3 then
					error(var4)
				end
			end
		end,
		rejectNext = function(p2)
			-- upvalues: t (ref)
			local removed = table.remove(t, 1)
			
			if removed ~= nil then
				local var3, var4 = coroutine.resume(removed, false, p2)
				
				if not var3 then
					error(var4)
				end
			end
		end
	}
end