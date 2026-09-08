local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local promiseModule = require(inExperienceOffers.Parent.Promise)
local fFlagEnableOffersDebugLoggingModule = require(inExperienceOffers.Flags.FFlagEnableOffersDebugLogging)

return {
	log = function(p1)
		-- upvalues: fFlagEnableOffersDebugLoggingModule (ref)
		if fFlagEnableOffersDebugLoggingModule then
			print("[OffersDebug]", p1)
		end
	end,
	logLazy = function(p1)
		-- upvalues: fFlagEnableOffersDebugLoggingModule (ref)
		if fFlagEnableOffersDebugLoggingModule then
			print("[OffersDebug]", p1())
		end
	end,
	startTimer = function()
		-- upvalues: fFlagEnableOffersDebugLoggingModule (ref)
		return if fFlagEnableOffersDebugLoggingModule then os.clock() else nil
	end,
	logElapsed = function(p1, p2)
		-- upvalues: fFlagEnableOffersDebugLoggingModule (ref)
		if fFlagEnableOffersDebugLoggingModule and p2 ~= nil then
			print("[OffersDebug]", p1, string.format("(%.3fs)", os.clock() - p2))
		end
	end,
	logElapsedLazy = function(p1, p2)
		-- upvalues: fFlagEnableOffersDebugLoggingModule (ref)
		if fFlagEnableOffersDebugLoggingModule and p2 ~= nil then
			print("[OffersDebug]", p1(), string.format("(%.3fs)", os.clock() - p2))
		end
	end,
	tracePromise = function(p1, p2)
		-- upvalues: fFlagEnableOffersDebugLoggingModule (ref), promiseModule (ref)
		if not fFlagEnableOffersDebugLoggingModule then
			return p1
		end
		local var1 = p1
		
		if p2.onSuccess then
			local onSuccess = p2.onSuccess
			var1 = var1:andThen(function(p3)
				-- upvalues: onSuccess (ref)
				onSuccess(p3)
				
				return p3
			end)
		end
		if p2.onError then
			local onError = p2.onError
			var1 = var1:catch(function(p3)
				-- upvalues: onError (ref), promiseModule (copy)
				onError(p3)
				
				return promiseModule.reject(p3)
			end)
		end
		return var1
	end
}