local HttpService = game:GetService("HttpService")
local Parent = script.Parent.Parent
local MessageBus = require(Parent.MessageBus).MessageBus
local TModule = require(Parent.t)
local PromiseModule = require(Parent.Promise)
local _ = require(script.Parent.CredentialsProtocolTypes)
local NormalizeUnifiedGetCredentialsResponseModule = require(script.Parent.normalizeUnifiedGetCredentialsResponse)
local FFlagLuaAppNormalizeUnifiedPasskeyResponseModule = require(script.Parent.Flags.FFlagLuaAppNormalizeUnifiedPasskeyResponse)
local FFlagCacheCredentialsProtocolIsAvailableModule = require(script.Parent.Flags.FFlagCacheCredentialsProtocolIsAvailable)
local CredentialsTypes = require(script.Parent.Constants).CredentialsTypes

local function _(p1): boolean --[[ Line: 46 | Named "isNativeIsAvailableReply" ]]
	return p1.isAvailable ~= nil or (p1.FIDO2 ~= nil or (p1.password ~= nil or p1.iosKeychainPassword ~= nil)) or p1.keystore ~= nil
end

local StrictInterfaceResult = TModule.strictInterface({
	keyType = TModule.optional(TModule.string),
	publicKey = TModule.interface({
		challenge = TModule.string,
		timeout = TModule.optional(TModule.number),
		rpId = TModule.optional(TModule.string),
		allowCredentials = TModule.optional(TModule.table),
		userVerification = TModule.optional(TModule.string),
		attestation = TModule.optional(TModule.string),
		extensions = TModule.optional(TModule.table)
	}),
	deviceBoundOnly = TModule.optional(TModule.boolean)
})
local config = {
	[CredentialsTypes.FIDO2] = TModule.strictInterface({
		credentialType = TModule.string,
		parameters = StrictInterfaceResult
	}),
	[CredentialsTypes.all] = TModule.strictInterface({
		FIDO2 = TModule.optional(StrictInterfaceResult),
		password = TModule.optional(TModule.strictInterface({ username = TModule.optional(TModule.string) }))
	}),
	[CredentialsTypes.iosKeychainPassword] = TModule.strictInterface({
		credentialType = TModule.string,
		parameters = TModule.interface({ server = TModule.optional(TModule.string) })
	}),
	[CredentialsTypes.keystore] = TModule.strictInterface({
		credentialType = TModule.string,
		parameters = TModule.interface({
			server = TModule.optional(TModule.string),
			key = TModule.optional(TModule.string)
		})
	})
}
local StrictInterfaceResult1 = TModule.strictInterface({
	id = TModule.optional(TModule.string),
	rawId = TModule.optional(TModule.string),
	type = TModule.optional(TModule.string),
	response = TModule.interface({
		authenticatorData = TModule.string,
		clientDataJSON = TModule.string,
		signature = TModule.string,
		userHandle = TModule.optional(TModule.string)
	}),
	errorCode = TModule.optional(TModule.string),
	errorMsg = TModule.optional(TModule.string)
})
local StrictInterfaceResult11 = TModule.strictInterface({
	credentialType = TModule.string,
	response = TModule.union(StrictInterfaceResult1, TModule.strictInterface({
		username = TModule.optional(TModule.string),
		password = TModule.optional(TModule.string),
		errorCode = TModule.optional(TModule.string),
		errorMsg = TModule.optional(TModule.string)
	}))
})
local config1 = {
	[CredentialsTypes.FIDO2] = StrictInterfaceResult1,
	[CredentialsTypes.all] = if FFlagLuaAppNormalizeUnifiedPasskeyResponseModule then TModule.union(StrictInterfaceResult11, StrictInterfaceResult1) else StrictInterfaceResult11,
	[CredentialsTypes.iosKeychainPassword] = TModule.array(TModule.strictInterface({
		experimentGroup = TModule.optional(TModule.string),
		username = TModule.optional(TModule.string),
		userId = TModule.optional(TModule.string),
		password = TModule.optional(TModule.string),
		errorCode = TModule.optional(TModule.string),
		errorMsg = TModule.optional(TModule.string)
	})),
	[CredentialsTypes.keystore] = TModule.array(TModule.strictInterface({
		experimentGroup = TModule.optional(TModule.string),
		username = TModule.optional(TModule.string),
		userId = TModule.optional(TModule.string),
		password = TModule.optional(TModule.string),
		errorCode = TModule.optional(TModule.string),
		errorMsg = TModule.optional(TModule.string)
	}))
}
local config2 = {
	[CredentialsTypes.FIDO2] = TModule.strictInterface({
		credentialType = TModule.string,
		parameters = TModule.interface({
			keyType = TModule.optional(TModule.string),
			isSilentPasskeyUpgrade = TModule.optional(TModule.boolean),
			publicKey = TModule.interface({
				rp = TModule.interface({ name = TModule.string, id = TModule.string }),
				user = TModule.interface({
					name = TModule.string,
					displayName = TModule.string,
					id = TModule.string
				}),
				challenge = TModule.string,
				pubKeyCredParams = TModule.optional(TModule.table),
				timeout = TModule.optional(TModule.number),
				excludeCredentials = TModule.optional(TModule.table),
				authenticationSelection = TModule.optional(TModule.table),
				attestation = TModule.optional(TModule.string),
				extensions = TModule.optional(TModule.table)
			})
		})
	}),
	[CredentialsTypes.password] = TModule.strictInterface({
		credentialType = TModule.string,
		parameters = TModule.strictInterface({ username = TModule.string, password = TModule.string })
	}),
	[CredentialsTypes.iosKeychainPassword] = TModule.strictInterface({
		credentialType = TModule.string,
		parameters = TModule.strictInterface({
			server = TModule.string,
			username = TModule.string,
			userId = TModule.string,
			password = TModule.string,
			experimentGroup = TModule.optional(TModule.string)
		})
	}),
	[CredentialsTypes.keystore] = TModule.strictInterface({
		credentialType = TModule.string,
		parameters = TModule.strictInterface({
			server = TModule.string,
			key = TModule.optional(TModule.string),
			username = TModule.string,
			userId = TModule.string,
			password = TModule.string,
			experimentGroup = TModule.optional(TModule.string)
		})
	})
}
local config3 = {
	[CredentialsTypes.FIDO2] = TModule.strictInterface({
		id = TModule.optional(TModule.string),
		rawId = TModule.optional(TModule.string),
		type = TModule.optional(TModule.string),
		response = TModule.interface({
			clientDataJSON = TModule.string,
			attestationObject = TModule.string
		}),
		authenticatorAttachment = TModule.optional(TModule.string),
		clientExtensionResults = TModule.optional(TModule.table),
		errorCode = TModule.optional(TModule.string),
		errorMsg = TModule.optional(TModule.string)
	}),
	[CredentialsTypes.password] = TModule.strictInterface({
		errorCode = TModule.optional(TModule.string),
		errorMsg = TModule.optional(TModule.string)
	}),
	[CredentialsTypes.iosKeychainPassword] = TModule.strictInterface({
		errorCode = TModule.optional(TModule.string),
		errorMsg = TModule.optional(TModule.string)
	}),
	[CredentialsTypes.keystore] = TModule.strictInterface({
		errorCode = TModule.optional(TModule.string),
		errorMsg = TModule.optional(TModule.string)
	})
}
local CredentialsProtocolModule = {
	CredentialsTypes = CredentialsTypes,
	GET_CREDENTIALS_REQUEST_DESCRIPTOR = {
		[CredentialsTypes.FIDO2] = {
			mid = MessageBus.getMessageId("Credentials", "getCredentialsRequest"),
			validateParams = config[CredentialsTypes.FIDO2]
		},
		[CredentialsTypes.all] = {
			mid = MessageBus.getMessageId("Credentials", "getCredentialsRequest"),
			validateParams = config[CredentialsTypes.all]
		},
		[CredentialsTypes.iosKeychainPassword] = {
			mid = MessageBus.getMessageId("Credentials", "getCredentialsRequest"),
			validateParams = config[CredentialsTypes.iosKeychainPassword]
		},
		[CredentialsTypes.keystore] = {
			mid = MessageBus.getMessageId("Credentials", "getCredentialsRequest"),
			validateParams = config[CredentialsTypes.keystore]
		}
	},
	GET_CREDENTIALS_RESPONSE_DESCRIPTOR = {
		[CredentialsTypes.FIDO2] = {
			mid = MessageBus.getMessageId("Credentials", "getCredentialsResponse"),
			validateParams = config1[CredentialsTypes.FIDO2]
		},
		[CredentialsTypes.all] = {
			mid = MessageBus.getMessageId("Credentials", "getCredentialsResponse"),
			validateParams = config1[CredentialsTypes.all]
		},
		[CredentialsTypes.iosKeychainPassword] = {
			mid = MessageBus.getMessageId("Credentials", "getCredentialsResponse"),
			validateParams = config1[CredentialsTypes.iosKeychainPassword]
		},
		[CredentialsTypes.keystore] = {
			mid = MessageBus.getMessageId("Credentials", "getCredentialsResponse"),
			validateParams = config1[CredentialsTypes.keystore]
		}
	},
	DELETE_IOS_KEYCHAIN_CREDENTIALS_REQUEST_DESCRIPTOR = {
		[CredentialsTypes.iosKeychainPassword] = {
			mid = MessageBus.getMessageId("Credentials", "deleteIosKeychainCredentialsRequest"),
			validateParams = TModule.strictInterface({
				credentialType = TModule.string,
				parameters = TModule.strictInterface({ server = TModule.string })
			})
		}
	},
	DELETE_KEYSTORE_CREDENTIALS_REQUEST_DESCRIPTOR = {
		[CredentialsTypes.keystore] = {
			mid = MessageBus.getMessageId("Credentials", "deleteKeystoreCredentialsRequest"),
			validateParams = TModule.strictInterface({
				credentialType = TModule.string,
				parameters = TModule.strictInterface({
					server = TModule.string,
					key = TModule.optional(TModule.string)
				})
			})
		}
	},
	DELETE_IOS_KEYCHAIN_CREDENTIALS_RESPONSE_DESCRIPTOR = {
		[CredentialsTypes.iosKeychainPassword] = {
			mid = MessageBus.getMessageId("Credentials", "deleteIosKeychainCredentialsResponse"),
			validateParams = TModule.strictInterface({
				credentialType = TModule.string,
				response = TModule.array(TModule.strictInterface({
					errorCode = TModule.optional(TModule.string),
					errorMsg = TModule.optional(TModule.string)
				}))
			})
		}
	},
	DELETE_KEYSTORE_CREDENTIALS_RESPONSE_DESCRIPTOR = {
		[CredentialsTypes.keystore] = {
			mid = MessageBus.getMessageId("Credentials", "deleteKeystoreCredentialsResponse"),
			validateParams = TModule.strictInterface({
				credentialType = TModule.string,
				response = TModule.array(TModule.strictInterface({
					errorCode = TModule.optional(TModule.string),
					errorMsg = TModule.optional(TModule.string)
				}))
			})
		}
	},
	REGISTER_CREDENTIALS_REQUEST_DESCRIPTOR = {
		[CredentialsTypes.FIDO2] = {
			mid = MessageBus.getMessageId("Credentials", "registerCredentialsRequest"),
			validateParams = config2[CredentialsTypes.FIDO2]
		},
		[CredentialsTypes.password] = {
			mid = MessageBus.getMessageId("Credentials", "registerCredentialsRequest"),
			validateParams = config2[CredentialsTypes.password]
		},
		[CredentialsTypes.iosKeychainPassword] = {
			mid = MessageBus.getMessageId("Credentials", "registerCredentialsRequest"),
			validateParams = config2[CredentialsTypes.iosKeychainPassword]
		},
		[CredentialsTypes.keystore] = {
			mid = MessageBus.getMessageId("Credentials", "registerCredentialsRequest"),
			validateParams = config2[CredentialsTypes.keystore]
		}
	},
	REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR = {
		[CredentialsTypes.FIDO2] = {
			mid = MessageBus.getMessageId("Credentials", "registerCredentialsResponse"),
			validateParams = config3[CredentialsTypes.FIDO2]
		},
		[CredentialsTypes.password] = {
			mid = MessageBus.getMessageId("Credentials", "registerCredentialsResponse"),
			validateParams = config3[CredentialsTypes.password]
		},
		[CredentialsTypes.iosKeychainPassword] = {
			mid = MessageBus.getMessageId("Credentials", "registerCredentialsResponse"),
			validateParams = config3[CredentialsTypes.iosKeychainPassword]
		},
		[CredentialsTypes.keystore] = {
			mid = MessageBus.getMessageId("Credentials", "registerCredentialsResponse"),
			validateParams = config3[CredentialsTypes.keystore]
		}
	},
	IS_AVAILABLE_REQUEST_DESCRIPTOR = {
		mid = MessageBus.getMessageId("Credentials", "isAvailableRequest"),
		validateParams = TModule.strictInterface({
			credentialType = TModule.optional(TModule.valueOf(CredentialsTypes))
		})
	},
	IS_AVAILABLE_RESPONSE_DESCRIPTOR = {
		mid = MessageBus.getMessageId("Credentials", "isAvailableResponse"),
		validateParams = TModule.strictInterface({
			isAvailable = TModule.optional(TModule.boolean),
			supportsDeviceBoundOnly = TModule.optional(TModule.boolean),
			FIDO2 = TModule.optional(TModule.strictInterface({
				isAvailable = TModule.boolean,
				supportsDeviceBoundOnly = TModule.boolean,
				supportsSilentPasskeyUpgrade = TModule.optional(TModule.boolean),
				supportsPasskeyCreationOnDevice = TModule.optional(TModule.boolean)
			})),
			password = TModule.optional(TModule.strictInterface({ isAvailable = TModule.boolean })),
			iosKeychainPassword = TModule.optional(TModule.strictInterface({ isAvailable = TModule.boolean })),
			keystore = TModule.optional(TModule.strictInterface({ isAvailable = TModule.boolean }))
		})
	}
}
CredentialsProtocolModule.__index = CredentialsProtocolModule

function CredentialsProtocolModule.new() --[[ Line: 436 ]]
	-- upvalues: MessageBus (copy), CredentialsProtocolModule (copy)
	return (setmetatable({
		getCredentialsRequestInFlight = false,
		registerCredentialsRequestInFlight = false,
		deleteIosKeychainCredentialsRequestInFlight = false,
		deleteKeystoreCredentialsRequestInFlight = false,
		subscriber = MessageBus.Subscriber.new()
	}, CredentialsProtocolModule))
end

function CredentialsProtocolModule:getCredentials(All, Input, p1) --[[ Line: 450 ]]
	-- upvalues: PromiseModule (copy), FFlagLuaAppNormalizeUnifiedPasskeyResponseModule (copy), CredentialsTypes (copy), NormalizeUnifiedGetCredentialsResponseModule (copy), HttpService (copy), MessageBus (copy)
	if self.getCredentialsRequestInFlight then
		return PromiseModule.reject()
	end
	local RaceResult = PromiseModule.race({
		PromiseModule.new(function(Callback, _) --[[ Line: 454 ]]
			-- upvalues: self (copy), All (copy), FFlagLuaAppNormalizeUnifiedPasskeyResponseModule (upval), CredentialsTypes (upval), NormalizeUnifiedGetCredentialsResponseModule (upval), HttpService (upval)
			self.subscriber:subscribe(self.GET_CREDENTIALS_RESPONSE_DESCRIPTOR[All], function(p2) --[[ Line: 455 ]]
				-- upvalues: self (upval), All (upval), FFlagLuaAppNormalizeUnifiedPasskeyResponseModule (upval), CredentialsTypes (upval), NormalizeUnifiedGetCredentialsResponseModule (upval), HttpService (upval), Callback (copy)
				self.subscriber:unsubscribe(self.GET_CREDENTIALS_RESPONSE_DESCRIPTOR[All])
				self.getCredentialsRequestInFlight = false
				Callback((HttpService:JSONEncode(if FFlagLuaAppNormalizeUnifiedPasskeyResponseModule and All == CredentialsTypes.all then NormalizeUnifiedGetCredentialsResponseModule(p2) else p2)))
			end)
		end),
		PromiseModule.delay(p1):andThen(function() --[[ Line: 466 ]]
			-- upvalues: self (copy), All (copy)
			self.subscriber:unsubscribe(self.GET_CREDENTIALS_RESPONSE_DESCRIPTOR[All])
			self.getCredentialsRequestInFlight = false
		end)
	})
	self.getCredentialsRequestInFlight = true
	
	if All == CredentialsTypes.all then
		MessageBus.publish(self.GET_CREDENTIALS_REQUEST_DESCRIPTOR[All], HttpService:JSONDecode(Input))
		
		return RaceResult
	else
		MessageBus.publish(self.GET_CREDENTIALS_REQUEST_DESCRIPTOR[All], {
			credentialType = All,
			parameters = HttpService:JSONDecode(Input)
		})
		
		return RaceResult
	end
end

function CredentialsProtocolModule:registerCredentials(CredentialType, Input, p1) --[[ Line: 492 ]]
	-- upvalues: PromiseModule (copy), HttpService (copy), MessageBus (copy)
	if self.registerCredentialsRequestInFlight then
		return PromiseModule.reject()
	else
		local RaceResult = PromiseModule.race({
			PromiseModule.new(function(Callback, _) --[[ Line: 500 ]]
				-- upvalues: self (copy), CredentialType (copy), HttpService (upval)
				self.subscriber:subscribe(self.REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR[CredentialType], function(Input) --[[ Line: 503 ]]
					-- upvalues: self (upval), CredentialType (upval), HttpService (upval), Callback (copy)
					self.subscriber:unsubscribe(self.REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR[CredentialType])
					self.registerCredentialsRequestInFlight = false
					Callback((HttpService:JSONEncode(Input)))
				end)
			end),
			PromiseModule.delay(p1):andThen(function() --[[ Line: 511 ]]
				-- upvalues: self (copy), CredentialType (copy)
				self.subscriber:unsubscribe(self.REGISTER_CREDENTIALS_RESPONSE_DESCRIPTOR[CredentialType])
				self.registerCredentialsRequestInFlight = false
			end)
		})
		self.registerCredentialsRequestInFlight = true
		MessageBus.publish(self.REGISTER_CREDENTIALS_REQUEST_DESCRIPTOR[CredentialType], {
			credentialType = CredentialType,
			parameters = HttpService:JSONDecode(Input)
		})
		
		return RaceResult
	end
end

function CredentialsProtocolModule:deleteAllCredentialsFromiOSKeychain(CredentialType, Input, p1) --[[ Line: 528 ]]
	-- upvalues: PromiseModule (copy), HttpService (copy), MessageBus (copy)
	if self.deleteIosKeychainCredentialsRequestInFlight then
		return PromiseModule.reject()
	else
		local RaceResult = PromiseModule.race({
			PromiseModule.new(function(Callback, _) --[[ Line: 536 ]]
				-- upvalues: self (copy), CredentialType (copy), HttpService (upval)
				self.subscriber:subscribe(self.DELETE_IOS_KEYCHAIN_CREDENTIALS_RESPONSE_DESCRIPTOR[CredentialType], function(Input) --[[ Line: 539 ]]
					-- upvalues: self (upval), CredentialType (upval), HttpService (upval), Callback (copy)
					self.subscriber:unsubscribe(self.DELETE_IOS_KEYCHAIN_CREDENTIALS_RESPONSE_DESCRIPTOR[CredentialType])
					self.deleteIosKeychainCredentialsRequestInFlight = false
					Callback((HttpService:JSONEncode(Input)))
				end)
			end),
			PromiseModule.delay(p1):andThen(function() --[[ Line: 547 ]]
				-- upvalues: self (copy), CredentialType (copy)
				self.subscriber:unsubscribe(self.DELETE_IOS_KEYCHAIN_CREDENTIALS_RESPONSE_DESCRIPTOR[CredentialType])
				self.deleteIosKeychainCredentialsRequestInFlight = false
			end)
		})
		self.deleteIosKeychainCredentialsRequestInFlight = true
		MessageBus.publish(self.DELETE_IOS_KEYCHAIN_CREDENTIALS_REQUEST_DESCRIPTOR[CredentialType], {
			credentialType = CredentialType,
			parameters = HttpService:JSONDecode(Input)
		})
		
		return RaceResult
	end
end

function CredentialsProtocolModule:deleteAllCredentialsFromKeystore(CredentialType, Input, p1) --[[ Line: 566 ]]
	-- upvalues: PromiseModule (copy), HttpService (copy), MessageBus (copy)
	if self.deleteKeystoreCredentialsRequestInFlight then
		return PromiseModule.reject()
	else
		local RaceResult = PromiseModule.race({
			PromiseModule.new(function(Callback, _) --[[ Line: 574 ]]
				-- upvalues: self (copy), CredentialType (copy), HttpService (upval)
				self.subscriber:subscribe(self.DELETE_KEYSTORE_CREDENTIALS_RESPONSE_DESCRIPTOR[CredentialType], function(Input) --[[ Line: 577 ]]
					-- upvalues: self (upval), CredentialType (upval), HttpService (upval), Callback (copy)
					self.subscriber:unsubscribe(self.DELETE_KEYSTORE_CREDENTIALS_RESPONSE_DESCRIPTOR[CredentialType])
					self.deleteKeystoreCredentialsRequestInFlight = false
					Callback((HttpService:JSONEncode(Input)))
				end)
			end),
			PromiseModule.delay(p1):andThen(function() --[[ Line: 585 ]]
				-- upvalues: self (copy), CredentialType (copy)
				self.subscriber:unsubscribe(self.DELETE_KEYSTORE_CREDENTIALS_RESPONSE_DESCRIPTOR[CredentialType])
				self.deleteKeystoreCredentialsRequestInFlight = false
			end)
		})
		self.deleteKeystoreCredentialsRequestInFlight = true
		MessageBus.publish(self.DELETE_KEYSTORE_CREDENTIALS_REQUEST_DESCRIPTOR[CredentialType], {
			credentialType = CredentialType,
			parameters = HttpService:JSONDecode(Input)
		})
		
		return RaceResult
	end
end

function CredentialsProtocolModule:sendIsAvailableRequest(CredentialType, p1) --[[ Line: 607 ]]
	-- upvalues: PromiseModule (copy), MessageBus (copy)
	local RaceResult = PromiseModule.race({
		PromiseModule.new(function(Callback, _) --[[ Line: 612 ]]
			-- upvalues: self (copy)
			self.subscriber:subscribe(self.IS_AVAILABLE_RESPONSE_DESCRIPTOR, function(p2) --[[ Line: 613 ]]
				-- upvalues: self (upval), Callback (copy)
				self.subscriber:unsubscribe(self.IS_AVAILABLE_RESPONSE_DESCRIPTOR)
				Callback(p2)
			end)
		end),
		PromiseModule.delay(p1):andThen(function() --[[ Line: 618 ]]
			-- upvalues: self (copy), PromiseModule (upval)
			self.subscriber:unsubscribe(self.IS_AVAILABLE_RESPONSE_DESCRIPTOR)
			
			return PromiseModule.resolve({ isAvailable = nil, supportsDeviceBoundOnly = nil })
		end)
	})
	MessageBus.publish(self.IS_AVAILABLE_REQUEST_DESCRIPTOR, { credentialType = CredentialType })
	
	return RaceResult
end

function CredentialsProtocolModule:isAvailable(CredentialType, p1) --[[ Line: 639 ]]
	-- upvalues: FFlagCacheCredentialsProtocolIsAvailableModule (copy), PromiseModule (copy)
	if not FFlagCacheCredentialsProtocolIsAvailableModule then
		return self:sendIsAvailableRequest(CredentialType, p1)
	end
	local IsAvailableCache = self.isAvailableCache
	
	if IsAvailableCache ~= nil and os.clock() - IsAvailableCache.clock < 30 then
		return PromiseModule.resolve(IsAvailableCache.result)
	elseif self.isAvailableRequest == nil then
		local SendIsAvailableRequestResult = self:sendIsAvailableRequest(CredentialType, p1)
		self.isAvailableRequest = SendIsAvailableRequestResult
		
		return SendIsAvailableRequestResult:andThen(function(Result) --[[ Line: 662 ]]
			-- upvalues: self (copy)
			self.isAvailableRequest = nil
			
			if Result.isAvailable ~= nil or (Result.FIDO2 ~= nil or (Result.password ~= nil or (Result.iosKeychainPassword ~= nil or Result.keystore ~= nil))) then
				self.isAvailableCache = { result = Result, clock = os.clock() }
			end
			return Result
		end):catch(function(Err) --[[ Line: 669 ]]
			-- upvalues: self (copy), PromiseModule (upval)
			self.isAvailableRequest = nil
			
			return PromiseModule.reject(Err)
		end)
	else
		return self.isAvailableRequest
	end
end

CredentialsProtocolModule.default = CredentialsProtocolModule.new()

return CredentialsProtocolModule