local ExternalWebPageTypeEnum = {
	PolicyUpdate = "policy_update",
	ParentalControlsLaunch = "parental_controls_launch",
	SpendingSettings = "spending_settings"
}

local function GetExternalLocale(Text: string)
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
	
	if config[Text] then
		return config[Text]
	end
	local List = {}
	
	for i in Text:gmatch("([^%-_]+)") do
		table.insert(List, i)
	end
	return if List[1] then List[1] else "en"
end

return {
	ExternalWebDomainEnum = { Zendesk = "zendesk" },
	ExternalWebPageTypeEnum = ExternalWebPageTypeEnum,
	getZendeskUrl = function(p1): string
		-- upvalues: GetExternalLocale (copy)
		local v1 = "https://en.help.roblox.com/hc/"
		local Locale: string = p1.locale
		local Inverted: boolean = if Locale then not not string.match(Locale, "^[%w%-_]+$") else false
		local Text: string = if Inverted then v1 .. GetExternalLocale(p1.locale) else v1 .. "en-us"
		local Articleid: string = p1.articleid
		
		if if Articleid then not not string.match(Articleid, "^[a-zA-Z0-9]+$") else false then
			Text ..= "/articles/" .. p1.articleid
		end
		return Text
	end,
	getZendeskWebViewTitleKey = function(ParentalControlsLaunch): string
		-- upvalues: ExternalWebPageTypeEnum (copy)
		return if ParentalControlsLaunch == ExternalWebPageTypeEnum.PolicyUpdate then "Feature.Notifications.Webview.Title.PolicyUpdate" elseif ParentalControlsLaunch == ExternalWebPageTypeEnum.ParentalControlsLaunch then "Feature.Notifications.Webview.Title.ParentalControlsLaunch" elseif ParentalControlsLaunch == ExternalWebPageTypeEnum.SpendingSettings then "Feature.Notifications.Webview.Title.SpendingSettings" else "CommonUI.Features.Label.Help"
	end,
	getExternalLocale = GetExternalLocale,
	isValidLocale = function(Text: string): boolean
		return if Text then not not string.match(Text, "^[%w%-_]+$") else false
	end,
	isValidArticleId = function(Text: string): boolean
		return if Text then not not string.match(Text, "^[a-zA-Z0-9]+$") else false
	end
}