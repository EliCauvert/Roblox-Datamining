local parent = script:FindFirstAncestor("AppBlox").Parent
local centralOverlayModule = require(parent.CentralOverlay)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local navigationRoduxModule = require(parent.NavigationRodux)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local sharedFlagsModule = require(parent.SharedFlags)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local urlBuilderModule = require(parent.UrlBuilder)
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialog = foundationModule.Dialog
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = localizationModule.Hooks.useLocalization
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local luaAppTextFeedbackFormModalStandardInput = game:DefineFastFlag("LuaAppTextFeedbackFormModalStandardInput", false)
local var11 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local appPage = robloxAppEnumsModule.AppPage
local useAppPolicy = universalAppPolicyModule.useAppPolicy
local urlBuilder = urlBuilderModule.UrlBuilder

return reactModule.memo(function(p0) --[[ line: 47 | named "TextFeedbackFormModal" ]]
	-- upvalues: useDispatch (ref), useTokens (ref), useLocalization (ref), reactModule (ref), closeCentralOverlay (ref), useAppPolicy (ref), appPage (ref), urlBuilder (ref), fFlagSignalsNavP3Dispatch (ref), var11 (ref), navigateDown (ref), dialog (ref), luaAppTextFeedbackFormModalStandardInput (ref), buttonVariant (ref)
	local var12 = useDispatch()
	local var13 = useTokens()
	local var14 = useLocalization({
		submitText = "CommonUI.Controls.Action.Submit",
		defaultPlaceholderText = "Feature.GameDetails.Label.TellUsMorePlaceholder",
		termsOfUseText = {
			"Feature.GameDetails.Message.AnonymousFeedbackTermsOfUse",
			underlineStart = "<u>",
			underlineEnd = "</u>"
		}
	})
	local var15 = reactModule.useRef("")
	local var16, var17 = reactModule.useState(false)
	local var18 = reactModule.useCallback(function(p1) --[[ line: 63 ]]
		-- upvalues: var12 (ref), closeCentralOverlay (copy), p0 (ref)
		var12(closeCentralOverlay())
		
		if p0.onClose then
			p0.onClose(p1)
		end
	end, { var12, p0.onClose })
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		onClose = reactModule.useCallback(function() --[[ line: 121 ]]
			-- upvalues: var18 (ref)
			var18(false)
		end, { var18 })
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = p0.dialogTitle }),
		DialogText = if p0.dialogText then reactModule.createElement(dialog.Text, { LayoutOrder = 2, Text = p0.dialogText }) else nil,
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 3 }, {
			TextBoxContainer = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = if luaAppTextFeedbackFormModalStandardInput then nil else var13.Color.Shift.Shift_200.Color3,
				BackgroundTransparency = if luaAppTextFeedbackFormModalStandardInput then 1 else var13.Color.Shift.Shift_200.Transparency,
				Size = UDim2.fromScale(1, 0)
			}, {
				InputBox = reactModule.createElement("TextBox", {
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					Font = if luaAppTextFeedbackFormModalStandardInput then var13.Typography.BodyMedium.Font else var13.Typography.CaptionMedium.Font,
					LineHeight = if luaAppTextFeedbackFormModalStandardInput then var13.Typography.BodyMedium.LineHeight else var13.LineHeight.LineHeight_140,
					MultiLine = true,
					PlaceholderColor3 = var13.Color.Content.Muted.Color3,
					PlaceholderText = p0.placeholderText or var14.defaultPlaceholderText,
					Size = UDim2.new(1, 0, 0, var13.Size.Size_1000),
					Text = var15.current,
					TextColor3 = if luaAppTextFeedbackFormModalStandardInput then var13.Color.Content.Emphasis.Color3 else var13.Color.Content.Default.Color3,
					TextSize = if luaAppTextFeedbackFormModalStandardInput then var13.Typography.BodyMedium.FontSize else var13.Typography.CaptionMedium.FontSize,
					TextTransparency = if luaAppTextFeedbackFormModalStandardInput then var13.Color.Content.Emphasis.Transparency else var13.Color.Content.Default.Transparency,
					TextTruncate = Enum.TextTruncate.SplitWord,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					[reactModule.Change.Text] = reactModule.useCallback(function(p2) --[[ line: 71 ]]
						-- upvalues: var15 (ref), var17 (ref)
						if not p2 then return end
						if p2.Text:len() > 500 then
							p2.Text = p2.Text:sub(1, 500)
						end
						var15.current = p2.Text
						var17(p2.Text:len() >= 10)
					end, {})
				}, {
					UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(1e999, var13.Size.Size_3000) })
				}),
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, var13.Padding.Small),
					PaddingLeft = UDim.new(0, var13.Padding.Small),
					PaddingRight = UDim.new(0, var13.Padding.Small),
					PaddingTop = UDim.new(0, var13.Padding.Small)
				}),
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var13.Radius.Medium) }),
				UIStroke = if luaAppTextFeedbackFormModalStandardInput then reactModule.createElement("UIStroke", {
					Color = var13.Color.Stroke.Emphasis.Color3,
					Transparency = var13.Color.Stroke.Emphasis.Transparency,
					Thickness = var13.Stroke.Standard,
					BorderStrokePosition = Enum.BorderStrokePosition.Inner
				}) else nil
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 4,
			actions = {
				{
					isDisabled = not var16,
					onActivated = reactModule.useCallback(function() --[[ line: 84 ]]
						-- upvalues: var16 (ref), var18 (ref), p0 (ref), var15 (ref)
						if var16 then
							var18(true)
							p0.onSubmit(var15.current)
							
							return
						end
					end, { var16, p0.onSubmit, var18 }),
					text = var14.submitText,
					variant = p0.buttonVariant or buttonVariant.Standard
				}
			}
		}),
		DisclaimerText = if p0.showTermsOfUseDisclaimer and useAppPolicy(function(p3) --[[ line: 93 ]]
			return p3.getWebViewSupport()
		end) then reactModule.createElement("TextButton", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Font = Enum.Font.BuilderSansMedium,
			LayoutOrder = 5,
			LineHeight = var13.LineHeight.LineHeight_140,
			RichText = true,
			Size = UDim2.fromScale(1, 0),
			Text = var14.termsOfUseText,
			TextColor3 = var13.Color.Content.Muted.Color3,
			TextSize = var13.FontSize.FontSize_300,
			TextTransparency = var13.Color.Content.Muted.Transparency,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			[reactModule.Event.Activated] = reactModule.useCallback(function() --[[ line: 98 ]]
				-- upvalues: appPage (copy), urlBuilder (copy), fFlagSignalsNavP3Dispatch (copy), var11 (copy), var12 (ref), navigateDown (copy), var18 (ref)
				local t = {
					name = appPage.GenericWebPage,
					detail = urlBuilder.static.about.terms(),
					extraProps = { title = "" }
				}
				
				if fFlagSignalsNavP3Dispatch then
					var11.down(var11.fromLegacyPage(t), nil)
				else
					var12(navigateDown(t, nil))
				end
				var18(false)
			end, { var12, var18 })
		}) else nil
	})
end)