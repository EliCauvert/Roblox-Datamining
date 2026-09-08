local appLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local contentProviderService = game:GetService("ContentProvider")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildExperienceBuyRobuxContextModule = require(buildExperience.Flags.FFlagBuildExperienceBuyRobuxContext)

local function _()
	-- upvalues: contentProviderService (ref), fFlagBuildExperienceBuyRobuxContextModule (ref)
	return `{u115}upgrades/robux?ctx={if fFlagBuildExperienceBuyRobuxContextModule then "build-uapp" else "navpopover"}`
end

return function(p1, p2)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), useOpenWebView (ref), reactModule (ref), appLifecycleObserverService (ref), contentProviderService (ref), fFlagBuildExperienceBuyRobuxContextModule (ref)
	local title = useLocalization({
		title = localizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_SHEET_TITLE
	}).title
	local var1 = useOpenWebView()
	local var2 = reactModule.useRef(false)
	local var3 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), p1 (ref)
		if not var2.current then return end
		var2.current = false
		
		if p1 then
			p1()
		end
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p2 (ref), appLifecycleObserverService (copy), var3 (ref), var2 (ref)
		if p1 == nil then
			return function() end
		end
		local onUnhideConnection = (p2 or appLifecycleObserverService).OnUnhide:Connect(var3)
		
		return function()
			-- upvalues: var2 (copy), onUnhideConnection (ref)
			var2.current = false
			onUnhideConnection:Disconnect()
		end
	end, { p2, var3, p1 })
	
	return reactModule.useCallback(function()
		-- upvalues: var2 (ref), p1 (ref), var1 (ref), contentProviderService (copy), fFlagBuildExperienceBuyRobuxContextModule (copy), title (ref), var3 (ref)
		var2.current = p1 ~= nil
		var1(`{u196}upgrades/robux?ctx={if fFlagBuildExperienceBuyRobuxContextModule then "build-uapp" else "navpopover"}`, title, if p1 ~= nil then nil else var3)
	end, { var3, p1, var1, title })
end