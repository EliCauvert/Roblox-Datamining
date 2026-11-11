local HttpService = game:GetService("HttpService")
local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local IconSize = UIBloxModule.App.Constant.IconSize
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local CallbackInputBox = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Components.CallbackInputBox
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConstantsModule = require(EditProfile.Common.Constants)
local TextKeysModule = require(EditProfile.Common.TextKeys)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local EditProfileIXPModule = require(EditProfile.Flags.EditProfileIXP)
local InternationalNamesIXPModule = require(EditProfile.Flags.InternationalNamesIXP)
local FFlagEditProfileFixFocusNavigationModule = require(EditProfile.Flags.FFlagEditProfileFixFocusNavigation)
local AnalyticsModule = require(EditProfile.Analytics)
local EventNames = AnalyticsModule.EventNames
local UseAnalyticsFunction = AnalyticsModule.useAnalytics
local NameNotAvailableErrorEnabled = game:DefineFastFlag("NameNotAvailableErrorEnabled", false)
local UseDisplayNameTextModule = require(EditProfile.Hooks.useDisplayNameText)
local FocusNavigatorWrapperModule = require(EditProfile.Utils.FocusNavigatorWrapper)
local EditProfileModalNetworkDelay = game:DefineFastInt("EditProfileModalNetworkDelay", 500)

return function(p1)
	-- upvalues: ReactModule (copy), UseDisplayNameTextModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), EditProfileIXPModule (copy), UseAnalyticsFunction (copy), UseStyleFunction (copy), SetTimeoutFunction (copy), EditProfileModalNetworkDelay (copy), ConstantsModule (copy), NameNotAvailableErrorEnabled (copy), InternationalNamesIXPModule (copy), ClearTimeoutFunction (copy), EventNames (copy), HttpService (copy), FFlagEditProfileFixFocusNavigationModule (copy), FocusNavigatorWrapperModule (copy), InteractiveAlert (copy), ImageSetLabel (copy), Images (copy), CallbackInputBox (copy), IconSize (copy), ButtonType (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseDisplayNameTextModuleResult = UseDisplayNameTextModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.initialText)
	local Length: number = utf8.len(UseStateResult) or 0
	local UseLocalizationResult = UseLocalizationFunction({
		cancelButtonText = TextKeysModule.CancelButtonText,
		saveButtonText = TextKeysModule.SaveButtonText
	})
	local UseAnalyticsResult = if EditProfileIXPModule.useIsExperimentEnabled() then UseAnalyticsFunction() else nil
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	local ScaledBaseSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(true)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(UseDisplayNameTextModuleResult.displayNameChangeError)
	local UseRefResult1 = ReactModule.useRef(SetTimeoutFunction(function() end, EditProfileModalNetworkDelay))
	local UseRefResult2 = ReactModule.useRef(false)
	
	local function getErrorMessage(Code)
		-- upvalues: ConstantsModule (upval), UseDisplayNameTextModuleResult (copy), NameNotAvailableErrorEnabled (upval)
		return ({
			[ConstantsModule.DisplayNameValidationErrorCodes.TooShort] = UseDisplayNameTextModuleResult.nameTooShortError,
			[ConstantsModule.DisplayNameValidationErrorCodes.TooLong] = UseDisplayNameTextModuleResult.nameTooLongError,
			[ConstantsModule.DisplayNameValidationErrorCodes.InvalidCharacters] = UseDisplayNameTextModuleResult.nameUnsupportedCharsError,
			[ConstantsModule.DisplayNameValidationErrorCodes.Moderated] = UseDisplayNameTextModuleResult.nameInappropriateError,
			[ConstantsModule.DisplayNameValidationErrorCodes.Throttled] = UseDisplayNameTextModuleResult.nameHasChangedError,
			[ConstantsModule.DisplayNameValidationErrorCodes.InvalidCharacterSetCombination] = UseDisplayNameTextModuleResult.displayNameChangeMixedCharactersError,
			[ConstantsModule.DisplayNameValidationErrorCodes.NameNotAvailable] = if NameNotAvailableErrorEnabled then UseDisplayNameTextModuleResult.nameNotAvailableError else nil
		})[Code] or UseDisplayNameTextModuleResult.displayNameChangeError
	end
	
	local function textChanged(Text: string)
		-- upvalues: p1 (copy), UseRefResult2 (copy), InternationalNamesIXPModule (upval), ClearTimeoutFunction (upval), UseRefResult1 (copy), UseStateResult2_1 (copy), UseAnalyticsResult (copy), EventNames (upval), UseStateResult2_3 (copy), UseDisplayNameTextModuleResult (copy), UseStateResult2_2 (copy), UseStateResult2 (copy), Length (copy), UseStateResult (copy), UseRefResult (copy), SetTimeoutFunction (upval), HttpService (upval), getErrorMessage (copy), EditProfileModalNetworkDelay (upval)
		if Text ~= p1.initialText and not UseRefResult2.current then
			UseRefResult2.current = true
			InternationalNamesIXPModule.logExposure()
		end
		ClearTimeoutFunction(UseRefResult1.current)
		UseStateResult2_1(false)
		local Length1 = utf8.len(Text)
		
		if Length1 == nil then return end
		if Length1 < 3 then
			if UseAnalyticsResult then
				UseAnalyticsResult.fireAnalyticsEvent(EventNames.DisplayNameTooShort, { displayName = Text })
			end
			UseStateResult2_3(UseDisplayNameTextModuleResult.displayNameTooShortError)
			UseStateResult2_2(true)
			UseStateResult2(Text)
			
			return
		else
			if Length1 <= 20 then
				UseStateResult2(Text)
				UseRefResult1.current = SetTimeoutFunction(function()
					-- upvalues: p1 (upval), HttpService (upval), Text (ref), UseStateResult2_2 (upval), UseStateResult2_1 (upval), getErrorMessage (upval), UseAnalyticsResult (upval), EventNames (upval), UseStateResult2_3 (upval)
					p1.validateDisplayName(HttpService:UrlEncode(Text)):andThen(function(_)
						-- upvalues: UseStateResult2_2 (upval), UseStateResult2_1 (upval)
						UseStateResult2_2(false)
						UseStateResult2_1(true)
					end):catch(function(Err)
						-- upvalues: HttpService (upval), getErrorMessage (upval), UseAnalyticsResult (upval), EventNames (upval), Text (upval), UseStateResult2_3 (upval), UseStateResult2_2 (upval)
						local Success, Result = pcall(function()
							-- upvalues: HttpService (upval), Err (copy)
							return HttpService:JSONDecode(Err.Body)
						end)
						local ErrorMessage = getErrorMessage(Success and (Result and Result.errors and Result.errors[1] and Result.errors[1].code) or -1)
						
						if UseAnalyticsResult then
							UseAnalyticsResult.fireAnalyticsEvent(EventNames.FilteredDisplayName, { displayName = Text })
						end
						UseStateResult2_3(ErrorMessage)
						UseStateResult2_2(true)
					end)
				end, EditProfileModalNetworkDelay)
				
				return
			end
			if Length == 20 then
				Text = UseStateResult
			else
				Text = string.sub(Text, 1, utf8.offset(Text, 21) - 1)
			end
			if UseRefResult and UseRefResult.current then
				UseRefResult.current.Text = Text
			end
			UseStateResult2(Text)
		end
	end
	
	local function onSave()
		-- upvalues: UseStateResult (copy), p1 (copy)
		if UseStateResult == p1.initialText then
			p1.cancelOnActivated()
			
			return
		else
			p1.saveOnActivated(UseStateResult)
		end
	end
	
	return if FFlagEditProfileFixFocusNavigationModule then FocusNavigatorWrapperModule({ onClose = p1.cancelOnActivated }, {
		ReactModule.createElement(InteractiveAlert, {
			title = p1.title,
			screenSize = p1.screenSize,
			anchorPoint = Vector2.new(0.5, 0),
			position = UDim2.new(0.5, 0, 0, 117),
			middleContent = function()
				-- upvalues: ReactModule (upval), UseStyleResultFont (copy), p1 (copy), Theme (copy), ImageSetLabel (upval), ScaledBaseSize (copy), Images (upval), UseStateResult3 (copy), CallbackInputBox (upval), IconSize (upval), textChanged (copy), UseRefResult (copy), UseStateResult4 (copy), Length (copy)
				return ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					InputGroup = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.fromScale(1, 0),
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
							Font = UseStyleResultFont.Body.Font,
							Text = p1.description,
							TextColor3 = Theme.TextDefault.Color,
							AutomaticSize = Enum.AutomaticSize.XY,
							TextXAlignment = Enum.TextXAlignment.Center
						}),
						Padding = ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 2,
							Size = UDim2.new(1, 0, 0, 24)
						}),
						InputBackground = ReactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 3,
							Size = UDim2.new(1, 0, 0, ScaledBaseSize + 20),
							Image = Images["component_assets/circle_21"],
							ImageColor3 = Theme.UIMuted.Color,
							ImageTransparency = Theme.UIMuted.Transparency,
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(8, 8, 9, 9)
						}, {
							InputBorder = ReactModule.createElement(ImageSetLabel, {
								BackgroundTransparency = 1,
								LayoutOrder = 1,
								Size = UDim2.new(1, 0, 0, ScaledBaseSize + 20),
								Image = Images["component_assets/circle_21_stroke_1"],
								ImageColor3 = if UseStateResult3 then Theme.Alert.Color else Theme.Divider.Color,
								ScaleType = Enum.ScaleType.Slice,
								SliceCenter = Rect.new(8, 8, 9, 9)
							}, {
								Padding = ReactModule.createElement("UIPadding", {
									PaddingLeft = UDim.new(0, 12),
									PaddingRight = UDim.new(0, 12)
								}),
								Textbox = ReactModule.createElement(CallbackInputBox, {
									captureFocusOnMount = true,
									clearButtonDisabled = false,
									inputTextXAlignment = Enum.TextXAlignment.Left,
									inputTextColor3 = Theme.TextDefault.Color,
									inputTextTransparency = Theme.TextDefault.Transparency,
									inputTextSize = ScaledBaseSize,
									initialInputText = p1.initialText,
									placeholderText = p1.initialText,
									placeholderTextColor3 = Theme.TextDefault.Color,
									clearIcon = Images["icons/actions/edit/clear_small"],
									clearIconColor3 = Theme.IconEmphasis.Color,
									clearIconTransparency = Theme.IconEmphasis.Transparency,
									clearButtonSize = IconSize.Small,
									textChangedCallback = textChanged,
									inputBoxRef = UseRefResult
								})
							})
						}),
						AdditonalPadding = ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 4,
							Size = UDim2.new(1, 0, 0, 8)
						}),
						Counter = ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 5,
							Size = UDim2.fromScale(1, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							ReactModule.createElement("TextLabel", {
								BackgroundTransparency = 1,
								TextWrapped = true,
								Font = UseStyleResultFont.CaptionBody.Font,
								Text = if UseStateResult3 then UseStateResult4 else string.format("%d/%d", Length, 20),
								TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionBody.RelativeSize,
								TextColor3 = if Length == 20 or UseStateResult3 then Theme.Alert.Color else Theme.TextMuted.Color,
								TextTransparency = if Length == 20 or UseStateResult3 then Theme.Alert.Transparency else Theme.TextMuted.Transparency,
								AnchorPoint = if UseStateResult3 then nil else Vector2.new(1, 0),
								Position = if UseStateResult3 then nil else UDim2.fromScale(1, 0),
								AutomaticSize = Enum.AutomaticSize.XY,
								TextXAlignment = Enum.TextXAlignment.Left
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
							text = UseLocalizationResult.saveButtonText,
							isDisabled = not UseStateResult1
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
		position = UDim2.new(0.5, 0, 0, 117),
		middleContent = function()
			-- upvalues: ReactModule (upval), UseStyleResultFont (copy), p1 (copy), Theme (copy), ImageSetLabel (upval), ScaledBaseSize (copy), Images (upval), UseStateResult3 (copy), CallbackInputBox (upval), IconSize (upval), textChanged (copy), UseRefResult (copy), UseStateResult4 (copy), Length (copy)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				InputGroup = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.fromScale(1, 0),
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
						Font = UseStyleResultFont.Body.Font,
						Text = p1.description,
						TextColor3 = Theme.TextDefault.Color,
						AutomaticSize = Enum.AutomaticSize.XY,
						TextXAlignment = Enum.TextXAlignment.Center
					}),
					Padding = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 0, 24)
					}),
					InputBackground = ReactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, ScaledBaseSize + 20),
						Image = Images["component_assets/circle_21"],
						ImageColor3 = Theme.UIMuted.Color,
						ImageTransparency = Theme.UIMuted.Transparency,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(8, 8, 9, 9)
					}, {
						InputBorder = ReactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Size = UDim2.new(1, 0, 0, ScaledBaseSize + 20),
							Image = Images["component_assets/circle_21_stroke_1"],
							ImageColor3 = if UseStateResult3 then Theme.Alert.Color else Theme.Divider.Color,
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(8, 8, 9, 9)
						}, {
							Padding = ReactModule.createElement("UIPadding", {
								PaddingLeft = UDim.new(0, 12),
								PaddingRight = UDim.new(0, 12)
							}),
							Textbox = ReactModule.createElement(CallbackInputBox, {
								captureFocusOnMount = true,
								clearButtonDisabled = false,
								inputTextXAlignment = Enum.TextXAlignment.Left,
								inputTextColor3 = Theme.TextDefault.Color,
								inputTextTransparency = Theme.TextDefault.Transparency,
								inputTextSize = ScaledBaseSize,
								initialInputText = p1.initialText,
								placeholderText = p1.initialText,
								placeholderTextColor3 = Theme.TextDefault.Color,
								clearIcon = Images["icons/actions/edit/clear_small"],
								clearIconColor3 = Theme.IconEmphasis.Color,
								clearIconTransparency = Theme.IconEmphasis.Transparency,
								clearButtonSize = IconSize.Small,
								textChangedCallback = textChanged,
								inputBoxRef = UseRefResult
							})
						})
					}),
					AdditonalPadding = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 4,
						Size = UDim2.new(1, 0, 0, 8)
					}),
					Counter = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 5,
						Size = UDim2.fromScale(1, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						ReactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							TextWrapped = true,
							Font = UseStyleResultFont.CaptionBody.Font,
							Text = if UseStateResult3 then UseStateResult4 else string.format("%d/%d", Length, 20),
							TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionBody.RelativeSize,
							TextColor3 = if Length == 20 or UseStateResult3 then Theme.Alert.Color else Theme.TextMuted.Color,
							TextTransparency = if Length == 20 or UseStateResult3 then Theme.Alert.Transparency else Theme.TextMuted.Transparency,
							AnchorPoint = if UseStateResult3 then nil else Vector2.new(1, 0),
							Position = if UseStateResult3 then nil else UDim2.fromScale(1, 0),
							AutomaticSize = Enum.AutomaticSize.XY,
							TextXAlignment = Enum.TextXAlignment.Left
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
						text = UseLocalizationResult.saveButtonText,
						isDisabled = not UseStateResult1
					}
				}
			},
			forcedFillDirection = Enum.FillDirection.Horizontal
		}
	})
end