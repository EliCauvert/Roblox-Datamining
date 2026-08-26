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
local var1 = false

return function(p1)
	-- upvalues: signalsReactModule (ref), getInExperienceShopStoreModule (ref), reactModule (ref), fFlagEnableShopPrefetchModule (ref), var1 (write), shopDebugLoggerModule (ref), logCounterModule (ref), openCounterModule (ref), firstOpenCounterModule (ref), firstOpenPrefetchHitCounterModule (ref), useShopViewModelModule (ref), shopViewModule (ref)
	local var2 = signalsReactModule.useSignalState(getInExperienceShopStoreModule)
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableShopPrefetchModule (copy), var1 (copy), shopDebugLoggerModule (copy), logCounterModule (copy), openCounterModule (copy), firstOpenCounterModule (copy), var2 (ref), firstOpenPrefetchHitCounterModule (copy)
		local var3 = fFlagEnableShopPrefetchModule and not var1
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: var3 (ref)
			return "ShopContainer: mount isFirstOpen=" .. tostring(var3)
		end)
		logCounterModule(openCounterModule)
		
		if var3 then
			var1 = true
			logCounterModule(firstOpenCounterModule)
			local var4 = #var2.getCategories(false) > 0
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: var4 (ref)
				return "ShopContainer: prefetch cache hit=" .. tostring(var4)
			end)
			
			if var4 then
				logCounterModule(firstOpenPrefetchHitCounterModule)
			end
		end
		task.spawn(function()
			-- upvalues: shopDebugLoggerModule (copy), var2 (copy)
			shopDebugLoggerModule.log("ShopContainer: calling onShopOpened")
			var2.onShopOpened()
		end)
	end, { var2.onShopOpened, var2.getCategories })
	
	return reactModule.createElement(shopViewModule, useShopViewModelModule(p1))
end