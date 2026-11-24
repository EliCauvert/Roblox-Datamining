local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local BuildModeLaunchModule = require(Parent.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local FFlagBuildExperienceWorldJoystick = require(Parent.SharedFlags).FFlagBuildExperienceWorldJoystick
local GetLibraryStoreModule = require(BuildExperience.Stores.GetLibraryStore)
local CreateTeamCreateFreeCameraModule = require(BuildExperience.createTeamCreateFreeCamera)
local CreateWorldTouchInputModule = require(BuildExperience.WorldTouchControls.createWorldTouchInput)
local MountChatSheetModule = require(BuildExperience.mountChatSheet)
local MountLibraryModule = require(BuildExperience.mountLibrary)
local MountWorldTouchControlsModule = require(BuildExperience.mountWorldTouchControls)
local Flag = false
local Flag1 = false

return function(p1, p2)
	-- upvalues: Flag (ref), BuildModeLaunchModule (copy), MountLibraryModule (copy), Flag1 (ref), StarterGui (copy), FFlagBuildExperienceWorldJoystick (copy), CreateWorldTouchInputModule (copy), CreateTeamCreateFreeCameraModule (copy), GetLibraryStoreModule (copy), RunService (copy), MountChatSheetModule (copy), MountWorldTouchControlsModule (copy)
	if not Flag then
		Flag = true
		BuildModeLaunchModule:applyViewerTheme()
		MountLibraryModule(nil, BuildModeLaunchModule:getChatSessionId(p1))
	end
	if p2 == nil or Flag1 then return end
	Flag1 = true
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
	local WorldTouchInputModule = if FFlagBuildExperienceWorldJoystick then CreateWorldTouchInputModule() else nil
	RunService.RenderStepped:Connect((if WorldTouchInputModule == nil then CreateTeamCreateFreeCameraModule(workspace.CurrentCamera, p2, GetLibraryStoreModule()) else CreateTeamCreateFreeCameraModule(workspace.CurrentCamera, p2, GetLibraryStoreModule(), nil, nil, WorldTouchInputModule)).step)
	MountChatSheetModule()
	
	if WorldTouchInputModule ~= nil then
		MountWorldTouchControlsModule(WorldTouchInputModule)
	end
end