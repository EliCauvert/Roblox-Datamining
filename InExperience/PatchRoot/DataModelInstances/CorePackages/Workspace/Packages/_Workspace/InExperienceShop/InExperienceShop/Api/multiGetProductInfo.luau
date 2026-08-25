local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local promiseModule = require(inExperienceShop.Parent.Promise)
local getProductInfoModule = require(script.Parent.getProductInfo)
local shopDebugLoggerModule = require(inExperienceShop.Internal.ShopDebugLogger)

return function(p0)
	-- upvalues: shopDebugLoggerModule (ref), getProductInfoModule (ref), promiseModule (ref)
	shopDebugLoggerModule.logLazy(function()
		-- upvalues: p0 (ref)
		return "multiGetProductInfo: start batchSize=" .. #p0
	end)
	local var4 = shopDebugLoggerModule.startTimer()
	local list = table.create(#p0)
	
	for i, v in ipairs(p0) do
		list[i] = getProductInfoModule(v.id, v.infoType):andThen(function(p2)
			-- upvalues: v (ref)
			return { ok = true, request = v, value = p2 }
		end):catch(function(p1)
			-- upvalues: v (ref)
			return { ok = false, request = v, err = p1 }
		end)
	end
	return shopDebugLoggerModule.tracePromise(promiseModule.all(list), {
		onSuccess = function(p3)
			-- upvalues: shopDebugLoggerModule (copy), var4 (ref)
			local var6 = 0
			local var7 = 0
			
			for i, v in ipairs(p3) do
				if v.ok then
					var6 += 1
				else
					var7 += 1
				end
			end
			shopDebugLoggerModule.logElapsedLazy(function()
				-- upvalues: var6 (write), var7 (write)
				return "multiGetProductInfo: done succeeded=" .. var6 .. " failed=" .. var7
			end, var4)
		end
	})
end