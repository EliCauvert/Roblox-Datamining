local protoModule = require(script.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		seconds = if p1 == nil or p1.seconds == nil then 0 else p1.seconds,
		nanos = if p1 == nil or p1.nanos == nil then 0 else p1.nanos
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.seconds ~= nil and self.seconds ~= 0 then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var8 = protoModule.writeVarInt(var2, var3, self.seconds)
		buff = var2
		var1 = var3
	end
	if self.nanos ~= nil and self.nanos ~= 0 then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var10 = protoModule.writeVarInt(var4, var5, self.nanos)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
	local var1 = t_1.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local _ = nil
		local var3, var4, var5 = protoModule.readTag(p1, var2)
		local var6 = var3
		local var7 = var4
		var2 = var5
		
		if var7 == protoModule.wireTypes.varint then
			if var6 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI64(p1, var2)
				var2 = var9
				var1.seconds = var8
			elseif var6 == 2 then
				local _ = nil
				local var10, var11 = protoModule.readVarIntI32(p1, var2)
				var2 = var11
				var1.nanos = var10
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				local _ = var12
				var2 = var13
			end
		elseif var7 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var14, var15 = protoModule.readVarInt(p1, var2)
			var2 = var15 + var14
		elseif var7 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var7 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var18)
		end
	end
	return var1
end

local function serializeFractionalNanos(p2)
	local var20 = tostring(p2 * math.sign(p2))
	local repeated = string.rep("0", 9 - #var20)
	while var20:sub(-1) == "0" do
		var20 = var20:sub(1, -2)
	end
	return `.{repeated}{var20}s`
end

local function _(p3)
	local var21 = assert(tonumber(p3), "Invalid nanos string received, couldn't turn into a number")
	
	for _ = #p3 + 1, 9 do
		var21 *= 10
	end
	return var21
end

function t_1:jsonEncode()
	-- upvalues: serializeFractionalNanos (ref)
	assert(if self.seconds ~= nil then self.seconds >= -315576000000 and self.seconds <= 315576000000 else true, "Seconds out of range")
	assert(if self.nanos ~= nil then self.nanos >= -999999999 and self.nanos <= 999999999 else true, "Nanoseconds out of range")
	
	return if self.nanos == nil or self.nanos == 0 or self.nanos % 1000000000 == 0 then `{self.seconds}s` else string.format("%s%d%s", if self.seconds == 0 and math.sign(self.nanos) == -1 then "-" else "", self.seconds or 0, serializeFractionalNanos(self.nanos))
end

function t_1.jsonDecode(p4)
	-- upvalues: t_1 (ref)
	local var22
	local match = string.match(p4, "^([%-0-9]+)s$")
	local _ = 0
	local var23 = 0
	
	if match == nil then
		local match_1, match_2 = string.match(p4, "^([%-0-9]+)%.([0-9]+)s$")
		assert(match_1 ~= nil, "Invalid duration string received--seconds provided are invalid")
		assert(match_2 ~= nil, "Invalid duration string received--nanos provided are invalid")
		var22 = assert(tonumber(match_1), "Invalid duration string received--seconds provided are invalid")
		local var24 = assert(tonumber(match_2), "Invalid nanos string received, couldn't turn into a number")
		
		for _ = #match_2 + 1, 9 do
			var24 *= 10
		end
		var23 = var24 * (if match_1:sub(1, 1) == "-" then -1 else 1)
	else
		var22 = assert(tonumber(match), "Invalid duration string received--was formatted as just having seconds, but wasn't a properly formatted int")
	end
	if var22 > 315576000000 then
		error(`Duration seconds cannot exceed {315576000000}`)
	elseif var22 < -315576000000 then
		error(`Duration seconds cannot be less than {-315576000000}`)
	end
	return t_1.new({ seconds = var22, nanos = var23 })
end

t_1.descriptor = { name = "Duration", fullName = "google.protobuf.Duration" }
t.Duration = t_1
typeRegistryModule.default:register(t.Duration)

return { Duration = t.Duration }