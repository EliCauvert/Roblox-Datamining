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
	local var1 = useIsSpatial()
	local var2, var3 = reactModule.useState(getSyncVrOverlayOrNil)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), coreGuiService (copy), var3 (ref)
		if not var1 then
			return function() end
		elseif var2 then
			return function() end
		end
		local thread = task.spawn(function()
			-- upvalues: coreGuiService (copy), var3 (copy)
			local VRCentralOverlay = coreGuiService:WaitForChild("VRCentralOverlay", 5)
			
			if not VRCentralOverlay then return end
			local centralOverlaySurfaceGui = VRCentralOverlay:WaitForChild("CentralOverlay_SurfaceGui", 5)
			
			if centralOverlaySurfaceGui then
				var3(centralOverlaySurfaceGui)
			end
		end)
		
		return function()
			-- upvalues: thread (ref)
			task.cancel(thread)
		end
	end, { var1, var2 })
	
	if var1 then
		return var2, true
	end
	return nil, false
end