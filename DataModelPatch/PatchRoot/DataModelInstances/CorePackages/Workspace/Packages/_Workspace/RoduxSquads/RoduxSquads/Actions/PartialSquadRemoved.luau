local RoduxSquads = script:FindFirstAncestor("RoduxSquads")
local _ = require(RoduxSquads.RoduxSquadsTypes)

return require(RoduxSquads.Parent.Rodux).makeActionCreator(script.Name, function(ChannelId)
	return { payload = { channelId = ChannelId } }
end)