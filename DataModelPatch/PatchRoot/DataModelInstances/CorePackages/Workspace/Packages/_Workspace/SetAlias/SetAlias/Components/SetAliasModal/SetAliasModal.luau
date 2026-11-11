local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local TextKeysModule = require(Parent.Common.TextKeys)
local AnalyticsModule = require(Parent.Analytics)
local EventNames = AnalyticsModule.EventNames
local UseAnalyticsFunction = AnalyticsModule.useAnalytics
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local Foundation = DependenciesModule.Foundation
local Radius = Foundation.Enums.Radius
local Skeleton = Foundation.Skeleton
local RoactFitComponents = DependenciesModule.RoactFitComponents
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local FocusNavigationUtilsModule = require(Parent1.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local InputHandlersModule = require(Parent1.InputHandlers)
local _ = require(Parent1.ReactFocusNavigation)
local FitFrameVertical = RoactFitComponents.FitFrameVertical
local FitTextLabel = RoactFitComponents.FitTextLabel
local InteractiveAlert = UIBlox.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local UseStyleFunction = UIBlox.Core.Style.useStyle
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local Images = UIBlox.App.ImageSet.Images
local IconSize = UIBlox.App.Constant.IconSize
local UseEffectOnceFunction = require(Parent1.RoactUtils).Hooks.useEffectOnce
local CallbackInputBox = DependenciesModule.SocialLibraries.Components.CallbackInputBox
local FFlagConnectionsToFriendsRename = require(Parent1.SharedFlags).FFlagConnectionsToFriendsRename
local FFlagSetAliasFixFocusNavigationModule = require(Parent.Flags.FFlagSetAliasFixFocusNavigation)

return function(p1)
	-- upvalues: React (copy), UseEffectOnceFunction (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), FFlagConnectionsToFriendsRename (copy), UseAnalyticsFunction (copy), EventNames (copy), FFlagSetAliasFixFocusNavigationModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), InteractiveAlert (copy), FitFrameVertical (copy), FitTextLabel (copy), Skeleton (copy), Radius (copy), ImageSetLabel (copy), Images (copy), CallbackInputBox (copy), IconSize (copy), ButtonType (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local UseRefResult = React.useRef(nil)
	local UseStateResult, UseStateResult2 = React.useState(Vector2.new(0, 0))
	local UseStateResult1, UseStateResult2_1 = React.useState(p1.alias)
	local Length: number = p1.alias and utf8.len(p1.alias) or 0
	local UseStateResult3, UseStateResult2_2 = React.useState(Length)
	UseEffectOnceFunction(function()
		-- upvalues: UseStateResult2_1 (copy), p1 (copy), UseStateResult2_2 (copy), Length (copy)
		UseStateResult2_1(p1.alias)
		UseStateResult2_2(Length)
	end, p1.isLoading == false)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	local ScaledBaseSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = TextKeysModule.CUSTOMIZE_NAME_MODAL_TITLE,
		cancelButtonText = TextKeysModule.CANCEL_BUTTON,
		saveButtonText = TextKeysModule.SAVE_BUTTON,
		descriptionText = if p1.displayName then {
			TextKeysModule.SET_CUSTOM_NAME_DESCRIPTION,
			displayName = p1.displayName
		} else TextKeysModule.SET_CUSTOM_NAME_NO_DISPLAY_NAME_DESCRIPTION,
		recognizeFriendsByCustomNameText = if FFlagConnectionsToFriendsRename then TextKeysModule.RECOGNIZE_FRIENDS_BY_CUSTOM_NAME_DESCRIPTION else TextKeysModule.RECOGNIZE_CONNECTIONS_BY_CUSTOM_NAME_DESCRIPTION,
		customNamePlaceholderText = TextKeysModule.CUSTOM_NAME_PLACEHOLDER,
		invalidAliasErrorText = TextKeysModule.INVALID_ALIAS_ERROR
	})
	local UseAnalyticsResult = UseAnalyticsFunction()
	local UseRefResult1 = React.useRef(false)
	local UseResult = React.useCallback(function(Frame: Frame)
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy)
		if UseStateResult.X ~= Frame.AbsoluteSize.X then
			UseStateResult2(Frame.AbsoluteSize)
		end
	end, { UseStateResult })
	
	local function OnActivated()
		-- upvalues: UseAnalyticsResult (copy), EventNames (upval), p1 (copy)
		if UseAnalyticsResult then
			UseAnalyticsResult.fireAnalyticsEvent(EventNames.CustomizeNameModalClosed)
		end
		p1.cancelOnActivated()
	end
	
	local function TextChangedCallback(Text: string)
		-- upvalues: UseStateResult3 (copy), UseStateResult1 (copy), UseRefResult (copy), UseStateResult2_2 (copy), UseStateResult2_1 (copy), p1 (copy), UseAnalyticsResult (copy), EventNames (upval), UseRefResult1 (copy)
		local Length = utf8.len(Text)
		
		if Length == nil then return end
		local Length1: number = Length
		
		if Length1 > 20 then
			if UseStateResult3 == 20 then
				Text = UseStateResult1
			else
				Text = string.sub(Text, 1, utf8.offset(Text, 21) - 1)
			end
			Length1 = 20
			
			if UseRefResult and UseRefResult.current then
				UseRefResult.current.Text = Text
			end
		end
		UseStateResult2_2(Length1)
		UseStateResult2_1(Text)
		
		if p1.onTextChanged then
			p1.onTextChanged()
		end
		if Length1 == 0 and UseAnalyticsResult then
			UseAnalyticsResult.fireAnalyticsEvent(EventNames.CustomizeNameClearedInput)
		end
		if Length1 == 20 and UseAnalyticsResult and not UseRefResult1.current then
			UseRefResult1.current = true
			UseAnalyticsResult.fireAnalyticsEvent(EventNames.CustomizeNameMaximumCharLimitTyped, { alias = Text })
		end
	end
	
	local UseMemoResult = if FFlagSetAliasFixFocusNavigationModule then React.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseAnalyticsResult (copy), EventNames (upval), p1 (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2)
					-- upvalues: UseAnalyticsResult (upval), EventNames (upval), p1 (upval)
					if UseAnalyticsResult then
						UseAnalyticsResult.fireAnalyticsEvent(EventNames.CustomizeNameModalClosed)
					end
					p1.cancelOnActivated()
					p2:cancel()
				end)
			}
		}
	end, { OnActivated }) else nil
	local Element = React.createElement(InteractiveAlert, {
		title = UseLocalizationResult.titleText,
		screenSize = p1.screenSize,
		anchorPoint = Vector2.new(0.5, 0),
		position = UDim2.new(0.5, 0, 0, UseStateResult.Y),
		middleContent = function()
			-- upvalues: React (upval), FitFrameVertical (upval), UseResult (copy), FitTextLabel (upval), UseStateResult (copy), UseStyleResultFont (copy), UseLocalizationResult (copy), Theme (copy), p1 (copy), Skeleton (upval), ScaledBaseSize (copy), Radius (upval), ImageSetLabel (upval), Images (upval), CallbackInputBox (upval), IconSize (upval), TextChangedCallback (copy), UseRefResult (copy), UseStateResult3 (copy)
			return React.createElement(FitFrameVertical, {
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				contentPadding = UDim.new(0, 16),
				[React.Change.AbsoluteSize] = UseResult
			}, {
				InputGroup = React.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIListLayout = React.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Description = React.createElement(FitTextLabel, {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						TextWrapped = true,
						RichText = true,
						width = FitTextLabel.Width.FitToText,
						maximumWidth = UseStateResult.X,
						Font = UseStyleResultFont.Body.Font,
						Text = UseLocalizationResult.descriptionText,
						TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize,
						TextColor3 = Theme.TextDefault.Color
					}),
					RecognizeFriendsByCustomNameContainer = React.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.fromScale(1, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						UIPadding = React.createElement("UIPadding", {
							PaddingTop = UDim.new(0, 2),
							PaddingBottom = UDim.new(0, 24)
						}),
						RecognizeFriendsByCustomName = React.createElement(FitTextLabel, {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextWrapped = true,
							width = FitTextLabel.Width.FitToText,
							maximumWidth = UseStateResult.X,
							Font = UseStyleResultFont.CaptionBody.Font,
							Text = UseLocalizationResult.recognizeFriendsByCustomNameText,
							TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionBody.RelativeSize,
							TextColor3 = Theme.TextDefault.Color
						})
					}),
					LoadingShimmer = if p1.isLoading then React.createElement(Skeleton, {
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, ScaledBaseSize + 20),
						radius = Radius.Medium
					}) else nil,
					InputBackground = if p1.isLoading then nil else React.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, ScaledBaseSize + 20),
						Image = Images["component_assets/circle_21"],
						ImageColor3 = Theme.UIMuted.Color,
						ImageTransparency = Theme.UIMuted.Transparency,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(8, 8, 9, 9)
					}, {
						InputBorder = React.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Size = UDim2.new(1, 0, 0, ScaledBaseSize + 20),
							Image = Images["component_assets/circle_21_stroke_1"],
							ImageColor3 = if p1.hasSaveAliasError then Theme.Alert.Color else Theme.Divider.Color,
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(8, 8, 9, 9)
						}, {
							Padding = React.createElement("UIPadding", {
								PaddingLeft = UDim.new(0, 12),
								PaddingRight = UDim.new(0, 12)
							}),
							Textbox = React.createElement(CallbackInputBox, {
								captureFocusOnMount = true,
								clearButtonDisabled = false,
								inputTextXAlignment = Enum.TextXAlignment.Left,
								inputTextColor3 = Theme.TextDefault.Color,
								inputTextTransparency = Theme.TextDefault.Transparency,
								inputTextSize = ScaledBaseSize,
								initialInputText = p1.alias,
								placeholderText = UseLocalizationResult.customNamePlaceholderText,
								placeholderTextColor3 = Theme.TextDefault.Color,
								clearIcon = Images["icons/actions/edit/clear_small"],
								clearIconColor3 = Theme.IconEmphasis.Color,
								clearIconTransparency = Theme.IconEmphasis.Transparency,
								clearButtonSize = IconSize.Small,
								textChangedCallback = TextChangedCallback,
								inputBoxRef = UseRefResult
							})
						})
					})
				}),
				Counter = React.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					React.createElement(FitTextLabel, {
						BackgroundTransparency = 1,
						width = FitTextLabel.Width.FitToText,
						maximumWidth = UseStateResult.X,
						Font = UseStyleResultFont.CaptionBody.Font,
						Text = if p1.hasSaveAliasError then UseLocalizationResult.invalidAliasErrorText else string.format("%d/%d", UseStateResult3, 20),
						TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionBody.RelativeSize,
						TextColor3 = if UseStateResult3 == 20 or p1.hasSaveAliasError then Theme.Alert.Color else Theme.TextMuted.Color,
						TextTransparency = if UseStateResult3 == 20 or p1.hasSaveAliasError then Theme.Alert.Transparency else Theme.TextMuted.Transparency,
						AnchorPoint = if p1.hasSaveAliasError then Vector2.new(0, 0.5) else Vector2.new(1, 0.5),
						Position = if p1.hasSaveAliasError then nil else UDim2.fromScale(1, 0)
					}, {
						UISizeConstraint = React.createElement("UISizeConstraint", {
							MaxSize = Vector2.new(1e999, UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionBody.RelativeSize * 2)
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
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = OnActivated,
						text = UseLocalizationResult.cancelButtonText
					}
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = function()
							-- upvalues: p1 (copy), UseStateResult1 (copy)
							p1.saveOnActivated(UseStateResult1)
						end,
						text = UseLocalizationResult.saveButtonText,
						isDisabled = not not p1.hasSaveAliasError
					}
				}
			},
			forcedFillDirection = Enum.FillDirection.Horizontal
		}
	})
	
	return if FFlagSetAliasFixFocusNavigationModule then React.createElement(FocusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		eventHandlers = UseMemoResult
	}, { Alert = Element }) else Element
end