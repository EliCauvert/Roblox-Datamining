local parent = script:FindFirstAncestor("FriendsCalling").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local avatarPlaceholderModule = require(script.Parent.AvatarPlaceholder)
local buttonVariant = foundationModule.Enums.ButtonVariant
local headerBar = foundationModule.HeaderBar
local iconName = foundationModule.Enums.IconName
local iconButton = foundationModule.IconButton
local inputSize = foundationModule.Enums.InputSize
local text = foundationModule.Text
local view = foundationModule.View

local function noop() end

return function(p1)
	-- upvalues: reactModule (ref), view (ref), headerBar (ref), iconName (ref), text (ref), avatarPlaceholderModule (ref), iconButton (ref), noop (ref), inputSize (ref), buttonVariant (ref)
	return reactModule.createElement(view, {
		padding = { top = UDim.new(0, p1.topPadding) },
		tag = {
			["col size-full bg-surface-100"] = true,
			["stroke-standard stroke-default radius-large clip"] = p1.hasRoundedCorners
		}
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y",
			testId = "friends-calling-pip-drag-target",
			ref = p1.onDragInputTarget
		}, {
			Bar = reactModule.createElement(headerBar.Root, { hasBackground = false }, {
				Leading = reactModule.createElement(headerBar.Leading, nil, {
					Actions = reactModule.createElement(headerBar.Actions, {
						actions = {
							{
								id = "collapse",
								icon = iconName.TwoArrowsToCenter,
								onActivated = p1.onCollapse
							}
						}
					})
				}),
				Content = reactModule.createElement(headerBar.Content, nil, {
					Title = reactModule.createElement(view, { tag = "col align-x-center auto-xy" }, {
						Name = reactModule.createElement(text, {
							LayoutOrder = 1,
							Text = "Title",
							tag = "auto-xy text-title-large content-emphasis"
						}),
						Duration = reactModule.createElement(text, {
							LayoutOrder = 2,
							Text = "00:00",
							tag = "auto-xy text-body-small content-default"
						})
					})
				}),
				Trailing = reactModule.createElement(headerBar.Trailing, nil, {
					Spacer = reactModule.createElement(view, { tag = "size-1000-1000" })
				})
			})
		}),
		Body = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "fill size-full-0 padding-x-xlarge padding-bottom-xxlarge"
		}, {
			PlayerCard = reactModule.createElement(view, {
				tag = "data-testid=friends-calling-pip-player-card size-full stroke-standard stroke-default radius-large clip bg-surface-200"
			}, {
				Avatar = reactModule.createElement(view, {
					tag = "position-center-center anchor-center-center auto-xy"
				}, {
					Content = reactModule.createElement(avatarPlaceholderModule, { size = 96 })
				}),
				Status = reactModule.createElement(view, {
					tag = "col anchor-bottom-left auto-xy padding-medium",
					Position = UDim2.new(0, 0, 1, 0)
				}, {
					Name = reactModule.createElement(text, {
						LayoutOrder = 1,
						Text = "Name",
						tag = "auto-xy text-title-medium content-emphasis"
					}),
					State = reactModule.createElement(text, {
						LayoutOrder = 2,
						Text = "Ringing",
						tag = "auto-xy text-body-medium content-default"
					})
				})
			})
		}),
		Actions = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "align-x-center size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge"
		}, {
			Pill = reactModule.createElement(view, {
				tag = "row align-y-center gap-small auto-xy padding-medium radius-circle bg-over-media-200"
			}, {
				Speaker = reactModule.createElement(iconButton, {
					LayoutOrder = 1,
					isCircular = true,
					testId = "friends-calling-pip-speaker",
					icon = iconName.Speaker,
					onActivated = noop,
					size = inputSize.Large,
					variant = buttonVariant.Standard
				}),
				Microphone = reactModule.createElement(iconButton, {
					LayoutOrder = 2,
					isCircular = true,
					testId = "friends-calling-pip-microphone",
					icon = iconName.Microphone,
					onActivated = noop,
					size = inputSize.Large,
					variant = buttonVariant.Standard
				}),
				EndCall = reactModule.createElement(iconButton, {
					LayoutOrder = 3,
					isCircular = true,
					testId = "friends-calling-pip-end-call",
					icon = iconName.X,
					onActivated = noop,
					size = inputSize.Large,
					variant = buttonVariant.Alert
				})
			})
		})
	})
end