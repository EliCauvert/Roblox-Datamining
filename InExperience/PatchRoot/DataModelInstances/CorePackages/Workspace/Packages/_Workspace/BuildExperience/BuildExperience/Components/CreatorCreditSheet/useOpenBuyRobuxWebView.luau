local AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local ContentProvider = game:GetService("ContentProvider")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseOpenWebViewFunction = require(Parent.WebViewUtils).useOpenWebView
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildExperienceBuyRobuxContextModule = require(BuildExperience.Flags.FFlagBuildExperienceBuyRobuxContext)

local function _(): string
	-- upvalues: ContentProvider (copy), FFlagBuildExperienceBuyRobuxContextModule (copy)
	return `{string.gsub(string.gsub(ContentProvider.BaseUrl:lower(), "/m.", "/www."), "http:", "https:")}upgrades/robux?ctx={if FFlagBuildExperienceBuyRobuxContextModule then "build-uapp" else "navpopover"}`
end

return function(Callback, p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseOpenWebViewFunction (copy), ReactModule (copy), AppLifecycleObserverService (copy), ContentProvider (copy), FFlagBuildExperienceBuyRobuxContextModule (copy)
	local Title = UseLocalizationFunction({
		title = LocalizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_SHEET_TITLE
	}).title
	local UseOpenWebViewResult = UseOpenWebViewFunction()
	local UseRefResult = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), Callback (copy)
		if not UseRefResult.current then return end
		UseRefResult.current = false
		
		if Callback then
			Callback()
		end
	end, { Callback })
	ReactModule.useEffect(function()
		-- upvalues: Callback (copy), p1 (copy), AppLifecycleObserverService (upval), UseResult (copy), UseRefResult (copy)
		if Callback == nil then
			return function() end
		else
			local OnUnhideConnection = (p1 or AppLifecycleObserverService).OnUnhide:Connect(UseResult)
			
			return function()
				-- upvalues: UseRefResult (upval), OnUnhideConnection (copy)
				UseRefResult.current = false
				OnUnhideConnection:Disconnect()
			end
		end
	end, { p1, UseResult, Callback })
	
	return ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), Callback (copy), UseOpenWebViewResult (copy), ContentProvider (upval), FFlagBuildExperienceBuyRobuxContextModule (upval), Title (copy), UseResult (copy)
		UseRefResult.current = Callback ~= nil
		UseOpenWebViewResult(`{string.gsub(string.gsub(ContentProvider.BaseUrl:lower(), "/m.", "/www."), "http:", "https:")}upgrades/robux?ctx={if FFlagBuildExperienceBuyRobuxContextModule then "build-uapp" else "navpopover"}`, Title, if Callback == nil then nil else UseResult)
	end, { UseResult, Callback, UseOpenWebViewResult, Title })
end