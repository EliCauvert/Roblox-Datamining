local Parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ModalWindow = require(Parent.UIBlox).App.Dialog.Modal.ModalWindow
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local Button = FoundationModule.Button
local InputSize = FoundationModule.Enums.InputSize
local IconName = FoundationModule.Enums.IconName
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1) --[[ Line: 26 ]]
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), UseSelectorFunction (copy), ReactModule (copy), ModalWindow (copy), View (copy), Icon (copy), IconName (copy), Text (copy), Button (copy), InputSize (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		modalTitle = "Feature.Durables.InfoModal.Title",
		modalDescription = "Feature.Durables.InfoModal.Description",
		actionOK = "CommonUI.Messages.Action.OK"
	})
	
	return ReactModule.createElement(ModalWindow, {
		isFullHeight = false,
		screenSize = UseSelectorFunction(function(p2) --[[ Line: 35 ]]
			return p2.ScreenSize
		end)
	}, {
		Body = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y padding-large col gap-large",
			BackgroundTransparency = 1
		}, {
			IconContainer = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y align-x-center margin-top-medium margin-bottom-medium",
				LayoutOrder = 0
			}, {
				InnerContainer = ReactModule.createElement(View, {
					tag = "size-2000-2000 auto-xy",
					BackgroundTransparency = 1
				}, {
					RotatedSquare = ReactModule.createElement(View, {
						tag = "size-full radius-small stroke-default stroke-thicker",
						BackgroundTransparency = 1,
						Rotation = 25,
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5)
					}, {
						IconWrapper = ReactModule.createElement(View, { tag = "size-full", BackgroundTransparency = 1 }, {
							ClockIcon = ReactModule.createElement(Icon, {
								Rotation = -25,
								name = IconName.Clock,
								Position = UDim2.fromScale(0.5, 0.5),
								AnchorPoint = Vector2.new(0.5, 0.5),
								size = UseTokensResult.Size.Size_600
							})
						})
					})
				})
			}),
			Title = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-align-x-left text-heading-medium",
				LayoutOrder = 1,
				Text = UseLocalizationResult.modalTitle
			}),
			Description = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-wrap text-truncate-none text-align-x-left text-body-medium",
				RichText = true,
				LayoutOrder = 2,
				Text = UseLocalizationResult.modalDescription
			}),
			CloseButton = ReactModule.createElement(Button, {
				LayoutOrder = 5,
				tag = "size-full-0 auto-y",
				testId = "theCloseButton",
				text = UseLocalizationResult.actionOK,
				size = InputSize.Medium,
				width = UDim.new(1, 0),
				onActivated = p1.onClose
			})
		})
	})
end