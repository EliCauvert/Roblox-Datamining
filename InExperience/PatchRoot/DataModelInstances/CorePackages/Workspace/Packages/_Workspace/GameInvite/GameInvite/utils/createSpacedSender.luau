local PromiseModule = require(script:FindFirstAncestor("GameInvite").Parent.Promise)

return function(Options) --[[ Line: 18 ]]
	-- upvalues: PromiseModule (copy)
	local NewMinIntervalSeconds = 0
	
	return {
		send = function(p1) --[[ Line: 21 ]]
			-- upvalues: PromiseModule (upval), Options (copy), NewMinIntervalSeconds (ref)
			return PromiseModule.new(function(p2, p3) --[[ Line: 22 ]]
				-- upvalues: Options (upval), NewMinIntervalSeconds (upval), PromiseModule (upval), p1 (copy)
				local NowResult: number = Options.now()
				local Largest = math.max(NowResult, NewMinIntervalSeconds)
				NewMinIntervalSeconds = Largest + Options.minIntervalSeconds
				
				local function dispatch() --[[ Line: 27 ]]
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