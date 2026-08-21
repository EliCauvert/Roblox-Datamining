local parent = script:FindFirstAncestor("SponsoredAdViewability").Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useViewportBounds = require(parent.ViewportUtils).useViewportBounds
local sponsoredAdViewabilityDetectorModule = require(script.Parent.SponsoredAdViewabilityDetector)
local sponsoredAdViewabilityTelemetryModule = require(script.Parent.sponsoredAdViewabilityTelemetry)
local fFlagLuaAppSponsoredAdVideoViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdVideoViewabilityEnabled

return function(p0, p1, p2) --[[ line: 19 | named "useSponsoredAdViewabilityDetector" ]]
	-- upvalues: useViewportBounds (ref), reactModule (ref), sponsoredAdViewabilityDetectorModule (ref), sponsoredAdViewabilityTelemetryModule (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local var4 = useViewportBounds()
	local var5 = reactModule.useRef(nil)
	
	if var5.current == nil then
		var5.current = sponsoredAdViewabilityDetectorModule.new({
			onSessionStart = sponsoredAdViewabilityTelemetryModule.logSponsoredAdLoad,
			onMilestone = sponsoredAdViewabilityTelemetryModule.logSponsoredAdViewableImpression,
			onVideoProgress = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then sponsoredAdViewabilityTelemetryModule.logSponsoredAdVideoProgress else nil,
			onUnload = sponsoredAdViewabilityTelemetryModule.logSponsoredAdUnload
		})
	end
	reactModule.useEffect(function() --[[ line: 39 ]]
		-- upvalues: var5 (ref), var4 (ref)
		local current = var5.current
		
		if current ~= nil then
			current:setViewportBounds(var4)
		end
	end, { var4 })
	reactModule.useEffect(function() --[[ line: 49 ]]
		-- upvalues: var5 (ref), p0 (ref)
		local current = var5.current
		
		if current == nil then return end
		current:setSurfaceScope(p0)
		
		if p0 == nil then
			return
		end
		current:start()
		
		return function() --[[ line: 62 ]]
			-- upvalues: current (ref)
			current:reset()
		end
	end, { p0 })
	reactModule.useEffect(function() --[[ line: 67 ]]
		-- upvalues: p2 (ref), var5 (ref)
		if p2 == nil then
			return
		end
		local var7 = assert(var5.current, "detector must exist before effects run")
		local list = {
			p2.OnHide:Connect(function() --[[ line: 74 ]]
				-- upvalues: var7 (ref)
				var7:pause()
			end),
			p2.OnUnhide:Connect(function() --[[ line: 77 ]]
				-- upvalues: var7 (ref)
				var7:resume()
			end)
		}
		
		return function() --[[ line: 81 ]]
			-- upvalues: list (ref)
			for i, v in list do
				v:Disconnect()
			end
		end
	end, { p2 })
	local var6 = reactModule.useRef(p1)
	reactModule.useEffect(function() --[[ line: 92 ]]
		-- upvalues: var5 (ref), var6 (ref), p1 (ref)
		local current = var5.current
		local current_1 = var6.current
		var6.current = p1
		
		if current ~= nil and current_1 ~= nil and current_1 ~= p1 then
			current:onFeedRefresh()
		end
	end, { p1 })
end