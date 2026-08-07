local roduxSquads = script:FindFirstAncestor("RoduxSquads")
local _ = require(roduxSquads.RoduxSquadsTypes)

return require(roduxSquads.Parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 6 ]]
	return { payload = { channelId = p0 } }
end)