local parent = script:FindFirstAncestor("SponsoredAdViewability").Parent
local reactModule = require(parent.React)
local useViewportBounds = require(parent.ViewportUtils).useViewportBounds
local sponsoredAdViewabilityDetectorModule = require(script.Parent.SponsoredAdViewabilityDetector)
local sponsoredAdViewabilityTelemetryModule = require(script.Parent.sponsoredAdViewabilityTelemetry)

return function(p0) --[[ line: 12 | named "useSponsoredAdViewabilityDetector" ]]
	-- upvalues: useViewportBounds (ref), reactModule (ref), sponsoredAdViewabilityDetectorModule (ref), sponsoredAdViewabilityTelemetryModule (ref)
	local var3 = useViewportBounds()
	local var4 = reactModule.useRef(nil)
	
	if var4.current == nil then
		var4.current = sponsoredAdViewabilityDetectorModule.new({
			onSessionStart = sponsoredAdViewabilityTelemetryModule.logSponsoredAdLoad,
			onMilestone = sponsoredAdViewabilityTelemetryModule.logSponsoredAdViewableImpression
		})
	end
	reactModule.useEffect(function() --[[ line: 24 ]]
		-- upvalues: var4 (ref), var3 (ref)
		local current = var4.current
		
		if current ~= nil then
			current:setViewportBounds(var3)
		end
	end, { var3 })
	reactModule.useEffect(function() --[[ line: 34 ]]
		-- upvalues: var4 (ref), p0 (ref)
		local current = var4.current
		
		if current == nil then return end
		current:setSurfaceScope(p0)
		
		if p0 == nil then
			return
		end
		current:start()
		
		return function() --[[ line: 47 ]]
			-- upvalues: current (ref)
			current:reset()
		end
	end, { p0 })
end