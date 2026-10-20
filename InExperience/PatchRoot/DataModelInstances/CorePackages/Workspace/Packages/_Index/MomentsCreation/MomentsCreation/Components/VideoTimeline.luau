local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local View = FoundationModule.View
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local UseStateFunction = ReactModule.useState
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalBindingFunction = SignalsReactModule.useSignalBinding
local UseSignalStateFunction = SignalsReactModule.useSignalState
local GetCaptureVideoContentModule = require(MomentsCreation.Capture.getCaptureVideoContent)
local SampleVideoFramesModule = require(MomentsCreation.Capture.sampleVideoFrames)
local UseTimelineSeekControllerModule = require(MomentsCreation.Hooks.useTimelineSeekController)
local FFlagMomentsTTSScrubberDragInOverlayModule = require(MomentsCreation.Flags.FFlagMomentsTTSScrubberDragInOverlay)
local FFlagMomentsScrubberSeekOnReleaseModule = require(MomentsCreation.Flags.FFlagMomentsScrubberSeekOnRelease)
local _ = require(MomentsCreation.Types.CreationFlowTypes)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseSignalStateFunction (copy), UseTimelineSeekControllerModule (copy), UseStateFunction (copy), UseEffectFunction (copy), GetCaptureVideoContentModule (copy), SampleVideoFramesModule (copy), UseMemoFunction (copy), ReactModule (copy), View (copy), SignalsModule (copy), FFlagMomentsScrubberSeekOnReleaseModule (copy), UseSignalBindingFunction (copy), FFlagMomentsTTSScrubberDragInOverlayModule (copy)
	local Playback = p1.playback
	local UseTokensResult = UseTokensFunction()
	local Height = p1.height or 50
	local Interactive = p1.interactive ~= nil and p1.interactive
	local UseSignalStateResult: number = UseSignalStateFunction(Playback.getDuration)
	local UseSignalStateResult1 = UseSignalStateFunction(Playback.getRegion)
	local UseTimelineSeekControllerModuleResult = UseTimelineSeekControllerModule(Playback, p1.onSeek, Interactive, p1.dragOnly == true)
	local ContainerRef = UseTimelineSeekControllerModuleResult.containerRef
	local DragDetectorRef = UseTimelineSeekControllerModuleResult.dragDetectorRef
	local PlayheadDragDetectorRef = UseTimelineSeekControllerModuleResult.playheadDragDetectorRef
	local UseStateResult, UseStateResult2 = UseStateFunction({})
	UseEffectFunction(function()
		-- upvalues: p1 (copy), UseSignalStateResult (copy), GetCaptureVideoContentModule (upval), UseSignalStateResult1 (copy), SampleVideoFramesModule (upval), UseStateResult2 (copy)
		if p1.capture == nil or UseSignalStateResult <= 0 then return end
		local CaptureVideoContentModule = GetCaptureVideoContentModule(p1.capture)
		
		if CaptureVideoContentModule == nil and typeof(p1.capture) ~= "table" then
			local Success, Result = pcall(Content.fromObject, p1.capture)
			
			if Success then
				CaptureVideoContentModule = Result
			end
		end
		if CaptureVideoContentModule ~= nil then
			SampleVideoFramesModule(CaptureVideoContentModule, UseSignalStateResult, UseStateResult2, if UseSignalStateResult1 == nil then 0 else UseSignalStateResult1.startTime)
		end
	end, { p1.capture, UseSignalStateResult, UseSignalStateResult1 })
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: UseSignalStateResult (copy), UseStateResult (copy), ReactModule (upval), View (upval)
		local Elements = {}
		
		for i = 1, math.max(1, (math.floor(UseSignalStateResult))) do
			local UseStateResultEntry = UseStateResult[i]
			Elements["frame_" .. i] = ReactModule.createElement(View, {
				tag = "shrink size-full-full bg-system-neutral",
				LayoutOrder = i
			}, {
				content = ReactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ImageContent = UseStateResultEntry and UseStateResultEntry.Image,
					ScaleType = Enum.ScaleType.Crop
				})
			})
		end
		return Elements
	end, { UseSignalStateResult, UseStateResult })
	local UseSignalBindingResult = UseSignalBindingFunction((UseMemoFunction(function()
		-- upvalues: SignalsModule (upval), FFlagMomentsScrubberSeekOnReleaseModule (upval), UseTimelineSeekControllerModuleResult (copy), Playback (copy)
		return SignalsModule.createComputed(function(p2): number
			-- upvalues: FFlagMomentsScrubberSeekOnReleaseModule (upval), UseTimelineSeekControllerModuleResult (upval), Playback (upval)
			if FFlagMomentsScrubberSeekOnReleaseModule and UseTimelineSeekControllerModuleResult.getDragFraction ~= nil then
				local DragFraction: number = UseTimelineSeekControllerModuleResult.getDragFraction(p2)
				
				if DragFraction ~= nil then
					return (math.clamp(DragFraction, 0, 1))
				end
			end
			local Duration: number = Playback.getDuration(p2)
			
			return if Duration <= 0 then 0 else math.clamp(Playback.getPosition(p2) / Duration, 0, 1)
		end)
	end, {
		Playback,
		UseTimelineSeekControllerModuleResult.getDragFraction
	})))
	local MapResult = if p1.playheadPosition == nil then UseSignalBindingResult:map(function(XScale): UDim2
		return UDim2.fromScale(XScale, 0.5)
	end) else UDim2.fromScale(if UseSignalStateResult > 0 then math.clamp(p1.playheadPosition / UseSignalStateResult, 0, 1) else 0, 0.5)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, Height),
		ref = ContainerRef
	}, {
		DragDetector = if Interactive then ReactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
			ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
			ref = DragDetectorRef
		}) else nil,
		FilmStrip = ReactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1)
		}, {
			Corner = ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
			}),
			FrameLayout = ReactModule.createElement(View, {
				tag = "size-full-full",
				layout = {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, UseTokensResult.Size.Size_50),
					SortOrder = Enum.SortOrder.LayoutOrder
				}
			}, UseMemoResult)
		}),
		Overlays = if p1.children then ReactModule.createElement(ReactModule.Fragment, nil, p1.children) else nil,
		Playhead = ReactModule.createElement(View, {
			ZIndex = 3,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = MapResult,
			Size = UDim2.new(0, 4, 1, 20),
			cornerRadius = UDim.new(0, 2),
			backgroundStyle = UseTokensResult.Color.System.Contrast
		}),
		PlayheadDragHandle = if Interactive and FFlagMomentsTTSScrubberDragInOverlayModule then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 3,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = MapResult,
			Size = UDim2.new(0, 24, 1, 20)
		}, {
			DragDetector = ReactModule.createElement("UIDragDetector", {
				DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
				ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
				ref = PlayheadDragDetectorRef
			})
		}) else nil
	})
end