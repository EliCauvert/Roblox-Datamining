local Players = game:GetService("Players")
local SignalsModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.Signals)
local AXSubscriptionSignalsPlayersServiceOverride = game:DefineFastFlag("AXSubscriptionSignalsPlayersServiceOverride", false)
local v1 = nil
local PlayersServiceForTesting = nil

local function _()
	-- upvalues: AXSubscriptionSignalsPlayersServiceOverride (copy), PlayersServiceForTesting (ref), Players (copy)
	return if AXSubscriptionSignalsPlayersServiceOverride and PlayersServiceForTesting ~= nil then PlayersServiceForTesting else Players
end

local function v6()
	-- upvalues: AXSubscriptionSignalsPlayersServiceOverride (copy), PlayersServiceForTesting (ref), Players (copy), SignalsModule (copy)
	local LocalPlayer = (if AXSubscriptionSignalsPlayersServiceOverride and PlayersServiceForTesting ~= nil then PlayersServiceForTesting else Players).LocalPlayer
	local Signal, Signal2 = SignalsModule.createSignal(LocalPlayer.HasRobloxSubscription == true)
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	local Connection = LocalPlayer:GetPropertyChangedSignal("HasRobloxSubscription"):Connect(function()
		-- upvalues: LocalPlayer (copy), Signal (copy), Signal2 (copy), Signal2_1 (copy)
		local IsHasRobloxSubscription = LocalPlayer.HasRobloxSubscription == true
		local SignalResult = Signal()
		Signal2(IsHasRobloxSubscription)
		
		if IsHasRobloxSubscription and not SignalResult then
			Signal2_1(true)
		end
	end)
	
	return {
		getHasRobloxSubscription = Signal,
		getGainedRobloxSubscriptionThisSession = Signal1,
		setHasRobloxSubscriptionForTesting = Signal2,
		setGainedRobloxSubscriptionThisSessionForTesting = Signal2_1,
		cleanup = function()
			-- upvalues: Connection (copy)
			if Connection then
				Connection:Disconnect()
			end
		end
	}
end

return {
	get = function()
		-- upvalues: v1 (ref), SignalsModule (copy), v6 (copy)
		if v1 == nil then
			v1 = SignalsModule.createComputed(v6)(false)
		end
		return v1
	end,
	setPlayersServiceForTesting = function(Value)
		-- upvalues: AXSubscriptionSignalsPlayersServiceOverride (copy), PlayersServiceForTesting (ref)
		if AXSubscriptionSignalsPlayersServiceOverride then
			PlayersServiceForTesting = Value
		end
	end,
	cleanup = function()
		-- upvalues: v1 (ref), PlayersServiceForTesting (ref)
		v1 = nil
		PlayersServiceForTesting = nil
	end
}