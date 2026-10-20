local VRService = game:GetService("VRService")
local CorePackages = game:GetService("CorePackages")
local ExperienceEventReceiverModule = require(game:GetService("CoreGui").RobloxGui.Modules:FindFirstChild("LuaApp").ExperienceEventReceiver)
local SplashScreenManager = require(CorePackages.Workspace.Packages.SplashScreenManager).SplashScreenManager
local IntervalPerformanceTracker = require(CorePackages.Workspace.Packages.IntervalPerformanceTracker).IntervalPerformanceTracker
local Connection = nil

local function _()
	-- upvalues: Connection (ref), VRService (copy)
	if not Connection then
		Connection = VRService:GetPropertyChangedSignal("VRSessionState"):Connect(function()
			-- upvalues: VRService (upval)
			VRService.QuestDisplayRefreshRate = 72
		end)
	end
end

return function()
	-- upvalues: SplashScreenManager (copy), IntervalPerformanceTracker (copy), ExperienceEventReceiverModule (copy), VRService (copy), Connection (ref)
	SplashScreenManager.initialize(36, 7, 36)
	IntervalPerformanceTracker:startTracking("appLaunchToTargetFPS")
	SplashScreenManager.addStatusChangeListener(function(p1)
		-- upvalues: IntervalPerformanceTracker (upval)
		if p1 then
			IntervalPerformanceTracker:stopAndLogTracking("appLaunchToTargetFPS")
		end
	end)
	VRService.QuestDisplayRefreshRate = 72
	ExperienceEventReceiverModule.new():onLeft(function()
		-- upvalues: VRService (upval)
		VRService.QuestDisplayRefreshRate = 72
	end)
	
	if not Connection then
		Connection = VRService:GetPropertyChangedSignal("VRSessionState"):Connect(function()
			-- upvalues: VRService (upval)
			VRService.QuestDisplayRefreshRate = 72
		end)
	end
end