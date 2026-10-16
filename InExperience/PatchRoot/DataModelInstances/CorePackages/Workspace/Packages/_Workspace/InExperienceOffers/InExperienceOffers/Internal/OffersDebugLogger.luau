local InExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local PromiseModule = require(InExperienceOffers.Parent.Promise)
local FFlagEnableOffersDebugLoggingModule = require(InExperienceOffers.Flags.FFlagEnableOffersDebugLogging)

return {
	log = function(p1) --[[ Line: 9 ]]
		-- upvalues: FFlagEnableOffersDebugLoggingModule (copy)
		if FFlagEnableOffersDebugLoggingModule then
			print("[OffersDebug]", p1)
		end
	end,
	logLazy = function(Callback) --[[ Line: 17 ]]
		-- upvalues: FFlagEnableOffersDebugLoggingModule (copy)
		if FFlagEnableOffersDebugLoggingModule then
			print("[OffersDebug]", Callback())
		end
	end,
	startTimer = function() --[[ Line: 26 ]]
		-- upvalues: FFlagEnableOffersDebugLoggingModule (copy)
		return if FFlagEnableOffersDebugLoggingModule then os.clock() else nil
	end,
	logElapsed = function(p1, p2) --[[ Line: 33 ]]
		-- upvalues: FFlagEnableOffersDebugLoggingModule (copy)
		if FFlagEnableOffersDebugLoggingModule and p2 ~= nil then
			print("[OffersDebug]", p1, string.format("(%.3fs)", os.clock() - p2))
		end
	end,
	logElapsedLazy = function(Callback, p1) --[[ Line: 39 ]]
		-- upvalues: FFlagEnableOffersDebugLoggingModule (copy)
		if FFlagEnableOffersDebugLoggingModule and p1 ~= nil then
			print("[OffersDebug]", Callback(), string.format("(%.3fs)", os.clock() - p1))
		end
	end,
	tracePromise = function(Promise, p1) --[[ Line: 52 ]]
		-- upvalues: FFlagEnableOffersDebugLoggingModule (copy), PromiseModule (copy)
		if not FFlagEnableOffersDebugLoggingModule then
			return Promise
		end
		local Promise1 = Promise
		
		if p1.onSuccess then
			local OnSuccessFunction = p1.onSuccess
			Promise1 = Promise1:andThen(function(Result) --[[ Line: 60 ]]
				-- upvalues: OnSuccessFunction (copy)
				OnSuccessFunction(Result)
				
				return Result
			end)
		end
		if p1.onError then
			local OnErrorFunction = p1.onError
			Promise1 = Promise1:catch(function(Err) --[[ Line: 67 ]]
				-- upvalues: OnErrorFunction (copy), PromiseModule (upval)
				OnErrorFunction(Err)
				
				return PromiseModule.reject(Err)
			end)
		end
		return Promise1
	end
}