local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagEnableShopPrefetchModule = require(InExperienceShop.Flags.FFlagEnableShopPrefetch)
local FFlagEnableFreeTrialBlueDotModule = require(InExperienceShop.Flags.FFlagEnableFreeTrialBlueDot)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local LogCounterModule = require(InExperienceShop.Internal.logCounter)
local ShopDebugLoggerModule = require(InExperienceShop.Internal.ShopDebugLogger)
local FirstOpenCounterModule = require(InExperienceShop.Events.FirstOpenCounter)
local FirstOpenPrefetchHitCounterModule = require(InExperienceShop.Events.FirstOpenPrefetchHitCounter)
local OpenCounterModule = require(InExperienceShop.Events.OpenCounter)
local ShopViewModule = require(script.Parent.ShopView)
local UseShopViewModelModule = require(script.Parent.useShopViewModel)
local Flag = false

return function(p1)
	-- upvalues: SignalsReactModule (copy), GetInExperienceShopStoreModule (copy), ReactModule (copy), FFlagEnableShopPrefetchModule (copy), Flag (ref), ShopDebugLoggerModule (copy), LogCounterModule (copy), OpenCounterModule (copy), FirstOpenCounterModule (copy), FirstOpenPrefetchHitCounterModule (copy), FFlagEnableFreeTrialBlueDotModule (copy), InExperienceShop (copy), UseShopViewModelModule (copy), ShopViewModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetInExperienceShopStoreModule)
	ReactModule.useEffect(function()
		-- upvalues: FFlagEnableShopPrefetchModule (upval), Flag (upval), ShopDebugLoggerModule (upval), LogCounterModule (upval), OpenCounterModule (upval), FirstOpenCounterModule (upval), UseSignalStateResult (copy), FirstOpenPrefetchHitCounterModule (upval), FFlagEnableFreeTrialBlueDotModule (upval), InExperienceShop (upval)
		local NoFlag: boolean = FFlagEnableShopPrefetchModule and not Flag
		ShopDebugLoggerModule.logLazy(function(): string
			-- upvalues: NoFlag (copy)
			return "ShopContainer: mount isFirstOpen=" .. tostring(NoFlag)
		end)
		LogCounterModule(OpenCounterModule)
		
		if NoFlag then
			Flag = true
			LogCounterModule(FirstOpenCounterModule)
			local v1 = #UseSignalStateResult.getCategories(false) > 0
			ShopDebugLoggerModule.logLazy(function(): string
				-- upvalues: v1 (copy)
				return "ShopContainer: prefetch cache hit=" .. tostring(v1)
			end)
			
			if v1 then
				LogCounterModule(FirstOpenPrefetchHitCounterModule)
			end
		end
		if FFlagEnableFreeTrialBlueDotModule then
			require(InExperienceShop.submitFreeTrialBlueDot).dismiss()
		end
		task.spawn(function()
			-- upvalues: ShopDebugLoggerModule (upval), UseSignalStateResult (upval)
			ShopDebugLoggerModule.log("ShopContainer: calling onShopOpened")
			UseSignalStateResult.onShopOpened()
		end)
	end, {
		UseSignalStateResult.onShopOpened,
		UseSignalStateResult.getCategories
	})
	
	return ReactModule.createElement(ShopViewModule, (UseShopViewModelModule(p1)))
end