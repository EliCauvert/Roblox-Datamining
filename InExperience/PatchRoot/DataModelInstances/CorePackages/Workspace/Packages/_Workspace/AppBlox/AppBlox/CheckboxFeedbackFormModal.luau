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
local fFlagLuaAppMakeDisclaimerOptInForFeedbackForm = sharedFlagsModule.FFlagLuaAppMakeDisclaimerOptInForFeedbackForm
local fFlagLuaAppNotInterestedFeedbackFormTelemetry = sharedFlagsModule.FFlagLuaAppNotInterestedFeedbackFormTelemetry
local luaAppCheckboxFeedbackFormTitleTextWrapping = game:DefineFastFlag("LuaAppCheckboxFeedbackFormTitleTextWrapping", false)

return reactModule.memo(function(p0) --[[ line: 57 | named "CheckboxFeedbackFormModal" ]]
	-- upvalues: useDispatch (ref), useTokens (ref), useLocalization (ref), reactModule (ref), closeCentralOverlay (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (ref), cryoModule (ref), checkbox (ref), useAppPolicy (ref), appPage (ref), urlBuilder (ref), fFlagSignalsNavP3Dispatch (ref), var11 (ref), navigateDown (ref), dialog (ref), text (ref), luaAppCheckboxFeedbackFormTitleTextWrapping (ref), buttonVariant (ref), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (ref)
	local var13 = useDispatch()
	local var14 = useTokens()
	local var15 = useLocalization({
		submitText = "CommonUI.Controls.Action.Submit",
		otherPlaceholderText = "Feature.GameDetails.Label.TellUsMorePlaceholder",
		termsOfUseText = {
			"Feature.GameDetails.Message.AnonymousFeedbackTermsOfUse",
			underlineStart = "<u>",
			underlineEnd = "</u>"
		}
	})
	local var16 = reactModule.useCallback(function(p1) --[[ line: 70 ]]
		-- upvalues: var13 (ref), closeCentralOverlay (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), p0 (ref)
		var13(closeCentralOverlay())
		
		if fFlagLuaAppNotInterestedFeedbackFormTelemetry and p0.onClose then
			p0.onClose(p1)
		end
	end, { var13, p0.onClose })
	local var17, var18 = reactModule.useState({})
	local var19 = reactModule.useMemo(function() --[[ line: 79 ]]
		-- upvalues: cryoModule (copy), p0 (ref), reactModule (copy), checkbox (copy), var17 (ref), var18 (ref)
		return cryoModule.List.map(p0.checkboxItems, function(p2, p3) --[[ line: 80 ]]
			-- upvalues: reactModule (copy), checkbox (copy), var17 (copy), var18 (copy)
			local id = p2.id
			
			return reactModule.createElement(checkbox, {
				label = p2.text,
				isChecked = if var17[id] then true else false,
				LayoutOrder = p3,
				onActivated = function() --[[ line: 86 ]]
					-- upvalues: var17 (copy), id (ref), var18 (copy)
					local cloned = table.clone(var17)
					
					if cloned[id] then
						cloned[id] = false
						var18(cloned)
						
						return
					end
					cloned[id] = true
					var18(cloned)
				end
			})
		end)
	end, { p0.checkboxItems, var17 })
	local var20, var21 = reactModule.useMemo(function() --[[ line: 100 ]]
		-- upvalues: p0 (ref), var17 (ref)
		local var27 = false
		local var28 = false
		
		for i, v in p0.checkboxItems do
			if var17[v.id] then
				if v.triggersOtherTextbox then
					var28 = true
				else
					var27 = true
				end
			end
		end
		return var27, var28
	end, { p0.checkboxItems, var17 })
	local var22 = reactModule.useRef("")
	local var23, var24 = reactModule.useState(false)
	local var25 = if var21 and not var23 then false elseif var20 or var21 and var23 then true else false
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		onClose = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then if fFlagLuaAppNotInterestedFeedbackFormTelemetry then reactModule.useCallback(function() --[[ line: 168 ]]
			-- upvalues: var16 (ref)
			var16(false)
		end, { var16 }) else nil else var16
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
			}, cryoModule.Dictionary.union(var19, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					fontStyle = var14.Typography.TitleLarge,
					Size = UDim2.fromScale(1, 0),
					Text = p0.checkboxListTitle,
					TextWrapped = if luaAppCheckboxFeedbackFormTitleTextWrapping then true else nil,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, var14.Padding.Medium),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Top
				})
			})),
			OtherTextBoxContainer = if var21 then reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = var14.Color.Shift.Shift_200.Color3,
				BackgroundTransparency = var14.Color.Shift.Shift_200.Transparency,
				Size = UDim2.fromScale(1, 0)
			}, {
				InputBox = reactModule.createElement("TextBox", {
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					Font = var14.Typography.CaptionMedium.Font,
					LineHeight = var14.LineHeight.LineHeight_140,
					MultiLine = true,
					PlaceholderColor3 = var14.Color.Content.Muted.Color3,
					PlaceholderText = var15.otherPlaceholderText,
					Size = UDim2.new(1, 0, 0, var14.Size.Size_1000),
					Text = var22.current,
					TextColor3 = var14.Color.Content.Default.Color3,
					TextSize = var14.Typography.CaptionMedium.FontSize,
					TextTransparency = var14.Color.Content.Default.Transparency,
					TextTruncate = Enum.TextTruncate.SplitWord,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					[reactModule.Change.Text] = reactModule.useCallback(function(p4) --[[ line: 122 ]]
						-- upvalues: var22 (ref), var24 (ref)
						if not p4 then return end
						if p4.Text:len() > 500 then
							p4.Text = p4.Text:sub(1, 500)
						end
						var22.current = p4.Text
						var24(p4.Text:len() >= 10)
					end, {})
				}, {
					UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(1e999, var14.Size.Size_3000) })
				}),
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, var14.Padding.Small),
					PaddingLeft = UDim.new(0, var14.Padding.Small),
					PaddingRight = UDim.new(0, var14.Padding.Small),
					PaddingTop = UDim.new(0, var14.Padding.Small)
				}),
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var14.Radius.Medium) })
			}) else nil,
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, var14.Padding.XLarge),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 4,
			actions = {
				{
					isDisabled = not var25,
					onActivated = reactModule.useCallback(function() --[[ line: 133 ]]
						-- upvalues: var25 (ref), var16 (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), p0 (ref), var17 (ref), var22 (ref)
						if var25 then
							var16(if fFlagLuaAppNotInterestedFeedbackFormTelemetry then true else nil)
							p0.onSubmit(var17, var22.current)
							
							return
						end
					end, { var25, p0.onSubmit, var17, var16 }),
					text = var15.submitText,
					variant = buttonVariant.Standard
				}
			}
		}),
		DisclaimerText = if fFlagLuaAppMakeDisclaimerOptInForFeedbackForm and not p0.showTermsOfUseDisclaimer or not useAppPolicy(function(p5) --[[ line: 141 ]]
			return p5.getWebViewSupport()
		end) then nil else reactModule.createElement("TextButton", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Font = Enum.Font.BuilderSansMedium,
			LayoutOrder = 5,
			LineHeight = var14.LineHeight.LineHeight_140,
			RichText = true,
			Size = UDim2.fromScale(1, 0),
			Text = var15.termsOfUseText,
			TextColor3 = var14.Color.Content.Muted.Color3,
			TextSize = var14.FontSize.FontSize_300,
			TextTransparency = var14.Color.Content.Muted.Transparency,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			[reactModule.Event.Activated] = reactModule.useCallback(function() --[[ line: 146 ]]
				-- upvalues: appPage (copy), urlBuilder (copy), fFlagSignalsNavP3Dispatch (copy), var11 (copy), var13 (ref), navigateDown (copy), var16 (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy)
				local t = {
					name = appPage.GenericWebPage,
					detail = urlBuilder.static.about.terms(),
					extraProps = { title = "" }
				}
				
				if fFlagSignalsNavP3Dispatch then
					var11.down(var11.fromLegacyPage(t), nil)
				else
					var13(navigateDown(t, nil))
				end
				var16(if fFlagLuaAppNotInterestedFeedbackFormTelemetry then false else nil)
			end, { var13, var16 })
		})
	})
end)