local contextActionService = game:GetService("ContextActionService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local VRService = game:GetService("VRService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local contextualMenu = UIBlox.App.Menu.ContextualMenu
local menuDirection = UIBlox.App.Menu.MenuDirection
local keyLabel = UIBlox.App.Menu.KeyLabel
local button = UIBlox.App.Button.Button
local buttonType = UIBlox.App.Button.Enum.ButtonType
local parent = script.Parent.Parent
local withLocalizationModule = require(parent.Localization.withLocalization)
local setRespawningModule = require(parent.Actions.SetRespawning)
local closeMenuModule = require(parent.Thunks.CloseMenu)
local assetsModule = require(parent.Resources.Assets)
local setCurrentPageModule = require(parent.Actions.SetCurrentPage)
local voiceIndicatorModule = require(robloxGui.Modules.VoiceChat.Components.VoiceIndicator)
local constantsModule = require(parent.Resources.Constants)
local directionModule = require(parent.Enums.Direction)
local pageNavigationModule = require(script.Parent.PageNavigation)
local gameIconHeaderModule = require(script.Parent.GameIconHeader)
local zonePortalModule = require(script.Parent.ZonePortal)
local flags = parent.Flags
local takeAScreenshotOfThis = game:DefineFastFlag("TakeAScreenshotOfThis", false)
local showContextMenuWhenButtonsArePresent = game:DefineFastFlag("ShowContextMenuWhenButtonsArePresent", false)
local useVRSpecificLeaveButton = game:DefineFastFlag("UseVRSpecificLeaveButton", false)
local getFFlagIGMGamepadSelectionHistoryModule = require(flags.GetFFlagIGMGamepadSelectionHistory)
local images = UIBlox.App.ImageSet.Images
local focusHandlerModule = require(script.Parent.Connection.FocusHandler)
local IGMMainPageControllerBarModule = require(script.Parent.IGMMainPageControllerBar)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local t_1 = {
	[constantsModule.InputType.MouseAndKeyboard] = Enum.KeyCode.R,
	[constantsModule.InputType.Gamepad] = Enum.KeyCode.ButtonY
}
local t_2 = {
	[constantsModule.InputType.MouseAndKeyboard] = Enum.KeyCode.L,
	[constantsModule.InputType.Gamepad] = Enum.KeyCode.ButtonX
}
local mainPage = roact.PureComponent:extend("MainPage")

local function _()
	-- upvalues: VRService (ref), takeAScreenshotOfThis (ref), corePackagesService (ref)
	return if VRService.VREnabled then false elseif takeAScreenshotOfThis then not require(corePackagesService.Workspace.Packages.CachedPolicyService):IsSubjectToChinaPolicies() else true
end

function mainPage.renderButtonModels(p1, _, p2)
	-- upvalues: VRService (ref), takeAScreenshotOfThis (ref), corePackagesService (ref), images (ref), runService (ref), coreGuiService (ref), assetsModule (ref), t_1 (ref)
	local t = {}
	local inputType = p1.props.inputType
	
	if (if VRService.VREnabled then false else not takeAScreenshotOfThis or not require(corePackagesService.Workspace.Packages.CachedPolicyService):IsSubjectToChinaPolicies()) and takeAScreenshotOfThis then
		table.insert(t, {
			icon = images["icons/controls/screenshot"],
			text = p2.screenCapture,
			onActivated = function()
				-- upvalues: p1 (ref), runService (copy), coreGuiService (copy)
				p1:setState({ modalOpen = false })
				p1.props.closeMenu()
				runService.RenderStepped:Wait()
				runService.RenderStepped:Wait()
				coreGuiService:TakeScreenshot()
			end
		})
	end
	if p1.props.respawnButtonVisible then
		table.insert(t, {
			icon = assetsModule.Images.RespawnIcon,
			text = p2.respawnCharacter,
			onActivated = function()
				-- upvalues: p1 (ref)
				p1:setState({ modalOpen = false })
				p1.props.startRespawning()
			end,
			keyCodeLabel = t_1[inputType]
		})
	end
	return t
end

mainPage.validateProps = t.strictInterface({
	open = t.boolean,
	isMainPageMoreMenuOpen = t.optional(t.boolean),
	respawnButtonVisible = t.boolean,
	startLeavingGame = t.callback,
	startRespawning = t.callback,
	setMainPageMoreMenuOpen = t.optional(t.callback),
	closeMenu = t.callback,
	screenSize = t.Vector2,
	canCaptureFocus = t.optional(t.boolean),
	inputType = t.optional(t.string),
	setFirstItemRef = t.optional(t.callback),
	voiceEnabled = t.optional(t.boolean),
	currentZone = getFFlagIGMGamepadSelectionHistoryModule() and t.optional(t.number) or nil
})

function mainPage.init(p1)
	-- upvalues: roact (ref)
	p1.moreMenuFrameRef = nil
	p1.moreMenuFirstItemFrameRef = nil
	p1.moreMenuButtonRef = roact.createRef()
	p1.mainPageFirstButtonRef = roact.createRef()
	
	function p2.setMoreMenuRef(p2)
		-- upvalues: p1 (ref)
		p1.moreMenuFrameRef = p2
	end
	
	function p2.setMoreMenuFirstItemRef(p2)
		-- upvalues: p1 (ref)
		p1.moreMenuFirstItemFrameRef = p2
	end
	
	p1.state = { modalOpen = false }
end

function mainPage.getDerivedStateFromProps(p1)
	return if p1.canCaptureFocus then nil else { modalOpen = false }
end

function mainPage.renderMainPageFocusHandler(p1)
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), roact (ref), focusHandlerModule (ref), contextActionService (ref), guiService (ref)
	local var1 = p1.canGamepadCaptureFocus(p1.props)
	local var2 = nil
	
	if getFFlagIGMGamepadSelectionHistoryModule() then
		var1 = p1.canGamepadCaptureFocus(p1.props) and not p1.state.modalOpen
		var2 = if p1.props.open then p1.props.currentZone == 0 else not p1.props.open
	end
	return roact.createElement(focusHandlerModule, {
		isFocused = var1,
		shouldForgetPreviousSelection = var2,
		didFocus = if getFFlagIGMGamepadSelectionHistoryModule() then function(p2)
			-- upvalues: contextActionService (copy), p1 (ref), guiService (copy)
			contextActionService:BindCoreAction("LeftStickTogglesMoreMenuAction", function(_, p3)
				-- upvalues: p1 (copy)
				if p3 == Enum.UserInputState.End then
					p1:setState({ modalOpen = true })
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonL3)
			guiService.SelectedCoreObject = p2 or p1.mainPageFirstButtonRef:getValue()
		end else function()
			-- upvalues: contextActionService (copy), p1 (ref)
			contextActionService:BindCoreAction("LeftStickTogglesMoreMenuAction", function(_, p2)
				-- upvalues: p1 (copy)
				if p2 == Enum.UserInputState.End then
					p1:setState({ modalOpen = not p1.state.modalOpen })
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonL3)
		end,
		didBlur = function()
			-- upvalues: contextActionService (copy)
			contextActionService:UnbindCoreAction("LeftStickTogglesMoreMenuAction")
		end
	})
end

function mainPage.renderMoreMenuFocusHandler(p1)
	-- upvalues: roact (ref), focusHandlerModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), contextActionService (ref), guiService (ref)
	return roact.createElement(focusHandlerModule, {
		isFocused = p1.canGamepadCaptureFocus(p1.props) and p1.state.modalOpen,
		didFocus = function()
			-- upvalues: p1 (ref), getFFlagIGMGamepadSelectionHistoryModule (copy), contextActionService (copy), guiService (copy)
			local var1 = function(_, p2)
				-- upvalues: p1 (copy)
				if p2 == Enum.UserInputState.End then
					p1:setState({ modalOpen = false })
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end
			
			if getFFlagIGMGamepadSelectionHistoryModule() then
				contextActionService:BindCoreAction("CloseMoreMenuAction", var1, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonL3)
			else
				contextActionService:BindCoreAction("CloseMoreMenuAction", var1, false, Enum.KeyCode.ButtonB)
			end
			if p1.moreMenuFrameRef ~= nil then
				guiService:RemoveSelectionGroup("MainPageMoreMenu")
			end
			guiService:AddSelectionParent("MainPageMoreMenu", p1.moreMenuFrameRef)
			guiService.SelectedCoreObject = p1.moreMenuFirstItemFrameRef
		end,
		didBlur = function()
			-- upvalues: contextActionService (copy)
			contextActionService:UnbindCoreAction("CloseMoreMenuAction")
		end
	})
end

function mainPage.render(p1)
	-- upvalues: withFoundationOrUIBloxStyle (ref), withLocalizationModule (ref), roact (ref), button (ref), buttonType (ref), assetsModule (ref), showContextMenuWhenButtonsArePresent (ref), VRService (ref), useVRSpecificLeaveButton (ref), t_2 (ref), IGMMainPageControllerBarModule (ref), voiceIndicatorModule (ref), playersService (ref), default (ref), zonePortalModule (ref), directionModule (ref), gameIconHeaderModule (ref), pageNavigationModule (ref), constantsModule (ref), contextualMenu (ref), menuDirection (ref), keyLabel (ref)
	local var1 = p1.canGamepadCaptureFocus(p1.props)
	
	return withFoundationOrUIBloxStyle(function(p2)
		return {
			Theme = {
				BackgroundDefault = {
					Color = p2.Color.Surface.Surface_0.Color3,
					Transparency = p2.Color.Surface.Surface_0.Transparency
				}
			}
		}
	end, function(p2)
		-- upvalues: withLocalizationModule (copy), roact (copy), button (copy), buttonType (copy), p1 (ref), assetsModule (copy), showContextMenuWhenButtonsArePresent (copy), VRService (copy), useVRSpecificLeaveButton (copy), t_2 (copy), IGMMainPageControllerBarModule (copy), var1 (ref), voiceIndicatorModule (copy), playersService (copy), default (copy), zonePortalModule (copy), directionModule (copy), gameIconHeaderModule (copy), pageNavigationModule (copy), constantsModule (copy), contextualMenu (copy), menuDirection (copy), keyLabel (copy)
		return withLocalizationModule({
			leaveGame = "CoreScripts.InGameMenu.LeaveGame",
			respawnCharacter = "CoreScripts.InGameMenu.RespawnCharacter",
			screenCapture = "CoreScripts.InGameMenu.Controls.Screenshot"
		})(function(p3)
			-- upvalues: roact (copy), button (copy), buttonType (copy), p1 (copy), assetsModule (copy), p2 (ref), showContextMenuWhenButtonsArePresent (copy), VRService (copy), useVRSpecificLeaveButton (copy), t_2 (copy), IGMMainPageControllerBarModule (copy), var1 (copy), voiceIndicatorModule (copy), playersService (copy), default (copy), zonePortalModule (copy), directionModule (copy), gameIconHeaderModule (copy), pageNavigationModule (copy), constantsModule (copy), contextualMenu (copy), menuDirection (copy), keyLabel (copy)
			local var2 = roact.createElement(button, {
				buttonType = buttonType.Secondary,
				size = UDim2.fromOffset(44, 44),
				onActivated = function()
					-- upvalues: p1 (copy)
					p1:setState({ modalOpen = true })
				end,
				icon = assetsModule.Images.MoreActions,
				[roact.Ref] = p1.moreMenuButtonRef
			})
			local var3 = p1:renderButtonModels(p2, p3)
			local var4 = if showContextMenuWhenButtonsArePresent then #var3 > 0 else p1.props.respawnButtonVisible
			local var5 = if VRService.VREnabled and useVRSpecificLeaveButton then Enum.KeyCode.ButtonX else t_2[p1.props.inputType]
			local var6 = if var4 then -56 else 0
			local modalOpen = p1.state.modalOpen
			local var7 = roact.createElement(IGMMainPageControllerBarModule, {
				canCaptureFocus = var1,
				isMainPageMoreMenuOpen = modalOpen
			})
			local var8 = nil
			
			if p1.props.voiceEnabled then
				var8 = roact.createElement(voiceIndicatorModule, {
					iconStyle = "MicLight",
					size = UDim2.fromOffset(44, 44),
					userId = tostring(playersService.LocalPlayer.UserId),
					onClicked = function()
						-- upvalues: default (copy)
						default:ToggleMic("VRInGameMenuMainPage")
					end
				})
				var6 -= 56
			end
			return roact.createElement("TextButton", {
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
				MainPageFocusHandler = not VRService.VREnabled and p1:renderMainPageFocusHandler() or nil,
				ControllerBar = var7,
				ZonePortal = roact.createElement(zonePortalModule, { targetZone = 0, direction = directionModule.Left }),
				GameIconHeader = roact.createElement(gameIconHeaderModule),
				PageNavigation = roact.createElement(pageNavigationModule, {
					Position = UDim2.new(0, constantsModule.Zone.ContentOffset, 0, 148),
					mainPageFirstButtonRef = p1.mainPageFirstButtonRef
				}),
				ContextualMenu = roact.createElement(contextualMenu, {
					closeBackgroundVisible = true,
					buttonProps = var3,
					setFrameRef = p1.setMoreMenuRef,
					setFirstItemRef = p1.setMoreMenuFirstItemRef,
					open = modalOpen,
					menuDirection = menuDirection.Up,
					openPositionY = UDim.new(1, -84),
					screenSize = p1.props.screenSize,
					onDismiss = function()
						-- upvalues: p1 (copy)
						p1:setState({ modalOpen = false })
					end
				}),
				BottomButtons = roact.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 84),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1)
				}, {
					Layout = roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						Padding = UDim.new(0, 12),
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Top
					}),
					Padding = roact.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 24),
						PaddingBottom = UDim.new(0, 24),
						PaddingLeft = UDim.new(0, 24),
						PaddingRight = UDim.new(0, 24)
					}),
					LeaveGame = roact.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, var6, 0, 44),
						Position = UDim2.fromScale(1, 0),
						AnchorPoint = Vector2.new(1, 0)
					}, {
						Button = roact.createElement(button, {
							buttonType = buttonType.PrimarySystem,
							size = UDim2.new(1, 0, 0, 44),
							onActivated = p1.props.startLeavingGame,
							text = p3.leaveGame
						}),
						KeyLabel = var5 and roact.createElement(keyLabel, {
							iconThemeKey = "UIDefault",
							textThemeKey = "SystemPrimaryContent",
							LayoutOrder = 2,
							ZIndex = 2,
							keyCode = var5,
							AnchorPoint = Vector2.new(1, 0.5),
							Position = UDim2.new(1, -16, 0.5, 0)
						}) or nil
					}),
					VoiceChatMuteButton = var8,
					MoreButton = var4 and var2
				})
			})
		end)
	end)
end

function mainPage.willUnmount(_)
	-- upvalues: guiService (ref)
	guiService:RemoveSelectionGroup("MainPageMoreMenu")
end

function mainPage.canGamepadCaptureFocus(p1)
	-- upvalues: constantsModule (ref)
	return p1.canCaptureFocus and p1.inputType == constantsModule.InputType.Gamepad
end

function mainPage.didUpdate(p1, p2, p3)
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), guiService (ref), VRService (ref), userInputService (ref)
	local modalOpen = p3.modalOpen
	
	if not getFFlagIGMGamepadSelectionHistoryModule() and p1.canGamepadCaptureFocus(p1.props) and not p1.state.modalOpen then
		if modalOpen then
			guiService.SelectedCoreObject = p1.moreMenuButtonRef:getValue()
		elseif not p1.canGamepadCaptureFocus(p2) then
			guiService.SelectedCoreObject = p1.mainPageFirstButtonRef:getValue()
		end
	end
	if VRService.VREnabled then
		userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
	end
end

return roactRodux.UNSTABLE_connect2(function(p1, _)
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), constantsModule (ref)
	return {
		isMainPageInForeground = nil,
		open = p1.isMenuOpen,
		respawnButtonVisible = p1.respawn.enabled,
		screenSize = p1.screenSize,
		voiceEnabled = p1.voiceState.voiceEnabled,
		canCaptureFocus = p1.menuPage == constantsModule.MainPagePageKey and (p1.isMenuOpen and (not p1.respawn.dialogOpen and p1.currentZone == 1)),
		currentZone = if getFFlagIGMGamepadSelectionHistoryModule() then p1.currentZone else nil,
		inputType = p1.displayOptions.inputType
	}
end, function(p1)
	-- upvalues: setCurrentPageModule (ref), constantsModule (ref), setRespawningModule (ref), closeMenuModule (ref)
	return {
		startLeavingGame = function()
			-- upvalues: p1 (ref), setCurrentPageModule (copy), constantsModule (copy)
			p1(setCurrentPageModule(constantsModule.LeaveGamePromptPageKey))
		end,
		startRespawning = function()
			-- upvalues: p1 (ref), setRespawningModule (copy)
			p1(setRespawningModule(true))
		end,
		closeMenu = function()
			-- upvalues: p1 (ref), closeMenuModule (copy)
			p1(closeMenuModule)
		end
	}
end)(mainPage)