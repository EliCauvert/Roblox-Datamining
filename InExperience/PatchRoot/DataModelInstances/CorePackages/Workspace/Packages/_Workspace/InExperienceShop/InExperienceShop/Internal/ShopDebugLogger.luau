local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local PromiseModule = require(InExperienceShop.Parent.Promise)
local FFlagEnableShopDebugLoggingModule = require(InExperienceShop.Flags.FFlagEnableShopDebugLogging)

return {
	log = function(p1) --[[ Line: 9 ]]
		-- upvalues: FFlagEnableShopDebugLoggingModule (copy)
		if FFlagEnableShopDebugLoggingModule then
			print("[ShopDebug]", p1)
		end
	end,
	logLazy = function(Callback) --[[ Line: 17 ]]
		-- upvalues: FFlagEnableShopDebugLoggingModule (copy)
		if FFlagEnableShopDebugLoggingModule then
			print("[ShopDebug]", Callback())
		end
	end,
	startTimer = function() --[[ Line: 26 ]]
		-- upvalues: FFlagEnableShopDebugLoggingModule (copy)
		return if FFlagEnableShopDebugLoggingModule then os.clock() else nil
	end,
	logElapsed = function(p1, p2) --[[ Line: 33 ]]
		-- upvalues: FFlagEnableShopDebugLoggingModule (copy)
		if FFlagEnableShopDebugLoggingModule and p2 ~= nil then
			print("[ShopDebug]", p1, string.format("(%.3fs)", os.clock() - p2))
		end
	end,
	logElapsedLazy = function(Callback, p1) --[[ Line: 39 ]]
		-- upvalues: FFlagEnableShopDebugLoggingModule (copy)
		if FFlagEnableShopDebugLoggingModule and p1 ~= nil then
			print("[ShopDebug]", Callback(), string.format("(%.3fs)", os.clock() - p1))
		end
	end,
	tracePromise = function(Promise, p1) --[[ Line: 52 ]]
		-- upvalues: FFlagEnableShopDebugLoggingModule (copy), PromiseModule (copy)
		if not FFlagEnableShopDebugLoggingModule then
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