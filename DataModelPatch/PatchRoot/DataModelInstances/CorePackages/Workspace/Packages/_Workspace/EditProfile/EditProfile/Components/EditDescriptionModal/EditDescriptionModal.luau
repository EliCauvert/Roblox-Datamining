local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local CallbackInputBox = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Components.CallbackInputBox
local FFlagDescriptionModalThrottleErrorModule = require(EditProfile.Flags.FFlagDescriptionModalThrottleError)
local FFlagEditProfileFixFocusNavigationModule = require(EditProfile.Flags.FFlagEditProfileFixFocusNavigation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(EditProfile.Common.TextKeys)
local FocusNavigatorWrapperModule = require(EditProfile.Utils.FocusNavigatorWrapper)

return function(p1)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UseStyleFunction (copy), FFlagEditProfileFixFocusNavigationModule (copy), FocusNavigatorWrapperModule (copy), InteractiveAlert (copy), ImageSetLabel (copy), Images (copy), CallbackInputBox (copy), FFlagDescriptionModalThrottleErrorModule (copy), ButtonType (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.initialText)
	local Length = string.len(UseStateResult)
	local UseLocalizationResult = UseLocalizationFunction({
		cancelButtonText = TextKeysModule.CancelButtonText,
		saveButtonText = TextKeysModule.SaveButtonText,
		saySomething = TextKeysModule.SaySomething,
		pinLocked = TextKeysModule.PinLocked
	})
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	local ScaledBaseSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize
	
	local function textChanged(Text: string)
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		if string.len(Text) > 1000 then
			Text = string.sub(Text, 1, 1000)
			
			if UseRefResult and UseRefResult.current then
				UseRefResult.current.Text = Text
			end
		end
		UseStateResult2(Text)
	end
	
	local function onSave()
		-- upvalues: p1 (copy), UseStateResult (copy)
		p1.saveOnActivated(UseStateResult)
	end
	
	return if FFlagEditProfileFixFocusNavigationModule then FocusNavigatorWrapperModule({ onClose = p1.cancelOnActivated }, {
		ReactModule.createElement(InteractiveAlert, {
			title = p1.title,
			screenSize = p1.screenSize,
			anchorPoint = Vector2.new(0.5, 0),
			position = UDim2.new(0.5, 0, 0, 44),
			middleContent = function()
				-- upvalues: ReactModule (upval), UseStyleResultFont (copy), p1 (copy), Theme (copy), ImageSetLabel (upval), Images (upval), CallbackInputBox (upval), ScaledBaseSize (copy), UseLocalizationResult (copy), textChanged (copy), UseRefResult (copy), FFlagDescriptionModalThrottleErrorModule (upval), Length (copy)
				return ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					InputGroup = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.fromScale(1, 1),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						UIListLayout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						Description = ReactModule.createElement("TextLabel", {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextWrapped = true,
							TextSize = 14,
							RichText = true,
							TextXAlignment = Enum.TextXAlignment.Center,
							Font = UseStyleResultFont.Body.Font,
							Text = p1.description,
							TextColor3 = Theme.TextDefault.Color,
							AutomaticSize = Enum.AutomaticSize.XY
						}),
						Padding = ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 2,
							Size = UDim2.new(1, 0, 0, 24)
						}),
						InputBackground = ReactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 3,
							Size = UDim2.new(1, 0, 0, 144),
							Image = Images["component_assets/circle_21"],
							ImageColor3 = Theme.UIMuted.Color,
							ImageTransparency = Theme.UIMuted.Transparency,
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(8, 8, 9, 9)
						}, {
							InputBorder = ReactModule.createElement(ImageSetLabel, {
								BackgroundTransparency = 1,
								LayoutOrder = 1,
								Size = UDim2.new(1, 0, 0, 144),
								Image = Images["component_assets/circle_21_stroke_1"],
								ImageColor3 = Theme.Divider.Color,
								ScaleType = Enum.ScaleType.Slice,
								SliceCenter = Rect.new(8, 8, 9, 9)
							}, {
								Padding = ReactModule.createElement("UIPadding", {
									PaddingLeft = UDim.new(0, 12),
									PaddingRight = UDim.new(0, 12),
									PaddingTop = UDim.new(0, 7)
								}),
								Textbox = ReactModule.createElement(CallbackInputBox, {
									captureFocusOnMount = true,
									multiLine = true,
									textWrapped = true,
									clearButtonDisabled = true,
									clearButtonSize = 0,
									inputTextXAlignment = Enum.TextXAlignment.Left,
									inputTextYAlignment = Enum.TextYAlignment.Top,
									inputTextColor3 = Theme.TextDefault.Color,
									inputTextTransparency = Theme.TextDefault.Transparency,
									inputTextSize = ScaledBaseSize,
									initialInputText = p1.initialText,
									placeholderText = UseLocalizationResult.saySomething,
									placeholderTextColor3 = Theme.TextDefault.Color,
									textChangedCallback = textChanged,
									inputBoxRef = UseRefResult
								})
							})
						}),
						Counter = ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 4,
							Size = UDim2.new(1, 0, 0, 22)
						}, {
							ThrottleError = if FFlagDescriptionModalThrottleErrorModule and p1.throttleError then ReactModule.createElement("TextLabel", {
								BackgroundTransparency = 1,
								TextXAlignment = 0,
								Position = UDim2.fromScale(0, 0.4),
								AutomaticSize = Enum.AutomaticSize.XY,
								Font = UseStyleResultFont.CaptionBody.Font,
								Text = p1.throttleErrorText,
								TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionBody.RelativeSize * 0.9,
								TextColor3 = Theme.Alert.Color,
								TextTransparency = Theme.Alert.Transparency
							}) else nil,
							ReactModule.createElement("TextLabel", {
								BackgroundTransparency = 1,
								TextWrapped = true,
								AutomaticSize = Enum.AutomaticSize.XY,
								Font = UseStyleResultFont.CaptionBody.Font,
								Text = if p1.textError then UseLocalizationResult.pinLocked else string.format("%d/%d", Length, 1000),
								TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionBody.RelativeSize,
								TextColor3 = if Length == 1000 or p1.textError then Theme.Alert.Color else Theme.TextMuted.Color,
								TextTransparency = if Length == 1000 or p1.textError then Theme.Alert.Transparency else Theme.TextMuted.Transparency,
								AnchorPoint = if p1.textError then Vector2.new(0, 1) else Vector2.new(1, 1),
								Position = if p1.textError then UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1)
							}, {
								UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
									MaxSize = Vector2.new(1e999, UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionBody.RelativeSize * 2)
								})
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
							onActivated = p1.cancelOnActivated,
							text = UseLocalizationResult.cancelButtonText
						}
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = onSave,
							text = UseLocalizationResult.saveButtonText
						}
					}
				},
				forcedFillDirection = Enum.FillDirection.Horizontal
			}
		})
	}) else ReactModule.createElement(InteractiveAlert, {
		title = p1.title,
		screenSize = p1.screenSize,
		anchorPoint = Vector2.new(0.5, 0),
		position = UDim2.new(0.5, 0, 0, 44),
		middleContent = function()
			-- upvalues: ReactModule (upval), UseStyleResultFont (copy), p1 (copy), Theme (copy), ImageSetLabel (upval), Images (upval), CallbackInputBox (upval), ScaledBaseSize (copy), UseLocalizationResult (copy), textChanged (copy), UseRefResult (copy), FFlagDescriptionModalThrottleErrorModule (upval), Length (copy)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				InputGroup = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.fromScale(1, 1),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Description = ReactModule.createElement("TextLabel", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						TextWrapped = true,
						TextSize = 14,
						RichText = true,
						TextXAlignment = Enum.TextXAlignment.Center,
						Font = UseStyleResultFont.Body.Font,
						Text = p1.description,
						TextColor3 = Theme.TextDefault.Color,
						AutomaticSize = Enum.AutomaticSize.XY
					}),
					Padding = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 0, 24)
					}),
					InputBackground = ReactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, 144),
						Image = Images["component_assets/circle_21"],
						ImageColor3 = Theme.UIMuted.Color,
						ImageTransparency = Theme.UIMuted.Transparency,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(8, 8, 9, 9)
					}, {
						InputBorder = ReactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Size = UDim2.new(1, 0, 0, 144),
							Image = Images["component_assets/circle_21_stroke_1"],
							ImageColor3 = Theme.Divider.Color,
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(8, 8, 9, 9)
						}, {
							Padding = ReactModule.createElement("UIPadding", {
								PaddingLeft = UDim.new(0, 12),
								PaddingRight = UDim.new(0, 12),
								PaddingTop = UDim.new(0, 7)
							}),
							Textbox = ReactModule.createElement(CallbackInputBox, {
								captureFocusOnMount = true,
								multiLine = true,
								textWrapped = true,
								clearButtonDisabled = true,
								clearButtonSize = 0,
								inputTextXAlignment = Enum.TextXAlignment.Left,
								inputTextYAlignment = Enum.TextYAlignment.Top,
								inputTextColor3 = Theme.TextDefault.Color,
								inputTextTransparency = Theme.TextDefault.Transparency,
								inputTextSize = ScaledBaseSize,
								initialInputText = p1.initialText,
								placeholderText = UseLocalizationResult.saySomething,
								placeholderTextColor3 = Theme.TextDefault.Color,
								textChangedCallback = textChanged,
								inputBoxRef = UseRefResult
							})
						})
					}),
					Counter = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 4,
						Size = UDim2.new(1, 0, 0, 22)
					}, {
						ThrottleError = if FFlagDescriptionModalThrottleErrorModule and p1.throttleError then ReactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							TextXAlignment = 0,
							Position = UDim2.fromScale(0, 0.4),
							AutomaticSize = Enum.AutomaticSize.XY,
							Font = UseStyleResultFont.CaptionBody.Font,
							Text = p1.throttleErrorText,
							TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionBody.RelativeSize * 0.9,
							TextColor3 = Theme.Alert.Color,
							TextTransparency = Theme.Alert.Transparency
						}) else nil,
						ReactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							TextWrapped = true,
							AutomaticSize = Enum.AutomaticSize.XY,
							Font = UseStyleResultFont.CaptionBody.Font,
							Text = if p1.textError then UseLocalizationResult.pinLocked else string.format("%d/%d", Length, 1000),
							TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionBody.RelativeSize,
							TextColor3 = if Length == 1000 or p1.textError then Theme.Alert.Color else Theme.TextMuted.Color,
							TextTransparency = if Length == 1000 or p1.textError then Theme.Alert.Transparency else Theme.TextMuted.Transparency,
							AnchorPoint = if p1.textError then Vector2.new(0, 1) else Vector2.new(1, 1),
							Position = if p1.textError then UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1)
						}, {
							UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
								MaxSize = Vector2.new(1e999, UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionBody.RelativeSize * 2)
							})
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
						onActivated = p1.cancelOnActivated,
						text = UseLocalizationResult.cancelButtonText
					}
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = onSave,
						text = UseLocalizationResult.saveButtonText
					}
				}
			},
			forcedFillDirection = Enum.FillDirection.Horizontal
		}
	})
end