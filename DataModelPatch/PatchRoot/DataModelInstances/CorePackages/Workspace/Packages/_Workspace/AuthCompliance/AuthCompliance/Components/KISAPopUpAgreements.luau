local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local AnalyticsEventsModule = require(Parent.Analytics.AnalyticsEvents)
local EventConstantsModule = require(Parent.Analytics.EventConstants)
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local Foundation = DependenciesModule.Foundation
local FFlagKISAUserAgreementsRedesign = DependenciesModule.SharedFlags.FFlagKISAUserAgreementsRedesign
local Checkbox = Foundation.Checkbox
local Button = Foundation.Button
local Text = Foundation.Text
local ButtonVariant = Foundation.Enums.ButtonVariant
local InputSize = Foundation.Enums.InputSize
local UseLocalizationFunction = DependenciesModule.Localization.Hooks.useLocalization
local FormFactor = require(Parent.Parent.FormFactor).Enums.FormFactor
local FitFrame = DependenciesModule.FitFrame
local UseDesignTokensFunction = DependenciesModule.Style.useDesignTokens
local CloseCentralOverlayFunction = DependenciesModule.CentralOverlay.Thunks.CloseCentralOverlay
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local UseStateFunction = React.useState
local UseStyleFunction = UIBlox.Core.Style.useStyle
local Button1 = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local IconButton = UIBlox.App.Button.IconButton
local Images = UIBlox.App.ImageSet.Images
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local UserAgreementsList = DependenciesModule.UserAgreements.UserAgreementsList
local KISAComplianceUtilsModule = require(Parent.KISAComplianceUtils)
local _Rect = Rect.new(8, 8, 9, 9)

return (DependenciesModule.RoactRodux.connect(function(p1)
	return { screenSize = p1.ScreenSize, formFactor = p1.FormFactor }
end, function(Callback)
	-- upvalues: CloseCentralOverlayFunction (copy)
	return {
		closeCentralOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayFunction (upval)
			return Callback(CloseCentralOverlayFunction())
		end
	}
end)(function(p1)
	-- upvalues: UseStyleFunction (copy), FormFactor (copy), UseDesignTokensFunction (copy), UseLocalizationFunction (copy), UseStateFunction (copy), KISAComplianceUtilsModule (copy), ImageSetLabel (copy), _Rect (copy), EventConstantsModule (copy), AnalyticsEventsModule (copy), React (copy), IconButton (copy), Images (copy), FFlagKISAUserAgreementsRedesign (copy), Text (copy), StyledTextLabel (copy), Checkbox (copy), UserAgreementsList (copy), FitFrame (copy), Button (copy), ButtonVariant (copy), InputSize (copy), Button1 (copy), ButtonType (copy)
	p1.isUnderAgeFlow = p1.isUnderAgeFlow or false
	local ScreenSize = p1.screenSize
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local IsTextMatch = tostring(p1.formFactor) == tostring(FormFactor.WIDE)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local AuthCompliance = UseDesignTokensResult.LuaApps.AuthCompliance
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Authentication.OneTimePasscode.Label.ConsentNeeded",
		message = "CommonUI.UserAgreements.Popup.KISAMessage",
		agreeButton = "CommonUI.UserAgreements.Popup.Agree2",
		checkbox = "CommonUI.UserAgreements.Popup.CheckboxMessage",
		errorMessage = "CommonUI.UserAgreements.Popup.FailAndRetryMessage",
		underAgeFlowTitle = "Authentication.OneTimePasscode.Label.ParentConsentNeeded",
		underAgeFlowMessage = "Authentication.OneTimePasscode.Description.ReviewAndConsentToTerms"
	})
	local UseStateResult, UseStateResult2 = UseStateFunction({})
	local UseStateResult1, UseStateResult2_1 = UseStateFunction({})
	
	if p1.agreements ~= UseStateResult1 then
		UseStateResult2_1(p1.agreements)
		local t = {}
		
		for _, agreement in pairs(p1.agreements) do
			t[agreement.id] = false
		end
		UseStateResult2(t)
	end
	local CheckBoxStatusVariables, CheckBoxStatusVariables2, CheckBoxStatusVariables3 = KISAComplianceUtilsModule.getCheckBoxStatusVariables(UseStateResult, p1.agreements)
	local NoCheckBoxStatusVariables = not CheckBoxStatusVariables
	local v1, v2 = (function(p2, p3)
		-- upvalues: ImageSetLabel (upval), _Rect (upval)
		if p2 then
			return ImageSetLabel, {
				Image = "LuaApp/buttons/buttonFill",
				BorderSizePixel = 0,
				Size = UDim2.new(0, 540, 0, 0),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = p3.BackgroundUIDefault.Color,
				ImageColor3 = p3.BackgroundUIDefault.Color,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = _Rect,
				AutomaticSize = Enum.AutomaticSize.Y
			}
		else
			return "Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = p3.BackgroundUIDefault.Color
			}
		end
	end)(IsTextMatch, Theme)
	
	local function v43(p2)
		-- upvalues: EventConstantsModule (upval), AnalyticsEventsModule (upval), UseStateResult (copy), UseStateResult2 (copy)
		AnalyticsEventsModule.sendButtonClickEvent(EventConstantsModule.ctx.kisaAgreements, EventConstantsModule.origin.signup, if p2 then EventConstantsModule.btn.agreeAllCheckboxes else EventConstantsModule.btn.disagreeAllCheckboxes)
		local t = {}
		
		for i, _ in pairs(UseStateResult) do
			t[i] = p2
		end
		UseStateResult2(t)
	end
	
	local function _(p3)
		-- upvalues: p1 (copy)
		p1.onAgreeFunction(p3)
		p1.closeCentralOverlay()
	end
	
	return React.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, ScreenSize.Y)
	}, {
		Layout = React.createElement(v1, v2, {
			ListLayout = IsTextMatch and React.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Padding = React.createElement("UIPadding", {
				PaddingTop = UDim.new(0, AuthCompliance.paddingTop),
				PaddingBottom = UDim.new(0, AuthCompliance.paddingBottom)
			}),
			Content = React.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, ScreenSize.Y - 150)
			}, {
				Layout = React.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
				Title = React.createElement("Frame", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					AreaAboveFirstDivider = React.createElement("Frame", {
						LayoutOrder = 1,
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, 0, 0, 0)
					}, {
						ListLayout = React.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						Padding = React.createElement("UIPadding", { PaddingLeft = UDim.new(0, AuthCompliance.paddingLeft) }),
						CrossXButton = React.createElement(IconButton, {
							layoutOrder = 1,
							anchorPoint = Vector2.new(0.5, 0.5),
							size = UDim2.new(0, tonumber(AuthCompliance.xButtonSize), 0, (tonumber(AuthCompliance.xButtonSize))),
							position = UDim2.new(0, 0, 0, 0),
							icon = Images["icons/navigation/close"],
							onActivated = function()
								-- upvalues: p1 (copy)
								if p1.onAbandonFunction then
									p1.onAbandonFunction()
								end
								p1.closeCentralOverlay()
							end
						}),
						TitleText = if FFlagKISAUserAgreementsRedesign then React.createElement(Text, {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							tag = "text-heading-small text-align-x-center text-align-y-center content-emphasis",
							Size = UDim2.new(0.75, 0, 0, AuthCompliance.xButtonSize),
							Text = if p1.isUnderAgeFlow then UseLocalizationResult.underAgeFlowTitle else UseLocalizationResult.title,
							TextTruncate = Enum.TextTruncate.AtEnd
						}) else React.createElement(StyledTextLabel, {
							layoutOrder = 2,
							size = UDim2.new(0.75, 0, 0, AuthCompliance.xButtonSize),
							text = if p1.isUnderAgeFlow then UseLocalizationResult.underAgeFlowTitle else UseLocalizationResult.title,
							fontStyle = UseStyleResultFont.Header1,
							colorStyle = Theme.TextEmphasis,
							textXAlignment = Enum.TextXAlignment.Center,
							textYAlignment = Enum.TextYAlignment.Center,
							textTruncate = Enum.TextTruncate.AtEnd
						})
					}),
					FirstDivider = React.createElement("Frame", {
						LayoutOrder = 2,
						BorderSizePixel = 0,
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, 0, 0, 0)
					}, {
						Padding = React.createElement("UIPadding", {
							PaddingTop = UDim.new(0, AuthCompliance.dividerPaddingTop),
							PaddingRight = if FFlagKISAUserAgreementsRedesign then UDim.new(0, 0) else UDim.new(0, AuthCompliance.paddingRight),
							PaddingLeft = if FFlagKISAUserAgreementsRedesign then UDim.new(0, 0) else UDim.new(0, AuthCompliance.paddingLeft)
						}),
						Divider = React.createElement("Frame", {
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, 1),
							AnchorPoint = Vector2.new(0, 0),
							BackgroundColor3 = if FFlagKISAUserAgreementsRedesign then UseDesignTokensResult.Color.Stroke.Default.Color3 else UseDesignTokensResult.Color.Shift.Shift_200.Color3,
							BackgroundTransparency = if FFlagKISAUserAgreementsRedesign then UseDesignTokensResult.Color.Stroke.Default.Transparency else 0
						})
					})
				}),
				Message = React.createElement("Frame", {
					LayoutOrder = 2,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					Padding = React.createElement("UIPadding", {
						PaddingTop = UDim.new(0, if IsTextMatch then AuthCompliance.messagePaddingTopWideViewExtended else AuthCompliance.messagePaddingTopExtended),
						PaddingRight = UDim.new(0, AuthCompliance.paddingRight),
						PaddingBottom = UDim.new(0, if IsTextMatch then AuthCompliance.messagePaddingBottomWideView else AuthCompliance.messagePaddingBottomReduced),
						PaddingLeft = UDim.new(0, AuthCompliance.paddingLeft)
					}),
					MessageText = React.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Text = if p1.isUnderAgeFlow then UseLocalizationResult.underAgeFlowMessage else UseLocalizationResult.message,
						TextSize = if FFlagKISAUserAgreementsRedesign then UseDesignTokensResult.Typography.BodyMedium.FontSize else AuthCompliance.messageSize,
						TextColor3 = UseDesignTokensResult.Color.Content.Emphasis.Color3,
						TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
						Font = if FFlagKISAUserAgreementsRedesign then UseDesignTokensResult.Typography.BodyMedium.Font else UseStyleResult.Font.Body.Font,
						TextXAlignment = Enum.TextXAlignment.Left,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, 0, 0, 0)
					})
				}),
				AgreementsContainer = React.createElement("Frame", {
					LayoutOrder = 3,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					Padding = React.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 0),
						PaddingRight = UDim.new(0, AuthCompliance.paddingRight),
						PaddingBottom = UDim.new(0, AuthCompliance.checkboxPaddingBottom),
						PaddingLeft = UDim.new(0, AuthCompliance.paddingLeft)
					}),
					CheckBox = React.createElement(Checkbox, {
						label = "",
						isChecked = CheckBoxStatusVariables3,
						onActivated = function()
							-- upvalues: v43 (copy), CheckBoxStatusVariables3 (copy)
							v43(not CheckBoxStatusVariables3)
						end
					}),
					MessageButton = React.createElement("TextButton", {
						Size = UDim2.new(1, -((tonumber(AuthCompliance.checkboxSize) or 0) + (tonumber(AuthCompliance.checkboxPadding) or 0)), 1, 0),
						Position = UDim2.new(0, (tonumber(AuthCompliance.checkboxSize) or 0) + (tonumber(AuthCompliance.checkboxPadding) or 0), 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundTransparency = 1,
						Text = UseLocalizationResult.checkbox,
						Font = if FFlagKISAUserAgreementsRedesign then UseDesignTokensResult.Typography.BodyMedium.Font else UseStyleResultFont.Body.Font,
						TextSize = if FFlagKISAUserAgreementsRedesign then UseDesignTokensResult.Typography.BodyMedium.FontSize else AuthCompliance.messageSize,
						TextColor3 = if FFlagKISAUserAgreementsRedesign then Theme.TextEmphasis.Color else Theme.TextMuted.Color,
						TextTransparency = if FFlagKISAUserAgreementsRedesign then Theme.TextEmphasis.Transparency else Theme.TextMuted.Transparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextWrapped = true,
						[React.Event.Activated] = nil
					})
				}),
				SecondDivider = React.createElement("Frame", {
					LayoutOrder = 4,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					Padding = React.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 0),
						PaddingRight = UDim.new(0, AuthCompliance.paddingRight),
						PaddingBottom = UDim.new(0, 0),
						PaddingLeft = UDim.new(0, AuthCompliance.paddingLeft)
					}),
					Divider = React.createElement("Frame", {
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 0, 1),
						AnchorPoint = Vector2.new(0, 0),
						BackgroundColor3 = if FFlagKISAUserAgreementsRedesign then UseDesignTokensResult.Color.Stroke.Default.Color3 else UseDesignTokensResult.Color.Shift.Shift_200.Color3,
						BackgroundTransparency = if FFlagKISAUserAgreementsRedesign then UseDesignTokensResult.Color.Stroke.Default.Transparency else 0
					})
				}),
				AgreementsList = React.createElement(UserAgreementsList, {
					LayoutOrder = 5,
					verticalSpaceOffset = 300,
					useScrollableFrame = true,
					agreements = p1.agreements,
					checkBoxStates = UseStateResult,
					setCheckBoxStates = function(p3, p4, p5)
						-- upvalues: EventConstantsModule (upval), AnalyticsEventsModule (upval), UseStateResult2 (copy)
						AnalyticsEventsModule.sendFormInteractionEvent(EventConstantsModule.ctx.kisaCheckbox, p4, if p5 then EventConstantsModule.btn.checked else EventConstantsModule.btn.unchecked)
						UseStateResult2(p3)
					end,
					separateRequiredOptional = CheckBoxStatusVariables2,
					margin = FitFrame.Rect.quad(AuthCompliance.paddingTop, AuthCompliance.paddingRight, AuthCompliance.listPaddingBottom, AuthCompliance.paddingLeft),
					isAgreeAllChecked = CheckBoxStatusVariables3
				})
			}),
			AgreeZone = React.createElement("Frame", {
				LayoutOrder = 2,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				Position = UDim2.new(0.5, 0, 1, -AuthCompliance.agreeButtonPaddingBottom),
				AnchorPoint = Vector2.new(0.5, 1)
			}, {
				Padding = React.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 0),
					PaddingRight = UDim.new(0, AuthCompliance.paddingRight),
					PaddingBottom = UDim.new(0, AuthCompliance.agreeButtonPaddingBottom),
					PaddingLeft = UDim.new(0, AuthCompliance.paddingLeft)
				}),
				React.createElement(FitFrame.FitFrameVertical, { BackgroundTransparency = 1, width = UDim.new(1, 0) }, {
					ErrorLabel = nil,
					AgreeButton = if FFlagKISAUserAgreementsRedesign then React.createElement(Button, {
						LayoutOrder = 2,
						variant = if NoCheckBoxStatusVariables then ButtonVariant.Standard else ButtonVariant.Emphasis,
						size = InputSize.Large,
						width = UDim.new(1, 0),
						isDisabled = NoCheckBoxStatusVariables,
						text = UseLocalizationResult.agreeButton,
						onActivated = function()
							-- upvalues: UseStateResult (copy), p1 (copy)
							p1.onAgreeFunction(UseStateResult)
							p1.closeCentralOverlay()
						end
					}) else React.createElement(Button1, {
						layoutOrder = 2,
						buttonType = ButtonType.PrimarySystem,
						size = UDim2.new(1, 0, 0, AuthCompliance.agreeButtonHeight),
						anchorPoint = Vector2.new(0, 0),
						isDisabled = NoCheckBoxStatusVariables,
						text = UseLocalizationResult.agreeButton,
						fontStyle = UseStyleResultFont.SubHeader1,
						onActivated = function()
							-- upvalues: UseStateResult (copy), p1 (copy)
							p1.onAgreeFunction(UseStateResult)
							p1.closeCentralOverlay()
						end
					})
				})
			})
		})
	})
end))