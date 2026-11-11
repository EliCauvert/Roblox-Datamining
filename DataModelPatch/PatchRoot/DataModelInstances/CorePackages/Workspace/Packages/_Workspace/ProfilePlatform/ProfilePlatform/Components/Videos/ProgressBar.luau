local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ButtonSize = FoundationModule.Enums.ButtonSize
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), IconButton (copy), ButtonSize (copy)
	local TimePositionRatio = if p1.timeLength > 0 then p1.timePosition / p1.timeLength else 0
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		if not UseRefResult or not UseRefResult.current then return end
		local InputBeganConnection = UseRefResult.current.InputBegan:Connect(function(Input)
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(Input.Position.X)
		end)
		
		return function()
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
			tag = "radius-small size-full-200",
			backgroundStyle = { Transparency = 0.7, Color3 = Color3.fromHex("#D5D7DD") },
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UseRefResult (copy), p1 (copy), UseStateResult (copy)
				if UseRefResult and UseRefResult.current then
					p1.onProgressBarActivated((UseStateResult - UseRefResult.current.AbsolutePosition.X) / UseRefResult.current.AbsoluteSize.X)
					
					return
				end
			end, { UseStateResult, p1.onProgressBarActivated }),
			ref = UseRefResult
		}, {
			Progress = ReactModule.createElement(View, {
				tag = "radius-small bg-action-sub-emphasis",
				Size = UDim2.fromScale(TimePositionRatio, 1)
			})
		}),
		CTAContainer = ReactModule.createElement(View, {
			isDisabled = true,
			LayoutOrder = 2,
			tag = "row flex-between align-x-center align-y-center size-full-1000"
		}, {
			PlayButton = ReactModule.createElement(IconButton, {
				isDisabled = false,
				LayoutOrder = 1,
				icon = if p1.isPlaying then "icons/controls/media-pause-medium" else "icons/controls/media-play-medium",
				onActivated = p1.onPlayButtonActivated,
				size = ButtonSize.Medium
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