local PromiseModule = require(script:FindFirstAncestor("GameInvite").Parent.Promise)

return function(Options)
	-- upvalues: PromiseModule (copy)
	local NewMinIntervalSeconds = 0
	
	return {
		send = function(p1)
			-- upvalues: PromiseModule (upval), Options (copy), NewMinIntervalSeconds (ref)
			return PromiseModule.new(function(p2, p3)
				-- upvalues: Options (upval), NewMinIntervalSeconds (upval), PromiseModule (upval), p1 (copy)
				local NowResult: number = Options.now()
				local Largest = math.max(NowResult, NewMinIntervalSeconds)
				NewMinIntervalSeconds = Largest + Options.minIntervalSeconds
				
				local function dispatch()
					-- upvalues: PromiseModule (upval), p1 (upval), p2 (copy), p3 (copy)
					PromiseModule.try(p1):andThen(p2, p3)
				end
				
				local LargestDelta = Largest - NowResult
				
				if LargestDelta <= 0 then
					PromiseModule.try(p1):andThen(p2, p3)
					
					return
				else
					Options.delay(LargestDelta, dispatch)
				end
			end)
		end,
		options = Options
	}
end