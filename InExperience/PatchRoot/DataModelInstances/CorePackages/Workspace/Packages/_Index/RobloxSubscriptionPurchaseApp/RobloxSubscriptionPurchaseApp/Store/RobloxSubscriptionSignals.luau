local playersService = game:GetService("Players")
local signalsModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.Signals)
local AXSubscriptionSignalsPlayersServiceOverride = game:DefineFastFlag("AXSubscriptionSignalsPlayersServiceOverride", false)
local var1 = nil
local var2 = nil

local function _()
	-- upvalues: AXSubscriptionSignalsPlayersServiceOverride (ref), var2 (write), playersService (ref)
	return if AXSubscriptionSignalsPlayersServiceOverride and var2 ~= nil then var2 else playersService
end

local var3 = function()
	-- upvalues: AXSubscriptionSignalsPlayersServiceOverride (ref), var2 (write), playersService (ref), signalsModule (ref)
	local var4 = if AXSubscriptionSignalsPlayersServiceOverride and var2 ~= nil then var2 else playersService
	var4 = var4.LocalPlayer
	local var5, var6 = signalsModule.createSignal(var4.HasRobloxSubscription == true)
	local var7, var8 = signalsModule.createSignal(false)
	local var9 = var4:GetPropertyChangedSignal("HasRobloxSubscription"):Connect(function()
		-- upvalues: var4 (ref), var5 (ref), var6 (ref), var8 (ref)
		local var10 = var4.HasRobloxSubscription == true
		local var11 = var5()
		var6(var10)
		
		if var10 and not var11 then
			var8(true)
		end
	end)
	
	return {
		getHasRobloxSubscription = var5,
		getGainedRobloxSubscriptionThisSession = var7,
		setHasRobloxSubscriptionForTesting = var6,
		setGainedRobloxSubscriptionThisSessionForTesting = var8,
		cleanup = function()
			-- upvalues: var9 (ref)
			if var9 then
				var9:Disconnect()
			end
		end
	}
end

return {
	get = function()
		-- upvalues: var1 (write), signalsModule (ref), var3 (ref)
		if var1 == nil then
			var1 = signalsModule.createComputed(var3)(false)
		end
		return var1
	end,
	setPlayersServiceForTesting = function(p1)
		-- upvalues: AXSubscriptionSignalsPlayersServiceOverride (ref), var2 (write)
		if AXSubscriptionSignalsPlayersServiceOverride then
			var2 = p1
		end
	end,
	cleanup = function()
		-- upvalues: var1 (write), var2 (write)
		var1 = nil
		var2 = nil
	end
}