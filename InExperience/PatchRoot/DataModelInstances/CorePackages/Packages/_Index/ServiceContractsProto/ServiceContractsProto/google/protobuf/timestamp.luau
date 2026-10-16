local ProtoModule = require(script.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 41 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		seconds = if p1 == nil or p1.seconds == nil then 0 else p1.seconds,
		nanos = if p1 == nil or p1.nanos == nil then 0 else p1.nanos
	}, Module))
end

function Module:encode() --[[ Line: 48 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.seconds ~= nil and self.seconds ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.seconds)
	end
	if self.nanos ~= nil and self.nanos ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.nanos)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 67 ]]
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v13 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.seconds, v13 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 2 then
				NewModule.nanos, v13 = ProtoModule.readVarIntI32(Buf, v1)
			else
				local _
				_, v13 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
			v1 = VarInt2 + VarInt
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v13 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v13 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

local function serializeFractionalNanos(Nanos: number): string --[[ Line: 115 ]]
	return if Nanos % 1000000 == 0 then string.format(".%03d", Nanos) elseif Nanos % 1000 == 0 then string.format(".%06d", Nanos) else string.format(".%09d", Nanos)
end

local function _(p1) --[[ Line: 125 | Named "deserializeFractionalNanos" ]]
	local InvalidNanosStringReceivedCouldnTTurnIntoANumber = assert(tonumber(p1), "Invalid nanos string received, couldn't turn into a number")
	
	for i = #p1 + 1, 9 do
		InvalidNanosStringReceivedCouldnTTurnIntoANumber += 10 ^ (i - 1)
	end
	return InvalidNanosStringReceivedCouldnTTurnIntoANumber
end

function Module:jsonEncode(): string --[[ Line: 134 ]]
	-- upvalues: serializeFractionalNanos (copy)
	if self.seconds > 253402300799 then
		error("Invalid timestamp provided: years after 9999 are not supported")
	end
	if self.seconds < -62135596800 then
		error("Invalid timestamp provided: years before 0001 are not supported")
	end
	local DateInfo = os.date("!*t", self.seconds or 0)
	
	if DateInfo == nil then
		error("Invalid timestamp provided: exceeded supported timestamp range on this platform")
	end
	return string.format("%04d-%02d-%02dT%02d:%02d:%02d%sZ", DateInfo.year, DateInfo.month, DateInfo.day, DateInfo.hour, DateInfo.min, DateInfo.sec, if self.nanos == 0 then "" else serializeFractionalNanos(self.nanos))
end

function Module.jsonDecode(Text: string) --[[ Line: 160 ]]
	-- upvalues: Module (copy)
	local Match, Match2, Match3, Match4, Match5, Match6, Match7 = string.match(Text, "^([0-9]+)-([0-9]+)-([0-9]+)T([0-9]+):([0-9]+):([0-9]+)(.*)Z$")
	
	if Match == nil or Match2 == nil or Match3 == nil or Match4 == nil or Match5 == nil or Match6 == nil or Match7 == nil then
		error("Invalid timestamp provided")
	end
	local Nanos = 0
	
	if #Match7 ~= 0 then
		local Match1: string? = string.match(Match7, "^%.([0-9]+)$")
		
		if Match1 == nil then
			error("Invalid nanoseconds provided in timestamp: `" .. Match7 .. "`")
		end
		local InvalidNanosStringReceivedCouldnTTurnIntoANumber = assert(tonumber(Match1), "Invalid nanos string received, couldn't turn into a number")
		
		for i = #Match1 + 1, 9 do
			InvalidNanosStringReceivedCouldnTTurnIntoANumber += 10 ^ (i - 1)
		end
		Nanos = InvalidNanosStringReceivedCouldnTTurnIntoANumber
	end
	return Module.new({
		seconds = os.time({
			year = assert(tonumber(Match), "Invalid formatted year"),
			month = assert(tonumber(Match2), "Invalid formatted month"),
			day = assert(tonumber(Match3), "Invalid formatted day"),
			hour = assert(tonumber(Match4), "Invalid formatted hour"),
			min = assert(tonumber(Match5), "Invalid formatted min"),
			sec = assert(tonumber(Match6), "Invalid formatted sec")
		}),
		nanos = Nanos
	})
end

Module.descriptor = {
	name = "Timestamp",
	fullName = "google.protobuf.Timestamp"
}
local config = { Timestamp = Module }
TypeRegistryModule.default:register(config.Timestamp)

return { Timestamp = config.Timestamp }