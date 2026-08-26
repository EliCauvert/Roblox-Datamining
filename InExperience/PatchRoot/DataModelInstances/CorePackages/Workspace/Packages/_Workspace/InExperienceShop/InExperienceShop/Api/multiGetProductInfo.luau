local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local promiseModule = require(inExperienceShop.Parent.Promise)
local getProductInfoModule = require(script.Parent.getProductInfo)
local shopDebugLoggerModule = require(inExperienceShop.Internal.ShopDebugLogger)

return function(p1)
	-- upvalues: shopDebugLoggerModule (ref), getProductInfoModule (ref), promiseModule (ref)
	shopDebugLoggerModule.logLazy(function()
		-- upvalues: p1 (ref)
		return "multiGetProductInfo: start batchSize=" .. #p1
	end)
	local var1 = shopDebugLoggerModule.startTimer()
	local list = table.create(#p1)
	
	for i, v in ipairs(p1) do
		list[i] = getProductInfoModule(v.id, v.infoType):andThen(function(p2)
			-- upvalues: v (ref)
			return { ok = true, request = v, value = p2 }
		end):catch(function(p2)
			-- upvalues: v (ref)
			return { ok = false, request = v, err = p2 }
		end)
	end
	return shopDebugLoggerModule.tracePromise(promiseModule.all(list), {
		onSuccess = function(p2)
			-- upvalues: shopDebugLoggerModule (copy), var1 (ref)
			local var2 = 0
			local var3 = 0
			
			for i, v in ipairs(p2) do
				if v.ok then
					var2 += 1
				else
					var3 += 1
				end
			end
			shopDebugLoggerModule.logElapsedLazy(function()
				-- upvalues: var2 (write), var3 (write)
				return "multiGetProductInfo: done succeeded=" .. var6 .. " failed=" .. var7
			end, var1)
		end
	})
end