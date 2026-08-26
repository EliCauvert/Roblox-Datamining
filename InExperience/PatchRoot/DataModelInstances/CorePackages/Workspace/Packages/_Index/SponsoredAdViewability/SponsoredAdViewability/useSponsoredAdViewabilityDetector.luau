local parent = script:FindFirstAncestor("SponsoredAdViewability").Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useViewportBounds = require(parent.ViewportUtils).useViewportBounds
local sponsoredAdViewabilityDetectorModule = require(script.Parent.SponsoredAdViewabilityDetector)
local sponsoredAdViewabilityTelemetryModule = require(script.Parent.sponsoredAdViewabilityTelemetry)
local fFlagLuaAppSponsoredAdVideoViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdVideoViewabilityEnabled

return function(p1, p2, p3)
	-- upvalues: useViewportBounds (ref), reactModule (ref), sponsoredAdViewabilityDetectorModule (ref), sponsoredAdViewabilityTelemetryModule (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local var1 = useViewportBounds()
	local var2 = reactModule.useRef(nil)
	
	if var2.current == nil then
		var2.current = sponsoredAdViewabilityDetectorModule.new({
			onSessionStart = sponsoredAdViewabilityTelemetryModule.logSponsoredAdLoad,
			onMilestone = sponsoredAdViewabilityTelemetryModule.logSponsoredAdViewableImpression,
			onVideoProgress = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then sponsoredAdViewabilityTelemetryModule.logSponsoredAdVideoProgress else nil,
			onUnload = sponsoredAdViewabilityTelemetryModule.logSponsoredAdUnload
		})
	end
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var1 (ref)
		local current = var2.current
		
		if current ~= nil then
			current:setViewportBounds(var1)
		end
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref)
		local current = var2.current
		
		if current == nil then return end
		current:setSurfaceScope(p1)
		
		if p1 == nil then
			return
		end
		current:start()
		
		return function()
			-- upvalues: current (ref)
			current:reset()
		end
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), var2 (ref)
		if p3 == nil then return end
		local current = var2.current
		
		if current == nil then
			return
		end
		local list = {
			p3.OnHide:Connect(function()
				-- upvalues: current (ref)
				current:pause()
			end),
			p3.OnUnhide:Connect(function()
				-- upvalues: current (ref)
				current:resume()
			end)
		}
		
		return function()
			-- upvalues: list (ref)
			for i, v in list do
				v:Disconnect()
			end
		end
	end, { p3 })
	local var3 = reactModule.useRef(p2)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var3 (ref), p2 (ref)
		local current = var2.current
		local current_1 = var3.current
		var3.current = p2
		
		if current ~= nil and current_1 ~= nil and current_1 ~= p2 then
			current:onFeedRefresh()
		end
	end, { p2 })
end