local moments = script:FindFirstAncestor("Moments")
local _ = require(moments.Components.Feed.FeedTypes)
local momentsMomentFixturesModule = require(moments.Parent.DataHydration.MomentsMomentFixtures)

return function(p0)
	-- upvalues: momentsMomentFixturesModule (ref)
	p0 = p0 or {}
	local pageSize = p0.pageSize or 5
	local total = p0.total
	local latencySeconds = p0.latencySeconds or 0
	local failAfterPages = p0.failAfterPages
	local var5 = p0.deferred == true
	local var6 = 0
	local t = {}
	
	local function buildPage(p1)
		-- upvalues: total (ref), pageSize (ref), momentsMomentFixturesModule (copy)
		local var11
		local minValue = math.min(pageSize, if total ~= nil then pageSize else math.max(total - (p1 - 1), 0))
		local var10 = p1 + minValue
		
		if total == nil then
			var11 = true
		else
			var11 = var10 <= total
			var11 = nil
		end
		return {
			items = momentsMomentFixturesModule.buildMomentFeedItems(p1, minValue),
			nextCursor = if var11 then var10 else nil
		}
	end
	
	return {
		fetchAsync = function(p2)
			-- upvalues: var6 (write), var5 (ref), t (ref), latencySeconds (ref), failAfterPages (ref), buildPage (ref)
			p2 = p2 or 1
			var6 += 1
			local var13 = var6
			
			if var5 then
				table.insert(t, coroutine.running())
				local yieldResult, yieldResult_1 = coroutine.yield()
				
				if not yieldResult then
					error(yieldResult_1 or "mock feed source fetch rejected")
				end
			elseif latencySeconds > 0 then
				task.wait(latencySeconds)
			end
			if failAfterPages ~= nil and failAfterPages < var13 then
				error(`mock feed source failed on page {var13}`)
			end
			return buildPage(p2)
		end,
		id = p0.id or "mock",
		recommendationSource = p0.recommendationSource or "Trending",
		dispose = function() end,
		getPendingCount = function()
			-- upvalues: t (ref)
			return #t
		end,
		resolveNext = function()
			-- upvalues: t (ref)
			local removed = table.remove(t, 1)
			
			if removed ~= nil then
				local var17, var18 = coroutine.resume(removed, true)
				
				if not var17 then
					error(var18)
				end
			end
		end,
		rejectNext = function(p3)
			-- upvalues: t (ref)
			local removed = table.remove(t, 1)
			
			if removed ~= nil then
				local var20, var21 = coroutine.resume(removed, false, p3)
				
				if not var20 then
					error(var21)
				end
			end
		end
	}
end