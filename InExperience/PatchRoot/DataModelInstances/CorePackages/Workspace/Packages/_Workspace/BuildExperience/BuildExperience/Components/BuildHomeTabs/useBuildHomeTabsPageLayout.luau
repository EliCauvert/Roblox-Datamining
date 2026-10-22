local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), FoundationModule (copy), ReactModule (copy)
	local Time300 = UseTokensFunction().Time.Time_300
	local ReducedMotion = FoundationModule.Hooks.usePreferences().reducedMotion
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		local t = {}
		
		for i, tab in p1.tabs do
			t[tostring(tab.id)] = i - 1
		end
		return t
	end, { p1.tabs })
	local UseMemoResultEntry = UseMemoResult[p1.activeTab]
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), p1 (copy), UseStateResult2 (copy)
		if UseStateResult and not p1.showTabs then
			UseStateResult2(false)
		end
	end, { UseStateResult, p1.showTabs })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult (copy), UseMemoResult (copy), UseMemoResultEntry (copy), ReducedMotion (copy), UseStateResult2 (copy), Time300 (copy), p1 (copy)
		local Current = UseRefResult.current
		local UseMemoResultEntry1 = UseMemoResult[tostring(p2)]
		
		if Current ~= nil and UseMemoResultEntry1 ~= nil and UseMemoResultEntry1 ~= UseMemoResultEntry then
			if ReducedMotion then
				Current.Animated = false
				Current:JumpToIndex(UseMemoResultEntry1)
				Current.Animated = true
			else
				UseStateResult2(true)
				Current.TweenTime = Time300
				Current:JumpToIndex(UseMemoResultEntry1)
			end
		end
		p1.onTabActivated(p2)
	end, {
		UseMemoResultEntry,
		p1.onTabActivated,
		ReducedMotion,
		UseMemoResult,
		Time300
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult (copy), UseMemoResultEntry (copy)
		local Current = UseRefResult.current
		
		if UseStateResult or Current == nil or UseMemoResultEntry == nil then return end
		local CurrentPage = Current.CurrentPage
		
		if CurrentPage == nil or CurrentPage.LayoutOrder ~= UseMemoResultEntry then
			Current.Animated = false
			Current:JumpToIndex(UseMemoResultEntry)
			Current.Animated = true
		end
	end, { UseMemoResultEntry, UseStateResult, p1.showTabs })
	
	return {
		layoutRef = UseRefResult,
		isSliding = UseStateResult,
		tabOrder = UseMemoResult,
		onStopped = UseResult,
		onTabActivated = UseResult1
	}
end