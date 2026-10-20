local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(PrefilledDisplayName, SignUpVoucher, AuthMethod, ChannelId)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(PrefilledDisplayName, "string", "displayName")
	ArgCheckModule.isType(SignUpVoucher, "string", "voucher")
	ArgCheckModule.isType(AuthMethod, "string", "authMethod")
	ArgCheckModule.isType(ChannelId, "string", "channelId")
	
	return {
		prefilledDisplayName = PrefilledDisplayName,
		signUpVoucher = SignUpVoucher,
		authMethod = AuthMethod,
		channelId = ChannelId
	}
end)