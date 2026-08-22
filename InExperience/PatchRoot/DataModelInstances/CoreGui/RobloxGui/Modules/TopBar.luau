local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local IXPService = game:GetService("IXPService")
local localizationService = game:GetService("LocalizationService")
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagAddTopBarScrimModule = require(script.Flags.FFlagAddTopBarScrim)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local localizationProvider = require(corePackagesService.Workspace.Packages.Localization).LocalizationProvider
local designTokenProvider = require(corePackagesService.Workspace.Packages.Style).DesignTokenProvider
local crossExperienceVoiceModule = require(corePackagesService.Workspace.Packages.CrossExperienceVoice)
local reactSceneUnderstandingModule = require(corePackagesService.Packages.ReactSceneUnderstanding)
local reactModule = require(corePackagesService.Packages.React)
local roactModule = require(corePackagesService.Packages.Roact)
local roduxModule = require(corePackagesService.Packages.Rodux)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local colorMode = require(corePackagesService.Packages.Foundation).Enums.ColorMode
local universalAppPolicyModule = require(corePackagesService.Workspace.Packages.UniversalAppPolicy)
local roactAppPolicy = universalAppPolicyModule.RoactAppPolicy
local appFeaturePolicies = universalAppPolicyModule.AppFeaturePolicies
local constants = UIBloxModule.App.Style.Constants
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local uiModeStyleProvider = require(corePackagesService.Workspace.Packages.Style).UiModeStyleProvider
local voiceStateContextModule = require(robloxGui.Modules.VoiceChat.VoiceStateContext)
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local tenFootInterfaceModule = require(robloxGui.Modules.TenFootInterface)
local isNewInGameMenuEnabledModule = require(robloxGui.Modules.isNewInGameMenuEnabled)
local var21 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local serviceModule = nil
local topBarScrimModule = nil

if var21 then
	serviceModule = require(robloxGui.Modules.Chrome.Service)
	topBarScrimModule = require(script.Components.TopBarScrim)
end
local constantsModule = require(script.Constants)
local menuNavigationPromptTokenMapperModule = require(script.TokenMappers.MenuNavigationPromptTokenMapper)
local fFlagTopBarSignalizeSetCores = require(corePackagesService.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarSignalizeSetCores
local fFlagTopBarSignalizeMenuOpen = require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeMenuOpen
local fFlagTopBarDeprecateGameInfoRoduxModule = require(script.Flags.FFlagTopBarDeprecateGameInfoRodux)
local fFlagTopBarDeprecateGamepadNavigationDialogRoduxModule = require(script.Flags.FFlagTopBarDeprecateGamepadNavigationDialogRodux)
local fFlagTopBarDeprecateChatRoduxModule = require(script.Flags.FFlagTopBarDeprecateChatRodux)
local fFlagTopBarDeprecateDisplayOptionsRoduxModule = require(script.Flags.FFlagTopBarDeprecateDisplayOptionsRodux)
local fFlagTopBarRefactor = require(corePackagesService.Workspace.Packages.InExperienceTopBar).Flags.FFlagTopBarRefactor
local fFlagEnablePlaytestModeUnibar = sharedFlagsModule.FFlagEnablePlaytestModeUnibar

if var21 then
	(function() --[[ line: 64 | named "SetGlobalGuiInset" ]]
		-- upvalues: guiService (ref), constantsModule (ref), displayModule (ref)
		local guiInset, guiInset_1 = guiService:GetGuiInset()
		guiService:SetGlobalGuiInset(guiInset.X, constantsModule.ApplyDisplayScale(constantsModule.TopBarHeight), guiInset_1.X, guiInset_1.Y)
		displayModule.GetDisplayStore().setGuiInset({
			left = guiInset.X,
			top = constantsModule.ApplyDisplayScale(constantsModule.TopBarHeight),
			right = guiInset_1.X,
			bottom = guiInset_1.Y
		})
	end)()
end
local var30 = if fFlagTopBarRefactor then require(script.ComponentsV2.TopBarApp) else require(script.Components.TopBarApp)
local reducerModule = require(script.Reducer)
local topBarAppPolicyModule = require(script.TopBarAppPolicy)
local setSmallTouchDeviceModule = require(script.Actions.SetSmallTouchDevice)
local setInspectMenuOpenModule = require(script.Actions.SetInspectMenuOpen)
local setGamepadMenuOpenModule = require(script.Actions.SetGamepadMenuOpen)
local setGamepadNavigationDialogOpenModule = require(script.Actions.SetGamepadNavigationDialogOpen)
local updateUnreadMessagesBadgeModule = require(script.Actions.UpdateUnreadMessagesBadge)
local getCanChatModule = require(script.Thunks.GetCanChat)
local getGameNameModule = require(script.Thunks.GetGameName)
local registerSetCoresModule = require(script.registerSetCores)
local globalConfigModule = require(script.GlobalConfig)
local roactAppExperimentModule = require(corePackagesService.Packages.RoactAppExperiment)
local fFlagAddMenuNavigationToggleDialog = sharedFlagsModule.FFlagAddMenuNavigationToggleDialog
local fFlagShowGameAgeRating = sharedFlagsModule.FFlagShowGameAgeRating
local fFlagGamepadNavigationDialogABTestModule = require(script.Flags.FFlagGamepadNavigationDialogABTest)
local getFFlagEnableCrossExpVoice = sharedFlagsModule.GetFFlagEnableCrossExpVoice
local component = crossExperienceVoiceModule.Component
local FTUX = robloxGui.Modules.FTUX
local getFFlagEnableVRFTUXExperienceModule = require(FTUX.Flags.GetFFlagEnableVRFTUXExperience)
local getFFlagDebugEnableVRFTUXExperienceInStudioModule = require(FTUX.Flags.GetFFlagDebugEnableVRFTUXExperienceInStudio)
local platformEnumModule = require(FTUX.Enums.PlatformEnum)
local isFTUXExperienceModule = require(FTUX.Utility.IsFTUXExperience)
local FTUXModule = require(script.Parent.FTUX)
local isRunningInStudio = require(corePackagesService.Workspace.Packages.AppCommonLib).isRunningInStudio
local t = {}
t.__index = t

function t.new() --[[ line: 123 ]]
	-- upvalues: t (ref), globalConfigModule (ref), roactModule (ref), tenFootInterfaceModule (ref), var21 (ref), guiService (ref), constantsModule (ref), fFlagEnablePlaytestModeUnibar (ref), roduxModule (ref), reducerModule (ref), fFlagTopBarSignalizeSetCores (ref), registerSetCoresModule (ref), fFlagTopBarDeprecateChatRoduxModule (ref), getCanChatModule (ref), fFlagTopBarDeprecateGameInfoRoduxModule (ref), getGameNameModule (ref), getFFlagDebugEnableVRFTUXExperienceInStudioModule (ref), isRunningInStudio (ref), FTUXModule (ref), platformEnumModule (ref), getFFlagEnableVRFTUXExperienceModule (ref), isFTUXExperienceModule (ref), isNewInGameMenuEnabledModule (ref), robloxGui (ref), fFlagTopBarDeprecateDisplayOptionsRoduxModule (ref), setSmallTouchDeviceModule (ref), utilityModule (ref), colorMode (ref), constants (ref), uiModeStyleProvider (ref), var30 (ref), fFlagAddMenuNavigationToggleDialog (ref), fFlagGamepadNavigationDialogABTestModule (ref), designTokenProvider (ref), menuNavigationPromptTokenMapperModule (ref), serviceModule (write), fFlagAddTopBarScrimModule (ref), reactModule (ref), topBarScrimModule (write), roactRoduxModule (ref), fFlagTopBarRefactor (ref), fFlagShowGameAgeRating (ref), roactAppPolicy (ref), topBarAppPolicyModule (ref), appFeaturePolicies (ref), localizationProvider (ref), localization (ref), localizationService (ref), roactAppExperimentModule (ref), IXPService (ref), getFFlagEnableCrossExpVoice (ref), component (ref), reactSceneUnderstandingModule (ref), voiceStateContextModule (ref), coreGuiService (ref), updateUnreadMessagesBadgeModule (ref), fFlagTopBarDeprecateGamepadNavigationDialogRoduxModule (ref)
	local tbl = setmetatable({}, t)
	
	if globalConfigModule.propValidation then
		roactModule.setGlobalConfig({ propValidation = true })
	end
	if globalConfigModule.elementTracing then
		roactModule.setGlobalConfig({ elementTracing = true })
	end
	if not tenFootInterfaceModule:IsEnabled() and not var21 then
		guiService:SetGlobalGuiInset(0, constantsModule.TopBarHeight, 0, 0)
	end
	if fFlagEnablePlaytestModeUnibar then
		require(script.initPlaytestMode)()
	end
	tbl.store = roduxModule.Store.new(reducerModule, nil, { roduxModule.thunkMiddleware })
	
	if not fFlagTopBarSignalizeSetCores then
		registerSetCoresModule(tbl.store)
	end
	if not fFlagTopBarDeprecateChatRoduxModule then
		tbl.store:dispatch(getCanChatModule)
	end
	if not fFlagTopBarDeprecateGameInfoRoduxModule then
		tbl.store:dispatch(getGameNameModule)
	end
	if getFFlagDebugEnableVRFTUXExperienceInStudioModule() and isRunningInStudio() then
		FTUXModule.mountFtuxMenu(platformEnumModule.QuestVR)
	end
	if getFFlagEnableVRFTUXExperienceModule() and isFTUXExperienceModule(platformEnumModule.QuestVR) then
		FTUXModule.mountFtuxMenu(platformEnumModule.QuestVR)
	end
	if isNewInGameMenuEnabledModule() then
		require(robloxGui.Modules.InGameMenuInit).mountInGameMenu()
	end
	if not fFlagTopBarDeprecateDisplayOptionsRoduxModule then
		coroutine.wrap(function() --[[ line: 180 ]]
			-- upvalues: tbl (ref), setSmallTouchDeviceModule (copy), utilityModule (copy)
			tbl.store:dispatch(setSmallTouchDeviceModule(utilityModule:IsSmallTouchScreen()))
		end)()
	end
	local t_1 = {
		themeName = colorMode.Dark,
		fontName = constants.FontName.Gotham
	}
	
	local function wrapWithUiModeStyleProvider(p0) --[[ line: 190 ]]
		-- upvalues: roactModule (copy), uiModeStyleProvider (copy), t_1 (ref)
		return {
			UiModeStyleProvider = roactModule.createElement(uiModeStyleProvider, { style = t_1 }, p0)
		}
	end
	
	local var55 = roactModule.createElement(var30)
	
	if fFlagAddMenuNavigationToggleDialog or fFlagGamepadNavigationDialogABTestModule then
		var55 = roactModule.createElement(designTokenProvider, {
			tokenMappers = {
				MenuNavigationPrompt = if fFlagGamepadNavigationDialogABTestModule then menuNavigationPromptTokenMapperModule else nil
			}
		}, { TopBarApp = var55 })
	end
	tbl.root = roactModule.createElement(roactRoduxModule.StoreProvider, { store = tbl.store }, {
		PolicyProvider = roactModule.createElement(if fFlagTopBarRefactor or fFlagShowGameAgeRating then roactAppPolicy.Provider else topBarAppPolicyModule.Provider, {
			policy = if fFlagTopBarRefactor or fFlagShowGameAgeRating then { appFeaturePolicies } else { topBarAppPolicyModule.Mapper }
		}, wrapWithUiModeStyleProvider({
			LocalizationProvider = roactModule.createElement(localizationProvider, {
				localization = localization.new(localizationService.RobloxLocaleId)
			}, {
				ExperimentProvider = roactModule.createFragment({
					RoactAppExperimentProvider = roactModule.createElement(roactAppExperimentModule.Provider, { value = IXPService }, {
						TopBarApp = var55,
						TopBarScrim = serviceModule and (fFlagAddTopBarScrimModule and reactModule.createElement("ScreenGui", {
							IgnoreGuiInset = true,
							DisplayOrder = -2,
							ZIndexBehavior = Enum.ZIndexBehavior.Sibling
						}, {
							TopBarScrim = reactModule.createElement(topBarScrimModule)
						}))
					}),
					CrossExperienceVoice = getFFlagEnableCrossExpVoice() and roactModule.createElement(component) or nil
				})
			})
		}))
	})
	tbl.root = roactModule.createElement(reactSceneUnderstandingModule.SceneAnalysisProvider, nil, tbl.root)
	tbl.root = roactModule.createElement(voiceStateContextModule.Provider, nil, tbl.root)
	tbl.root = roactModule.createElement("Folder", { Name = "TopBarApp" }, tbl.root)
	tbl.element = roactModule.mount(tbl.root, coreGuiService, "TopBar")
	
	if not fFlagTopBarDeprecateChatRoduxModule then
		game:GetService("TextChatService").MessageReceived:Connect(function() --[[ line: 269 ]]
			-- upvalues: tbl (ref), updateUnreadMessagesBadgeModule (copy)
			tbl.store:dispatch(updateUnreadMessagesBadgeModule(1))
		end)
	end
	if fFlagGamepadNavigationDialogABTestModule and not fFlagTopBarDeprecateGamepadNavigationDialogRoduxModule then
		local userInputService = game:GetService("UserInputService")
		local gamepadConnectedConnection = nil
		
		local function disconnectGamepadConnected() --[[ line: 277 ]]
			-- upvalues: gamepadConnectedConnection (write)
			if gamepadConnectedConnection then
				gamepadConnectedConnection:Disconnect()
				gamepadConnectedConnection = nil
			end
		end
		
		if userInputService:GetGamepadConnected(Enum.UserInputType.Gamepad1) then
			tbl:setGamepadNavigationDialogOpen(true)
		else
			gamepadConnectedConnection = userInputService.GamepadConnected:Connect(function() --[[ line: 286 ]]
				-- upvalues: tbl (ref), gamepadConnectedConnection (write)
				tbl:setGamepadNavigationDialogOpen(true)
				
				if gamepadConnectedConnection then
					gamepadConnectedConnection:Disconnect()
					gamepadConnectedConnection = nil
				end
			end)
		end
		guiService:GetPropertyChangedSignal("MenuIsOpen"):Connect(disconnectGamepadConnected)
	end
	return tbl
end

function t:setInspectMenuOpen(p1) --[[ line: 298 ]]
	-- upvalues: fFlagTopBarSignalizeMenuOpen (ref), setInspectMenuOpenModule (ref)
	if fFlagTopBarSignalizeMenuOpen then
		return
	end
	self.store:dispatch(setInspectMenuOpenModule(p1))
end

function t:setGamepadMenuOpen(p2) --[[ line: 305 ]]
	-- upvalues: setGamepadMenuOpenModule (ref)
	self.store:dispatch(setGamepadMenuOpenModule(p2))
end

function t:setGamepadNavigationDialogOpen(p3) --[[ line: 309 ]]
	-- upvalues: fFlagTopBarDeprecateDisplayOptionsRoduxModule (ref), setGamepadNavigationDialogOpenModule (ref)
	if not fFlagTopBarDeprecateDisplayOptionsRoduxModule then
		self.store:dispatch(setGamepadNavigationDialogOpenModule(p3))
	end
end

return t.new()