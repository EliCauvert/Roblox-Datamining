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

local function _(p1)
	-- upvalues: getInputGroup (ref), inputTypeModule (ref)
	return getInputGroup(p1) == inputTypeModule.InputTypeConstants.Gamepad
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

function basePublishPrompt.init(p1)
	-- upvalues: roactModule (ref), signalsModule (ref), displayModule (ref), userInputService (ref), getInputGroup (ref), inputTypeModule (ref), publishAssetAnalytics (ref), experienceAuthService (ref)
	p1.swipeScrollingFrameRef = roactModule.createRef()
	p1.inputState = nil
	p1.inputObject = nil
	p1.connection = nil
	p1.disposeUiScaleEffect = signalsModule.createEffect(function(p2)
		-- upvalues: displayModule (copy), p1 (ref)
		p1:setState({
			UiScale = displayModule.GetDisplayStore(p2).getUIScale(p2)
		})
	end)
	
	function p1.storeInput(_, p2, p3)
		-- upvalues: p1 (ref)
		p1.inputState = p2
		p1.inputObject = p3
		
		return Enum.ContextActionResult.Sink
	end
	
	p1:setState({
		showUnsavedDataWarning = false,
		isGamepad = getInputGroup(userInputService:GetLastInputType()) == inputTypeModule.InputTypeConstants.Gamepad
	})
	
	function p1.closePrompt()
		-- upvalues: p1 (ref)
		p1.props.closePrompt()
		p1.props.SetPromptVisibility(false)
	end
	
	function p1.showUnsavedDataWarning()
		-- upvalues: p1 (ref), publishAssetAnalytics (copy)
		p1:setState({ showUnsavedDataWarning = true })
		publishAssetAnalytics.sendButtonClicked(publishAssetAnalytics.Section.BuyCreationPage, publishAssetAnalytics.Element.X)
	end
	
	function p1.cancelClosePrompt()
		-- upvalues: p1 (ref)
		p1:setState({ showUnsavedDataWarning = false })
	end
	
	function p1.denyAndClose()
		-- upvalues: experienceAuthService (copy), p1 (ref)
		experienceAuthService:ScopeCheckUIComplete(p1.props.guid, p1.props.scopes, Enum.ScopeCheckResult.ConsentDenied, {})
		p1.closePrompt()
	end
	
	function p1.confirmAndUpload()
		-- upvalues: p1 (ref)
		if p1.props.canSubmit() then
			p1.props.onSubmit()
		end
	end
end

function basePublishPrompt.setUpGamepad(value)
	-- upvalues: userInputService (ref), contextActionService (ref), runService (ref), gamepadUtils (ref), uDim (ref)
	if userInputService.GamepadEnabled then
		contextActionService:UnbindCoreAction("ScrollPrompt")
		contextActionService:BindCoreAction("ScrollPrompt", value.storeInput, false, Enum.KeyCode.Thumbstick2)
		value.connection = runService.RenderStepped:Connect(function(p1)
			-- upvalues: value (ref), gamepadUtils (copy), uDim (copy)
			if value.inputState == Enum.UserInputState.Change and value.inputObject then
				local current = value.swipeScrollingFrameRef.current
				local var1 = current.CanvasPosition.Y + p1 * -gamepadUtils.normalizeStickByDeadzone(value.inputObject.Position).Y * 1000
				
				if var1 <= current.AbsoluteSize.Y * uDim.Scale + uDim.Offset then
					current.CanvasPosition = Vector2.new(0, var1)
				end
			end
		end)
		contextActionService:UnbindCoreAction("ClosePrompt")
		contextActionService:BindCoreAction("ClosePrompt", value.storeInput, false, Enum.KeyCode.ButtonB)
	end
end

function basePublishPrompt.cleanupGamepad(p1)
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("ClosePrompt")
	contextActionService:UnbindCoreAction("ScrollPrompt")
	
	if p1.connection then
		p1.connection:Disconnect()
	end
end

function basePublishPrompt.overrideMouseIconBehavior(p1)
	-- upvalues: mouseIconOverrideService (ref)
	mouseIconOverrideService.push("BasePublishPromptOverrideKey", if p1.state.isGamepad then Enum.OverrideMouseIconBehavior.ForceHide else Enum.OverrideMouseIconBehavior.ForceShow)
end

function basePublishPrompt.removeMouseIconBehaviorOverride(_)
	-- upvalues: mouseIconOverrideService (ref)
	mouseIconOverrideService.pop("BasePublishPromptOverrideKey")
end

function basePublishPrompt.didMount(p1)
	p1:setUpGamepad()
	p1.props.SetPromptVisibility(true)
	p1:overrideMouseIconBehavior()
end

function basePublishPrompt.didUpdate(p1, p2, p3)
	if p2.promptVisible ~= p1.props.promptVisible and p1.props.promptVisible == false then
		p1.closePrompt()
	end
	if p1.state.isGamepad ~= p3.isGamepad then
		p1:overrideMouseIconBehavior()
	end
end

function basePublishPrompt.renderMiddle(p1, p2)
	-- upvalues: withStyle (ref), roactModule (ref), constantsModule (ref), labeledTextBoxModule (ref)
	return withStyle(function(p3)
		-- upvalues: roactModule (copy), p1 (ref), constantsModule (copy), labeledTextBoxModule (copy), p2 (ref)
		local font = p3.Font
		local baseSize = font.BaseSize
		local theme = p3.Theme
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
				[roactModule.Ref] = p1.swipeScrollingFrameRef
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
					labelText = p1.props.nameLabel,
					defaultText = p1.props.defaultName,
					onTextUpdated = p1.props.onNameUpdated
				}),
				PromptBody = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, p1.props.promptBody)
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
					Text = p2.disclaimer,
					Font = footer.Font,
					TextSize = baseSize * footer.RelativeSize,
					TextColor3 = theme.TextDefault.Color
				})
			})
		})
	end)
end

function basePublishPrompt.renderAlertLocalized(p1, p2)
	-- upvalues: guiService (ref), constantsModule_1 (ref), withStyle (ref), roactModule (ref), externalEventConnection (ref), userInputService (ref), getInputGroup (ref), inputTypeModule (ref), overlay (ref), fullPageModal (ref), buttonType (ref), leaveCreationAlertModule (ref), validationErrorModalModule (ref), previewViewportModule (ref)
	local guiInset, _ = guiService:GetGuiInset()
	local uDim2 = UDim2.new(0, 0, 0, -guiInset.Y)
	local uDim2_1 = UDim2.new(1, 0, 1, guiInset.Y)
	local var1 = constantsModule_1.TopBarHeight * p1.state.UiScale
	
	return withStyle(function(p3)
		-- upvalues: p1 (ref), p2 (ref), roactModule (copy), externalEventConnection (copy), userInputService (copy), getInputGroup (copy), inputTypeModule (copy), uDim2 (ref), uDim2_1 (ref), overlay (copy), var1 (ref), fullPageModal (copy), buttonType (copy), leaveCreationAlertModule (copy), validationErrorModalModule (copy), previewViewportModule (copy)
		local theme = p3.Theme
		
		return roactModule.createFragment({
			LastInputTypeConnection = roactModule.createElement(externalEventConnection, {
				event = userInputService.LastInputTypeChanged,
				callback = function(p4)
					-- upvalues: p1 (copy), getInputGroup (copy), inputTypeModule (copy)
					p1:setState({
						isGamepad = getInputGroup(p4) == inputTypeModule.InputTypeConstants.Gamepad
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
				Size = UDim2.new(1, 0, 1, -var1),
				Position = UDim2.fromOffset(0, var1),
				Visible = not p1.state.showUnsavedDataWarning and (not p1.props.showingPreviewView and not p1.props.showTopScrim)
			}, {
				FullPageModal = roactModule.createElement(fullPageModal, {
					distanceFromTop = 4,
					marginSize = 0,
					title = p1.props.titleText,
					onCloseClicked = p1.showUnsavedDataWarning,
					screenSize = p1.props.screenSize,
					buttonStackProps = {
						disableRoactGamepadButtonSelection = true,
						buttons = {
							{
								buttonType = buttonType.PrimarySystem,
								props = {
									isDisabled = not p1.props.canSubmit(),
									isDelayedInput = p1.props.isDelayedInput,
									enableInputDelayed = p1.props.enableInputDelayed,
									delayInputSeconds = p1.props.delayInputSeconds,
									onActivated = p1.confirmAndUpload,
									text = if p1.props.priceInRobux and p1.props.priceInRobux > 0 then string.format("%s %i", "\238\128\130", p1.props.priceInRobux) else p2.submit,
									isLoading = not p1.props.priceInRobux
								}
							}
						}
					}
				}, { middleContent = p1:renderMiddle(p2) })
			}),
			LeaveCreationAlert = if p1.state.showUnsavedDataWarning then roactModule.createElement(leaveCreationAlertModule, {
				screenSize = p1.props.screenSize,
				closePrompt = p1.denyAndClose,
				cancelClosePrompt = p1.cancelClosePrompt
			}) else nil,
			ValidationErrorAlert = if p1.props.errorMessage then roactModule.createElement(validationErrorModalModule, {
				screenSize = p1.props.screenSize,
				closePrompt = p1.closePrompt
			}) else nil,
			PreviewFrame = p1.props.showingPreviewView and roactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = theme.BackgroundUIDefault.Color,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				BackgroundTransparency = theme.BackgroundUIDefault.Transparency
			}, {
				PreviewViewport = roactModule.createElement(previewViewportModule, {
					asset = p1.props.asset,
					closePreviewView = p1.props.closePreviewView,
					isMakeupPreview = p1.props.isMakeupPreview
				})
			}) or nil,
			TopScrim = roactModule.createElement("Frame", {
				ZIndex = 2,
				BackgroundTransparency = 1,
				Position = uDim2,
				Size = uDim2_1,
				Visible = p1.props.showTopScrim
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

local _ = function()
	-- upvalues: robloxTranslatorModule (ref)
	return {
		submit = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Submit"),
		disclaimer = robloxTranslatorModule:FormatByKey("CoreScripts.PublishCommon.Disclaimer")
	}
end

function basePublishPrompt.render(p1)
	-- upvalues: robloxTranslatorModule (ref)
	return p1:renderAlertLocalized({
		submit = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Submit"),
		disclaimer = robloxTranslatorModule:FormatByKey("CoreScripts.PublishCommon.Disclaimer")
	})
end

function basePublishPrompt.willUnmount(p1)
	p1:removeMouseIconBehaviorOverride()
	p1:cleanupGamepad()
	
	if p1.disposeUiScaleEffect then
		p1.disposeUiScaleEffect()
	end
	p1.props.SetPromptVisibility(false)
end

return roactRoduxModule.connect(function(p1)
	return {
		guid = p1.promptRequest.promptInfo.guid,
		scopes = p1.promptRequest.promptInfo.scopes,
		errorMessage = p1.promptRequest.promptInfo.errorMessage,
		promptVisible = p1.promptRequest.promptInfo.promptVisible
	}
end, function(p1)
	-- upvalues: closeOpenPromptModule (ref), setPromptVisibilityModule (ref)
	return {
		closePrompt = function()
			-- upvalues: p1 (ref), closeOpenPromptModule (copy)
			return p1(closeOpenPromptModule())
		end,
		SetPromptVisibility = function(value)
			-- upvalues: p1 (ref), setPromptVisibilityModule (copy)
			return p1(setPromptVisibilityModule(value))
		end
	}
end)(basePublishPrompt)