local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local icon = foundationModule.Icon
local iconButton = foundationModule.IconButton
local image = foundationModule.Image
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize

local function formatTime(p1)
	local maxValue = math.max(0, math.floor(p1))
	
	return `{math.floor(maxValue / 60)}:{string.format("%02d", maxValue % 60)}`
end

return function(value)
	-- upvalues: reactModule (ref), view (ref), image (ref), icon (ref), iconName (ref), iconSize (ref), text (ref), formatTime (ref), iconButton (ref), inputSize (ref), buttonVariant (ref)
	local var1 = value.elapsed:map(function(p1)
		-- upvalues: value (ref)
		return if value.duration <= 0 then 0 else math.clamp(p1 / value.duration, 0, 1)
	end)
	
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-xxlarge size-full-0 auto-y",
		testId = "AssetLibrary.AudioPlayer",
		LayoutOrder = value.LayoutOrder
	}, {
		Song = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col align-x-center gap-medium auto-xy"
		}, {
			Artwork = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "align-x-center align-y-center radius-large clip bg-shift-200",
				Size = UDim2.fromOffset(168, 168)
			}, {
				Media = if value.thumbnail == nil or value.thumbnail == "" then reactModule.createElement(icon, {
					tag = "auto-xy content-emphasis",
					name = iconName.MusicNote,
					size = iconSize.XLarge
				}) else reactModule.createElement(image, {
					tag = "size-full",
					Image = value.thumbnail,
					ScaleType = Enum.ScaleType.Fit
				})
			}),
			Info = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "col align-x-center size-full-0 auto-y"
			}, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-center content-emphasis",
					Text = value.title
				}),
				Artist = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-large text-align-x-center text-truncate-end content-default",
					Text = value.artist
				})
			})
		}),
		Controls = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-center gap-medium size-full-0 auto-y"
		}, {
			Timeline = reactModule.createElement(view, {
				LayoutOrder = 1,
				testId = "AssetLibrary.AudioPlayer.Timeline",
				Size = UDim2.new(1, 0, 0, 36)
			}, {
				Track = reactModule.createElement(view, {
					tag = "radius-circle bg-shift-400",
					Position = UDim2.fromOffset(0, 4),
					Size = UDim2.new(1, 0, 0, 4)
				}, {
					Progress = reactModule.createElement(view, {
						tag = "radius-circle bg-action-emphasis",
						Size = var1:map(function(p1)
							return UDim2.new(p1, 0, 1, 0)
						end)
					}),
					Thumb = reactModule.createElement(view, {
						tag = "anchor-center-center radius-circle bg-action-emphasis",
						testId = "AssetLibrary.AudioPlayer.Timeline.Thumb",
						Position = var1:map(function(p1)
							return UDim2.new(p1, 0, 0.5, 0)
						end),
						Size = UDim2.fromOffset(16, 16)
					})
				}),
				Elapsed = reactModule.createElement(text, {
					tag = "auto-xy text-caption-large content-default",
					Position = UDim2.fromOffset(0, 14),
					Text = value.elapsed:map(formatTime)
				}),
				Remaining = reactModule.createElement(text, {
					tag = "anchor-top-right auto-xy text-caption-large content-default",
					Position = UDim2.new(1, 0, 0, 14),
					Text = value.elapsed:map(function(p1)
						-- upvalues: value (ref)
						local maxValue = math.max(0, math.floor(math.max(0, value.duration - p1)))
						
						return `-{`{math.floor(maxValue / 60)}:{string.format("%02d", maxValue % 60)}`}`
					end)
				})
			}),
			PlayerControls = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row align-x-center align-y-center auto-xy"
			}, {
				Playback = reactModule.createElement(iconButton, {
					LayoutOrder = 1,
					isCircular = true,
					testId = "AssetLibrary.AudioPlayer.Playback",
					icon = if value.isPlaying then iconName.PauseLarge else iconName.PlayLarge,
					onActivated = value.onTogglePlayback,
					size = inputSize.Large,
					variant = buttonVariant.Emphasis
				})
			})
		})
	})
end