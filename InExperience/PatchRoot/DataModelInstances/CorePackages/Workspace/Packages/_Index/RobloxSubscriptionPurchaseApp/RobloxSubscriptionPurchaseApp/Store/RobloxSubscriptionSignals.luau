local playersService = game:GetService("Players")
local signalsModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.Signals)
local AXSubscriptionSignalsPlayersServiceOverride = game:DefineFastFlag("AXSubscriptionSignalsPlayersServiceOverride", false)
local var3 = nil
local var4 = nil

local function _() --[[ line: 28 | named "getPlayersService" ]]
	-- upvalues: AXSubscriptionSignalsPlayersServiceOverride (ref), var4 (write), playersService (ref)
	return if AXSubscriptionSignalsPlayersServiceOverride and var4 ~= nil then var4 else playersService
end

local var5 = function() --[[ line: 35 ]]
	-- upvalues: AXSubscriptionSignalsPlayersServiceOverride (ref), var4 (write), playersService (ref), signalsModule (ref)
	local var6 = if AXSubscriptionSignalsPlayersServiceOverride and var4 ~= nil then var4 else playersService
	var6 = var6.LocalPlayer
	local var7, var8 = signalsModule.createSignal(var6.HasRobloxSubscription == true)
	local var9, var10 = signalsModule.createSignal(false)
	local var11 = var6:GetPropertyChangedSignal("HasRobloxSubscription"):Connect(function() --[[ line: 43 ]]
		-- upvalues: var6 (ref), var7 (ref), var8 (ref), var10 (ref)
		local var12 = var6.HasRobloxSubscription == true
		local var13 = var7()
		var8(var12)
		
		if var12 and not var13 then
			var10(true)
		end
	end)
	
	return {
		getHasRobloxSubscription = var7,
		getGainedRobloxSubscriptionThisSession = var9,
		setHasRobloxSubscriptionForTesting = var8,
		setGainedRobloxSubscriptionThisSessionForTesting = var10,
		cleanup = function() --[[ line: 61 ]]
			-- upvalues: var11 (ref)
			if var11 then
				var11:Disconnect()
			end
		end
	}
end

return {
	get = function() --[[ line: 71 ]]
		-- upvalues: var3 (write), signalsModule (ref), var5 (ref)
		if var3 == nil then
			var3 = signalsModule.createComputed(var5)(false)
		end
		return var3
	end,
	setPlayersServiceForTesting = function(p0) --[[ line: 78 ]]
		-- upvalues: AXSubscriptionSignalsPlayersServiceOverride (ref), var4 (write)
		if AXSubscriptionSignalsPlayersServiceOverride then
			var4 = p0
		end
	end,
	cleanup = function() --[[ line: 84 ]]
		-- upvalues: var3 (write), var4 (write)
		var3 = nil
		var4 = nil
	end
}