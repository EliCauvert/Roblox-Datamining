local Parent = script:FindFirstAncestor("AuthCommon").Parent
local ArgCheckModule = require(Parent.ArgCheck)
local TModule = require(Parent.t)
local FFlagEnableLuaAccountSwitch = require(Parent.SharedFlags).FFlagEnableLuaAccountSwitch
local t = {}
local LoginResultModule = { [t] = true }
local InterfaceResult = TModule.interface({
	user = TModule.interface({ id = TModule.number, name = TModule.string }),
	twoStepVerificationData = TModule.optional(TModule.interface({ mediaType = TModule.string, ticket = TModule.string })),
	twoStepVerificationDataV2 = TModule.optional(TModule.interface({ mediaType = TModule.string, ticket = TModule.string })),
	accountBlob = TModule.optional(TModule.string)
})

function LoginResultModule.new(p1) --[[ Line: 51 ]]
	-- upvalues: FFlagEnableLuaAccountSwitch (copy), LoginResultModule (copy)
	local config = { user = { id = "0", name = "" } }
	
	if p1 and type(p1) == "table" then
		if p1.user then
			config.user.id = tostring(p1.user.id) or config.user.id
			config.user.name = p1.user.name or config.user.name
		end
		if p1.twoStepVerificationData then
			config.twoStepVerificationData = {}
			config.twoStepVerificationData.mediaType = p1.twoStepVerificationData.mediaType or ""
			config.twoStepVerificationData.ticket = p1.twoStepVerificationData.ticket or ""
		end
		if FFlagEnableLuaAccountSwitch and p1.accountBlob then
			config.accountBlob = p1.accountBlob
		end
	end
	setmetatable(config, LoginResultModule)
	
	return config
end

function LoginResultModule.mock() --[[ Line: 79 ]]
	-- upvalues: LoginResultModule (copy)
	local NewLoginResult = LoginResultModule.new()
	NewLoginResult.user = { id = "1", name = "ROBLOX" }
	NewLoginResult.twoStepVerificationData = {
		mediaType = "Email",
		ticket = "00000000-0000-0000-0000-000000000000"
	}
	
	return NewLoginResult
end

function LoginResultModule:fromJsonData() --[[ Line: 95 ]]
	-- upvalues: LoginResultModule (copy), InterfaceResult (copy), FFlagEnableLuaAccountSwitch (copy), ArgCheckModule (copy)
	local NewLoginResult = LoginResultModule.new()
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(self)
	
	if InterfaceResultResult then
		NewLoginResult.user = { id = tostring(self.user.id), name = self.user.name }
		
		if self.twoStepVerificationData then
			NewLoginResult.twoStepVerificationData = {
				mediaType = self.twoStepVerificationData.mediaType,
				ticket = self.twoStepVerificationData.ticket
			}
		end
		if FFlagEnableLuaAccountSwitch and self.accountBlob then
			NewLoginResult.accountBlob = self.accountBlob
			
			return NewLoginResult
		end
	else
		ArgCheckModule.assert(false, InterfaceResultResult2)
	end
	return NewLoginResult
end

function LoginResultModule:is(): boolean --[[ Line: 126 ]]
	-- upvalues: t (copy)
	return type(self) == "table" and self[t] == true
end

function LoginResultModule:hasTwoStepData(): boolean --[[ Line: 134 ]]
	-- upvalues: LoginResultModule (copy)
	return LoginResultModule.is(self) and type(self.twoStepVerificationData) == "table"
end

LoginResultModule.__index = LoginResultModule

return LoginResultModule