local parent = script:FindFirstAncestor("AuthCommon").Parent
local argCheckModule = require(parent.ArgCheck)
local tModule = require(parent.t)
local fFlagEnableLuaAccountSwitch = require(parent.SharedFlags).FFlagEnableLuaAccountSwitch
local t = {}
local t_1 = {}
t[t_1] = true
local var4 = tModule.interface({
	user = tModule.interface({ id = tModule.number, name = tModule.string }),
	twoStepVerificationData = tModule.optional(tModule.interface({ mediaType = tModule.string, ticket = tModule.string })),
	twoStepVerificationDataV2 = tModule.optional(tModule.interface({ mediaType = tModule.string, ticket = tModule.string })),
	accountBlob = tModule.optional(tModule.string)
})

function t.new(p0)
	-- upvalues: fFlagEnableLuaAccountSwitch (ref), t (ref)
	local t_1 = { user = { id = "0", name = "" } }
	
	if p0 and type(p0) == "table" then
		if p0.user then
			t_1.user.id = tostring(p0.user.id) or t_1.user.id
			t_1.user.name = p0.user.name or t_1.user.name
		end
		if p0.twoStepVerificationData then
			t_1.twoStepVerificationData = {}
			t_1.twoStepVerificationData.mediaType = p0.twoStepVerificationData.mediaType or ""
			t_1.twoStepVerificationData.ticket = p0.twoStepVerificationData.ticket or ""
		end
		if fFlagEnableLuaAccountSwitch and p0.accountBlob then
			t_1.accountBlob = p0.accountBlob
		end
	end
	setmetatable(t_1, t)
	
	return t_1
end

function t.mock()
	-- upvalues: t (ref)
	local var6 = t.new()
	var6.user = { id = "1", name = "ROBLOX" }
	var6.twoStepVerificationData = {
		mediaType = "Email",
		ticket = "00000000-0000-0000-0000-000000000000"
	}
	
	return var6
end

function t:fromJsonData()
	-- upvalues: t (ref), var4 (ref), fFlagEnableLuaAccountSwitch (ref), argCheckModule (ref)
	local var7 = t.new()
	local var8, var9 = var4(self)
	
	if var8 then
		var7.user = { id = tostring(self.user.id), name = self.user.name }
		
		if self.twoStepVerificationData then
			var7.twoStepVerificationData = {
				mediaType = self.twoStepVerificationData.mediaType,
				ticket = self.twoStepVerificationData.ticket
			}
		end
		if fFlagEnableLuaAccountSwitch and self.accountBlob then
			var7.accountBlob = self.accountBlob
			
			return var7
		end
	else
		argCheckModule.assert(false, var9)
	end
	return var7
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