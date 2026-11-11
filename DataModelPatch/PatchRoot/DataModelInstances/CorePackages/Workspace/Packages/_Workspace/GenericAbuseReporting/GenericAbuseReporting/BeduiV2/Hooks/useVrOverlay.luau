local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local CoreGui = game:GetService("CoreGui")
local ReactModule = require(Parent.React)
local UseIsSpatialFunction = require(Parent.Responsive).useIsSpatial

local function getSyncVrOverlayOrNil()
	-- upvalues: CoreGui (copy)
	local VRCentralOverlay = CoreGui:FindFirstChild("VRCentralOverlay")
	
	return if VRCentralOverlay then VRCentralOverlay:FindFirstChildWhichIsA("SurfaceGui") else nil
end

return function()
	-- upvalues: UseIsSpatialFunction (copy), ReactModule (copy), getSyncVrOverlayOrNil (copy), CoreGui (copy)
	local UseIsSpatialResult = UseIsSpatialFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(getSyncVrOverlayOrNil)
	ReactModule.useEffect(function()
		-- upvalues: UseIsSpatialResult (copy), UseStateResult (copy), CoreGui (upval), UseStateResult2 (copy)
		if not UseIsSpatialResult then
			return function() end
		elseif UseStateResult then
			return function() end
		else
			local SpawnedThread = task.spawn(function()
				-- upvalues: CoreGui (upval), UseStateResult2 (upval)
				local VRCentralOverlay = CoreGui:WaitForChild("VRCentralOverlay", 5)
				
				if not VRCentralOverlay then return end
				local CentralOverlaySurfaceGui = VRCentralOverlay:WaitForChild("CentralOverlay_SurfaceGui", 5)
				
				if CentralOverlaySurfaceGui then
					UseStateResult2(CentralOverlaySurfaceGui)
				end
			end)
			
			return function()
				-- upvalues: SpawnedThread (copy)
				task.cancel(SpawnedThread)
			end
		end
	end, { UseIsSpatialResult, UseStateResult })
	
	if UseIsSpatialResult then
		return UseStateResult, true
	else
		return nil, false
	end
end