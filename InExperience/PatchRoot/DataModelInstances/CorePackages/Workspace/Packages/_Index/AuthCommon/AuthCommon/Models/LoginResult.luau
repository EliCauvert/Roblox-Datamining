local parent = script:FindFirstAncestor("AuthCommon").Parent
local argCheckModule = require(parent.ArgCheck)
local tModule = require(parent.t)
local fFlagEnableLuaAccountSwitch = require(parent.SharedFlags).FFlagEnableLuaAccountSwitch
local t = {}
local t_1 = {}
t[t_1] = true
local var1 = tModule.interface({
	user = tModule.interface({ id = tModule.number, name = tModule.string }),
	twoStepVerificationData = tModule.optional(tModule.interface({ mediaType = tModule.string, ticket = tModule.string })),
	twoStepVerificationDataV2 = tModule.optional(tModule.interface({ mediaType = tModule.string, ticket = tModule.string })),
	accountBlob = tModule.optional(tModule.string)
})

function t.new(p1)
	-- upvalues: fFlagEnableLuaAccountSwitch (ref), t (ref)
	local t_1 = { user = { id = "0", name = "" } }
	
	if p1 and type(p1) == "table" then
		if p1.user then
			t_1.user.id = tostring(p1.user.id) or t_1.user.id
			t_1.user.name = p1.user.name or t_1.user.name
		end
		if p1.twoStepVerificationData then
			t_1.twoStepVerificationData = {}
			t_1.twoStepVerificationData.mediaType = p1.twoStepVerificationData.mediaType or ""
			t_1.twoStepVerificationData.ticket = p1.twoStepVerificationData.ticket or ""
		end
		if fFlagEnableLuaAccountSwitch and p1.accountBlob then
			t_1.accountBlob = p1.accountBlob
		end
	end
	setmetatable(t_1, t)
	
	return t_1
end

function t.mock()
	-- upvalues: t (ref)
	local var2 = t.new()
	var2.user = { id = "1", name = "ROBLOX" }
	var2.twoStepVerificationData = {
		mediaType = "Email",
		ticket = "00000000-0000-0000-0000-000000000000"
	}
	
	return var2
end

function t:fromJsonData()
	-- upvalues: t (ref), var1 (ref), fFlagEnableLuaAccountSwitch (ref), argCheckModule (ref)
	local var2 = t.new()
	local var3, var4 = var1(self)
	
	if var3 then
		var2.user = { id = tostring(self.user.id), name = self.user.name }
		
		if self.twoStepVerificationData then
			var2.twoStepVerificationData = {
				mediaType = self.twoStepVerificationData.mediaType,
				ticket = self.twoStepVerificationData.ticket
			}
		end
		if fFlagEnableLuaAccountSwitch and self.accountBlob then
			var2.accountBlob = self.accountBlob
			
			return var2
		end
	else
		argCheckModule.assert(false, var4)
	end
	return var2
end

function t:is()
	-- upvalues: t_1 (ref)
	return type(self) == "table" and self[t_1] == true
end

function t:hasTwoStepData()
	-- upvalues: t (ref)
	return t.is(self) and type(self.twoStepVerificationData) == "table"
end

t.__index = t

return t