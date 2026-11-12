local Parent = script:FindFirstAncestor("AppBlox").Parent
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Checkbox = FoundationModule.Checkbox
local Dialog = FoundationModule.Dialog
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local FFlagLuaAppMakeDisclaimerOptInForFeedbackForm = SharedFlagsModule.FFlagLuaAppMakeDisclaimerOptInForFeedbackForm
local FFlagLuaAppNotInterestedFeedbackFormTelemetry = SharedFlagsModule.FFlagLuaAppNotInterestedFeedbackFormTelemetry
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local LuaAppCheckboxFeedbackFormTitleTextWrapping = game:DefineFastFlag("LuaAppCheckboxFeedbackFormTitleTextWrapping", false)

return ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), CloseCentralOverlayFunction (copy), FFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), CryoModule (copy), Checkbox (copy), UseAppPolicyFunction (copy), AppPage (copy), UrlBuilder (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), Dialog (copy), Text (copy), LuaAppCheckboxFeedbackFormTitleTextWrapping (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), ButtonVariant (copy), FFlagLuaAppMakeDisclaimerOptInForFeedbackForm (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		submitText = "CommonUI.Controls.Action.Submit",
		otherPlaceholderText = "Feature.GameDetails.Label.TellUsMorePlaceholder",
		termsOfUseText = {
			"Feature.GameDetails.Message.AnonymousFeedbackTermsOfUse",
			underlineStart = "<u>",
			underlineEnd = "</u>"
		}
	})
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseDispatchResult (copy), CloseCentralOverlayFunction (upval), FFlagLuaAppNotInterestedFeedbackFormTelemetry (upval), p1 (copy)
		UseDispatchResult(CloseCentralOverlayFunction())
		
		if FFlagLuaAppNotInterestedFeedbackFormTelemetry and p1.onClose then
			p1.onClose(p2)
		end
	end, { UseDispatchResult, p1.onClose })
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), p1 (copy), ReactModule (upval), Checkbox (upval), UseStateResult (copy), UseStateResult2 (copy)
		return CryoModule.List.map(p1.checkboxItems, function(p2, LayoutOrder)
			-- upvalues: ReactModule (upval), Checkbox (upval), UseStateResult (upval), UseStateResult2 (upval)
			local Id = p2.id
			
			return ReactModule.createElement(Checkbox, {
				label = p2.text,
				isChecked = if UseStateResult[Id] then true else false,
				LayoutOrder = LayoutOrder,
				onActivated = function()
					-- upvalues: UseStateResult (upval), Id (copy), UseStateResult2 (upval)
					local Copy = table.clone(UseStateResult)
					
					if Copy[Id] then
						Copy[Id] = false
						UseStateResult2(Copy)
						
						return
					else
						Copy[Id] = true
						UseStateResult2(Copy)
					end
				end
			})
		end)
	end, { p1.checkboxItems, UseStateResult })
	local UseMemoResult1, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseStateResult (copy)
		local Flag = false
		local Flag1 = false
		
		for _, checkboxItem in p1.checkboxItems do
			if UseStateResult[checkboxItem.id] then
				if checkboxItem.triggersOtherTextbox then
					Flag1 = true
				else
					Flag = true
				end
			end
		end
		return Flag, Flag1
	end, { p1.checkboxItems, UseStateResult })
	local UseRefResult = ReactModule.useRef("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local v1: boolean = (not UseMemoResult2 or UseStateResult1) and (if UseMemoResult1 or UseMemoResult2 and UseStateResult1 then true else false)
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy)
		if not p2 then return end
		if p2.Text:len() > 500 then
			p2.Text = p2.Text:sub(1, 500)
		end
		UseRefResult.current = p2.Text
		UseStateResult2_1(p2.Text:len() >= 10)
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: v1 (copy), UseResult (copy), FFlagLuaAppNotInterestedFeedbackFormTelemetry (upval), p1 (copy), UseStateResult (copy), UseRefResult (copy)
		if v1 then
			UseResult(if FFlagLuaAppNotInterestedFeedbackFormTelemetry then true else nil)
			p1.onSubmit(UseStateResult, UseRefResult.current)
			
			return
		end
	end, { v1, p1.onSubmit, UseStateResult, UseResult })
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getWebViewSupport()
	end)
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: AppPage (upval), UrlBuilder (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval), UseResult (copy), FFlagLuaAppNotInterestedFeedbackFormTelemetry (upval)
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
		UseResult(not FFlagLuaAppNotInterestedFeedbackFormTelemetry and nil)
	end, { UseDispatchResult, UseResult })
	local UseResult4 = if FFlagLuaAppNotInterestedFeedbackFormTelemetry then ReactModule.useCallback(function()
		-- upvalues: UseResult (copy)
		UseResult(false)
	end, { UseResult }) else nil
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		onClose = if FFlagLuaAppNotInterestedFeedbackFormTelemetry then UseResult4 else UseResult
	}, {
		DialogTitle = if p1.dialogTitle then ReactModule.createElement(Dialog.Title, { text = p1.dialogTitle }) else nil,
		DialogText = ReactModule.createElement(Dialog.Text, { LayoutOrder = 2, Text = p1.dialogText }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 3 }, {
			CheckboxListWrapper = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0)
			}, CryoModule.Dictionary.union(UseMemoResult, {
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					fontStyle = UseTokensResult.Typography.TitleLarge,
					Size = UDim2.fromScale(1, 0),
					Text = p1.checkboxListTitle,
					TextWrapped = if LuaAppCheckboxFeedbackFormTitleTextWrapping then true else nil,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, UseTokensResult.Padding.Medium),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Top
				})
			})),
			OtherTextBoxContainer = if UseMemoResult2 then ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = UseTokensResult.Color.Shift.Shift_200.Color3,
				BackgroundTransparency = UseTokensResult.Color.Shift.Shift_200.Transparency,
				Size = UDim2.fromScale(1, 0)
			}, {
				InputBox = ReactModule.createElement("TextBox", {
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					Font = if FoundationFontFaceMigration then nil else UseTokensResult.Typography.CaptionMedium.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.CaptionMedium.Font) else nil,
					LineHeight = UseTokensResult.LineHeight.LineHeight_140,
					MultiLine = true,
					PlaceholderColor3 = UseTokensResult.Color.Content.Muted.Color3,
					PlaceholderText = UseLocalizationResult.otherPlaceholderText,
					Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1000),
					Text = UseRefResult.current,
					TextColor3 = UseTokensResult.Color.Content.Default.Color3,
					TextSize = UseTokensResult.Typography.CaptionMedium.FontSize,
					TextTransparency = UseTokensResult.Color.Content.Default.Transparency,
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
				})
			}) else nil,
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, UseTokensResult.Padding.XLarge),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 4,
			actions = {
				{
					isDisabled = not v1,
					onActivated = UseResult2,
					text = UseLocalizationResult.submitText,
					variant = ButtonVariant.Standard
				}
			}
		}),
		DisclaimerText = if FFlagLuaAppMakeDisclaimerOptInForFeedbackForm and not p1.showTermsOfUseDisclaimer then nil elseif UseAppPolicyResult then ReactModule.createElement("TextButton", {
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