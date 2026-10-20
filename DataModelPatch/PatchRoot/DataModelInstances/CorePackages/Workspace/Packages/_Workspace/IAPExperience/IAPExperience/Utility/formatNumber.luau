local config = {
	["en-us"] = ",",
	["en-gb"] = ",",
	["es-mx"] = ",",
	["es-es"] = ".",
	["fr-fr"] = " ",
	["de-de"] = " ",
	["pt-br"] = ".",
	["zh-cn"] = ",",
	["zh-cjv"] = ",",
	["zh-tw"] = ",",
	["ko-kr"] = ",",
	["ja-jp"] = ",",
	["it-it"] = " ",
	["ru-ru"] = ".",
	["id-id"] = ".",
	["vi-vn"] = ".",
	["th-th"] = ",",
	["tr-tr"] = "."
}

local function addGroupDelimiters(Text: string, p1): string
	local Formatted = string.format("%%1%s%%2", p1)
	repeat
		local Replaced2
		Text, Replaced2 = string.gsub(Text, "^(-?%d+)(%d%d%d)", Formatted)
	until Replaced2 == 0
	return Text
end

return function(p1, p2)
	-- upvalues: config (copy), addGroupDelimiters (copy)
	return (addGroupDelimiters(p2, config[p1] or ","))
end