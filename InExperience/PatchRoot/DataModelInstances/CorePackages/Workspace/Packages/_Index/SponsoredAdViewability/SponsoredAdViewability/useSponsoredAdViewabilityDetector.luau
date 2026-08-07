local parent = script:FindFirstAncestor("SponsoredAdViewability").Parent
local reactModule = require(parent.React)
local useViewportBounds = require(parent.ViewportUtils).useViewportBounds
local sponsoredAdViewabilityDetectorModule = require(script.Parent.SponsoredAdViewabilityDetector)
local sponsoredAdViewabilityTelemetryModule = require(script.Parent.sponsoredAdViewabilityTelemetry)

return function(p0, p1, p2) --[[ line: 16 | named "useSponsoredAdViewabilityDetector" ]]
	-- upvalues: useViewportBounds (ref), reactModule (ref), sponsoredAdViewabilityDetectorModule (ref), sponsoredAdViewabilityTelemetryModule (ref)
	local var3 = useViewportBounds()
	local var4 = reactModule.useRef(nil)
	
	if var4.current == nil then
		var4.current = sponsoredAdViewabilityDetectorModule.new({
			onSessionStart = sponsoredAdViewabilityTelemetryModule.logSponsoredAdLoad,
			onMilestone = sponsoredAdViewabilityTelemetryModule.logSponsoredAdViewableImpression,
			onUnload = sponsoredAdViewabilityTelemetryModule.logSponsoredAdUnload
		})
	end
	reactModule.useEffect(function() --[[ line: 33 ]]
		-- upvalues: var4 (ref), var3 (ref)
		local current = var4.current
		
		if current ~= nil then
			current:setViewportBounds(var3)
		end
	end, { var3 })
	reactModule.useEffect(function() --[[ line: 43 ]]
		-- upvalues: var4 (ref), p0 (ref)
		local current = var4.current
		
		if current == nil then return end
		current:setSurfaceScope(p0)
		
		if p0 == nil then
			return
		end
		current:start()
		
		return function() --[[ line: 56 ]]
			-- upvalues: current (ref)
			current:reset()
		end
	end, { p0 })
	reactModule.useEffect(function() --[[ line: 61 ]]
		-- upvalues: p2 (ref), var4 (ref)
		if p2 == nil then
			return
		end
		local var6 = assert(var4.current, "detector must exist before effects run")
		local list = {
			p2.OnHide:Connect(function() --[[ line: 68 ]]
				-- upvalues: var6 (ref)
				var6:pause()
			end),
			p2.OnUnhide:Connect(function() --[[ line: 71 ]]
				-- upvalues: var6 (ref)
				var6:resume()
			end)
		}
		
		return function() --[[ line: 75 ]]
			-- upvalues: list (ref)
			for i, v in list do
				v:Disconnect()
			end
		end
	end, { p2 })
	local var5 = reactModule.useRef(p1)
	reactModule.useEffect(function() --[[ line: 86 ]]
		-- upvalues: var4 (ref), var5 (ref), p1 (ref)
		local current = var4.current
		local current_1 = var5.current
		var5.current = p1
		
		if current ~= nil and current_1 ~= nil and current_1 ~= p1 then
			current:onFeedRefresh()
		end
	end, { p1 })
end