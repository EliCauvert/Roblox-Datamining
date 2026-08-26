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

return function(p1)
	-- upvalues: useTokens (ref), useSignalState (ref), reactModule (ref), useDeviceInsets (ref), useCallback (ref), computeSeekFractionModule (ref), UIDragDetectorFixEventPositionEnabledEngineFeature (ref), guiService (ref), useEffect (ref), useState (ref), getCaptureVideoContentModule (ref), sampleVideoFramesModule (ref), useMemo (ref), view (ref), signalsModule (ref), useSignalBinding (ref)
	local playback = p1.playback
	local var1 = useTokens()
	local height = p1.height or 50
	local var2 = if p1.interactive ~= nil then false else p1.interactive
	local var3 = useSignalState(playback.getDuration)
	local var4 = useSignalState(playback.getRegion)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(false)
	local var8 = reactModule.useRef(false)
	local var9 = useDeviceInsets()
	local var10 = useCallback(function(p2)
		-- upvalues: var5 (ref), computeSeekFractionModule (copy), playback (ref), p1 (ref)
		local current = var5.current
		
		if not current then return end
		local var11 = computeSeekFractionModule(p2, current.AbsolutePosition.X, current.AbsoluteSize.X) * playback.getDuration(false)
		playback.seek(var11)
		
		if p1.onSeek then
			p1.onSeek(var11)
		end
	end, { playback, p1.onSeek })
	local var11 = useCallback(function(p2)
		-- upvalues: UIDragDetectorFixEventPositionEnabledEngineFeature (copy), guiService (copy), var9 (ref)
		return if UIDragDetectorFixEventPositionEnabledEngineFeature then p2.X else p2.X - (guiService:GetGuiInset().X + var9.left)
	end, { var9 })
	local var12 = useCallback(function(p2)
		-- upvalues: var7 (ref), playback (ref), var8 (ref), var10 (ref), var11 (ref)
		var7.current = true
		
		if playback.getIsPlaying(false) then
			var8.current = true
			playback.toggle()
		end
		var10(var11(p2))
	end, { playback, var10, var11 })
	local var13 = useCallback(function(p2)
		-- upvalues: var7 (ref), var10 (ref), var11 (ref)
		if var7.current then
			var10(var11(p2))
			
			return
		end
	end, { var10, var11 })
	local var14 = useCallback(function()
		-- upvalues: var7 (ref), var8 (ref), playback (ref)
		if not var7.current then return end
		var7.current = false
		
		if var8.current and not playback.getIsPlaying(false) then
			playback.toggle()
		end
		var8.current = false
	end, { playback })
	useEffect(function()
		-- upvalues: var2 (ref), var6 (ref), var12 (ref), var13 (ref), var14 (ref)
		if not var2 then return end
		local current = var6.current
		
		if current == nil then
			return
		end
		local list = {
			current.DragStart:Connect(var12),
			current.DragContinue:Connect(var13),
			current.DragEnd:Connect(var14)
		}
		
		return function()
			-- upvalues: list (ref)
			for i, v in list do
				v:Disconnect()
			end
		end
	end, { var2, var12, var13, var14 })
	local var15, var16 = useState({})
	useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), getCaptureVideoContentModule (copy), var4 (ref), sampleVideoFramesModule (copy), var16 (ref)
		if p1.capture == nil or var3 <= 0 then return end
		local var17 = getCaptureVideoContentModule(p1.capture)
		
		if var17 == nil and typeof(p1.capture) ~= "table" then
			local ok, status = pcall(Content.fromObject, p1.capture)
			
			if ok then
				var17 = status
			end
		end
		if var17 ~= nil then
			sampleVideoFramesModule(var17, var3, var16, if var4 ~= nil then 0 else var4.startTime)
		end
	end, { p1.capture, var3, var4 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, height),
		ref = var5
	}, {
		DragDetector = if var2 then reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
			ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
			ref = var6
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
				-- upvalues: var3 (ref), var15 (ref), reactModule (copy), view (copy)
				local t = {}
				
				for i = 1, math.max(1, math.floor(var3)) do
					local var17 = var15[i]
					t["frame_" .. i] = reactModule.createElement(view, {
						tag = "shrink size-full-full bg-system-neutral",
						LayoutOrder = i
					}, {
						content = reactModule.createElement("ImageLabel", {
							BackgroundTransparency = 1,
							Size = UDim2.fromScale(1, 1),
							ImageContent = var17 and var17.Image,
							ScaleType = Enum.ScaleType.Crop
						})
					})
				end
				return t
			end, { var3, var15 }))
		}),
		Overlays = if p1.children then reactModule.createElement(reactModule.Fragment, nil, p1.children) else nil,
		Playhead = reactModule.createElement(view, {
			ZIndex = 3,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = useSignalBinding(useMemo(function()
				-- upvalues: signalsModule (copy), playback (ref)
				return signalsModule.createComputed(function(p2)
					-- upvalues: playback (copy)
					local duration = playback.getDuration(p2)
					
					return if duration <= 0 then 0 else math.clamp(playback.getPosition(p2) / duration, 0, 1)
				end)
			end, { playback })):map(function(p2)
				return UDim2.fromScale(p2, 0.5)
			end),
			Size = UDim2.new(0, 4, 1, 20),
			cornerRadius = UDim.new(0, 2),
			backgroundStyle = var1.Color.System.Contrast
		})
	})
end