local ChallengeDialog = script:FindFirstAncestor("ChallengeDialog")
local LocalizationService = game:GetService("LocalizationService")
local DEFAULTPADDING = require(ChallengeDialog.Common.Constants).DEFAULT_PADDING
local MAXWIDTH = require(ChallengeDialog.Common.Constants).MAX_WIDTH

local function _(p1): boolean
	return p1 == "unknown" or p1 == nil
end

return {
	screenSizeSelector = function(p1)
		return p1.ScreenSize
	end,
	getMiddleContentWidth = function(p1): number
		-- upvalues: MAXWIDTH (copy), DEFAULTPADDING (copy)
		local function _(p2)
			-- upvalues: MAXWIDTH (upval)
			return p2 < MAXWIDTH and p2 or MAXWIDTH
		end
		
		return (p1 < MAXWIDTH and p1 or MAXWIDTH) - DEFAULTPADDING * 2
	end,
	getAdjustedTitleToScreenString = function(Text1: string, p1, p2): string
		if Text1 == nil then
			return Text1
		end
		local Floored = math.floor(p1 / (p2.Font.Body.RelativeSize * p2.Font.BaseSize * 0.6) * 0.85)
		
		if string.len(Text1) <= Floored then
			return Text1
		end
		if Text1:find(" ") == nil then
			return Text1
		end
		local Text2 = ""
		local Text: string = Text1
		
		for i = 1, 2 do
			if Floored >= string.len(Text) then
				Text2 ..= Text
				
				return Text2
			end
			local Segment = string.sub(Text, 1, Floored)
			local v1 = Segment:reverse():find(" ")
			
			if v1 == nil then
				Text2 ..= Segment
				Text = string.sub(Text, Floored + 1)
			else
				local LengthDelta = string.len(Segment) - v1
				Text = string.sub(Text, LengthDelta + 2)
				Text2 ..= string.sub(Segment, 0, LengthDelta)
			end
			if i ~= 2 then
				Text2 ..= "\n"
			end
		end
		return Text2
	end,
	getFormattedDeviceType = function(Text, Text1, p3)
		if Text == "unknown" or Text == nil then
			return p3.unknownDeviceType
		else
			local IsUnknown: boolean = Text1 == "unknown" or Text1 == nil
			
			return if IsUnknown then Text else Text .. " (" .. Text1 .. ")"
		end
	end,
	getFormattedRegionalLocation = function(p3, p4, p5, p6)
		if (p3 == "unknown" or p3 == nil) and (p4 == "unknown" or p4 == nil) and (p5 == "unknown" or p5 == nil) then
			return p6.unknownLocation
		elseif (p3 == "unknown" or p3 == nil) and (p4 == "unknown" or p4 == nil) then
			return p5
		elseif (p4 == "unknown" or p4 == nil) and (p5 == "unknown" or p5 == nil) then
			return p3
		elseif (p3 == "unknown" or p3 == nil) and (p5 == "unknown" or p5 == nil) then
			return p4
		elseif p3 == "unknown" or p3 == nil then
			return p6.locationWithoutCity
		elseif p4 == "unknown" or p4 == nil then
			return p6.locationWithoutSubdivision
		else
			local IsUnknown: boolean = p5 == "unknown" or p5 == nil
			
			return if IsUnknown then p6.locationWithoutCountry else p6.location
		end
	end,
	getFormattedIPAddress = function(p3, p4)
		local IsUnknown: boolean = p3 == "unknown" or p3 == nil
		
		return if IsUnknown then p4.unknownIPAddress else p3
	end,
	getFormattedDateTime = function(p3)
		-- upvalues: LocalizationService (copy)
		return DateTime.fromUnixTimestamp(p3):FormatLocalTime("lll", LocalizationService.RobloxLocaleId)
	end
}