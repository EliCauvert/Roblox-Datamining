local coreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local parent = coreScriptsPlayerFeedback.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local mouseIconOverrideService = require(parent.CoreScriptsCommon).MouseIconOverrideService
local constantsModule = require(coreScriptsPlayerFeedback.constants)
local useEscapeDismissModule = require(coreScriptsPlayerFeedback.Hooks.useEscapeDismiss)
local useScreenSize = require(parent.CoreScriptsRoactCommon).useScreenSize
local useLastInputMethod = require(parent.FocusNavigationUtils).useLastInputMethod
local guiService = game:GetService("GuiService")
local contextActionService = game:GetService("ContextActionService")
local telemetryService = game:GetService("TelemetryService")
local useLocalization = require(parent.Localization).Hooks.useLocalization
local circle21 = images["component_assets/circle_21"]

return reactModule.memo(function(p0)
	-- upvalues: useScreenSize (ref), useStyle (ref), useLastInputMethod (ref), reactModule (ref), useLocalization (ref), guiService (ref), constantsModule (ref), mouseIconOverrideService (ref), telemetryService (ref), useEscapeDismissModule (ref), contextActionService (ref), imageSetLabel (ref), circle21 (ref), buttonType (ref), interactiveAlert (ref)
	local var8 = useScreenSize()
	local var9 = useStyle()
	local var10 = useLastInputMethod()
	local var11, var12 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var10 (ref), var12 (ref)
		if not var11 and (var10 == "Keyboard" or var10 == "Gamepad") then
			var12(true)
		end
	end, { var11, var10 })
	local var13 = useLocalization({
		Title = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Title",
		Submit = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Submit",
		Submitting = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Submitting",
		Placeholder = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Placeholder",
		Intro = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Intro",
		Footer = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Footer"
	})
	local var14, var15 = reactModule.useState("")
	local var16, var17 = reactModule.useState(false)
	local var18 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var18 (ref), guiService (copy)
		if not var11 then return end
		local current = var18.current
		
		if current then
			pcall(function()
				-- upvalues: guiService (copy), current (ref)
				guiService:Select(current)
			end)
		end
	end, { var11 })
	local MIN_FEEDBACK_LENGTH = constantsModule.MIN_FEEDBACK_LENGTH
	local MAX_FEEDBACK_LENGTH = constantsModule.MAX_FEEDBACK_LENGTH
	local DELAYED_INPUT_ANIM_SEC = constantsModule.DELAYED_INPUT_ANIM_SEC
	reactModule.useEffect(function()
		-- upvalues: mouseIconOverrideService (copy)
		mouseIconOverrideService.push("PlayerFeedbackPromptOverride", Enum.OverrideMouseIconBehavior.ForceShow)
		
		return function()
			-- upvalues: mouseIconOverrideService (copy)
			mouseIconOverrideService.pop("PlayerFeedbackPromptOverride")
		end
	end, {})
	local var19 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), MIN_FEEDBACK_LENGTH (ref), MAX_FEEDBACK_LENGTH (ref), var17 (ref), telemetryService (copy), p0 (ref)
		if #var14 < MIN_FEEDBACK_LENGTH then return end
		if MAX_FEEDBACK_LENGTH < #var14 then
			return
		end
		var17(true)
		pcall(function()
			-- upvalues: telemetryService (copy)
			telemetryService:LogCounter({
				eventName = "FeedbackPrompt_Submitted",
				backends = { "RobloxTelemetryCounter" }
			}, { customFields = {} }, 1)
		end)
		pcall(function()
			-- upvalues: var14 (copy)
			local socialService = game:GetService("SocialService")
			
			if socialService.SignalFeedbackSubmissionCompleted then
				socialService:SignalFeedbackSubmissionCompleted(var14)
			end
		end)
		p0.closePrompt()
	end, { var14 })
	local var20 = reactModule.useCallback(function()
		-- upvalues: telemetryService (copy), p0 (ref)
		pcall(function()
			-- upvalues: telemetryService (copy)
			telemetryService:LogCounter({
				eventName = "FeedbackPrompt_Cancelled",
				backends = { "RobloxTelemetryCounter" }
			}, { customFields = {} }, 1)
		end)
		pcall(function()
			local socialService = game:GetService("SocialService")
			
			if socialService.SignalFeedbackSubmissionPermissionDenied then
				socialService:SignalFeedbackSubmissionPermissionDenied()
			end
		end)
		p0.closePrompt()
	end, {})
	useEscapeDismissModule("FeedbackPromptCancel", var20)
	reactModule.useEffect(function()
		-- upvalues: contextActionService (copy), guiService (copy), var19 (ref)
		contextActionService:BindCoreActionAtPriority("FeedbackPromptDisableGameControls", function(_, _, p1)
			return if p1 and p1.KeyCode == Enum.KeyCode.Escape then Enum.ContextActionResult.Pass else Enum.ContextActionResult.Sink
		end, false, Enum.ContextActionPriority.Low.Value, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump)
		contextActionService:BindCoreAction("FeedbackPromptSubmit", function(_, p2)
			-- upvalues: guiService (copy), var19 (copy)
			if p2 ~= Enum.UserInputState.Begin then
				return Enum.ContextActionResult.Pass
			end
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if selectedCoreObject and selectedCoreObject:IsA("TextBox") then
				return Enum.ContextActionResult.Pass
			end
			var19()
			
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.ButtonA, Enum.KeyCode.Return)
		
		return function()
			-- upvalues: contextActionService (copy)
			contextActionService:UnbindCoreAction("FeedbackPromptDisableGameControls")
			contextActionService:UnbindCoreAction("FeedbackPromptSubmit")
		end
	end, { var19, var20 })
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), guiService (copy)
		local function trySelect()
			-- upvalues: var18 (copy), guiService (copy)
			local current = var18.current
			
			if current then
				pcall(function()
					-- upvalues: guiService (copy), current (ref)
					guiService:Select(current)
				end)
			end
		end
		
		task.delay(0.05, trySelect)
		task.delay(0.1, trySelect)
		task.delay(0.15, trySelect)
		task.delay(0.2, trySelect)
		task.delay(0.25, trySelect)
		local var27 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
			-- upvalues: guiService (copy), var18 (copy)
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if selectedCoreObject == nil or selectedCoreObject and not selectedCoreObject.Parent then
				local current = var18.current
				
				if current then
					pcall(function()
						-- upvalues: guiService (copy), current (ref)
						guiService:Select(current)
					end)
				end
			end
		end)
		
		return function()
			-- upvalues: var27 (ref)
			var27:Disconnect()
		end
	end, {})
	local title = var13.Title
	local var21 = if var16 then var13.Submitting else var13.Submit
	local placeholder = var13.Placeholder
	local var22 = MIN_FEEDBACK_LENGTH <= #var14 and #var14 <= MAX_FEEDBACK_LENGTH
	local var23 = reactModule.useCallback(function(p3)
		-- upvalues: var15 (ref)
		var15(p3.Text)
	end, {})
	local footer = var13.Footer
	
	return reactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = true,
		title = title,
		onCloseClicked = var20,
		buttonStackInfo = reactModule.useMemo(function()
			-- upvalues: buttonType (copy), var19 (ref), var21 (ref), p0 (ref), DELAYED_INPUT_ANIM_SEC (ref), var22 (ref), var16 (ref)
			return {
				buttons = {
					{
						buttonType = buttonType.PrimaryContextual,
						props = {
							onActivated = var19,
							text = var21,
							isDelayedInput = p0.enableInputDelayed,
							enableInputDelayed = p0.enableInputDelayed,
							delayInputSeconds = DELAYED_INPUT_ANIM_SEC,
							isDisabled = not var22,
							isLoading = var16
						}
					}
				}
			}
		end, {
			var19,
			var21,
			p0.enableInputDelayed,
			var22,
			var16
		}),
		middleContent = reactModule.useCallback(function()
			-- upvalues: var9 (ref), var8 (ref), constantsModule (copy), reactModule (copy), var13 (ref), imageSetLabel (copy), circle21 (copy), var14 (ref), placeholder (ref), var18 (ref), var23 (ref)
			local body = var9.Font.Body
			local floored = math.floor(body.RelativeSize * var9.Font.BaseSize)
			local maxValue = math.max(constantsModule.MIN_TEXTBOX_HEIGHT, math.min(constantsModule.MAX_TEXTBOX_HEIGHT, math.clamp(var8.Y - 320, constantsModule.MIN_TEXTBOX_HEIGHT, constantsModule.MAX_TEXTBOX_HEIGHT)))
			
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Selectable = false,
				Size = UDim2.new(1, 0, 0, maxValue + 16 + 24)
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 16),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left
				}),
				Intro = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = true,
					LayoutOrder = 0,
					Selectable = false,
					Text = var13.Intro,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					TextColor3 = var9.Theme.TextEmphasis.Color,
					TextTransparency = var9.Theme.TextEmphasis.Transparency,
					Font = body.Font,
					TextSize = floored,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}),
				TextBoxFrame = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Selectable = false,
					Size = UDim2.new(1, 0, 0, maxValue)
				}, {
					InputBg = reactModule.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						Selectable = false,
						Size = UDim2.new(1, 0, 1, 0),
						Image = circle21,
						ImageTransparency = var9.Theme.UIMuted.Transparency,
						ImageColor3 = var9.Theme.UIMuted.Color,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(8, 8, 9, 9)
					}, {
						Padding = reactModule.createElement("UIPadding", {
							PaddingTop = UDim.new(0, 12),
							PaddingBottom = UDim.new(0, 12),
							PaddingLeft = UDim.new(0, 12),
							PaddingRight = UDim.new(0, 12)
						}),
						TextBox = reactModule.createElement("TextBox", {
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundTransparency = 1,
							Text = var14,
							PlaceholderText = placeholder,
							TextWrapped = true,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							TextColor3 = var9.Theme.TextEmphasis.Color,
							TextTransparency = var9.Theme.TextEmphasis.Transparency,
							PlaceholderColor3 = var9.Theme.TextMuted.Color,
							Font = body.Font,
							TextSize = floored,
							ClearTextOnFocus = false,
							MultiLine = true,
							OverlayNativeInput = true,
							ref = var18,
							[reactModule.Change.Text] = var23,
							[reactModule.Tag] = "data-testid=feedbackTextBox"
						})
					})
				})
			})
		end, { var9, var14, var23 }),
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = var8,
		defaultChildRef = if var11 then var18 else nil,
		isRoactGamepadEnabled = var11,
		footerContent = reactModule.useCallback(function()
			-- upvalues: footer (ref), reactModule (copy), var9 (ref)
			local var30 = footer
			
			if type(var30) == "string" and string.find(var30, "Roblox Terms of Use", 1, true) then
				var30 = string.gsub(var30, "Roblox Terms of Use", "<u>Roblox Terms of Use</u>", 1)
			end
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Pad = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 12) }),
				Note = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					RichText = true,
					TextWrapped = true,
					LayoutOrder = 1,
					Selectable = false,
					Text = var30,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					TextSize = math.floor(var9.Font.CaptionHeader.RelativeSize * var9.Font.BaseSize),
					Font = var9.Font.CaptionHeader.Font,
					TextColor3 = var9.Theme.TextMuted.Color,
					TextTransparency = var9.Theme.TextMuted.Transparency,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				})
			})
		end, { var9, footer })
	})
end)