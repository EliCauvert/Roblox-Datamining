local contextActionService = game:GetService("ContextActionService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local corePackagesService = game:GetService("CorePackages")
local perfUtilsModule = require(robloxGui.Modules.Common.PerfUtils)
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local linkingProtocol = require(corePackagesService.Workspace.Packages.LinkingProtocol).LinkingProtocol
local themeModule = require(robloxGui.Modules.Settings.Theme)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local _ = nil
robloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local var9 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local getFFlagEnableInGameMenuDurationLoggerModule = require(robloxGui.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger)
local collectAnalyticsForSystemMenuFFlag = settings():GetFFlag("CollectAnalyticsForSystemMenu")
local getDefaultQualityLevel = require(corePackagesService.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local var13 = if collectAnalyticsForSystemMenuFFlag then require(robloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants")) else nil
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local var15 = (function() --[[ line: 51 | named "Initialize" ]]
	-- upvalues: robloxGui (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), getFFlagEnableInGameMenuDurationLoggerModule (ref), perfUtilsModule (ref), guiService (ref), collectAnalyticsForSystemMenuFFlag (ref), var13 (write), linkingProtocol (ref), runService (ref), getDefaultQualityLevel (ref), robloxTranslatorModule (ref), create (ref), themeModule (ref), var9 (ref), utilityModule (ref)
	local leaveGameToHomePage = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	leaveGameToHomePage.playsessionid = ""
	
	if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		leaveGameToHomePage.playsessionid = rbxAnalyticsService:GetPlaySessionId()
	end
	function leaveGameToHomePage.LeaveFunc() --[[ line: 60 ]]
		-- upvalues: getFFlagEnableInGameMenuDurationLoggerModule (copy), perfUtilsModule (copy), guiService (copy), collectAnalyticsForSystemMenuFFlag (copy), rbxAnalyticsService (copy), var13 (copy), leaveGameToHomePage (ref), linkingProtocol (copy), runService (copy), getDefaultQualityLevel (copy)
		if getFFlagEnableInGameMenuDurationLoggerModule() then
			perfUtilsModule.leavingGame()
		end
		guiService.SelectedCoreObject = nil
		
		if collectAnalyticsForSystemMenuFFlag then
			rbxAnalyticsService:SetRBXEventStream(var13.AnalyticsTargetName, var13.AnalyticsInGameMenuName, var13.AnalyticsLeaveGameName, {
				confirmed = var13.AnalyticsConfirmedName,
				universeid = tostring(game.GameId),
				source = var13.AnalyticsLeaveToHomeSource,
				playsessionid = leaveGameToHomePage.playsessionid
			})
		end
		linkingProtocol.default:detectURL("roblox://navigation/home")
		runService.RenderStepped:wait()
		runService.RenderStepped:wait()
		game:Shutdown()
		settings().Rendering.QualityLevel = getDefaultQualityLevel()
	end
	
	function leaveGameToHomePage.DontLeaveFunc(p0) --[[ line: 92 ]]
		-- upvalues: leaveGameToHomePage (ref), collectAnalyticsForSystemMenuFFlag (copy), rbxAnalyticsService (copy), var13 (copy)
		if leaveGameToHomePage.HubRef then
			leaveGameToHomePage.HubRef:PopMenu(p0, true)
		end
		if collectAnalyticsForSystemMenuFFlag then
			rbxAnalyticsService:SetRBXEventStream(var13.AnalyticsTargetName, var13.AnalyticsInGameMenuName, var13.AnalyticsLeaveGameName, {
				confirmed = var13.AnalyticsCancelledName,
				universeid = tostring(game.GameId),
				source = var13.AnalyticsLeaveToHomeSource,
				playsessionid = leaveGameToHomePage.playsessionid
			})
		end
	end
	
	function leaveGameToHomePage.DontLeaveFromHotkey(_, p1, p2) --[[ line: 111 ]]
		-- upvalues: leaveGameToHomePage (ref)
		if p1 == Enum.UserInputState.Begin then
			leaveGameToHomePage.DontLeaveFunc(if p2.UserInputType ~= Enum.UserInputType.Gamepad1 then if p2.UserInputType ~= Enum.UserInputType.Gamepad2 then if p2.UserInputType ~= Enum.UserInputType.Gamepad3 then p2.UserInputType == Enum.UserInputType.Gamepad4 else true else true else true)
		end
	end
	
	function leaveGameToHomePage.DontLeaveFromButton(p3) --[[ line: 119 ]]
		-- upvalues: leaveGameToHomePage (ref)
		leaveGameToHomePage.DontLeaveFunc(p3)
	end
	
	leaveGameToHomePage.TabHeader = nil
	leaveGameToHomePage.Page.Name = "LeaveGameToHomePage"
	leaveGameToHomePage.ShouldShowBottomBar = false
	leaveGameToHomePage.ShouldShowHubBar = false
	local var17 = create("TextLabel")({
		Name = "LeaveGameText",
		BackgroundTransparency = 1,
		TextWrapped = true,
		ZIndex = 2,
		Text = robloxTranslatorModule:FormatByKey(if collectAnalyticsForSystemMenuFFlag then var13.ConfirmLeaveGameLocalizedKey else "CoreScripts.InGameMenu.Prompt.ConfirmLeaveGame"),
		Font = themeModule.font(Enum.Font.SourceSansBold, "Confirmation"),
		FontSize = themeModule.fontSize(Enum.FontSize.Size36, "Confirmation"),
		TextColor3 = Color3.new(1, 1, 1),
		Size = UDim2.new(1, 0, 0, 200),
		Parent = leaveGameToHomePage.Page,
		Position = var9 and UDim2.new(0, 0, 0, 100) or UDim2.new(0, 0, 0, 0)
	})
	local var18 = create("Frame")({
		Name = "LeaveButtonContainer",
		BackgroundTransparency = 1,
		Parent = var17,
		Size = UDim2.new(1, 0, 0, 400),
		Position = UDim2.new(0, 0, 1, 0)
	})
	local _ = create("UIGridLayout")({
		Name = "LeavetButtonsLayout",
		CellSize = var9 and UDim2.new(0, 300, 0, 80) or UDim2.new(0, 200, 0, 50),
		CellPadding = UDim2.new(0, 20, 0, 20),
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		Parent = var18
	})
	
	if utilityModule:IsSmallTouchScreen() then
		var17.FontSize = Enum.FontSize.Size24
		var17.Size = UDim2.new(1, 0, 0, 100)
	elseif var9 then
		var17.FontSize = Enum.FontSize.Size48
	end
	leaveGameToHomePage.LeaveGameButton = utilityModule:MakeStyledButton("LeaveGame", "Leave", nil, leaveGameToHomePage.LeaveFunc)
	leaveGameToHomePage.LeaveGameButton.NextSelectionRight = nil
	leaveGameToHomePage.LeaveGameButton.Parent = var18
	local dontLeaveGame = utilityModule:MakeStyledButton("DontLeaveGame", robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.DontLeaveButton"), nil, leaveGameToHomePage.DontLeaveFromButton)
	dontLeaveGame.NextSelectionLeft = nil
	dontLeaveGame.Parent = var18
	leaveGameToHomePage.Page.Size = UDim2.new(1, 0, 0, dontLeaveGame.AbsolutePosition.Y + dontLeaveGame.AbsoluteSize.Y)
	
	return leaveGameToHomePage
end)()
var15.Displayed.Event:connect(function() --[[ line: 204 ]]
	-- upvalues: guiService (ref), var15 (write), contextActionService (ref)
	guiService.SelectedCoreObject = var15.LeaveGameButton
	contextActionService:BindCoreAction("LeaveGameCancelAction", var15.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB)
end)
var15.Hidden.Event:connect(function() --[[ line: 209 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("LeaveGameCancelAction")
end)

return var15