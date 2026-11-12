local CorePackages = game:GetService("CorePackages")
local ExperienceAuthService = game:GetService("ExperienceAuthService")
local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local SignalsModule = require(CorePackages.Packages.Signals)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local WithStyleFunction = UIBloxModule.Style.withStyle
local FullPageModal = UIBloxModule.App.Dialog.Modal.FullPageModal
local Overlay = UIBloxModule.App.Dialog.Overlay
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local GamepadUtils = require(CorePackages.Workspace.Packages.InputUi).Gamepad.GamepadUtils
local MouseIconOverrideService = require(CorePackages.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local InputTypeModule = require(CorePackages.Workspace.Packages.InputType)
local GetInputGroupFunction = require(CorePackages.Workspace.Packages.InputType).getInputGroup
local Parent = script.Parent
local LabeledTextBoxModule = require(Parent.Common.LabeledTextBox)
local CloseOpenPromptModule = require(script.Parent.Parent.Actions.CloseOpenPrompt)
local SetPromptVisibilityModule = require(script.Parent.Parent.Actions.SetPromptVisibility)
local LeaveCreationAlertModule = require(script.Parent.LeaveCreationAlert)
local ConstantsModule = require(script.Parent.Parent.Constants)
local ConstantsModule1 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.TopBar.Constants)
local PreviewViewportModule = require(Parent.Common.PreviewViewport)
local ValidationErrorModalModule = require(Parent.ValidationErrorModal)
local PublishAssetAnalytics = require(CorePackages.Workspace.Packages.PurchasePrompt).PublishAssetAnalytics
local BasePublishPrompt = RoactModule.PureComponent:extend("BasePublishPrompt")
local _UDim = UDim.new(1.5, 0)

local function _(p1): boolean
	-- upvalues: GetInputGroupFunction (copy), InputTypeModule (copy)
	return GetInputGroupFunction(p1) == InputTypeModule.InputTypeConstants.Gamepad
end

BasePublishPrompt.validateProps = TModule.strictInterface({
	screenSize = TModule.Vector2,
	nameLabel = TModule.string,
	defaultName = TModule.string,
	promptBody = TModule.any,
	titleText = TModule.string,
	showingPreviewView = TModule.boolean,
	closePreviewView = TModule.callback,
	isMakeupPreview = TModule.optional(TModule.boolean),
	asset = TModule.optional(TModule.union(TModule.instanceOf("Model"), TModule.instanceIsA("AnimationClip"))),
	onNameUpdated = TModule.callback,
	canSubmit = TModule.callback,
	onSubmit = TModule.callback,
	enableInputDelayed = TModule.optional(TModule.boolean),
	isDelayedInput = TModule.optional(TModule.boolean),
	delayInputSeconds = TModule.optional(TModule.number),
	priceInRobux = TModule.optional(TModule.number),
	showTopScrim = TModule.optional(TModule.boolean),
	guid = TModule.any,
	scopes = TModule.any,
	errorMessage = TModule.optional(TModule.string),
	promptVisible = TModule.optional(TModule.boolean),
	closePrompt = TModule.callback,
	SetPromptVisibility = TModule.callback
})

function BasePublishPrompt.init(p1)
	-- upvalues: RoactModule (copy), SignalsModule (copy), DisplayModule (copy), UserInputService (copy), GetInputGroupFunction (copy), InputTypeModule (copy), PublishAssetAnalytics (copy), ExperienceAuthService (copy)
	p1.swipeScrollingFrameRef = RoactModule.createRef()
	p1.inputState = nil
	p1.inputObject = nil
	p1.connection = nil
	p1.disposeUiScaleEffect = SignalsModule.createEffect(function(p2)
		-- upvalues: DisplayModule (upval), p1 (copy)
		p1:setState({
			UiScale = DisplayModule.GetDisplayStore(p2).getUIScale(p2)
		})
	end)
	
	function p1:storeInput(InputState, InputObject)
		-- upvalues: p1 (copy)
		p1.inputState = InputState
		p1.inputObject = InputObject
		
		return Enum.ContextActionResult.Sink
	end
	
	p1:setState({
		showUnsavedDataWarning = false,
		isGamepad = GetInputGroupFunction((UserInputService:GetLastInputType())) == InputTypeModule.InputTypeConstants.Gamepad
	})
	
	function p1.closePrompt()
		-- upvalues: p1 (copy)
		p1.props.closePrompt()
		p1.props.SetPromptVisibility(false)
	end
	
	function p1.showUnsavedDataWarning()
		-- upvalues: p1 (copy), PublishAssetAnalytics (upval)
		p1:setState({ showUnsavedDataWarning = true })
		PublishAssetAnalytics.sendButtonClicked(PublishAssetAnalytics.Section.BuyCreationPage, PublishAssetAnalytics.Element.X)
	end
	
	function p1.cancelClosePrompt()
		-- upvalues: p1 (copy)
		p1:setState({ showUnsavedDataWarning = false })
	end
	
	function p1.denyAndClose()
		-- upvalues: ExperienceAuthService (upval), p1 (copy)
		ExperienceAuthService:ScopeCheckUIComplete(p1.props.guid, p1.props.scopes, Enum.ScopeCheckResult.ConsentDenied, {})
		p1.closePrompt()
	end
	
	function p1.confirmAndUpload()
		-- upvalues: p1 (copy)
		if p1.props.canSubmit() then
			p1.props.onSubmit()
		end
	end
end

function BasePublishPrompt.setUpGamepad(p1)
	-- upvalues: UserInputService (copy), ContextActionService (copy), RunService (copy), GamepadUtils (copy), _UDim (copy)
	if UserInputService.GamepadEnabled then
		ContextActionService:UnbindCoreAction("ScrollPrompt")
		ContextActionService:BindCoreAction("ScrollPrompt", p1.storeInput, false, Enum.KeyCode.Thumbstick2)
		p1.connection = RunService.RenderStepped:Connect(function(DeltaTime)
			-- upvalues: p1 (copy), GamepadUtils (upval), _UDim (upval)
			if p1.inputState == Enum.UserInputState.Change and p1.inputObject then
				local Current = p1.swipeScrollingFrameRef.current
				local NewY = Current.CanvasPosition.Y + DeltaTime * -GamepadUtils.normalizeStickByDeadzone(p1.inputObject.Position).Y * 1000
				
				if NewY <= Current.AbsoluteSize.Y * _UDim.Scale + _UDim.Offset then
					Current.CanvasPosition = Vector2.new(0, NewY)
				end
			end
		end)
		ContextActionService:UnbindCoreAction("ClosePrompt")
		ContextActionService:BindCoreAction("ClosePrompt", p1.storeInput, false, Enum.KeyCode.ButtonB)
	end
end

function BasePublishPrompt.cleanupGamepad(p1)
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindCoreAction("ClosePrompt")
	ContextActionService:UnbindCoreAction("ScrollPrompt")
	
	if p1.connection then
		p1.connection:Disconnect()
	end
end

function BasePublishPrompt.overrideMouseIconBehavior(p1)
	-- upvalues: MouseIconOverrideService (copy)
	MouseIconOverrideService.push("BasePublishPromptOverrideKey", if p1.state.isGamepad then Enum.OverrideMouseIconBehavior.ForceHide else Enum.OverrideMouseIconBehavior.ForceShow)
end

function BasePublishPrompt:removeMouseIconBehaviorOverride()
	-- upvalues: MouseIconOverrideService (copy)
	MouseIconOverrideService.pop("BasePublishPromptOverrideKey")
end

function BasePublishPrompt.didMount(p1)
	p1:setUpGamepad()
	p1.props.SetPromptVisibility(true)
	p1:overrideMouseIconBehavior()
end

function BasePublishPrompt.didUpdate(p1, p2, p3)
	if p2.promptVisible ~= p1.props.promptVisible and p1.props.promptVisible == false then
		p1.closePrompt()
	end
	if p1.state.isGamepad ~= p3.isGamepad then
		p1:overrideMouseIconBehavior()
	end
end

function BasePublishPrompt.renderMiddle(p1, p2)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), ConstantsModule (copy), LabeledTextBoxModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	return WithStyleFunction(function(p3)
		-- upvalues: RoactModule (upval), p1 (copy), ConstantsModule (upval), LabeledTextBoxModule (upval), p2 (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
		local _Font = p3.Font
		local Theme = p3.Theme
		local Footer = _Font.Footer
		
		return RoactModule.createFragment({
			ScrollingFrame = RoactModule.createElement("ScrollingFrame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, -50),
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollBarThickness = 0,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				Selectable = false,
				[RoactModule.Ref] = p1.swipeScrollingFrameRef
			}, {
				layout = RoactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical
				}),
				padding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, ConstantsModule.PromptSidePadding),
					PaddingRight = UDim.new(0, ConstantsModule.PromptSidePadding)
				}),
				NameInput = RoactModule.createElement(LabeledTextBoxModule, {
					LayoutOrder = 1,
					topPadding = 24,
					textBoxHeight = 30,
					labelText = p1.props.nameLabel,
					defaultText = p1.props.defaultName,
					onTextUpdated = p1.props.onNameUpdated
				}),
				PromptBody = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, p1.props.promptBody)
			}),
			BottomGradient = RoactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				ZIndex = 2,
				Size = UDim2.new(1, 0, 0, 5),
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, -50),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			}, {
				gradient = RoactModule.createElement("UIGradient", {
					Rotation = 270,
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Theme.BackgroundUIDefault.Color),
						ColorSequenceKeypoint.new(1, Theme.BackgroundUIDefault.Color)
					}),
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, Theme.BackgroundUIDefault.Transparency),
						NumberSequenceKeypoint.new(0.5, Theme.BackgroundUIDefault.Transparency),
						NumberSequenceKeypoint.new(1, 1)
					})
				})
			}),
			DisclaimerContainer = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 50),
				Position = UDim2.new(0, 0, 1, -50)
			}, {
				padding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, ConstantsModule.PromptSidePadding),
					PaddingRight = UDim.new(0, ConstantsModule.PromptSidePadding)
				}),
				Disclaimer = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = true,
					Size = UDim2.fromScale(1, 1),
					Text = p2.disclaimer,
					Font = if FoundationFontFaceMigration then nil else Footer.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p3.Tokens.Typography.CaptionSmall.Font) else nil,
					TextSize = _Font.BaseSize * Footer.RelativeSize,
					TextColor3 = Theme.TextDefault.Color
				})
			})
		})
	end)
end

function BasePublishPrompt.renderAlertLocalized(p1, p2)
	-- upvalues: GuiService (copy), ConstantsModule1 (copy), WithStyleFunction (copy), RoactModule (copy), ExternalEventConnection (copy), UserInputService (copy), GetInputGroupFunction (copy), InputTypeModule (copy), Overlay (copy), FullPageModal (copy), ButtonType (copy), LeaveCreationAlertModule (copy), ValidationErrorModalModule (copy), PreviewViewportModule (copy)
	local GuiInset, _ = GuiService:GetGuiInset()
	local _UDim2 = UDim2.new(0, 0, 0, -GuiInset.Y)
	local _UDim2_1 = UDim2.new(1, 0, 1, GuiInset.Y)
	local ScaledTopBarHeight = ConstantsModule1.TopBarHeight * p1.state.UiScale
	
	return WithStyleFunction(function(p3)
		-- upvalues: p1 (copy), p2 (copy), RoactModule (upval), ExternalEventConnection (upval), UserInputService (upval), GetInputGroupFunction (upval), InputTypeModule (upval), _UDim2 (copy), _UDim2_1 (copy), Overlay (upval), ScaledTopBarHeight (copy), FullPageModal (upval), ButtonType (upval), LeaveCreationAlertModule (upval), ValidationErrorModalModule (upval), PreviewViewportModule (upval)
		local Theme = p3.Theme
		
		return RoactModule.createFragment({
			LastInputTypeConnection = RoactModule.createElement(ExternalEventConnection, {
				event = UserInputService.LastInputTypeChanged,
				callback = function(p4)
					-- upvalues: p1 (upval), GetInputGroupFunction (upval), InputTypeModule (upval)
					p1:setState({
						isGamepad = GetInputGroupFunction(p4) == InputTypeModule.InputTypeConstants.Gamepad
					})
				end
			}),
			BottomScrim = RoactModule.createElement("Frame", {
				ZIndex = -1,
				BackgroundTransparency = 1,
				Position = _UDim2,
				Size = _UDim2_1
			}, {
				Overlay = RoactModule.createElement(Overlay, { showGradient = false }),
				InputSink = RoactModule.createElement("TextButton", {
					BackgroundTransparency = 1,
					Text = "",
					Modal = true,
					Size = UDim2.fromScale(1, 1)
				})
			}),
			PublishPrompt = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, -ScaledTopBarHeight),
				Position = UDim2.fromOffset(0, ScaledTopBarHeight),
				Visible = not p1.state.showUnsavedDataWarning and (not p1.props.showingPreviewView and not p1.props.showTopScrim)
			}, {
				FullPageModal = RoactModule.createElement(FullPageModal, {
					distanceFromTop = 4,
					marginSize = 0,
					title = p1.props.titleText,
					onCloseClicked = p1.showUnsavedDataWarning,
					screenSize = p1.props.screenSize,
					buttonStackProps = {
						disableRoactGamepadButtonSelection = true,
						buttons = {
							{
								buttonType = ButtonType.PrimarySystem,
								props = {
									isDisabled = not p1.props.canSubmit(),
									isDelayedInput = p1.props.isDelayedInput,
									enableInputDelayed = p1.props.enableInputDelayed,
									delayInputSeconds = p1.props.delayInputSeconds,
									onActivated = p1.confirmAndUpload,
									text = if p1.props.priceInRobux and p1.props.priceInRobux > 0 then string.format("%s %i", "", p1.props.priceInRobux) else p2.submit,
									isLoading = not p1.props.priceInRobux
								}
							}
						}
					}
				}, { middleContent = p1:renderMiddle(p2) })
			}),
			LeaveCreationAlert = if p1.state.showUnsavedDataWarning then RoactModule.createElement(LeaveCreationAlertModule, {
				screenSize = p1.props.screenSize,
				closePrompt = p1.denyAndClose,
				cancelClosePrompt = p1.cancelClosePrompt
			}) else nil,
			ValidationErrorAlert = if p1.props.errorMessage then RoactModule.createElement(ValidationErrorModalModule, {
				screenSize = p1.props.screenSize,
				closePrompt = p1.closePrompt
			}) else nil,
			PreviewFrame = p1.props.showingPreviewView and RoactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = Theme.BackgroundUIDefault.Color,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				BackgroundTransparency = Theme.BackgroundUIDefault.Transparency
			}, {
				PreviewViewport = RoactModule.createElement(PreviewViewportModule, {
					asset = p1.props.asset,
					closePreviewView = p1.props.closePreviewView,
					isMakeupPreview = p1.props.isMakeupPreview
				})
			}) or nil,
			TopScrim = RoactModule.createElement("Frame", {
				ZIndex = 2,
				BackgroundTransparency = 1,
				Position = _UDim2,
				Size = _UDim2_1,
				Visible = p1.props.showTopScrim
			}, {
				InputSink = RoactModule.createElement("TextButton", {
					BackgroundTransparency = 1,
					Text = "",
					Size = UDim2.fromScale(1, 1)
				})
			})
		})
	end)
end

local _ = function()
	-- upvalues: RobloxTranslatorModule (copy)
	return {
		submit = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Submit"),
		disclaimer = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishCommon.Disclaimer")
	}
end

function BasePublishPrompt.render(p1)
	-- upvalues: RobloxTranslatorModule (copy)
	return p1:renderAlertLocalized({
		submit = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.Submit"),
		disclaimer = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishCommon.Disclaimer")
	})
end

function BasePublishPrompt.willUnmount(p1)
	p1:removeMouseIconBehaviorOverride()
	p1:cleanupGamepad()
	
	if p1.disposeUiScaleEffect then
		p1.disposeUiScaleEffect()
	end
	p1.props.SetPromptVisibility(false)
end

return RoactRoduxModule.connect(function(p1)
	return {
		guid = p1.promptRequest.promptInfo.guid,
		scopes = p1.promptRequest.promptInfo.scopes,
		errorMessage = p1.promptRequest.promptInfo.errorMessage,
		promptVisible = p1.promptRequest.promptInfo.promptVisible
	}
end, function(Callback)
	-- upvalues: CloseOpenPromptModule (copy), SetPromptVisibilityModule (copy)
	return {
		closePrompt = function()
			-- upvalues: Callback (copy), CloseOpenPromptModule (upval)
			return Callback(CloseOpenPromptModule())
		end,
		SetPromptVisibility = function(p1)
			-- upvalues: Callback (copy), SetPromptVisibilityModule (upval)
			return Callback(SetPromptVisibilityModule(p1))
		end
	}
end)(BasePublishPrompt)