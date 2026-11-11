local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local ReactModule = require(RobloxSubscriptionPurchaseApp.Parent.React)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local PromptStateModule = require(RobloxSubscriptionPurchaseApp.Enums.PromptState)
local CompleteRobloxSubscriptionUpsellFlowModule = require(RobloxSubscriptionPurchaseApp.Actions.completeRobloxSubscriptionUpsellFlow)
local FFlagEnableHeadlessSubscriptionNativePurchaseCancelCallbackModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagEnableHeadlessSubscriptionNativePurchaseCancelCallback)

local function useNativePurchaseFinishedListenerLegacy(p1, p2)
	-- upvalues: RobloxSubscriptionStoreModule (copy), ReactModule (copy), PromptStateModule (copy), CompleteRobloxSubscriptionUpsellFlowModule (copy)
	local UseRefResult = ReactModule.useRef((RobloxSubscriptionStoreModule.get()))
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		return if p1 then p1 else function()
			return game:GetService("MarketplaceService").NativePurchaseFinishedWithLocalPlayer
		end
	end, { p1 })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p2 (copy)
		return if p2 then p2 else function()
			return game:GetService("MarketplaceService").NativePurchaseFinished
		end
	end, { p2 })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), UseRefResult (copy), PromptStateModule (upval), CompleteRobloxSubscriptionUpsellFlowModule (upval), UseMemoResult1 (copy)
		local Connection = UseMemoResult():Connect(function(_, p3)
			-- upvalues: UseRefResult (upval), PromptStateModule (upval), CompleteRobloxSubscriptionUpsellFlowModule (upval)
			local Current = UseRefResult.current
			
			if Current.getPromptState() == PromptStateModule.SubscriptionPurchaseInProgress then
				if p3 then
					Current.setDidTryPurchasing(true)
					CompleteRobloxSubscriptionUpsellFlowModule()
					
					return
				else
					Current.setPromptState(PromptStateModule.SubscriptionPurchaseUIReady)
				end
			end
		end)
		local Connection1 = UseMemoResult1():Connect(function(_, _, p3)
			-- upvalues: UseRefResult (upval), PromptStateModule (upval), CompleteRobloxSubscriptionUpsellFlowModule (upval)
			local Current = UseRefResult.current
			
			if Current.getPromptState() == PromptStateModule.SubscriptionPurchaseInProgress then
				if p3 then
					Current.setDidTryPurchasing(true)
					CompleteRobloxSubscriptionUpsellFlowModule()
					
					return
				else
					Current.setPromptState(PromptStateModule.SubscriptionPurchaseUIReady)
				end
			end
		end)
		
		return function()
			-- upvalues: Connection (copy), Connection1 (copy)
			if Connection then
				Connection:Disconnect()
			end
			if Connection1 then
				Connection1:Disconnect()
			end
		end
	end, { UseMemoResult, UseMemoResult1 })
end

local function useNativePurchaseFinishedListenerWithCancelCallback(p1, p2, Current)
	-- upvalues: RobloxSubscriptionStoreModule (copy), ReactModule (copy), PromptStateModule (copy), CompleteRobloxSubscriptionUpsellFlowModule (copy)
	local UseRefResult = ReactModule.useRef((RobloxSubscriptionStoreModule.get()))
	local UseRefResult1 = ReactModule.useRef(Current)
	UseRefResult1.current = Current
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		return if p1 then p1 else function()
			return game:GetService("MarketplaceService").NativePurchaseFinishedWithLocalPlayer
		end
	end, { p1 })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p2 (copy)
		return if p2 then p2 else function()
			return game:GetService("MarketplaceService").NativePurchaseFinished
		end
	end, { p2 })
	
	local function onNativePurchaseFinished(_, p3)
		-- upvalues: UseRefResult (copy), PromptStateModule (upval), CompleteRobloxSubscriptionUpsellFlowModule (upval), UseRefResult1 (copy)
		local Current = UseRefResult.current
		
		if Current.getPromptState() ~= PromptStateModule.SubscriptionPurchaseInProgress then return end
		if p3 then
			Current.setDidTryPurchasing(true)
			CompleteRobloxSubscriptionUpsellFlowModule()
			
			return
		end
		if UseRefResult1.current then
			UseRefResult1.current()
			
			return
		else
			Current.setPromptState(PromptStateModule.SubscriptionPurchaseUIReady)
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), onNativePurchaseFinished (copy), UseMemoResult1 (copy)
		local Connection = UseMemoResult():Connect(function(p3, p4)
			-- upvalues: onNativePurchaseFinished (upval)
			onNativePurchaseFinished(p3, p4)
		end)
		local Connection1 = UseMemoResult1():Connect(function(_, p3, p4)
			-- upvalues: onNativePurchaseFinished (upval)
			onNativePurchaseFinished(p3, p4)
		end)
		
		return function()
			-- upvalues: Connection (copy), Connection1 (copy)
			if Connection then
				Connection:Disconnect()
			end
			if Connection1 then
				Connection1:Disconnect()
			end
		end
	end, { UseMemoResult, UseMemoResult1 })
end

return function(p1, p2, Current)
	-- upvalues: FFlagEnableHeadlessSubscriptionNativePurchaseCancelCallbackModule (copy), useNativePurchaseFinishedListenerWithCancelCallback (copy), useNativePurchaseFinishedListenerLegacy (copy)
	if FFlagEnableHeadlessSubscriptionNativePurchaseCancelCallbackModule then
		useNativePurchaseFinishedListenerWithCancelCallback(p1, p2, Current)
		
		return
	else
		useNativePurchaseFinishedListenerLegacy(p1, p2)
	end
end