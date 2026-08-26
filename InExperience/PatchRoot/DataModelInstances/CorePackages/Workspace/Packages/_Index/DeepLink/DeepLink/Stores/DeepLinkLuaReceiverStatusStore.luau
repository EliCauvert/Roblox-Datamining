local deepLink = script:FindFirstAncestor("DeepLink")
local signalsModule = require(deepLink.Parent.Signals)
local deepLinkLuaPostAuthReceiverStatusModule = require(deepLink.Enums.DeepLinkLuaPostAuthReceiverStatus)

return signalsModule.createComputed(function()
	-- upvalues: signalsModule (ref), deepLinkLuaPostAuthReceiverStatusModule (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	local var3, var4 = signalsModule.createSignal(deepLinkLuaPostAuthReceiverStatusModule.Disconnected)
	
	return {
		setDeepLinkLuaPostAuthReceiverStatus = function(value, p1)
			-- upvalues: deepLinkLuaPostAuthReceiverStatusModule (copy), var2 (ref), var4 (ref)
			if value ~= deepLinkLuaPostAuthReceiverStatusModule.Ready then
				var2(nil)
			elseif p1 then
				var2(p1)
			end
			var4(value)
		end,
		getDeepLinkLuaPostAuthReceiverStatus = var3,
		setLastDetectedPostAuthUrl = var2,
		getLastDetectedPostAuthUrl = var1
	}
end)