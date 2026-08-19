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

local function _() --[[ line: 21 | named "getPurchaseRobuxUrl" ]]
	-- upvalues: contentProviderService (ref), fFlagBuildExperienceBuyRobuxContextModule (ref)
	return `{u123}upgrades/robux?ctx={if fFlagBuildExperienceBuyRobuxContextModule then "build-uapp" else "navpopover"}`
end

return function(p0, p1) --[[ line: 28 | named "useOpenBuyRobuxWebView" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useOpenWebView (ref), reactModule (ref), appLifecycleObserverService (ref), contentProviderService (ref), fFlagBuildExperienceBuyRobuxContextModule (ref)
	local var7 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
		title = localizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_SHEET_TITLE
	}) else nil).title else localizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_SHEET_TITLE
	local var8 = useOpenWebView()
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useCallback(function() --[[ line: 42 ]]
		-- upvalues: var9 (ref), p0 (ref)
		if not var9.current then return end
		var9.current = false
		
		if p0 then
			p0()
		end
	end, { p0 })
	reactModule.useEffect(function() --[[ line: 52 ]]
		-- upvalues: p0 (ref), p1 (ref), appLifecycleObserverService (copy), var10 (ref), var9 (ref)
		if p0 == nil then
			return function() --[[ line: 54 ]] end
		end
		local onUnhideConnection = (p1 or appLifecycleObserverService).OnUnhide:Connect(var10)
		
		return function() --[[ line: 58 ]]
			-- upvalues: var9 (copy), onUnhideConnection (ref)
			var9.current = false
			onUnhideConnection:Disconnect()
		end
	end, { p1, var10, p0 })
	
	return reactModule.useCallback(function() --[[ line: 64 ]]
		-- upvalues: var9 (ref), p0 (ref), var8 (ref), contentProviderService (copy), fFlagBuildExperienceBuyRobuxContextModule (copy), var7 (ref), var10 (ref)
		var9.current = p0 ~= nil
		var8(`{u214}upgrades/robux?ctx={if fFlagBuildExperienceBuyRobuxContextModule then "build-uapp" else "navpopover"}`, var7, if p0 ~= nil then nil else var10)
	end, { var10, p0, var8, var7 })
end