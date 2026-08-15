local appLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local contentProviderService = game:GetService("ContentProvider")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local localizationStringsModule = require(buildExperience.LocalizationStrings)

local function _() --[[ line: 16 | named "getPurchaseRobuxUrl" ]]
	-- upvalues: contentProviderService (ref)
	return string.gsub(string.gsub(contentProviderService.BaseUrl:lower(), "/m.", "/www."), "http:", "https:") .. "upgrades/robux?ctx=navpopover"
end

return function(p0, p1) --[[ line: 22 | named "useOpenBuyRobuxWebView" ]]
	-- upvalues: useOpenWebView (ref), reactModule (ref), appLifecycleObserverService (ref), contentProviderService (ref), localizationStringsModule (ref)
	local var5 = useOpenWebView()
	local var6 = reactModule.useRef(false)
	local var7 = reactModule.useCallback(function() --[[ line: 28 ]]
		-- upvalues: var6 (ref), p0 (ref)
		if not var6.current then return end
		var6.current = false
		
		if p0 then
			p0()
		end
	end, { p0 })
	reactModule.useEffect(function() --[[ line: 38 ]]
		-- upvalues: p0 (ref), p1 (ref), appLifecycleObserverService (copy), var7 (ref), var6 (ref)
		if p0 == nil then
			return function() --[[ line: 40 ]] end
		end
		local onUnhideConnection = (p1 or appLifecycleObserverService).OnUnhide:Connect(var7)
		
		return function() --[[ line: 44 ]]
			-- upvalues: var6 (copy), onUnhideConnection (ref)
			var6.current = false
			onUnhideConnection:Disconnect()
		end
	end, { p1, var7, p0 })
	
	return reactModule.useCallback(function() --[[ line: 50 ]]
		-- upvalues: var6 (ref), p0 (ref), var5 (ref), contentProviderService (copy), localizationStringsModule (copy), var7 (ref)
		var6.current = p0 ~= nil
		var5(string.gsub(string.gsub(contentProviderService.BaseUrl:lower(), "/m.", "/www."), "http:", "https:") .. "upgrades/robux?ctx=navpopover", localizationStringsModule.CREATOR_CREDIT_BUY_ROBUX_SHEET_TITLE, if p0 ~= nil then nil else var7)
	end, { var7, p0, var5 })
end