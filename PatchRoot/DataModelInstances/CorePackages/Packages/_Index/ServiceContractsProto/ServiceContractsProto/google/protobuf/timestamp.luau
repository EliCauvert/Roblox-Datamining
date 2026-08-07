-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:11 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 41 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		seconds = if p0 == nil or p0.seconds == nil then 0 else p0.seconds,
		nanos = if p0 == nil or p0.nanos == nil then 0 else p0.nanos
	}, t_1)
end

function t_1:encode() --[[ line: 48 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var6 = 0
	
	if self.seconds ~= nil and self.seconds ~= 0 then
		local var7, var8 = protoModule.writeTag(buff, var6, 1, protoModule.wireTypes.varint)
		var7, var8 = protoModule.writeVarInt(var7, var8, self.seconds)
		buff = var7
		var6 = var8
	end
	if self.nanos ~= nil and self.nanos ~= 0 then
		local var9, var10 = protoModule.writeTag(buff, var6, 2, protoModule.wireTypes.varint)
		var9, var10 = protoModule.writeVarInt(var9, var10, self.nanos)
		buff = var9
		var6 = var10
	end
	local buff_1 = buffer.create(var6)
	buffer.copy(buff_1, 0, buff, 0, var6)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 67 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var12 = t_1.new()
	local var13 = 0
	while var13 < buffer.len(p1) do
		local _ = nil
		local _ = nil
		local var14, var15, var16 = protoModule.readTag(p1, var13)
		local var17 = var14
		local var18 = var15
		var13 = var16
		
		if var18 == protoModule.wireTypes.varint then
			if var17 == 1 then
				local _ = nil
				local var19, var20 = protoModule.readVarIntI64(p1, var13)
				var13 = var20
				var12.seconds = var19
			elseif var17 == 2 then
				local _ = nil
				local var21, var22 = protoModule.readVarIntI32(p1, var13)
				var13 = var22
				var12.nanos = var21
			else
				local _ = nil
				local var23, var24 = protoModule.readVarInt(p1, var13)
				local _ = var23
				var13 = var24
			end
		elseif var18 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var25, var26 = protoModule.readVarInt(p1, var13)
			var13 = var26 + var25
		elseif var18 == protoModule.wireTypes.i32 then
			local _ = nil
			local var27, var28 = protoModule.readFixed32(p1, var13)
			local _ = var27
			var13 = var28
		elseif var18 == protoModule.wireTypes.i64 then
			local _ = nil
			local var29, var30 = protoModule.readFixed64(p1, var13)
			local _ = var29
			var13 = var30
		else
			error("Unsupported wire type: " .. var18)
		end
	end
	return var12
end

local function serializeFractionalNanos(p2) --[[ line: 115 ]]
	return if p2 % 1000000 == 0 then string.format(".%03d", p2) elseif p2 % 1000 == 0 then string.format(".%06d", p2) else string.format(".%09d", p2)
end

local function _(p3) --[[ line: 125 | named "deserializeFractionalNanos" ]]
	local var31 = assert(tonumber(p3), "Invalid nanos string received, couldn't turn into a number")
	
	for i = #p3 + 1, 9 do
		var31 += 10 ^ (i - 1)
	end
	return var31
end

function t_1:jsonEncode() --[[ line: 134 ]]
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

function t_1.jsonDecode(p4) --[[ line: 160 ]]
	-- upvalues: t_1 (ref)
	local match, match_1, match_2, match_3, match_4, match_5, match_6 = string.match(p4, "^([0-9]+)-([0-9]+)-([0-9]+)T([0-9]+):([0-9]+):([0-9]+)(.*)Z$")
	
	if match == nil or match_1 == nil or (match_2 == nil or match_3 == nil) or (match_4 == nil or match_5 == nil or match_6 == nil) then
		error("Invalid timestamp provided")
	end
	local var40 = 0
	
	if #match_6 ~= 0 then
		local match_7 = string.match(match_6, "^%.([0-9]+)$")
		
		if match_7 == nil then
			error("Invalid nanoseconds provided in timestamp: `" .. match_6 .. "`")
		end
		local var42 = assert(tonumber(match_7), "Invalid nanos string received, couldn't turn into a number")
		
		for i = #match_7 + 1, 9 do
			var42 += 10 ^ (i - 1)
		end
		var40 = var42
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
		nanos = var40
	})
end

t_1.descriptor = {
	name = "Timestamp",
	fullName = "google.protobuf.Timestamp"
}
t.Timestamp = t_1
typeRegistryModule.default:register(t.Timestamp)

return { Timestamp = t.Timestamp }