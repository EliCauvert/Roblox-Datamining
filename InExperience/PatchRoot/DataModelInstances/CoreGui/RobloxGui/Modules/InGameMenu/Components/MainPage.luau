local ContextActionService = game:GetService("ContextActionService")
local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VRService = game:GetService("VRService")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local UIBlox = InGameMenuDependenciesModule.UIBlox
local T = InGameMenuDependenciesModule.t
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local ContextualMenu = UIBlox.App.Menu.ContextualMenu
local MenuDirection = UIBlox.App.Menu.MenuDirection
local KeyLabel = UIBlox.App.Menu.KeyLabel
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local Parent = script.Parent.Parent
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local SetRespawningModule = require(Parent.Actions.SetRespawning)
local CloseMenuModule = require(Parent.Thunks.CloseMenu)
local AssetsModule = require(Parent.Resources.Assets)
local SetCurrentPageModule = require(Parent.Actions.SetCurrentPage)
local VoiceIndicatorModule = require(RobloxGui.Modules.VoiceChat.Components.VoiceIndicator)
local ConstantsModule = require(Parent.Resources.Constants)
local DirectionModule = require(Parent.Enums.Direction)
local PageNavigationModule = require(script.Parent.PageNavigation)
local GameIconHeaderModule = require(script.Parent.GameIconHeader)
local ZonePortalModule = require(script.Parent.ZonePortal)
local TakeAScreenshotOfThis = game:DefineFastFlag("TakeAScreenshotOfThis", false)
local ShowContextMenuWhenButtonsArePresent = game:DefineFastFlag("ShowContextMenuWhenButtonsArePresent", false)
local UseVRSpecificLeaveButton = game:DefineFastFlag("UseVRSpecificLeaveButton", false)
local GetFFlagIGMGamepadSelectionHistoryModule = require(Parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local Images = UIBlox.App.ImageSet.Images
local FocusHandlerModule = require(script.Parent.Connection.FocusHandler)
local IGMMainPageControllerBarModule = require(script.Parent.IGMMainPageControllerBar)
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local config = {
	[ConstantsModule.InputType.MouseAndKeyboard] = Enum.KeyCode.R,
	[ConstantsModule.InputType.Gamepad] = Enum.KeyCode.ButtonY
}
local config1 = {
	[ConstantsModule.InputType.MouseAndKeyboard] = Enum.KeyCode.L,
	[ConstantsModule.InputType.Gamepad] = Enum.KeyCode.ButtonX
}
local MainPage = Roact.PureComponent:extend("MainPage")

local function _(): boolean --[[ Line: 73 | Named "areCapturesAllowed" ]]
	-- upvalues: VRService (copy), TakeAScreenshotOfThis (copy), CorePackages (copy)
	return not VRService.VREnabled and (not TakeAScreenshotOfThis or not require(CorePackages.Workspace.Packages.CachedPolicyService):IsSubjectToChinaPolicies())
end

function MainPage.renderButtonModels(p1, _, p2) --[[ Line: 85 ]]
	-- upvalues: VRService (copy), TakeAScreenshotOfThis (copy), CorePackages (copy), Images (copy), RunService (copy), CoreGui (copy), AssetsModule (copy), config (copy)
	local List = {}
	local InputType = p1.props.inputType
	
	if not VRService.VREnabled and (not TakeAScreenshotOfThis or not require(CorePackages.Workspace.Packages.CachedPolicyService):IsSubjectToChinaPolicies()) and TakeAScreenshotOfThis then
		table.insert(List, {
			icon = Images["icons/controls/screenshot"],
			text = p2.screenCapture,
			onActivated = function() --[[ Line: 99 ]]
				-- upvalues: p1 (copy), RunService (upval), CoreGui (upval)
				p1:setState({ modalOpen = false })
				p1.props.closeMenu()
				RunService.RenderStepped:Wait()
				RunService.RenderStepped:Wait()
				CoreGui:TakeScreenshot()
			end
		})
	end
	if p1.props.respawnButtonVisible then
		table.insert(List, {
			icon = AssetsModule.Images.RespawnIcon,
			text = p2.respawnCharacter,
			onActivated = function() --[[ Line: 118 ]]
				-- upvalues: p1 (copy)
				p1:setState({ modalOpen = false })
				p1.props.startRespawning()
			end,
			keyCodeLabel = config[InputType]
		})
	end
	return List
end

MainPage.validateProps = T.strictInterface({
	open = T.boolean,
	isMainPageMoreMenuOpen = T.optional(T.boolean),
	respawnButtonVisible = T.boolean,
	startLeavingGame = T.callback,
	startRespawning = T.callback,
	setMainPageMoreMenuOpen = T.optional(T.callback),
	closeMenu = T.callback,
	screenSize = T.Vector2,
	canCaptureFocus = T.optional(T.boolean),
	inputType = T.optional(T.string),
	setFirstItemRef = T.optional(T.callback),
	voiceEnabled = T.optional(T.boolean),
	currentZone = GetFFlagIGMGamepadSelectionHistoryModule() and T.optional(T.number) or nil
})

function MainPage.init(p1) --[[ Line: 148 ]]
	-- upvalues: Roact (copy)
	p1.moreMenuFrameRef = nil
	p1.moreMenuFirstItemFrameRef = nil
	p1.moreMenuButtonRef = Roact.createRef()
	p1.mainPageFirstButtonRef = Roact.createRef()
	
	function p1.setMoreMenuRef(MoreMenuFrameRef) --[[ Line: 154 ]]
		-- upvalues: p1 (copy)
		p1.moreMenuFrameRef = MoreMenuFrameRef
	end
	
	function p1.setMoreMenuFirstItemRef(MoreMenuFirstItemFrameRef) --[[ Line: 158 ]]
		-- upvalues: p1 (copy)
		p1.moreMenuFirstItemFrameRef = MoreMenuFirstItemFrameRef
	end
	
	p1.state = { modalOpen = false }
end

function MainPage.getDerivedStateFromProps(p1) --[[ Line: 169 ]]
	return if p1.canCaptureFocus then nil else { modalOpen = false }
end

function MainPage.renderMainPageFocusHandler(p1) --[[ Line: 178 ]]
	-- upvalues: GetFFlagIGMGamepadSelectionHistoryModule (copy), Roact (copy), FocusHandlerModule (copy), ContextActionService (copy), GuiService (copy)
	local CanGamepadCaptureFocus = p1.canGamepadCaptureFocus(p1.props)
	local NoOpen: boolean? = nil
	
	if GetFFlagIGMGamepadSelectionHistoryModule() then
		local ModalOpen = p1.state.modalOpen
		CanGamepadCaptureFocus = p1.canGamepadCaptureFocus(p1.props) and not ModalOpen
		NoOpen = not p1.props.open or p1.props.currentZone == 0
	end
	return Roact.createElement(FocusHandlerModule, {
		isFocused = CanGamepadCaptureFocus,
		shouldForgetPreviousSelection = NoOpen,
		didFocus = GetFFlagIGMGamepadSelectionHistoryModule() and function(p2) --[[ Line: 193 ]]
			-- upvalues: ContextActionService (upval), p1 (copy), GuiService (upval)
			ContextActionService:BindCoreAction("LeftStickTogglesMoreMenuAction", function(_, UserInputState) --[[ Line: 196 ]]
				-- upvalues: p1 (upval)
				if UserInputState == Enum.UserInputState.End then
					p1:setState({ modalOpen = true })
					
					return Enum.ContextActionResult.Sink
				else
					return Enum.ContextActionResult.Pass
				end
			end, false, Enum.KeyCode.ButtonL3)
			GuiService.SelectedCoreObject = p2 or p1.mainPageFirstButtonRef:getValue()
		end or function() --[[ Line: 210 ]]
			-- upvalues: ContextActionService (upval), p1 (copy)
			ContextActionService:BindCoreAction("LeftStickTogglesMoreMenuAction", function(_, UserInputState) --[[ Line: 211 ]]
				-- upvalues: p1 (upval)
				if UserInputState == Enum.UserInputState.End then
					p1:setState({ modalOpen = not p1.state.modalOpen })
					
					return Enum.ContextActionResult.Sink
				else
					return Enum.ContextActionResult.Pass
				end
			end, false, Enum.KeyCode.ButtonL3)
		end,
		didBlur = function() --[[ Line: 222 ]]
			-- upvalues: ContextActionService (upval)
			ContextActionService:UnbindCoreAction("LeftStickTogglesMoreMenuAction")
		end
	})
end

function MainPage.renderMoreMenuFocusHandler(p1) --[[ Line: 228 ]]
	-- upvalues: Roact (copy), FocusHandlerModule (copy), GetFFlagIGMGamepadSelectionHistoryModule (copy), ContextActionService (copy), GuiService (copy)
	local ModalOpen = p1.state.modalOpen
	
	return Roact.createElement(FocusHandlerModule, {
		isFocused = p1.canGamepadCaptureFocus(p1.props) and ModalOpen,
		didFocus = function() --[[ Line: 235 ]]
			-- upvalues: p1 (copy), GetFFlagIGMGamepadSelectionHistoryModule (upval), ContextActionService (upval), GuiService (upval)
			local function FunctionToBind(_, UserInputState) --[[ Line: 236 ]]
				-- upvalues: p1 (upval)
				if UserInputState == Enum.UserInputState.End then
					p1:setState({ modalOpen = false })
					
					return Enum.ContextActionResult.Sink
				else
					return Enum.ContextActionResult.Pass
				end
			end
			
			if GetFFlagIGMGamepadSelectionHistoryModule() then
				ContextActionService:BindCoreAction("CloseMoreMenuAction", FunctionToBind, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonL3)
			else
				ContextActionService:BindCoreAction("CloseMoreMenuAction", FunctionToBind, false, Enum.KeyCode.ButtonB)
			end
			if p1.moreMenuFrameRef ~= nil then
				GuiService:RemoveSelectionGroup("MainPageMoreMenu")
			end
			GuiService:AddSelectionParent("MainPageMoreMenu", p1.moreMenuFrameRef)
			GuiService.SelectedCoreObject = p1.moreMenuFirstItemFrameRef
		end,
		didBlur = function() --[[ Line: 271 ]]
			-- upvalues: ContextActionService (upval)
			ContextActionService:UnbindCoreAction("CloseMoreMenuAction")
		end
	})
end

function MainPage.render(p1) --[[ Line: 277 ]]
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), WithLocalizationModule (copy), Roact (copy), Button (copy), ButtonType (copy), AssetsModule (copy), ShowContextMenuWhenButtonsArePresent (copy), VRService (copy), UseVRSpecificLeaveButton (copy), config1 (copy), IGMMainPageControllerBarModule (copy), VoiceIndicatorModule (copy), Players (copy), Default (copy), ZonePortalModule (copy), DirectionModule (copy), GameIconHeaderModule (copy), PageNavigationModule (copy), ConstantsModule (copy), ContextualMenu (copy), MenuDirection (copy), KeyLabel (copy)
	local CanGamepadCaptureFocus = p1.canGamepadCaptureFocus(p1.props)
	
	return WithFoundationOrUIBloxStyleFunction(function(p2) --[[ Line: 280 ]]
		return {
			Theme = {
				BackgroundDefault = {
					Color = p2.Color.Surface.Surface_0.Color3,
					Transparency = p2.Color.Surface.Surface_0.Transparency
				}
			}
		}
	end, function(p2) --[[ Line: 286 ]]
		-- upvalues: WithLocalizationModule (upval), Roact (upval), Button (upval), ButtonType (upval), p1 (copy), AssetsModule (upval), ShowContextMenuWhenButtonsArePresent (upval), VRService (upval), UseVRSpecificLeaveButton (upval), config1 (upval), IGMMainPageControllerBarModule (upval), CanGamepadCaptureFocus (copy), VoiceIndicatorModule (upval), Players (upval), Default (upval), ZonePortalModule (upval), DirectionModule (upval), GameIconHeaderModule (upval), PageNavigationModule (upval), ConstantsModule (upval), ContextualMenu (upval), MenuDirection (upval), KeyLabel (upval)
		return WithLocalizationModule({
			leaveGame = "CoreScripts.InGameMenu.LeaveGame",
			respawnCharacter = "CoreScripts.InGameMenu.RespawnCharacter",
			screenCapture = "CoreScripts.InGameMenu.Controls.Screenshot"
		})(function(p3) --[[ Line: 291 ]]
			-- upvalues: Roact (upval), Button (upval), ButtonType (upval), p1 (upval), AssetsModule (upval), p2 (copy), ShowContextMenuWhenButtonsArePresent (upval), VRService (upval), UseVRSpecificLeaveButton (upval), config1 (upval), IGMMainPageControllerBarModule (upval), CanGamepadCaptureFocus (upval), VoiceIndicatorModule (upval), Players (upval), Default (upval), ZonePortalModule (upval), DirectionModule (upval), GameIconHeaderModule (upval), PageNavigationModule (upval), ConstantsModule (upval), ContextualMenu (upval), MenuDirection (upval), KeyLabel (upval)
			local Element = Roact.createElement(Button, {
				buttonType = ButtonType.Secondary,
				size = UDim2.fromOffset(44, 44),
				onActivated = function() --[[ Line: 295 ]]
					-- upvalues: p1 (upval)
					p1:setState({ modalOpen = true })
				end,
				icon = AssetsModule.Images.MoreActions,
				[Roact.Ref] = p1.moreMenuButtonRef
			})
			local RenderButtonModelsResult = p1:renderButtonModels(p2, p3)
			local RespawnButtonVisible = if ShowContextMenuWhenButtonsArePresent then #RenderButtonModelsResult > 0 else p1.props.respawnButtonVisible
			local InputType = p1.props.inputType
			local ButtonX = if VRService.VREnabled and UseVRSpecificLeaveButton then Enum.KeyCode.ButtonX else config1[InputType]
			local XOffset: number = if RespawnButtonVisible then -56 else 0
			local ModalOpen = p1.state.modalOpen
			local Element1 = Roact.createElement(IGMMainPageControllerBarModule, {
				canCaptureFocus = CanGamepadCaptureFocus,
				isMainPageMoreMenuOpen = ModalOpen
			})
			local Element2 = nil
			
			if p1.props.voiceEnabled then
				Element2 = Roact.createElement(VoiceIndicatorModule, {
					iconStyle = "MicLight",
					size = UDim2.fromOffset(44, 44),
					userId = tostring(Players.LocalPlayer.UserId),
					onClicked = function() --[[ Line: 329 ]]
						-- upvalues: Default (upval)
						Default:ToggleMic("VRInGameMenuMainPage")
					end
				})
				XOffset -= 56
			end
			return Roact.createElement("TextButton", {
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				Selectable = false,
				Size = UDim2.new(0, 400, 1, 0),
				BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
				BackgroundTransparency = p2.Theme.BackgroundDefault.Transparency,
				Visible = p1.props.open
			}, {
				MoreMenuFocusHandler = p1:renderMoreMenuFocusHandler(),
				MainPageFocusHandler = if VRService.VREnabled then nil else p1:renderMainPageFocusHandler() or nil,
				ControllerBar = Element1,
				ZonePortal = Roact.createElement(ZonePortalModule, { targetZone = 0, direction = DirectionModule.Left }),
				GameIconHeader = Roact.createElement(GameIconHeaderModule),
				PageNavigation = Roact.createElement(PageNavigationModule, {
					Position = UDim2.new(0, ConstantsModule.Zone.ContentOffset, 0, 148),
					mainPageFirstButtonRef = p1.mainPageFirstButtonRef
				}),
				ContextualMenu = Roact.createElement(ContextualMenu, {
					closeBackgroundVisible = true,
					buttonProps = RenderButtonModelsResult,
					setFrameRef = p1.setMoreMenuRef,
					setFirstItemRef = p1.setMoreMenuFirstItemRef,
					open = ModalOpen,
					menuDirection = MenuDirection.Up,
					openPositionY = UDim.new(1, -84),
					screenSize = p1.props.screenSize,
					onDismiss = function() --[[ Line: 371 ]]
						-- upvalues: p1 (upval)
						p1:setState({ modalOpen = false })
					end
				}),
				BottomButtons = Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 84),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1)
				}, {
					Layout = Roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						Padding = UDim.new(0, 12),
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Top
					}),
					Padding = Roact.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 24),
						PaddingBottom = UDim.new(0, 24),
						PaddingLeft = UDim.new(0, 24),
						PaddingRight = UDim.new(0, 24)
					}),
					LeaveGame = Roact.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, XOffset, 0, 44),
						Position = UDim2.fromScale(1, 0),
						AnchorPoint = Vector2.new(1, 0)
					}, {
						Button = Roact.createElement(Button, {
							buttonType = ButtonType.PrimarySystem,
							size = UDim2.new(1, 0, 0, 44),
							onActivated = p1.props.startLeavingGame,
							text = p3.leaveGame
						}),
						KeyLabel = ButtonX and Roact.createElement(KeyLabel, {
							iconThemeKey = "UIDefault",
							textThemeKey = "SystemPrimaryContent",
							LayoutOrder = 2,
							ZIndex = 2,
							keyCode = ButtonX,
							AnchorPoint = Vector2.new(1, 0.5),
							Position = UDim2.new(1, -16, 0.5, 0)
						}) or nil
					}),
					VoiceChatMuteButton = Element2,
					MoreButton = RespawnButtonVisible and Element
				})
			})
		end)
	end)
end

function MainPage:willUnmount() --[[ Line: 427 ]]
	-- upvalues: GuiService (copy)
	GuiService:RemoveSelectionGroup("MainPageMoreMenu")
end

function MainPage.canGamepadCaptureFocus(Props): boolean --[[ Line: 431 ]]
	-- upvalues: ConstantsModule (copy)
	return Props.canCaptureFocus and Props.inputType == ConstantsModule.InputType.Gamepad
end

function MainPage.didUpdate(p1, p2, p3) --[[ Line: 435 ]]
	-- upvalues: GetFFlagIGMGamepadSelectionHistoryModule (copy), GuiService (copy), VRService (copy), UserInputService (copy)
	local ModalOpen = p1.state.modalOpen
	local ModalOpen1 = p3.modalOpen
	
	if not GetFFlagIGMGamepadSelectionHistoryModule() and p1.canGamepadCaptureFocus(p1.props) and not ModalOpen then
		if ModalOpen1 then
			GuiService.SelectedCoreObject = p1.moreMenuButtonRef:getValue()
		elseif not p1.canGamepadCaptureFocus(p2) then
			GuiService.SelectedCoreObject = p1.mainPageFirstButtonRef:getValue()
		end
	end
	if VRService.VREnabled then
		UserInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
	end
end

return RoactRodux.UNSTABLE_connect2(function(p1, _) --[[ Line: 455 ]]
	-- upvalues: GetFFlagIGMGamepadSelectionHistoryModule (copy), ConstantsModule (copy)
	return {
		isMainPageInForeground = nil,
		open = p1.isMenuOpen,
		respawnButtonVisible = p1.respawn.enabled,
		screenSize = p1.screenSize,
		voiceEnabled = p1.voiceState.voiceEnabled,
		canCaptureFocus = p1.menuPage == ConstantsModule.MainPagePageKey and (p1.isMenuOpen and (not p1.respawn.dialogOpen and p1.currentZone == 1)),
		currentZone = if GetFFlagIGMGamepadSelectionHistoryModule() then p1.currentZone else nil,
		inputType = p1.displayOptions.inputType
	}
end, function(Callback) --[[ Line: 478 ]]
	-- upvalues: SetCurrentPageModule (copy), ConstantsModule (copy), SetRespawningModule (copy), CloseMenuModule (copy)
	return {
		startLeavingGame = function() --[[ Line: 480 ]]
			-- upvalues: Callback (copy), SetCurrentPageModule (upval), ConstantsModule (upval)
			Callback(SetCurrentPageModule(ConstantsModule.LeaveGamePromptPageKey))
		end,
		startRespawning = function() --[[ Line: 483 ]]
			-- upvalues: Callback (copy), SetRespawningModule (upval)
			Callback(SetRespawningModule(true))
		end,
		closeMenu = function() --[[ Line: 486 ]]
			-- upvalues: Callback (copy), CloseMenuModule (upval)
			Callback(CloseMenuModule)
		end
	}
end)(MainPage)