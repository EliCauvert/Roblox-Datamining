local httpService = game:GetService("HttpService")
local parent = script.Parent.Parent
local messageBus = require(parent.MessageBus).MessageBus
local tModule = require(parent.t)
local promiseModule = require(parent.Promise)
local _ = require(script.Parent.CredentialsProtocolTypes)
local constantsModule = require(script.Parent.Constants)
local normalizeUnifiedGetCredentialsResponseModule = require(script.Parent.normalizeUnifiedGetCredentialsResponse)
local fFlagLuaAppNormalizeUnifiedPasskeyResponseModule = require(script.Parent.Flags.FFlagLuaAppNormalizeUnifiedPasskeyResponse)
local fFlagCacheCredentialsProtocolIsAvailableModule = require(script.Parent.Flags.FFlagCacheCredentialsProtocolIsAvailable)
local credentialsTypes = constantsModule.CredentialsTypes

local function _(p1)
	return if p1.isAvailable == nil then if p1.FIDO2 == nil then if p1.password == nil then if p1.iosKeychainPassword == nil then p1.keystore ~= nil else true else true else true else true
end

local var1 = tModule.strictInterface({
	keyType = tModule.optional(tModule.string),
	publicKey = tModule.interface({
		challenge = tModule.string,
		timeout = tModule.optional(tModule.number),
		rpId = tModule.optional(tModule.string),
		allowCredentials = tModule.optional(tModule.table),
		userVerification = tModule.optional(tModule.string),
		attestation = tModule.optional(tModule.string),
		extensions = tModule.optional(tModule.table)
	}),
	deviceBoundOnly = tModule.optional(tModule.boolean)
})
local t = {
	[credentialsTypes.FIDO2] = tModule.strictInterface({ credentialType = tModule.string, parameters = var1 }),
	[credentialsTypes.all] = tModule.strictInterface({
		FIDO2 = tModule.optional(var1),
		password = tModule.optional(tModule.strictInterface({ username = tModule.optional(tModule.string) }))
	}),
	[credentialsTypes.iosKeychainPassword] = tModule.strictInterface({
		credentialType = tModule.string,
		parameters = tModule.interface({ server = tModule.optional(tModule.string) })
	}),
	[credentialsTypes.keystore] = tModule.strictInterface({
		credentialType = tModule.string,
		parameters = tModule.interface({
			server = tModule.optional(tModule.string),
			key = tModule.optional(tModule.string)
		})
	})
}
local var2 = tModule.strictInterface({
	id = tModule.optional(tModule.string),
	rawId = tModule.optional(tModule.string),
	type = tModule.optional(tModule.string),
	response = tModule.interface({
		authenticatorData = tModule.string,
		clientDataJSON = tModule.string,
		signature = tModule.string,
		userHandle = tModule.optional(tModule.string)
	}),
	errorCode = tModule.optional(tModule.string),
	errorMsg = tModule.optional(tModule.string)
})
local var3 = tModule.strictInterface({
	credentialType = tModule.string,
	response = tModule.union(var2, tModule.strictInterface({
		username = tModule.optional(tModule.string),
		password = tModule.optional(tModule.string),
		errorCode = tModule.optional(tModule.string),
		errorMsg = tModule.optional(tModule.string)
	}))
})
local t_1 = {
	[credentialsTypes.FIDO2] = var2,
	[credentialsTypes.all] = if fFlagLuaAppNormalizeUnifiedPasskeyResponseModule then tModule.union(var3, var2) else var3,
	[credentialsTypes.iosKeychainPassword] = tModule.array(tModule.strictInterface({
		experimentGroup = tModule.optional(tModule.string),
		username = tModule.optional(tModule.string),
		userId = tModule.optional(tModule.string),
		password = tModule.optional(tModule.string),
		errorCode = tModule.optional(tModule.string),
		errorMsg = tModule.optional(tModule.string)
	})),
	[credentialsTypes.keystore] = tModule.array(tModule.strictInterface({
		experimentGroup = tModule.optional(tModule.string),
		username = tModule.optional(tModule.string),
		userId = tModule.optional(tModule.string),
		password = tModule.optional(tModule.string),
		errorCode = tModule.optional(tModule.string),
		errorMsg = tModule.optional(tModule.string)
	}))
}
local t_2 = {
	[credentialsTypes.FIDO2] = tModule.strictInterface({
		credentialType = tModule.string,
		parameters = tModule.interface({
			keyType = tModule.optional(tModule.string),
			isSilentPasskeyUpgrade = tModule.optional(tModule.boolean),
			publicKey = tModule.interface({
				rp = tModule.interface({ name = tModule.string, id = tModule.string }),
				user = tModule.interface({
					name = tModule.string,
					displayName = tModule.string,
					id = tModule.string
				}),
				challenge = tModule.string,
				pubKeyCredParams = tModule.optional(tModule.table),
				timeout = tModule.optional(tModule.number),
				excludeCredentials = tModule.optional(tModule.table),
				authenticationSelection = tModule.optional(tModule.table),
				attestation = tModule.optional(tModule.string),
				extensions = tModule.optional(tModule.table)
			})
		})
	}),
	[credentialsTypes.password] = tModule.strictInterface({
		credentialType = tModule.string,
		parameters = tModule.strictInterface({ username = tModule.string, password = tModule.string })
	}),
	[credentialsTypes.iosKeychainPassword] = tModule.strictInterface({
		credentialType = tModule.string,
		parameters = tModule.strictInterface({
			server = tModule.string,
			username = tModule.string,
			userId = tModule.string,
			password = tModule.string,
			experimentGroup = tModule.optional(tModule.string)
		})
	}),
	[credentialsTypes.keystore] = tModule.strictInterface({
		credentialType = tModule.string,
		parameters = tModule.strictInterface({
			server = tModule.string,
			key = tModule.optional(tModule.string),
			username = tModule.string,
			userId = tModule.string,
			password = tModule.string,
			experimentGroup = tModule.optional(tModule.string)
		})
	})
}
local t_3 = {
	[credentialsTypes.FIDO2] = tModule.strictInterface({
		id = tModule.optional(tModule.string),
		rawId = tModule.optional(tModule.string),
		type = tModule.optional(tModule.string),
		response = tModule.interface({
			clientDataJSON = tModule.string,
			attestationObject = tModule.string
		}),
		authenticatorAttachment = tModule.optional(tModule.string),
		clientExtensionResults = tModule.optional(tModule.table),
		errorCode = tModule.optional(tModule.string),
		errorMsg = tModule.optional(tModule.string)
	}),
	[credentialsTypes.password] = tModule.strictInterface({
		errorCode = tModule.optional(tModule.string),
		errorMsg = tModule.optional(tModule.string)
	}),
	[credentialsTypes.iosKeychainPassword] = tModule.strictInterface({
		errorCode = tModule.optional(tModule.string),
		errorMsg = tModule.optional(tModule.string)
	}),
	[credentialsTypes.keystore] = tModule.strictInterface({
		errorCode = tModule.optional(tModule.string),
		errorMsg = tModule.optional(tModule.string)
	})
}
local t_4 = {
	CredentialsTypes = credentialsTypes,
	GET_CREDENTIALS_REQUEST_DESCRIPTOR = {
		[credentialsTypes.FIDO2] = {
			mid = messageBus.getMessageId("Credentials", "getCredentialsRequest"),
			validateParams = t[credentialsTypes.FIDO2]
		},
		[credentialsTypes.all] = {
			mid = messageBus.getMessageId("Credentials", "getCredentialsRequest"),
			validateParams = t[credentialsTypes.all]
		},
		[credentialsTypes.iosKeychainPassword] = {
			mid = messageBus.getMessageId("Credentials", "getCredentialsRequest"),
			validateParams = t[credentialsTypes.iosKeychainPassword]
		},
		[credentialsTypes.keystore] = {
			mid = messageBus.getMessageId("Credentials", "getCredentialsRequest"),
			validateParams = t[credentialsTypes.keystore]
		}
	},
	GET_CREDENTIALS_RESPONSE_DESCRIPTOR = {
		[credentialsTypes.FIDO2] = {
			mid = messageBus.getMessageId("Credentials", "getCredentialsResponse"),
			validateParams = t_1[credentialsTypes.FIDO2]
		},
		[credentialsTypes.all] = {
			mid = messageBus.getMessageId("Credentials", "getCredentialsResponse"),
			validateParams = t_1[credentialsTypes.all]
		},
		[credentialsTypes.iosKeychainPassword] = {
			mid = messageBus.getMessageId("Credentials", "getCredentialsResponse"),
			validateParams = t_1[credentialsTypes.iosKeychainPassword]
		},
		[credentialsTypes.keystore] = {
			mid = messageBus.getMessageId("Credentials", "getCredentialsResponse"),
			validateParams = t_1[credentialsTypes.keystore]
		}
	},
	DELETE_IOS_KEYCHAIN_CREDENTIALS_REQUEST_DESCRIPTOR = {
		[credentialsTypes.iosKeychainPassword] = {
			mid = messageBus.getMessageId("Credentials", "deleteIosKeychainCredentialsRequest"),
			validateParams = tModule.strictInterface({
				credentialType = tModule.string,
				parameters = tModule.strictInterface({ server = tModule.string })
			})
		}
	},
	DELETE_KEYSTORE_CREDENTIALS_REQUEST_DESCRIPTOR = {
		[credentialsTypes.keystore] = {
			mid = messageBus.getMessageId("Credentials", "deleteKeystoreCredentialsRequest"),
			validateParams = tModule.strictInterface({
				credentialType = tModule.string,
				parameters = tModule.strictInterface({
					server = tModule.string,
					key = tModule.optional(tModule.string)
				})
			})
		}
	},
	DELETE_IOS_KEYCHAIN_CREDENTIALS_RESPONSE_DESCRIPTOR = {
		[credentialsTypes.iosKeychainPassword] = {
			mid = messageBus.getMessageId("Credentials", "deleteIosKeychainCredentialsResponse"),
			validateParams = tModule.strictInterface({
				credentialType = tModule.string,
				response = tModule.array(tModule.strictInterface({
					errorCode = tModule.optional(tModule.string),
					errorMsg = tModule.optional(tModule.string)
				}))
			})
		}
	},
	DELETE_KEYSTORE_CREDENTIALS_RESPONSE_DESCRIPTOR = {
		[credentialsTypes.keystore] = {
			mid = messageBus.getMessageId("Credentials", "deleteKeystoreCredentialsResponse"),
			validateParams = tModule.strictInterface({
				credentialType = tModule.string,
				response = tModule.array(tModule.strictInterface({
					errorCode = tModule.optional(tModule.string),
					errorMsg = tModule.optional(tModule.string)
				}))
			})
		}
	},
	REGISTER_CREDENTIALS_REQUEST_DESCRIPTOR = {
		[credentialsTypes.FIDO2] = {
			mid = messageBus.getMessageId("Credentials", "registerCredentialsRequest"),
			validateParams = t_2[credentialsTypes.FIDO2]
		},
		[credentialsTypes.password] = {
			mid = messageBus.getMessageId("Credentials", "registerCredentialsRequest"),
			validateParams = t_2[credentialsTypes.password]
		},
		[credentialsTypes.iosKeychainPassword] = {
			mid = messageBus.getMessageId("Credentials", "registerCredentialsRequest"),
			validateParams = t_2[credentialsTypes.iosKeychainPassword]
		},
		[credentialsTypes.keystore] = {
			mid = messageBus.getMessageId("Credentials", "registerCredentialsRequest"),
			validateParams = t_2[credentialsTypes.keystore]
		}
	},
	REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR = {
		[credentialsTypes.FIDO2] = {
			mid = messageBus.getMessageId("Credentials", "registerCredentialsResponse"),
			validateParams = t_3[credentialsTypes.FIDO2]
		},
		[credentialsTypes.password] = {
			mid = messageBus.getMessageId("Credentials", "registerCredentialsResponse"),
			validateParams = t_3[credentialsTypes.password]
		},
		[credentialsTypes.iosKeychainPassword] = {
			mid = messageBus.getMessageId("Credentials", "registerCredentialsResponse"),
			validateParams = t_3[credentialsTypes.iosKeychainPassword]
		},
		[credentialsTypes.keystore] = {
			mid = messageBus.getMessageId("Credentials", "registerCredentialsResponse"),
			validateParams = t_3[credentialsTypes.keystore]
		}
	},
	IS_AVAILABLE_REQUEST_DESCRIPTOR = {
		mid = messageBus.getMessageId("Credentials", "isAvailableRequest"),
		validateParams = tModule.strictInterface({
			credentialType = tModule.optional(tModule.valueOf(credentialsTypes))
		})
	},
	IS_AVAILABLE_RESPONSE_DESCRIPTOR = {
		mid = messageBus.getMessageId("Credentials", "isAvailableResponse"),
		validateParams = tModule.strictInterface({
			isAvailable = tModule.optional(tModule.boolean),
			supportsDeviceBoundOnly = tModule.optional(tModule.boolean),
			FIDO2 = tModule.optional(tModule.strictInterface({
				isAvailable = tModule.boolean,
				supportsDeviceBoundOnly = tModule.boolean,
				supportsSilentPasskeyUpgrade = tModule.optional(tModule.boolean),
				supportsPasskeyCreationOnDevice = tModule.optional(tModule.boolean)
			})),
			password = tModule.optional(tModule.strictInterface({ isAvailable = tModule.boolean })),
			iosKeychainPassword = tModule.optional(tModule.strictInterface({ isAvailable = tModule.boolean })),
			keystore = tModule.optional(tModule.strictInterface({ isAvailable = tModule.boolean }))
		})
	}
}
t_4.__index = t_4

function t_4.new()
	-- upvalues: messageBus (ref), t_4 (ref)
	return setmetatable({
		getCredentialsRequestInFlight = false,
		registerCredentialsRequestInFlight = false,
		deleteIosKeychainCredentialsRequestInFlight = false,
		deleteKeystoreCredentialsRequestInFlight = false,
		subscriber = messageBus.Subscriber.new()
	}, t_4)
end

function t_4:getCredentials(p1, p2, p3)
	-- upvalues: promiseModule (ref), fFlagLuaAppNormalizeUnifiedPasskeyResponseModule (ref), credentialsTypes (ref), normalizeUnifiedGetCredentialsResponseModule (ref), httpService (ref), messageBus (ref)
	if self.getCredentialsRequestInFlight then
		return promiseModule.reject()
	end
	local var4 = promiseModule.race({
		promiseModule.new(function(p4, _)
			-- upvalues: self (ref), p1 (ref), fFlagLuaAppNormalizeUnifiedPasskeyResponseModule (copy), credentialsTypes (copy), normalizeUnifiedGetCredentialsResponseModule (copy), httpService (copy)
			self.subscriber:subscribe(self.GET_CREDENTIALS_RESPONSE_DESCRIPTOR[p1], function(p5)
				-- upvalues: self (copy), p1 (copy), fFlagLuaAppNormalizeUnifiedPasskeyResponseModule (copy), credentialsTypes (copy), normalizeUnifiedGetCredentialsResponseModule (copy), httpService (copy), p4 (ref)
				self.subscriber:unsubscribe(self.GET_CREDENTIALS_RESPONSE_DESCRIPTOR[p1])
				self.getCredentialsRequestInFlight = false
				p4(httpService:JSONEncode(if fFlagLuaAppNormalizeUnifiedPasskeyResponseModule and p1 == credentialsTypes.all then normalizeUnifiedGetCredentialsResponseModule(p5) else p5))
			end)
		end),
		promiseModule.delay(p3):andThen(function()
			-- upvalues: self (ref), p1 (ref)
			self.subscriber:unsubscribe(self.GET_CREDENTIALS_RESPONSE_DESCRIPTOR[p1])
			self.getCredentialsRequestInFlight = false
		end)
	})
	self.getCredentialsRequestInFlight = true
	
	if p1 == credentialsTypes.all then
		messageBus.publish(self.GET_CREDENTIALS_REQUEST_DESCRIPTOR[p1], httpService:JSONDecode(p2))
		
		return var4
	end
	messageBus.publish(self.GET_CREDENTIALS_REQUEST_DESCRIPTOR[p1], {
		credentialType = p1,
		parameters = httpService:JSONDecode(p2)
	})
	
	return var4
end

function t_4:registerCredentials(p1, p2, p3)
	-- upvalues: promiseModule (ref), httpService (ref), messageBus (ref)
	if self.registerCredentialsRequestInFlight then
		return promiseModule.reject()
	end
	local var4 = promiseModule.race({
		promiseModule.new(function(p4, _)
			-- upvalues: self (ref), p1 (ref), httpService (copy)
			self.subscriber:subscribe(self.REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR[p1], function(p5)
				-- upvalues: self (copy), p1 (copy), httpService (copy), p4 (ref)
				self.subscriber:unsubscribe(self.REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR[p1])
				self.registerCredentialsRequestInFlight = false
				p4(httpService:JSONEncode(p5))
			end)
		end),
		promiseModule.delay(p3):andThen(function()
			-- upvalues: self (ref), p1 (ref)
			self.subscriber:unsubscribe(self.REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR[p1])
			self.registerCredentialsRequestInFlight = false
		end)
	})
	self.registerCredentialsRequestInFlight = true
	messageBus.publish(self.REGISTER_CREDENTIALS_REQUEST_DESCRIPTOR[p1], {
		credentialType = p1,
		parameters = httpService:JSONDecode(p2)
	})
	
	return var4
end

function t_4:deleteAllCredentialsFromiOSKeychain(p1, p2, p3)
	-- upvalues: promiseModule (ref), httpService (ref), messageBus (ref)
	if self.deleteIosKeychainCredentialsRequestInFlight then
		return promiseModule.reject()
	end
	local var4 = promiseModule.race({
		promiseModule.new(function(p4, _)
			-- upvalues: self (ref), p1 (ref), httpService (copy)
			self.subscriber:subscribe(self.DELETE_IOS_KEYCHAIN_CREDENTIALS_RESPONSE_DESCRIPTOR[p1], function(p5)
				-- upvalues: self (copy), p1 (copy), httpService (copy), p4 (ref)
				self.subscriber:unsubscribe(self.DELETE_IOS_KEYCHAIN_CREDENTIALS_RESPONSE_DESCRIPTOR[p1])
				self.deleteIosKeychainCredentialsRequestInFlight = false
				p4(httpService:JSONEncode(p5))
			end)
		end),
		promiseModule.delay(p3):andThen(function()
			-- upvalues: self (ref), p1 (ref)
			self.subscriber:unsubscribe(self.DELETE_IOS_KEYCHAIN_CREDENTIALS_RESPONSE_DESCRIPTOR[p1])
			self.deleteIosKeychainCredentialsRequestInFlight = false
		end)
	})
	self.deleteIosKeychainCredentialsRequestInFlight = true
	messageBus.publish(self.DELETE_IOS_KEYCHAIN_CREDENTIALS_REQUEST_DESCRIPTOR[p1], {
		credentialType = p1,
		parameters = httpService:JSONDecode(p2)
	})
	
	return var4
end

function t_4:deleteAllCredentialsFromKeystore(p1, p2, p3)
	-- upvalues: promiseModule (ref), httpService (ref), messageBus (ref)
	if self.deleteKeystoreCredentialsRequestInFlight then
		return promiseModule.reject()
	end
	local var4 = promiseModule.race({
		promiseModule.new(function(p4, _)
			-- upvalues: self (ref), p1 (ref), httpService (copy)
			self.subscriber:subscribe(self.DELETE_KEYSTORE_CREDENTIALS_RESPONSE_DESCRIPTOR[p1], function(p5)
				-- upvalues: self (copy), p1 (copy), httpService (copy), p4 (ref)
				self.subscriber:unsubscribe(self.DELETE_KEYSTORE_CREDENTIALS_RESPONSE_DESCRIPTOR[p1])
				self.deleteKeystoreCredentialsRequestInFlight = false
				p4(httpService:JSONEncode(p5))
			end)
		end),
		promiseModule.delay(p3):andThen(function()
			-- upvalues: self (ref), p1 (ref)
			self.subscriber:unsubscribe(self.DELETE_KEYSTORE_CREDENTIALS_RESPONSE_DESCRIPTOR[p1])
			self.deleteKeystoreCredentialsRequestInFlight = false
		end)
	})
	self.deleteKeystoreCredentialsRequestInFlight = true
	messageBus.publish(self.DELETE_KEYSTORE_CREDENTIALS_REQUEST_DESCRIPTOR[p1], {
		credentialType = p1,
		parameters = httpService:JSONDecode(p2)
	})
	
	return var4
end

function t_4:sendIsAvailableRequest(p1, p2)
	-- upvalues: promiseModule (ref), messageBus (ref)
	local var4 = promiseModule.race({
		promiseModule.new(function(p3, _)
			-- upvalues: self (ref)
			self.subscriber:subscribe(self.IS_AVAILABLE_RESPONSE_DESCRIPTOR, function(p4)
				-- upvalues: self (copy), p3 (ref)
				self.subscriber:unsubscribe(self.IS_AVAILABLE_RESPONSE_DESCRIPTOR)
				p3(p4)
			end)
		end),
		promiseModule.delay(p2):andThen(function()
			-- upvalues: self (ref), promiseModule (copy)
			self.subscriber:unsubscribe(self.IS_AVAILABLE_RESPONSE_DESCRIPTOR)
			
			return promiseModule.resolve({ isAvailable = nil, supportsDeviceBoundOnly = nil })
		end)
	})
	messageBus.publish(self.IS_AVAILABLE_REQUEST_DESCRIPTOR, { credentialType = p1 })
	
	return var4
end

function t_4:isAvailable(p1, p2)
	-- upvalues: fFlagCacheCredentialsProtocolIsAvailableModule (ref), promiseModule (ref)
	if not fFlagCacheCredentialsProtocolIsAvailableModule then
		return self:sendIsAvailableRequest(p1, p2)
	end
	local isAvailableCache = self.isAvailableCache
	
	if isAvailableCache ~= nil and os.clock() - isAvailableCache.clock < 30 then
		return promiseModule.resolve(isAvailableCache.result)
	elseif self.isAvailableRequest == nil then
		local var4 = self:sendIsAvailableRequest(p1, p2)
		self.isAvailableRequest = var4
		
		return var4:andThen(function(p3)
			-- upvalues: self (ref)
			self.isAvailableRequest = nil
			
			if if p3.isAvailable == nil then if p3.FIDO2 == nil then if p3.password == nil then if p3.iosKeychainPassword == nil then p3.keystore ~= nil else true else true else true else true then
				self.isAvailableCache = { result = p3, clock = os.clock() }
			end
			return p3
		end):catch(function(p3)
			-- upvalues: self (ref), promiseModule (copy)
			self.isAvailableRequest = nil
			
			return promiseModule.reject(p3)
		end)
	end
	return self.isAvailableRequest
end

t_4.default = t_4.new()

return t_4