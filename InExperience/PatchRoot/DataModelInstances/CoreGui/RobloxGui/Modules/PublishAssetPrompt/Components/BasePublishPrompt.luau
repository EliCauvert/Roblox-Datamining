local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local experienceAuthService = game:GetService("ExperienceAuthService")
local contextActionService = game:GetService("ContextActionService")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local guiService = game:GetService("GuiService")
local signalsModule = require(corePackagesService.Packages.Signals)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local withStyle = UIBloxModule.Style.withStyle
local fullPageModal = UIBloxModule.App.Dialog.Modal.FullPageModal
local overlay = UIBloxModule.App.Dialog.Overlay
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local gamepadUtils = require(corePackagesService.Workspace.Packages.InputUi).Gamepad.GamepadUtils
local mouseIconOverrideService = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local externalEventConnection = require(corePackagesService.Workspace.Packages.RoactUtils).ExternalEventConnection
local inputTypeModule = require(corePackagesService.Workspace.Packages.InputType)
local getInputGroup = require(corePackagesService.Workspace.Packages.InputType).getInputGroup
local parent = script.Parent
local labeledTextBoxModule = require(parent.Common.LabeledTextBox)
local closeOpenPromptModule = require(script.Parent.Parent.Actions.CloseOpenPrompt)
local setPromptVisibilityModule = require(script.Parent.Parent.Actions.SetPromptVisibility)
local leaveCreationAlertModule = require(script.Parent.LeaveCreationAlert)
local constantsModule = require(script.Parent.Parent.Constants)
local constantsModule_1 = require(robloxGui.Modules.TopBar.Constants)
local previewViewportModule = require(parent.Common.PreviewViewport)
local validationErrorModalModule = require(parent.ValidationErrorModal)
local publishAssetAnalytics = require(corePackagesService.Workspace.Packages.PurchasePrompt).PublishAssetAnalytics
local basePublishPrompt = roactModule.PureComponent:extend("BasePublishPrompt")
local uDim = UDim.new(1.5, 0)

local function _(p0) --[[ line: 69 | named "isGamepadInput" ]]
	-- upvalues: getInputGroup (ref), inputTypeModule (ref)
	return getInputGroup(p0) == inputTypeModule.InputTypeConstants.Gamepad
end

basePublishPrompt.validateProps = tModule.strictInterface({
	screenSize = tModule.Vector2,
	nameLabel = tModule.string,
	defaultName = tModule.string,
	promptBody = tModule.any,
	titleText = tModule.string,
	showingPreviewView = tModule.boolean,
	closePreviewView = tModule.callback,
	isMakeupPreview = tModule.optional(tModule.boolean),
	asset = tModule.optional(tModule.union(tModule.instanceOf("Model"), tModule.instanceIsA("AnimationClip"))),
	onNameUpdated = tModule.callback,
	canSubmit = tModule.callback,
	onSubmit = tModule.callback,
	enableInputDelayed = tModule.optional(tModule.boolean),
	isDelayedInput = tModule.optional(tModule.boolean),
	delayInputSeconds = tModule.optional(tModule.number),
	priceInRobux = tModule.optional(tModule.number),
	showTopScrim = tModule.optional(tModule.boolean),
	guid = tModule.any,
	scopes = tModule.any,
	errorMessage = tModule.optional(tModule.string),
	promptVisible = tModule.optional(tModule.boolean),
	closePrompt = tModule.callback,
	SetPromptVisibility = tModule.callback
})

function basePublishPrompt.init(p1) --[[ line: 108 ]]
	-- upvalues: roactModule (ref), signalsModule (ref), displayModule (ref), userInputService (ref), getInputGroup (ref), inputTypeModule (ref), publishAssetAnalytics (ref), experienceAuthService (ref)
	p1.swipeScrollingFrameRef = roactModule.createRef()
	p1.inputState = nil
	p1.inputObject = nil
	p1.connection = nil
	p1.disposeUiScaleEffect = signalsModule.createEffect(function(p2) --[[ line: 113 ]]
		-- upvalues: displayModule (copy), p1 (ref)
		p1:setState({
			UiScale = displayModule.GetDisplayStore(p2).getUIScale(p2)
		})
	end)
	
	function p1.storeInput(_, p3, p4) --[[ line: 120 ]]
		-- upvalues: p1 (ref)
		p1.inputState = p3
		p1.inputObject = p4
		
		return Enum.ContextActionResult.Sink
	end
	
	p1:setState({
		showUnsavedDataWarning = false,
		isGamepad = getInputGroup(userInputService:GetLastInputType()) == inputTypeModule.InputTypeConstants.Gamepad
	})
	
	function p1.closePrompt() --[[ line: 134 ]]
		-- upvalues: p1 (ref)
		p1.props.closePrompt()
		p1.props.SetPromptVisibility(false)
	end
	
	function p1.showUnsavedDataWarning() --[[ line: 139 ]]
		-- upvalues: p1 (ref), publishAssetAnalytics (copy)
		p1:setState({ showUnsavedDataWarning = true })
		publishAssetAnalytics.sendButtonClicked(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.X)
	end
	
	function p1.cancelClosePrompt() --[[ line: 147 ]]
		-- upvalues: p1 (ref)
		p1:setState({ showUnsavedDataWarning = false })
	end
	
	function p1.denyAndClose() --[[ line: 153 ]]
		-- upvalues: experienceAuthService (copy), p1 (ref)
		experienceAuthService:ScopeCheckUIComplete(p1.props.guid, p1.props.scopes, Enum.ScopeCheckResult.ConsentDenied, {})
		p1.closePrompt()
	end
	
	function p1.confirmAndUpload() --[[ line: 164 ]]
		-- upvalues: p1 (ref)
		if p1.props.canSubmit() then
			p1.props.onSubmit()
		end
	end
end

function basePublishPrompt.setUpGamepad(value) --[[ line: 171 ]]
	-- upvalues: userInputService (ref), contextActionService (ref), runService (ref), gamepadUtils (ref), uDim (ref)
	if userInputService.GamepadEnabled then
		contextActionService:UnbindCoreAction("ScrollPrompt")
		contextActionService:BindCoreAction("ScrollPrompt", value.storeInput, false, Enum.KeyCode.Thumbstick2)
		value.connection = runService.RenderStepped:Connect(function(p5) --[[ line: 175 ]]
			-- upvalues: value (ref), gamepadUtils (copy), uDim (copy)
			if value.inputState == Enum.UserInputState.Change and value.inputObject then
				local current = value.swipeScrollingFrameRef.current
				local var26 = current.CanvasPosition.Y + p5 * -gamepadUtils.normalizeStickByDeadzone(value.inputObject.Position).Y * 1000
				
				if var26 <= current.AbsoluteSize.Y * uDim.Scale + uDim.Offset then
					current.CanvasPosition = Vector2.new(0, var26)
				end
			end
		end)
		contextActionService:UnbindCoreAction("ClosePrompt")
		contextActionService:BindCoreAction("ClosePrompt", value.storeInput, false, Enum.KeyCode.ButtonB)
	end
end

function basePublishPrompt.cleanupGamepad(p6) --[[ line: 195 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("ClosePrompt")
	contextActionService:UnbindCoreAction("ScrollPrompt")
	
	if p6.connection then
		p6.connection:Disconnect()
	end
end

function basePublishPrompt.overrideMouseIconBehavior(p7) --[[ line: 203 ]]
	-- upvalues: mouseIconOverrideService (ref)
	mouseIconOverrideService.push("BasePublishPromptOverrideKey", if p7.state.isGamepad then Enum.OverrideMouseIconBehavior.ForceHide else Enum.OverrideMouseIconBehavior.ForceShow)
end

function basePublishPrompt.removeMouseIconBehaviorOverride(_) --[[ line: 211 ]]
	-- upvalues: mouseIconOverrideService (ref)
	mouseIconOverrideService.pop("BasePublishPromptOverrideKey")
end

function basePublishPrompt.didMount(p8) --[[ line: 215 ]]
	p8:setUpGamepad()
	p8.props.SetPromptVisibility(true)
	p8:overrideMouseIconBehavior()
end

function basePublishPrompt.didUpdate(p9, p10, p11) --[[ line: 224 ]]
	if p10.promptVisible ~= p9.props.promptVisible and p9.props.promptVisible == false then
		p9.closePrompt()
	end
	if p9.state.isGamepad ~= p11.isGamepad then
		p9:overrideMouseIconBehavior()
	end
end

function basePublishPrompt.renderMiddle(p12, p13) --[[ line: 238 ]]
	-- upvalues: withStyle (ref), roactModule (ref), constantsModule (ref), labeledTextBoxModule (ref)
	return withStyle(function(p14) --[[ line: 239 ]]
		-- upvalues: roactModule (copy), p12 (ref), constantsModule (copy), labeledTextBoxModule (copy), p13 (ref)
		local font = p14.Font
		local baseSize = font.BaseSize
		local theme = p14.Theme
		local footer = font.Footer
		
		return roactModule.createFragment({
			ScrollingFrame = roactModule.createElement("ScrollingFrame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, -50),
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollBarThickness = 0,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				Selectable = false,
				[roactModule.Ref] = p12.swipeScrollingFrameRef
			}, {
				layout = roactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical
				}),
				padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, constantsModule.PromptSidePadding),
					PaddingRight = UDim.new(0, constantsModule.PromptSidePadding)
				}),
				NameInput = roactModule.createElement(labeledTextBoxModule, {
					LayoutOrder = 1,
					topPadding = 24,
					textBoxHeight = 30,
					labelText = p12.props.nameLabel,
					defaultText = p12.props.defaultName,
					onTextUpdated = p12.props.onNameUpdated
				}),
				PromptBody = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, p12.props.promptBody)
			}),
			BottomGradient = roactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				ZIndex = 2,
				Size = UDim2.new(1, 0, 0, 5),
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, -50),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			}, {
				gradient = roactModule.createElement("UIGradient", {
					Rotation = 270,
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, theme.BackgroundUIDefault.Color),
						ColorSequenceKeypoint.new(1, theme.BackgroundUIDefault.Color)
					}),
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, theme.BackgroundUIDefault.Transparency),
						NumberSequenceKeypoint.new(0.5, theme.BackgroundUIDefault.Transparency),
						NumberSequenceKeypoint.new(1, 1)
					})
				})
			}),
			DisclaimerContainer = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 50),
				Position = UDim2.new(0, 0, 1, -50)
			}, {
				padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, constantsModule.PromptSidePadding),
					PaddingRight = UDim.new(0, constantsModule.PromptSidePadding)
				}),
				Disclaimer = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = true,
					Size = UDim2.fromScale(1, 1),
					Text = p13.disclaimer,
					Font = footer.Font,
					TextSize = baseSize * footer.RelativeSize,
					TextColor3 = theme.TextDefault.Color
				})
			})
		})
	end)
end

function basePublishPrompt.renderAlertLocalized(p15, p16) --[[ line: 330 ]]
	-- upvalues: guiService (ref), constantsModule_1 (ref), withStyle (ref), roactModule (ref), externalEventConnection (ref), userInputService (ref), getInputGroup (ref), inputTypeModule (ref), overlay (ref), fullPageModal (ref), buttonType (ref), leaveCreationAlertModule (ref), validationErrorModalModule (ref), previewViewportModule (ref)
	local guiInset, _ = guiService:GetGuiInset()
	local uDim2 = UDim2.new(0, 0, 0, -guiInset.Y)
	local uDim2_1 = UDim2.new(1, 0, 1, guiInset.Y)
	local var30 = constantsModule_1.TopBarHeight * p15.state.UiScale
	
	return withStyle(function(p17) --[[ line: 336 ]]
		-- upvalues: p15 (ref), p16 (ref), roactModule (copy), externalEventConnection (copy), userInputService (copy), getInputGroup (copy), inputTypeModule (copy), uDim2 (ref), uDim2_1 (ref), overlay (copy), var30 (ref), fullPageModal (copy), buttonType (copy), leaveCreationAlertModule (copy), validationErrorModalModule (copy), previewViewportModule (copy)
		local theme = p17.Theme
		
		return roactModule.createFragment({
			LastInputTypeConnection = roactModule.createElement(externalEventConnection, {
				event = userInputService.LastInputTypeChanged,
				callback = function(p18) --[[ line: 346 ]]
					-- upvalues: p15 (copy), getInputGroup (copy), inputTypeModule (copy)
					p15:setState({
						isGamepad = getInputGroup(p18) == inputTypeModule.InputTypeConstants.Gamepad
					})
				end
			}),
			BottomScrim = roactModule.createElement("Frame", {
				ZIndex = -1,
				BackgroundTransparency = 1,
				Position = uDim2,
				Size = uDim2_1
			}, {
				Overlay = roactModule.createElement(overlay, { showGradient = false }),
				InputSink = roactModule.createElement("TextButton", {
					BackgroundTransparency = 1,
					Text = "",
					Modal = true,
					Size = UDim2.fromScale(1, 1)
				})
			}),
			PublishPrompt = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, -var30),
				Position = UDim2.fromOffset(0, var30),
				Visible = not p15.state.showUnsavedDataWarning and (not p15.props.showingPreviewView and not p15.props.showTopScrim)
			}, {
				FullPageModal = roactModule.createElement(fullPageModal, {
					distanceFromTop = 4,
					marginSize = 0,
					title = p15.props.titleText,
					onCloseClicked = p15.showUnsavedDataWarning,
					screenSize = p15.props.screenSize,
					buttonStackProps = {
						disableRoactGamepadButtonSelection = true,
						buttons = {
							{
								buttonType = buttonType.PrimarySystem,
								props = {
									isDisabled = not p15.props.canSubmit(),
									isDelayedInput = p15.props.isDelayedInput,
									enableInputDelayed = p15.props.enableInputDelayed,
									delayInputSeconds = p15.props.delayInputSeconds,
									onActivated = p15.confirmAndUpload,
									text = if p15.props.priceInRobux and p15.props.priceInRobux > 0 then string.format("%s %i", "\238\128\130", p15.props.priceInRobux) else p16.submit,
									isLoading = not p15.props.priceInRobux
								}
							}
						}
					}
				}, { middleContent = p15:renderMiddle(p16) })
			}),
			LeaveCreationAlert = if p15.state.showUnsavedDataWarning then roactModule.createElement(leaveCreationAlertModule, {
				screenSize = p15.props.screenSize,
				closePrompt = p15.denyAndClose,
				cancelClosePrompt = p15.cancelClosePrompt
			}) else nil,
			ValidationErrorAlert = if p15.props.errorMessage then roactModule.createElement(validationErrorModalModule, {
				screenSize = p15.props.screenSize,
				closePrompt = p15.closePrompt
			}) else nil,
			PreviewFrame = p15.props.showingPreviewView and roactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = theme.BackgroundUIDefault.Color,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				BackgroundTransparency = theme.BackgroundUIDefault.Transparency
			}, {
				PreviewViewport = roactModule.createElement(previewViewportModule, {
					asset = p15.props.asset,
					closePreviewView = p15.props.closePreviewView,
					isMakeupPreview = p15.props.isMakeupPreview
				})
			}) or nil,
			TopScrim = roactModule.createElement("Frame", {
				ZIndex = 2,
				BackgroundTransparency = 1,
				Position = uDim2,
				Size = uDim2_1,
				Visible = p15.props.showTopScrim
			}, {
				InputSink = roactModule.createElement("TextButton", {
					BackgroundTransparency = 1,
					Text = "",
					Size = UDim2.fromScale(1, 1)
				})
			})
		})
	end)
end

local _ = function() --[[ line: 452 | named "GetLocalizedStrings" ]]
	-- upvalues: robloxTranslatorModule (ref)
	return {
		submit = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Submit"),
		disclaimer = robloxTranslatorModule:FormatByKey("CoreScripts.PublishCommon.Disclaimer")
	}
end

function basePublishPrompt.render(p19) --[[ line: 460 ]]
	-- upvalues: robloxTranslatorModule (ref)
	return p19:renderAlertLocalized({
		submit = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Submit"),
		disclaimer = robloxTranslatorModule:FormatByKey("CoreScripts.PublishCommon.Disclaimer")
	})
end

function basePublishPrompt.willUnmount(p20) --[[ line: 465 ]]
	p20:removeMouseIconBehaviorOverride()
	p20:cleanupGamepad()
	
	if p20.disposeUiScaleEffect then
		p20.disposeUiScaleEffect()
	end
	p20.props.SetPromptVisibility(false)
end

return roactRoduxModule.connect(function(p21) --[[ line: 478 | named "mapStateToProps" ]]
	return {
		guid = p21.promptRequest.promptInfo.guid,
		scopes = p21.promptRequest.promptInfo.scopes,
		errorMessage = p21.promptRequest.promptInfo.errorMessage,
		promptVisible = p21.promptRequest.promptInfo.promptVisible
	}
end, function(p22) --[[ line: 487 | named "mapDispatchToProps" ]]
	-- upvalues: closeOpenPromptModule (ref), setPromptVisibilityModule (ref)
	return {
		closePrompt = function() --[[ line: 489 ]]
			-- upvalues: p22 (ref), closeOpenPromptModule (copy)
			return p22(closeOpenPromptModule())
		end,
		SetPromptVisibility = function(value) --[[ line: 492 ]]
			-- upvalues: p22 (ref), setPromptVisibilityModule (copy)
			return p22(setPromptVisibilityModule(value))
		end
	}
end)(basePublishPrompt)