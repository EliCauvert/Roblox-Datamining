local ProtoModule = require(script.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		seconds = if p1 == nil or p1.seconds == nil then 0 else p1.seconds,
		nanos = if p1 == nil or p1.nanos == nil then 0 else p1.nanos
	}, Module))
end

function Module:encode()
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

function Module.decode(Buf)
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

local function serializeFractionalNanos(Nanos: number): string
	local Text = tostring(Nanos * math.sign(Nanos))
	local Repeated = string.rep("0", 9 - #Text)
	while Text:sub(-1) == "0" do
		Text = Text:sub(1, -2)
	end
	return `.{Repeated}{Text}s`
end

local function _(p1)
	local InvalidNanosStringReceivedCouldnTTurnIntoANumber = assert(tonumber(p1), "Invalid nanos string received, couldn't turn into a number")
	
	for _ = #p1 + 1, 9 do
		InvalidNanosStringReceivedCouldnTTurnIntoANumber *= 10
	end
	return InvalidNanosStringReceivedCouldnTTurnIntoANumber
end

function Module:jsonEncode(): string
	-- upvalues: serializeFractionalNanos (copy)
	assert(self.seconds == nil or self.seconds >= -315576000000 and self.seconds <= 315576000000, "Seconds out of range")
	assert(self.nanos == nil or self.nanos >= -999999999 and self.nanos <= 999999999, "Nanoseconds out of range")
	
	return if self.nanos == nil or self.nanos == 0 or self.nanos % 1000000000 == 0 then `{self.seconds}s` else string.format("%s%d%s", if self.seconds == 0 and math.sign(self.nanos) == -1 then "-" else "", self.seconds or 0, (serializeFractionalNanos(self.nanos)))
end

function Module.jsonDecode(Text: string)
	-- upvalues: Module (copy)
	local Match: string? = string.match(Text, "^([%-0-9]+)s$")
	local Nanos = 0
	local InvalidDurationStringReceivedWasFormattedAsJustHavingSecondsButWasnTAProperlyFormattedInt = nil
	
	if Match == nil then
		local Match1, Match2 = string.match(Text, "^([%-0-9]+)%.([0-9]+)s$")
		assert(Match1 ~= nil, "Invalid duration string received--seconds provided are invalid")
		assert(Match2 ~= nil, "Invalid duration string received--nanos provided are invalid")
		InvalidDurationStringReceivedWasFormattedAsJustHavingSecondsButWasnTAProperlyFormattedInt = assert(tonumber(Match1), "Invalid duration string received--seconds provided are invalid")
		local InvalidNanosStringReceivedCouldnTTurnIntoANumber = assert(tonumber(Match2), "Invalid nanos string received, couldn't turn into a number")
		
		for _ = #Match2 + 1, 9 do
			InvalidNanosStringReceivedCouldnTTurnIntoANumber *= 10
		end
		Nanos = InvalidNanosStringReceivedCouldnTTurnIntoANumber * (if Match1:sub(1, 1) == "-" then -1 else 1)
	else
		InvalidDurationStringReceivedWasFormattedAsJustHavingSecondsButWasnTAProperlyFormattedInt = assert(tonumber(Match), "Invalid duration string received--was formatted as just having seconds, but wasn't a properly formatted int")
	end
	if InvalidDurationStringReceivedWasFormattedAsJustHavingSecondsButWasnTAProperlyFormattedInt > 315576000000 then
		error(`Duration seconds cannot exceed {315576000000}`)
	elseif InvalidDurationStringReceivedWasFormattedAsJustHavingSecondsButWasnTAProperlyFormattedInt < -315576000000 then
		error(`Duration seconds cannot be less than {-315576000000}`)
	end
	return Module.new({
		seconds = InvalidDurationStringReceivedWasFormattedAsJustHavingSecondsButWasnTAProperlyFormattedInt,
		nanos = Nanos
	})
end

Module.descriptor = { name = "Duration", fullName = "google.protobuf.Duration" }
local config = { Duration = Module }
TypeRegistryModule.default:register(config.Duration)

return { Duration = config.Duration }