local coreGuiService = game:GetService("CoreGui")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local buildEventReceiverModule = require(buildExperience.BuildEventReceiver)

return function(p1)
	-- upvalues: coreGuiService (ref), reactRobloxModule (ref), reactModule (ref), buildEventReceiverModule (ref)
	local buildEventReceiver = Instance.new("Folder")
	buildEventReceiver.Name = "BuildEventReceiver"
	buildEventReceiver.Parent = coreGuiService
	local var1 = reactRobloxModule.createRoot(buildEventReceiver)
	var1:render(reactModule.createElement(buildEventReceiverModule, { isInExperience = true, isBuildModeActive = p1 }))
	
	return var1
end