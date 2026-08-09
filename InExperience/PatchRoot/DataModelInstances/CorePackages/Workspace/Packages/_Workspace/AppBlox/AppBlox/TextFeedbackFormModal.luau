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
local var10 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local appPage = robloxAppEnumsModule.AppPage
local useAppPolicy = universalAppPolicyModule.useAppPolicy
local urlBuilder = urlBuilderModule.UrlBuilder

return reactModule.memo(function(p0) --[[ line: 45 | named "TextFeedbackFormModal" ]]
	-- upvalues: useDispatch (ref), useTokens (ref), useLocalization (ref), reactModule (ref), closeCentralOverlay (ref), useAppPolicy (ref), appPage (ref), urlBuilder (ref), fFlagSignalsNavP3Dispatch (ref), var10 (ref), navigateDown (ref), dialog (ref), buttonVariant (ref)
	local var11 = useDispatch()
	local var12 = useTokens()
	local var13 = useLocalization({
		submitText = "CommonUI.Controls.Action.Submit",
		defaultPlaceholderText = "Feature.GameDetails.Label.TellUsMorePlaceholder",
		termsOfUseText = {
			"Feature.GameDetails.Message.AnonymousFeedbackTermsOfUse",
			underlineStart = "<u>",
			underlineEnd = "</u>"
		}
	})
	local var14 = reactModule.useRef("")
	local var15, var16 = reactModule.useState(false)
	local var17 = reactModule.useCallback(function(p1) --[[ line: 61 ]]
		-- upvalues: var11 (ref), closeCentralOverlay (copy), p0 (ref)
		var11(closeCentralOverlay())
		
		if p0.onClose then
			p0.onClose(p1)
		end
	end, { var11, p0.onClose })
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		onClose = reactModule.useCallback(function() --[[ line: 119 ]]
			-- upvalues: var17 (ref)
			var17(false)
		end, { var17 })
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = p0.dialogTitle }),
		DialogText = if p0.dialogText then reactModule.createElement(dialog.Text, { LayoutOrder = 2, Text = p0.dialogText }) else nil,
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 3 }, {
			TextBoxContainer = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = var12.Color.Shift.Shift_200.Color3,
				BackgroundTransparency = var12.Color.Shift.Shift_200.Transparency,
				Size = UDim2.fromScale(1, 0)
			}, {
				InputBox = reactModule.createElement("TextBox", {
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					Font = var12.Typography.CaptionMedium.Font,
					LineHeight = var12.LineHeight.LineHeight_140,
					MultiLine = true,
					PlaceholderColor3 = var12.Color.Content.Muted.Color3,
					PlaceholderText = p0.placeholderText or var13.defaultPlaceholderText,
					Size = UDim2.new(1, 0, 0, var12.Size.Size_1000),
					Text = var14.current,
					TextColor3 = var12.Color.Content.Default.Color3,
					TextSize = var12.Typography.CaptionMedium.FontSize,
					TextTransparency = var12.Color.Content.Default.Transparency,
					TextTruncate = Enum.TextTruncate.SplitWord,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					[reactModule.Change.Text] = reactModule.useCallback(function(p2) --[[ line: 69 ]]
						-- upvalues: var14 (ref), var16 (ref)
						if not p2 then return end
						if p2.Text:len() > 500 then
							p2.Text = p2.Text:sub(1, 500)
						end
						var14.current = p2.Text
						var16(p2.Text:len() >= 10)
					end, {})
				}, {
					UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(1e999, var12.Size.Size_3000) })
				}),
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, var12.Padding.Small),
					PaddingLeft = UDim.new(0, var12.Padding.Small),
					PaddingRight = UDim.new(0, var12.Padding.Small),
					PaddingTop = UDim.new(0, var12.Padding.Small)
				}),
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var12.Radius.Medium) })
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 4,
			actions = {
				{
					isDisabled = not var15,
					onActivated = reactModule.useCallback(function() --[[ line: 82 ]]
						-- upvalues: var15 (ref), var17 (ref), p0 (ref), var14 (ref)
						if var15 then
							var17(true)
							p0.onSubmit(var14.current)
							
							return
						end
					end, { var15, p0.onSubmit, var17 }),
					text = var13.submitText,
					variant = p0.buttonVariant or buttonVariant.Standard
				}
			}
		}),
		DisclaimerText = if p0.showTermsOfUseDisclaimer and useAppPolicy(function(p3) --[[ line: 91 ]]
			return p3.getWebViewSupport()
		end) then reactModule.createElement("TextButton", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Font = Enum.Font.BuilderSansMedium,
			LayoutOrder = 5,
			LineHeight = var12.LineHeight.LineHeight_140,
			RichText = true,
			Size = UDim2.fromScale(1, 0),
			Text = var13.termsOfUseText,
			TextColor3 = var12.Color.Content.Muted.Color3,
			TextSize = var12.FontSize.FontSize_300,
			TextTransparency = var12.Color.Content.Muted.Transparency,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			[reactModule.Event.Activated] = reactModule.useCallback(function() --[[ line: 96 ]]
				-- upvalues: appPage (copy), urlBuilder (copy), fFlagSignalsNavP3Dispatch (copy), var10 (copy), var11 (ref), navigateDown (copy), var17 (ref)
				local t = {
					name = appPage.GenericWebPage,
					detail = urlBuilder.static.about.terms(),
					extraProps = { title = "" }
				}
				
				if fFlagSignalsNavP3Dispatch then
					var10.down(var10.fromLegacyPage(t), nil)
				else
					var11(navigateDown(t, nil))
				end
				var17(false)
			end, { var11, var17 })
		}) else nil
	})
end)