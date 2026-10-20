local Parent = script.Parent.Parent
local PromiseModule = require(Parent.Promise)
local MessageBus = require(Parent.MessageBus).MessageBus
local TModule = require(Parent.t)
local _ = require(script.Parent.AuthenticationProtocolTypes)
local AuthProviders = { MSDK = "MSDK" }
local AuthMethods = { WECHAT = "WeChat", QQ = "QQ", NONE = "None" }
local config = {
	[AuthProviders.MSDK] = {
		[0] = "",
		[2000] = "Authentication.Login.WeChat.NotInstalled",
		[2001] = "Authentication.Login.Label.WeChatVersionNotSupported",
		[2002] = "Authentication.Login.Label.WeChatUserCancel",
		[2004] = "Authentication.Login.Response.TencentLoginFailurePleaseTryAgain",
		[1001] = "Authentication.Login.Label.QQUserCancel",
		[1002] = "Authentication.Login.Response.TencentLoginFailurePleaseTryAgain"
	}
}
local config1 = {
	[AuthProviders.MSDK] = "Authentication.Login.Response.TencentLoginFailurePleaseTryAgain"
}
local AuthenticationProtocolModule = {
	AuthProviders = AuthProviders,
	AuthMethods = AuthMethods,
	AUTH_REQUEST_DESCRIPTOR = {
		mid = MessageBus.getMessageId("Authentication", "authRequest"),
		validateParams = TModule.strictInterface({
			authProvider = TModule.valueOf(AuthProviders),
			authMethod = TModule.valueOf(AuthMethods)
		})
	},
	AUTH_RESPONSE_DESCRIPTORS = {
		[AuthProviders.MSDK] = {
			mid = MessageBus.getMessageId("Authentication", "MSDKAuthResponse"),
			validateParams = TModule.strictInterface({
				platform = TModule.valueOf({
					PC = "Win32",
					Mac = "MacOS",
					Android = "Android",
					IOS = "iOS"
				}),
				status = TModule.number,
				tokenAuthBody = TModule.optional(TModule.strictInterface({
					openId = TModule.string,
					accessToken = TModule.string,
					refreshToken = TModule.string,
					accessTokenExpiry = TModule.number,
					refreshTokenExpiry = TModule.number,
					channelId = TModule.number
				}))
			})
		}
	}
}
AuthenticationProtocolModule.__index = AuthenticationProtocolModule

function AuthenticationProtocolModule.new()
	-- upvalues: MessageBus (copy), AuthenticationProtocolModule (copy)
	return (setmetatable({ subscriber = MessageBus.Subscriber.new() }, AuthenticationProtocolModule))
end

function AuthenticationProtocolModule:requestAuth(AuthProvider, AuthMethod)
	-- upvalues: PromiseModule (copy), config (copy), config1 (copy), MessageBus (copy)
	local NewPromise = PromiseModule.new(function(Callback, _)
		-- upvalues: self (copy), AuthProvider (copy), config (upval), config1 (upval)
		local AUTHRESPONSEDESCRIPTOR = self.AUTH_RESPONSE_DESCRIPTORS[AuthProvider]
		self.subscriber:subscribe(AUTHRESPONSEDESCRIPTOR, function(p1)
			-- upvalues: self (upval), AUTHRESPONSEDESCRIPTOR (copy), AuthProvider (upval), config (upval), config1 (upval), Callback (copy)
			self.subscriber:unsubscribe(AUTHRESPONSEDESCRIPTOR)
			Callback(if AuthProvider == self.AuthProviders.MSDK then {
				statusCode = p1.status,
				tokenAuthBody = p1.tokenAuthBody,
				errMessageKey = config[AuthProvider][p1.status] or config1[AuthProvider]
			} else nil)
		end)
	end)
	MessageBus.publish(self.AUTH_REQUEST_DESCRIPTOR, { authProvider = AuthProvider, authMethod = AuthMethod })
	
	return NewPromise
end

function AuthenticationProtocolModule.listenWebAuthResponset(p1, MSDK)
	-- upvalues: PromiseModule (copy), config (copy), config1 (copy)
	return (PromiseModule.new(function(Callback, _)
		-- upvalues: p1 (copy), MSDK (copy), config (upval), config1 (upval)
		local AUTHRESPONSEDESCRIPTOR = p1.AUTH_RESPONSE_DESCRIPTORS[MSDK]
		p1.subscriber:subscribe(AUTHRESPONSEDESCRIPTOR, function(p2)
			-- upvalues: p1 (upval), AUTHRESPONSEDESCRIPTOR (copy), MSDK (upval), config (upval), config1 (upval), Callback (copy)
			p1.subscriber:unsubscribe(AUTHRESPONSEDESCRIPTOR)
			Callback(if MSDK == p1.AuthProviders.MSDK then {
				statusCode = p2.status,
				tokenAuthBody = p2.tokenAuthBody,
				errMessageKey = config[MSDK][p2.status] or config1[MSDK]
			} else nil)
		end)
	end))
end

AuthenticationProtocolModule.default = AuthenticationProtocolModule.new()

return AuthenticationProtocolModule