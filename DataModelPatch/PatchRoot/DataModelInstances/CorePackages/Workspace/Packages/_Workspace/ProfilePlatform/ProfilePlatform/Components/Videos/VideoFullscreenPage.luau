local UserInputService = game:GetService("UserInputService")
local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UIBloxModule = require(Parent.UIBlox)
local Interactable = UIBloxModule.Core.Control.Interactable
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local VideoPlayerModule = require(ProfilePlatform.Components.Videos.VideoPlayer)
local ProgressBarModule = require(ProfilePlatform.Components.Videos.ProgressBar)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local ButtonSize = FoundationModule.Enums.ButtonSize
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local BrandVideosFixCloseFullscreen = game:DefineFastFlag("BrandVideosFixCloseFullscreen", false)

return function()
	-- upvalues: UseNavigationFunction (copy), UseScreenSizeFunction (copy), UseStyleFunction (copy), ReactModule (copy), BrandVideosFixCloseFullscreen (copy), UserInputService (copy), FullscreenPageWithSafeArea (copy), View (copy), IconButton (copy), ButtonSize (copy), VideoPlayerModule (copy), ProgressBarModule (copy), Interactable (copy)
	local UseNavigationResult = UseNavigationFunction()
	local ExtraPropsParam = UseNavigationResult.getParam("extraProps")
	local UseScreenSizeResult = UseScreenSizeFunction()
	local Theme = UseStyleFunction().Theme
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(not ExtraPropsParam or ExtraPropsParam.isMuted == nil or ExtraPropsParam.isMuted)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: ExtraPropsParam (copy), UseStateResult4 (copy)
		if ExtraPropsParam and ExtraPropsParam.onMuteUpdate then
			ExtraPropsParam.onMuteUpdate(UseStateResult4)
		end
	end, { UseStateResult4, ExtraPropsParam })
	local UseMemoResult = ReactModule.useMemo(function(): UDim2
		-- upvalues: UseScreenSizeResult (copy)
		local X = UseScreenSizeResult.X
		local YOffset = X / 1.7777777777777777
		
		if UseScreenSizeResult.Y < YOffset then
			YOffset = UseScreenSizeResult.Y
			X = YOffset * 1.7777777777777777
		end
		return UDim2.new(0, X, 0, YOffset)
	end, { UseScreenSizeResult.X, UseScreenSizeResult.Y })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: BrandVideosFixCloseFullscreen (upval), UseRefResult (copy), UseStateResult3 (copy), UseNavigationResult (copy)
		if BrandVideosFixCloseFullscreen and UseRefResult.current and UseStateResult3 then
			UseRefResult.current.togglePlayPause()
		end
		UseNavigationResult.goBack()
	end, { UseNavigationResult.goBack })
	local UseResult1 = ReactModule.useCallback(function(p1, p2, p3, p4)
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy)
		UseStateResult2(p1)
		UseStateResult2_1(p2)
		UseStateResult2_2(p3)
		UseStateResult2_3(p4)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p1)
		-- upvalues: UseRefResult (copy), UseStateResult1 (copy)
		if UseRefResult.current and UseRefResult.current.setTimePosition then
			UseRefResult.current.setTimePosition(UseStateResult1 * p1)
		end
	end, { UseStateResult1 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current and UseRefResult.current.togglePlayPause then
			UseRefResult.current.togglePlayPause()
		end
	end, {})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current and UseRefResult.current.toggleMute then
			UseRefResult.current.toggleMute()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), UseResult3 (copy), UseResult (copy)
		local InputBeganConnection = UserInputService.InputBegan:Connect(function(Input, GameProcessed)
			-- upvalues: UseResult3 (upval), UseResult (upval)
			if GameProcessed then return end
			if Input.KeyCode == Enum.KeyCode.Space then
				UseResult3()
			end
			if Input.KeyCode == Enum.KeyCode.Escape then
				UseResult()
			end
		end)
		
		return function()
			-- upvalues: InputBeganConnection (copy)
			InputBeganConnection:Disconnect()
		end
	end, { UseResult3, UseResult })
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BackgroundTransparency = Theme.BackgroundDefault.Transparency
	}, {
		CloseButtonContainer = ReactModule.createElement(View, {
			tag = "align-x-right align-y-top position-top-right anchor-top-right auto-xy padding-xlarge padding-medium",
			ZIndex = 100000
		}, {
			CloseButton = ReactModule.createElement(IconButton, {
				icon = "icons/navigation/close",
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 0, 0.5, 0),
				size = ButtonSize.Medium,
				onActivated = UseResult
			})
		}),
		VideoContainer = ReactModule.createElement(View, {
			tag = "position-center-center anchor-center-center",
			Size = UseMemoResult
		}, {
			VideoPlayer = if ExtraPropsParam and ExtraPropsParam.videoId then ReactModule.createElement(VideoPlayerModule, {
				isFullscreen = true,
				looped = false,
				initialTimePosition = ExtraPropsParam.initialTimePosition,
				isMuted = UseStateResult4,
				videoId = ExtraPropsParam.videoId,
				onProgressUpdate = UseResult1,
				ref = UseRefResult
			}) else nil
		}),
		FixedProgressBar = if UseStateResult1 > 0 then ReactModule.createElement(View, {
			tag = "position-bottom-center anchor-bottom-center",
			ZIndex = 1000,
			Size = UDim2.new(1, 0, 0, 80)
		}, {
			ProgressBar = ReactModule.createElement(ProgressBarModule, {
				isFullScreen = true,
				isMuted = UseStateResult4,
				isPlaying = UseStateResult3,
				onMuteButtonActivated = UseResult4,
				onPlayButtonActivated = UseResult3,
				onProgressBarActivated = UseResult2,
				timePosition = UseStateResult,
				timeLength = UseStateResult1
			})
		}) else nil,
		InteractableWrapper = if UseStateResult1 > 0 then ReactModule.createElement(View, { ZIndex = 999, Size = UDim2.fromScale(1, 1) }, {
			Interactable = ReactModule.createElement(Interactable, {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Selectable = false,
				[ReactModule.Event.Activated] = UseResult3
			})
		}) else nil
	})
end