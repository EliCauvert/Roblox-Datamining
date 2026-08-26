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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local appPage = robloxAppEnumsModule.AppPage
local useAppPolicy = universalAppPolicyModule.useAppPolicy
local urlBuilder = urlBuilderModule.UrlBuilder

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), useTokens (ref), useLocalization (ref), reactModule (ref), closeCentralOverlay (ref), useAppPolicy (ref), appPage (ref), urlBuilder (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), dialog (ref), luaAppTextFeedbackFormModalStandardInput (ref), buttonVariant (ref)
	local var2 = useDispatch()
	local var3 = useTokens()
	local var4 = useLocalization({
		submitText = "CommonUI.Controls.Action.Submit",
		defaultPlaceholderText = "Feature.GameDetails.Label.TellUsMorePlaceholder",
		termsOfUseText = {
			"Feature.GameDetails.Message.AnonymousFeedbackTermsOfUse",
			underlineStart = "<u>",
			underlineEnd = "</u>"
		}
	})
	local var5 = reactModule.useRef("")
	local var6, var7 = reactModule.useState(false)
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), closeCentralOverlay (copy), p1 (ref)
		var2(closeCentralOverlay())
		
		if p1.onClose then
			p1.onClose(p2)
		end
	end, { var2, p1.onClose })
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		onClose = reactModule.useCallback(function()
			-- upvalues: var8 (ref)
			var8(false)
		end, { var8 })
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = p1.dialogTitle }),
		DialogText = if p1.dialogText then reactModule.createElement(dialog.Text, { LayoutOrder = 2, Text = p1.dialogText }) else nil,
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 3 }, {
			TextBoxContainer = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = if luaAppTextFeedbackFormModalStandardInput then nil else var3.Color.Shift.Shift_200.Color3,
				BackgroundTransparency = if luaAppTextFeedbackFormModalStandardInput then 1 else var3.Color.Shift.Shift_200.Transparency,
				Size = UDim2.fromScale(1, 0)
			}, {
				InputBox = reactModule.createElement("TextBox", {
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					Font = if luaAppTextFeedbackFormModalStandardInput then var3.Typography.BodyMedium.Font else var3.Typography.CaptionMedium.Font,
					LineHeight = if luaAppTextFeedbackFormModalStandardInput then var3.Typography.BodyMedium.LineHeight else var3.LineHeight.LineHeight_140,
					MultiLine = true,
					PlaceholderColor3 = var3.Color.Content.Muted.Color3,
					PlaceholderText = p1.placeholderText or var4.defaultPlaceholderText,
					Size = UDim2.new(1, 0, 0, var3.Size.Size_1000),
					Text = var5.current,
					TextColor3 = if luaAppTextFeedbackFormModalStandardInput then var3.Color.Content.Emphasis.Color3 else var3.Color.Content.Default.Color3,
					TextSize = if luaAppTextFeedbackFormModalStandardInput then var3.Typography.BodyMedium.FontSize else var3.Typography.CaptionMedium.FontSize,
					TextTransparency = if luaAppTextFeedbackFormModalStandardInput then var3.Color.Content.Emphasis.Transparency else var3.Color.Content.Default.Transparency,
					TextTruncate = Enum.TextTruncate.SplitWord,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					[reactModule.Change.Text] = reactModule.useCallback(function(p2)
						-- upvalues: var5 (ref), var7 (ref)
						if not p2 then return end
						if p2.Text:len() > 500 then
							p2.Text = p2.Text:sub(1, 500)
						end
						var5.current = p2.Text
						var7(p2.Text:len() >= 10)
					end, {})
				}, {
					UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(1e999, var3.Size.Size_3000) })
				}),
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, var3.Padding.Small),
					PaddingLeft = UDim.new(0, var3.Padding.Small),
					PaddingRight = UDim.new(0, var3.Padding.Small),
					PaddingTop = UDim.new(0, var3.Padding.Small)
				}),
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var3.Radius.Medium) }),
				UIStroke = if luaAppTextFeedbackFormModalStandardInput then reactModule.createElement("UIStroke", {
					Color = var3.Color.Stroke.Emphasis.Color3,
					Transparency = var3.Color.Stroke.Emphasis.Transparency,
					Thickness = var3.Stroke.Standard,
					BorderStrokePosition = Enum.BorderStrokePosition.Inner
				}) else nil
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 4,
			actions = {
				{
					isDisabled = not var6,
					onActivated = reactModule.useCallback(function()
						-- upvalues: var6 (ref), var8 (ref), p1 (ref), var5 (ref)
						if var6 then
							var8(true)
							p1.onSubmit(var5.current)
							
							return
						end
					end, { var6, p1.onSubmit, var8 }),
					text = var4.submitText,
					variant = p1.buttonVariant or buttonVariant.Standard
				}
			}
		}),
		DisclaimerText = if p1.showTermsOfUseDisclaimer and useAppPolicy(function(p2)
			return p2.getWebViewSupport()
		end) then reactModule.createElement("TextButton", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Font = Enum.Font.BuilderSansMedium,
			LayoutOrder = 5,
			LineHeight = var3.LineHeight.LineHeight_140,
			RichText = true,
			Size = UDim2.fromScale(1, 0),
			Text = var4.termsOfUseText,
			TextColor3 = var3.Color.Content.Muted.Color3,
			TextSize = var3.FontSize.FontSize_300,
			TextTransparency = var3.Color.Content.Muted.Transparency,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			[reactModule.Event.Activated] = reactModule.useCallback(function()
				-- upvalues: appPage (copy), urlBuilder (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy), var8 (ref)
				local t = {
					name = appPage.GenericWebPage,
					detail = urlBuilder.static.about.terms(),
					extraProps = { title = "" }
				}
				
				if fFlagSignalsNavP3Dispatch then
					var1.down(var1.fromLegacyPage(t), nil)
				else
					var2(navigateDown(t, nil))
				end
				var8(false)
			end, { var2, var8 })
		}) else nil
	})
end)