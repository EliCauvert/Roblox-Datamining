local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local guiService = game:GetService("GuiService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local localizationService = game:GetService("LocalizationService")
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local leaveGameModule = require(robloxGui.Modules.Settings.leaveGame)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local reactModule = require(corePackagesService.Packages.React)
local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
local reactFocusNavigationModule = require(corePackagesService.Packages.ReactFocusNavigation)
local useFocusGuiObject = reactFocusNavigationModule.useFocusGuiObject
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local input = responsiveModule.Input
local useLastInput = responsiveModule.useLastInput
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local foundationModule = require(corePackagesService.Packages.Foundation)
local var1 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local var2 = if var1 then require(robloxGui.Modules.Chrome.Service) else nil
local var3 = if var1 then require(robloxGui.Modules.Chrome.ChromeShared.Unibar.Constants) else nil
local _ = nil
robloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local var4 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagChromeShortcutRemoveRespawnOnLeavePage = sharedFlagsModule.FFlagChromeShortcutRemoveRespawnOnLeavePage
local fFlagDebugEnablePioneerUX = sharedFlagsModule.FFlagDebugEnablePioneerUX
local fFlagRefactorMenuConfirmationButtonsModule = require(robloxGui.Modules.Settings.Flags.FFlagRefactorMenuConfirmationButtons)
local fFlagConfirmationButtonsUseGreyButtonsModule = require(robloxGui.Modules.Settings.Flags.FFlagConfirmationButtonsUseGreyButtons)
local constantsModule = require(robloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local localizationKeys = require(corePackagesService.Workspace.Packages.InExperienceSideSheet).Constants.LocalizationKeys
local var5 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
local themeModule = require(robloxGui.Modules.Settings.Theme)
local foundationProvider = foundationModule.FoundationProvider
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local text = foundationModule.Text
local view = foundationModule.View
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)

local function LeaveButtonsContainer(p1)
	-- upvalues: reactModule (ref), useLastInput (ref), useFocusGuiObject (ref), useLocalization (ref), fFlagDebugEnablePioneerUX (ref), localizationKeys (ref), constantsModule (ref), input (ref), leaveGameModule (ref), utilityModule (ref), view (ref), var4 (ref), text (ref), button (ref), inputSize (ref), fFlagConfirmationButtonsUseGreyButtonsModule (ref), buttonVariant (ref)
	local var6 = reactModule.useRef(nil)
	local var7 = useLastInput()
	local var8 = useFocusGuiObject()
	local var9 = useLocalization({
		ConfirmLeaveGame = if fFlagDebugEnablePioneerUX then localizationKeys.LogoutConfirmation else constantsModule.ConfirmLeaveGameLocalizedKey,
		LeaveGame = if fFlagDebugEnablePioneerUX then localizationKeys.LogoutButton else constantsModule.LeaveGameLocalizedKey,
		DontLeaveGame = if fFlagDebugEnablePioneerUX then localizationKeys.Cancel else constantsModule.DontLeaveGameLocalizedKey
	})
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), input (copy), var8 (ref), var6 (ref)
		if var7 == input.Touch then
			var8(nil)
			
			return
		end
		var8(var6.current)
	end, { var7, var8 })
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col",
		Position = UDim2.new(0, 0, 0, if var4 then 100 else 0)
	}, {
		LeaveGameText = reactModule.createElement(text, {
			LayoutOrder = 1,
			Text = var9.ConfirmLeaveGame,
			Size = UDim2.new(1, 0, 0, if utilityModule:IsSmallTouchScreen() then 100 else 200),
			tag = {
				["text-wrap"] = true,
				["text-heading-medium"] = not utilityModule:IsSmallTouchScreen() and not var4,
				["text-heading-small"] = utilityModule:IsSmallTouchScreen(),
				["text-heading-large"] = var4
			}
		}),
		LeaveButtonsContainer = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y row align-x-center gap-xlarge wrap"
		}, {
			LeaveGameButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				text = var9.LeaveGame,
				size = inputSize.Large,
				variant = if fFlagConfirmationButtonsUseGreyButtonsModule then buttonVariant.Standard else buttonVariant.SoftEmphasis,
				width = UDim.new(0, if var4 then 300 else 200),
				ref = var6,
				onActivated = reactModule.useCallback(function()
					-- upvalues: fFlagDebugEnablePioneerUX (copy), leaveGameModule (copy)
					if fFlagDebugEnablePioneerUX then
						leaveGameModule(false, { shouldNativeExit = true })
						
						return
					end
					leaveGameModule(true)
				end, { leaveGameModule })
			}),
			DontLeaveGameButton = reactModule.createElement(button, {
				LayoutOrder = 2,
				text = var9.DontLeaveGame,
				size = inputSize.Large,
				variant = buttonVariant.Subtle,
				width = UDim.new(0, if var4 then 300 else 200),
				onActivated = reactModule.useCallback(function()
					-- upvalues: p1 (ref), utilityModule (copy)
					p1.dontLeaveFromButton(utilityModule:IsUsingGamepad())
				end, { utilityModule, p1.dontLeaveFromButton })
			})
		})
	})
end

local function LeaveGameContainer(p1)
	-- upvalues: localization (ref), localizationService (ref), reactModule (ref), localizationProvider (ref), foundationProvider (ref), foundationModule (ref), reactFocusNavigationModule (ref), var5 (ref), LeaveButtonsContainer (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		FoundationProvider = reactModule.createElement(foundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
			FocusNavigationProvider = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var5 }, {
				LeaveButtonsContainer = reactModule.createElement(LeaveButtonsContainer, p1)
			})
		})
	})
end

local var6 = (function()
	-- upvalues: robloxGui (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), constantsModule (ref), fFlagRefactorMenuConfirmationButtonsModule (ref), reactRobloxModule (ref), reactModule (ref), LeaveGameContainer (ref), fFlagDebugEnablePioneerUX (ref), robloxTranslatorModule (ref), localizationKeys (ref), create (ref), themeModule (ref), var4 (ref), utilityModule (ref), leaveGameModule (ref)
	local leaveGamePage = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	leaveGamePage.playsessionid = ""
	
	if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		leaveGamePage.playsessionid = rbxAnalyticsService:GetPlaySessionId()
	end
	function leaveGamePage.DontLeaveFunc(p1)
		-- upvalues: leaveGamePage (ref), rbxAnalyticsService (copy), constantsModule (copy)
		if leaveGamePage.HubRef then
			leaveGamePage.HubRef:PopMenu(p1, true)
		end
		rbxAnalyticsService:SetRBXEventStream(constantsModule.AnalyticsTargetName, constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsLeaveGameName, {
			confirmed = constantsModule.AnalyticsCancelledName,
			universeid = tostring(game.GameId),
			source = constantsModule.AnalyticsLeaveGameSource,
			playsessionid = leaveGamePage.playsessionid
		})
	end
	
	function leaveGamePage.DontLeaveFromHotkey(_, p1, p2)
		-- upvalues: leaveGamePage (ref)
		if p1 == Enum.UserInputState.Begin then
			leaveGamePage.DontLeaveFunc(if p2.UserInputType ~= Enum.UserInputType.Gamepad1 then if p2.UserInputType ~= Enum.UserInputType.Gamepad2 then if p2.UserInputType ~= Enum.UserInputType.Gamepad3 then p2.UserInputType == Enum.UserInputType.Gamepad4 else true else true else true)
		end
	end
	
	function leaveGamePage.DontLeaveFromButton(p1)
		-- upvalues: leaveGamePage (ref)
		leaveGamePage.DontLeaveFunc(p1)
	end
	
	leaveGamePage.TabHeader = nil
	leaveGamePage.Page.Name = "LeaveGamePage"
	leaveGamePage.ShouldShowBottomBar = false
	leaveGamePage.ShouldShowHubBar = false
	
	if fFlagRefactorMenuConfirmationButtonsModule then
		function leaveGamePage.RenderPage()
			-- upvalues: leaveGamePage (ref), reactRobloxModule (copy), reactModule (copy), LeaveGameContainer (copy)
			leaveGamePage.PageRoot = reactRobloxModule.createRoot(leaveGamePage.Page)
			leaveGamePage.PageRoot:render(reactModule.createElement(LeaveGameContainer, { dontLeaveFromButton = leaveGamePage.DontLeaveFromButton }))
		end
		
		function leaveGamePage.UnmountPage()
			-- upvalues: leaveGamePage (ref)
			if leaveGamePage.PageRoot then
				leaveGamePage.PageRoot:unmount()
			end
		end
		
		leaveGamePage.Page.Size = UDim2.new(1, 0, 0, 0)
		
		return leaveGamePage
	end
	local var7 = create("TextLabel")({
		Name = "LeaveGameText",
		BackgroundTransparency = 1,
		TextWrapped = true,
		ZIndex = 2,
		Text = if fFlagDebugEnablePioneerUX then robloxTranslatorModule:FormatByKey(localizationKeys.LogoutConfirmation) else robloxTranslatorModule:FormatByKey(constantsModule.ConfirmLeaveGameLocalizedKey),
		Font = themeModule.font(Enum.Font.SourceSansBold, "Confirmation"),
		FontSize = themeModule.fontSize(Enum.FontSize.Size36, "Confirmation"),
		TextColor3 = Color3.new(1, 1, 1),
		Size = UDim2.new(1, 0, 0, 200),
		Parent = leaveGamePage.Page,
		Position = var4 and UDim2.new(0, 0, 0, 100) or UDim2.new(0, 0, 0, 0)
	})
	local var8 = create("Frame")({
		Name = "LeaveButtonContainer",
		BackgroundTransparency = 1,
		Parent = var7,
		Size = UDim2.new(1, 0, 0, 400),
		Position = UDim2.new(0, 0, 1, 0)
	})
	local _ = create("UIGridLayout")({
		Name = "LeavetButtonsLayout",
		CellSize = var4 and UDim2.new(0, 300, 0, 80) or UDim2.new(0, 200, 0, 50),
		CellPadding = UDim2.new(0, 20, 0, 20),
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		Parent = var8
	})
	
	if utilityModule:IsSmallTouchScreen() then
		var7.FontSize = Enum.FontSize.Size24
		var7.Size = UDim2.new(1, 0, 0, 100)
	elseif var4 then
		var7.FontSize = Enum.FontSize.Size48
	end
	leaveGamePage.LeaveGameButton = utilityModule:MakeStyledButton("LeaveGame", if fFlagDebugEnablePioneerUX then robloxTranslatorModule:FormatByKey(localizationKeys.LogoutButton) else "Leave", nil, function()
		-- upvalues: fFlagDebugEnablePioneerUX (copy), leaveGameModule (copy)
		if fFlagDebugEnablePioneerUX then
			leaveGameModule(false, { shouldNativeExit = true })
			
			return
		end
		leaveGameModule(true)
	end)
	leaveGamePage.LeaveGameButton.NextSelectionRight = nil
	leaveGamePage.LeaveGameButton.Parent = var8
	local dontLeaveGame = utilityModule:MakeStyledButton("DontLeaveGame", robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.DontLeaveButton"), nil, leaveGamePage.DontLeaveFromButton)
	dontLeaveGame.NextSelectionLeft = nil
	dontLeaveGame.Parent = var8
	leaveGamePage.Page.Size = UDim2.new(1, 0, 0, dontLeaveGame.AbsolutePosition.Y + dontLeaveGame.AbsoluteSize.Y)
	
	return leaveGamePage
end)()
var6.Displayed.Event:connect(function()
	-- upvalues: fFlagRefactorMenuConfirmationButtonsModule (ref), var6 (write), guiService (ref), fFlagEnableConsoleExpControls (ref), var1 (ref), fFlagChromeShortcutRemoveRespawnOnLeavePage (ref), var2 (ref), var3 (ref), contextActionService (ref)
	if fFlagRefactorMenuConfirmationButtonsModule then
		var6.RenderPage()
	end
	if not fFlagRefactorMenuConfirmationButtonsModule then
		guiService.SelectedCoreObject = var6.LeaveGameButton
	end
	if fFlagEnableConsoleExpControls then
		if not var1 then return end
		if fFlagChromeShortcutRemoveRespawnOnLeavePage then
			var2:setShortcutBar(var3.TILTMENU_LEAVE_DIALOG_SHORTCUTBAR_ID)
			
			return
		end
		var2:setShortcutBar(var3.TILTMENU_DIALOG_SHORTCUTBAR_ID)
		
		return
	else
		contextActionService:BindCoreAction("LeaveGameCancelAction", var6.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB)
	end
end)
var6.Hidden.Event:connect(function()
	-- upvalues: fFlagRefactorMenuConfirmationButtonsModule (ref), var6 (write), contextActionService (ref)
	if fFlagRefactorMenuConfirmationButtonsModule then
		var6.UnmountPage()
	end
	contextActionService:UnbindCoreAction("LeaveGameCancelAction")
end)

return var6