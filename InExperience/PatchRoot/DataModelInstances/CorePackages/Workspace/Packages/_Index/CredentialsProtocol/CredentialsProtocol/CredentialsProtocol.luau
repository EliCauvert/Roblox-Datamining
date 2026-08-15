local httpService = game:GetService("HttpService")
local parent = script.Parent.Parent
local messageBus = require(parent.MessageBus).MessageBus
local tModule = require(parent.t)
local promiseModule = require(parent.Promise)
local _ = require(script.Parent.CredentialsProtocolTypes)
local constantsModule = require(script.Parent.Constants)
local normalizeUnifiedGetCredentialsResponseModule = require(script.Parent.normalizeUnifiedGetCredentialsResponse)
local fFlagLuaAppNormalizeUnifiedPasskeyResponseModule = require(script.Parent.Flags.FFlagLuaAppNormalizeUnifiedPasskeyResponse)
local credentialsTypes = constantsModule.CredentialsTypes
local var6 = tModule.strictInterface({
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
	[credentialsTypes.FIDO2] = tModule.strictInterface({ credentialType = tModule.string, parameters = var6 }),
	[credentialsTypes.all] = tModule.strictInterface({
		FIDO2 = tModule.optional(var6),
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
local var8 = tModule.strictInterface({
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
local var9 = tModule.strictInterface({
	credentialType = tModule.string,
	response = tModule.union(var8, tModule.strictInterface({
		username = tModule.optional(tModule.string),
		password = tModule.optional(tModule.string),
		errorCode = tModule.optional(tModule.string),
		errorMsg = tModule.optional(tModule.string)
	}))
})
local t_1 = {
	[credentialsTypes.FIDO2] = var8,
	[credentialsTypes.all] = if fFlagLuaAppNormalizeUnifiedPasskeyResponseModule then tModule.union(var9, var8) else var9,
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

function t_4.new() --[[ line: 413 ]]
	-- upvalues: messageBus (ref), t_4 (ref)
	return setmetatable({
		getCredentialsRequestInFlight = false,
		registerCredentialsRequestInFlight = false,
		deleteIosKeychainCredentialsRequestInFlight = false,
		deleteKeystoreCredentialsRequestInFlight = false,
		subscriber = messageBus.Subscriber.new()
	}, t_4)
end

function t_4:getCredentials(p0, p1, p2) --[[ line: 427 ]]
	-- upvalues: promiseModule (ref), fFlagLuaAppNormalizeUnifiedPasskeyResponseModule (ref), credentialsTypes (ref), normalizeUnifiedGetCredentialsResponseModule (ref), httpService (ref), messageBus (ref)
	if self.getCredentialsRequestInFlight then
		return promiseModule.reject()
	end
	local var14 = promiseModule.race({
		promiseModule.new(function(p3, _) --[[ line: 431 ]]
			-- upvalues: self (ref), p0 (ref), fFlagLuaAppNormalizeUnifiedPasskeyResponseModule (copy), credentialsTypes (copy), normalizeUnifiedGetCredentialsResponseModule (copy), httpService (copy)
			self.subscriber:subscribe(self.GET_CREDENTIALS_RESPONSE_DESCRIPTOR[p0], function(p4) --[[ line: 432 ]]
				-- upvalues: self (copy), p0 (copy), fFlagLuaAppNormalizeUnifiedPasskeyResponseModule (copy), credentialsTypes (copy), normalizeUnifiedGetCredentialsResponseModule (copy), httpService (copy), p3 (ref)
				self.subscriber:unsubscribe(self.GET_CREDENTIALS_RESPONSE_DESCRIPTOR[p0])
				self.getCredentialsRequestInFlight = false
				p3(httpService:JSONEncode(if fFlagLuaAppNormalizeUnifiedPasskeyResponseModule and p0 == credentialsTypes.all then normalizeUnifiedGetCredentialsResponseModule(p4) else p4))
			end)
		end),
		promiseModule.delay(p2):andThen(function() --[[ line: 443 ]]
			-- upvalues: self (ref), p0 (ref)
			self.subscriber:unsubscribe(self.GET_CREDENTIALS_RESPONSE_DESCRIPTOR[p0])
			self.getCredentialsRequestInFlight = false
		end)
	})
	self.getCredentialsRequestInFlight = true
	
	if p0 == credentialsTypes.all then
		messageBus.publish(self.GET_CREDENTIALS_REQUEST_DESCRIPTOR[p0], httpService:JSONDecode(p1))
		
		return var14
	end
	messageBus.publish(self.GET_CREDENTIALS_REQUEST_DESCRIPTOR[p0], {
		credentialType = p0,
		parameters = httpService:JSONDecode(p1)
	})
	
	return var14
end

function t_4:registerCredentials(p5, p6, p7) --[[ line: 469 ]]
	-- upvalues: promiseModule (ref), httpService (ref), messageBus (ref)
	if self.registerCredentialsRequestInFlight then
		return promiseModule.reject()
	end
	local var15 = promiseModule.race({
		promiseModule.new(function(p8, _) --[[ line: 477 ]]
			-- upvalues: self (ref), p5 (ref), httpService (copy)
			self.subscriber:subscribe(self.REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR[p5], function(p9) --[[ line: 480 ]]
				-- upvalues: self (copy), p5 (copy), httpService (copy), p8 (ref)
				self.subscriber:unsubscribe(self.REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR[p5])
				self.registerCredentialsRequestInFlight = false
				p8(httpService:JSONEncode(p9))
			end)
		end),
		promiseModule.delay(p7):andThen(function() --[[ line: 488 ]]
			-- upvalues: self (ref), p5 (ref)
			self.subscriber:unsubscribe(self.REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR[p5])
			self.registerCredentialsRequestInFlight = false
		end)
	})
	self.registerCredentialsRequestInFlight = true
	messageBus.publish(self.REGISTER_CREDENTIALS_REQUEST_DESCRIPTOR[p5], {
		credentialType = p5,
		parameters = httpService:JSONDecode(p6)
	})
	
	return var15
end

function t_4:deleteAllCredentialsFromiOSKeychain(p10, p11, p12) --[[ line: 505 ]]
	-- upvalues: promiseModule (ref), httpService (ref), messageBus (ref)
	if self.deleteIosKeychainCredentialsRequestInFlight then
		return promiseModule.reject()
	end
	local var16 = promiseModule.race({
		promiseModule.new(function(p13, _) --[[ line: 513 ]]
			-- upvalues: self (ref), p10 (ref), httpService (copy)
			self.subscriber:subscribe(self.DELETE_IOS_KEYCHAIN_CREDENTIALS_RESPONSE_DESCRIPTOR[p10], function(p14) --[[ line: 516 ]]
				-- upvalues: self (copy), p10 (copy), httpService (copy), p13 (ref)
				self.subscriber:unsubscribe(self.DELETE_IOS_KEYCHAIN_CREDENTIALS_RESPONSE_DESCRIPTOR[p10])
				self.deleteIosKeychainCredentialsRequestInFlight = false
				p13(httpService:JSONEncode(p14))
			end)
		end),
		promiseModule.delay(p12):andThen(function() --[[ line: 524 ]]
			-- upvalues: self (ref), p10 (ref)
			self.subscriber:unsubscribe(self.DELETE_IOS_KEYCHAIN_CREDENTIALS_RESPONSE_DESCRIPTOR[p10])
			self.deleteIosKeychainCredentialsRequestInFlight = false
		end)
	})
	self.deleteIosKeychainCredentialsRequestInFlight = true
	messageBus.publish(self.DELETE_IOS_KEYCHAIN_CREDENTIALS_REQUEST_DESCRIPTOR[p10], {
		credentialType = p10,
		parameters = httpService:JSONDecode(p11)
	})
	
	return var16
end

function t_4:deleteAllCredentialsFromKeystore(p15, p16, p17) --[[ line: 543 ]]
	-- upvalues: promiseModule (ref), httpService (ref), messageBus (ref)
	if self.deleteKeystoreCredentialsRequestInFlight then
		return promiseModule.reject()
	end
	local var17 = promiseModule.race({
		promiseModule.new(function(p18, _) --[[ line: 551 ]]
			-- upvalues: self (ref), p15 (ref), httpService (copy)
			self.subscriber:subscribe(self.DELETE_KEYSTORE_CREDENTIALS_RESPONSE_DESCRIPTOR[p15], function(p19) --[[ line: 554 ]]
				-- upvalues: self (copy), p15 (copy), httpService (copy), p18 (ref)
				self.subscriber:unsubscribe(self.DELETE_KEYSTORE_CREDENTIALS_RESPONSE_DESCRIPTOR[p15])
				self.deleteKeystoreCredentialsRequestInFlight = false
				p18(httpService:JSONEncode(p19))
			end)
		end),
		promiseModule.delay(p17):andThen(function() --[[ line: 562 ]]
			-- upvalues: self (ref), p15 (ref)
			self.subscriber:unsubscribe(self.DELETE_KEYSTORE_CREDENTIALS_RESPONSE_DESCRIPTOR[p15])
			self.deleteKeystoreCredentialsRequestInFlight = false
		end)
	})
	self.deleteKeystoreCredentialsRequestInFlight = true
	messageBus.publish(self.DELETE_KEYSTORE_CREDENTIALS_REQUEST_DESCRIPTOR[p15], {
		credentialType = p15,
		parameters = httpService:JSONDecode(p16)
	})
	
	return var17
end

function t_4:isAvailable(p20, p21) --[[ line: 583 ]]
	-- upvalues: promiseModule (ref), messageBus (ref)
	local var18 = promiseModule.race({
		promiseModule.new(function(p22, _) --[[ line: 588 ]]
			-- upvalues: self (ref)
			self.subscriber:subscribe(self.IS_AVAILABLE_RESPONSE_DESCRIPTOR, function(p23) --[[ line: 589 ]]
				-- upvalues: self (copy), p22 (ref)
				self.subscriber:unsubscribe(self.IS_AVAILABLE_RESPONSE_DESCRIPTOR)
				p22(p23)
			end)
		end),
		promiseModule.delay(p21):andThen(function() --[[ line: 594 ]]
			-- upvalues: self (ref), promiseModule (copy)
			self.subscriber:unsubscribe(self.IS_AVAILABLE_RESPONSE_DESCRIPTOR)
			
			return promiseModule.resolve({ isAvailable = nil, supportsDeviceBoundOnly = nil })
		end)
	})
	messageBus.publish(self.IS_AVAILABLE_REQUEST_DESCRIPTOR, { credentialType = p20 })
	
	return var18
end

t_4.default = t_4.new()

return t_4