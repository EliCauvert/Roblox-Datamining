local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local IconButton = FoundationModule.IconButton
local Image = FoundationModule.Image
local Slider = FoundationModule.Slider
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize

local function formatTime(Value: number): string
	local Largest = math.max(0, (math.floor(Value)))
	
	return `{math.floor(Largest / 60)}:{string.format("%02d", Largest % 60)}`
end

local function _(p1: number): string
	local Ceiled = math.ceil(p1 - 0.001)
	
	if Ceiled <= 0 then
		return `{0}:{string.format("%02d", 0)}`
	else
		local Largest = math.max(0, (math.floor(Ceiled)))
		
		return `-{`{math.floor(Largest / 60)}:{string.format("%02d", Largest % 60)}`}`
	end
end

return function(Frame)
	-- upvalues: FoundationModule (copy), ReactModule (copy), View (copy), Image (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy), Slider (copy), InputSize (copy), formatTime (copy), IconButton (copy), ButtonVariant (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseScaledValueResult = FoundationModule.Hooks.useScaledValue(168)
	local IsIsCompact = Frame.isCompact == true
	
	return ReactModule.createElement(View, {
		testId = "Library.AudioPlayer",
		LayoutOrder = Frame.LayoutOrder,
		tag = {
			["col align-x-center size-full-0 auto-y"] = true,
			["gap-small"] = IsIsCompact,
			["gap-xxlarge"] = not IsIsCompact
		}
	}, {
		Song = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = {
				["gap-medium"] = true,
				["row align-y-center size-full-0 auto-y"] = IsIsCompact,
				["col align-x-center auto-xy"] = not IsIsCompact
			}
		}, {
			Artwork = ReactModule.createElement(View, {
				LayoutOrder = 1,
				testId = "Library.AudioPlayer.Artwork",
				tag = "align-x-center align-y-center radius-large clip bg-shift-200",
				Size = if IsIsCompact then UDim2.fromOffset(UseTokensResult.Size.Size_1600, UseTokensResult.Size.Size_1600) else UDim2.fromOffset(UseScaledValueResult, UseScaledValueResult)
			}, {
				Media = if Frame.thumbnail == nil or Frame.thumbnail == "" then ReactModule.createElement(Icon, {
					name = IconName.MusicNote,
					size = IconSize.XLarge,
					style = UseTokensResult.Color.Content.Emphasis
				}) else ReactModule.createElement(Image, {
					tag = "size-full",
					Image = Frame.thumbnail,
					ScaleType = Enum.ScaleType.Fit
				})
			}),
			Info = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = {
					["col auto-y"] = true,
					fill = IsIsCompact,
					["align-x-center size-full-0"] = not IsIsCompact
				}
			}, {
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					Text = Frame.title,
					tag = {
						["size-full-0 auto-y text-heading-small content-emphasis"] = true,
						["text-align-x-left text-truncate-end"] = IsIsCompact,
						["text-wrap text-align-x-center"] = not IsIsCompact
					}
				}),
				Artist = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					Text = Frame.artist,
					tag = {
						["size-full-0 auto-y text-body-large text-truncate-end content-default"] = true,
						["text-align-x-left"] = IsIsCompact,
						["text-align-x-center"] = not IsIsCompact
					}
				})
			})
		}),
		Controls = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = {
				["col align-x-center size-full-0 auto-y"] = true,
				["gap-small"] = IsIsCompact,
				["gap-medium"] = not IsIsCompact
			}
		}, {
			Timeline = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "col gap-xsmall size-full-0 auto-y",
				testId = "Library.AudioPlayer.Timeline"
			}, {
				Slider = ReactModule.createElement(Slider, {
					LayoutOrder = 1,
					testId = "Library.AudioPlayer.Timeline.Slider",
					value = Frame.elapsed:map(function(p1): number
						-- upvalues: Frame (copy)
						return if Frame.duration <= 0 then 0 else math.clamp(p1 / Frame.duration, 0, 1)
					end),
					onValueChanged = Frame.onSeek,
					onDragStarted = Frame.onSeekStarted,
					onDragEnded = Frame.onSeekEnded,
					isDisabled = Frame.onSeek == nil or Frame.duration <= 0,
					size = InputSize.XSmall,
					knobVisibility = FoundationModule.Enums.Visibility.Always,
					variant = FoundationModule.Enums.SliderVariant.Emphasis
				}),
				Times = ReactModule.createElement(View, { LayoutOrder = 2, tag = "row size-full-0 auto-y" }, {
					Elapsed = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "fill auto-y text-caption-large text-align-x-left content-default",
						Text = Frame.elapsed:map(formatTime)
					}),
					Remaining = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "auto-xy text-caption-large content-default",
						Text = Frame.elapsed:map(function(p1): string
							-- upvalues: Frame (copy)
							local Ceiled = math.ceil(Frame.duration - p1 - 0.001)
							
							if Ceiled <= 0 then
								return `{0}:{string.format("%02d", 0)}`
							else
								local Largest = math.max(0, (math.floor(Ceiled)))
								
								return `-{`{math.floor(Largest / 60)}:{string.format("%02d", Largest % 60)}`}`
							end
						end)
					})
				})
			}),
			PlayerControls = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "row align-x-center align-y-center auto-xy"
			}, {
				Playback = ReactModule.createElement(IconButton, {
					LayoutOrder = 1,
					isCircular = true,
					testId = "Library.AudioPlayer.Playback",
					icon = if Frame.isPlaying then IconName.PauseLarge else IconName.PlayLarge,
					onActivated = Frame.onTogglePlayback,
					size = InputSize.Large,
					variant = ButtonVariant.Emphasis
				})
			})
		})
	})
end