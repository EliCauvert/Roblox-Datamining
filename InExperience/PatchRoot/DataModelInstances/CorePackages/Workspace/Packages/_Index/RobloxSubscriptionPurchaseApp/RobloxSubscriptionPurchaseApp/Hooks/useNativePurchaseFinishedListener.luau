local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local reactModule = require(parent.React)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)
local completeRobloxSubscriptionUpsellFlowModule = require(robloxSubscriptionPurchaseApp.Actions.completeRobloxSubscriptionUpsellFlow)
local fFlagEnableHeadlessSubscriptionNativePurchaseCancelCallbackModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagEnableHeadlessSubscriptionNativePurchaseCancelCallback)
local fFlagLuaAppEnableNativePurchaseFinishedV2Signals = require(parent.SharedFlags).FFlagLuaAppEnableNativePurchaseFinishedV2Signals

local function useNativePurchaseFinishedListenerLegacy(p0, p1, p2, p3)
	-- upvalues: robloxSubscriptionStoreModule (ref), reactModule (ref), promptStateModule (ref), completeRobloxSubscriptionUpsellFlowModule (ref), fFlagLuaAppEnableNativePurchaseFinishedV2Signals (ref)
	local var8 = reactModule.useRef(robloxSubscriptionStoreModule.get())
	local var9 = reactModule.useMemo(function()
		-- upvalues: p0 (ref)
		return p0 or function()
			return game:GetService("MarketplaceService").NativePurchaseFinishedWithLocalPlayer
		end
	end, { p0 })
	local var10 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return p1 or function()
			return game:GetService("MarketplaceService").NativePurchaseFinished
		end
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var8 (ref), promptStateModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy), var10 (ref), fFlagLuaAppEnableNativePurchaseFinishedV2Signals (copy), p2 (ref), p3 (ref)
		local var11 = var9():Connect(function(_, p4)
			-- upvalues: var8 (copy), promptStateModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy)
			local current = var8.current
			
			if current.getPromptState() == promptStateModule.SubscriptionPurchaseInProgress then
				if p4 then
					current.setDidTryPurchasing(true)
					completeRobloxSubscriptionUpsellFlowModule()
					
					return
				end
				current.setPromptState(promptStateModule.SubscriptionPurchaseUIReady)
			end
		end)
		local var12 = var10():Connect(function(_, _, p5)
			-- upvalues: var8 (copy), promptStateModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy)
			local current = var8.current
			
			if current.getPromptState() == promptStateModule.SubscriptionPurchaseInProgress then
				if p5 then
					current.setDidTryPurchasing(true)
					completeRobloxSubscriptionUpsellFlowModule()
					
					return
				end
				current.setPromptState(promptStateModule.SubscriptionPurchaseUIReady)
			end
		end)
		local var13 = nil
		local var14 = nil
		
		if fFlagLuaAppEnableNativePurchaseFinishedV2Signals then
			var13 = (if p2 then p2() else game:GetService("MarketplaceService").NativePurchaseFinishedWithLocalPlayerV2):Connect(function(_, p6, _)
				-- upvalues: var8 (copy), promptStateModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy)
				local current = var8.current
				
				if current.getPromptState() == promptStateModule.SubscriptionPurchaseInProgress then
					if p6 then
						current.setDidTryPurchasing(true)
						completeRobloxSubscriptionUpsellFlowModule()
						
						return
					end
					current.setPromptState(promptStateModule.SubscriptionPurchaseUIReady)
				end
			end)
			var14 = (if p3 then p3() else game:GetService("MarketplaceService").NativePurchaseFinishedV2):Connect(function(_, _, p7, _)
				-- upvalues: var8 (copy), promptStateModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy)
				local current = var8.current
				
				if current.getPromptState() == promptStateModule.SubscriptionPurchaseInProgress then
					if p7 then
						current.setDidTryPurchasing(true)
						completeRobloxSubscriptionUpsellFlowModule()
						
						return
					end
					current.setPromptState(promptStateModule.SubscriptionPurchaseUIReady)
				end
			end)
		end
		return function()
			-- upvalues: var11 (ref), var12 (ref), var13 (write), var14 (write)
			if var11 then
				var11:Disconnect()
			end
			if var12 then
				var12:Disconnect()
			end
			if var13 then
				var13:Disconnect()
			end
			if var14 then
				var14:Disconnect()
			end
		end
	end, { var9, var10, p2, p3 })
end

local function useNativePurchaseFinishedListenerWithCancelCallback(p8, p9, p10, p11, p12)
	-- upvalues: robloxSubscriptionStoreModule (ref), reactModule (ref), promptStateModule (ref), completeRobloxSubscriptionUpsellFlowModule (ref), fFlagLuaAppEnableNativePurchaseFinishedV2Signals (ref)
	local var15 = reactModule.useRef(robloxSubscriptionStoreModule.get())
	local var16 = reactModule.useRef(p10)
	var16.current = p10
	local var17 = reactModule.useMemo(function()
		-- upvalues: p8 (ref)
		return p8 or function()
			return game:GetService("MarketplaceService").NativePurchaseFinishedWithLocalPlayer
		end
	end, { p8 })
	local var18 = reactModule.useMemo(function()
		-- upvalues: p9 (ref)
		return p9 or function()
			return game:GetService("MarketplaceService").NativePurchaseFinished
		end
	end, { p9 })
	
	local function onNativePurchaseFinished(_, p13)
		-- upvalues: var15 (ref), promptStateModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy), var16 (ref)
		local current = var15.current
		
		if current.getPromptState() ~= promptStateModule.SubscriptionPurchaseInProgress then return end
		if p13 then
			current.setDidTryPurchasing(true)
			completeRobloxSubscriptionUpsellFlowModule()
			
			return
		elseif var16.current then
			var16.current()
			
			return
		end
		current.setPromptState(promptStateModule.SubscriptionPurchaseUIReady)
	end
	
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), onNativePurchaseFinished (ref), var18 (ref), fFlagLuaAppEnableNativePurchaseFinishedV2Signals (copy), p11 (ref), p12 (ref)
		local var20 = var17():Connect(function(p14, p15)
			-- upvalues: onNativePurchaseFinished (copy)
			onNativePurchaseFinished(p14, p15)
		end)
		local var21 = var18():Connect(function(_, p16, p17)
			-- upvalues: onNativePurchaseFinished (copy)
			onNativePurchaseFinished(p16, p17)
		end)
		local var22 = nil
		local var23 = nil
		
		if fFlagLuaAppEnableNativePurchaseFinishedV2Signals then
			var22 = (if p11 then p11() else game:GetService("MarketplaceService").NativePurchaseFinishedWithLocalPlayerV2):Connect(function(p18, p19, _)
				-- upvalues: onNativePurchaseFinished (copy)
				onNativePurchaseFinished(p18, p19)
			end)
			var23 = (if p12 then p12() else game:GetService("MarketplaceService").NativePurchaseFinishedV2):Connect(function(_, p20, p21, _)
				-- upvalues: onNativePurchaseFinished (copy)
				onNativePurchaseFinished(p20, p21)
			end)
		end
		return function()
			-- upvalues: var20 (ref), var21 (ref), var22 (write), var23 (write)
			if var20 then
				var20:Disconnect()
			end
			if var21 then
				var21:Disconnect()
			end
			if var22 then
				var22:Disconnect()
			end
			if var23 then
				var23:Disconnect()
			end
		end
	end, { var17, var18, p11, p12 })
end

return function(p22, p23, p24, p25, p26)
	-- upvalues: fFlagEnableHeadlessSubscriptionNativePurchaseCancelCallbackModule (ref), useNativePurchaseFinishedListenerWithCancelCallback (ref), useNativePurchaseFinishedListenerLegacy (ref)
	if fFlagEnableHeadlessSubscriptionNativePurchaseCancelCallbackModule then
		useNativePurchaseFinishedListenerWithCancelCallback(p22, p23, p24, p25, p26)
		
		return
	end
	useNativePurchaseFinishedListenerLegacy(p22, p23, p25, p26)
end