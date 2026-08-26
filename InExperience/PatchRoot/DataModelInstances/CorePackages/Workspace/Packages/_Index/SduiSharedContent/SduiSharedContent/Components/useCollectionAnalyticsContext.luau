local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local _ = require(parent.UnifiedLogging)
local sduiCollectionAnalyticsBuilder = require(parent.SduiCoreSystem).SduiCollectionAnalyticsBuilder
local t = {}

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: reactModule (ref), sduiCollectionAnalyticsBuilder (ref), cryoModule (ref), t (ref)
	local var1 = reactModule.useRef(nil)
	var1.current = reactModule.useMemo(function()
		-- upvalues: p2 (ref), sduiCollectionAnalyticsBuilder (copy), p5 (ref), p1 (ref), p3 (ref), p4 (ref), p6 (ref)
		return sduiCollectionAnalyticsBuilder.buildAndValidateCollectionAnalyticsData(p5, p1.ancestorAnalyticsData, p1.analyticsData, p2, p3, p4, nil, p2, p6)
	end, {
		p5, p1, p3, p4, p2, p6
	})
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), p1 (ref), p7 (ref), cryoModule (copy), t (copy)
		local var2 = function()
			-- upvalues: var1 (copy)
			return var1.current
		end
		
		if p1 and p7 then
			p1.getCollectionData = var2
		end
		return cryoModule.Dictionary.join(p1 or t, { getCollectionData = var2 })
	end, { var1, p1, p7 }), var1
end