local Parent = script:FindFirstAncestor("FriendsCalling").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local AvatarPlaceholderModule = require(script.Parent.AvatarPlaceholder)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local HeaderBar = FoundationModule.HeaderBar
local IconName = FoundationModule.Enums.IconName
local IconButton = FoundationModule.IconButton
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local View = FoundationModule.View

local function noop() --[[ Line: 19 ]] end

return function(p1) --[[ Line: 31 | Named "PlaceholderExpanded" ]]
	-- upvalues: ReactModule (copy), View (copy), HeaderBar (copy), IconName (copy), Text (copy), AvatarPlaceholderModule (copy), IconButton (copy), noop (copy), InputSize (copy), ButtonVariant (copy)
	return ReactModule.createElement(View, {
		padding = { top = UDim.new(0, p1.topPadding) },
		tag = {
			["col size-full bg-surface-100"] = true,
			["stroke-standard stroke-default radius-large clip"] = p1.hasRoundedCorners
		}
	}, {
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y",
			testId = "friends-calling-pip-drag-target",
			ref = p1.onDragInputTarget
		}, {
			Bar = ReactModule.createElement(HeaderBar.Root, { hasBackground = false }, {
				Leading = ReactModule.createElement(HeaderBar.Leading, nil, {
					Actions = ReactModule.createElement(HeaderBar.Actions, {
						actions = {
							{
								id = "collapse",
								icon = IconName.TwoArrowsToCenter,
								onActivated = p1.onCollapse
							}
						}
					})
				}),
				Content = ReactModule.createElement(HeaderBar.Content, nil, {
					Title = ReactModule.createElement(View, { tag = "col align-x-center auto-xy" }, {
						Name = ReactModule.createElement(Text, {
							LayoutOrder = 1,
							Text = "Title",
							tag = "auto-xy text-title-large content-emphasis"
						}),
						Duration = ReactModule.createElement(Text, {
							LayoutOrder = 2,
							Text = "00:00",
							tag = "auto-xy text-body-small content-default"
						})
					})
				}),
				Trailing = ReactModule.createElement(HeaderBar.Trailing, nil, {
					Spacer = ReactModule.createElement(View, { tag = "size-1000-1000" })
				})
			})
		}),
		Body = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "fill size-full-0 padding-x-xlarge padding-bottom-xxlarge"
		}, {
			PlayerCard = ReactModule.createElement(View, {
				tag = "data-testid=friends-calling-pip-player-card size-full stroke-standard stroke-default radius-large clip bg-surface-200"
			}, {
				Avatar = ReactModule.createElement(View, {
					tag = "position-center-center anchor-center-center auto-xy"
				}, {
					Content = ReactModule.createElement(AvatarPlaceholderModule, { size = 96 })
				}),
				Status = ReactModule.createElement(View, {
					tag = "col anchor-bottom-left auto-xy padding-medium",
					Position = UDim2.new(0, 0, 1, 0)
				}, {
					Name = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						Text = "Name",
						tag = "auto-xy text-title-medium content-emphasis"
					}),
					State = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						Text = "Ringing",
						tag = "auto-xy text-body-medium content-default"
					})
				})
			})
		}),
		Actions = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "align-x-center size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge"
		}, {
			Pill = ReactModule.createElement(View, {
				tag = "row align-y-center gap-small auto-xy padding-medium radius-circle bg-over-media-200"
			}, {
				Speaker = ReactModule.createElement(IconButton, {
					LayoutOrder = 1,
					isCircular = true,
					testId = "friends-calling-pip-speaker",
					icon = IconName.Speaker,
					onActivated = noop,
					size = InputSize.Large,
					variant = ButtonVariant.Standard
				}),
				Microphone = ReactModule.createElement(IconButton, {
					LayoutOrder = 2,
					isCircular = true,
					testId = "friends-calling-pip-microphone",
					icon = IconName.Microphone,
					onActivated = noop,
					size = InputSize.Large,
					variant = ButtonVariant.Standard
				}),
				EndCall = ReactModule.createElement(IconButton, {
					LayoutOrder = 3,
					isCircular = true,
					testId = "friends-calling-pip-end-call",
					icon = IconName.X,
					onActivated = noop,
					size = InputSize.Large,
					variant = ButtonVariant.Alert
				})
			})
		})
	})
end