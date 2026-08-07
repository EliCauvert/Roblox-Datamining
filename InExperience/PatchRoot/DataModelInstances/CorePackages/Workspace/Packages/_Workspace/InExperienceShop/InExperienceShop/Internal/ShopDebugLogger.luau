local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local promiseModule = require(inExperienceShop.Parent.Promise)
local fFlagEnableShopDebugLoggingModule = require(inExperienceShop.Flags.FFlagEnableShopDebugLogging)

return {
	log = function(p0) --[[ line: 9 ]]
		-- upvalues: fFlagEnableShopDebugLoggingModule (ref)
		if fFlagEnableShopDebugLoggingModule then
			print("[ShopDebug]", p0)
		end
	end,
	logLazy = function(p1) --[[ line: 17 ]]
		-- upvalues: fFlagEnableShopDebugLoggingModule (ref)
		if fFlagEnableShopDebugLoggingModule then
			print("[ShopDebug]", p1())
		end
	end,
	startTimer = function() --[[ line: 26 ]]
		-- upvalues: fFlagEnableShopDebugLoggingModule (ref)
		return if fFlagEnableShopDebugLoggingModule then os.clock() else nil
	end,
	logElapsed = function(p2, p3) --[[ line: 33 ]]
		-- upvalues: fFlagEnableShopDebugLoggingModule (ref)
		if fFlagEnableShopDebugLoggingModule and p3 ~= nil then
			print("[ShopDebug]", p2, string.format("(%.3fs)", os.clock() - p3))
		end
	end,
	logElapsedLazy = function(p4, p5) --[[ line: 39 ]]
		-- upvalues: fFlagEnableShopDebugLoggingModule (ref)
		if fFlagEnableShopDebugLoggingModule and p5 ~= nil then
			print("[ShopDebug]", p4(), string.format("(%.3fs)", os.clock() - p5))
		end
	end,
	tracePromise = function(p6, p7) --[[ line: 52 ]]
		-- upvalues: fFlagEnableShopDebugLoggingModule (ref), promiseModule (ref)
		if not fFlagEnableShopDebugLoggingModule then
			return p6
		end
		local var3 = p6
		
		if p7.onSuccess then
			local onSuccess = p7.onSuccess
			var3 = var3:andThen(function(p8) --[[ line: 60 ]]
				-- upvalues: onSuccess (ref)
				onSuccess(p8)
				
				return p8
			end)
		end
		if p7.onError then
			local onError = p7.onError
			var3 = var3:catch(function(p9) --[[ line: 67 ]]
				-- upvalues: onError (ref), promiseModule (copy)
				onError(p9)
				
				return promiseModule.reject(p9)
			end)
		end
		return var3
	end
}