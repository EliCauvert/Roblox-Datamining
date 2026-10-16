local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local LinkButton = UIBloxModule.App.Button.LinkButton
local TextField = UIBloxModule.App.Input.TextField
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local CryoModule = require(Parent.Cryo)
local UseOnScreenKeyboardHeightModule = require(AmpUpsell.Common.useOnScreenKeyboardHeight)
local GetFFlagEnableVPCUpsellFoundationDialogHardeningModule = require(AmpUpsell.Flags.GetFFlagEnableVPCUpsellFoundationDialogHardening)
local GetShouldUseFoundationUIVPCUpsellModule = require(AmpUpsell.Flags.GetShouldUseFoundationUIVPCUpsell)
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Text = FoundationModule.Text
local _UDim2 = UDim2.new(1, 0, 0, 0)

local function selectScreenSize(p1) --[[ Line: 44 ]]
	return p1.ScreenSize
end

return function(p1) --[[ Line: 48 | Named "VPCNewParentUpsell" ]]
	-- upvalues: UseSelectorFunction (copy), selectScreenSize (copy), UseOnScreenKeyboardHeightModule (copy), GetShouldUseFoundationUIVPCUpsellModule (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), CryoModule (copy), GetFFlagEnableVPCUpsellFoundationDialogHardeningModule (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), _UDim2 (copy), Text (copy), TextField (copy), LinkButton (copy), ButtonVariant (copy), StyledTextLabel (copy), InteractiveAlert (copy), ButtonType (copy)
	local OnCollectEmailAndSendRequestFunction = p1.onCollectEmailAndSendRequest
	local OnCancel = p1.onCancel
	local UseSelectorResult = UseSelectorFunction(selectScreenSize)
	local OnTextChange = p1.onTextChange
	local CanSendRequest = p1.canSendRequest
	local TextInput = p1.textInput
	local ErrorText = p1.errorText
	local OpenPrivacyPolicyLink = p1.openPrivacyPolicyLink
	local IsChildSubjectToParentalControls = p1.isChildSubjectToParentalControls
	local UseOnScreenKeyboardHeightModuleResult: number = UseOnScreenKeyboardHeightModule()
	local DisablePortal = if p1.disablePortal then p1.disablePortal else false
	local ShouldUseFoundationUIVPCUpsellModule = GetShouldUseFoundationUIVPCUpsellModule(if p1.isInExperienceEntry then p1.isInExperienceEntry else false)
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationResult = UseLocalizationFunction(CryoModule.Dictionary.join(p1.messageStrings, {
		directionsTextSubjectToParentalControls = {
			"Feature.Parents.Description.EnterParentEmailV4",
			lineBreak = "\n\n"
		},
		directionsTextNotSubjectToParentalControls = {
			"Feature.Parents.Description.EnterParentEmailWithoutParentalControl",
			lineBreak = "\n\n"
		},
		privacyPolicyFooter = {
			"Feature.Parents.Description.ParentalEmailFooter",
			linkStart = "",
			linkEnd = ""
		}
	}))
	local TitleText = UseLocalizationResult.titleText
	local ButtonText = UseLocalizationResult.buttonText
	local Formatted = ""
	Formatted = if IsChildSubjectToParentalControls then if ShouldUseFoundationUIVPCUpsellModule then string.format("%s\n\n%s\n", UseLocalizationResult.childInstructions, UseLocalizationResult.parentInstructionsPC) else string.format("%s\n", UseLocalizationResult.directionsTextSubjectToParentalControls) elseif ShouldUseFoundationUIVPCUpsellModule then string.format("%s\n\n%s\n", UseLocalizationResult.childInstructions, UseLocalizationResult.parentInstructionsNoPC) else string.format("%s\n", UseLocalizationResult.directionsTextNotSubjectToParentalControls)
	local TextFieldHeaderText = UseLocalizationResult.textFieldHeaderText
	
	return if ShouldUseFoundationUIVPCUpsellModule then if GetFFlagEnableVPCUpsellFoundationDialogHardeningModule() then ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		size = DialogSize.Large,
		onClose = OnCancel,
		disablePortal = DisablePortal
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = TitleText }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Frame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = _UDim2,
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				HeaderText = ReactModule.createElement(Dialog.Text, { LayoutOrder = 1, Text = Formatted }),
				TextboxFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = _UDim2,
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						Padding = UDim.new(0, 10)
					}),
					TextFieldHeader = ReactModule.createElement(Text, {
						tag = "size-full-0 auto-y text-title-large text-wrap text-align-x-left",
						LayoutOrder = 0,
						Text = TextFieldHeaderText
					}),
					TextField = ReactModule.createElement(TextField, {
						required = true,
						layoutOrder = 1,
						text = TextInput,
						placeholder = UseLocalizationResult.emailPlaceholder,
						hint = ErrorText,
						error = not (ErrorText == ""),
						onChange = OnTextChange,
						width = UDim.new(1, 0)
					})
				}),
				DisclaimerFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = _UDim2,
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Top
					}),
					Disclaimer = ReactModule.createElement(Text, {
						tag = "size-full-0 auto-y text-caption-medium text-wrap text-align-x-left",
						LayoutOrder = 1,
						Text = UseLocalizationResult.privacyPolicyFooter
					}),
					PrivacyPolicy = ReactModule.createElement(LinkButton, {
						layoutOrder = 2,
						fontStyle = "Footer",
						underlineAlwaysEnabled = false,
						text = UseLocalizationResult.privacyLinkText,
						onActivated = OpenPrivacyPolicyLink
					})
				})
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = ButtonText,
					variant = ButtonVariant.Standard,
					onActivated = function() --[[ Line: 187 ]]
						-- upvalues: OnCollectEmailAndSendRequestFunction (copy), TextInput (copy)
						OnCollectEmailAndSendRequestFunction(TextInput)
					end,
					isDisabled = not CanSendRequest
				}
			}
		})
	}) else ReactModule.createElement(Dialog.Root, {
		size = DialogSize.Large,
		onClose = OnCancel,
		disablePortal = DisablePortal
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = TitleText }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Frame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				HeaderText = ReactModule.createElement(StyledTextLabel, {
					textWrapped = true,
					layoutOrder = 1,
					lineHeight = 1,
					text = Formatted,
					fontStyle = UseStyleResult.Font.CaptionHeader,
					colorStyle = UseStyleResult.Theme.TextDefault,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Top,
					automaticSize = Enum.AutomaticSize.XY
				}),
				TextboxFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						Padding = UDim.new(0, 10)
					}),
					TextFieldHeader = ReactModule.createElement(StyledTextLabel, {
						textWrapped = true,
						layoutOrder = 0,
						text = TextFieldHeaderText,
						fontStyle = UseStyleResult.Font.Header2,
						colorStyle = UseStyleResult.Theme.TextDefault,
						automaticSize = Enum.AutomaticSize.XY
					}),
					TextField = ReactModule.createElement(TextField, {
						required = true,
						layoutOrder = 1,
						text = TextInput,
						placeholder = UseLocalizationResult.emailPlaceholder,
						hint = ErrorText,
						error = not (ErrorText == ""),
						onChange = OnTextChange,
						width = UDim.new(1, 0)
					})
				}),
				DisclaimerFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Top
					}),
					Disclaimer = ReactModule.createElement(StyledTextLabel, {
						textWrapped = true,
						layoutOrder = 1,
						lineHeight = 1,
						text = UseLocalizationResult.privacyPolicyFooter,
						fontStyle = UseStyleResult.Font.Footer,
						colorStyle = UseStyleResult.Theme.TextDefault,
						textXAlignment = Enum.TextXAlignment.Left,
						automaticSize = Enum.AutomaticSize.XY
					}),
					PrivacyPolicy = ReactModule.createElement(LinkButton, {
						layoutOrder = 2,
						fontStyle = "Footer",
						underlineAlwaysEnabled = false,
						text = UseLocalizationResult.privacyLinkText,
						onActivated = OpenPrivacyPolicyLink
					})
				})
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = ButtonText,
					variant = ButtonVariant.Standard,
					onActivated = function() --[[ Line: 301 ]]
						-- upvalues: OnCollectEmailAndSendRequestFunction (copy), TextInput (copy)
						OnCollectEmailAndSendRequestFunction(TextInput)
					end,
					isDisabled = not CanSendRequest
				}
			}
		})
	}) else ReactModule.createElement(InteractiveAlert, {
		bottomPadding = 0,
		title = TitleText,
		screenSize = UseSelectorResult,
		position = UseOnScreenKeyboardHeightModuleResult > 0 and UDim2.new(0.5, 0, 1, -UseOnScreenKeyboardHeightModuleResult * 0.8) or UDim2.fromScale(0.5, 0.5),
		anchorPoint = UseOnScreenKeyboardHeightModuleResult > 0 and Vector2.new(0.5, 1) or nil,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = function() --[[ Line: 321 ]]
							-- upvalues: OnCollectEmailAndSendRequestFunction (copy), TextInput (copy)
							OnCollectEmailAndSendRequestFunction(TextInput)
						end,
						text = ButtonText,
						isDisabled = not CanSendRequest
					}
				}
			}
		},
		onCloseClicked = OnCancel,
		middleContent = function() --[[ Line: 332 ]]
			-- upvalues: ReactModule (upval), StyledTextLabel (upval), Formatted (ref), UseStyleResult (copy), TextFieldHeaderText (copy), TextField (upval), TextInput (copy), UseLocalizationResult (copy), ErrorText (copy), OnTextChange (copy), LinkButton (upval), OpenPrivacyPolicyLink (copy)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				HeaderText = ReactModule.createElement(StyledTextLabel, {
					textWrapped = true,
					layoutOrder = 1,
					text = Formatted,
					fontStyle = UseStyleResult.Font.CaptionHeader,
					colorStyle = UseStyleResult.Theme.TextDefault,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Top,
					automaticSize = Enum.AutomaticSize.XY
				}),
				TextboxFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						Padding = UDim.new(0, 10)
					}),
					TextFieldHeader = ReactModule.createElement(StyledTextLabel, {
						textWrapped = true,
						layoutOrder = 0,
						text = TextFieldHeaderText,
						fontStyle = UseStyleResult.Font.Header2,
						colorStyle = UseStyleResult.Theme.TextDefault,
						automaticSize = Enum.AutomaticSize.XY
					}),
					TextField = ReactModule.createElement(TextField, {
						required = true,
						layoutOrder = 1,
						text = TextInput,
						placeholder = UseLocalizationResult.emailPlaceholder,
						hint = ErrorText,
						error = not (ErrorText == ""),
						onChange = OnTextChange,
						width = UDim.new(1, 0)
					})
				}),
				DisclaimerFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Top
					}),
					Disclaimer = ReactModule.createElement(StyledTextLabel, {
						textWrapped = true,
						layoutOrder = 1,
						text = UseLocalizationResult.privacyPolicyFooter,
						fontStyle = UseStyleResult.Font.Footer,
						colorStyle = UseStyleResult.Theme.TextDefault,
						textXAlignment = Enum.TextXAlignment.Left,
						automaticSize = Enum.AutomaticSize.XY
					}),
					PrivacyPolicy = ReactModule.createElement(LinkButton, {
						layoutOrder = 2,
						fontStyle = "Footer",
						underlineAlwaysEnabled = false,
						text = UseLocalizationResult.privacyLinkText,
						onActivated = OpenPrivacyPolicyLink
					})
				})
			})
		end
	})
end