local appLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local contentProviderService = game:GetService("ContentProvider")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagBuildExperienceBuyRobuxContextModule = require(buildExperience.Flags.FFlagBuildExperienceBuyRobuxContext)

local function _()
	-- upvalues: contentProviderService (ref), fFlagBuildExperienceBuyRobuxContextModule (ref)
	return `{u122}upgrades/robux?ctx={if fFlagBuildExperienceBuyRobuxContextModule then "build-uapp" else "navpopover"}`
end

return function(p1, p2)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useOpenWebView (ref), reactModule (ref), appLifecycleObserverService (ref), contentProviderService (ref), fFlagBuildExperienceBuyRobuxContextModule (ref)
	local var1 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
		title = localizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_SHEET_TITLE
	}) else nil).title else localizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_SHEET_TITLE
	local var2 = useOpenWebView()
	local var3 = reactModule.useRef(false)
	local var4 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), p1 (ref)
		if not var3.current then return end
		var3.current = false
		
		if p1 then
			p1()
		end
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p2 (ref), appLifecycleObserverService (copy), var4 (ref), var3 (ref)
		if p1 == nil then
			return function() end
		end
		local onUnhideConnection = (p2 or appLifecycleObserverService).OnUnhide:Connect(var4)
		
		return function()
			-- upvalues: var3 (copy), onUnhideConnection (ref)
			var3.current = false
			onUnhideConnection:Disconnect()
		end
	end, { p2, var4, p1 })
	
	return reactModule.useCallback(function()
		-- upvalues: var3 (ref), p1 (ref), var2 (ref), contentProviderService (copy), fFlagBuildExperienceBuyRobuxContextModule (copy), var1 (ref), var4 (ref)
		var3.current = p1 ~= nil
		var2(`{u212}upgrades/robux?ctx={if fFlagBuildExperienceBuyRobuxContextModule then "build-uapp" else "navpopover"}`, var1, if p1 ~= nil then nil else var4)
	end, { var4, p1, var2, var1 })
end