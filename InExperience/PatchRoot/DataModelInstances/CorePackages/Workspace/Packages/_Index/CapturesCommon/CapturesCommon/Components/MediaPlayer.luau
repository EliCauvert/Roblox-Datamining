local RunService = game:GetService("RunService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local ButtonSize = FoundationModule.Enums.ButtonSize
local IconButton = FoundationModule.IconButton
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local View = FoundationModule.View
local LoadableVideoModule = require(Parent.Components.LoadableVideo)
local ProgressBarModule = require(Parent.Components.ProgressBar)

local function _(p1) --[[ Line: 49 | Named "getCurrent" ]]
	return if typeof(p1) == "table" and p1.current ~= nil then p1.current else nil
end

return function(Frame: Frame) --[[ Line: 56 | Named "MediaPlayer" ]]
	-- upvalues: ReactModule (copy), RunService (copy), View (copy), StateLayerAffordance (copy), IconButton (copy), ButtonSize (copy), LoadableVideoModule (copy), Text (copy), ProgressBarModule (copy), FoundationModule (copy), Image (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(true)
	ReactModule.useEffect(function() --[[ Line: 64 ]]
		-- upvalues: Frame (copy), UseStateResult2_2 (copy), RunService (upval), UseStateResult2 (copy)
		local VideoRef = Frame.videoRef
		local Current = if typeof(VideoRef) == "table" and VideoRef.current ~= nil then VideoRef.current else nil
		
		if not Current then return end
		local PlayedConnection = Current.Played:Connect(function() --[[ Line: 70 ]]
			-- upvalues: UseStateResult2_2 (upval)
			UseStateResult2_2(false)
		end)
		local EndedConnection = Current.Ended:Connect(function() --[[ Line: 74 ]]
			-- upvalues: UseStateResult2_2 (upval)
			UseStateResult2_2(true)
		end)
		local RenderSteppedConnection = RunService.RenderStepped:Connect(function() --[[ Line: 78 ]]
			-- upvalues: UseStateResult2 (upval), Current (copy)
			UseStateResult2(Current.TimePosition)
		end)
		
		return function() --[[ Line: 82 ]]
			-- upvalues: RenderSteppedConnection (copy), PlayedConnection (copy), EndedConnection (copy)
			RenderSteppedConnection:Disconnect()
			PlayedConnection:Disconnect()
			EndedConnection:Disconnect()
		end
	end, { Frame.videoRef, UseStateResult6, UseStateResult3 })
	local UseResult = ReactModule.useCallback(function(p1) --[[ Line: 89 ]]
		-- upvalues: Frame (copy), UseStateResult2_1 (copy)
		local VideoRef = Frame.videoRef
		local Current = if typeof(VideoRef) == "table" and VideoRef.current ~= nil then VideoRef.current else nil
		
		if Current then
			UseStateResult2_1(Current.TimeLength)
			Frame.onLoaded(p1)
			
			return
		end
	end, { Frame.onLoaded, Frame.videoRef })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 103 ]]
		-- upvalues: Frame (copy), UseStateResult3 (copy), UseStateResult2_2 (copy), UseStateResult (copy), UseStateResult1 (copy)
		local VideoRef = Frame.videoRef
		local Current = if typeof(VideoRef) == "table" and VideoRef.current ~= nil then VideoRef.current else nil
		
		if not Current then return end
		if not UseStateResult3 then
			Current:Pause()
			UseStateResult2_2(true)
			
			return
		end
		if math.abs(UseStateResult - UseStateResult1) <= 0.1 then
			Current.TimePosition = 0
		end
		Current:Play()
		UseStateResult2_2(false)
	end, {
		UseStateResult3,
		Frame.videoRef,
		UseStateResult,
		UseStateResult1
	})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 121 ]]
		-- upvalues: Frame (copy), UseStateResult2_4 (copy), UseStateResult5 (copy)
		if Frame.onExpandCallback then
			Frame.onExpandCallback()
		end
		UseStateResult2_4(not UseStateResult5)
	end, { UseStateResult5, Frame.onExpandCallback })
	local UseResult3 = ReactModule.useCallback(function(p1) --[[ Line: 129 ]]
		-- upvalues: Frame (copy)
		local VideoRef = Frame.videoRef
		local Current = if typeof(VideoRef) == "table" and VideoRef.current ~= nil then VideoRef.current else nil
		
		if Current then
			Current.TimePosition = Current.TimeLength * p1
			
			return
		end
	end, { Frame.videoRef })
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 138 ]]
		-- upvalues: Frame (copy), UseStateResult4 (copy), UseStateResult2_3 (copy)
		if Frame.onMuteCallback then
			Frame.onMuteCallback()
		end
		local VideoRef = Frame.videoRef
		local Current = if typeof(VideoRef) == "table" and VideoRef.current ~= nil then VideoRef.current else nil
		
		if Current then
			Current.Volume = if UseStateResult4 then 1 else 0
			UseStateResult2_3(not UseStateResult4)
			
			return
		end
	end, { UseStateResult4, Frame.onMuteCallback, Frame.videoRef })
	local IsNotThumbnailImageMatch: boolean = not Frame.Playing and (Frame.thumbnailImage ~= nil and Frame.thumbnailImage ~= "")
	local NoThumbnailImage = if Frame.Video then if Frame.Playing == nil then not Frame.thumbnailImage else Frame.Playing or not Frame.thumbnailImage else Frame.VideoContent and (if Frame.Playing == nil then not Frame.thumbnailImage else Frame.Playing or not Frame.thumbnailImage)
	local VideoRef = Frame.videoRef
	local Current = if typeof(VideoRef) == "table" and VideoRef.current ~= nil then VideoRef.current else nil
	local Element = if Current == nil or not Frame.onExpandCallback or Frame.isZooming or UseStateResult6 or Frame.isOverlayDisabled then nil else ReactModule.createElement(View, {
		tag = "anchor-top-center position-top-center size-full-0 auto-y padding-medium row align-x-right",
		ZIndex = 3
	}, {
		ExpandButton = ReactModule.createElement(IconButton, {
			isDisabled = false,
			LayoutOrder = 1,
			icon = if UseStateResult5 then "icons/actions/previewShrink" else "icons/actions/previewExpand",
			onActivated = UseResult2,
			size = ButtonSize.Medium
		})
	})
	local VideoRef1 = Frame.videoRef
	local Current1 = if typeof(VideoRef1) == "table" and VideoRef1.current ~= nil then VideoRef1.current else nil
	
	return ReactModule.createElement(View, {
		tag = "shrink size-full",
		onActivated = ReactModule.useCallback(function() --[[ Line: 99 ]]
			-- upvalues: UseStateResult2_5 (copy), UseStateResult6 (copy)
			UseStateResult2_5(not UseStateResult6)
		end, { UseStateResult6 }),
		stateLayer = { affordance = StateLayerAffordance.None },
		ZIndex = Frame.ZIndex
	}, {
		HeaderBarContainer = Element,
		VideoPreview = if NoThumbnailImage then ReactModule.createElement(LoadableVideoModule, {
			AnchorPoint = Frame.AnchorPoint,
			BackgroundTransparency = Frame.BackgroundTransparency,
			cornerRadius = Frame.cornerRadius,
			Looped = Frame.Looped,
			onLoaded = UseResult,
			Playing = Frame.Playing,
			Position = Frame.Position,
			renderOnFailed = Frame.renderOnFailed,
			scaleType = Frame.scaleType,
			Size = Frame.Size,
			Video = Frame.Video,
			VideoContent = Frame.VideoContent,
			videoRef = Frame.videoRef
		}) else ReactModule.createElement(View, {
			tag = "align-x-center align-y-center auto-xy items-center gap-medium"
		}, {
			Text = ReactModule.createElement(Text, { Text = "No video to display", tag = "auto-xy" })
		}),
		ProgressBarContainer = if Current1 == nil or Frame.isZooming or UseStateResult6 or Frame.isOverlayDisabled then nil else ReactModule.createElement(View, {
			tag = "anchor-bottom-center position-bottom-center size-full-0 auto-y",
			ZIndex = 3
		}, {
			ProgressBar = ReactModule.createElement(ProgressBarModule, {
				isMuted = UseStateResult4,
				isPlaying = not UseStateResult3,
				isTimeHidden = Frame.isTimeHidden,
				onMuteButtonActivated = UseResult4,
				onPlayButtonActivated = UseResult1,
				onProgressBarActivated = UseResult3,
				timePosition = UseStateResult,
				timeLength = UseStateResult1
			})
		}),
		ShadowBlock = if UseStateResult6 or Frame.isOverlayDisabled then nil else ReactModule.createElement(View, {
			tag = "size-full-full",
			ZIndex = 2,
			backgroundStyle = { Transparency = 0.4, Color3 = Color3.fromRGB(0, 0, 0) },
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			}
		}),
		ThumbnailImage = if IsNotThumbnailImageMatch then ReactModule.createElement(Image, {
			ZIndex = 2,
			Image = Frame.thumbnailImage,
			Size = UDim2.fromScale(1, 1)
		}, {
			UICorner = if Frame.cornerRadius then ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Frame.cornerRadius) }) else nil
		}) else nil
	})
end