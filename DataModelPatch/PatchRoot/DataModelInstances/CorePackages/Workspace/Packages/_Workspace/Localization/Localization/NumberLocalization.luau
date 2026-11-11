local RoundingBehaviourModule = require(script.Parent.RoundingBehaviour)
local LoggerModule = require(script.Parent.Logger)
game:DefineFastFlag("AllowNumberLocalizationSigFigParam", false)
local config = {
	["en-us"] = {
		decimalSeparator = ".",
		groupDelimiter = ",",
		{ 1, "" },
		{ 1000, "K" },
		{ 1000000, "M" },
		{ 1000000000, "B" }
	},
	["es-es"] = {
		decimalSeparator = ",",
		groupDelimiter = ".",
		{ 1, "" },
		{ 1000, " mil" },
		{ 1000000, " M" }
	},
	["fr-fr"] = {
		decimalSeparator = ",",
		groupDelimiter = " ",
		{ 1, "" },
		{ 1000, " k" },
		{ 1000000, " M" },
		{ 1000000000, " Md" }
	},
	["de-de"] = {
		decimalSeparator = ",",
		groupDelimiter = " ",
		{ 1, "" },
		{ 1000, " Tsd." },
		{ 1000000, " Mio." },
		{ 1000000000, " Mrd." }
	},
	["pt-br"] = {
		decimalSeparator = ",",
		groupDelimiter = ".",
		{ 1, "" },
		{ 1000, " mil" },
		{ 1000000, " mi" },
		{ 1000000000, " bi" }
	},
	["zh-cn"] = {
		decimalSeparator = ".",
		groupDelimiter = ",",
		{ 1, "" },
		{ 1000, "千" },
		{ 10000, "万" },
		{ 100000000, "亿" }
	},
	["zh-cjv"] = {
		decimalSeparator = ".",
		groupDelimiter = ",",
		{ 1, "" },
		{ 1000, "千" },
		{ 10000, "万" },
		{ 100000000, "亿" }
	},
	["zh-tw"] = {
		decimalSeparator = ".",
		groupDelimiter = ",",
		{ 1, "" },
		{ 1000, "千" },
		{ 10000, "萬" },
		{ 100000000, "億" }
	},
	["ko-kr"] = {
		decimalSeparator = ".",
		groupDelimiter = ",",
		{ 1, "" },
		{ 1000, "천" },
		{ 10000, "만" },
		{ 100000000, "억" }
	},
	["ja-jp"] = {
		decimalSeparator = ".",
		groupDelimiter = ",",
		{ 1, "" },
		{ 1000, "千" },
		{ 10000, "万" },
		{ 100000000, "億" }
	},
	["it-it"] = {
		decimalSeparator = ",",
		groupDelimiter = " ",
		{ 1, "" },
		{ 1000, " mila" },
		{ 1000000, " Mln" },
		{ 1000000000, " Mld" }
	},
	["ru-ru"] = {
		decimalSeparator = ",",
		groupDelimiter = ".",
		{ 1, "" },
		{ 1000, " тыс" },
		{ 1000000, " млн" },
		{ 1000000000, " млрд" }
	},
	["id-id"] = {
		decimalSeparator = ",",
		groupDelimiter = ".",
		{ 1, "" },
		{ 1000, " rb" },
		{ 1000000, " jt" },
		{ 1000000000, " M" }
	},
	["vi-vn"] = {
		decimalSeparator = ".",
		groupDelimiter = " ",
		{ 1, "" },
		{ 1000, " N" },
		{ 1000000, " Tr" },
		{ 1000000000, " T" }
	},
	["tr-tr"] = {
		decimalSeparator = ",",
		groupDelimiter = ".",
		{ 1, "" },
		{ 1000, " B" },
		{ 1000000, " Mn" },
		{ 1000000000, " Mr" }
	}
}
config["en-gb"] = config["en-us"]
config["es-mx"] = config["es-es"]
config["th-th"] = config["en-us"]

local function _(Text: string): number
	return string.find(Text, "%.") or #Text + 1
end

local _ = function(Value: number)
	return if Value == 0 then 0 else -(math.floor((math.log10((math.abs(Value))))) + 1)
end

local _ = function(Value: number, p1, Truncate): number
	-- upvalues: RoundingBehaviourModule (copy)
	local v1 = 10 ^ (p1 + (if Value == 0 then 0 else -(math.floor((math.log10((math.abs(Value))))) + 1)))
	
	return (if Truncate == RoundingBehaviourModule.Truncate then math.modf(Value * v1) else math.floor(Value * v1 + 0.5)) / v1
end

local function addGroupDelimiters(Segment, GroupDelimiter): string
	local Text: string = Segment
	local Formatted = string.format("%%1%s%%2", GroupDelimiter)
	repeat
		local Replaced2
		Text, Replaced2 = string.gsub(Text, "^(-?%d+)(%d%d%d)", Formatted)
	until Replaced2 == 0
	return Text
end

local function findDenominationEntry(Entry, Value: number, RoundToClosest)
	-- upvalues: RoundingBehaviourModule (copy)
	local Entry1 = Entry[1]
	local Magnitude = math.abs(Value)
	local Entry2 = nil
	
	for i = #Entry, 2, -1 do
		Entry2 = Entry[i]
		
		if (if RoundToClosest == RoundingBehaviourModule.Truncate then Entry2[1] else Entry2[1] - Entry[i - 1][1] / 2) <= Magnitude then
			Entry1 = Entry2
			
			return Entry1
		end
	end
	return Entry1
end

return {
	localize = function(p1, p2)
		-- upvalues: config (copy), LoggerModule (copy), addGroupDelimiters (copy)
		if p1 == 0 then
			return "0"
		end
		local Entry = config[p2]
		
		if not Entry then
			Entry = config["en-us"]
			LoggerModule:warning(string.format("Warning: Locale not found: '%s', reverting to '%s' instead.", tostring(p2), "en-us"))
		end
		return if Entry.groupDelimiter then addGroupDelimiters(p1, Entry.groupDelimiter) else p1
	end,
	abbreviate = function(p1, p2, Truncate, p3: number): string
		-- upvalues: RoundingBehaviourModule (copy), config (copy), LoggerModule (copy), findDenominationEntry (copy), addGroupDelimiters (copy)
		if p1 == 0 then
			return "0"
		end
		if Truncate == nil then
			Truncate = RoundingBehaviourModule.RoundToClosest
		end
		if game:GetFastFlag("AllowNumberLocalizationSigFigParam") then
			if p3 == nil then
				p3 = 3
			end
		else
			p3 = 3
		end
		local Entry = config[p2]
		
		if not Entry then
			Entry = config["en-us"]
			LoggerModule:warning(string.format("Warning: Locale not found: '%s', reverting to '%s' instead.", tostring(p2), "en-us"))
		end
		local DenominationEntry = findDenominationEntry(Entry, p1, Truncate)
		local DenominationEntry1 = DenominationEntry[2]
		local Value = p1 / DenominationEntry[1]
		local v1 = 10 ^ (p3 + (if Value == 0 then 0 else -(math.floor((math.log10((math.abs(Value))))) + 1)))
		local v2 = (if Truncate == RoundingBehaviourModule.Truncate then math.modf(Value * v1) else math.floor(Value * v1 + 0.5)) / v1
		local Text = tostring(if Truncate == RoundingBehaviourModule.Truncate then math.modf(v2 * 10) / 10 else math.floor(v2 * 10 + 0.5) / 10)
		local FoundAt: number = string.find(Text, "%.") or #Text + 1
		local Segment = string.sub(Text, 1, FoundAt - 1)
		local Segment1 = string.sub(Text, FoundAt + 1, #Text)
		
		if Entry.groupDelimiter then
			Segment = addGroupDelimiters(Segment, Entry.groupDelimiter)
		end
		return if #Segment1 > 0 then Segment .. Entry.decimalSeparator .. Segment1 .. DenominationEntry1 else Segment .. DenominationEntry1
	end,
	logger = LoggerModule
}