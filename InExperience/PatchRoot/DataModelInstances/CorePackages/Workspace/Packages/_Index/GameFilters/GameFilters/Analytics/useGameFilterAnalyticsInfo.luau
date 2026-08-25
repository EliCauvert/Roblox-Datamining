local parent = script:FindFirstAncestor("GameFilters").Parent
local _ = require(parent.DiscoveryTypes)
local reactModule = require(parent.React)
local topicInfosReducer = require(parent.TopicInfosRodux).TopicInfosReducer
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p0, p1)
	-- upvalues: useSelector (ref), topicInfosReducer (ref), reactModule (ref)
	local var1 = useSelector(function(p2)
		-- upvalues: topicInfosReducer (copy), p0 (ref)
		return p2.Personalization[topicInfosReducer.key][p0]
	end)
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), p1 (ref)
		return if var1 then {
			gameSetTypeId = var1.gameSetTypeId,
			gameSetTargetId = var1.gameSetTargetId,
			sortPos = p1
		} else {}
	end, { var1, p1 })
end