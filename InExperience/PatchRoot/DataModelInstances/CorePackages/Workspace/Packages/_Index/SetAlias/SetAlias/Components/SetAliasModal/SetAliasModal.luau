local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local dependenciesModule = require(parent.dependencies)
local textKeysModule = require(parent.Common.TextKeys)
local analyticsModule = require(parent.Analytics)
local eventNames = analyticsModule.EventNames
local useAnalytics = analyticsModule.useAnalytics
local react = dependenciesModule.React
local UIBlox = dependenciesModule.UIBlox
local foundation = dependenciesModule.Foundation
local radius = foundation.Enums.Radius
local skeleton = foundation.Skeleton
local roactFitComponents = dependenciesModule.RoactFitComponents
local useLocalization = dependenciesModule.Hooks.useLocalization
local socialLibraries = dependenciesModule.SocialLibraries
local roactUtilsModule = require(parent_1.RoactUtils)
local focusNavigationUtilsModule = require(parent_1.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local inputHandlersModule = require(parent_1.InputHandlers)
local _ = require(parent_1.ReactFocusNavigation)
local fitFrameVertical = roactFitComponents.FitFrameVertical
local fitTextLabel = roactFitComponents.FitTextLabel
local interactiveAlert = UIBlox.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBlox.App.Button.Enum.ButtonType
local useStyle = UIBlox.Core.Style.useStyle
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local images = UIBlox.App.ImageSet.Images
local iconSize = UIBlox.App.Constant.IconSize
local useEffectOnce = roactUtilsModule.Hooks.useEffectOnce
local callbackInputBox = socialLibraries.Components.CallbackInputBox
local fFlagConnectionsToFriendsRename = require(parent_1.SharedFlags).FFlagConnectionsToFriendsRename
local fFlagSetAliasFixFocusNavigationModule = require(parent.Flags.FFlagSetAliasFixFocusNavigation)

return function(p1)
	-- upvalues: react (ref), useEffectOnce (ref), useStyle (ref), useLocalization (ref), textKeysModule (ref), fFlagConnectionsToFriendsRename (ref), useAnalytics (ref), eventNames (ref), fFlagSetAliasFixFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), interactiveAlert (ref), fitFrameVertical (ref), fitTextLabel (ref), skeleton (ref), radius (ref), imageSetLabel (ref), images (ref), callbackInputBox (ref), iconSize (ref), buttonType (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var1 = react.useRef(nil)
	local var2, var3 = react.useState(Vector2.new(0, 0))
	local var4, var5 = react.useState(p1.alias)
	local var6 = if p1.alias then utf8.len(p1.alias) or 0 else 0
	local var7, var8 = react.useState(var6)
	useEffectOnce(function()
		-- upvalues: var5 (ref), p1 (ref), var8 (ref), var6 (ref)
		var5(p1.alias)
		var8(var6)
	end, p1.isLoading == false)
	local var9 = useStyle()
	local font = var9.Font
	local theme = var9.Theme
	local var10 = font.BaseSize * font.Body.RelativeSize
	local var11 = useLocalization({
		titleText = textKeysModule.CUSTOMIZE_NAME_MODAL_TITLE,
		cancelButtonText = textKeysModule.CANCEL_BUTTON,
		saveButtonText = textKeysModule.SAVE_BUTTON,
		descriptionText = if p1.displayName then {
			textKeysModule.SET_CUSTOM_NAME_DESCRIPTION,
			displayName = p1.displayName
		} else textKeysModule.SET_CUSTOM_NAME_NO_DISPLAY_NAME_DESCRIPTION,
		recognizeFriendsByCustomNameText = if fFlagConnectionsToFriendsRename then textKeysModule.RECOGNIZE_FRIENDS_BY_CUSTOM_NAME_DESCRIPTION else textKeysModule.RECOGNIZE_CONNECTIONS_BY_CUSTOM_NAME_DESCRIPTION,
		customNamePlaceholderText = textKeysModule.CUSTOM_NAME_PLACEHOLDER,
		invalidAliasErrorText = textKeysModule.INVALID_ALIAS_ERROR
	})
	local var12 = useAnalytics()
	local var13 = react.useRef(false)
	local var14 = not p1.hasSaveAliasError
	local var15 = react.useCallback(function(p2)
		-- upvalues: var2 (ref), var3 (ref)
		if var2.X ~= p2.AbsoluteSize.X then
			var3(p2.AbsoluteSize)
		end
	end, { var2 })
	
	local var16 = function()
		-- upvalues: p1 (ref), var4 (ref)
		p1.saveOnActivated(var4)
	end
	
	local var17 = function()
		-- upvalues: var12 (ref), eventNames (copy), p1 (ref)
		if var12 then
			var12.fireAnalyticsEvent(eventNames.CustomizeNameModalClosed)
		end
		p1.cancelOnActivated()
	end
	
	local var18 = function(p2)
		-- upvalues: var7 (ref), var4 (ref), var1 (ref), var8 (ref), var5 (ref), p1 (ref), var12 (ref), eventNames (copy), var13 (ref)
		local charCount = utf8.len(p2)
		
		if charCount == nil then return end
		local var19 = charCount
		
		if var19 > 20 then
			p2 = if var7 == 20 then var4 else string.sub(p2, 1, utf8.offset(p2, 21) - 1)
			var19 = 20
			
			if var1 and var1.current then
				var1.current.Text = p2
			end
		end
		var8(var19)
		var5(p2)
		
		if p1.onTextChanged then
			p1.onTextChanged()
		end
		if var19 == 0 and var12 then
			var12.fireAnalyticsEvent(eventNames.CustomizeNameClearedInput)
		end
		if var19 == 20 and var12 and not var13.current then
			var13.current = true
			var12.fireAnalyticsEvent(eventNames.CustomizeNameMaximumCharLimitTyped, { alias = p2 })
		end
	end
	
	local var19 = react.createElement(interactiveAlert, {
		title = var11.titleText,
		screenSize = p1.screenSize,
		anchorPoint = Vector2.new(0.5, 0),
		position = UDim2.new(0.5, 0, 0, var2.Y),
		middleContent = function()
			-- upvalues: react (copy), fitFrameVertical (copy), var15 (ref), fitTextLabel (copy), var2 (ref), font (ref), var11 (ref), theme (ref), p1 (ref), skeleton (copy), var10 (ref), radius (copy), imageSetLabel (copy), images (copy), callbackInputBox (copy), iconSize (copy), var18 (ref), var1 (ref), var7 (ref)
			return react.createElement(fitFrameVertical, {
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				contentPadding = UDim.new(0, 16),
				[react.Change.AbsoluteSize] = var15
			}, {
				InputGroup = react.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIListLayout = react.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Description = react.createElement(fitTextLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						TextWrapped = true,
						RichText = true,
						width = fitTextLabel.Width.FitToText,
						maximumWidth = var2.X,
						Font = font.Body.Font,
						Text = var11.descriptionText,
						TextSize = font.BaseSize * font.Body.RelativeSize,
						TextColor3 = theme.TextDefault.Color
					}),
					RecognizeFriendsByCustomNameContainer = react.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.fromScale(1, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						UIPadding = react.createElement("UIPadding", {
							PaddingTop = UDim.new(0, 2),
							PaddingBottom = UDim.new(0, 24)
						}),
						RecognizeFriendsByCustomName = react.createElement(fitTextLabel, {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextWrapped = true,
							width = fitTextLabel.Width.FitToText,
							maximumWidth = var2.X,
							Font = font.CaptionBody.Font,
							Text = var11.recognizeFriendsByCustomNameText,
							TextSize = font.BaseSize * font.CaptionBody.RelativeSize,
							TextColor3 = theme.TextDefault.Color
						})
					}),
					LoadingShimmer = if p1.isLoading then react.createElement(skeleton, {
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, var10 + 20),
						radius = radius.Medium
					}) else nil,
					InputBackground = if not p1.isLoading then react.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, var10 + 20),
						Image = images["component_assets/circle_21"],
						ImageColor3 = theme.UIMuted.Color,
						ImageTransparency = theme.UIMuted.Transparency,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(8, 8, 9, 9)
					}, {
						InputBorder = react.createElement(imageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Size = UDim2.new(1, 0, 0, var10 + 20),
							Image = images["component_assets/circle_21_stroke_1"],
							ImageColor3 = if p1.hasSaveAliasError then theme.Alert.Color else theme.Divider.Color,
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(8, 8, 9, 9)
						}, {
							Padding = react.createElement("UIPadding", {
								PaddingLeft = UDim.new(0, 12),
								PaddingRight = UDim.new(0, 12)
							}),
							Textbox = react.createElement(callbackInputBox, {
								captureFocusOnMount = true,
								clearButtonDisabled = false,
								inputTextXAlignment = Enum.TextXAlignment.Left,
								inputTextColor3 = theme.TextDefault.Color,
								inputTextTransparency = theme.TextDefault.Transparency,
								inputTextSize = var10,
								initialInputText = p1.alias,
								placeholderText = var11.customNamePlaceholderText,
								placeholderTextColor3 = theme.TextDefault.Color,
								clearIcon = images["icons/actions/edit/clear_small"],
								clearIconColor3 = theme.IconEmphasis.Color,
								clearIconTransparency = theme.IconEmphasis.Transparency,
								clearButtonSize = iconSize.Small,
								textChangedCallback = var18,
								inputBoxRef = var1
							})
						})
					}) else nil
				}),
				Counter = react.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					react.createElement(fitTextLabel, {
						BackgroundTransparency = 1,
						width = fitTextLabel.Width.FitToText,
						maximumWidth = var2.X,
						Font = font.CaptionBody.Font,
						Text = if p1.hasSaveAliasError then var11.invalidAliasErrorText else string.format("%d/%d", var7, 20),
						TextSize = font.BaseSize * font.CaptionBody.RelativeSize,
						TextColor3 = if var7 == 20 or p1.hasSaveAliasError then theme.Alert.Color else theme.TextMuted.Color,
						TextTransparency = if var7 == 20 or p1.hasSaveAliasError then theme.Alert.Transparency else theme.TextMuted.Transparency,
						AnchorPoint = if p1.hasSaveAliasError then Vector2.new(0, 0.5) else Vector2.new(1, 0.5),
						Position = if p1.hasSaveAliasError then nil else UDim2.fromScale(1, 0)
					}, {
						UISizeConstraint = react.createElement("UISizeConstraint", {
							MaxSize = Vector2.new(1e999, font.BaseSize * font.CaptionBody.RelativeSize * 2)
						})
					})
				})
			})
		end,
		buttonStackInfo = {
			buttonHeight = 48,
			marginBetween = 6,
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = { onActivated = var17, text = var11.cancelButtonText }
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = var16,
						text = var11.saveButtonText,
						isDisabled = not var14
					}
				}
			},
			forcedFillDirection = Enum.FillDirection.Horizontal
		}
	})
	
	return if fFlagSetAliasFixFocusNavigationModule then react.createElement(focusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		eventHandlers = if fFlagSetAliasFixFocusNavigationModule then react.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var12 (ref), eventNames (copy), p1 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p2)
						-- upvalues: var12 (copy), eventNames (copy), p1 (copy)
						if var12 then
							var12.fireAnalyticsEvent(eventNames.CustomizeNameModalClosed)
						end
						p1.cancelOnActivated()
						p2:cancel()
					end)
				}
			}
		end, { var17 }) else nil
	}, { Alert = var19 }) else var19
end