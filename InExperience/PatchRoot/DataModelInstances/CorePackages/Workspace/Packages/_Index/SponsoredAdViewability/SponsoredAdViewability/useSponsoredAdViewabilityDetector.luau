local Parent = script:FindFirstAncestor("SponsoredAdViewability").Parent
local ReactModule = require(Parent.React)
local UseViewportBoundsFunction = require(Parent.ViewportUtils).useViewportBounds
local SponsoredAdViewabilityDetectorModule = require(script.Parent.SponsoredAdViewabilityDetector)
local SponsoredAdViewabilityTelemetryModule = require(script.Parent.sponsoredAdViewabilityTelemetry)

return function(p1, Current, AppLifecycleObserverService) --[[ Line: 16 | Named "useSponsoredAdViewabilityDetector" ]]
	-- upvalues: UseViewportBoundsFunction (copy), ReactModule (copy), SponsoredAdViewabilityDetectorModule (copy), SponsoredAdViewabilityTelemetryModule (copy)
	local UseViewportBoundsResult = UseViewportBoundsFunction()
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = SponsoredAdViewabilityDetectorModule.new({
			onSessionStart = SponsoredAdViewabilityTelemetryModule.logSponsoredAdLoad,
			onMilestone = SponsoredAdViewabilityTelemetryModule.logSponsoredAdViewableImpression,
			onVideoProgress = SponsoredAdViewabilityTelemetryModule.logSponsoredAdVideoProgress,
			onUnload = SponsoredAdViewabilityTelemetryModule.logSponsoredAdUnload
		})
	end
	ReactModule.useEffect(function() --[[ Line: 34 ]]
		-- upvalues: UseRefResult (copy), UseViewportBoundsResult (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current:setViewportBounds(UseViewportBoundsResult)
		end
	end, { UseViewportBoundsResult })
	ReactModule.useEffect(function() --[[ Line: 44 ]]
		-- upvalues: UseRefResult (copy), p1 (copy)
		local Current = UseRefResult.current
		
		if Current == nil then return end
		Current:setSurfaceScope(p1)
		
		if p1 == nil then return end
		Current:start()
		
		return function() --[[ Line: 57 ]]
			-- upvalues: Current (copy)
			Current:reset()
		end
	end, { p1 })
	ReactModule.useEffect(function() --[[ Line: 62 ]]
		-- upvalues: AppLifecycleObserverService (copy), UseRefResult (copy)
		if AppLifecycleObserverService == nil then return end
		local Current = UseRefResult.current
		
		if Current == nil then return end
		local Connections = {
			AppLifecycleObserverService.OnHide:Connect(function() --[[ Line: 72 ]]
				-- upvalues: Current (copy)
				Current:pause()
			end),
			AppLifecycleObserverService.OnUnhide:Connect(function() --[[ Line: 75 ]]
				-- upvalues: Current (copy)
				Current:resume()
			end)
		}
		
		return function() --[[ Line: 79 ]]
			-- upvalues: Connections (copy)
			for _, connection in Connections do
				connection:Disconnect()
			end
		end
	end, { AppLifecycleObserverService })
	local UseRefResult1 = ReactModule.useRef(Current)
	ReactModule.useEffect(function() --[[ Line: 90 ]]
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), Current (copy)
		local Current1 = UseRefResult.current
		local Current2 = UseRefResult1.current
		UseRefResult1.current = Current
		
		if Current1 ~= nil and Current2 ~= nil and Current2 ~= Current then
			Current1:onFeedRefresh()
		end
	end, { Current })
end