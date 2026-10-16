local config = {
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

local function v1(Text: string) --[[ Line: 24 ]]
	-- upvalues: config (copy)
	if config[Text] then
		return config[Text]
	end
	local List = {}
	
	for i in Text:gmatch("([^%-_]+)") do
		table.insert(List, i)
	end
	return if List[1] then List[1] else "en-us"
end

local function _(Text: string): boolean --[[ Line: 42 ]]
	return Text and string.match(Text, "^[%w%-_]+$") ~= nil
end

local _ = function(Text: string): boolean --[[ Line: 47 ]]
	return Text and string.match(Text, "^[a-zA-Z0-9]+$") ~= nil
end

return function(p1, Text: string, Text1: string): string --[[ Line: 52 | Named "getZendeskUrl" ]]
	-- upvalues: v1 (copy)
	local HasMatch: boolean = Text and string.match(Text, "^[%w%-_]+$") ~= nil
	local HasMatch1: boolean = Text1 and string.match(Text1, "^[a-zA-Z0-9]+$") ~= nil
	
	return `{p1 or "https://en.help.roblox.com/hc"}/{if HasMatch then v1(Text) else "en-us"}/{if HasMatch1 then `articles/{Text1}` else ""}`
end