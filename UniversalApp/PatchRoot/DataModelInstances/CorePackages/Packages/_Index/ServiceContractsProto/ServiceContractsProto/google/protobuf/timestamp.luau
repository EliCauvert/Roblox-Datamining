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
	return if p2 % 1000000 == 0 then string.format(".%03d", p2) elseif p2 % 1000 == 0 then string.format(".%06d", p2) else string.format(".%09d", p2)
end

local function _(p2)
	local var20 = assert(tonumber(p2), "Invalid nanos string received, couldn't turn into a number")
	
	for i = #p2 + 1, 9 do
		var20 += 10 ^ (i - 1)
	end
	return var20
end

function t_1:jsonEncode()
	-- upvalues: serializeFractionalNanos (ref)
	if self.seconds > 253402300799 then
		error("Invalid timestamp provided: years after 9999 are not supported")
	end
	if self.seconds < -62135596800 then
		error("Invalid timestamp provided: years before 0001 are not supported")
	end
	local dateString = os.date("!*t", self.seconds or 0)
	
	if dateString == nil then
		error("Invalid timestamp provided: exceeded supported timestamp range on this platform")
	end
	return string.format("%04d-%02d-%02dT%02d:%02d:%02d%sZ", dateString.year, dateString.month, dateString.day, dateString.hour, dateString.min, dateString.sec, if self.nanos == 0 then "" else serializeFractionalNanos(self.nanos))
end

function t_1.jsonDecode(p3)
	-- upvalues: t_1 (ref)
	local match, match_1, match_2, match_3, match_4, match_5, match_6 = string.match(p3, "^([0-9]+)-([0-9]+)-([0-9]+)T([0-9]+):([0-9]+):([0-9]+)(.*)Z$")
	
	if match == nil or match_1 == nil or (match_2 == nil or match_3 == nil) or (match_4 == nil or match_5 == nil or match_6 == nil) then
		error("Invalid timestamp provided")
	end
	local var21 = 0
	
	if #match_6 ~= 0 then
		local match_7 = string.match(match_6, "^%.([0-9]+)$")
		
		if match_7 == nil then
			error("Invalid nanoseconds provided in timestamp: `" .. match_6 .. "`")
		end
		local var22 = assert(tonumber(match_7), "Invalid nanos string received, couldn't turn into a number")
		
		for i = #match_7 + 1, 9 do
			var22 += 10 ^ (i - 1)
		end
		var21 = var22
	end
	return t_1.new({
		seconds = os.time({
			year = assert(tonumber(match), "Invalid formatted year"),
			month = assert(tonumber(match_1), "Invalid formatted month"),
			day = assert(tonumber(match_2), "Invalid formatted day"),
			hour = assert(tonumber(match_3), "Invalid formatted hour"),
			min = assert(tonumber(match_4), "Invalid formatted min"),
			sec = assert(tonumber(match_5), "Invalid formatted sec")
		}),
		nanos = var21
	})
end

t_1.descriptor = {
	name = "Timestamp",
	fullName = "google.protobuf.Timestamp"
}
t.Timestamp = t_1
typeRegistryModule.default:register(t.Timestamp)

return { Timestamp = t.Timestamp }