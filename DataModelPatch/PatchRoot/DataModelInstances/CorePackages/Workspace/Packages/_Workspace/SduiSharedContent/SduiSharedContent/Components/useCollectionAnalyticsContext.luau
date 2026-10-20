local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.UnifiedLogging)
local SduiCollectionAnalyticsBuilder = require(Parent.SduiCoreSystem).SduiCollectionAnalyticsBuilder
local t = {}

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: ReactModule (copy), SduiCollectionAnalyticsBuilder (copy), CryoModule (copy), t (copy)
	local UseRefResult = ReactModule.useRef(nil)
	UseRefResult.current = ReactModule.useMemo(function()
		-- upvalues: p2 (copy), SduiCollectionAnalyticsBuilder (upval), p5 (copy), p1 (copy), p3 (copy), p4 (copy), p6 (copy)
		return SduiCollectionAnalyticsBuilder.buildAndValidateCollectionAnalyticsData(p5, p1.ancestorAnalyticsData, p1.analyticsData, p2, p3, p4, nil, p2, p6)
	end, {
		p5, p1, p3, p4, p2, p6
	})
	
	return ReactModule.useMemo(function()
		-- upvalues: UseRefResult (copy), p1 (copy), p7 (copy), CryoModule (upval), t (upval)
		local function GetCollectionData()
			-- upvalues: UseRefResult (upval)
			return UseRefResult.current
		end
		
		if p1 and p7 then
			p1.getCollectionData = GetCollectionData
		end
		return CryoModule.Dictionary.join(p1 or t, { getCollectionData = GetCollectionData })
	end, { UseRefResult, p1, p7 }), UseRefResult
end