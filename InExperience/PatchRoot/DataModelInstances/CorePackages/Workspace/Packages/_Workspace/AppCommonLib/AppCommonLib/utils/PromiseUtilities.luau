local Parent = script:FindFirstAncestor("AppCommonLib").Parent
local ResultModule = require(Parent.Result)
local PromiseModule = require(Parent.Promise)

return {
	Batch = function(List, Callback)
		-- upvalues: PromiseModule (copy), ResultModule (copy)
		assert(type(List) == "table", "PromiseUtilities expects a list of Promises!")
		local Count = 0
		
		for _, value in pairs(List) do
			assert(PromiseModule.is(value), "PromiseUtilities expects a list of Promises!")
			Count += 1
		end
		return PromiseModule.new(function(Callback1: (any) -> (), _)
			-- upvalues: ResultModule (upval), Count (ref), List (copy), Callback (copy)
			local Count1 = 0
			local NewResults = {}
			
			local function _(Key, p1, p2)
				-- upvalues: NewResults (copy), ResultModule (upval), Count1 (ref), Count (upval), Callback1 (copy)
				NewResults[Key] = ResultModule.new(p1, p2)
				Count1 += 1
				
				if Count1 == Count then
					Callback1(NewResults)
				end
			end
			
			if next(List) == nil then
				Callback1(NewResults)
			end
			for i, Promise in pairs(List) do
				Promise:andThen(function(Result, ...)
					-- upvalues: i (copy), NewResults (copy), ResultModule (upval), Count1 (ref), Count (upval), Callback1 (copy)
					if select("#", ...) > 0 then
						warn("Promises in PromiseUtilities.Batch should not return tuple")
					end
					NewResults[i] = ResultModule.new(true, Result)
					Count1 += 1
					
					if Count1 == Count then
						Callback1(NewResults)
					end
				end, function(p1)
					-- upvalues: i (copy), NewResults (copy), ResultModule (upval), Count1 (ref), Count (upval), Callback1 (copy), Callback (upval)
					NewResults[i] = ResultModule.new(false, p1)
					Count1 += 1
					
					if Count1 == Count then
						Callback1(NewResults)
					end
					if Callback then
						Callback(p1)
					end
				end)
			end
		end)
	end,
	CountResults = function(List)
		local TotalCount = 0
		local FailureCount = 0
		
		for _, value in pairs(List) do
			local UnwrapResult, _ = value:unwrap()
			
			if not UnwrapResult then
				FailureCount += 1
			end
			TotalCount += 1
		end
		return {
			successCount = TotalCount - FailureCount,
			failureCount = FailureCount,
			totalCount = TotalCount
		}
	end
}