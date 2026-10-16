local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local CoreGui = game:GetService("CoreGui")
local ReactModule = require(Parent.React)
local UseIsSpatialFunction = require(Parent.Responsive).useIsSpatial

local function getSyncVrOverlayOrNil() --[[ Line: 10 ]]
	-- upvalues: CoreGui (copy)
	local VRCentralOverlay = CoreGui:FindFirstChild("VRCentralOverlay")
	
	return if VRCentralOverlay then VRCentralOverlay:FindFirstChildWhichIsA("SurfaceGui") else nil
end

return function() --[[ Line: 25 | Named "useVrOverlay" ]]
	-- upvalues: UseIsSpatialFunction (copy), ReactModule (copy), getSyncVrOverlayOrNil (copy), CoreGui (copy)
	local UseIsSpatialResult = UseIsSpatialFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(getSyncVrOverlayOrNil)
	ReactModule.useEffect(function() --[[ Line: 33 ]]
		-- upvalues: UseIsSpatialResult (copy), UseStateResult (copy), CoreGui (upval), UseStateResult2 (copy)
		if not UseIsSpatialResult then
			return function() --[[ Line: 35 ]] end
		elseif UseStateResult then
			return function() --[[ Line: 40 ]] end
		else
			local SpawnedThread = task.spawn(function() --[[ Line: 45 ]]
				-- upvalues: CoreGui (upval), UseStateResult2 (upval)
				local VRCentralOverlay = CoreGui:WaitForChild("VRCentralOverlay", 5)
				
				if not VRCentralOverlay then return end
				local CentralOverlaySurfaceGui = VRCentralOverlay:WaitForChild("CentralOverlay_SurfaceGui", 5)
				
				if CentralOverlaySurfaceGui then
					UseStateResult2(CentralOverlaySurfaceGui)
				end
			end)
			
			return function() --[[ Line: 56 ]]
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