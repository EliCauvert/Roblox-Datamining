local parent = script.Parent.Parent.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local buttonSize = foundationModule.Enums.ButtonSize
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local view = foundationModule.View

local function _(p0)
	return string.format("%02d:%02d", math.floor(p0 / 60), math.floor(p0 % 60))
end

return function(p1)
	-- upvalues: reactModule (ref), view (ref), iconButton (ref), buttonSize (ref), text (ref)
	local var2 = p1.timePosition / p1.timeLength
	local timePosition = p1.timePosition
	local formattedText = string.format("%02d:%02d", math.floor(timePosition / 60), math.floor(timePosition % 60))
	local timeLength = p1.timeLength
	local formattedText_1 = string.format("%02d:%02d", math.floor(timeLength / 60), math.floor(timeLength % 60))
	local var5 = reactModule.useRef(nil)
	local var6, var7 = reactModule.useState(0)
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var7 (ref)
		if var5 and var5.current then
			local inputBeganConnection = var5.current.InputBegan:Connect(function(p2)
				-- upvalues: var7 (copy)
				var7(p2.Position.X)
			end)
			
			return function()
				-- upvalues: inputBeganConnection (ref)
				inputBeganConnection:Disconnect()
			end
		end
	end, {})
	
	return reactModule.createElement(view, {
		tag = {
			["align-x-center align-y-center col size-full-1400"] = true,
			["padding-medium"] = p1.isFullScreen,
			["padding-x-medium"] = not p1.isFullScreen
		}
	}, {
		ProgressBarContainer = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "radius-small bg-over-media-0 size-full-200",
			onActivated = reactModule.useCallback(function()
				-- upvalues: var5 (ref), p1 (ref), var6 (ref)
				if var5 and var5.current then
					p1.onProgressBarActivated((var6 - var5.current.AbsolutePosition.X) / var5.current.AbsoluteSize.X)
					
					return
				end
			end, { var6, p1.onProgressBarActivated }),
			ref = var5
		}, {
			Progress = reactModule.createElement(view, {
				tag = "radius-small bg-system-neutral",
				Size = UDim2.fromScale(var2, 1)
			})
		}),
		CTAContainer = reactModule.createElement(view, {
			LayoutOrder = 2,
			isDisabled = true,
			tag = "row flex-between align-x-center align-y-center size-full-1000"
		}, {
			PlayButton = reactModule.createElement(iconButton, {
				isDisabled = false,
				LayoutOrder = 1,
				icon = if p1.isPlaying then "icons/controls/media-pause-medium" else "icons/controls/media-play-medium",
				onActivated = p1.onPlayButtonActivated,
				size = buttonSize.Medium
			}),
			TimeText = if p1.isTimeHidden then nil else reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-large",
				Text = string.format("%s / %s", formattedText, formattedText_1)
			}),
			MuteButton = reactModule.createElement(iconButton, {
				isDisabled = false,
				LayoutOrder = 3,
				icon = if p1.isMuted then "icons/controls/speakerMute" else "icons/controls/speaker",
				onActivated = p1.onMuteButtonActivated,
				size = buttonSize.Medium
			})
		})
	})
end