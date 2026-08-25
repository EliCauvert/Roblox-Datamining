local userInputService = game:GetService("UserInputService")
local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local UIBloxModule = require(parent.UIBlox)
local interactable = UIBloxModule.Core.Control.Interactable
local fullscreenPageWithSafeArea = require(parent.AppBlox).FullscreenPageWithSafeArea
local navigationModule = require(parent.Navigation)
local videoPlayerModule = require(profilePlatform.Components.Videos.VideoPlayer)
local progressBarModule = require(profilePlatform.Components.Videos.ProgressBar)
local useNavigation = navigationModule.useNavigation
local useStyle = UIBloxModule.Core.Style.useStyle
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local buttonSize = foundationModule.Enums.ButtonSize
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local brandVideosFixCloseFullscreen = game:DefineFastFlag("BrandVideosFixCloseFullscreen", false)

return function()
	-- upvalues: useNavigation (ref), useScreenSize (ref), useStyle (ref), reactModule (ref), brandVideosFixCloseFullscreen (ref), userInputService (ref), fullscreenPageWithSafeArea (ref), view (ref), iconButton (ref), buttonSize (ref), videoPlayerModule (ref), progressBarModule (ref), interactable (ref)
	local var9 = useNavigation()
	local extraProps = var9.getParam("extraProps")
	local var11 = useScreenSize()
	local theme = useStyle().Theme
	local var12, var13 = reactModule.useState(0)
	local var14, var15 = reactModule.useState(0)
	local var16, var17 = reactModule.useState(true)
	local useState = reactModule.useState
	local var18 = if extraProps and extraProps.isMuted ~= nil then extraProps.isMuted else true
	useState, var18 = useState(var18)
	local var19 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: extraProps (ref), useState (ref)
		if extraProps and extraProps.onMuteUpdate then
			extraProps.onMuteUpdate(useState)
		end
	end, { useState, extraProps })
	local var20 = reactModule.useMemo(function()
		-- upvalues: var11 (ref)
		local x = var11.X
		local var26 = x / 1.777777777778
		
		if var11.Y < var26 then
			var26 = var11.Y
			x = var26 * 1.777777777778
		end
		return UDim2.new(0, x, 0, var26)
	end, { var11.X, var11.Y })
	local var21 = reactModule.useCallback(function()
		-- upvalues: brandVideosFixCloseFullscreen (copy), var19 (ref), var16 (ref), var9 (ref)
		if brandVideosFixCloseFullscreen and var19.current and var16 then
			var19.current.togglePlayPause()
		end
		var9.goBack()
	end, { var9.goBack })
	local var22 = reactModule.useCallback(function(p0, p1, p2, p3)
		-- upvalues: var13 (ref), var15 (ref), var17 (ref), var18 (ref)
		var13(p0)
		var15(p1)
		var17(p2)
		var18(p3)
	end, {})
	local var23 = reactModule.useCallback(function(p4)
		-- upvalues: var19 (ref), var14 (ref)
		if var19.current and var19.current.setTimePosition then
			var19.current.setTimePosition(var14 * p4)
		end
	end, { var14 })
	local var24 = reactModule.useCallback(function()
		-- upvalues: var19 (ref)
		if var19.current and var19.current.togglePlayPause then
			var19.current.togglePlayPause()
		end
	end, {})
	local var25 = reactModule.useCallback(function()
		-- upvalues: var19 (ref)
		if var19.current and var19.current.toggleMute then
			var19.current.toggleMute()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var24 (ref), var21 (ref)
		local inputBeganConnection = userInputService.InputBegan:Connect(function(p5, p6)
			-- upvalues: var24 (copy), var21 (copy)
			if p6 then return end
			if p5.KeyCode == Enum.KeyCode.Space then
				var24()
			end
			if p5.KeyCode == Enum.KeyCode.Escape then
				var21()
			end
		end)
		
		return function()
			-- upvalues: inputBeganConnection (ref)
			inputBeganConnection:Disconnect()
		end
	end, { var24, var21 })
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = theme.BackgroundDefault.Color,
		BackgroundTransparency = theme.BackgroundDefault.Transparency
	}, {
		CloseButtonContainer = reactModule.createElement(view, {
			tag = "align-x-right align-y-top position-top-right anchor-top-right auto-xy padding-xlarge padding-medium",
			ZIndex = 100000
		}, {
			CloseButton = reactModule.createElement(iconButton, {
				icon = "icons/navigation/close",
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 0, 0.5, 0),
				size = buttonSize.Medium,
				onActivated = var21
			})
		}),
		VideoContainer = reactModule.createElement(view, {
			tag = "position-center-center anchor-center-center",
			Size = var20
		}, {
			VideoPlayer = if extraProps and extraProps.videoId then reactModule.createElement(videoPlayerModule, {
				isFullscreen = true,
				looped = false,
				initialTimePosition = extraProps.initialTimePosition,
				isMuted = useState,
				videoId = extraProps.videoId,
				onProgressUpdate = var22,
				ref = var19
			}) else nil
		}),
		FixedProgressBar = if var14 > 0 then reactModule.createElement(view, {
			tag = "position-bottom-center anchor-bottom-center",
			ZIndex = 1000,
			Size = UDim2.new(1, 0, 0, 80)
		}, {
			ProgressBar = reactModule.createElement(progressBarModule, {
				isFullScreen = true,
				isMuted = useState,
				isPlaying = var16,
				onMuteButtonActivated = var25,
				onPlayButtonActivated = var24,
				onProgressBarActivated = var23,
				timePosition = var12,
				timeLength = var14
			})
		}) else nil,
		InteractableWrapper = if var14 > 0 then reactModule.createElement(view, { ZIndex = 999, Size = UDim2.fromScale(1, 1) }, {
			Interactable = reactModule.createElement(interactable, {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Selectable = false,
				[reactModule.Event.Activated] = var24
			})
		}) else nil
	})
end