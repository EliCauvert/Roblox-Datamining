local Parent = script:FindFirstAncestor("SponsoredAdViewability").Parent
local ReactModule = require(Parent.React)
local UseViewportBoundsFunction = require(Parent.ViewportUtils).useViewportBounds
local SponsoredAdViewabilityDetectorModule = require(script.Parent.SponsoredAdViewabilityDetector)
local SponsoredAdViewabilityTelemetryModule = require(script.Parent.sponsoredAdViewabilityTelemetry)

return function(p1)
	-- upvalues: UseViewportBoundsFunction (copy), ReactModule (copy), SponsoredAdViewabilityDetectorModule (copy), SponsoredAdViewabilityTelemetryModule (copy)
	local UseViewportBoundsResult = UseViewportBoundsFunction()
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = SponsoredAdViewabilityDetectorModule.new({
			onSessionStart = SponsoredAdViewabilityTelemetryModule.logSponsoredAdLoad,
			onMilestone = SponsoredAdViewabilityTelemetryModule.logSponsoredAdViewableImpression
		})
	end
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseViewportBoundsResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current:setViewportBounds(UseViewportBoundsResult)
		end
	end, { UseViewportBoundsResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), p1 (copy)
		local Current = UseRefResult.current
		
		if Current == nil then return end
		Current:setSurfaceScope(p1)
		
		if p1 == nil then return end
		Current:start()
		
		return function()
			-- upvalues: Current (copy)
			Current:reset()
		end
	end, { p1 })
end