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

return function(p0)
	-- upvalues: react (ref), useEffectOnce (ref), useStyle (ref), useLocalization (ref), textKeysModule (ref), fFlagConnectionsToFriendsRename (ref), useAnalytics (ref), eventNames (ref), fFlagSetAliasFixFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), interactiveAlert (ref), fitFrameVertical (ref), fitTextLabel (ref), skeleton (ref), radius (ref), imageSetLabel (ref), images (ref), callbackInputBox (ref), iconSize (ref), buttonType (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var7 = react.useRef(nil)
	local var8, var9 = react.useState(Vector2.new(0, 0))
	local var10, var11 = react.useState(p0.alias)
	local var12 = if p0.alias then utf8.len(p0.alias) or 0 else 0
	local var13, var14 = react.useState(var12)
	useEffectOnce(function()
		-- upvalues: var11 (ref), p0 (ref), var14 (ref), var12 (ref)
		var11(p0.alias)
		var14(var12)
	end, p0.isLoading == false)
	local var15 = useStyle()
	local font = var15.Font
	local theme = var15.Theme
	local var16 = font.BaseSize * font.Body.RelativeSize
	local var17 = useLocalization({
		titleText = textKeysModule.CUSTOMIZE_NAME_MODAL_TITLE,
		cancelButtonText = textKeysModule.CANCEL_BUTTON,
		saveButtonText = textKeysModule.SAVE_BUTTON,
		descriptionText = if p0.displayName then {
			textKeysModule.SET_CUSTOM_NAME_DESCRIPTION,
			displayName = p0.displayName
		} else textKeysModule.SET_CUSTOM_NAME_NO_DISPLAY_NAME_DESCRIPTION,
		recognizeFriendsByCustomNameText = if fFlagConnectionsToFriendsRename then textKeysModule.RECOGNIZE_FRIENDS_BY_CUSTOM_NAME_DESCRIPTION else textKeysModule.RECOGNIZE_CONNECTIONS_BY_CUSTOM_NAME_DESCRIPTION,
		customNamePlaceholderText = textKeysModule.CUSTOM_NAME_PLACEHOLDER,
		invalidAliasErrorText = textKeysModule.INVALID_ALIAS_ERROR
	})
	local var18 = useAnalytics()
	local var19 = react.useRef(false)
	local var20 = not p0.hasSaveAliasError
	local var21 = react.useCallback(function(p1)
		-- upvalues: var8 (ref), var9 (ref)
		if var8.X ~= p1.AbsoluteSize.X then
			var9(p1.AbsoluteSize)
		end
	end, { var8 })
	
	local var22 = function()
		-- upvalues: p0 (ref), var10 (ref)
		p0.saveOnActivated(var10)
	end
	
	local var23 = function()
		-- upvalues: var18 (ref), eventNames (copy), p0 (ref)
		if var18 then
			var18.fireAnalyticsEvent(eventNames.CustomizeNameModalClosed)
		end
		p0.cancelOnActivated()
	end
	
	local var24 = function(p2)
		-- upvalues: var13 (ref), var10 (ref), var7 (ref), var14 (ref), var11 (ref), p0 (ref), var18 (ref), eventNames (copy), var19 (ref)
		local charCount = utf8.len(p2)
		
		if charCount == nil then return end
		local var27 = charCount
		
		if var27 > 20 then
			p2 = if var13 == 20 then var10 else string.sub(p2, 1, utf8.offset(p2, 21) - 1)
			var27 = 20
			
			if var7 and var7.current then
				var7.current.Text = p2
			end
		end
		var14(var27)
		var11(p2)
		
		if p0.onTextChanged then
			p0.onTextChanged()
		end
		if var27 == 0 and var18 then
			var18.fireAnalyticsEvent(eventNames.CustomizeNameClearedInput)
		end
		if var27 == 20 and var18 and not var19.current then
			var19.current = true
			var18.fireAnalyticsEvent(eventNames.CustomizeNameMaximumCharLimitTyped, { alias = p2 })
		end
	end
	
	local var25 = react.createElement(interactiveAlert, {
		title = var17.titleText,
		screenSize = p0.screenSize,
		anchorPoint = Vector2.new(0.5, 0),
		position = UDim2.new(0.5, 0, 0, var8.Y),
		middleContent = function()
			-- upvalues: react (copy), fitFrameVertical (copy), var21 (ref), fitTextLabel (copy), var8 (ref), font (ref), var17 (ref), theme (ref), p0 (ref), skeleton (copy), var16 (ref), radius (copy), imageSetLabel (copy), images (copy), callbackInputBox (copy), iconSize (copy), var24 (ref), var7 (ref), var13 (ref)
			return react.createElement(fitFrameVertical, {
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				contentPadding = UDim.new(0, 16),
				[react.Change.AbsoluteSize] = var21
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
						maximumWidth = var8.X,
						Font = font.Body.Font,
						Text = var17.descriptionText,
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
							maximumWidth = var8.X,
							Font = font.CaptionBody.Font,
							Text = var17.recognizeFriendsByCustomNameText,
							TextSize = font.BaseSize * font.CaptionBody.RelativeSize,
							TextColor3 = theme.TextDefault.Color
						})
					}),
					LoadingShimmer = if p0.isLoading then react.createElement(skeleton, {
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, var16 + 20),
						radius = radius.Medium
					}) else nil,
					InputBackground = if not p0.isLoading then react.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, var16 + 20),
						Image = images["component_assets/circle_21"],
						ImageColor3 = theme.UIMuted.Color,
						ImageTransparency = theme.UIMuted.Transparency,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(8, 8, 9, 9)
					}, {
						InputBorder = react.createElement(imageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Size = UDim2.new(1, 0, 0, var16 + 20),
							Image = images["component_assets/circle_21_stroke_1"],
							ImageColor3 = if p0.hasSaveAliasError then theme.Alert.Color else theme.Divider.Color,
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
								inputTextSize = var16,
								initialInputText = p0.alias,
								placeholderText = var17.customNamePlaceholderText,
								placeholderTextColor3 = theme.TextDefault.Color,
								clearIcon = images["icons/actions/edit/clear_small"],
								clearIconColor3 = theme.IconEmphasis.Color,
								clearIconTransparency = theme.IconEmphasis.Transparency,
								clearButtonSize = iconSize.Small,
								textChangedCallback = var24,
								inputBoxRef = var7
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
						maximumWidth = var8.X,
						Font = font.CaptionBody.Font,
						Text = if p0.hasSaveAliasError then var17.invalidAliasErrorText else string.format("%d/%d", var13, 20),
						TextSize = font.BaseSize * font.CaptionBody.RelativeSize,
						TextColor3 = if var13 == 20 or p0.hasSaveAliasError then theme.Alert.Color else theme.TextMuted.Color,
						TextTransparency = if var13 == 20 or p0.hasSaveAliasError then theme.Alert.Transparency else theme.TextMuted.Transparency,
						AnchorPoint = if p0.hasSaveAliasError then Vector2.new(0, 0.5) else Vector2.new(1, 0.5),
						Position = if p0.hasSaveAliasError then nil else UDim2.fromScale(1, 0)
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
					props = { onActivated = var23, text = var17.cancelButtonText }
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = var22,
						text = var17.saveButtonText,
						isDisabled = not var20
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
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var18 (ref), eventNames (copy), p0 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p3)
						-- upvalues: var18 (copy), eventNames (copy), p0 (copy)
						if var18 then
							var18.fireAnalyticsEvent(eventNames.CustomizeNameModalClosed)
						end
						p0.cancelOnActivated()
						p3:cancel()
					end)
				}
			}
		end, { var23 }) else nil
	}, { Alert = var25 }) else var25
end