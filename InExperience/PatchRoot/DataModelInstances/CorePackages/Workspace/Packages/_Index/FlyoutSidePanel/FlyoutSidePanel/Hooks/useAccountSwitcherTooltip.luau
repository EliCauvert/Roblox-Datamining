local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local UseDrawerVisibleFunction = require(Parent.Drawer).Hooks.useDrawerVisible
local AppStorageJsonCacheUtils = require(Parent.AppCommonLib).Utils.AppStorageJsonCacheUtils
local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local FlyoutAccountSwitcherTooltipMaxShows = game:DefineFastInt("FlyoutAccountSwitcherTooltipMaxShows", 1)

local function _(p1, p2)
	local FlyoutSidePanelAccountSwitcherTooltipSeenCachedJsonForKey = p1:getCachedJsonForKey("FlyoutSidePanelAccountSwitcherTooltipSeen", p2)
	
	return if typeof(FlyoutSidePanelAccountSwitcherTooltipSeenCachedJsonForKey) == "number" then FlyoutSidePanelAccountSwitcherTooltipSeenCachedJsonForKey else nil
end

local _ = function(p1, p2, p3)
	-- upvalues: HttpService (copy)
	if pcall(function()
		-- upvalues: p1 (copy), HttpService (upval), p3 (copy)
		p1:SetItem("FlyoutSidePanelAccountSwitcherTooltipSeen", HttpService:JSONEncode(p3))
		p1:Flush()
	end) then
		p2:getCachedJsonForKey("FlyoutSidePanelAccountSwitcherTooltipSeen", true)
	end
end

return function(p1, p2, p3, p4)
	-- upvalues: AppStorageService (copy), ReactModule (copy), AppStorageJsonCacheUtils (copy), UseDrawerVisibleFunction (copy), FlyoutAccountSwitcherTooltipMaxShows (copy), HttpService (copy)
	local AppStorageService1 = if p3 == nil then AppStorageService else p3
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p3 (copy), AppStorageJsonCacheUtils (upval), AppStorageService1 (copy)
		return if p3 == nil then AppStorageJsonCacheUtils.default else AppStorageJsonCacheUtils.new(AppStorageService1)
	end, { p3, AppStorageService1 })
	local UseDrawerVisibleResult = UseDrawerVisibleFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: UseMemoResult (copy)
		local FlyoutSidePanelAccountSwitcherTooltipSeenCachedJsonForKey = UseMemoResult:getCachedJsonForKey("FlyoutSidePanelAccountSwitcherTooltipSeen", nil)
		
		return if typeof(FlyoutSidePanelAccountSwitcherTooltipSeenCachedJsonForKey) == "number" then FlyoutSidePanelAccountSwitcherTooltipSeenCachedJsonForKey else nil
	end)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_2 (copy), p1 (copy)
		UseStateResult2_2(p1.current ~= nil)
	end, { p1, UseDrawerVisibleResult, p2 })
	local IsUseStateResultBelow: boolean = p2 and (UseDrawerVisibleResult and (UseStateResult3 and (not UseStateResult1 and (UseStateResult ~= nil and UseStateResult < FlyoutAccountSwitcherTooltipMaxShows))))
	ReactModule.useEffect(function()
		-- upvalues: IsUseStateResultBelow (copy), UseStateResult (copy), AppStorageService1 (copy), UseMemoResult (copy), HttpService (upval)
		if IsUseStateResultBelow and UseStateResult ~= nil then
			local NewUseStateResult = UseStateResult + 1
			
			if pcall(function()
				-- upvalues: AppStorageService1 (copy), HttpService (upval), NewUseStateResult (copy)
				AppStorageService1:SetItem("FlyoutSidePanelAccountSwitcherTooltipSeen", HttpService:JSONEncode(NewUseStateResult))
				AppStorageService1:Flush()
			end) then
				UseMemoResult:getCachedJsonForKey("FlyoutSidePanelAccountSwitcherTooltipSeen", true)
			end
		end
	end, {
		IsUseStateResultBelow,
		UseStateResult,
		AppStorageService1,
		UseMemoResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseDrawerVisibleResult (copy), UseStateResult2_1 (copy), UseStateResult2 (copy), UseMemoResult (copy)
		if not UseDrawerVisibleResult then
			UseStateResult2_1(false)
			local FlyoutSidePanelAccountSwitcherTooltipSeenCachedJsonForKey = UseMemoResult:getCachedJsonForKey("FlyoutSidePanelAccountSwitcherTooltipSeen", true)
			UseStateResult2(if typeof(FlyoutSidePanelAccountSwitcherTooltipSeenCachedJsonForKey) == "number" then FlyoutSidePanelAccountSwitcherTooltipSeenCachedJsonForKey else nil)
		end
	end, { UseDrawerVisibleResult, UseMemoResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(true)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), AppStorageService1 (copy), UseMemoResult (copy), FlyoutAccountSwitcherTooltipMaxShows (upval), HttpService (upval)
		UseStateResult2_1(true)
		
		if pcall(function()
			-- upvalues: AppStorageService1 (copy), HttpService (upval), FlyoutAccountSwitcherTooltipMaxShows (copy)
			AppStorageService1:SetItem("FlyoutSidePanelAccountSwitcherTooltipSeen", HttpService:JSONEncode(FlyoutAccountSwitcherTooltipMaxShows))
			AppStorageService1:Flush()
		end) then
			UseMemoResult:getCachedJsonForKey("FlyoutSidePanelAccountSwitcherTooltipSeen", true)
		end
	end, { AppStorageService1, UseMemoResult })
	
	if p4 ~= nil then
		p4.current = UseResult1
	end
	return IsUseStateResultBelow, UseResult1, UseResult
end