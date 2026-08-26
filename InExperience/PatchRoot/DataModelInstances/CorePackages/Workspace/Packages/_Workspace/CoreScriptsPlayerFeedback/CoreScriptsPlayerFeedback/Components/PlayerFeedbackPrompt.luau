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

return reactModule.memo(function(p1)
	-- upvalues: useScreenSize (ref), useStyle (ref), useLastInputMethod (ref), reactModule (ref), useLocalization (ref), guiService (ref), constantsModule (ref), mouseIconOverrideService (ref), telemetryService (ref), useEscapeDismissModule (ref), contextActionService (ref), imageSetLabel (ref), circle21 (ref), buttonType (ref), interactiveAlert (ref)
	local var1 = useScreenSize()
	local var2 = useStyle()
	local var3 = useLastInputMethod()
	local var4, var5 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var3 (ref), var5 (ref)
		if not var4 and (var3 == "Keyboard" or var3 == "Gamepad") then
			var5(true)
		end
	end, { var4, var3 })
	local var6 = useLocalization({
		Title = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Title",
		Submit = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Submit",
		Submitting = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Submitting",
		Placeholder = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Placeholder",
		Intro = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Intro",
		Footer = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Footer"
	})
	local var7, var8 = reactModule.useState("")
	local var9, var10 = reactModule.useState(false)
	local var11 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var11 (ref), guiService (copy)
		if not var4 then return end
		local current = var11.current
		
		if current then
			pcall(function()
				-- upvalues: guiService (copy), current (ref)
				guiService:Select(current)
			end)
		end
	end, { var4 })
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
	local var12 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), MIN_FEEDBACK_LENGTH (ref), MAX_FEEDBACK_LENGTH (ref), var10 (ref), telemetryService (copy), p1 (ref)
		if #var7 < MIN_FEEDBACK_LENGTH then return end
		if MAX_FEEDBACK_LENGTH < #var7 then
			return
		end
		var10(true)
		pcall(function()
			-- upvalues: telemetryService (copy)
			telemetryService:LogCounter({
				eventName = "FeedbackPrompt_Submitted",
				backends = { "RobloxTelemetryCounter" }
			}, { customFields = {} }, 1)
		end)
		pcall(function()
			-- upvalues: var7 (copy)
			local socialService = game:GetService("SocialService")
			
			if socialService.SignalFeedbackSubmissionCompleted then
				socialService:SignalFeedbackSubmissionCompleted(var7)
			end
		end)
		p1.closePrompt()
	end, { var7 })
	local var13 = reactModule.useCallback(function()
		-- upvalues: telemetryService (copy), p1 (ref)
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
		p1.closePrompt()
	end, {})
	useEscapeDismissModule("FeedbackPromptCancel", var13)
	reactModule.useEffect(function()
		-- upvalues: contextActionService (copy), guiService (copy), var12 (ref)
		contextActionService:BindCoreActionAtPriority("FeedbackPromptDisableGameControls", function(_, _, p2)
			return if p2 and p2.KeyCode == Enum.KeyCode.Escape then Enum.ContextActionResult.Pass else Enum.ContextActionResult.Sink
		end, false, Enum.ContextActionPriority.Low.Value, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump)
		contextActionService:BindCoreAction("FeedbackPromptSubmit", function(_, p2)
			-- upvalues: guiService (copy), var12 (copy)
			if p2 ~= Enum.UserInputState.Begin then
				return Enum.ContextActionResult.Pass
			end
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if selectedCoreObject and selectedCoreObject:IsA("TextBox") then
				return Enum.ContextActionResult.Pass
			end
			var12()
			
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.ButtonA, Enum.KeyCode.Return)
		
		return function()
			-- upvalues: contextActionService (copy)
			contextActionService:UnbindCoreAction("FeedbackPromptDisableGameControls")
			contextActionService:UnbindCoreAction("FeedbackPromptSubmit")
		end
	end, { var12, var13 })
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), guiService (copy)
		local function trySelect()
			-- upvalues: var11 (copy), guiService (copy)
			local current = var11.current
			
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
		local var14 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
			-- upvalues: guiService (copy), var11 (copy)
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if selectedCoreObject == nil or selectedCoreObject and not selectedCoreObject.Parent then
				local current = var11.current
				
				if current then
					pcall(function()
						-- upvalues: guiService (copy), current (ref)
						guiService:Select(current)
					end)
				end
			end
		end)
		
		return function()
			-- upvalues: var14 (ref)
			var14:Disconnect()
		end
	end, {})
	local title = var6.Title
	local var14 = if var9 then var6.Submitting else var6.Submit
	local placeholder = var6.Placeholder
	local var15 = MIN_FEEDBACK_LENGTH <= #var7 and #var7 <= MAX_FEEDBACK_LENGTH
	local var16 = reactModule.useCallback(function(p2)
		-- upvalues: var8 (ref)
		var8(p2.Text)
	end, {})
	local footer = var6.Footer
	
	return reactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = true,
		title = title,
		onCloseClicked = var13,
		buttonStackInfo = reactModule.useMemo(function()
			-- upvalues: buttonType (copy), var12 (ref), var14 (ref), p1 (ref), DELAYED_INPUT_ANIM_SEC (ref), var15 (ref), var9 (ref)
			return {
				buttons = {
					{
						buttonType = buttonType.PrimaryContextual,
						props = {
							onActivated = var12,
							text = var14,
							isDelayedInput = p1.enableInputDelayed,
							enableInputDelayed = p1.enableInputDelayed,
							delayInputSeconds = DELAYED_INPUT_ANIM_SEC,
							isDisabled = not var15,
							isLoading = var9
						}
					}
				}
			}
		end, {
			var12,
			var14,
			p1.enableInputDelayed,
			var15,
			var9
		}),
		middleContent = reactModule.useCallback(function()
			-- upvalues: var2 (ref), var1 (ref), constantsModule (copy), reactModule (copy), var6 (ref), imageSetLabel (copy), circle21 (copy), var7 (ref), placeholder (ref), var11 (ref), var16 (ref)
			local body = var2.Font.Body
			local floored = math.floor(body.RelativeSize * var2.Font.BaseSize)
			local maxValue = math.max(constantsModule.MIN_TEXTBOX_HEIGHT, math.min(constantsModule.MAX_TEXTBOX_HEIGHT, math.clamp(var1.Y - 320, constantsModule.MIN_TEXTBOX_HEIGHT, constantsModule.MAX_TEXTBOX_HEIGHT)))
			
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
					Text = var6.Intro,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					TextColor3 = var2.Theme.TextEmphasis.Color,
					TextTransparency = var2.Theme.TextEmphasis.Transparency,
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
						ImageTransparency = var2.Theme.UIMuted.Transparency,
						ImageColor3 = var2.Theme.UIMuted.Color,
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
							Text = var7,
							PlaceholderText = placeholder,
							TextWrapped = true,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							TextColor3 = var2.Theme.TextEmphasis.Color,
							TextTransparency = var2.Theme.TextEmphasis.Transparency,
							PlaceholderColor3 = var2.Theme.TextMuted.Color,
							Font = body.Font,
							TextSize = floored,
							ClearTextOnFocus = false,
							MultiLine = true,
							OverlayNativeInput = true,
							ref = var11,
							[reactModule.Change.Text] = var16,
							[reactModule.Tag] = "data-testid=feedbackTextBox"
						})
					})
				})
			})
		end, { var2, var7, var16 }),
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = var1,
		defaultChildRef = if var4 then var11 else nil,
		isRoactGamepadEnabled = var4,
		footerContent = reactModule.useCallback(function()
			-- upvalues: footer (ref), reactModule (copy), var2 (ref)
			local var17 = footer
			
			if type(var17) == "string" and string.find(var17, "Roblox Terms of Use", 1, true) then
				var17 = string.gsub(var17, "Roblox Terms of Use", "<u>Roblox Terms of Use</u>", 1)
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
					Text = var17,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					TextSize = math.floor(var2.Font.CaptionHeader.RelativeSize * var2.Font.BaseSize),
					Font = var2.Font.CaptionHeader.Font,
					TextColor3 = var2.Theme.TextMuted.Color,
					TextTransparency = var2.Theme.TextMuted.Transparency,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				})
			})
		end, { var2, footer })
	})
end)