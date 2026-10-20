local CoreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local Parent = CoreScriptsPlayerFeedback.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseScreenSizeFunction = require(Parent.CoreScriptsRoactCommon).useScreenSize
local UseLastInputMethodFunction = require(Parent.FocusNavigationUtils).useLastInputMethod
local GuiService = game:GetService("GuiService")
local UseEscapeDismissModule = require(CoreScriptsPlayerFeedback.Hooks.useEscapeDismiss)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return (ReactModule.memo(function(p1)
	-- upvalues: UseScreenSizeFunction (copy), UseStyleFunction (copy), ReactModule (copy), UseLastInputMethodFunction (copy), UseLocalizationFunction (copy), UseEscapeDismissModule (copy), GuiService (copy), ButtonType (copy), InteractiveAlert (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseStyleResult = UseStyleFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseLastInputMethodResult = UseLastInputMethodFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseLastInputMethodResult (copy), UseStateResult2 (copy)
		if not UseStateResult and (UseLastInputMethodResult == "Keyboard" or UseLastInputMethodResult == "Gamepad") then
			UseStateResult2(true)
		end
	end, { UseStateResult, UseLastInputMethodResult })
	local UseLocalizationResult = UseLocalizationFunction({
		Title = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Title",
		HeaderUnder13 = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Header.Under13",
		HintUnder13 = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Hint.Under13",
		HeaderRateLimited = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Header.RateLimited",
		HintRateLimited = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Hint.RateLimited",
		HeaderDefault = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Header.Default",
		HintDefault = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Hint.Default",
		OkayButton = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.OkayButton"
	})
	local _ = UseLocalizationResult.Title
	local HeaderUnder13 = ""
	local HintUnder13 = ""
	
	if p1.reason == "Under13" then
		HeaderUnder13 = UseLocalizationResult.HeaderUnder13
		HintUnder13 = UseLocalizationResult.HintUnder13
	elseif p1.reason == "RateLimited" then
		HeaderUnder13 = UseLocalizationResult.HeaderRateLimited
		HintUnder13 = UseLocalizationResult.HintRateLimited
	else
		HeaderUnder13 = UseLocalizationResult.HeaderDefault
		HintUnder13 = UseLocalizationResult.HintDefault
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStyleResult (copy), ReactModule (upval), HeaderUnder13 (ref), HintUnder13 (ref)
		local Body = UseStyleResult.Font.Body
		local Header2 = UseStyleResult.Font.Header2 or UseStyleResult.Font.Body
		local BaseSize = UseStyleResult.Font.BaseSize
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 10),
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left
			}),
			Header = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 1,
				Text = HeaderUnder13,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
				TextTransparency = UseStyleResult.Theme.TextEmphasis.Transparency,
				Font = Header2.Font,
				TextSize = math.floor(Header2.RelativeSize * BaseSize),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}),
			Hint = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 2,
				Text = HintUnder13,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextColor3 = UseStyleResult.Theme.TextMuted.Color,
				TextTransparency = UseStyleResult.Theme.TextMuted.Transparency,
				Font = Body.Font,
				TextSize = math.floor(Body.RelativeSize * BaseSize),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			})
		})
	end, { UseStyleResult, HeaderUnder13, HintUnder13 })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.closePrompt()
	end, { p1.closePrompt })
	UseEscapeDismissModule("UnavailablePromptCancel", UseResult1)
	local UseResult2 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseStateResult (copy), GuiService (upval)
		UseRefResult.current = Current
		
		if UseStateResult and Current then
			pcall(function()
				-- upvalues: GuiService (upval), Current (copy)
				GuiService:Select(Current)
			end)
		end
	end, { UseStateResult })
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
	
	return ReactModule.createElement(InteractiveAlert, {
		isMiddleContentFocusable = false,
		title = UseLocalizationResult.Title,
		buttonStackInfo = ReactModule.useMemo(function()
			-- upvalues: ButtonType (upval), UseResult1 (copy), UseLocalizationResult (copy), UseResult2 (copy), UseStateResult (copy)
			return {
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							isDelayedInput = false,
							enableInputDelayed = false,
							delayInputSeconds = 1,
							isDisabled = false,
							onActivated = UseResult1,
							text = UseLocalizationResult.OkayButton,
							buttonRef = UseResult2
						},
						isDefaultChild = UseStateResult
					}
				}
			}
		end, {
			UseResult1,
			UseLocalizationResult.OkayButton,
			UseStateResult,
			UseResult2
		}),
		middleContent = UseResult,
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = UseScreenSizeResult,
		defaultChildRef = if UseStateResult then UseRefResult else nil,
		isRoactGamepadEnabled = UseStateResult,
		onCloseClicked = UseResult1
	})
end))