local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local coreGuiService = game:GetService("CoreGui")
local reactModule = require(parent.React)
local useIsSpatial = require(parent.Responsive).useIsSpatial

local function getSyncVrOverlayOrNil()
	-- upvalues: coreGuiService (ref)
	local VRCentralOverlay = coreGuiService:FindFirstChild("VRCentralOverlay")
	
	return if VRCentralOverlay then VRCentralOverlay:FindFirstChildWhichIsA("SurfaceGui") else nil
end

return function()
	-- upvalues: useIsSpatial (ref), reactModule (ref), getSyncVrOverlayOrNil (ref), coreGuiService (ref)
	local var4 = useIsSpatial()
	local var5, var6 = reactModule.useState(getSyncVrOverlayOrNil)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var5 (ref), coreGuiService (copy), var6 (ref)
		if not var4 then
			return function() end
		elseif var5 then
			return function() end
		end
		local thread = task.spawn(function()
			-- upvalues: coreGuiService (copy), var6 (copy)
			local VRCentralOverlay = coreGuiService:WaitForChild("VRCentralOverlay", 5)
			
			if not VRCentralOverlay then return end
			local centralOverlaySurfaceGui = VRCentralOverlay:WaitForChild("CentralOverlay_SurfaceGui", 5)
			
			if centralOverlaySurfaceGui then
				var6(centralOverlaySurfaceGui)
			end
		end)
		
		return function()
			-- upvalues: thread (ref)
			task.cancel(thread)
		end
	end, { var4, var5 })
	
	if var4 then
		return var5, true
	end
	return nil, false
end