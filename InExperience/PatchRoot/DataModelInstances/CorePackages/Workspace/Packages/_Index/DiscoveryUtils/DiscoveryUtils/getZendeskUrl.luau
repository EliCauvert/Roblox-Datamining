local t = {
	["zh-cn"] = "zh-cn",
	zh_cn = "zh-cn",
	["zh-cjv"] = "zh-cn",
	zh_cjv = "zh-cn",
	["zh-hans"] = "zh-cn",
	zh_hans = "zh-cn",
	["zh-tw"] = "zh-tw",
	zh_tw = "zh-tw",
	["zh-hant"] = "zh-tw",
	zh_hant = "zh-tw",
	["en-us"] = "en-us",
	en_us = "en-us",
	en = "en-us",
	["en-gb"] = "en-gb",
	en_gb = "en-gb",
	["fr-ca"] = "fr-ca",
	fr_ca = "fr-ca",
	nb = "no",
	["nb-no"] = "no",
	nb_no = "no"
}

local var1 = function(p0)
	-- upvalues: t (ref)
	if t[p0] then
		return t[p0]
	end
	local t_1 = {}
	
	for i in p0:gmatch("([^%-_]+)") do
		table.insert(t_1, i)
	end
	return if t_1[1] then t_1[1] else "en-us"
end

local _ = function(p1)
	return p1 and string.match(p1, "^[%w%-_]+$") ~= nil
end

local _ = function(p2)
	return p2 and string.match(p2, "^[a-zA-Z0-9]+$") ~= nil
end

return function(p3, p4, p5)
	-- upvalues: var1 (ref)
	return `{p3 or "https://en.help.roblox.com/hc"}/{if p4 and string.match(p4, "^[%w%-_]+$") ~= nil then var1(p4) else "en-us"}/{if p5 and string.match(p5, "^[a-zA-Z0-9]+$") ~= nil then `articles/{p5}` else ""}`
end