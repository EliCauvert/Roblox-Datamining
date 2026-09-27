local runService = game:GetService("RunService")
local starterGuiService = game:GetService("StarterGui")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local buildModeLaunchModule = require(buildExperience.Parent.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local getLibraryStoreModule = require(buildExperience.Stores.GetLibraryStore)
local createTeamCreateFreeCameraModule = require(buildExperience.createTeamCreateFreeCamera)
local mountChatSheetModule = require(buildExperience.mountChatSheet)
local mountLibraryModule = require(buildExperience.mountLibrary)
local var1 = false
local var2 = false

return function(p1, p2)
	-- upvalues: var1 (write), buildModeLaunchModule (ref), mountLibraryModule (ref), var2 (write), starterGuiService (ref), createTeamCreateFreeCameraModule (ref), getLibraryStoreModule (ref), runService (ref), mountChatSheetModule (ref)
	if not var1 then
		var1 = true
		buildModeLaunchModule:applyViewerTheme()
		mountLibraryModule(nil, buildModeLaunchModule:getChatSessionId(p1))
	end
	if p2 == nil or var2 then
		return
	end
	var2 = true
	starterGuiService:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
	runService.RenderStepped:Connect(createTeamCreateFreeCameraModule(workspace.CurrentCamera, p2, getLibraryStoreModule()).step)
	mountChatSheetModule()
end