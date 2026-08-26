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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local appPage = robloxAppEnumsModule.AppPage
local useAppPolicy = universalAppPolicyModule.useAppPolicy
local urlBuilder = urlBuilderModule.UrlBuilder
local fFlagLuaAppMakeDisclaimerOptInForFeedbackForm = sharedFlagsModule.FFlagLuaAppMakeDisclaimerOptInForFeedbackForm
local fFlagLuaAppNotInterestedFeedbackFormTelemetry = sharedFlagsModule.FFlagLuaAppNotInterestedFeedbackFormTelemetry
local luaAppCheckboxFeedbackFormTitleTextWrapping = game:DefineFastFlag("LuaAppCheckboxFeedbackFormTitleTextWrapping", false)

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), useTokens (ref), useLocalization (ref), reactModule (ref), closeCentralOverlay (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (ref), cryoModule (ref), checkbox (ref), useAppPolicy (ref), appPage (ref), urlBuilder (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), dialog (ref), text (ref), luaAppCheckboxFeedbackFormTitleTextWrapping (ref), buttonVariant (ref), fFlagLuaAppMakeDisclaimerOptInForFeedbackForm (ref)
	local var2 = useDispatch()
	local var3 = useTokens()
	local var4 = useLocalization({
		submitText = "CommonUI.Controls.Action.Submit",
		otherPlaceholderText = "Feature.GameDetails.Label.TellUsMorePlaceholder",
		termsOfUseText = {
			"Feature.GameDetails.Message.AnonymousFeedbackTermsOfUse",
			underlineStart = "<u>",
			underlineEnd = "</u>"
		}
	})
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), closeCentralOverlay (copy), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), p1 (ref)
		var2(closeCentralOverlay())
		
		if fFlagLuaAppNotInterestedFeedbackFormTelemetry and p1.onClose then
			p1.onClose(p2)
		end
	end, { var2, p1.onClose })
	local var6, var7 = reactModule.useState({})
	local var8 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p1 (ref), reactModule (copy), checkbox (copy), var6 (ref), var7 (ref)
		return cryoModule.List.map(p1.checkboxItems, function(p2, p3)
			-- upvalues: reactModule (copy), checkbox (copy), var6 (copy), var7 (copy)
			local id = p2.id
			
			return reactModule.createElement(checkbox, {
				label = p2.text,
				isChecked = if var6[id] then true else false,
				LayoutOrder = p3,
				onActivated = function()
					-- upvalues: var6 (copy), id (ref), var7 (copy)
					local cloned = table.clone(var6)
					
					if cloned[id] then
						cloned[id] = false
						var7(cloned)
						
						return
					end
					cloned[id] = true
					var7(cloned)
				end
			})
		end)
	end, { p1.checkboxItems, var6 })
	local var9, var10 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var6 (ref)
		local var11 = false
		local var12 = false
		
		for i, v in p1.checkboxItems do
			if var6[v.id] then
				if v.triggersOtherTextbox then
					var12 = true
				else
					var11 = true
				end
			end
		end
		return var11, var12
	end, { p1.checkboxItems, var6 })
	local var13 = reactModule.useRef("")
	local var14, var15 = reactModule.useState(false)
	local var16 = if var10 and not var14 then false elseif var9 or var10 and var14 then true else false
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		onClose = if fFlagLuaAppNotInterestedFeedbackFormTelemetry then if fFlagLuaAppNotInterestedFeedbackFormTelemetry then reactModule.useCallback(function()
			-- upvalues: var5 (ref)
			var5(false)
		end, { var5 }) else nil else var5
	}, {
		DialogTitle = if p1.dialogTitle then reactModule.createElement(dialog.Title, { text = p1.dialogTitle }) else nil,
		DialogText = reactModule.createElement(dialog.Text, { LayoutOrder = 2, Text = p1.dialogText }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 3 }, {
			CheckboxListWrapper = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0)
			}, cryoModule.Dictionary.union(var8, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					fontStyle = var3.Typography.TitleLarge,
					Size = UDim2.fromScale(1, 0),
					Text = p1.checkboxListTitle,
					TextWrapped = if luaAppCheckboxFeedbackFormTitleTextWrapping then true else nil,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, var3.Padding.Medium),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Top
				})
			})),
			OtherTextBoxContainer = if var10 then reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = var3.Color.Shift.Shift_200.Color3,
				BackgroundTransparency = var3.Color.Shift.Shift_200.Transparency,
				Size = UDim2.fromScale(1, 0)
			}, {
				InputBox = reactModule.createElement("TextBox", {
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					Font = var3.Typography.CaptionMedium.Font,
					LineHeight = var3.LineHeight.LineHeight_140,
					MultiLine = true,
					PlaceholderColor3 = var3.Color.Content.Muted.Color3,
					PlaceholderText = var4.otherPlaceholderText,
					Size = UDim2.new(1, 0, 0, var3.Size.Size_1000),
					Text = var13.current,
					TextColor3 = var3.Color.Content.Default.Color3,
					TextSize = var3.Typography.CaptionMedium.FontSize,
					TextTransparency = var3.Color.Content.Default.Transparency,
					TextTruncate = Enum.TextTruncate.SplitWord,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					[reactModule.Change.Text] = reactModule.useCallback(function(p2)
						-- upvalues: var13 (ref), var15 (ref)
						if not p2 then return end
						if p2.Text:len() > 500 then
							p2.Text = p2.Text:sub(1, 500)
						end
						var13.current = p2.Text
						var15(p2.Text:len() >= 10)
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
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var3.Radius.Medium) })
			}) else nil,
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, var3.Padding.XLarge),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 4,
			actions = {
				{
					isDisabled = not var16,
					onActivated = reactModule.useCallback(function()
						-- upvalues: var16 (ref), var5 (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy), p1 (ref), var6 (ref), var13 (ref)
						if var16 then
							var5(if fFlagLuaAppNotInterestedFeedbackFormTelemetry then true else nil)
							p1.onSubmit(var6, var13.current)
							
							return
						end
					end, { var16, p1.onSubmit, var6, var5 }),
					text = var4.submitText,
					variant = buttonVariant.Standard
				}
			}
		}),
		DisclaimerText = if fFlagLuaAppMakeDisclaimerOptInForFeedbackForm and not p1.showTermsOfUseDisclaimer or not useAppPolicy(function(p2)
			return p2.getWebViewSupport()
		end) then nil else reactModule.createElement("TextButton", {
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
				-- upvalues: appPage (copy), urlBuilder (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy), var5 (ref), fFlagLuaAppNotInterestedFeedbackFormTelemetry (copy)
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
				var5(if fFlagLuaAppNotInterestedFeedbackFormTelemetry then false else nil)
			end, { var2, var5 })
		})
	})
end)