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

local function addGroupDelimiters(p0, p1)
	local formattedText = string.format("%%1%s%%2", p1)
	local _ = nil
	repeat
		local replaced, replaced_1 = string.gsub(p0, "^(-?%d+)(%d%d%d)", formattedText)
		p0 = replaced
	until replaced_1 == 0
	return p0
end

return function(p2, p3)
	-- upvalues: t (ref), addGroupDelimiters (ref)
	return addGroupDelimiters(p3, t[p2] or ",")
end