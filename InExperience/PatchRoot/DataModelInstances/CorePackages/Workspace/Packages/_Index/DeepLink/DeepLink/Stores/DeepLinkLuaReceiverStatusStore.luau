local DeepLink = script:FindFirstAncestor("DeepLink")
local SignalsModule = require(DeepLink.Parent.Signals)
local DeepLinkLuaPostAuthReceiverStatusModule = require(DeepLink.Enums.DeepLinkLuaPostAuthReceiverStatus)

return SignalsModule.createComputed(function() --[[ Line: 7 | Named "createDeepLinkConnectionStore" ]]
	-- upvalues: SignalsModule (copy), DeepLinkLuaPostAuthReceiverStatusModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local Signal1, Signal2_1 = SignalsModule.createSignal(DeepLinkLuaPostAuthReceiverStatusModule.Disconnected)
	
	return {
		setDeepLinkLuaPostAuthReceiverStatus = function(Ready, p1) --[[ Line: 15 ]]
			-- upvalues: DeepLinkLuaPostAuthReceiverStatusModule (upval), Signal2 (copy), Signal2_1 (copy)
			if Ready == DeepLinkLuaPostAuthReceiverStatusModule.Ready then
				if p1 then
					Signal2(p1)
				end
			else
				Signal2(nil)
			end
			Signal2_1(Ready)
		end,
		getDeepLinkLuaPostAuthReceiverStatus = Signal1,
		setLastDetectedPostAuthUrl = Signal2,
		getLastDetectedPostAuthUrl = Signal
	}
end)