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
	local var1 = useNavigation()
	local extraProps = var1.getParam("extraProps")
	local var2 = useScreenSize()
	local theme = useStyle().Theme
	local var3, var4 = reactModule.useState(0)
	local var5, var6 = reactModule.useState(0)
	local var7, var8 = reactModule.useState(true)
	local useState = reactModule.useState
	local var9 = if extraProps and extraProps.isMuted ~= nil then extraProps.isMuted else true
	useState, var18 = useState(var9)
	local var10 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: extraProps (ref), useState (ref)
		if extraProps and extraProps.onMuteUpdate then
			extraProps.onMuteUpdate(useState)
		end
	end, { useState, extraProps })
	local var11 = reactModule.useMemo(function()
		-- upvalues: var2 (ref)
		local x = var2.X
		local var12 = x / 1.777777777778
		
		if var2.Y < var12 then
			var12 = var2.Y
			x = var12 * 1.777777777778
		end
		return UDim2.new(0, x, 0, var12)
	end, { var2.X, var2.Y })
	local var12 = reactModule.useCallback(function()
		-- upvalues: brandVideosFixCloseFullscreen (copy), var10 (ref), var7 (ref), var1 (ref)
		if brandVideosFixCloseFullscreen and var10.current and var7 then
			var10.current.togglePlayPause()
		end
		var1.goBack()
	end, { var1.goBack })
	local var13 = reactModule.useCallback(function(p1, p2, p3, p4)
		-- upvalues: var4 (ref), var6 (ref), var8 (ref), var9 (ref)
		var4(p1)
		var6(p2)
		var8(p3)
		var9(p4)
	end, {})
	local var14 = reactModule.useCallback(function(p1)
		-- upvalues: var10 (ref), var5 (ref)
		if var10.current and var10.current.setTimePosition then
			var10.current.setTimePosition(var5 * p1)
		end
	end, { var5 })
	local var15 = reactModule.useCallback(function()
		-- upvalues: var10 (ref)
		if var10.current and var10.current.togglePlayPause then
			var10.current.togglePlayPause()
		end
	end, {})
	local var16 = reactModule.useCallback(function()
		-- upvalues: var10 (ref)
		if var10.current and var10.current.toggleMute then
			var10.current.toggleMute()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var15 (ref), var12 (ref)
		local inputBeganConnection = userInputService.InputBegan:Connect(function(p1, p2)
			-- upvalues: var15 (copy), var12 (copy)
			if p2 then return end
			if p1.KeyCode == Enum.KeyCode.Space then
				var15()
			end
			if p1.KeyCode == Enum.KeyCode.Escape then
				var12()
			end
		end)
		
		return function()
			-- upvalues: inputBeganConnection (ref)
			inputBeganConnection:Disconnect()
		end
	end, { var15, var12 })
	
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
				onActivated = var12
			})
		}),
		VideoContainer = reactModule.createElement(view, {
			tag = "position-center-center anchor-center-center",
			Size = var11
		}, {
			VideoPlayer = if extraProps and extraProps.videoId then reactModule.createElement(videoPlayerModule, {
				isFullscreen = true,
				looped = false,
				initialTimePosition = extraProps.initialTimePosition,
				isMuted = useState,
				videoId = extraProps.videoId,
				onProgressUpdate = var13,
				ref = var10
			}) else nil
		}),
		FixedProgressBar = if var5 > 0 then reactModule.createElement(view, {
			tag = "position-bottom-center anchor-bottom-center",
			ZIndex = 1000,
			Size = UDim2.new(1, 0, 0, 80)
		}, {
			ProgressBar = reactModule.createElement(progressBarModule, {
				isFullScreen = true,
				isMuted = useState,
				isPlaying = var7,
				onMuteButtonActivated = var16,
				onPlayButtonActivated = var15,
				onProgressBarActivated = var14,
				timePosition = var3,
				timeLength = var5
			})
		}) else nil,
		InteractableWrapper = if var5 > 0 then reactModule.createElement(view, { ZIndex = 999, Size = UDim2.fromScale(1, 1) }, {
			Interactable = reactModule.createElement(interactable, {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Selectable = false,
				[reactModule.Event.Activated] = var15
			})
		}) else nil
	})
end