local _ = require(script:FindFirstAncestor("SduiCoreSystem").SduiBuilderTypes)

return function(p0, p1, p2)
	if not p1 then
		return nil
	end
	assert(p1, "analyticsContext must exist")
	
	return if p1.analyticsData and p1.analyticsData[p0] ~= nil then p1.analyticsData[p0] elseif p1.ancestorAnalyticsData and p1.ancestorAnalyticsData[p0] ~= nil then p1.ancestorAnalyticsData[p0] elseif p2 == nil then nil else p2
end