local roundingBehaviourModule = require(script.Parent.RoundingBehaviour)
local loggerModule = require(script.Parent.Logger)
game:DefineFastFlag("AllowNumberLocalizationSigFigParam", false)
local t = {
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
		{ 1000, "\229\141\131" },
		{ 10000, "\228\184\135" },
		{ 100000000, "\228\186\191" }
	},
	["zh-cjv"] = {
		decimalSeparator = ".",
		groupDelimiter = ",",
		{ 1, "" },
		{ 1000, "\229\141\131" },
		{ 10000, "\228\184\135" },
		{ 100000000, "\228\186\191" }
	},
	["zh-tw"] = {
		decimalSeparator = ".",
		groupDelimiter = ",",
		{ 1, "" },
		{ 1000, "\229\141\131" },
		{ 10000, "\232\144\172" },
		{ 100000000, "\229\132\132" }
	},
	["ko-kr"] = {
		decimalSeparator = ".",
		groupDelimiter = ",",
		{ 1, "" },
		{ 1000, "\236\178\156" },
		{ 10000, "\235\167\140" },
		{ 100000000, "\236\150\181" }
	},
	["ja-jp"] = {
		decimalSeparator = ".",
		groupDelimiter = ",",
		{ 1, "" },
		{ 1000, "\229\141\131" },
		{ 10000, "\228\184\135" },
		{ 100000000, "\229\132\132" }
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
		{ 1000, " \209\130\209\139\209\129" },
		{ 1000000, " \208\188\208\187\208\189" },
		{ 1000000000, " \208\188\208\187\209\128\208\180" }
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
t["en-gb"] = t["en-us"]
t["es-mx"] = t["es-es"]
t["th-th"] = t["en-us"]

local function _(p0) --[[ line: 172 | named "findDecimalPointIndex" ]]
	return string.find(p0, "%.") or #p0 + 1
end

local _ = function(value) --[[ line: 177 | named "findDecimalOffset" ]]
	return if value == 0 then 0 else -(math.floor(math.log10(math.abs(value))) + 1)
end

local _ = function(value, p1, p2) --[[ line: 186 | named "roundToSignificantDigits" ]]
	-- upvalues: roundingBehaviourModule (ref)
	local var5 = 10 ^ (p1 + (if value == 0 then 0 else -(math.floor(math.log10(math.abs(value))) + 1)))
	
	return (if p2 == roundingBehaviourModule.Truncate then math.modf(value * var5) else math.floor(value * var5 + 0.5)) / var5
end

local function addGroupDelimiters(p3, p4) --[[ line: 198 ]]
	local var6 = p3
	local formattedText = string.format("%%1%s%%2", p4)
	repeat
		local replaced, replaced_1 = string.gsub(var6, "^(-?%d+)(%d%d%d)", formattedText)
		var6 = replaced
	until replaced_1 == 0
	return var6
end

local function findDenominationEntry(a, b, p5) --[[ line: 211 ]]
	-- upvalues: roundingBehaviourModule (ref)
	local var10 = a[1]
	local absValue = math.abs(b)
	
	for i = #a, 2, -1 do
		local var12 = a[i]
		
		if (if p5 == roundingBehaviourModule.Truncate then var12[1] else var12[1] - a[i - 1][1] / 2) > absValue then
			continue
		end
		var10 = var12
		
		return var10
	end
	return var10
end

return {
	localize = function(p6, p7) --[[ line: 232 ]]
		-- upvalues: t (ref), loggerModule (ref), addGroupDelimiters (ref)
		if p6 == 0 then
			return "0"
		end
		local var13 = t[p7]
		
		if not var13 then
			var13 = t["en-us"]
			loggerModule:warning(string.format("Warning: Locale not found: '%s', reverting to '%s' instead.", tostring(p7), "en-us"))
		end
		return if var13.groupDelimiter then addGroupDelimiters(p6, var13.groupDelimiter) else p6
	end,
	abbreviate = function(p8, p9, p10, p11) --[[ line: 257 ]]
		-- upvalues: roundingBehaviourModule (ref), t (ref), loggerModule (ref), findDenominationEntry (ref), addGroupDelimiters (ref)
		if p8 == 0 then
			return "0"
		elseif p10 == nil then
			p10 = roundingBehaviourModule.RoundToClosest
		end
		if not game:GetFastFlag("AllowNumberLocalizationSigFigParam") then
			p11 = 3
		elseif p11 == nil then
			p11 = 3
		end
		local var14 = t[p9]
		
		if not var14 then
			var14 = t["en-us"]
			loggerModule:warning(string.format("Warning: Locale not found: '%s', reverting to '%s' instead.", tostring(p9), "en-us"))
		end
		local var15 = findDenominationEntry(var14, p8, p10)
		local var16 = var15[2]
		local var17 = p8 / var15[1]
		local var18 = 10 ^ (p11 + (if var17 == 0 then 0 else -(math.floor(math.log10(math.abs(var17))) + 1)))
		local var19 = (if p10 == roundingBehaviourModule.Truncate then math.modf(var17 * var18) else math.floor(var17 * var18 + 0.5)) / var18
		local var20 = tostring(if p10 == roundingBehaviourModule.Truncate then math.modf(var19 * 10) / 10 else math.floor(var19 * 10 + 0.5) / 10)
		local var21 = string.find(var20, "%.") or #var20 + 1
		local substring = string.sub(var20, 1, var21 - 1)
		local substring_1 = string.sub(var20, var21 + 1, #var20)
		
		if var14.groupDelimiter then
			substring = addGroupDelimiters(substring, var14.groupDelimiter)
		end
		return if #substring_1 > 0 then substring .. var14.decimalSeparator .. substring_1 .. var16 else substring .. var16
	end,
	logger = loggerModule
}