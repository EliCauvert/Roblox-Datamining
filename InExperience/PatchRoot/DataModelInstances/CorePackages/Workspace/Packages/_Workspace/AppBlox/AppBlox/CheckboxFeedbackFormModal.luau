local parent = script:FindFirstAncestor("AppBlox").Parent
local centralOverlayModule = require(parent.CentralOverlay)
local cryoModule = require(parent.Cryo)
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
local checkbox = foundationModule.Checkbox
local dialog = foundationModule.Dialog
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = localizationModule.Hooks.useLocalization
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var11 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local appPage = robloxAppEnumsModule.AppPage
local useAppPolicy = universalAppPolicyModule.useAppPolicy
local urlBuilder = urlBuilderModule.UrlBuilder
local fixCheckboxFeedbackFormModalTermsOfUseWebView = game:DefineFastFlag("FixCheckboxFeedbackFormModalTermsOfUseWebView", false)
local luaAppSupportNewDefaultDialogBehavior = game:DefineFastFlag("LuaAppSupportNewDefaultDialogBehavior", false)
local fFlagLuaAppMakeDisclaimerOptInForFeedbackForm = sharedFlagsModule.FFlagLuaAppMakeDisclaimerOptInForFeedbackForm
local fFlagLuaAppNotInterestedFeedbackFormTelemetry = sharedFlagsModule.FFlagLuaAppNotInterestedFeedbackFormTelemetry
local luaAppCheckboxFeedbackFormTitleTextWrapping = game:DefineFastFlag("LuaAppCheckboxFeedbackFormTitleTextWrapping", false)

return reactModule.memo(function(p0) --[[ line: 60 | named "CheckboxFeedbackFormModal" ]]
	-- upvalues: useDispatch (ref), useTokens (ref), useLocalization (ref), reactModule (ref), closeCentralOverlay (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (ref), cryoModule (ref), checkbox (ref), fixCheckboxFeedbackFormModalTermsOfUseWebView (ref), useAppPolicy (ref), appPage (ref), urlBuilder (ref), fFlagSignalsNavP3Dispatch (ref), var11 (ref), navigateDown (ref), dialog (ref), luaAppSupportNewDefaultDialogBehavior (ref), text (ref), luaAppCheckboxFeedbackFormTitleTextWrapping (ref), buttonVariant (ref), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (ref)
	local var15 = useDispatch()
	local var16 = useTokens()
	local var17 = useLocalization({
		submitText = "CommonUI.Controls.Action.Submit",
		otherPlaceholderText = "Feature.GameDetails.Label.TellUsMorePlaceholder",
		termsOfUseText = {
			"Feature.GameDetails.Message.AnonymousFeedbackTermsOfUse",
			underlineStart = "<u>",
			underlineEnd = "</u>"
		}
	})
	local var18 = reactModule.useCallback(function(p1) --[[ line: 73 ]]
		-- upvalues: var15 (ref), closeCentralOverlay (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), p0 (ref)
		var15(closeCentralOverlay())
		
		if fFlagLuaAppNotInterestedFeedbackFormTelemetry and p0.onClose then
			p0.onClose(p1)
		end
	end, { var15, p0.onClose })
	local var19, var20 = reactModule.useState({})
	local var21 = reactModule.useMemo(function() --[[ line: 82 ]]
		-- upvalues: cryoModule (copy), p0 (ref), reactModule (copy), checkbox (copy), var19 (ref), var20 (ref)
		return cryoModule.List.map(p0.checkboxItems, function(p2, p3) --[[ line: 83 ]]
			-- upvalues: reactModule (copy), checkbox (copy), var19 (copy), var20 (copy)
			local id = p2.id
			
			return reactModule.createElement(checkbox, {
				label = p2.text,
				isChecked = if var19[id] then true else false,
				LayoutOrder = p3,
				onActivated = function() --[[ line: 89 ]]
					-- upvalues: var19 (copy), id (ref), var20 (copy)
					local cloned = table.clone(var19)
					
					if cloned[id] then
						cloned[id] = false
						var20(cloned)
						
						return
					end
					cloned[id] = true
					var20(cloned)
				end
			})
		end)
	end, { p0.checkboxItems, var19 })
	local var22, var23 = reactModule.useMemo(function() --[[ line: 103 ]]
		-- upvalues: p0 (ref), var19 (ref)
		local var29 = false
		local var30 = false
		
		for i, v in p0.checkboxItems do
			if var19[v.id] then
				if v.triggersOtherTextbox then
					var30 = true
				else
					var29 = true
				end
			end
		end
		return var29, var30
	end, { p0.checkboxItems, var19 })
	local var24 = reactModule.useRef("")
	local var25, var26 = reactModule.useState(false)
	local var27 = if var23 and not var25 then false elseif var22 or var23 and var25 then true else false
	
	return reactModule.createElement(dialog.Root, {
		onClose = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then if fFlagLuaAppNotInterestedFeedbackFormTelemetry then reactModule.useCallback(function() --[[ line: 186 ]]
			-- upvalues: var18 (ref)
			var18(false)
		end, { var18 }) else nil else var18,
		hasBackdrop = if luaAppSupportNewDefaultDialogBehavior then true else nil
	}, {
		DialogTitle = if p0.dialogTitle then reactModule.createElement(dialog.Title, { text = p0.dialogTitle }) else nil,
		DialogText = reactModule.createElement(dialog.Text, { LayoutOrder = 2, Text = p0.dialogText }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 3 }, {
			CheckboxListWrapper = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0)
			}, cryoModule.Dictionary.union(var21, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					fontStyle = var16.Typography.TitleLarge,
					Size = UDim2.fromScale(1, 0),
					Text = p0.checkboxListTitle,
					TextWrapped = if luaAppCheckboxFeedbackFormTitleTextWrapping then true else nil,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, var16.Padding.Medium),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Top
				})
			})),
			OtherTextBoxContainer = if var23 then reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = var16.Color.Shift.Shift_200.Color3,
				BackgroundTransparency = var16.Color.Shift.Shift_200.Transparency,
				Size = UDim2.fromScale(1, 0)
			}, {
				InputBox = reactModule.createElement("TextBox", {
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					Font = var16.Typography.CaptionMedium.Font,
					LineHeight = var16.LineHeight.LineHeight_140,
					MultiLine = true,
					PlaceholderColor3 = var16.Color.Content.Muted.Color3,
					PlaceholderText = var17.otherPlaceholderText,
					Size = UDim2.new(1, 0, 0, var16.Size.Size_1000),
					Text = var24.current,
					TextColor3 = var16.Color.Content.Default.Color3,
					TextSize = var16.Typography.CaptionMedium.FontSize,
					TextTransparency = var16.Color.Content.Default.Transparency,
					TextTruncate = Enum.TextTruncate.SplitWord,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					[reactModule.Change.Text] = reactModule.useCallback(function(p4) --[[ line: 125 ]]
						-- upvalues: var24 (ref), var26 (ref)
						if not p4 then return end
						if p4.Text:len() > 500 then
							p4.Text = p4.Text:sub(1, 500)
						end
						var24.current = p4.Text
						var26(p4.Text:len() >= 10)
					end, {})
				}, {
					UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(1e999, var16.Size.Size_3000) })
				}),
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, var16.Padding.Small),
					PaddingLeft = UDim.new(0, var16.Padding.Small),
					PaddingRight = UDim.new(0, var16.Padding.Small),
					PaddingTop = UDim.new(0, var16.Padding.Small)
				}),
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var16.Radius.Medium) })
			}) else nil,
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, var16.Padding.XLarge),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 4,
			actions = {
				{
					isDisabled = not var27,
					onActivated = reactModule.useCallback(function() --[[ line: 136 ]]
						-- upvalues: var27 (ref), var18 (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), p0 (ref), var19 (ref), var24 (ref)
						if var27 then
							var18(if fFlagLuaAppNotInterestedFeedbackFormTelemetry then true else nil)
							p0.onSubmit(var19, var24.current)
							
							return
						end
					end, { var27, p0.onSubmit, var19, var18 }),
					text = var17.submitText,
					variant = buttonVariant.Standard
				}
			}
		}),
		DisclaimerText = if fFlagLuaAppMakeDisclaimerOptInForFeedbackForm and not p0.showTermsOfUseDisclaimer or fixCheckboxFeedbackFormModalTermsOfUseWebView and not (if fixCheckboxFeedbackFormModalTermsOfUseWebView then useAppPolicy(function(p5) --[[ line: 146 ]]
			return p5.getWebViewSupport()
		end) else nil) then nil else reactModule.createElement("TextButton", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Font = Enum.Font.BuilderSansMedium,
			LayoutOrder = 5,
			LineHeight = var16.LineHeight.LineHeight_140,
			RichText = true,
			Size = UDim2.fromScale(1, 0),
			Text = var17.termsOfUseText,
			TextColor3 = var16.Color.Content.Muted.Color3,
			TextSize = var16.FontSize.FontSize_300,
			TextTransparency = var16.Color.Content.Muted.Transparency,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			[reactModule.Event.Activated] = reactModule.useCallback(function() --[[ line: 152 ]]
				-- upvalues: fixCheckboxFeedbackFormModalTermsOfUseWebView (copy), appPage (copy), urlBuilder (copy), fFlagSignalsNavP3Dispatch (copy), var11 (copy), var15 (ref), navigateDown (copy), var18 (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy)
				if fixCheckboxFeedbackFormModalTermsOfUseWebView then
					local t = {
						name = appPage.GenericWebPage,
						detail = urlBuilder.static.about.terms(),
						extraProps = { title = "" }
					}
					
					if fFlagSignalsNavP3Dispatch then
						var11.down(var11.fromLegacyPage(t), nil)
					else
						var15(navigateDown(t, nil))
					end
				else
					local t = {
						name = appPage.GenericWebPage,
						detail = urlBuilder.static.about.terms()
					}
					
					if fFlagSignalsNavP3Dispatch then
						var11.down(var11.fromLegacyPage(t))
					else
						var15(navigateDown(t))
					end
				end
				var18(if fFlagLuaAppNotInterestedFeedbackFormTelemetry then false else nil)
			end, { var15, var18 })
		})
	})
end)