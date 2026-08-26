local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local linkButton = UIBloxModule.App.Button.LinkButton
local textField = UIBloxModule.App.Input.TextField
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local cryoModule = require(parent.Cryo)
local useOnScreenKeyboardHeightModule = require(ampUpsell.Common.useOnScreenKeyboardHeight)
local getFFlagEnableVPCUpsellFoundationDialogHardeningModule = require(ampUpsell.Flags.GetFFlagEnableVPCUpsellFoundationDialogHardening)
local getShouldUseFoundationUIVPCUpsellModule = require(ampUpsell.Flags.GetShouldUseFoundationUIVPCUpsell)
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local text = foundationModule.Text
local uDim2 = UDim2.new(1, 0, 0, 0)

local function selectScreenSize(p1)
	return p1.ScreenSize
end

return function(p1)
	-- upvalues: useSelector (ref), selectScreenSize (ref), useOnScreenKeyboardHeightModule (ref), getShouldUseFoundationUIVPCUpsellModule (ref), useStyle (ref), useLocalization (ref), cryoModule (ref), getFFlagEnableVPCUpsellFoundationDialogHardeningModule (ref), reactModule (ref), dialog (ref), dialogSize (ref), uDim2 (ref), text (ref), textField (ref), linkButton (ref), buttonVariant (ref), styledTextLabel (ref), interactiveAlert (ref), buttonType (ref)
	local onCollectEmailAndSendRequest = p1.onCollectEmailAndSendRequest
	local onCancel = p1.onCancel
	local var1 = useSelector(selectScreenSize)
	local onTextChange = p1.onTextChange
	local canSendRequest = p1.canSendRequest
	local textInput = p1.textInput
	local errorText = p1.errorText
	local openPrivacyPolicyLink = p1.openPrivacyPolicyLink
	local isChildSubjectToParentalControls = p1.isChildSubjectToParentalControls
	local var2 = useOnScreenKeyboardHeightModule()
	local var3 = if p1.disablePortal then p1.disablePortal else false
	local var4 = getShouldUseFoundationUIVPCUpsellModule(if p1.isInExperienceEntry then p1.isInExperienceEntry else false)
	local var5 = useStyle()
	local var6 = useLocalization(cryoModule.Dictionary.join(p1.messageStrings, {
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
	local titleText = var6.titleText
	local buttonText = var6.buttonText
	local var7 = if isChildSubjectToParentalControls then if var4 then string.format("%s\n\n%s\n", var6.childInstructions, var6.parentInstructionsPC) else string.format("%s\n", var6.directionsTextSubjectToParentalControls) elseif var4 then string.format("%s\n\n%s\n", var6.childInstructions, var6.parentInstructionsNoPC) else string.format("%s\n", var6.directionsTextNotSubjectToParentalControls)
	local textFieldHeaderText = var6.textFieldHeaderText
	
	return if var4 then if getFFlagEnableVPCUpsellFoundationDialogHardeningModule() then reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		size = dialogSize.Large,
		onClose = onCancel,
		disablePortal = var3
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = titleText }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Frame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = uDim2,
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				HeaderText = reactModule.createElement(dialog.Text, { LayoutOrder = 1, Text = var7 }),
				TextboxFrame = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = uDim2,
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIListLayout = reactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						Padding = UDim.new(0, 10)
					}),
					TextFieldHeader = reactModule.createElement(text, {
						tag = "size-full-0 auto-y text-title-large text-wrap text-align-x-left",
						LayoutOrder = 0,
						Text = textFieldHeaderText
					}),
					TextField = reactModule.createElement(textField, {
						required = true,
						layoutOrder = 1,
						text = textInput,
						placeholder = var6.emailPlaceholder,
						hint = errorText,
						error = not (errorText == ""),
						onChange = onTextChange,
						width = UDim.new(1, 0)
					})
				}),
				DisclaimerFrame = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = uDim2,
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIListLayout = reactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Top
					}),
					Disclaimer = reactModule.createElement(text, {
						tag = "size-full-0 auto-y text-caption-medium text-wrap text-align-x-left",
						LayoutOrder = 1,
						Text = var6.privacyPolicyFooter
					}),
					PrivacyPolicy = reactModule.createElement(linkButton, {
						layoutOrder = 2,
						fontStyle = "Footer",
						underlineAlwaysEnabled = false,
						text = var6.privacyLinkText,
						onActivated = openPrivacyPolicyLink
					})
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = buttonText,
					variant = buttonVariant.Standard,
					onActivated = function()
						-- upvalues: onCollectEmailAndSendRequest (ref), textInput (ref)
						onCollectEmailAndSendRequest(textInput)
					end,
					isDisabled = not canSendRequest
				}
			}
		})
	}) else reactModule.createElement(dialog.Root, {
		size = dialogSize.Large,
		onClose = onCancel,
		disablePortal = var3
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = titleText }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Frame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				HeaderText = reactModule.createElement(styledTextLabel, {
					textWrapped = true,
					layoutOrder = 1,
					lineHeight = 1,
					text = var7,
					fontStyle = var5.Font.CaptionHeader,
					colorStyle = var5.Theme.TextDefault,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Top,
					automaticSize = Enum.AutomaticSize.XY
				}),
				TextboxFrame = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIListLayout = reactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						Padding = UDim.new(0, 10)
					}),
					TextFieldHeader = reactModule.createElement(styledTextLabel, {
						textWrapped = true,
						layoutOrder = 0,
						text = textFieldHeaderText,
						fontStyle = var5.Font.Header2,
						colorStyle = var5.Theme.TextDefault,
						automaticSize = Enum.AutomaticSize.XY
					}),
					TextField = reactModule.createElement(textField, {
						required = true,
						layoutOrder = 1,
						text = textInput,
						placeholder = var6.emailPlaceholder,
						hint = errorText,
						error = not (errorText == ""),
						onChange = onTextChange,
						width = UDim.new(1, 0)
					})
				}),
				DisclaimerFrame = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIListLayout = reactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Top
					}),
					Disclaimer = reactModule.createElement(styledTextLabel, {
						textWrapped = true,
						layoutOrder = 1,
						lineHeight = 1,
						text = var6.privacyPolicyFooter,
						fontStyle = var5.Font.Footer,
						colorStyle = var5.Theme.TextDefault,
						textXAlignment = Enum.TextXAlignment.Left,
						automaticSize = Enum.AutomaticSize.XY
					}),
					PrivacyPolicy = reactModule.createElement(linkButton, {
						layoutOrder = 2,
						fontStyle = "Footer",
						underlineAlwaysEnabled = false,
						text = var6.privacyLinkText,
						onActivated = openPrivacyPolicyLink
					})
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = buttonText,
					variant = buttonVariant.Standard,
					onActivated = function()
						-- upvalues: onCollectEmailAndSendRequest (ref), textInput (ref)
						onCollectEmailAndSendRequest(textInput)
					end,
					isDisabled = not canSendRequest
				}
			}
		})
	}) else reactModule.createElement(interactiveAlert, {
		bottomPadding = 0,
		title = titleText,
		screenSize = var1,
		position = var2 > 0 and UDim2.new(0.5, 0, 1, -var2 * 0.8) or UDim2.fromScale(0.5, 0.5),
		anchorPoint = var2 > 0 and Vector2.new(0.5, 1) or nil,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = function()
							-- upvalues: onCollectEmailAndSendRequest (ref), textInput (ref)
							onCollectEmailAndSendRequest(textInput)
						end,
						text = buttonText,
						isDisabled = not canSendRequest
					}
				}
			}
		},
		onCloseClicked = onCancel,
		middleContent = function()
			-- upvalues: reactModule (copy), styledTextLabel (copy), var7 (write), var5 (ref), textFieldHeaderText (ref), textField (copy), textInput (ref), var6 (ref), errorText (ref), onTextChange (ref), linkButton (copy), openPrivacyPolicyLink (ref)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top
				}),
				HeaderText = reactModule.createElement(styledTextLabel, {
					textWrapped = true,
					layoutOrder = 1,
					text = var7,
					fontStyle = var5.Font.CaptionHeader,
					colorStyle = var5.Theme.TextDefault,
					textXAlignment = Enum.TextXAlignment.Left,
					textYAlignment = Enum.TextYAlignment.Top,
					automaticSize = Enum.AutomaticSize.XY
				}),
				TextboxFrame = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIListLayout = reactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						Padding = UDim.new(0, 10)
					}),
					TextFieldHeader = reactModule.createElement(styledTextLabel, {
						textWrapped = true,
						layoutOrder = 0,
						text = textFieldHeaderText,
						fontStyle = var5.Font.Header2,
						colorStyle = var5.Theme.TextDefault,
						automaticSize = Enum.AutomaticSize.XY
					}),
					TextField = reactModule.createElement(textField, {
						required = true,
						layoutOrder = 1,
						text = textInput,
						placeholder = var6.emailPlaceholder,
						hint = errorText,
						error = not (errorText == ""),
						onChange = onTextChange,
						width = UDim.new(1, 0)
					})
				}),
				DisclaimerFrame = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIListLayout = reactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Top
					}),
					Disclaimer = reactModule.createElement(styledTextLabel, {
						textWrapped = true,
						layoutOrder = 1,
						text = var6.privacyPolicyFooter,
						fontStyle = var5.Font.Footer,
						colorStyle = var5.Theme.TextDefault,
						textXAlignment = Enum.TextXAlignment.Left,
						automaticSize = Enum.AutomaticSize.XY
					}),
					PrivacyPolicy = reactModule.createElement(linkButton, {
						layoutOrder = 2,
						fontStyle = "Footer",
						underlineAlwaysEnabled = false,
						text = var6.privacyLinkText,
						onActivated = openPrivacyPolicyLink
					})
				})
			})
		end
	})
end