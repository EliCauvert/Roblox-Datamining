local ContextActionService = game:GetService("ContextActionService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CorePackages = game:GetService("CorePackages")
local PerfUtilsModule = require(RobloxGui.Modules.Common.PerfUtils)
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local LinkingProtocol = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol
local ThemeModule = require(RobloxGui.Modules.Settings.Theme)
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local v1 = nil
RobloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local IsEnabled = require(RobloxGui.Modules.TenFootInterface):IsEnabled()
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local GetFFlagEnableInGameMenuDurationLoggerModule = require(RobloxGui.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger)
local CollectAnalyticsForSystemMenuFFlag = settings():GetFFlag("CollectAnalyticsForSystemMenu")
local GetDefaultQualityLevelFunction = require(CorePackages.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local ConstantsModule = if CollectAnalyticsForSystemMenuFFlag then require(RobloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants")) else nil
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
v1 = (function() --[[ Line: 51 | Named "Initialize" ]]
	-- upvalues: RobloxGui (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy), GetFFlagEnableInGameMenuDurationLoggerModule (copy), PerfUtilsModule (copy), GuiService (copy), CollectAnalyticsForSystemMenuFFlag (copy), ConstantsModule (ref), LinkingProtocol (copy), RunService (copy), GetDefaultQualityLevelFunction (copy), RobloxTranslatorModule (copy), CreateFunction (copy), ThemeModule (copy), IsEnabled (copy), UtilityModule (copy)
	local NewPage = require(RobloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	NewPage.playsessionid = ""
	
	if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		NewPage.playsessionid = RbxAnalyticsService:GetPlaySessionId()
	end
	function NewPage.LeaveFunc() --[[ Line: 60 ]]
		-- upvalues: GetFFlagEnableInGameMenuDurationLoggerModule (upval), PerfUtilsModule (upval), GuiService (upval), CollectAnalyticsForSystemMenuFFlag (upval), RbxAnalyticsService (upval), ConstantsModule (upval), NewPage (copy), LinkingProtocol (upval), RunService (upval), GetDefaultQualityLevelFunction (upval)
		if GetFFlagEnableInGameMenuDurationLoggerModule() then
			PerfUtilsModule.leavingGame()
		end
		GuiService.SelectedCoreObject = nil
		
		if CollectAnalyticsForSystemMenuFFlag then
			RbxAnalyticsService:SetRBXEventStream(ConstantsModule.AnalyticsTargetName, ConstantsModule.AnalyticsInGameMenuName, ConstantsModule.AnalyticsLeaveGameName, {
				confirmed = ConstantsModule.AnalyticsConfirmedName,
				universeid = tostring(game.GameId),
				source = ConstantsModule.AnalyticsLeaveToHomeSource,
				playsessionid = NewPage.playsessionid
			})
		end
		LinkingProtocol.default:detectURL("roblox://navigation/home")
		RunService.RenderStepped:wait()
		RunService.RenderStepped:wait()
		game:Shutdown()
		settings().Rendering.QualityLevel = GetDefaultQualityLevelFunction()
	end
	
	function NewPage.DontLeaveFunc(IsUserInputTypeMatch) --[[ Line: 92 ]]
		-- upvalues: NewPage (copy), CollectAnalyticsForSystemMenuFFlag (upval), RbxAnalyticsService (upval), ConstantsModule (upval)
		if NewPage.HubRef then
			NewPage.HubRef:PopMenu(IsUserInputTypeMatch, true)
		end
		if CollectAnalyticsForSystemMenuFFlag then
			RbxAnalyticsService:SetRBXEventStream(ConstantsModule.AnalyticsTargetName, ConstantsModule.AnalyticsInGameMenuName, ConstantsModule.AnalyticsLeaveGameName, {
				confirmed = ConstantsModule.AnalyticsCancelledName,
				universeid = tostring(game.GameId),
				source = ConstantsModule.AnalyticsLeaveToHomeSource,
				playsessionid = NewPage.playsessionid
			})
		end
	end
	
	function NewPage:DontLeaveFromHotkey(UserInputState, Input) --[[ Line: 111 ]]
		-- upvalues: NewPage (copy)
		if UserInputState == Enum.UserInputState.Begin then
			NewPage.DontLeaveFunc(Input.UserInputType == Enum.UserInputType.Gamepad1 or (Input.UserInputType == Enum.UserInputType.Gamepad2 or (Input.UserInputType == Enum.UserInputType.Gamepad3 or Input.UserInputType == Enum.UserInputType.Gamepad4)))
		end
	end
	
	function NewPage.DontLeaveFromButton(p1) --[[ Line: 119 ]]
		-- upvalues: NewPage (copy)
		NewPage.DontLeaveFunc(p1)
	end
	
	NewPage.TabHeader = nil
	NewPage.Page.Name = "LeaveGameToHomePage"
	NewPage.ShouldShowBottomBar = false
	NewPage.ShouldShowHubBar = false
	local Parent = CreateFunction("TextLabel")({
		Name = "LeaveGameText",
		BackgroundTransparency = 1,
		TextWrapped = true,
		ZIndex = 2,
		Text = RobloxTranslatorModule:FormatByKey(if CollectAnalyticsForSystemMenuFFlag then ConstantsModule.ConfirmLeaveGameLocalizedKey else "CoreScripts.InGameMenu.Prompt.ConfirmLeaveGame"),
		Font = ThemeModule.font(Enum.Font.SourceSansBold, "Confirmation"),
		FontSize = ThemeModule.fontSize(Enum.FontSize.Size36, "Confirmation"),
		TextColor3 = Color3.new(1, 1, 1),
		Size = UDim2.new(1, 0, 0, 200),
		Parent = NewPage.Page,
		Position = IsEnabled and UDim2.new(0, 0, 0, 100) or UDim2.new(0, 0, 0, 0)
	})
	local Parent1 = CreateFunction("Frame")({
		Name = "LeaveButtonContainer",
		BackgroundTransparency = 1,
		Parent = Parent,
		Size = UDim2.new(1, 0, 0, 400),
		Position = UDim2.new(0, 0, 1, 0)
	})
	local _ = CreateFunction("UIGridLayout")({
		Name = "LeavetButtonsLayout",
		CellSize = IsEnabled and UDim2.new(0, 300, 0, 80) or UDim2.new(0, 200, 0, 50),
		CellPadding = UDim2.new(0, 20, 0, 20),
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		Parent = Parent1
	})
	
	if UtilityModule:IsSmallTouchScreen() then
		Parent.FontSize = Enum.FontSize.Size24
		Parent.Size = UDim2.new(1, 0, 0, 100)
	elseif IsEnabled then
		Parent.FontSize = Enum.FontSize.Size48
	end
	NewPage.LeaveGameButton = UtilityModule:MakeStyledButton("LeaveGame", "Leave", nil, NewPage.LeaveFunc)
	NewPage.LeaveGameButton.NextSelectionRight = nil
	NewPage.LeaveGameButton.Parent = Parent1
	local DontLeaveGame = UtilityModule:MakeStyledButton("DontLeaveGame", RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.DontLeaveButton"), nil, NewPage.DontLeaveFromButton)
	DontLeaveGame.NextSelectionLeft = nil
	DontLeaveGame.Parent = Parent1
	NewPage.Page.Size = UDim2.new(1, 0, 0, DontLeaveGame.AbsolutePosition.Y + DontLeaveGame.AbsoluteSize.Y)
	
	return NewPage
end)()
v1.Displayed.Event:connect(function() --[[ Line: 204 ]]
	-- upvalues: GuiService (copy), v1 (ref), ContextActionService (copy)
	GuiService.SelectedCoreObject = v1.LeaveGameButton
	ContextActionService:BindCoreAction("LeaveGameCancelAction", v1.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB)
end)
v1.Hidden.Event:connect(function() --[[ Line: 209 ]]
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindCoreAction("LeaveGameCancelAction")
end)

return v1