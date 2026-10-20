local Parent = script:FindFirstAncestor("AppBlox").Parent
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local ReactModule = require(Parent.React)
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local LuaAppTextFeedbackFormModalStandardInput = game:DefineFastFlag("LuaAppTextFeedbackFormModalStandardInput", false)
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder

return ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), CloseCentralOverlayFunction (copy), UseAppPolicyFunction (copy), AppPage (copy), UrlBuilder (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), Dialog (copy), LuaAppTextFeedbackFormModalStandardInput (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), ButtonVariant (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		submitText = "CommonUI.Controls.Action.Submit",
		defaultPlaceholderText = "Feature.GameDetails.Label.TellUsMorePlaceholder",
		termsOfUseText = {
			"Feature.GameDetails.Message.AnonymousFeedbackTermsOfUse",
			underlineStart = "<u>",
			underlineEnd = "</u>"
		}
	})
	local UseRefResult = ReactModule.useRef("")
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseDispatchResult (copy), CloseCentralOverlayFunction (upval), p1 (copy)
		UseDispatchResult(CloseCentralOverlayFunction())
		
		if p1.onClose then
			p1.onClose(p2)
		end
	end, { UseDispatchResult, p1.onClose })
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		if not p2 then return end
		if p2.Text:len() > 500 then
			p2.Text = p2.Text:sub(1, 500)
		end
		UseRefResult.current = p2.Text
		UseStateResult2(p2.Text:len() >= 10)
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), UseResult (copy), p1 (copy), UseRefResult (copy)
		if UseStateResult then
			UseResult(true)
			p1.onSubmit(UseRefResult.current)
			
			return
		end
	end, { UseStateResult, p1.onSubmit, UseResult })
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getWebViewSupport()
	end)
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: AppPage (upval), UrlBuilder (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval), UseResult (copy)
		local config = {
			name = AppPage.GenericWebPage,
			detail = UrlBuilder.static.about.terms(),
			extraProps = { title = "" }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config), nil)
		else
			UseDispatchResult(NavigateDownFunction(config, nil))
		end
		UseResult(false)
	end, { UseDispatchResult, UseResult })
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		onClose = ReactModule.useCallback(function()
			-- upvalues: UseResult (copy)
			UseResult(false)
		end, { UseResult })
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = p1.dialogTitle }),
		DialogText = if p1.dialogText then ReactModule.createElement(Dialog.Text, { LayoutOrder = 2, Text = p1.dialogText }) else nil,
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 3 }, {
			TextBoxContainer = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = if LuaAppTextFeedbackFormModalStandardInput then nil else UseTokensResult.Color.Shift.Shift_200.Color3,
				BackgroundTransparency = if LuaAppTextFeedbackFormModalStandardInput then 1 else UseTokensResult.Color.Shift.Shift_200.Transparency,
				Size = UDim2.fromScale(1, 0)
			}, {
				InputBox = ReactModule.createElement("TextBox", {
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					Font = if FoundationFontFaceMigration then nil elseif LuaAppTextFeedbackFormModalStandardInput then UseTokensResult.Typography.BodyMedium.Font else UseTokensResult.Typography.CaptionMedium.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(if LuaAppTextFeedbackFormModalStandardInput then UseTokensResult.Typography.BodyMedium.Font else UseTokensResult.Typography.CaptionMedium.Font) else nil,
					LineHeight = if LuaAppTextFeedbackFormModalStandardInput then UseTokensResult.Typography.BodyMedium.LineHeight else UseTokensResult.LineHeight.LineHeight_140,
					MultiLine = true,
					PlaceholderColor3 = UseTokensResult.Color.Content.Muted.Color3,
					PlaceholderText = p1.placeholderText or UseLocalizationResult.defaultPlaceholderText,
					Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1000),
					Text = UseRefResult.current,
					TextColor3 = if LuaAppTextFeedbackFormModalStandardInput then UseTokensResult.Color.Content.Emphasis.Color3 else UseTokensResult.Color.Content.Default.Color3,
					TextSize = if LuaAppTextFeedbackFormModalStandardInput then UseTokensResult.Typography.BodyMedium.FontSize else UseTokensResult.Typography.CaptionMedium.FontSize,
					TextTransparency = if LuaAppTextFeedbackFormModalStandardInput then UseTokensResult.Color.Content.Emphasis.Transparency else UseTokensResult.Color.Content.Default.Transparency,
					TextTruncate = Enum.TextTruncate.SplitWord,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					[ReactModule.Change.Text] = UseResult1
				}, {
					UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
						MaxSize = Vector2.new(1e999, UseTokensResult.Size.Size_3000)
					})
				}),
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, UseTokensResult.Padding.Small),
					PaddingLeft = UDim.new(0, UseTokensResult.Padding.Small),
					PaddingRight = UDim.new(0, UseTokensResult.Padding.Small),
					PaddingTop = UDim.new(0, UseTokensResult.Padding.Small)
				}),
				UICorner = ReactModule.createElement("UICorner", {
					CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
				}),
				UIStroke = if LuaAppTextFeedbackFormModalStandardInput then ReactModule.createElement("UIStroke", {
					Color = UseTokensResult.Color.Stroke.Emphasis.Color3,
					Transparency = UseTokensResult.Color.Stroke.Emphasis.Transparency,
					Thickness = UseTokensResult.Stroke.Standard,
					BorderStrokePosition = Enum.BorderStrokePosition.Inner
				}) else nil
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 4,
			actions = {
				{
					isDisabled = not UseStateResult,
					onActivated = UseResult2,
					text = UseLocalizationResult.submitText,
					variant = p1.buttonVariant or ButtonVariant.Standard
				}
			}
		}),
		DisclaimerText = if p1.showTermsOfUseDisclaimer and UseAppPolicyResult then ReactModule.createElement("TextButton", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Font = Enum.Font.BuilderSansMedium,
			LayoutOrder = 5,
			LineHeight = UseTokensResult.LineHeight.LineHeight_140,
			RichText = true,
			Size = UDim2.fromScale(1, 0),
			Text = UseLocalizationResult.termsOfUseText,
			TextColor3 = UseTokensResult.Color.Content.Muted.Color3,
			TextSize = UseTokensResult.FontSize.FontSize_300,
			TextTransparency = UseTokensResult.Color.Content.Muted.Transparency,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			[ReactModule.Event.Activated] = UseResult3
		}) else nil
	})
end)