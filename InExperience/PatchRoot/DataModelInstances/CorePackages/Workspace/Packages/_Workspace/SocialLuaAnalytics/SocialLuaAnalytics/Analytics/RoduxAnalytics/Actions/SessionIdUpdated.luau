local _ = require(script.Parent.Parent.AnalyticsTypes)

return require(script.Parent.Parent.Parent.Parent.dependencies).Rodux.makeActionCreator(script.Name, function(p0) --[[ line: 7 ]]
	return { payload = p0 }
end)