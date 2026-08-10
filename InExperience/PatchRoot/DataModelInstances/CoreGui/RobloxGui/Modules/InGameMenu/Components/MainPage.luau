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

local function _() --[[ line: 73 | named "areCapturesAllowed" ]]
	-- upvalues: VRService (ref), takeAScreenshotOfThis (ref), corePackagesService (ref)
	return if VRService.VREnabled then false elseif takeAScreenshotOfThis then not require(corePackagesService.Workspace.Packages.CachedPolicyService):IsSubjectToChinaPolicies() else true
end

function mainPage.renderButtonModels(p0, _, p1) --[[ line: 85 ]]
	-- upvalues: VRService (ref), takeAScreenshotOfThis (ref), corePackagesService (ref), images (ref), runService (ref), coreGuiService (ref), assetsModule (ref), t_1 (ref)
	local t = {}
	local inputType = p0.props.inputType
	
	if (if VRService.VREnabled then false else not takeAScreenshotOfThis or not require(corePackagesService.Workspace.Packages.CachedPolicyService):IsSubjectToChinaPolicies()) and takeAScreenshotOfThis then
		table.insert(t, {
			icon = images["icons/controls/screenshot"],
			text = p1.screenCapture,
			onActivated = function() --[[ line: 99 ]]
				-- upvalues: p0 (ref), runService (copy), coreGuiService (copy)
				p0:setState({ modalOpen = false })
				p0.props.closeMenu()
				runService.RenderStepped:Wait()
				runService.RenderStepped:Wait()
				coreGuiService:TakeScreenshot()
			end
		})
	end
	if p0.props.respawnButtonVisible then
		table.insert(t, {
			icon = assetsModule.Images.RespawnIcon,
			text = p1.respawnCharacter,
			onActivated = function() --[[ line: 118 ]]
				-- upvalues: p0 (ref)
				p0:setState({ modalOpen = false })
				p0.props.startRespawning()
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

function mainPage.init(p2) --[[ line: 148 ]]
	-- upvalues: roact (ref)
	p2.moreMenuFrameRef = nil
	p2.moreMenuFirstItemFrameRef = nil
	p2.moreMenuButtonRef = roact.createRef()
	p2.mainPageFirstButtonRef = roact.createRef()
	
	function p2.setMoreMenuRef(p3) --[[ line: 154 ]]
		-- upvalues: p2 (ref)
		p2.moreMenuFrameRef = p3
	end
	
	function p2.setMoreMenuFirstItemRef(p4) --[[ line: 158 ]]
		-- upvalues: p2 (ref)
		p2.moreMenuFirstItemFrameRef = p4
	end
	
	p2.state = { modalOpen = false }
end

function mainPage.getDerivedStateFromProps(p5) --[[ line: 169 ]]
	return if p5.canCaptureFocus then nil else { modalOpen = false }
end

function mainPage.renderMainPageFocusHandler(p6) --[[ line: 178 ]]
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), roact (ref), focusHandlerModule (ref), contextActionService (ref), guiService (ref)
	local var31 = p6.canGamepadCaptureFocus(p6.props)
	local var32 = nil
	
	if getFFlagIGMGamepadSelectionHistoryModule() then
		var31 = p6.canGamepadCaptureFocus(p6.props) and not p6.state.modalOpen
		var32 = if p6.props.open then p6.props.currentZone == 0 else not p6.props.open
	end
	return roact.createElement(focusHandlerModule, {
		isFocused = var31,
		shouldForgetPreviousSelection = var32,
		didFocus = if getFFlagIGMGamepadSelectionHistoryModule() then function(p8) --[[ line: 193 ]]
			-- upvalues: contextActionService (copy), p6 (ref), guiService (copy)
			contextActionService:BindCoreAction("LeftStickTogglesMoreMenuAction", function(_, p9) --[[ line: 196 ]]
				-- upvalues: p6 (copy)
				if p9 == Enum.UserInputState.End then
					p6:setState({ modalOpen = true })
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonL3)
			guiService.SelectedCoreObject = p8 or p6.mainPageFirstButtonRef:getValue()
		end else function() --[[ line: 210 ]]
			-- upvalues: contextActionService (copy), p6 (ref)
			contextActionService:BindCoreAction("LeftStickTogglesMoreMenuAction", function(_, p7) --[[ line: 211 ]]
				-- upvalues: p6 (copy)
				if p7 == Enum.UserInputState.End then
					p6:setState({ modalOpen = not p6.state.modalOpen })
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonL3)
		end,
		didBlur = function() --[[ line: 222 ]]
			-- upvalues: contextActionService (copy)
			contextActionService:UnbindCoreAction("LeftStickTogglesMoreMenuAction")
		end
	})
end

function mainPage.renderMoreMenuFocusHandler(p10) --[[ line: 228 ]]
	-- upvalues: roact (ref), focusHandlerModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), contextActionService (ref), guiService (ref)
	return roact.createElement(focusHandlerModule, {
		isFocused = p10.canGamepadCaptureFocus(p10.props) and p10.state.modalOpen,
		didFocus = function() --[[ line: 235 ]]
			-- upvalues: p10 (ref), getFFlagIGMGamepadSelectionHistoryModule (copy), contextActionService (copy), guiService (copy)
			local var33 = function(_, p11) --[[ line: 236 ]]
				-- upvalues: p10 (copy)
				if p11 == Enum.UserInputState.End then
					p10:setState({ modalOpen = false })
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end
			
			if getFFlagIGMGamepadSelectionHistoryModule() then
				contextActionService:BindCoreAction("CloseMoreMenuAction", var33, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonL3)
			else
				contextActionService:BindCoreAction("CloseMoreMenuAction", var33, false, Enum.KeyCode.ButtonB)
			end
			if p10.moreMenuFrameRef ~= nil then
				guiService:RemoveSelectionGroup("MainPageMoreMenu")
			end
			guiService:AddSelectionParent("MainPageMoreMenu", p10.moreMenuFrameRef)
			guiService.SelectedCoreObject = p10.moreMenuFirstItemFrameRef
		end,
		didBlur = function() --[[ line: 271 ]]
			-- upvalues: contextActionService (copy)
			contextActionService:UnbindCoreAction("CloseMoreMenuAction")
		end
	})
end

function mainPage.render(p12) --[[ line: 277 ]]
	-- upvalues: withFoundationOrUIBloxStyle (ref), withLocalizationModule (ref), roact (ref), button (ref), buttonType (ref), assetsModule (ref), showContextMenuWhenButtonsArePresent (ref), VRService (ref), useVRSpecificLeaveButton (ref), t_2 (ref), IGMMainPageControllerBarModule (ref), voiceIndicatorModule (ref), playersService (ref), default (ref), zonePortalModule (ref), directionModule (ref), gameIconHeaderModule (ref), pageNavigationModule (ref), constantsModule (ref), contextualMenu (ref), menuDirection (ref), keyLabel (ref)
	local var34 = p12.canGamepadCaptureFocus(p12.props)
	
	return withFoundationOrUIBloxStyle(function(p13) --[[ line: 280 ]]
		return {
			Theme = {
				BackgroundDefault = {
					Color = p13.Color.Surface.Surface_0.Color3,
					Transparency = p13.Color.Surface.Surface_0.Transparency
				}
			}
		}
	end, function(p14) --[[ line: 286 ]]
		-- upvalues: withLocalizationModule (copy), roact (copy), button (copy), buttonType (copy), p12 (ref), assetsModule (copy), showContextMenuWhenButtonsArePresent (copy), VRService (copy), useVRSpecificLeaveButton (copy), t_2 (copy), IGMMainPageControllerBarModule (copy), var34 (ref), voiceIndicatorModule (copy), playersService (copy), default (copy), zonePortalModule (copy), directionModule (copy), gameIconHeaderModule (copy), pageNavigationModule (copy), constantsModule (copy), contextualMenu (copy), menuDirection (copy), keyLabel (copy)
		return withLocalizationModule({
			leaveGame = "CoreScripts.InGameMenu.LeaveGame",
			respawnCharacter = "CoreScripts.InGameMenu.RespawnCharacter",
			screenCapture = "CoreScripts.InGameMenu.Controls.Screenshot"
		})(function(p15) --[[ line: 291 ]]
			-- upvalues: roact (copy), button (copy), buttonType (copy), p12 (copy), assetsModule (copy), p14 (ref), showContextMenuWhenButtonsArePresent (copy), VRService (copy), useVRSpecificLeaveButton (copy), t_2 (copy), IGMMainPageControllerBarModule (copy), var34 (copy), voiceIndicatorModule (copy), playersService (copy), default (copy), zonePortalModule (copy), directionModule (copy), gameIconHeaderModule (copy), pageNavigationModule (copy), constantsModule (copy), contextualMenu (copy), menuDirection (copy), keyLabel (copy)
			local var35 = roact.createElement(button, {
				buttonType = buttonType.Secondary,
				size = UDim2.fromOffset(44, 44),
				onActivated = function() --[[ line: 295 ]]
					-- upvalues: p12 (copy)
					p12:setState({ modalOpen = true })
				end,
				icon = assetsModule.Images.MoreActions,
				[roact.Ref] = p12.moreMenuButtonRef
			})
			local var36 = p12:renderButtonModels(p14, p15)
			local var37 = if showContextMenuWhenButtonsArePresent then #var36 > 0 else p12.props.respawnButtonVisible
			local var38 = if VRService.VREnabled and useVRSpecificLeaveButton then Enum.KeyCode.ButtonX else t_2[p12.props.inputType]
			local var39 = if var37 then -56 else 0
			local modalOpen = p12.state.modalOpen
			local var40 = roact.createElement(IGMMainPageControllerBarModule, {
				canCaptureFocus = var34,
				isMainPageMoreMenuOpen = modalOpen
			})
			local var41 = nil
			
			if p12.props.voiceEnabled then
				var41 = roact.createElement(voiceIndicatorModule, {
					iconStyle = "MicLight",
					size = UDim2.fromOffset(44, 44),
					userId = tostring(playersService.LocalPlayer.UserId),
					onClicked = function() --[[ line: 329 ]]
						-- upvalues: default (copy)
						default:ToggleMic("VRInGameMenuMainPage")
					end
				})
				var39 -= 56
			end
			return roact.createElement("TextButton", {
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				Selectable = false,
				Size = UDim2.new(0, 400, 1, 0),
				BackgroundColor3 = p14.Theme.BackgroundDefault.Color,
				BackgroundTransparency = p14.Theme.BackgroundDefault.Transparency,
				Visible = p12.props.open
			}, {
				MoreMenuFocusHandler = p12:renderMoreMenuFocusHandler(),
				MainPageFocusHandler = not VRService.VREnabled and p12:renderMainPageFocusHandler() or nil,
				ControllerBar = var40,
				ZonePortal = roact.createElement(zonePortalModule, { targetZone = 0, direction = directionModule.Left }),
				GameIconHeader = roact.createElement(gameIconHeaderModule),
				PageNavigation = roact.createElement(pageNavigationModule, {
					Position = UDim2.new(0, constantsModule.Zone.ContentOffset, 0, 148),
					mainPageFirstButtonRef = p12.mainPageFirstButtonRef
				}),
				ContextualMenu = roact.createElement(contextualMenu, {
					closeBackgroundVisible = true,
					buttonProps = var36,
					setFrameRef = p12.setMoreMenuRef,
					setFirstItemRef = p12.setMoreMenuFirstItemRef,
					open = modalOpen,
					menuDirection = menuDirection.Up,
					openPositionY = UDim.new(1, -84),
					screenSize = p12.props.screenSize,
					onDismiss = function() --[[ line: 371 ]]
						-- upvalues: p12 (copy)
						p12:setState({ modalOpen = false })
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
						Size = UDim2.new(1, var39, 0, 44),
						Position = UDim2.fromScale(1, 0),
						AnchorPoint = Vector2.new(1, 0)
					}, {
						Button = roact.createElement(button, {
							buttonType = buttonType.PrimarySystem,
							size = UDim2.new(1, 0, 0, 44),
							onActivated = p12.props.startLeavingGame,
							text = p15.leaveGame
						}),
						KeyLabel = var38 and roact.createElement(keyLabel, {
							iconThemeKey = "UIDefault",
							textThemeKey = "SystemPrimaryContent",
							LayoutOrder = 2,
							ZIndex = 2,
							keyCode = var38,
							AnchorPoint = Vector2.new(1, 0.5),
							Position = UDim2.new(1, -16, 0.5, 0)
						}) or nil
					}),
					VoiceChatMuteButton = var41,
					MoreButton = var37 and var35
				})
			})
		end)
	end)
end

function mainPage.willUnmount(_) --[[ line: 427 ]]
	-- upvalues: guiService (ref)
	guiService:RemoveSelectionGroup("MainPageMoreMenu")
end

function mainPage.canGamepadCaptureFocus(p16) --[[ line: 431 ]]
	-- upvalues: constantsModule (ref)
	return p16.canCaptureFocus and p16.inputType == constantsModule.InputType.Gamepad
end

function mainPage.didUpdate(p17, p18, p19) --[[ line: 435 ]]
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), guiService (ref), VRService (ref), userInputService (ref)
	local modalOpen = p19.modalOpen
	
	if not getFFlagIGMGamepadSelectionHistoryModule() and p17.canGamepadCaptureFocus(p17.props) and not p17.state.modalOpen then
		if modalOpen then
			guiService.SelectedCoreObject = p17.moreMenuButtonRef:getValue()
		elseif not p17.canGamepadCaptureFocus(p18) then
			guiService.SelectedCoreObject = p17.mainPageFirstButtonRef:getValue()
		end
	end
	if VRService.VREnabled then
		userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
	end
end

return roactRodux.UNSTABLE_connect2(function(p20, _) --[[ line: 455 ]]
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), constantsModule (ref)
	return {
		isMainPageInForeground = nil,
		open = p20.isMenuOpen,
		respawnButtonVisible = p20.respawn.enabled,
		screenSize = p20.screenSize,
		voiceEnabled = p20.voiceState.voiceEnabled,
		canCaptureFocus = p20.menuPage == constantsModule.MainPagePageKey and (p20.isMenuOpen and (not p20.respawn.dialogOpen and p20.currentZone == 1)),
		currentZone = if getFFlagIGMGamepadSelectionHistoryModule() then p20.currentZone else nil,
		inputType = p20.displayOptions.inputType
	}
end, function(p21) --[[ line: 478 ]]
	-- upvalues: setCurrentPageModule (ref), constantsModule (ref), setRespawningModule (ref), closeMenuModule (ref)
	return {
		startLeavingGame = function() --[[ line: 480 ]]
			-- upvalues: p21 (ref), setCurrentPageModule (copy), constantsModule (copy)
			p21(setCurrentPageModule(constantsModule.LeaveGamePromptPageKey))
		end,
		startRespawning = function() --[[ line: 483 ]]
			-- upvalues: p21 (ref), setRespawningModule (copy)
			p21(setRespawningModule(true))
		end,
		closeMenu = function() --[[ line: 486 ]]
			-- upvalues: p21 (ref), closeMenuModule (copy)
			p21(closeMenuModule)
		end
	}
end)(mainPage)