local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local buttonSize = foundationModule.Enums.ButtonSize
local iconButton = foundationModule.IconButton
local view = foundationModule.View

return function(p1)
	-- upvalues: reactModule (ref), view (ref), iconButton (ref), buttonSize (ref)
	local var1 = if p1.timeLength > 0 then p1.timePosition / p1.timeLength else 0
	local var2 = reactModule.useRef(nil)
	local var3, var4 = reactModule.useState(0)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var4 (ref)
		if var2 and var2.current then
			local inputBeganConnection = var2.current.InputBegan:Connect(function(p2)
				-- upvalues: var4 (copy)
				var4(p2.Position.X)
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
			tag = "radius-small size-full-200",
			backgroundStyle = { Transparency = 0.7, Color3 = Color3.fromHex("#D5D7DD") },
			onActivated = reactModule.useCallback(function()
				-- upvalues: var2 (ref), p1 (ref), var3 (ref)
				if var2 and var2.current then
					p1.onProgressBarActivated((var3 - var2.current.AbsolutePosition.X) / var2.current.AbsoluteSize.X)
					
					return
				end
			end, { var3, p1.onProgressBarActivated }),
			ref = var2
		}, {
			Progress = reactModule.createElement(view, {
				tag = "radius-small bg-action-sub-emphasis",
				Size = UDim2.fromScale(var1, 1)
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
				icon = if p1.isPlaying then "icons/controls/media-pause-medium" else "icons/controls/media-play-medium",
				onActivated = p1.onPlayButtonActivated,
				size = buttonSize.Medium
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