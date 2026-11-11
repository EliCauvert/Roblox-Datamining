local CoreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local Parent = CoreScriptsPlayerFeedback.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local MouseIconOverrideService = require(Parent.CoreScriptsCommon).MouseIconOverrideService
local ConstantsModule = require(CoreScriptsPlayerFeedback.constants)
local UseEscapeDismissModule = require(CoreScriptsPlayerFeedback.Hooks.useEscapeDismiss)
local UseScreenSizeFunction = require(Parent.CoreScriptsRoactCommon).useScreenSize
local UseLastInputMethodFunction = require(Parent.FocusNavigationUtils).useLastInputMethod
local GuiService = game:GetService("GuiService")
local ContextActionService = game:GetService("ContextActionService")
local TelemetryService = game:GetService("TelemetryService")
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ComponentAssetsCircle21 = UIBloxModule.App.ImageSet.Images["component_assets/circle_21"]

return (ReactModule.memo(function(p1)
	-- upvalues: UseScreenSizeFunction (copy), UseStyleFunction (copy), UseLastInputMethodFunction (copy), ReactModule (copy), UseLocalizationFunction (copy), GuiService (copy), ConstantsModule (copy), MouseIconOverrideService (copy), TelemetryService (copy), UseEscapeDismissModule (copy), ContextActionService (copy), ImageSetLabel (copy), ComponentAssetsCircle21 (copy), ButtonType (copy), InteractiveAlert (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseStyleResult = UseStyleFunction()
	local UseLastInputMethodResult = UseLastInputMethodFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseLastInputMethodResult (copy), UseStateResult2 (copy)
		if not UseStateResult and (UseLastInputMethodResult == "Keyboard" or UseLastInputMethodResult == "Gamepad") then
			UseStateResult2(true)
		end
	end, { UseStateResult, UseLastInputMethodResult })
	local UseLocalizationResult = UseLocalizationFunction({
		Title = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Title",
		Submit = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Submit",
		Submitting = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Submitting",
		Placeholder = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Placeholder",
		Intro = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Intro",
		Footer = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Footer"
	})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseRefResult (copy), GuiService (upval)
		if not UseStateResult then return end
		local Current = UseRefResult.current
		
		if Current then
			pcall(function()
				-- upvalues: GuiService (upval), Current (copy)
				GuiService:Select(Current)
			end)
		end
	end, { UseStateResult })
	local MINFEEDBACKLENGTH = ConstantsModule.MIN_FEEDBACK_LENGTH
	local MAXFEEDBACKLENGTH = ConstantsModule.MAX_FEEDBACK_LENGTH
	local DELAYEDINPUTANIMSEC = ConstantsModule.DELAYED_INPUT_ANIM_SEC
	ReactModule.useEffect(function()
		-- upvalues: MouseIconOverrideService (upval)
		MouseIconOverrideService.push("PlayerFeedbackPromptOverride", Enum.OverrideMouseIconBehavior.ForceShow)
		
		return function()
			-- upvalues: MouseIconOverrideService (upval)
			MouseIconOverrideService.pop("PlayerFeedbackPromptOverride")
		end
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult1 (copy), MINFEEDBACKLENGTH (copy), MAXFEEDBACKLENGTH (copy), UseStateResult2_2 (copy), TelemetryService (upval), p1 (copy)
		if #UseStateResult1 < MINFEEDBACKLENGTH then return end
		if MAXFEEDBACKLENGTH >= #UseStateResult1 then
			UseStateResult2_2(true)
			pcall(function()
				-- upvalues: TelemetryService (upval)
				TelemetryService:LogCounter({
					eventName = "FeedbackPrompt_Submitted",
					backends = { "RobloxTelemetryCounter" }
				}, { customFields = {} }, 1)
			end)
			pcall(function()
				-- upvalues: UseStateResult1 (upval)
				local SocialService = game:GetService("SocialService")
				
				if SocialService.SignalFeedbackSubmissionCompleted then
					SocialService:SignalFeedbackSubmissionCompleted(UseStateResult1)
				end
			end)
			p1.closePrompt()
			
			return
		end
	end, { UseStateResult1 })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: TelemetryService (upval), p1 (copy)
		pcall(function()
			-- upvalues: TelemetryService (upval)
			TelemetryService:LogCounter({
				eventName = "FeedbackPrompt_Cancelled",
				backends = { "RobloxTelemetryCounter" }
			}, { customFields = {} }, 1)
		end)
		pcall(function()
			local SocialService = game:GetService("SocialService")
			
			if SocialService.SignalFeedbackSubmissionPermissionDenied then
				SocialService:SignalFeedbackSubmissionPermissionDenied()
			end
		end)
		p1.closePrompt()
	end, {})
	UseEscapeDismissModule("FeedbackPromptCancel", UseResult1)
	ReactModule.useEffect(function()
		-- upvalues: ContextActionService (upval), GuiService (upval), UseResult (copy)
		ContextActionService:BindCoreActionAtPriority("FeedbackPromptDisableGameControls", function(_, _, Input)
			return if Input and Input.KeyCode == Enum.KeyCode.Escape then Enum.ContextActionResult.Pass else Enum.ContextActionResult.Sink
		end, false, Enum.ContextActionPriority.Low.Value, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump)
		ContextActionService:BindCoreAction("FeedbackPromptSubmit", function(_, UserInputState)
			-- upvalues: GuiService (upval), UseResult (upval)
			if UserInputState ~= Enum.UserInputState.Begin then
				return Enum.ContextActionResult.Pass
			end
			local SelectedCoreObject = GuiService.SelectedCoreObject
			
			if SelectedCoreObject and SelectedCoreObject:IsA("TextBox") then
				return Enum.ContextActionResult.Pass
			else
				UseResult()
				
				return Enum.ContextActionResult.Sink
			end
		end, false, Enum.KeyCode.ButtonA, Enum.KeyCode.Return)
		
		return function()
			-- upvalues: ContextActionService (upval)
			ContextActionService:UnbindCoreAction("FeedbackPromptDisableGameControls")
			ContextActionService:UnbindCoreAction("FeedbackPromptSubmit")
		end
	end, { UseResult, UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), GuiService (upval)
		local function trySelect()
			-- upvalues: UseRefResult (upval), GuiService (upval)
			local Current = UseRefResult.current
			
			if Current then
				pcall(function()
					-- upvalues: GuiService (upval), Current (copy)
					GuiService:Select(Current)
				end)
			end
		end
		
		task.delay(0.05, trySelect)
		task.delay(0.1, trySelect)
		task.delay(0.15000000000000002, trySelect)
		task.delay(0.2, trySelect)
		task.delay(0.25, trySelect)
		local Connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
			-- upvalues: GuiService (upval), UseRefResult (upval)
			local SelectedCoreObject = GuiService.SelectedCoreObject
			
			if SelectedCoreObject == nil or SelectedCoreObject and not SelectedCoreObject.Parent then
				local Current = UseRefResult.current
				
				if Current then
					pcall(function()
						-- upvalues: GuiService (upval), Current (copy)
						GuiService:Select(Current)
					end)
				end
			end
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	local Submitting = UseStateResult3 and UseLocalizationResult.Submitting or UseLocalizationResult.Submit
	local Placeholder = UseLocalizationResult.Placeholder
	local IsMAXFEEDBACKLENGTHAbove: boolean = MINFEEDBACKLENGTH <= #UseStateResult1 and #UseStateResult1 <= MAXFEEDBACKLENGTH
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(p2.Text)
	end, {})
	local Footer = UseLocalizationResult.Footer
	
	return ReactModule.createElement(InteractiveAlert, {
		isMiddleContentFocusable = true,
		title = UseLocalizationResult.Title,
		onCloseClicked = UseResult1,
		buttonStackInfo = ReactModule.useMemo(function()
			-- upvalues: ButtonType (upval), UseResult (copy), Submitting (copy), p1 (copy), DELAYEDINPUTANIMSEC (copy), IsMAXFEEDBACKLENGTHAbove (copy), UseStateResult3 (copy)
			return {
				buttons = {
					{
						buttonType = ButtonType.PrimaryContextual,
						props = {
							onActivated = UseResult,
							text = Submitting,
							isDelayedInput = p1.enableInputDelayed,
							enableInputDelayed = p1.enableInputDelayed,
							delayInputSeconds = DELAYEDINPUTANIMSEC,
							isDisabled = not IsMAXFEEDBACKLENGTHAbove,
							isLoading = UseStateResult3
						}
					}
				}
			}
		end, {
			UseResult,
			Submitting,
			p1.enableInputDelayed,
			IsMAXFEEDBACKLENGTHAbove,
			UseStateResult3
		}),
		middleContent = ReactModule.useCallback(function()
			-- upvalues: UseStyleResult (copy), UseScreenSizeResult (copy), ConstantsModule (upval), ReactModule (upval), UseLocalizationResult (copy), ImageSetLabel (upval), ComponentAssetsCircle21 (upval), UseStateResult1 (copy), Placeholder (copy), UseRefResult (copy), UseResult2 (copy)
			local Body = UseStyleResult.Font.Body
			local Floored = math.floor(Body.RelativeSize * UseStyleResult.Font.BaseSize)
			local Largest = math.max(ConstantsModule.MIN_TEXTBOX_HEIGHT, (math.min(ConstantsModule.MAX_TEXTBOX_HEIGHT, (math.clamp(UseScreenSizeResult.Y - 320, ConstantsModule.MIN_TEXTBOX_HEIGHT, ConstantsModule.MAX_TEXTBOX_HEIGHT)))))
			
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Selectable = false,
				Size = UDim2.new(1, 0, 0, Largest + 16 + 24)
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 16),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left
				}),
				Intro = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = true,
					LayoutOrder = 0,
					Selectable = false,
					Text = UseLocalizationResult.Intro,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
					TextTransparency = UseStyleResult.Theme.TextEmphasis.Transparency,
					Font = Body.Font,
					TextSize = Floored,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}),
				TextBoxFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Selectable = false,
					Size = UDim2.new(1, 0, 0, Largest)
				}, {
					InputBg = ReactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						Selectable = false,
						Size = UDim2.new(1, 0, 1, 0),
						Image = ComponentAssetsCircle21,
						ImageTransparency = UseStyleResult.Theme.UIMuted.Transparency,
						ImageColor3 = UseStyleResult.Theme.UIMuted.Color,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(8, 8, 9, 9)
					}, {
						Padding = ReactModule.createElement("UIPadding", {
							PaddingTop = UDim.new(0, 12),
							PaddingBottom = UDim.new(0, 12),
							PaddingLeft = UDim.new(0, 12),
							PaddingRight = UDim.new(0, 12)
						}),
						TextBox = ReactModule.createElement("TextBox", {
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundTransparency = 1,
							Text = UseStateResult1,
							PlaceholderText = Placeholder,
							TextWrapped = true,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
							TextTransparency = UseStyleResult.Theme.TextEmphasis.Transparency,
							PlaceholderColor3 = UseStyleResult.Theme.TextMuted.Color,
							Font = Body.Font,
							TextSize = Floored,
							ClearTextOnFocus = false,
							MultiLine = true,
							OverlayNativeInput = true,
							ref = UseRefResult,
							[ReactModule.Change.Text] = UseResult2,
							[ReactModule.Tag] = "data-testid=feedbackTextBox"
						})
					})
				})
			})
		end, { UseStyleResult, UseStateResult1, UseResult2 }),
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = UseScreenSizeResult,
		defaultChildRef = if UseStateResult then UseRefResult else nil,
		isRoactGamepadEnabled = UseStateResult,
		footerContent = ReactModule.useCallback(function()
			-- upvalues: Footer (copy), ReactModule (upval), UseStyleResult (copy)
			local Text: string = Footer
			
			if type(Text) == "string" and string.find(Text, "Roblox Terms of Use", 1, true) then
				Text = string.gsub(Text, "Roblox Terms of Use", "<u>Roblox Terms of Use</u>", 1)
			end
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Pad = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 12) }),
				Note = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					RichText = true,
					TextWrapped = true,
					LayoutOrder = 1,
					Selectable = false,
					Text = Text,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					TextSize = math.floor(UseStyleResult.Font.CaptionHeader.RelativeSize * UseStyleResult.Font.BaseSize),
					Font = UseStyleResult.Font.CaptionHeader.Font,
					TextColor3 = UseStyleResult.Theme.TextMuted.Color,
					TextTransparency = UseStyleResult.Theme.TextMuted.Transparency,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				})
			})
		end, { UseStyleResult, Footer })
	})
end))