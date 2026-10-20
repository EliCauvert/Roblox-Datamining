local _ = require(script.Parent.Parent.AnalyticsTypes)

return require(script.Parent.Parent.Parent.Parent.dependencies).Rodux.makeActionCreator(script.Name, function(Payload)
	return { payload = Payload }
end)