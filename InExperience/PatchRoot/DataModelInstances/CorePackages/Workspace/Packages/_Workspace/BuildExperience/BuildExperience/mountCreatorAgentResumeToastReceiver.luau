local coreGuiService = game:GetService("CoreGui")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local buildEventReceiverModule = require(buildExperience.BuildEventReceiver)

return function(p0) --[[ line: 13 | named "mountCreatorAgentResumeToastReceiver" ]]
	-- upvalues: coreGuiService (ref), reactRobloxModule (ref), reactModule (ref), buildEventReceiverModule (ref)
	local buildEventReceiver = Instance.new("Folder")
	buildEventReceiver.Name = "BuildEventReceiver"
	buildEventReceiver.Parent = coreGuiService
	local var6 = reactRobloxModule.createRoot(buildEventReceiver)
	var6:render(reactModule.createElement(buildEventReceiverModule, { isInExperience = true, isBuildModeActive = p0 }))
	
	return var6
end