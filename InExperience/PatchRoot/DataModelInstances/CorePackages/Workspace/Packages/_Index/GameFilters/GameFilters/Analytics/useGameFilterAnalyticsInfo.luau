local parent = script:FindFirstAncestor("GameFilters").Parent
local _ = require(parent.DiscoveryTypes)
local reactModule = require(parent.React)
local topicInfosReducer = require(parent.TopicInfosRodux).TopicInfosReducer
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1, p2)
	-- upvalues: useSelector (ref), topicInfosReducer (ref), reactModule (ref)
	local var1 = useSelector(function(p3)
		-- upvalues: topicInfosReducer (copy), p1 (ref)
		return p3.Personalization[topicInfosReducer.key][p1]
	end)
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), p2 (ref)
		return if var1 then {
			gameSetTypeId = var1.gameSetTypeId,
			gameSetTargetId = var1.gameSetTargetId,
			sortPos = p2
		} else {}
	end, { var1, p2 })
end