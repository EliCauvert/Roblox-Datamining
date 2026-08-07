local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local callbackInputBox = luaSocialLibrariesDepsModule.SocialLibraries.config({}).Components.CallbackInputBox
local fFlagDescriptionModalThrottleErrorModule = require(editProfile.Flags.FFlagDescriptionModalThrottleError)
local fFlagEditProfileFixFocusNavigationModule = require(editProfile.Flags.FFlagEditProfileFixFocusNavigation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(editProfile.Common.TextKeys)
local focusNavigatorWrapperModule = require(editProfile.Utils.FocusNavigatorWrapper)

return function(p0) --[[ line: 48 ]]
	-- upvalues: reactModule (ref), useLocalization (ref), textKeysModule (ref), useStyle (ref), fFlagEditProfileFixFocusNavigationModule (ref), focusNavigatorWrapperModule (ref), interactiveAlert (ref), imageSetLabel (ref), images (ref), callbackInputBox (ref), fFlagDescriptionModalThrottleErrorModule (ref), buttonType (ref)
	local var8 = reactModule.useRef(nil)
	local var9, var10 = reactModule.useState(p0.initialText)
	local var11 = string.len(var9)
	local var12 = useLocalization({
		cancelButtonText = textKeysModule.CancelButtonText,
		saveButtonText = textKeysModule.SaveButtonText,
		saySomething = textKeysModule.SaySomething,
		pinLocked = textKeysModule.PinLocked
	})
	local var13 = useStyle()
	local font = var13.Font
	local theme = var13.Theme
	local var14 = font.BaseSize * font.Body.RelativeSize
	
	local function textChanged(p1) --[[ line: 65 ]]
		-- upvalues: var8 (ref), var10 (ref)
		if string.len(p1) > 1000 then
			p1 = string.sub(p1, 1, 1000)
			local _ = 1000
			
			if var8 and var8.current then
				var8.current.Text = p1
			end
		end
		var10(p1)
	end
	
	local function onSave() --[[ line: 78 ]]
		-- upvalues: p0 (ref), var9 (ref)
		p0.saveOnActivated(var9)
	end
	
	return if fFlagEditProfileFixFocusNavigationModule then focusNavigatorWrapperModule({ onClose = p0.cancelOnActivated }, {
		reactModule.createElement(interactiveAlert, {
			title = p0.title,
			screenSize = p0.screenSize,
			anchorPoint = Vector2.new(0.5, 0),
			position = UDim2.new(0.5, 0, 0, 44),
			middleContent = function() --[[ line: 90 ]]
				-- upvalues: reactModule (copy), font (ref), p0 (ref), theme (ref), imageSetLabel (copy), images (copy), callbackInputBox (copy), var14 (ref), var12 (ref), textChanged (ref), var8 (ref), fFlagDescriptionModalThrottleErrorModule (copy), var11 (ref)
				return reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					InputGroup = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.fromScale(1, 1),
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
							TextXAlignment = Enum.TextXAlignment.Center,
							Font = font.Body.Font,
							Text = p0.description,
							TextColor3 = theme.TextDefault.Color,
							AutomaticSize = Enum.AutomaticSize.XY
						}),
						Padding = reactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 2,
							Size = UDim2.new(1, 0, 0, 24)
						}),
						InputBackground = reactModule.createElement(imageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 3,
							Size = UDim2.new(1, 0, 0, 144),
							Image = images["component_assets/circle_21"],
							ImageColor3 = theme.UIMuted.Color,
							ImageTransparency = theme.UIMuted.Transparency,
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(8, 8, 9, 9)
						}, {
							InputBorder = reactModule.createElement(imageSetLabel, {
								BackgroundTransparency = 1,
								LayoutOrder = 1,
								Size = UDim2.new(1, 0, 0, 144),
								Image = images["component_assets/circle_21_stroke_1"],
								ImageColor3 = theme.Divider.Color,
								ScaleType = Enum.ScaleType.Slice,
								SliceCenter = Rect.new(8, 8, 9, 9)
							}, {
								Padding = reactModule.createElement("UIPadding", {
									PaddingLeft = UDim.new(0, 12),
									PaddingRight = UDim.new(0, 12),
									PaddingTop = UDim.new(0, 7)
								}),
								Textbox = reactModule.createElement(callbackInputBox, {
									captureFocusOnMount = true,
									multiLine = true,
									textWrapped = true,
									clearButtonDisabled = true,
									clearButtonSize = 0,
									inputTextXAlignment = Enum.TextXAlignment.Left,
									inputTextYAlignment = Enum.TextYAlignment.Top,
									inputTextColor3 = theme.TextDefault.Color,
									inputTextTransparency = theme.TextDefault.Transparency,
									inputTextSize = var14,
									initialInputText = p0.initialText,
									placeholderText = var12.saySomething,
									placeholderTextColor3 = theme.TextDefault.Color,
									textChangedCallback = textChanged,
									inputBoxRef = var8
								})
							})
						}),
						Counter = reactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 4,
							Size = UDim2.new(1, 0, 0, 22)
						}, {
							ThrottleError = if fFlagDescriptionModalThrottleErrorModule and p0.throttleError then reactModule.createElement("TextLabel", {
								BackgroundTransparency = 1,
								TextXAlignment = 0,
								Position = UDim2.fromScale(0, 0.4),
								AutomaticSize = Enum.AutomaticSize.XY,
								Font = font.CaptionBody.Font,
								Text = p0.throttleErrorText,
								TextSize = font.BaseSize * font.CaptionBody.RelativeSize * 0.9,
								TextColor3 = theme.Alert.Color,
								TextTransparency = theme.Alert.Transparency
							}) else nil,
							reactModule.createElement("TextLabel", {
								BackgroundTransparency = 1,
								TextWrapped = true,
								AutomaticSize = Enum.AutomaticSize.XY,
								Font = font.CaptionBody.Font,
								Text = if p0.textError then var12.pinLocked else string.format("%d/%d", var11, 1000),
								TextSize = font.BaseSize * font.CaptionBody.RelativeSize,
								TextColor3 = if var11 == 1000 or p0.textError then theme.Alert.Color else theme.TextMuted.Color,
								TextTransparency = if var11 == 1000 or p0.textError then theme.Alert.Transparency else theme.TextMuted.Transparency,
								AnchorPoint = if p0.textError then Vector2.new(0, 1) else Vector2.new(1, 1),
								Position = if p0.textError then UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1)
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
							text = var12.cancelButtonText
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = onSave, text = var12.saveButtonText }
					}
				},
				forcedFillDirection = Enum.FillDirection.Horizontal
			}
		})
	}) else reactModule.createElement(interactiveAlert, {
		title = p0.title,
		screenSize = p0.screenSize,
		anchorPoint = Vector2.new(0.5, 0),
		position = UDim2.new(0.5, 0, 0, 44),
		middleContent = function() --[[ line: 247 ]]
			-- upvalues: reactModule (copy), font (ref), p0 (ref), theme (ref), imageSetLabel (copy), images (copy), callbackInputBox (copy), var14 (ref), var12 (ref), textChanged (ref), var8 (ref), fFlagDescriptionModalThrottleErrorModule (copy), var11 (ref)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				InputGroup = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.fromScale(1, 1),
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
						TextXAlignment = Enum.TextXAlignment.Center,
						Font = font.Body.Font,
						Text = p0.description,
						TextColor3 = theme.TextDefault.Color,
						AutomaticSize = Enum.AutomaticSize.XY
					}),
					Padding = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 0, 24)
					}),
					InputBackground = reactModule.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, 144),
						Image = images["component_assets/circle_21"],
						ImageColor3 = theme.UIMuted.Color,
						ImageTransparency = theme.UIMuted.Transparency,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(8, 8, 9, 9)
					}, {
						InputBorder = reactModule.createElement(imageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Size = UDim2.new(1, 0, 0, 144),
							Image = images["component_assets/circle_21_stroke_1"],
							ImageColor3 = theme.Divider.Color,
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(8, 8, 9, 9)
						}, {
							Padding = reactModule.createElement("UIPadding", {
								PaddingLeft = UDim.new(0, 12),
								PaddingRight = UDim.new(0, 12),
								PaddingTop = UDim.new(0, 7)
							}),
							Textbox = reactModule.createElement(callbackInputBox, {
								captureFocusOnMount = true,
								multiLine = true,
								textWrapped = true,
								clearButtonDisabled = true,
								clearButtonSize = 0,
								inputTextXAlignment = Enum.TextXAlignment.Left,
								inputTextYAlignment = Enum.TextYAlignment.Top,
								inputTextColor3 = theme.TextDefault.Color,
								inputTextTransparency = theme.TextDefault.Transparency,
								inputTextSize = var14,
								initialInputText = p0.initialText,
								placeholderText = var12.saySomething,
								placeholderTextColor3 = theme.TextDefault.Color,
								textChangedCallback = textChanged,
								inputBoxRef = var8
							})
						})
					}),
					Counter = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 4,
						Size = UDim2.new(1, 0, 0, 22)
					}, {
						ThrottleError = if fFlagDescriptionModalThrottleErrorModule and p0.throttleError then reactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							TextXAlignment = 0,
							Position = UDim2.fromScale(0, 0.4),
							AutomaticSize = Enum.AutomaticSize.XY,
							Font = font.CaptionBody.Font,
							Text = p0.throttleErrorText,
							TextSize = font.BaseSize * font.CaptionBody.RelativeSize * 0.9,
							TextColor3 = theme.Alert.Color,
							TextTransparency = theme.Alert.Transparency
						}) else nil,
						reactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							TextWrapped = true,
							AutomaticSize = Enum.AutomaticSize.XY,
							Font = font.CaptionBody.Font,
							Text = if p0.textError then var12.pinLocked else string.format("%d/%d", var11, 1000),
							TextSize = font.BaseSize * font.CaptionBody.RelativeSize,
							TextColor3 = if var11 == 1000 or p0.textError then theme.Alert.Color else theme.TextMuted.Color,
							TextTransparency = if var11 == 1000 or p0.textError then theme.Alert.Transparency else theme.TextMuted.Transparency,
							AnchorPoint = if p0.textError then Vector2.new(0, 1) else Vector2.new(1, 1),
							Position = if p0.textError then UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1)
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
						text = var12.cancelButtonText
					}
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = { onActivated = onSave, text = var12.saveButtonText }
				}
			},
			forcedFillDirection = Enum.FillDirection.Horizontal
		}
	})
end