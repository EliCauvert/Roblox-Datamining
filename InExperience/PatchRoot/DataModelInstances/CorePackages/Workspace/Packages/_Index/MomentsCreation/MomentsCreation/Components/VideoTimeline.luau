local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local guiService = game:GetService("GuiService")
local view = foundationModule.View
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local useState = reactModule.useState
local useTokens = foundationModule.Hooks.useTokens
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useSignalBinding = signalsReactModule.useSignalBinding
local useSignalState = signalsReactModule.useSignalState
local computeSeekFractionModule = require(momentsCreation.Utils.computeSeekFraction)
local getCaptureVideoContentModule = require(momentsCreation.Capture.getCaptureVideoContent)
local sampleVideoFramesModule = require(momentsCreation.Capture.sampleVideoFrames)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local UIDragDetectorFixEventPositionEnabledEngineFeature = game:GetEngineFeature("UIDragDetectorFixEventPositionEnabled")

return function(p0) --[[ line: 58 | named "VideoTimeline" ]]
	-- upvalues: useTokens (ref), useSignalState (ref), reactModule (ref), useDeviceInsets (ref), useCallback (ref), computeSeekFractionModule (ref), UIDragDetectorFixEventPositionEnabledEngineFeature (ref), guiService (ref), useEffect (ref), useState (ref), getCaptureVideoContentModule (ref), sampleVideoFramesModule (ref), useMemo (ref), view (ref), signalsModule (ref), useSignalBinding (ref)
	local playback = p0.playback
	local var11 = useTokens()
	local height = p0.height or 50
	local var13 = if p0.interactive ~= nil then false else p0.interactive
	local var14 = useSignalState(playback.getDuration)
	local var15 = useSignalState(playback.getRegion)
	local var16 = reactModule.useRef(nil)
	local var17 = reactModule.useRef(nil)
	local var18 = reactModule.useRef(false)
	local var19 = reactModule.useRef(false)
	local var20 = useDeviceInsets()
	local var21 = useCallback(function(p1) --[[ line: 78 ]]
		-- upvalues: var16 (ref), computeSeekFractionModule (copy), playback (ref), p0 (ref)
		local current = var16.current
		
		if not current then return end
		local var28 = computeSeekFractionModule(p1, current.AbsolutePosition.X, current.AbsoluteSize.X) * playback.getDuration(false)
		playback.seek(var28)
		
		if p0.onSeek then
			p0.onSeek(var28)
		end
	end, { playback, p0.onSeek })
	local var22 = useCallback(function(p2) --[[ line: 96 ]]
		-- upvalues: UIDragDetectorFixEventPositionEnabledEngineFeature (copy), guiService (copy), var20 (ref)
		return if UIDragDetectorFixEventPositionEnabledEngineFeature then p2.X else p2.X - (guiService:GetGuiInset().X + var20.left)
	end, { var20 })
	local var23 = useCallback(function(p3) --[[ line: 104 ]]
		-- upvalues: var18 (ref), playback (ref), var19 (ref), var21 (ref), var22 (ref)
		var18.current = true
		
		if playback.getIsPlaying(false) then
			var19.current = true
			playback.toggle()
		end
		var21(var22(p3))
	end, { playback, var21, var22 })
	local var24 = useCallback(function(p4) --[[ line: 113 ]]
		-- upvalues: var18 (ref), var21 (ref), var22 (ref)
		if var18.current then
			var21(var22(p4))
			
			return
		end
	end, { var21, var22 })
	local var25 = useCallback(function() --[[ line: 120 ]]
		-- upvalues: var18 (ref), var19 (ref), playback (ref)
		if not var18.current then return end
		var18.current = false
		
		if var19.current and not playback.getIsPlaying(false) then
			playback.toggle()
		end
		var19.current = false
	end, { playback })
	useEffect(function() --[[ line: 131 ]]
		-- upvalues: var13 (ref), var17 (ref), var23 (ref), var24 (ref), var25 (ref)
		if not var13 then return end
		local current = var17.current
		
		if current == nil then
			return
		end
		local list = {
			current.DragStart:Connect(var23),
			current.DragContinue:Connect(var24),
			current.DragEnd:Connect(var25)
		}
		
		return function() --[[ line: 144 ]]
			-- upvalues: list (ref)
			for i, v in list do
				v:Disconnect()
			end
		end
	end, { var13, var23, var24, var25 })
	local var26, var27 = useState({})
	useEffect(function() --[[ line: 153 ]]
		-- upvalues: p0 (ref), var14 (ref), getCaptureVideoContentModule (copy), var15 (ref), sampleVideoFramesModule (copy), var27 (ref)
		if p0.capture == nil or var14 <= 0 then return end
		local var30 = getCaptureVideoContentModule(p0.capture)
		
		if var30 == nil and typeof(p0.capture) ~= "table" then
			local ok, status = pcall(Content.fromObject, p0.capture)
			
			if ok then
				var30 = status
			end
		end
		if var30 ~= nil then
			sampleVideoFramesModule(var30, var14, var27, if var15 ~= nil then 0 else var15.startTime)
		end
	end, { p0.capture, var14, var15 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		Size = UDim2.new(1, 0, 0, height),
		ref = var16
	}, {
		DragDetector = if var13 then reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
			ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
			ref = var17
		}) else nil,
		FilmStrip = reactModule.createElement("CanvasGroup", {
			BackgroundTransparency = 1,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1)
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var11.Radius.Medium) }),
			FrameLayout = reactModule.createElement(view, {
				tag = "size-full-full",
				layout = {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, var11.Size.Size_50),
					SortOrder = Enum.SortOrder.LayoutOrder
				}
			}, useMemo(function() --[[ line: 170 ]]
				-- upvalues: var14 (ref), var26 (ref), reactModule (copy), view (copy)
				local t = {}
				
				for i = 1, math.max(1, math.floor(var14)) do
					local var32 = var26[i]
					t["frame_" .. i] = reactModule.createElement(view, {
						tag = "shrink size-full-full bg-system-neutral",
						LayoutOrder = i
					}, {
						content = reactModule.createElement("ImageLabel", {
							BackgroundTransparency = 1,
							Size = UDim2.fromScale(1, 1),
							ImageContent = var32 and var32.Image,
							ScaleType = Enum.ScaleType.Crop
						})
					})
				end
				return t
			end, { var14, var26 }))
		}),
		Overlays = if p0.children then reactModule.createElement(reactModule.Fragment, nil, p0.children) else nil,
		Playhead = reactModule.createElement(view, {
			ZIndex = 3,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = useSignalBinding(useMemo(function() --[[ line: 190 ]]
				-- upvalues: signalsModule (copy), playback (ref)
				return signalsModule.createComputed(function(p6) --[[ line: 191 ]]
					-- upvalues: playback (copy)
					local duration = playback.getDuration(p6)
					
					return if duration <= 0 then 0 else math.clamp(playback.getPosition(p6) / duration, 0, 1)
				end)
			end, { playback })):map(function(p5) --[[ line: 242 ]]
				return UDim2.fromScale(p5, 0.5)
			end),
			Size = UDim2.new(0, 4, 1, 20),
			cornerRadius = UDim.new(0, 2),
			backgroundStyle = var11.Color.System.Contrast
		})
	})
end