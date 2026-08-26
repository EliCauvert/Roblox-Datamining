local _ = require(script:FindFirstAncestor("SduiCoreSystem").SduiBuilderTypes)

return function(p1, p2, p3)
	if not p2 then
		return nil
	end
	assert(p2, "analyticsContext must exist")
	
	return if p2.analyticsData and p2.analyticsData[p1] ~= nil then p2.analyticsData[p1] elseif p2.ancestorAnalyticsData and p2.ancestorAnalyticsData[p1] ~= nil then p2.ancestorAnalyticsData[p1] elseif p3 == nil then nil else p3
end