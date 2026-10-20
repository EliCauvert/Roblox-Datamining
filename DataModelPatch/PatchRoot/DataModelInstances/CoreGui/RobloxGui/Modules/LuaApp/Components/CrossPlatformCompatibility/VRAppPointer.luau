local CorePackages = game:GetService("CorePackages")
local RoactModule = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Roact)
local PointerOverlay = require(CorePackages.Packages.UIBlox).Core.VR.PointerOverlay
local VRControllerModel = require(CorePackages.Workspace.Packages.VrCommon).VRControllerModel
local LaserPointer = require(CorePackages.Workspace.Packages.VrCommon).LaserPointer
local UseIsFPSAtTargetFunction = require(CorePackages.Workspace.Packages.SplashScreenManager).useIsFPSAtTarget

return function()
	-- upvalues: UseIsFPSAtTargetFunction (copy), RoactModule (copy), PointerOverlay (copy), LaserPointer (copy), VRControllerModel (copy)
	return if UseIsFPSAtTargetFunction() then RoactModule.createElement(PointerOverlay, {
		LaserPointer = LaserPointer,
		VRControllerModel = VRControllerModel
	}) else nil
end