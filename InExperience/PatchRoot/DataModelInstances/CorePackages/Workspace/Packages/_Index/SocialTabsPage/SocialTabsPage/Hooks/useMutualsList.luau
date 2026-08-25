local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local reactModule = require(parent.React)
local useSignalProfileInsightsByUserId = require(parent.ProfileInsights).useSignalProfileInsightsByUserId
local usePageSizeModule = require(socialTabsPage.Hooks.usePageSize)

return function(p0)
	-- upvalues: usePageSizeModule (ref), useSignalProfileInsightsByUserId (ref), reactModule (ref)
	local var3 = usePageSizeModule()
	local var4, var5 = useSignalProfileInsightsByUserId({ rankingStrategy = "tc_info_boost", userId = p0 })
	local var6 = if var4 and var4.mutualFriends then var4.mutualFriends else {}
	local var7, var8 = reactModule.useState(var3)
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var3 (ref)
		var8(var3)
	end, { p0, var3 })
	
	return {
		mutualFriends = reactModule.useMemo(function()
			-- upvalues: var7 (ref), var6 (ref)
			local t = {}
			
			for i = 1, math.min(var7, #var6) do
				table.insert(t, var6[i])
			end
			return t
		end, { var6, var7 }),
		isLoading = var5,
		hasMore = var7 < #var6,
		loadMore = reactModule.useCallback(function()
			-- upvalues: var8 (ref), var3 (ref), var6 (ref)
			var8(function(p1)
				-- upvalues: var3 (copy), var6 (copy)
				return math.min(p1 + var3, #var6)
			end)
		end, { var6, var3 }),
		totalCount = #var6
	}
end