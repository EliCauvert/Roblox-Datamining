local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local Parent = SocialTabsPage.Parent
local ReactModule = require(Parent.React)
local UseSignalProfileInsightsByUserIdFunction = require(Parent.ProfileInsights).useSignalProfileInsightsByUserId
local UsePageSizeModule = require(SocialTabsPage.Hooks.usePageSize)

return function(UserId) --[[ Line: 24 | Named "useMutualsList" ]]
	-- upvalues: UsePageSizeModule (copy), UseSignalProfileInsightsByUserIdFunction (copy), ReactModule (copy)
	local UsePageSizeModuleResult = UsePageSizeModule()
	local UseSignalProfileInsightsByUserIdResult, UseSignalProfileInsightsByUserIdResult2 = UseSignalProfileInsightsByUserIdFunction({ rankingStrategy = "tc_info_boost", userId = UserId })
	local MutualFriends = if UseSignalProfileInsightsByUserIdResult and UseSignalProfileInsightsByUserIdResult.mutualFriends then UseSignalProfileInsightsByUserIdResult.mutualFriends else {}
	local UseStateResult, UseStateResult2 = ReactModule.useState(UsePageSizeModuleResult)
	ReactModule.useEffect(function() --[[ Line: 38 ]]
		-- upvalues: UseStateResult2 (copy), UsePageSizeModuleResult (copy)
		UseStateResult2(UsePageSizeModuleResult)
	end, { UserId, UsePageSizeModuleResult })
	
	return {
		mutualFriends = ReactModule.useMemo(function() --[[ Line: 42 ]]
			-- upvalues: UseStateResult (copy), MutualFriends (copy)
			local List = {}
			
			for i = 1, math.min(UseStateResult, #MutualFriends) do
				table.insert(List, MutualFriends[i])
			end
			return List
		end, { MutualFriends, UseStateResult }),
		isLoading = UseSignalProfileInsightsByUserIdResult2,
		hasMore = UseStateResult < #MutualFriends,
		loadMore = ReactModule.useCallback(function() --[[ Line: 52 ]]
			-- upvalues: UseStateResult2 (copy), UsePageSizeModuleResult (copy), MutualFriends (copy)
			UseStateResult2(function(p1): number --[[ Line: 53 ]]
				-- upvalues: UsePageSizeModuleResult (upval), MutualFriends (upval)
				return (math.min(p1 + UsePageSizeModuleResult, #MutualFriends))
			end)
		end, { MutualFriends, UsePageSizeModuleResult }),
		totalCount = #MutualFriends
	}
end