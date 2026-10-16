local Parent = script:FindFirstAncestor("GameFilters").Parent
local _ = require(Parent.DiscoveryTypes)
local ReactModule = require(Parent.React)
local TopicInfosReducer = require(Parent.TopicInfosRodux).TopicInfosReducer
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1, SortPos) --[[ Line: 10 | Named "useGameFilterAnalyticsInfo" ]]
	-- upvalues: UseSelectorFunction (copy), TopicInfosReducer (copy), ReactModule (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 11 ]]
		-- upvalues: TopicInfosReducer (upval), p1 (copy)
		return p2.Personalization[TopicInfosReducer.key][p1]
	end)
	
	return ReactModule.useMemo(function() --[[ Line: 15 ]]
		-- upvalues: UseSelectorResult (copy), SortPos (copy)
		return if UseSelectorResult then {
			gameSetTypeId = UseSelectorResult.gameSetTypeId,
			gameSetTargetId = UseSelectorResult.gameSetTargetId,
			sortPos = SortPos
		} else {}
	end, { UseSelectorResult, SortPos })
end