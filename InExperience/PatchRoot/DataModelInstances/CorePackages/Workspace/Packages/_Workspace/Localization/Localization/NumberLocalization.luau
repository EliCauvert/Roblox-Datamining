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

local function _(p1)
	return string.find(p1, "%.") or #p1 + 1
end

local _ = function(value)
	return if value == 0 then 0 else -(math.floor(math.log10(math.abs(value))) + 1)
end

local _ = function(value, p1, p2)
	-- upvalues: roundingBehaviourModule (ref)
	local var1 = 10 ^ (p1 + (if value == 0 then 0 else -(math.floor(math.log10(math.abs(value))) + 1)))
	
	return (if p2 == roundingBehaviourModule.Truncate then math.modf(value * var1) else math.floor(value * var1 + 0.5)) / var1
end

local function addGroupDelimiters(p1, p2)
	local var1 = p1
	local formattedText = string.format("%%1%s%%2", p2)
	repeat
		local replaced, replaced_1 = string.gsub(var1, "^(-?%d+)(%d%d%d)", formattedText)
		var1 = replaced
	until replaced_1 == 0
	return var1
end

local function findDenominationEntry(a, b, p1)
	-- upvalues: roundingBehaviourModule (ref)
	local var1 = a[1]
	local absValue = math.abs(b)
	
	for i = #a, 2, -1 do
		local var2 = a[i]
		
		if (if p1 == roundingBehaviourModule.Truncate then var2[1] else var2[1] - a[i - 1][1] / 2) > absValue then
			continue
		end
		var1 = var2
		
		return var1
	end
	return var1
end

return {
	localize = function(p2, p3)
		-- upvalues: t (ref), loggerModule (ref), addGroupDelimiters (ref)
		if p2 == 0 then
			return "0"
		end
		local var3 = t[p3]
		
		if not var3 then
			var3 = t["en-us"]
			loggerModule:warning(string.format("Warning: Locale not found: '%s', reverting to '%s' instead.", tostring(p3), "en-us"))
		end
		return if var3.groupDelimiter then addGroupDelimiters(p2, var3.groupDelimiter) else p2
	end,
	abbreviate = function(p2, p3, p4, p5)
		-- upvalues: roundingBehaviourModule (ref), t (ref), loggerModule (ref), findDenominationEntry (ref), addGroupDelimiters (ref)
		if p2 == 0 then
			return "0"
		elseif p4 == nil then
			p4 = roundingBehaviourModule.RoundToClosest
		end
		if not game:GetFastFlag("AllowNumberLocalizationSigFigParam") then
			p5 = 3
		elseif p5 == nil then
			p5 = 3
		end
		local var3 = t[p3]
		
		if not var3 then
			var3 = t["en-us"]
			loggerModule:warning(string.format("Warning: Locale not found: '%s', reverting to '%s' instead.", tostring(p3), "en-us"))
		end
		local var4 = findDenominationEntry(var3, p2, p4)
		local var5 = var4[2]
		local var6 = p2 / var4[1]
		local var7 = 10 ^ (p5 + (if var6 == 0 then 0 else -(math.floor(math.log10(math.abs(var6))) + 1)))
		local var8 = (if p4 == roundingBehaviourModule.Truncate then math.modf(var6 * var7) else math.floor(var6 * var7 + 0.5)) / var7
		local var9 = tostring(if p4 == roundingBehaviourModule.Truncate then math.modf(var8 * 10) / 10 else math.floor(var8 * 10 + 0.5) / 10)
		local var10 = string.find(var9, "%.") or #var9 + 1
		local substring = string.sub(var9, 1, var10 - 1)
		local substring_1 = string.sub(var9, var10 + 1, #var9)
		
		if var3.groupDelimiter then
			substring = addGroupDelimiters(substring, var3.groupDelimiter)
		end
		return if #substring_1 > 0 then substring .. var14.decimalSeparator .. substring_1 .. var16 else substring .. var16
	end,
	localizeDecimal = function(p2, p3, p4)
		-- upvalues: t (ref), loggerModule (ref), addGroupDelimiters (ref)
		if p2 == 0 then
			return "0"
		elseif p4 == nil then
			p4 = 2
		end
		local var3 = t[p3]
		
		if not var3 then
			var3 = t["en-us"]
			loggerModule:warning(string.format("Warning: Locale not found: '%s', reverting to '%s' instead.", tostring(p3), "en-us"))
		end
		local var4 = 10 ^ p4
		local var5 = math.floor(math.abs(p2) * var4 + 0.5) / var4
		local var6 = if p2 < 0 and var5 ~= 0 then "-" else ""
		local formattedText = string.format(string.format("%%.%df", p4), var5)
		local var7 = string.find(formattedText, "%.") or #formattedText + 1
		local substring = string.sub(formattedText, 1, var7 - 1)
		local substring_1 = string.sub(formattedText, var7 + 1, #formattedText)
		
		if var3.groupDelimiter then
			substring = addGroupDelimiters(substring, var3.groupDelimiter)
		end
		local replaced = string.gsub(substring_1, "0+$", "")
		
		return if #replaced > 0 then var6 .. substring .. var24.decimalSeparator .. replaced else var6 .. substring
	end,
	logger = loggerModule
}