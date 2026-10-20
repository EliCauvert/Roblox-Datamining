local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseIsSpatialFunction = require(CorePackages.Workspace.Packages.Responsive).useIsSpatial

return function(p1)
	-- upvalues: ReactModule (copy), UseIsSpatialFunction (copy), CoreGui (copy), FoundationModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseIsSpatialResult = UseIsSpatialFunction()
	ReactModule.useEffect(function()
		-- upvalues: UseIsSpatialResult (copy), UseStateResult2 (copy), CoreGui (upval)
		if not UseIsSpatialResult then
			UseStateResult2(nil)
			
			return
		end
		local SpawnedThread = task.spawn(function()
			-- upvalues: CoreGui (upval), UseStateResult2 (upval)
			local VRCentralOverlay = CoreGui:WaitForChild("VRCentralOverlay")
			local CentralOverlaySurfaceGui = if VRCentralOverlay then VRCentralOverlay:WaitForChild("CentralOverlay_SurfaceGui") else nil
			
			if CentralOverlaySurfaceGui and CentralOverlaySurfaceGui:IsA("SurfaceGui") then
				UseStateResult2(CentralOverlaySurfaceGui)
			end
		end)
		
		return function()
			-- upvalues: SpawnedThread (copy)
			task.cancel(SpawnedThread)
		end
	end, { UseIsSpatialResult })
	
	return if UseIsSpatialResult then if UseStateResult then ReactModule.createElement(FoundationModule.OverlayProvider, { gui = UseStateResult }, {
		Children = ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
	}) else ReactModule.createElement(ReactModule.Fragment) else ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
end