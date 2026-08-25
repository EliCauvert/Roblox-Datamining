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

return reactModule.memo(function(p0)
	-- upvalues: useScreenSize (ref), useStyle (ref), reactModule (ref), useLastInputMethod (ref), useLocalization (ref), useEscapeDismissModule (ref), guiService (ref), buttonType (ref), interactiveAlert (ref)
	local headerUnder13, hintUnder13
	local var5 = useScreenSize()
	local var6 = useStyle()
	local var7 = reactModule.useRef(nil)
	local var8 = useLastInputMethod()
	local var9, var10 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var8 (ref), var10 (ref)
		if not var9 and (var8 == "Keyboard" or var8 == "Gamepad") then
			var10(true)
		end
	end, { var9, var8 })
	local var11 = useLocalization({
		Title = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Title",
		HeaderUnder13 = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Header.Under13",
		HintUnder13 = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Hint.Under13",
		HeaderRateLimited = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Header.RateLimited",
		HintRateLimited = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Hint.RateLimited",
		HeaderDefault = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Header.Default",
		HintDefault = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.Hint.Default",
		OkayButton = "CoreScripts.FeedbackPrompt.FeedbackPrompt.Unavailable.OkayButton"
	})
	local _ = var11.Title
	local _ = ""
	local _ = ""
	
	if p0.reason == "Under13" then
		headerUnder13 = var11.HeaderUnder13
		hintUnder13 = var11.HintUnder13
	elseif p0.reason == "RateLimited" then
		headerUnder13 = var11.HeaderRateLimited
		hintUnder13 = var11.HintRateLimited
	else
		headerUnder13 = var11.HeaderDefault
		hintUnder13 = var11.HintDefault
	end
	local var12 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), reactModule (copy), headerUnder13 (write), hintUnder13 (write)
		local body = var6.Font.Body
		local header2 = var6.Font.Header2 or var6.Font.Body
		local baseSize = var6.Font.BaseSize
		
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
				TextColor3 = var6.Theme.TextEmphasis.Color,
				TextTransparency = var6.Theme.TextEmphasis.Transparency,
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
				TextColor3 = var6.Theme.TextMuted.Color,
				TextTransparency = var6.Theme.TextMuted.Transparency,
				Font = body.Font,
				TextSize = math.floor(body.RelativeSize * baseSize),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			})
		})
	end, { var6, headerUnder13, hintUnder13 })
	local var13 = reactModule.useCallback(function()
		-- upvalues: p0 (ref)
		p0.closePrompt()
	end, { p0.closePrompt })
	useEscapeDismissModule("UnavailablePromptCancel", var13)
	local var14 = reactModule.useCallback(function(p1)
		-- upvalues: var7 (ref), var9 (ref), guiService (copy)
		var7.current = p1
		
		if var9 and p1 then
			pcall(function()
				-- upvalues: guiService (copy), p1 (ref)
				guiService:Select(p1)
			end)
		end
	end, { var9 })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var7 (ref), guiService (copy)
		if not var9 then return end
		local current = var7.current
		
		if current then
			pcall(function()
				-- upvalues: guiService (copy), current (ref)
				guiService:Select(current)
			end)
		end
	end, { var9 })
	
	return reactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = false,
		title = var11.Title,
		buttonStackInfo = reactModule.useMemo(function()
			-- upvalues: buttonType (copy), var13 (ref), var11 (ref), var14 (ref), var9 (ref)
			return {
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							isDelayedInput = false,
							enableInputDelayed = false,
							delayInputSeconds = 1,
							isDisabled = false,
							onActivated = var13,
							text = var11.OkayButton,
							buttonRef = var14
						},
						isDefaultChild = var9
					}
				}
			}
		end, { var13, var11.OkayButton, var9, var14 }),
		middleContent = var12,
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = var5,
		defaultChildRef = if var9 then var7 else nil,
		isRoactGamepadEnabled = var9,
		onCloseClicked = var13
	})
end)