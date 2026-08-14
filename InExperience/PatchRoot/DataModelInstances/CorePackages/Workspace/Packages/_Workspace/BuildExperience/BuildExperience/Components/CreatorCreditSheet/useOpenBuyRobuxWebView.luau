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

local function _() --[[ line: 20 | named "getPurchaseRobuxUrl" ]]
	-- upvalues: contentProviderService (ref)
	return string.gsub(string.gsub(contentProviderService.BaseUrl:lower(), "/m.", "/www."), "http:", "https:") .. "upgrades/robux?ctx=navpopover"
end

return function(p0, p1) --[[ line: 26 | named "useOpenBuyRobuxWebView" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useOpenWebView (ref), reactModule (ref), appLifecycleObserverService (ref), contentProviderService (ref)
	local var6 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
		title = localizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_SHEET_TITLE
	}) else nil).title else localizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_SHEET_TITLE
	local var7 = useOpenWebView()
	local var8 = reactModule.useRef(false)
	local var9 = reactModule.useCallback(function() --[[ line: 40 ]]
		-- upvalues: var8 (ref), p0 (ref)
		if not var8.current then return end
		var8.current = false
		
		if p0 then
			p0()
		end
	end, { p0 })
	reactModule.useEffect(function() --[[ line: 50 ]]
		-- upvalues: p0 (ref), p1 (ref), appLifecycleObserverService (copy), var9 (ref), var8 (ref)
		if p0 == nil then
			return function() --[[ line: 52 ]] end
		end
		local onUnhideConnection = (p1 or appLifecycleObserverService).OnUnhide:Connect(var9)
		
		return function() --[[ line: 56 ]]
			-- upvalues: var8 (copy), onUnhideConnection (ref)
			var8.current = false
			onUnhideConnection:Disconnect()
		end
	end, { p1, var9, p0 })
	
	return reactModule.useCallback(function() --[[ line: 62 ]]
		-- upvalues: var8 (ref), p0 (ref), var7 (ref), contentProviderService (copy), var6 (ref), var9 (ref)
		var8.current = p0 ~= nil
		var7(string.gsub(string.gsub(contentProviderService.BaseUrl:lower(), "/m.", "/www."), "http:", "https:") .. "upgrades/robux?ctx=navpopover", var6, if p0 ~= nil then nil else var9)
	end, { var9, p0, var7, var6 })
end