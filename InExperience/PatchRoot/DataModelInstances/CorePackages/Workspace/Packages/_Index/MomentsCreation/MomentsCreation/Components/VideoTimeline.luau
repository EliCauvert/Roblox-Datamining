local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local view = foundationModule.View
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local useState = reactModule.useState
local useTokens = foundationModule.Hooks.useTokens
local useSignalBinding = signalsReactModule.useSignalBinding
local useSignalState = signalsReactModule.useSignalState
local getCaptureVideoContentModule = require(momentsCreation.Capture.getCaptureVideoContent)
local sampleVideoFramesModule = require(momentsCreation.Capture.sampleVideoFrames)
local useTimelineSeekControllerModule = require(momentsCreation.Hooks.useTimelineSeekController)
local fFlagMomentsTTSScrubberDragInOverlayModule = require(momentsCreation.Flags.FFlagMomentsTTSScrubberDragInOverlay)
local fFlagMomentsScrubberSeekOnReleaseModule = require(momentsCreation.Flags.FFlagMomentsScrubberSeekOnRelease)
local _ = require(momentsCreation.Types.CreationFlowTypes)

return function(p1)
	-- upvalues: useTokens (ref), useSignalState (ref), useTimelineSeekControllerModule (ref), useState (ref), useEffect (ref), getCaptureVideoContentModule (ref), sampleVideoFramesModule (ref), useMemo (ref), reactModule (ref), view (ref), signalsModule (ref), fFlagMomentsScrubberSeekOnReleaseModule (ref), useSignalBinding (ref), fFlagMomentsTTSScrubberDragInOverlayModule (ref)
	local playback = p1.playback
	local var1 = useTokens()
	local height = p1.height or 50
	local var2 = if p1.interactive ~= nil then false else p1.interactive
	local var3 = useSignalState(playback.getDuration)
	local var4 = useSignalState(playback.getRegion)
	local var5 = useTimelineSeekControllerModule(playback, p1.onSeek, var2, p1.dragOnly == true)
	local containerRef = var5.containerRef
	local dragDetectorRef = var5.dragDetectorRef
	local playheadDragDetectorRef = var5.playheadDragDetectorRef
	local var6, var7 = useState({})
	useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), getCaptureVideoContentModule (copy), var4 (ref), sampleVideoFramesModule (copy), var7 (ref)
		if p1.capture == nil or var3 <= 0 then return end
		local var8 = getCaptureVideoContentModule(p1.capture)
		
		if var8 == nil and typeof(p1.capture) ~= "table" then
			local ok, status = pcall(Content.fromObject, p1.capture)
			
			if ok then
				var8 = status
			end
		end
		if var8 ~= nil then
			sampleVideoFramesModule(var8, var3, var7, if var4 ~= nil then 0 else var4.startTime)
		end
	end, { p1.capture, var3, var4 })
	local var8 = useSignalBinding(useMemo(function()
		-- upvalues: signalsModule (copy), fFlagMomentsScrubberSeekOnReleaseModule (copy), var5 (ref), playback (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: fFlagMomentsScrubberSeekOnReleaseModule (copy), var5 (copy), playback (copy)
			if fFlagMomentsScrubberSeekOnReleaseModule and var5.getDragFraction ~= nil then
				local dragFraction = var5.getDragFraction(p2)
				
				if dragFraction ~= nil then
					return math.clamp(dragFraction, 0, 1)
				end
			end
			local duration = playback.getDuration(p2)
			
			return if duration <= 0 then 0 else math.clamp(playback.getPosition(p2) / duration, 0, 1)
		end)
	end, { playback, var5.getDragFraction }))
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, height),
		ref = containerRef
	}, {
		DragDetector = if var2 then reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
			ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
			ref = dragDetectorRef
		}) else nil,
		FilmStrip = reactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1)
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var1.Radius.Medium) }),
			FrameLayout = reactModule.createElement(view, {
				tag = "size-full-full",
				layout = {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, var1.Size.Size_50),
					SortOrder = Enum.SortOrder.LayoutOrder
				}
			}, useMemo(function()
				-- upvalues: var3 (ref), var6 (ref), reactModule (copy), view (copy)
				local t = {}
				
				for i = 1, math.max(1, math.floor(var3)) do
					local var9 = var6[i]
					t["frame_" .. i] = reactModule.createElement(view, {
						tag = "shrink size-full-full bg-system-neutral",
						LayoutOrder = i
					}, {
						content = reactModule.createElement("ImageLabel", {
							BackgroundTransparency = 1,
							Size = UDim2.fromScale(1, 1),
							ImageContent = var9 and var9.Image,
							ScaleType = Enum.ScaleType.Crop
						})
					})
				end
				return t
			end, { var3, var6 }))
		}),
		Overlays = if p1.children then reactModule.createElement(reactModule.Fragment, nil, p1.children) else nil,
		Playhead = reactModule.createElement(view, {
			ZIndex = 3,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = var8:map(function(p2)
				return UDim2.fromScale(p2, 0.5)
			end),
			Size = UDim2.new(0, 4, 1, 20),
			cornerRadius = UDim.new(0, 2),
			backgroundStyle = var1.Color.System.Contrast
		}),
		PlayheadDragHandle = if var2 and fFlagMomentsTTSScrubberDragInOverlayModule then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 3,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = var8:map(function(p2)
				return UDim2.fromScale(p2, 0.5)
			end),
			Size = UDim2.new(0, 24, 1, 20)
		}, {
			DragDetector = reactModule.createElement("UIDragDetector", {
				DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
				ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
				ref = playheadDragDetectorRef
			})
		}) else nil
	})
end