local deepLink = script:FindFirstAncestor("DeepLink")
local signalsModule = require(deepLink.Parent.Signals)
local deepLinkLuaPostAuthReceiverStatusModule = require(deepLink.Enums.DeepLinkLuaPostAuthReceiverStatus)

return signalsModule.createComputed(function() --[[ line: 7 | named "createDeepLinkConnectionStore" ]]
	-- upvalues: signalsModule (ref), deepLinkLuaPostAuthReceiverStatusModule (ref)
	local var3, var4 = signalsModule.createSignal(nil)
	local var5, var6 = signalsModule.createSignal(deepLinkLuaPostAuthReceiverStatusModule.Disconnected)
	
	return {
		setDeepLinkLuaPostAuthReceiverStatus = function(value, p0) --[[ line: 15 ]]
			-- upvalues: deepLinkLuaPostAuthReceiverStatusModule (copy), var4 (ref), var6 (ref)
			if value ~= deepLinkLuaPostAuthReceiverStatusModule.Ready then
				var4(nil)
			elseif p0 then
				var4(p0)
			end
			var6(value)
		end,
		getDeepLinkLuaPostAuthReceiverStatus = var5,
		setLastDetectedPostAuthUrl = var4,
		getLastDetectedPostAuthUrl = var3
	}
end)