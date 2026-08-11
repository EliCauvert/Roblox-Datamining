local httpService = game:GetService("HttpService")
local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local iconSize = UIBloxModule.App.Constant.IconSize
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local callbackInputBox = luaSocialLibrariesDepsModule.SocialLibraries.config({}).Components.CallbackInputBox
local useLocalization = require(parent.Localization).Hooks.useLocalization
local constantsModule = require(editProfile.Common.Constants)
local textKeysModule = require(editProfile.Common.TextKeys)
local luauPolyfillModule = require(parent.LuauPolyfill)
local clearTimeout = luauPolyfillModule.clearTimeout
local setTimeout = luauPolyfillModule.setTimeout
local editProfileIXPModule = require(editProfile.Flags.EditProfileIXP)
local internationalNamesIXPModule = require(editProfile.Flags.InternationalNamesIXP)
local fFlagEditProfileFixFocusNavigationModule = require(editProfile.Flags.FFlagEditProfileFixFocusNavigation)
local analyticsModule = require(editProfile.Analytics)
local eventNames = analyticsModule.EventNames
local useAnalytics = analyticsModule.useAnalytics
local nameNotAvailableErrorEnabled = game:DefineFastFlag("NameNotAvailableErrorEnabled", false)
local useDisplayNameTextModule = require(editProfile.Hooks.useDisplayNameText)
local focusNavigatorWrapperModule = require(editProfile.Utils.FocusNavigatorWrapper)
local editProfileModalNetworkDelay = game:DefineFastInt("EditProfileModalNetworkDelay", 500)

return function(p0) --[[ line: 61 ]]
	-- upvalues: reactModule (ref), useDisplayNameTextModule (ref), useLocalization (ref), textKeysModule (ref), editProfileIXPModule (ref), useAnalytics (ref), useStyle (ref), setTimeout (ref), editProfileModalNetworkDelay (ref), constantsModule (ref), nameNotAvailableErrorEnabled (ref), internationalNamesIXPModule (ref), clearTimeout (ref), eventNames (ref), httpService (ref), fFlagEditProfileFixFocusNavigationModule (ref), focusNavigatorWrapperModule (ref), interactiveAlert (ref), imageSetLabel (ref), images (ref), callbackInputBox (ref), iconSize (ref), buttonType (ref)
	local var16 = reactModule.useRef(nil)
	local var17 = useDisplayNameTextModule()
	local var18, var19 = reactModule.useState(p0.initialText)
	local var20 = utf8.len(var18) or 0
	local var21 = useLocalization({
		cancelButtonText = textKeysModule.CancelButtonText,
		saveButtonText = textKeysModule.SaveButtonText
	})
	local var22 = if editProfileIXPModule.useIsExperimentEnabled() then useAnalytics() else nil
	local var23 = useStyle()
	local font = var23.Font
	local theme = var23.Theme
	local var24 = font.BaseSize * font.Body.RelativeSize
	local var25, var26 = reactModule.useState(true)
	local var27, var28 = reactModule.useState(false)
	local var29, var30 = reactModule.useState(var17.displayNameChangeError)
	local var31 = reactModule.useRef(setTimeout(function() --[[ line: 85 ]] end, editProfileModalNetworkDelay))
	local var32 = reactModule.useRef(false)
	
	local function getErrorMessage(p1) --[[ line: 88 ]]
		-- upvalues: constantsModule (copy), var17 (ref), nameNotAvailableErrorEnabled (copy)
		return ({
			[constantsModule.DisplayNameValidationErrorCodes.TooShort] = var17.nameTooShortError,
			[constantsModule.DisplayNameValidationErrorCodes.TooLong] = var17.nameTooLongError,
			[constantsModule.DisplayNameValidationErrorCodes.InvalidCharacters] = var17.nameUnsupportedCharsError,
			[constantsModule.DisplayNameValidationErrorCodes.Moderated] = var17.nameInappropriateError,
			[constantsModule.DisplayNameValidationErrorCodes.Throttled] = var17.nameHasChangedError,
			[constantsModule.DisplayNameValidationErrorCodes.InvalidCharacterSetCombination] = var17.displayNameChangeMixedCharactersError,
			[constantsModule.DisplayNameValidationErrorCodes.NameNotAvailable] = if nameNotAvailableErrorEnabled then var17.nameNotAvailableError else nil
		})[p1] or var17.displayNameChangeError
	end
	
	local function textChanged(p2) --[[ line: 103 ]]
		-- upvalues: p0 (ref), var32 (ref), internationalNamesIXPModule (copy), clearTimeout (copy), var31 (ref), var26 (ref), var22 (ref), eventNames (copy), var30 (ref), var17 (ref), var28 (ref), var19 (ref), var20 (ref), var18 (ref), var16 (ref), setTimeout (copy), httpService (copy), getErrorMessage (ref), editProfileModalNetworkDelay (copy)
		if p2 ~= p0.initialText and not var32.current then
			var32.current = true
			internationalNamesIXPModule.logExposure()
		end
		clearTimeout(var31.current)
		var26(false)
		local charCount = utf8.len(p2)
		
		if charCount == nil then return end
		if charCount < 3 then
			if var22 then
				var22.fireAnalyticsEvent(eventNames.DisplayNameTooShort, { displayName = p2 })
			end
			var30(var17.displayNameTooShortError)
			var28(true)
			var19(p2)
			
			return
		elseif charCount <= 20 then
			var19(p2)
			var31.current = setTimeout(function() --[[ line: 151 ]]
				-- upvalues: p0 (copy), httpService (copy), p2 (write), var28 (copy), var26 (copy), getErrorMessage (copy), var22 (copy), eventNames (copy), var30 (copy)
				p0.validateDisplayName(httpService:UrlEncode(p2)):andThen(function(_) --[[ line: 154 ]]
					-- upvalues: var28 (copy), var26 (copy)
					var28(false)
					var26(true)
				end):catch(function(p3) --[[ line: 158 ]]
					-- upvalues: httpService (copy), getErrorMessage (copy), var22 (copy), eventNames (copy), p2 (copy), var30 (copy), var28 (copy)
					local ok, status = pcall(function() --[[ line: 159 ]]
						-- upvalues: httpService (copy), p3 (ref)
						return httpService:JSONDecode(p3.Body)
					end)
					local var37 = -1
					
					if ok then
						local code
						if status and status.errors and status.errors[1] then
							code = status.errors[1].code
							
							if not code then
								code = -1
							end
							var37 = code
						end
					end
					local var38 = getErrorMessage(var37)
					
					if var22 then
						var22.fireAnalyticsEvent(eventNames.FilteredDisplayName, { displayName = p2 })
					end
					var30(var38)
					var28(true)
				end)
			end, editProfileModalNetworkDelay)
			
			return
		end
		p2 = if var20 == 20 then var18 else string.sub(p2, 1, utf8.offset(p2, 21) - 1)
		local _ = 20
		
		if var16 and var16.current then
			var16.current.Text = p2
		end
		var19(p2)
	end
	
	local function onSave() --[[ line: 179 ]]
		-- upvalues: var18 (ref), p0 (ref)
		if var18 == p0.initialText then
			p0.cancelOnActivated()
			
			return
		end
		p0.saveOnActivated(var18)
	end
	
	return if fFlagEditProfileFixFocusNavigationModule then focusNavigatorWrapperModule({ onClose = p0.cancelOnActivated }, {
		reactModule.createElement(interactiveAlert, {
			title = p0.title,
			screenSize = p0.screenSize,
			anchorPoint = Vector2.new(0.5, 0),
			position = UDim2.new(0.5, 0, 0, 117),
			middleContent = function() --[[ line: 196 ]]
				-- upvalues: reactModule (copy), font (ref), p0 (ref), theme (ref), imageSetLabel (copy), var24 (ref), images (copy), var27 (ref), callbackInputBox (copy), iconSize (copy), textChanged (ref), var16 (ref), var29 (ref), var20 (ref)
				return reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					InputGroup = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.fromScale(1, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						UIListLayout = reactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						Description = reactModule.createElement("TextLabel", {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextWrapped = true,
							TextSize = 14,
							RichText = true,
							Font = font.Body.Font,
							Text = p0.description,
							TextColor3 = theme.TextDefault.Color,
							AutomaticSize = Enum.AutomaticSize.XY,
							TextXAlignment = Enum.TextXAlignment.Center
						}),
						Padding = reactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 2,
							Size = UDim2.new(1, 0, 0, 24)
						}),
						InputBackground = reactModule.createElement(imageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 3,
							Size = UDim2.new(1, 0, 0, var24 + 20),
							Image = images["component_assets/circle_21"],
							ImageColor3 = theme.UIMuted.Color,
							ImageTransparency = theme.UIMuted.Transparency,
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(8, 8, 9, 9)
						}, {
							InputBorder = reactModule.createElement(imageSetLabel, {
								BackgroundTransparency = 1,
								LayoutOrder = 1,
								Size = UDim2.new(1, 0, 0, var24 + 20),
								Image = images["component_assets/circle_21_stroke_1"],
								ImageColor3 = if var27 then theme.Alert.Color else theme.Divider.Color,
								ScaleType = Enum.ScaleType.Slice,
								SliceCenter = Rect.new(8, 8, 9, 9)
							}, {
								Padding = reactModule.createElement("UIPadding", {
									PaddingLeft = UDim.new(0, 12),
									PaddingRight = UDim.new(0, 12)
								}),
								Textbox = reactModule.createElement(callbackInputBox, {
									captureFocusOnMount = true,
									clearButtonDisabled = false,
									inputTextXAlignment = Enum.TextXAlignment.Left,
									inputTextColor3 = theme.TextDefault.Color,
									inputTextTransparency = theme.TextDefault.Transparency,
									inputTextSize = var24,
									initialInputText = p0.initialText,
									placeholderText = p0.initialText,
									placeholderTextColor3 = theme.TextDefault.Color,
									clearIcon = images["icons/actions/edit/clear_small"],
									clearIconColor3 = theme.IconEmphasis.Color,
									clearIconTransparency = theme.IconEmphasis.Transparency,
									clearButtonSize = iconSize.Small,
									textChangedCallback = textChanged,
									inputBoxRef = var16
								})
							})
						}),
						AdditonalPadding = reactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 4,
							Size = UDim2.new(1, 0, 0, 8)
						}),
						Counter = reactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 5,
							Size = UDim2.fromScale(1, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							reactModule.createElement("TextLabel", {
								BackgroundTransparency = 1,
								TextWrapped = true,
								Font = font.CaptionBody.Font,
								Text = if var27 then var29 else string.format("%d/%d", var20, 20),
								TextSize = font.BaseSize * font.CaptionBody.RelativeSize,
								TextColor3 = if var20 == 20 or var27 then theme.Alert.Color else theme.TextMuted.Color,
								TextTransparency = if var20 == 20 or var27 then theme.Alert.Transparency else theme.TextMuted.Transparency,
								AnchorPoint = if var27 then nil else Vector2.new(1, 0),
								Position = if var27 then nil else UDim2.fromScale(1, 0),
								AutomaticSize = Enum.AutomaticSize.XY,
								TextXAlignment = Enum.TextXAlignment.Left
							}, {
								UISizeConstraint = reactModule.createElement("UISizeConstraint", {
									MaxSize = Vector2.new(1e999, font.BaseSize * font.CaptionBody.RelativeSize * 2)
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
						buttonType = buttonType.Secondary,
						props = {
							onActivated = p0.cancelOnActivated,
							text = var21.cancelButtonText
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = onSave,
							text = var21.saveButtonText,
							isDisabled = not var25
						}
					}
				},
				forcedFillDirection = Enum.FillDirection.Horizontal
			}
		})
	}) else reactModule.createElement(interactiveAlert, {
		title = p0.title,
		screenSize = p0.screenSize,
		anchorPoint = Vector2.new(0.5, 0),
		position = UDim2.new(0.5, 0, 0, 117),
		middleContent = function() --[[ line: 349 ]]
			-- upvalues: reactModule (copy), font (ref), p0 (ref), theme (ref), imageSetLabel (copy), var24 (ref), images (copy), var27 (ref), callbackInputBox (copy), iconSize (copy), textChanged (ref), var16 (ref), var29 (ref), var20 (ref)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				InputGroup = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIListLayout = reactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					Description = reactModule.createElement("TextLabel", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						TextWrapped = true,
						TextSize = 14,
						RichText = true,
						Font = font.Body.Font,
						Text = p0.description,
						TextColor3 = theme.TextDefault.Color,
						AutomaticSize = Enum.AutomaticSize.XY,
						TextXAlignment = Enum.TextXAlignment.Center
					}),
					Padding = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 0, 24)
					}),
					InputBackground = reactModule.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, var24 + 20),
						Image = images["component_assets/circle_21"],
						ImageColor3 = theme.UIMuted.Color,
						ImageTransparency = theme.UIMuted.Transparency,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(8, 8, 9, 9)
					}, {
						InputBorder = reactModule.createElement(imageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Size = UDim2.new(1, 0, 0, var24 + 20),
							Image = images["component_assets/circle_21_stroke_1"],
							ImageColor3 = if var27 then theme.Alert.Color else theme.Divider.Color,
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(8, 8, 9, 9)
						}, {
							Padding = reactModule.createElement("UIPadding", {
								PaddingLeft = UDim.new(0, 12),
								PaddingRight = UDim.new(0, 12)
							}),
							Textbox = reactModule.createElement(callbackInputBox, {
								captureFocusOnMount = true,
								clearButtonDisabled = false,
								inputTextXAlignment = Enum.TextXAlignment.Left,
								inputTextColor3 = theme.TextDefault.Color,
								inputTextTransparency = theme.TextDefault.Transparency,
								inputTextSize = var24,
								initialInputText = p0.initialText,
								placeholderText = p0.initialText,
								placeholderTextColor3 = theme.TextDefault.Color,
								clearIcon = images["icons/actions/edit/clear_small"],
								clearIconColor3 = theme.IconEmphasis.Color,
								clearIconTransparency = theme.IconEmphasis.Transparency,
								clearButtonSize = iconSize.Small,
								textChangedCallback = textChanged,
								inputBoxRef = var16
							})
						})
					}),
					AdditonalPadding = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 4,
						Size = UDim2.new(1, 0, 0, 8)
					}),
					Counter = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 5,
						Size = UDim2.fromScale(1, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						reactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							TextWrapped = true,
							Font = font.CaptionBody.Font,
							Text = if var27 then var29 else string.format("%d/%d", var20, 20),
							TextSize = font.BaseSize * font.CaptionBody.RelativeSize,
							TextColor3 = if var20 == 20 or var27 then theme.Alert.Color else theme.TextMuted.Color,
							TextTransparency = if var20 == 20 or var27 then theme.Alert.Transparency else theme.TextMuted.Transparency,
							AnchorPoint = if var27 then nil else Vector2.new(1, 0),
							Position = if var27 then nil else UDim2.fromScale(1, 0),
							AutomaticSize = Enum.AutomaticSize.XY,
							TextXAlignment = Enum.TextXAlignment.Left
						}, {
							UISizeConstraint = reactModule.createElement("UISizeConstraint", {
								MaxSize = Vector2.new(1e999, font.BaseSize * font.CaptionBody.RelativeSize * 2)
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
					buttonType = buttonType.Secondary,
					props = {
						onActivated = p0.cancelOnActivated,
						text = var21.cancelButtonText
					}
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = onSave,
						text = var21.saveButtonText,
						isDisabled = not var25
					}
				}
			},
			forcedFillDirection = Enum.FillDirection.Horizontal
		}
	})
end