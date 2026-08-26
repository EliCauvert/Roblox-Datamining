local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local reactModule = require(parent.React)
local useSignalProfileInsightsByUserId = require(parent.ProfileInsights).useSignalProfileInsightsByUserId
local usePageSizeModule = require(socialTabsPage.Hooks.usePageSize)

return function(p1)
	-- upvalues: usePageSizeModule (ref), useSignalProfileInsightsByUserId (ref), reactModule (ref)
	local var1 = usePageSizeModule()
	local var2, var3 = useSignalProfileInsightsByUserId({ rankingStrategy = "tc_info_boost", userId = p1 })
	local var4 = if var2 and var2.mutualFriends then var2.mutualFriends else {}
	local var5, var6 = reactModule.useState(var1)
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var1 (ref)
		var6(var1)
	end, { p1, var1 })
	
	return {
		mutualFriends = reactModule.useMemo(function()
			-- upvalues: var5 (ref), var4 (ref)
			local t = {}
			
			for i = 1, math.min(var5, #var4) do
				table.insert(t, var4[i])
			end
			return t
		end, { var4, var5 }),
		isLoading = var3,
		hasMore = var5 < #var4,
		loadMore = reactModule.useCallback(function()
			-- upvalues: var6 (ref), var1 (ref), var4 (ref)
			var6(function(p2)
				-- upvalues: var1 (copy), var4 (copy)
				return math.min(p2 + var1, #var4)
			end)
		end, { var4, var1 }),
		totalCount = #var4
	}
end