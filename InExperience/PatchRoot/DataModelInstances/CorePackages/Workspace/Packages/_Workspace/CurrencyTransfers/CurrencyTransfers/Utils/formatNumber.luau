local t = {
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

local function addGroupDelimiters(p1, p2)
	local formattedText = string.format("%%1%s%%2", p2)
	local _ = nil
	repeat
		local replaced, replaced_1 = string.gsub(p1, "^(-?%d+)(%d%d%d)", formattedText)
		p1 = replaced
	until replaced_1 == 0
	return p1
end

return function(p1, p2)
	-- upvalues: t (ref), addGroupDelimiters (ref)
	return addGroupDelimiters(p2, t[p1] or ",")
end