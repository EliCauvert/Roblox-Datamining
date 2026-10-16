local Parent = script.Parent.Parent.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ButtonSize = FoundationModule.Enums.ButtonSize
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local View = FoundationModule.View

local function _(p1: number): string --[[ Line: 29 | Named "formatTime" ]]
	return string.format("%02d:%02d", math.floor(p1 / 60), (math.floor(p1 % 60)))
end

return function(p1) --[[ Line: 35 | Named "ProgressBar" ]]
	-- upvalues: ReactModule (copy), View (copy), IconButton (copy), ButtonSize (copy), Text (copy)
	local TimePositionRatio = p1.timePosition / p1.timeLength
	local TimePosition: number = p1.timePosition
	local Formatted = string.format("%02d:%02d", math.floor(TimePosition / 60), (math.floor(TimePosition % 60)))
	local TimeLength: number = p1.timeLength
	local Formatted1 = string.format("%02d:%02d", math.floor(TimeLength / 60), (math.floor(TimeLength % 60)))
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	ReactModule.useEffect(function() --[[ Line: 42 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		if not UseRefResult or not UseRefResult.current then return end
		local InputBeganConnection = UseRefResult.current.InputBegan:Connect(function(Input) --[[ Line: 49 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(Input.Position.X)
		end)
		
		return function() --[[ Line: 53 ]]
			-- upvalues: InputBeganConnection (copy)
			InputBeganConnection:Disconnect()
		end
	end, {})
	
	return ReactModule.createElement(View, {
		tag = {
			["align-x-center align-y-center col size-full-1400"] = true,
			["padding-medium"] = p1.isFullScreen,
			["padding-x-medium"] = not p1.isFullScreen
		}
	}, {
		ProgressBarContainer = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "radius-small bg-over-media-0 size-full-200",
			onActivated = ReactModule.useCallback(function() --[[ Line: 58 ]]
				-- upvalues: UseRefResult (copy), p1 (copy), UseStateResult (copy)
				if UseRefResult and UseRefResult.current then
					p1.onProgressBarActivated((UseStateResult - UseRefResult.current.AbsolutePosition.X) / UseRefResult.current.AbsoluteSize.X)
					
					return
				end
			end, { UseStateResult, p1.onProgressBarActivated }),
			ref = UseRefResult
		}, {
			Progress = ReactModule.createElement(View, {
				tag = "radius-small bg-system-neutral",
				Size = UDim2.fromScale(TimePositionRatio, 1)
			})
		}),
		CTAContainer = ReactModule.createElement(View, {
			LayoutOrder = 2,
			isDisabled = true,
			tag = "row flex-between align-x-center align-y-center size-full-1000"
		}, {
			PlayButton = ReactModule.createElement(IconButton, {
				isDisabled = false,
				LayoutOrder = 1,
				icon = if p1.isPlaying then "icons/controls/media-pause-medium" else "icons/controls/media-play-medium",
				onActivated = p1.onPlayButtonActivated,
				size = ButtonSize.Medium
			}),
			TimeText = if p1.isTimeHidden then nil else ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-large",
				Text = string.format("%s / %s", Formatted, Formatted1)
			}),
			MuteButton = ReactModule.createElement(IconButton, {
				isDisabled = false,
				LayoutOrder = 3,
				icon = if p1.isMuted then "icons/controls/speakerMute" else "icons/controls/speaker",
				onActivated = p1.onMuteButtonActivated,
				size = ButtonSize.Medium
			})
		})
	})
end