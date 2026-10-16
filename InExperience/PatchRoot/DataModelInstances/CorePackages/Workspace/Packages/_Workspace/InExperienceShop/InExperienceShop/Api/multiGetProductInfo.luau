local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local PromiseModule = require(InExperienceShop.Parent.Promise)
local GetProductInfoModule = require(script.Parent.getProductInfo)
local ShopDebugLoggerModule = require(InExperienceShop.Internal.ShopDebugLogger)

return function(List) --[[ Line: 39 | Named "multiGetProductInfo" ]]
	-- upvalues: ShopDebugLoggerModule (copy), GetProductInfoModule (copy), PromiseModule (copy)
	ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 42 ]]
		-- upvalues: List (copy)
		return "multiGetProductInfo: start batchSize=" .. #List
	end)
	local StartTimerResult = ShopDebugLoggerModule.startTimer()
	local Buffer = table.create(#List)
	
	for i, Request in ipairs(List) do
		Buffer[i] = GetProductInfoModule(Request.id, Request.infoType):andThen(function(Result) --[[ Line: 49 ]]
			-- upvalues: Request (copy)
			return { ok = true, request = Request, value = Result }
		end):catch(function(Err) --[[ Line: 52 ]]
			-- upvalues: Request (copy)
			return { ok = false, request = Request, err = Err }
		end)
	end
	return ShopDebugLoggerModule.tracePromise(PromiseModule.all(Buffer), {
		onSuccess = function(List) --[[ Line: 57 ]]
			-- upvalues: ShopDebugLoggerModule (upval), StartTimerResult (copy)
			local Count = 0
			local Count1 = 0
			
			for _, value in ipairs(List) do
				if value.ok then
					Count += 1
				else
					Count1 += 1
				end
			end
			ShopDebugLoggerModule.logElapsedLazy(function(): string --[[ Line: 66 ]]
				-- upvalues: Count (ref), Count1 (ref)
				return "multiGetProductInfo: done succeeded=" .. Count .. " failed=" .. Count1
			end, StartTimerResult)
		end
	})
end