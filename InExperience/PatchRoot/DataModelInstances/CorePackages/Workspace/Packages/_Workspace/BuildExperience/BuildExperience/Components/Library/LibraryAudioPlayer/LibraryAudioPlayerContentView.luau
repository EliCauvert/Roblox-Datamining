local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local icon = foundationModule.Icon
local iconButton = foundationModule.IconButton
local image = foundationModule.Image
local slider = foundationModule.Slider
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

local function _(p1)
	local ceiled = math.ceil(p1 - 0.001)
	
	if ceiled <= 0 then
		return `{0}:{string.format("%02d", 0)}`
	end
	local maxValue = math.max(0, math.floor(ceiled))
	
	return `-{`{math.floor(maxValue / 60)}:{string.format("%02d", maxValue % 60)}`}`
end

return function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), view (ref), image (ref), icon (ref), iconName (ref), iconSize (ref), text (ref), slider (ref), inputSize (ref), formatTime (ref), iconButton (ref), buttonVariant (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = foundationModule.Hooks.useScaledValue(168)
	local var3 = p1.isCompact == true
	
	return reactModule.createElement(view, {
		testId = "Library.AudioPlayer",
		LayoutOrder = p1.LayoutOrder,
		tag = {
			["col align-x-center size-full-0 auto-y"] = true,
			["gap-small"] = var3,
			["gap-xxlarge"] = not var3
		}
	}, {
		Song = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				["gap-medium"] = true,
				["row align-y-center size-full-0 auto-y"] = var3,
				["col align-x-center auto-xy"] = not var3
			}
		}, {
			Artwork = reactModule.createElement(view, {
				LayoutOrder = 1,
				testId = "Library.AudioPlayer.Artwork",
				tag = "align-x-center align-y-center radius-large clip bg-shift-200",
				Size = if var3 then UDim2.fromOffset(var1.Size.Size_1600, var1.Size.Size_1600) else UDim2.fromOffset(var2, var2)
			}, {
				Media = if p1.thumbnail == nil or p1.thumbnail == "" then reactModule.createElement(icon, {
					name = iconName.MusicNote,
					size = iconSize.XLarge,
					style = var1.Color.Content.Emphasis
				}) else reactModule.createElement(image, {
					tag = "size-full",
					Image = p1.thumbnail,
					ScaleType = Enum.ScaleType.Fit
				})
			}),
			Info = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = {
					["col auto-y"] = true,
					fill = var3,
					["align-x-center size-full-0"] = not var3
				}
			}, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					Text = p1.title,
					tag = {
						["size-full-0 auto-y text-heading-small content-emphasis"] = true,
						["text-align-x-left text-truncate-end"] = var3,
						["text-wrap text-align-x-center"] = not var3
					}
				}),
				Artist = reactModule.createElement(text, {
					LayoutOrder = 2,
					Text = p1.artist,
					tag = {
						["size-full-0 auto-y text-body-large text-truncate-end content-default"] = true,
						["text-align-x-left"] = var3,
						["text-align-x-center"] = not var3
					}
				})
			})
		}),
		Controls = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = {
				["col align-x-center size-full-0 auto-y"] = true,
				["gap-small"] = var3,
				["gap-medium"] = not var3
			}
		}, {
			Timeline = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "col gap-xsmall size-full-0 auto-y",
				testId = "Library.AudioPlayer.Timeline"
			}, {
				Slider = reactModule.createElement(slider, {
					LayoutOrder = 1,
					testId = "Library.AudioPlayer.Timeline.Slider",
					value = p1.elapsed:map(function(p2)
						-- upvalues: p1 (ref)
						return if p1.duration <= 0 then 0 else math.clamp(p2 / p1.duration, 0, 1)
					end),
					onValueChanged = p1.onSeek,
					onDragStarted = p1.onSeekStarted,
					onDragEnded = p1.onSeekEnded,
					isDisabled = if p1.onSeek ~= nil then p1.duration <= 0 else true,
					size = inputSize.XSmall,
					knobVisibility = foundationModule.Enums.Visibility.Always,
					variant = foundationModule.Enums.SliderVariant.Emphasis
				}),
				Times = reactModule.createElement(view, { LayoutOrder = 2, tag = "row size-full-0 auto-y" }, {
					Elapsed = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "fill auto-y text-caption-large text-align-x-left content-default",
						Text = p1.elapsed:map(formatTime)
					}),
					Remaining = reactModule.createElement(text, {
						LayoutOrder = 2,
						tag = "auto-xy text-caption-large content-default",
						Text = p1.elapsed:map(function(p2)
							-- upvalues: p1 (ref)
							local ceiled = math.ceil(p1.duration - p2 - 0.001)
							
							if ceiled <= 0 then
								return `{0}:{string.format("%02d", 0)}`
							end
							local maxValue = math.max(0, math.floor(ceiled))
							
							return `-{`{math.floor(maxValue / 60)}:{string.format("%02d", maxValue % 60)}`}`
						end)
					})
				})
			}),
			PlayerControls = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row align-x-center align-y-center auto-xy"
			}, {
				Playback = reactModule.createElement(iconButton, {
					LayoutOrder = 1,
					isCircular = true,
					testId = "Library.AudioPlayer.Playback",
					icon = if p1.isPlaying then iconName.PauseLarge else iconName.PlayLarge,
					onActivated = p1.onTogglePlayback,
					size = inputSize.Large,
					variant = buttonVariant.Emphasis
				})
			})
		})
	})
end