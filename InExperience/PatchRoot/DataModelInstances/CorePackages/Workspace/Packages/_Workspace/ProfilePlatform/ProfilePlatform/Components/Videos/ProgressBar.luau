local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local buttonSize = foundationModule.Enums.ButtonSize
local iconButton = foundationModule.IconButton
local view = foundationModule.View

return function(p0) --[[ line: 27 | named "ProgressBar" ]]
	-- upvalues: reactModule (ref), view (ref), iconButton (ref), buttonSize (ref)
	local var2 = if p0.timeLength > 0 then p0.timePosition / p0.timeLength else 0
	local var3 = reactModule.useRef(nil)
	local var4, var5 = reactModule.useState(0)
	reactModule.useEffect(function() --[[ line: 32 ]]
		-- upvalues: var3 (ref), var5 (ref)
		if var3 and var3.current then
			local inputBeganConnection = var3.current.InputBegan:Connect(function(p1) --[[ line: 39 ]]
				-- upvalues: var5 (copy)
				var5(p1.Position.X)
			end)
			
			return function() --[[ line: 43 ]]
				-- upvalues: inputBeganConnection (ref)
				inputBeganConnection:Disconnect()
			end
		end
	end, {})
	
	return reactModule.createElement(view, {
		tag = {
			["align-x-center align-y-center col size-full-1400"] = true,
			["padding-medium"] = p0.isFullScreen,
			["padding-x-medium"] = not p0.isFullScreen
		}
	}, {
		ProgressBarContainer = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "radius-small size-full-200",
			backgroundStyle = { Transparency = 0.7, Color3 = Color3.fromHex("#D5D7DD") },
			onActivated = reactModule.useCallback(function() --[[ line: 48 ]]
				-- upvalues: var3 (ref), p0 (ref), var4 (ref)
				if var3 and var3.current then
					p0.onProgressBarActivated((var4 - var3.current.AbsolutePosition.X) / var3.current.AbsoluteSize.X)
					
					return
				end
			end, { var4, p0.onProgressBarActivated }),
			ref = var3
		}, {
			Progress = reactModule.createElement(view, {
				tag = "radius-small bg-action-sub-emphasis",
				Size = UDim2.fromScale(var2, 1)
			})
		}),
		CTAContainer = reactModule.createElement(view, {
			isDisabled = true,
			LayoutOrder = 2,
			tag = "row flex-between align-x-center align-y-center size-full-1000"
		}, {
			PlayButton = reactModule.createElement(iconButton, {
				isDisabled = false,
				LayoutOrder = 1,
				icon = if p0.isPlaying then "icons/controls/media-pause-medium" else "icons/controls/media-play-medium",
				onActivated = p0.onPlayButtonActivated,
				size = buttonSize.Medium
			}),
			MuteButton = reactModule.createElement(iconButton, {
				isDisabled = false,
				LayoutOrder = 3,
				icon = if p0.isMuted then "icons/controls/speakerMute" else "icons/controls/speaker",
				onActivated = p0.onMuteButtonActivated,
				size = buttonSize.Medium
			})
		})
	})
end