local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local _ = require(parent.UnifiedLogging)
local sduiCollectionAnalyticsBuilder = require(parent.SduiCoreSystem).SduiCollectionAnalyticsBuilder
local t = {}

return function(p0, p1, p2, p3, p4, p5, p6) --[[ line: 20 | named "useCollectionAnalyticsContext" ]]
	-- upvalues: reactModule (ref), sduiCollectionAnalyticsBuilder (ref), cryoModule (ref), t (ref)
	local var3 = reactModule.useRef(nil)
	var3.current = reactModule.useMemo(function() --[[ line: 36 ]]
		-- upvalues: p1 (ref), sduiCollectionAnalyticsBuilder (copy), p4 (ref), p0 (ref), p2 (ref), p3 (ref), p5 (ref)
		return sduiCollectionAnalyticsBuilder.buildAndValidateCollectionAnalyticsData(p4, p0.ancestorAnalyticsData, p0.analyticsData, p1, p2, p3, nil, p1, p5)
	end, {
		p4, p0, p2, p3, p1, p5
	})
	
	return reactModule.useMemo(function() --[[ line: 62 ]]
		-- upvalues: var3 (ref), p0 (ref), p6 (ref), cryoModule (copy), t (copy)
		local var4 = function() --[[ line: 63 ]]
			-- upvalues: var3 (copy)
			return var3.current
		end
		
		if p0 and p6 then
			p0.getCollectionData = var4
		end
		return cryoModule.Dictionary.join(p0 or t, { getCollectionData = var4 })
	end, { var3, p0, p6 }), var3
end