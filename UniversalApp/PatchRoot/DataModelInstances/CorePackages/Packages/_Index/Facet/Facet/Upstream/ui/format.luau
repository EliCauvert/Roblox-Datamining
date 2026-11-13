local function _(Value: number)
	assert(Value == Value and math.abs(Value) < 1e999, "Facet format requires a finite number")
end

local _ = function(p1: number, p2, p3): number
	assert(p2 <= p1 and p1 <= p3 and p1 % 1 == 0, `Facet format precision must be {p2} through {p3}`)
	
	return p1
end

local _ = function(Text: string): string
	return if string.find(Text, ".", 1, true) then string.gsub(string.gsub(Text, "0+$", ""), "%.$", "") else Text
end

return table.freeze({
	compact = function(Value: number, p1): string
		assert(Value == Value and math.abs(Value) < 1e999, "Facet format requires a finite number")
		local SignificantDigits = if p1 and p1.significantDigits then p1.significantDigits else 3
		assert(SignificantDigits >= 1 and SignificantDigits <= 15 and SignificantDigits % 1 == 0, `Facet format precision must be {1} through {15}`)
		local list = {
			"",
			"K",
			"M",
			"B",
			"T"
		}
		local Magnitude = math.abs(Value)
		local Count = 1
		while Magnitude >= 1000 and Count < #list do
			Magnitude /= 1000
			Count += 1
		end
		local v1 = assert((tonumber(string.format(`%.{SignificantDigits}g`, Magnitude))))
		
		if v1 >= 1000 and Count < #list then
			v1 /= 1000
			Count += 1
		end
		local Largest: number = if v1 == 0 then 0 else math.max(0, SignificantDigits - 1 - math.floor((math.log10(v1))))
		local Formatted = nil
		
		if Largest > 15 then
			Formatted = string.format(`%.{SignificantDigits}g`, v1)
		else
			local Formatted1 = string.format(`%.{Largest}f`, v1)
			Formatted = if string.find(Formatted1, ".", 1, true) then string.gsub(string.gsub(Formatted1, "0+$", ""), "%.$", "") else Formatted1
		end
		return (if Value < 0 and v1 ~= 0 then "-" else "") .. Formatted .. list[Count]
	end,
	grouped = function(Value: number, p2): string
		assert(Value == Value and math.abs(Value) < 1e999, "Facet format requires a finite number")
		local Decimals = if p2 and p2.decimals then p2.decimals else 0
		assert(Decimals >= 0 and Decimals <= 15 and Decimals % 1 == 0, `Facet format precision must be {0} through {15}`)
		local Separator = if p2 and p2.separator then p2.separator else ","
		local Formatted = string.format(`%.{Decimals}f`, (math.abs(Value)))
		local Match, Match2 = string.match(Formatted, "^(%d+)(.*)$")
		assert(Match and Match2)
		local List = {}
		local EndIndex = (#Match - 1) % 3 + 1
		table.insert(List, (string.sub(Match, 1, EndIndex)))
		
		for i = EndIndex + 1, #Match, 3 do
			table.insert(List, (string.sub(Match, i, i + 2)))
		end
		return (if Value < 0 and tonumber(Formatted) ~= 0 then "-" else "") .. table.concat(List, Separator) .. Match2
	end,
	duration = function(Value: number, p3): string
		assert(Value == Value and math.abs(Value) < 1e999, "Facet format requires a finite number")
		local Floored = math.floor((math.max(0, Value)))
		local Floored1 = math.floor(Floored / 3600)
		local FlooredRemainder = math.floor(Floored / 60) % 60
		local Formatted = string.format("%02d", Floored % 60)
		
		return if Floored1 > 0 or p3 and p3.hours then string.format("%.0f:%02d:%s", Floored1, FlooredRemainder, Formatted) else string.format("%d:%s", FlooredRemainder, Formatted)
	end
})