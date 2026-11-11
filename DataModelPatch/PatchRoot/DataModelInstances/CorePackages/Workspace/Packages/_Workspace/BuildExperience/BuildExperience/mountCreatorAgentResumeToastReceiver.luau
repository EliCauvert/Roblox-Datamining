local CoreGui = game:GetService("CoreGui")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local BuildEventReceiverModule = require(BuildExperience.BuildEventReceiver)

return function(IsBuildModeActive)
	-- upvalues: CoreGui (copy), ReactRobloxModule (copy), ReactModule (copy), BuildEventReceiverModule (copy)
	local BuildEventReceiver = Instance.new("Folder")
	BuildEventReceiver.Name = "BuildEventReceiver"
	BuildEventReceiver.Parent = CoreGui
	local Root = ReactRobloxModule.createRoot(BuildEventReceiver)
	Root:render(ReactModule.createElement(BuildEventReceiverModule, {
		isInExperience = true,
		isBuildModeActive = IsBuildModeActive
	}))
	
	return Root
end