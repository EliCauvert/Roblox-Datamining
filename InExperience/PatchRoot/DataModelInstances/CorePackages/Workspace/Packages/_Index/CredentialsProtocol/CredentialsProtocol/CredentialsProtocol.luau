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

local function _(p0) --[[ line: 46 | named "isNativeIsAvailableReply" ]]
	return if p0.isAvailable == nil then if p0.FIDO2 == nil then if p0.password == nil then if p0.iosKeychainPassword == nil then p0.keystore ~= nil else true else true else true else true
end

local var7 = tModule.strictInterface({
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
	[credentialsTypes.FIDO2] = tModule.strictInterface({ credentialType = tModule.string, parameters = var7 }),
	[credentialsTypes.all] = tModule.strictInterface({
		FIDO2 = tModule.optional(var7),
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
local var9 = tModule.strictInterface({
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
local var10 = tModule.strictInterface({
	credentialType = tModule.string,
	response = tModule.union(var9, tModule.strictInterface({
		username = tModule.optional(tModule.string),
		password = tModule.optional(tModule.string),
		errorCode = tModule.optional(tModule.string),
		errorMsg = tModule.optional(tModule.string)
	}))
})
local t_1 = {
	[credentialsTypes.FIDO2] = var9,
	[credentialsTypes.all] = if fFlagLuaAppNormalizeUnifiedPasskeyResponseModule then tModule.union(var10, var9) else var10,
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

function t_4.new() --[[ line: 436 ]]
	-- upvalues: messageBus (ref), t_4 (ref)
	return setmetatable({
		getCredentialsRequestInFlight = false,
		registerCredentialsRequestInFlight = false,
		deleteIosKeychainCredentialsRequestInFlight = false,
		deleteKeystoreCredentialsRequestInFlight = false,
		subscriber = messageBus.Subscriber.new()
	}, t_4)
end

function t_4:getCredentials(p1, p2, p3) --[[ line: 450 ]]
	-- upvalues: promiseModule (ref), fFlagLuaAppNormalizeUnifiedPasskeyResponseModule (ref), credentialsTypes (ref), normalizeUnifiedGetCredentialsResponseModule (ref), httpService (ref), messageBus (ref)
	if self.getCredentialsRequestInFlight then
		return promiseModule.reject()
	end
	local var15 = promiseModule.race({
		promiseModule.new(function(p4, _) --[[ line: 454 ]]
			-- upvalues: self (ref), p1 (ref), fFlagLuaAppNormalizeUnifiedPasskeyResponseModule (copy), credentialsTypes (copy), normalizeUnifiedGetCredentialsResponseModule (copy), httpService (copy)
			self.subscriber:subscribe(self.GET_CREDENTIALS_RESPONSE_DESCRIPTOR[p1], function(p5) --[[ line: 455 ]]
				-- upvalues: self (copy), p1 (copy), fFlagLuaAppNormalizeUnifiedPasskeyResponseModule (copy), credentialsTypes (copy), normalizeUnifiedGetCredentialsResponseModule (copy), httpService (copy), p4 (ref)
				self.subscriber:unsubscribe(self.GET_CREDENTIALS_RESPONSE_DESCRIPTOR[p1])
				self.getCredentialsRequestInFlight = false
				p4(httpService:JSONEncode(if fFlagLuaAppNormalizeUnifiedPasskeyResponseModule and p1 == credentialsTypes.all then normalizeUnifiedGetCredentialsResponseModule(p5) else p5))
			end)
		end),
		promiseModule.delay(p3):andThen(function() --[[ line: 466 ]]
			-- upvalues: self (ref), p1 (ref)
			self.subscriber:unsubscribe(self.GET_CREDENTIALS_RESPONSE_DESCRIPTOR[p1])
			self.getCredentialsRequestInFlight = false
		end)
	})
	self.getCredentialsRequestInFlight = true
	
	if p1 == credentialsTypes.all then
		messageBus.publish(self.GET_CREDENTIALS_REQUEST_DESCRIPTOR[p1], httpService:JSONDecode(p2))
		
		return var15
	end
	messageBus.publish(self.GET_CREDENTIALS_REQUEST_DESCRIPTOR[p1], {
		credentialType = p1,
		parameters = httpService:JSONDecode(p2)
	})
	
	return var15
end

function t_4:registerCredentials(p6, p7, p8) --[[ line: 492 ]]
	-- upvalues: promiseModule (ref), httpService (ref), messageBus (ref)
	if self.registerCredentialsRequestInFlight then
		return promiseModule.reject()
	end
	local var16 = promiseModule.race({
		promiseModule.new(function(p9, _) --[[ line: 500 ]]
			-- upvalues: self (ref), p6 (ref), httpService (copy)
			self.subscriber:subscribe(self.REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR[p6], function(p10) --[[ line: 503 ]]
				-- upvalues: self (copy), p6 (copy), httpService (copy), p9 (ref)
				self.subscriber:unsubscribe(self.REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR[p6])
				self.registerCredentialsRequestInFlight = false
				p9(httpService:JSONEncode(p10))
			end)
		end),
		promiseModule.delay(p8):andThen(function() --[[ line: 511 ]]
			-- upvalues: self (ref), p6 (ref)
			self.subscriber:unsubscribe(self.REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR[p6])
			self.registerCredentialsRequestInFlight = false
		end)
	})
	self.registerCredentialsRequestInFlight = true
	messageBus.publish(self.REGISTER_CREDENTIALS_REQUEST_DESCRIPTOR[p6], {
		credentialType = p6,
		parameters = httpService:JSONDecode(p7)
	})
	
	return var16
end

function t_4:deleteAllCredentialsFromiOSKeychain(p11, p12, p13) --[[ line: 528 ]]
	-- upvalues: promiseModule (ref), httpService (ref), messageBus (ref)
	if self.deleteIosKeychainCredentialsRequestInFlight then
		return promiseModule.reject()
	end
	local var17 = promiseModule.race({
		promiseModule.new(function(p14, _) --[[ line: 536 ]]
			-- upvalues: self (ref), p11 (ref), httpService (copy)
			self.subscriber:subscribe(self.DELETE_IOS_KEYCHAIN_CREDENTIALS_RESPONSE_DESCRIPTOR[p11], function(p15) --[[ line: 539 ]]
				-- upvalues: self (copy), p11 (copy), httpService (copy), p14 (ref)
				self.subscriber:unsubscribe(self.DELETE_IOS_KEYCHAIN_CREDENTIALS_RESPONSE_DESCRIPTOR[p11])
				self.deleteIosKeychainCredentialsRequestInFlight = false
				p14(httpService:JSONEncode(p15))
			end)
		end),
		promiseModule.delay(p13):andThen(function() --[[ line: 547 ]]
			-- upvalues: self (ref), p11 (ref)
			self.subscriber:unsubscribe(self.DELETE_IOS_KEYCHAIN_CREDENTIALS_RESPONSE_DESCRIPTOR[p11])
			self.deleteIosKeychainCredentialsRequestInFlight = false
		end)
	})
	self.deleteIosKeychainCredentialsRequestInFlight = true
	messageBus.publish(self.DELETE_IOS_KEYCHAIN_CREDENTIALS_REQUEST_DESCRIPTOR[p11], {
		credentialType = p11,
		parameters = httpService:JSONDecode(p12)
	})
	
	return var17
end

function t_4:deleteAllCredentialsFromKeystore(p16, p17, p18) --[[ line: 566 ]]
	-- upvalues: promiseModule (ref), httpService (ref), messageBus (ref)
	if self.deleteKeystoreCredentialsRequestInFlight then
		return promiseModule.reject()
	end
	local var18 = promiseModule.race({
		promiseModule.new(function(p19, _) --[[ line: 574 ]]
			-- upvalues: self (ref), p16 (ref), httpService (copy)
			self.subscriber:subscribe(self.DELETE_KEYSTORE_CREDENTIALS_RESPONSE_DESCRIPTOR[p16], function(p20) --[[ line: 577 ]]
				-- upvalues: self (copy), p16 (copy), httpService (copy), p19 (ref)
				self.subscriber:unsubscribe(self.DELETE_KEYSTORE_CREDENTIALS_RESPONSE_DESCRIPTOR[p16])
				self.deleteKeystoreCredentialsRequestInFlight = false
				p19(httpService:JSONEncode(p20))
			end)
		end),
		promiseModule.delay(p18):andThen(function() --[[ line: 585 ]]
			-- upvalues: self (ref), p16 (ref)
			self.subscriber:unsubscribe(self.DELETE_KEYSTORE_CREDENTIALS_RESPONSE_DESCRIPTOR[p16])
			self.deleteKeystoreCredentialsRequestInFlight = false
		end)
	})
	self.deleteKeystoreCredentialsRequestInFlight = true
	messageBus.publish(self.DELETE_KEYSTORE_CREDENTIALS_REQUEST_DESCRIPTOR[p16], {
		credentialType = p16,
		parameters = httpService:JSONDecode(p17)
	})
	
	return var18
end

function t_4:sendIsAvailableRequest(p21, p22) --[[ line: 607 ]]
	-- upvalues: promiseModule (ref), messageBus (ref)
	local var19 = promiseModule.race({
		promiseModule.new(function(p23, _) --[[ line: 612 ]]
			-- upvalues: self (ref)
			self.subscriber:subscribe(self.IS_AVAILABLE_RESPONSE_DESCRIPTOR, function(p24) --[[ line: 613 ]]
				-- upvalues: self (copy), p23 (ref)
				self.subscriber:unsubscribe(self.IS_AVAILABLE_RESPONSE_DESCRIPTOR)
				p23(p24)
			end)
		end),
		promiseModule.delay(p22):andThen(function() --[[ line: 618 ]]
			-- upvalues: self (ref), promiseModule (copy)
			self.subscriber:unsubscribe(self.IS_AVAILABLE_RESPONSE_DESCRIPTOR)
			
			return promiseModule.resolve({ isAvailable = nil, supportsDeviceBoundOnly = nil })
		end)
	})
	messageBus.publish(self.IS_AVAILABLE_REQUEST_DESCRIPTOR, { credentialType = p21 })
	
	return var19
end

function t_4:isAvailable(p25, p26) --[[ line: 639 ]]
	-- upvalues: fFlagCacheCredentialsProtocolIsAvailableModule (ref), promiseModule (ref)
	if not fFlagCacheCredentialsProtocolIsAvailableModule then
		return self:sendIsAvailableRequest(p25, p26)
	end
	local isAvailableCache = self.isAvailableCache
	
	if isAvailableCache ~= nil and os.clock() - isAvailableCache.clock < 30 then
		return promiseModule.resolve(isAvailableCache.result)
	elseif self.isAvailableRequest == nil then
		local var20 = self:sendIsAvailableRequest(p25, p26)
		self.isAvailableRequest = var20
		
		return var20:andThen(function(p28) --[[ line: 662 ]]
			-- upvalues: self (ref)
			self.isAvailableRequest = nil
			
			if if p28.isAvailable == nil then if p28.FIDO2 == nil then if p28.password == nil then if p28.iosKeychainPassword == nil then p28.keystore ~= nil else true else true else true else true then
				self.isAvailableCache = { result = p28, clock = os.clock() }
			end
			return p28
		end):catch(function(p27) --[[ line: 669 ]]
			-- upvalues: self (ref), promiseModule (copy)
			self.isAvailableRequest = nil
			
			return promiseModule.reject(p27)
		end)
	end
	return self.isAvailableRequest
end

t_4.default = t_4.new()

return t_4