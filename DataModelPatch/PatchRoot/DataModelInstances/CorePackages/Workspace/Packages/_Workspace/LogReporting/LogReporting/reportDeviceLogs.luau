local Parent = script:FindFirstAncestor("LogReporting").Parent
local FFlagEnableLuaLogReporterMultipleLogs = require(Parent.SharedFlags).FFlagEnableLuaLogReporterMultipleLogs
local Base64 = require(Parent.AuthCommon).Utils.Base64
local _Random = Random.new()

local function generateHexString(p1): string
	-- upvalues: _Random (ref)
	local Text = ""
	
	for _ = 1, p1 do
		local NextIntegerResult: number = _Random:NextInteger(1, 16)
		Text ..= string.sub("0123456789abcdef", NextIntegerResult, NextIntegerResult)
	end
	return Text
end

local function _(p2)
	-- upvalues: _Random (ref)
	_Random = Random.new(p2)
end

local function generateLogMetadata(p2, p3, VoiceEnabled)
	-- upvalues: _Random (ref), generateHexString (copy), Base64 (copy)
	_Random = Random.new((math.floor(tick() * 1000 + p2)))
	local HexString = generateHexString(10)
	
	return {
		desc = "clientDump",
		url = string.format("https://console.backtrace.rbx.com/p/LogReports/debug?time=all&filters=%s", Base64.Encode("[[\"reportId\",\"equal\",\"" .. HexString .. "\"]]"):sub(0, -2)),
		reportId = HexString,
		fingerprint = Base64.Encode((generateHexString(64))):sub(0, -2),
		uuid = string.format("%s-%s-%s-%s-%s", generateHexString(8), generateHexString(4), generateHexString(4), generateHexString(4), (generateHexString(12))),
		attributes = {
			reportId = HexString,
			userId = p2 and tostring(p2) or "",
			placeId = tostring(p3),
			voiceEnabled = VoiceEnabled
		}
	}
end

return function(LogReporterService, p2, p3, VoiceEnabled)
	-- upvalues: generateLogMetadata (copy), FFlagEnableLuaLogReporterMultipleLogs (copy)
	local LogMetadata = generateLogMetadata(p2, p3, VoiceEnabled)
	
	if FFlagEnableLuaLogReporterMultipleLogs and game:GetEngineFeature("LogReporterMultipleLogs") then
		LogReporterService:ReportMultipleLogs(LogMetadata.fingerprint, LogMetadata.uuid, LogMetadata.desc, LogMetadata.attributes, {}, 2)
	else
		LogReporterService:ReportLog(LogMetadata.fingerprint, LogMetadata.uuid, LogMetadata.desc, LogMetadata.attributes, {})
	end
	return { url = LogMetadata.url, reportId = LogMetadata.reportId }
end