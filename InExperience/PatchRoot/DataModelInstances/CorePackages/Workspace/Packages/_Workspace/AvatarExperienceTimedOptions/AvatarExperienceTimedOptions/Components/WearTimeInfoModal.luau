local parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local modalWindow = require(parent.UIBlox).App.Dialog.Modal.ModalWindow
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local button = foundationModule.Button
local inputSize = foundationModule.Enums.InputSize
local iconName = foundationModule.Enums.IconName
local useTokens = foundationModule.Hooks.useTokens
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p0) --[[ line: 26 ]]
	-- upvalues: useTokens (ref), useLocalization (ref), useSelector (ref), reactModule (ref), modalWindow (ref), view (ref), icon (ref), iconName (ref), text (ref), button (ref), inputSize (ref)
	local var2 = useLocalization({
		modalTitle = "Feature.Durables.InfoModal.Title",
		modalDescription = "Feature.Durables.InfoModal.Description",
		actionOK = "CommonUI.Messages.Action.OK"
	})
	
	return reactModule.createElement(modalWindow, {
		isFullHeight = false,
		screenSize = useSelector(function(p1) --[[ line: 35 ]]
			return p1.ScreenSize
		end)
	}, {
		Body = reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-large col gap-large",
			BackgroundTransparency = 1
		}, {
			IconContainer = reactModule.createElement(view, {
				tag = "size-full-0 auto-y align-x-center margin-top-medium margin-bottom-medium",
				LayoutOrder = 0
			}, {
				InnerContainer = reactModule.createElement(view, {
					tag = "size-2000-2000 auto-xy",
					BackgroundTransparency = 1
				}, {
					RotatedSquare = reactModule.createElement(view, {
						tag = "size-full radius-small stroke-default stroke-thicker",
						BackgroundTransparency = 1,
						Rotation = 25,
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5)
					}, {
						IconWrapper = reactModule.createElement(view, { tag = "size-full", BackgroundTransparency = 1 }, {
							ClockIcon = reactModule.createElement(icon, {
								Rotation = -25,
								name = iconName.Clock,
								Position = UDim2.fromScale(0.5, 0.5),
								AnchorPoint = Vector2.new(0.5, 0.5),
								size = useTokens().Size.Size_600
							})
						})
					})
				})
			}),
			Title = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-align-x-left text-heading-medium",
				LayoutOrder = 1,
				Text = var2.modalTitle
			}),
			Description = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-wrap text-truncate-none text-align-x-left text-body-medium",
				RichText = true,
				LayoutOrder = 2,
				Text = var2.modalDescription
			}),
			CloseButton = reactModule.createElement(button, {
				LayoutOrder = 5,
				tag = "size-full-0 auto-y",
				testId = "theCloseButton",
				text = var2.actionOK,
				size = inputSize.Medium,
				width = UDim.new(1, 0),
				onActivated = p0.onClose
			})
		})
	})
end