local coreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local parent = coreScriptsPlayerFeedback.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useScreenSize = require(parent.CoreScriptsRoactCommon).useScreenSize
local useLastInputMethod = require(parent.FocusNavigationUtils).useLastInputMethod
local guiService = game:GetService("GuiService")
local useEscapeDismissModule = require(coreScriptsPlayerFeedback.Hooks.useEscapeDismiss)
local useLocalization = require(parent.Localization).Hooks.useLocalization

return reactModule.memo(function(p1)
	-- upvalues: useScreenSize (ref), useStyle (ref), reactModule (ref), useLastInputMethod (ref), useLocalization (ref), useEscapeDismissModule (ref), guiService (ref), buttonType (ref), interactiveAlert (ref)
	local headerUnder13, hintUnder13
	local var1 = useScreenSize()
	local var2 = useStyle()
	local var3 = reactModule.useRef(nil)
	local var4 = useLastInputMethod()
	local var5, var6 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var4 (ref), var6 (ref)
		if not var5 and (var4 == "Keyboard" or var4 == "Gamepad") then
			var6(true)
		end
	end, { var5, var4 })
	local var7 = useLocalization({
		Title = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Title",
		HeaderUnder13 = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Header.Under13",
		HintUnder13 = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Hint.Under13",
		HeaderRateLimited = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Header.RateLimited",
		HintRateLimited = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Hint.RateLimited",
		HeaderDefault = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Header.Default",
		HintDefault = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Hint.Default",
		OkayButton = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.OkayButton"
	})
	local _ = var7.Title
	local _ = ""
	local _ = ""
	
	if p1.reason == "Under13" then
		headerUnder13 = var7.HeaderUnder13
		hintUnder13 = var7.HintUnder13
	elseif p1.reason == "RateLimited" then
		headerUnder13 = var7.HeaderRateLimited
		hintUnder13 = var7.HintRateLimited
	else
		headerUnder13 = var7.HeaderDefault
		hintUnder13 = var7.HintDefault
	end
	local var8 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), reactModule (copy), headerUnder13 (write), hintUnder13 (write)
		local body = var2.Font.Body
		local header2 = var2.Font.Header2 or var2.Font.Body
		local baseSize = var2.Font.BaseSize
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 10),
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left
			}),
			Header = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 1,
				Text = headerUnder13,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextColor3 = var2.Theme.TextEmphasis.Color,
				TextTransparency = var2.Theme.TextEmphasis.Transparency,
				Font = header2.Font,
				TextSize = math.floor(header2.RelativeSize * baseSize),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}),
			Hint = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 2,
				Text = hintUnder13,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextColor3 = var2.Theme.TextMuted.Color,
				TextTransparency = var2.Theme.TextMuted.Transparency,
				Font = body.Font,
				TextSize = math.floor(body.RelativeSize * baseSize),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			})
		})
	end, { var2, headerUnder13, hintUnder13 })
	local var9 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.closePrompt()
	end, { p1.closePrompt })
	useEscapeDismissModule("UnavailablePromptCancel", var9)
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), var5 (ref), guiService (copy)
		var3.current = p2
		
		if var5 and p2 then
			pcall(function()
				-- upvalues: guiService (copy), p2 (ref)
				guiService:Select(p2)
			end)
		end
	end, { var5 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var3 (ref), guiService (copy)
		if not var5 then return end
		local current = var3.current
		
		if current then
			pcall(function()
				-- upvalues: guiService (copy), current (ref)
				guiService:Select(current)
			end)
		end
	end, { var5 })
	
	return reactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = false,
		title = var7.Title,
		buttonStackInfo = reactModule.useMemo(function()
			-- upvalues: buttonType (copy), var9 (ref), var7 (ref), var10 (ref), var5 (ref)
			return {
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							isDelayedInput = false,
							enableInputDelayed = false,
							delayInputSeconds = 1,
							isDisabled = false,
							onActivated = var9,
							text = var7.OkayButton,
							buttonRef = var10
						},
						isDefaultChild = var5
					}
				}
			}
		end, { var9, var7.OkayButton, var5, var10 }),
		middleContent = var8,
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = var1,
		defaultChildRef = if var5 then var3 else nil,
		isRoactGamepadEnabled = var5,
		onCloseClicked = var9
	})
end)