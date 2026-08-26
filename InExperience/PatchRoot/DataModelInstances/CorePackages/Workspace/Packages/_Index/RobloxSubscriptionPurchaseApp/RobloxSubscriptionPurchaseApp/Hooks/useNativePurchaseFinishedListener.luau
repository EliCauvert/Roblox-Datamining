local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local reactModule = require(parent.React)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)
local completeRobloxSubscriptionUpsellFlowModule = require(robloxSubscriptionPurchaseApp.Actions.completeRobloxSubscriptionUpsellFlow)
local fFlagEnableHeadlessSubscriptionNativePurchaseCancelCallbackModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagEnableHeadlessSubscriptionNativePurchaseCancelCallback)
local fFlagLuaAppEnableNativePurchaseFinishedV2Signals = require(parent.SharedFlags).FFlagLuaAppEnableNativePurchaseFinishedV2Signals

local function useNativePurchaseFinishedListenerLegacy(p1, p2, p3, p4)
	-- upvalues: robloxSubscriptionStoreModule (ref), reactModule (ref), promptStateModule (ref), completeRobloxSubscriptionUpsellFlowModule (ref), fFlagLuaAppEnableNativePurchaseFinishedV2Signals (ref)
	local var1 = reactModule.useRef(robloxSubscriptionStoreModule.get())
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return p1 or function()
			return game:GetService("MarketplaceService").NativePurchaseFinishedWithLocalPlayer
		end
	end, { p1 })
	local var3 = reactModule.useMemo(function()
		-- upvalues: p2 (ref)
		return p2 or function()
			return game:GetService("MarketplaceService").NativePurchaseFinished
		end
	end, { p2 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var1 (ref), promptStateModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy), var3 (ref), fFlagLuaAppEnableNativePurchaseFinishedV2Signals (copy), p3 (ref), p4 (ref)
		local var4 = var2():Connect(function(_, p5)
			-- upvalues: var1 (copy), promptStateModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy)
			local current = var1.current
			
			if current.getPromptState() == promptStateModule.SubscriptionPurchaseInProgress then
				if p5 then
					current.setDidTryPurchasing(true)
					completeRobloxSubscriptionUpsellFlowModule()
					
					return
				end
				current.setPromptState(promptStateModule.SubscriptionPurchaseUIReady)
			end
		end)
		local var5 = var3():Connect(function(_, _, p5)
			-- upvalues: var1 (copy), promptStateModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy)
			local current = var1.current
			
			if current.getPromptState() == promptStateModule.SubscriptionPurchaseInProgress then
				if p5 then
					current.setDidTryPurchasing(true)
					completeRobloxSubscriptionUpsellFlowModule()
					
					return
				end
				current.setPromptState(promptStateModule.SubscriptionPurchaseUIReady)
			end
		end)
		local var6 = nil
		local var7 = nil
		
		if fFlagLuaAppEnableNativePurchaseFinishedV2Signals then
			var6 = (if p3 then p3() else game:GetService("MarketplaceService").NativePurchaseFinishedWithLocalPlayerV2):Connect(function(_, p5, _)
				-- upvalues: var1 (copy), promptStateModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy)
				local current = var1.current
				
				if current.getPromptState() == promptStateModule.SubscriptionPurchaseInProgress then
					if p5 then
						current.setDidTryPurchasing(true)
						completeRobloxSubscriptionUpsellFlowModule()
						
						return
					end
					current.setPromptState(promptStateModule.SubscriptionPurchaseUIReady)
				end
			end)
			var7 = (if p4 then p4() else game:GetService("MarketplaceService").NativePurchaseFinishedV2):Connect(function(_, _, p5, _)
				-- upvalues: var1 (copy), promptStateModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy)
				local current = var1.current
				
				if current.getPromptState() == promptStateModule.SubscriptionPurchaseInProgress then
					if p5 then
						current.setDidTryPurchasing(true)
						completeRobloxSubscriptionUpsellFlowModule()
						
						return
					end
					current.setPromptState(promptStateModule.SubscriptionPurchaseUIReady)
				end
			end)
		end
		return function()
			-- upvalues: var4 (ref), var5 (ref), var6 (write), var7 (write)
			if var4 then
				var4:Disconnect()
			end
			if var5 then
				var5:Disconnect()
			end
			if var6 then
				var6:Disconnect()
			end
			if var7 then
				var7:Disconnect()
			end
		end
	end, { var2, var3, p3, p4 })
end

local function useNativePurchaseFinishedListenerWithCancelCallback(p1, p2, p3, p4, p5)
	-- upvalues: robloxSubscriptionStoreModule (ref), reactModule (ref), promptStateModule (ref), completeRobloxSubscriptionUpsellFlowModule (ref), fFlagLuaAppEnableNativePurchaseFinishedV2Signals (ref)
	local var1 = reactModule.useRef(robloxSubscriptionStoreModule.get())
	local var2 = reactModule.useRef(p3)
	var2.current = p3
	local var3 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return p1 or function()
			return game:GetService("MarketplaceService").NativePurchaseFinishedWithLocalPlayer
		end
	end, { p1 })
	local var4 = reactModule.useMemo(function()
		-- upvalues: p2 (ref)
		return p2 or function()
			return game:GetService("MarketplaceService").NativePurchaseFinished
		end
	end, { p2 })
	
	local function onNativePurchaseFinished(_, p6)
		-- upvalues: var1 (ref), promptStateModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy), var2 (ref)
		local current = var1.current
		
		if current.getPromptState() ~= promptStateModule.SubscriptionPurchaseInProgress then return end
		if p6 then
			current.setDidTryPurchasing(true)
			completeRobloxSubscriptionUpsellFlowModule()
			
			return
		elseif var2.current then
			var2.current()
			
			return
		end
		current.setPromptState(promptStateModule.SubscriptionPurchaseUIReady)
	end
	
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), onNativePurchaseFinished (ref), var4 (ref), fFlagLuaAppEnableNativePurchaseFinishedV2Signals (copy), p4 (ref), p5 (ref)
		local var5 = var3():Connect(function(p6, p7)
			-- upvalues: onNativePurchaseFinished (copy)
			onNativePurchaseFinished(p6, p7)
		end)
		local var6 = var4():Connect(function(_, p6, p7)
			-- upvalues: onNativePurchaseFinished (copy)
			onNativePurchaseFinished(p6, p7)
		end)
		local var7 = nil
		local var8 = nil
		
		if fFlagLuaAppEnableNativePurchaseFinishedV2Signals then
			var7 = (if p4 then p4() else game:GetService("MarketplaceService").NativePurchaseFinishedWithLocalPlayerV2):Connect(function(p6, p7, _)
				-- upvalues: onNativePurchaseFinished (copy)
				onNativePurchaseFinished(p6, p7)
			end)
			var8 = (if p5 then p5() else game:GetService("MarketplaceService").NativePurchaseFinishedV2):Connect(function(_, p6, p7, _)
				-- upvalues: onNativePurchaseFinished (copy)
				onNativePurchaseFinished(p6, p7)
			end)
		end
		return function()
			-- upvalues: var5 (ref), var6 (ref), var7 (write), var8 (write)
			if var5 then
				var5:Disconnect()
			end
			if var6 then
				var6:Disconnect()
			end
			if var7 then
				var7:Disconnect()
			end
			if var8 then
				var8:Disconnect()
			end
		end
	end, { var3, var4, p4, p5 })
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: fFlagEnableHeadlessSubscriptionNativePurchaseCancelCallbackModule (ref), useNativePurchaseFinishedListenerWithCancelCallback (ref), useNativePurchaseFinishedListenerLegacy (ref)
	if fFlagEnableHeadlessSubscriptionNativePurchaseCancelCallbackModule then
		useNativePurchaseFinishedListenerWithCancelCallback(p1, p2, p3, p4, p5)
		
		return
	end
	useNativePurchaseFinishedListenerLegacy(p1, p2, p4, p5)
end