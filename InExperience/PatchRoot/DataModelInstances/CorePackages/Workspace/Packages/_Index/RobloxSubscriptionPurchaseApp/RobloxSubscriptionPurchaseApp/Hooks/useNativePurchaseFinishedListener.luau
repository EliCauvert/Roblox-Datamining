local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local ReactModule = require(Parent.React)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local PromptStateModule = require(RobloxSubscriptionPurchaseApp.Enums.PromptState)
local CompleteRobloxSubscriptionUpsellFlowModule = require(RobloxSubscriptionPurchaseApp.Actions.completeRobloxSubscriptionUpsellFlow)
local FFlagEnableHeadlessSubscriptionNativePurchaseCancelCallbackModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagEnableHeadlessSubscriptionNativePurchaseCancelCallback)
local FFlagLuaAppEnableNativePurchaseFinishedV2Signals = require(Parent.SharedFlags).FFlagLuaAppEnableNativePurchaseFinishedV2Signals

local function useNativePurchaseFinishedListenerLegacy(p1, p2, Callback1, Callback) --[[ Line: 16 ]]
	-- upvalues: RobloxSubscriptionStoreModule (copy), ReactModule (copy), PromptStateModule (copy), CompleteRobloxSubscriptionUpsellFlowModule (copy), FFlagLuaAppEnableNativePurchaseFinishedV2Signals (copy)
	local UseRefResult = ReactModule.useRef((RobloxSubscriptionStoreModule.get()))
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 25 ]]
		-- upvalues: p1 (copy)
		return if p1 then p1 else function() --[[ Line: 29 ]]
			return game:GetService("MarketplaceService").NativePurchaseFinishedWithLocalPlayer
		end
	end, { p1 })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 35 ]]
		-- upvalues: p2 (copy)
		return if p2 then p2 else function() --[[ Line: 39 ]]
			return game:GetService("MarketplaceService").NativePurchaseFinished
		end
	end, { p2 })
	ReactModule.useEffect(function() --[[ Line: 46 ]]
		-- upvalues: UseMemoResult (copy), UseRefResult (copy), PromptStateModule (upval), CompleteRobloxSubscriptionUpsellFlowModule (upval), UseMemoResult1 (copy), FFlagLuaAppEnableNativePurchaseFinishedV2Signals (upval), Callback1 (copy), Callback (copy)
		local Connection = UseMemoResult():Connect(function(_, p3) --[[ Line: 48 ]]
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
		local Connection1 = UseMemoResult1():Connect(function(_, _, p3) --[[ Line: 63 ]]
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
		local Connection2 = nil
		local Connection3 = nil
		
		if FFlagLuaAppEnableNativePurchaseFinishedV2Signals then
			Connection2 = (if Callback1 then Callback1() else game:GetService("MarketplaceService").NativePurchaseFinishedWithLocalPlayerV2):Connect(function(_, p3, _) --[[ Line: 85 ]]
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
			Connection3 = (if Callback then Callback() else game:GetService("MarketplaceService").NativePurchaseFinishedV2):Connect(function(_, _, p3, _) --[[ Line: 102 ]]
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
		end
		return function() --[[ Line: 116 ]]
			-- upvalues: Connection (copy), Connection1 (copy), Connection2 (ref), Connection3 (ref)
			if Connection then
				Connection:Disconnect()
			end
			if Connection1 then
				Connection1:Disconnect()
			end
			if Connection2 then
				Connection2:Disconnect()
			end
			if Connection3 then
				Connection3:Disconnect()
			end
		end
	end, { UseMemoResult, UseMemoResult1, Callback1, Callback })
end

local function useNativePurchaseFinishedListenerWithCancelCallback(p1, p2, Current, Callback, Callback1) --[[ Line: 141 ]]
	-- upvalues: RobloxSubscriptionStoreModule (copy), ReactModule (copy), PromptStateModule (copy), CompleteRobloxSubscriptionUpsellFlowModule (copy), FFlagLuaAppEnableNativePurchaseFinishedV2Signals (copy)
	local UseRefResult = ReactModule.useRef((RobloxSubscriptionStoreModule.get()))
	local UseRefResult1 = ReactModule.useRef(Current)
	UseRefResult1.current = Current
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 153 ]]
		-- upvalues: p1 (copy)
		return if p1 then p1 else function() --[[ Line: 157 ]]
			return game:GetService("MarketplaceService").NativePurchaseFinishedWithLocalPlayer
		end
	end, { p1 })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 163 ]]
		-- upvalues: p2 (copy)
		return if p2 then p2 else function() --[[ Line: 167 ]]
			return game:GetService("MarketplaceService").NativePurchaseFinished
		end
	end, { p2 })
	
	local function onNativePurchaseFinished(_, p3) --[[ Line: 173 ]]
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
	
	ReactModule.useEffect(function() --[[ Line: 191 ]]
		-- upvalues: UseMemoResult (copy), onNativePurchaseFinished (copy), UseMemoResult1 (copy), FFlagLuaAppEnableNativePurchaseFinishedV2Signals (upval), Callback (copy), Callback1 (copy)
		local Connection = UseMemoResult():Connect(function(p3, p4) --[[ Line: 193 ]]
			-- upvalues: onNativePurchaseFinished (upval)
			onNativePurchaseFinished(p3, p4)
		end)
		local Connection1 = UseMemoResult1():Connect(function(_, p3, p4) --[[ Line: 199 ]]
			-- upvalues: onNativePurchaseFinished (upval)
			onNativePurchaseFinished(p3, p4)
		end)
		local Connection2 = nil
		local Connection3 = nil
		
		if FFlagLuaAppEnableNativePurchaseFinishedV2Signals then
			Connection2 = (if Callback then Callback() else game:GetService("MarketplaceService").NativePurchaseFinishedWithLocalPlayerV2):Connect(function(p3, p4, _) --[[ Line: 212 ]]
				-- upvalues: onNativePurchaseFinished (upval)
				onNativePurchaseFinished(p3, p4)
			end)
			Connection3 = (if Callback1 then Callback1() else game:GetService("MarketplaceService").NativePurchaseFinishedV2):Connect(function(_, p3, p4, _) --[[ Line: 221 ]]
				-- upvalues: onNativePurchaseFinished (upval)
				onNativePurchaseFinished(p3, p4)
			end)
		end
		return function() --[[ Line: 227 ]]
			-- upvalues: Connection (copy), Connection1 (copy), Connection2 (ref), Connection3 (ref)
			if Connection then
				Connection:Disconnect()
			end
			if Connection1 then
				Connection1:Disconnect()
			end
			if Connection2 then
				Connection2:Disconnect()
			end
			if Connection3 then
				Connection3:Disconnect()
			end
		end
	end, { UseMemoResult, UseMemoResult1, Callback, Callback1 })
end

return function(p1, p2, Current, p3, p4) --[[ Line: 255 | Named "useNativePurchaseFinishedListener" ]]
	-- upvalues: FFlagEnableHeadlessSubscriptionNativePurchaseCancelCallbackModule (copy), useNativePurchaseFinishedListenerWithCancelCallback (copy), useNativePurchaseFinishedListenerLegacy (copy)
	if FFlagEnableHeadlessSubscriptionNativePurchaseCancelCallbackModule then
		useNativePurchaseFinishedListenerWithCancelCallback(p1, p2, Current, p3, p4)
		
		return
	else
		useNativePurchaseFinishedListenerLegacy(p1, p2, p3, p4)
	end
end