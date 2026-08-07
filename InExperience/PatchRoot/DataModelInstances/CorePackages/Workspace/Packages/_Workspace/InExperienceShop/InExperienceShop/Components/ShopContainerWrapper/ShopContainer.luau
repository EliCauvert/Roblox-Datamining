local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local fFlagEnableShopPrefetchModule = require(inExperienceShop.Flags.FFlagEnableShopPrefetch)
local getInExperienceShopStoreModule = require(inExperienceShop.Stores.getInExperienceShopStore)
local logCounterModule = require(inExperienceShop.Internal.logCounter)
local shopDebugLoggerModule = require(inExperienceShop.Internal.ShopDebugLogger)
local firstOpenCounterModule = require(inExperienceShop.Events.FirstOpenCounter)
local firstOpenPrefetchHitCounterModule = require(inExperienceShop.Events.FirstOpenPrefetchHitCounter)
local openCounterModule = require(inExperienceShop.Events.OpenCounter)
local shopViewModule = require(script.Parent.ShopView)
local useShopViewModelModule = require(script.Parent.useShopViewModel)
local var12 = false

return function(p0) --[[ line: 25 | named "ShopContainer" ]]
	-- upvalues: signalsReactModule (ref), getInExperienceShopStoreModule (ref), reactModule (ref), fFlagEnableShopPrefetchModule (ref), var12 (write), shopDebugLoggerModule (ref), logCounterModule (ref), openCounterModule (ref), firstOpenCounterModule (ref), firstOpenPrefetchHitCounterModule (ref), useShopViewModelModule (ref), shopViewModule (ref)
	local var13 = signalsReactModule.useSignalState(getInExperienceShopStoreModule)
	reactModule.useEffect(function() --[[ line: 43 ]]
		-- upvalues: fFlagEnableShopPrefetchModule (copy), var12 (copy), shopDebugLoggerModule (copy), logCounterModule (copy), openCounterModule (copy), firstOpenCounterModule (copy), var13 (ref), firstOpenPrefetchHitCounterModule (copy)
		local var14 = fFlagEnableShopPrefetchModule and not var12
		shopDebugLoggerModule.logLazy(function() --[[ line: 51 ]]
			-- upvalues: var14 (ref)
			return "ShopContainer: mount isFirstOpen=" .. tostring(var14)
		end)
		logCounterModule(openCounterModule)
		
		if var14 then
			var12 = true
			logCounterModule(firstOpenCounterModule)
			local var15 = #var13.getCategories(false) > 0
			shopDebugLoggerModule.logLazy(function() --[[ line: 61 ]]
				-- upvalues: var15 (ref)
				return "ShopContainer: prefetch cache hit=" .. tostring(var15)
			end)
			
			if var15 then
				logCounterModule(firstOpenPrefetchHitCounterModule)
			end
		end
		task.spawn(function() --[[ line: 68 ]]
			-- upvalues: shopDebugLoggerModule (copy), var13 (copy)
			shopDebugLoggerModule.log("ShopContainer: calling onShopOpened")
			var13.onShopOpened()
		end)
	end, { var13.onShopOpened, var13.getCategories })
	
	return reactModule.createElement(shopViewModule, useShopViewModelModule(p0))
end