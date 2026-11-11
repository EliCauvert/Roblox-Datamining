local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)
local PromptConstantsModule = {
	webViewUrlAccountSettings = UrlModule.WWW_URL .. "my/account#!/security?src=authpopup",
	webViewUrlEmailHighlight = UrlModule.WWW_URL .. "my/account#!/security?src=emailhighlight",
	webViewUrlHelpPage = "https://en.help.roblox.com/hc/articles/212459863"
}

function PromptConstantsModule.getWebViewUrlAccountSettings()
	-- upvalues: PromptConstantsModule (copy)
	return PromptConstantsModule.webViewUrlAccountSettings
end

function PromptConstantsModule.getWebViewUrlEmailHighlight()
	-- upvalues: PromptConstantsModule (copy)
	return PromptConstantsModule.webViewUrlEmailHighlight
end

function PromptConstantsModule.getWebViewUrlHelpPage()
	-- upvalues: PromptConstantsModule (copy)
	return PromptConstantsModule.webViewUrlHelpPage
end

return PromptConstantsModule