local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local BuildModeLaunchModule = require(BuildExperience.Parent.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local GetLibraryStoreModule = require(BuildExperience.Stores.GetLibraryStore)
local CreateTeamCreateFreeCameraModule = require(BuildExperience.createTeamCreateFreeCamera)
local MountChatSheetModule = require(BuildExperience.mountChatSheet)
local MountLibraryModule = require(BuildExperience.mountLibrary)
local Flag = false
local Flag1 = false

return function(p1, p2)
	-- upvalues: Flag (ref), BuildModeLaunchModule (copy), MountLibraryModule (copy), Flag1 (ref), StarterGui (copy), CreateTeamCreateFreeCameraModule (copy), GetLibraryStoreModule (copy), RunService (copy), MountChatSheetModule (copy)
	if not Flag then
		Flag = true
		BuildModeLaunchModule:applyViewerTheme()
		MountLibraryModule(nil, BuildModeLaunchModule:getChatSessionId(p1))
	end
	if p2 ~= nil and not Flag1 then
		Flag1 = true
		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
		RunService.RenderStepped:Connect(CreateTeamCreateFreeCameraModule(workspace.CurrentCamera, p2, GetLibraryStoreModule()).step)
		MountChatSheetModule()
		
		return
	end
end