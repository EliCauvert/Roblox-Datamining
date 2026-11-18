local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local GetTestIdFunction = require(Parent.RoactUtils).getTestId
local ResponsiveModule = require(Parent.Responsive)
local _ = require(Parent.SduiCoreSystem)
local VideoUtilsModule = require(Parent.VideoUtils)
local SduiGameVideoThumbnailModule = require(ServerDrivenUi.Content.SduiGameVideoThumbnail)
local GetSduiFullBleedHeroFadesModule = require(ServerDrivenUi.Content.getSduiFullBleedHeroFades)
local GetInputModeStoreFunction = ResponsiveModule.GetInputModeStore
local UseTokensFunction = FoundationModule.Hooks.useTokens
local VideoEndReason = VideoUtilsModule.AnalyticsEnums.VideoEndReason

local function _(p1: number): number
	return (math.ceil(p1 / 1.7777777777777777))
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), VideoEndReason (copy), GetInputModeStoreFunction (copy), ResponsiveModule (copy), GetSduiFullBleedHeroFadesModule (copy), SduiGameVideoThumbnailModule (copy), GetTestIdFunction (copy)
	local UseTokensResult = UseTokensFunction()
	local UniverseId = p1.universeId or ""
	local PlaceId = p1.placeId or ""
	local UseRefResult = ReactModule.useRef(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding({
		heroWidth = 0,
		heroHeight = 0,
		leftBleed = 0,
		rightBleed = 0,
		topBleed = 0
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), p1 (copy), UseBindingResult2 (copy)
		local Current = UseRefResult.current
		
		if Current == nil then return end
		local Current1 = if p1.verticalScrollingFrameRef then p1.verticalScrollingFrameRef.current else nil
		local config = {
			leftBleed = 0,
			rightBleed = 0,
			topBleed = 0,
			heroWidth = Current.AbsoluteSize.X,
			heroHeight = Current.AbsoluteSize.Y
		}
		
		if Current1 then
			local AbsolutePosition = Current.AbsolutePosition
			local AbsolutePosition1 = Current1.AbsolutePosition
			local X = Current1.AbsoluteWindowSize.X
			local NewY = AbsolutePosition.Y - AbsolutePosition1.Y + Current1.CanvasPosition.Y
			config.leftBleed = math.max(0, AbsolutePosition.X - AbsolutePosition1.X)
			config.rightBleed = math.max(0, AbsolutePosition1.X + X - (AbsolutePosition.X + Current.AbsoluteSize.X))
			config.topBleed = math.max(0, NewY)
		end
		UseBindingResult2(config)
	end, { UseBindingResult2, p1.verticalScrollingFrameRef })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy), p1 (copy)
		UseResult()
		local Current = if p1.verticalScrollingFrameRef then p1.verticalScrollingFrameRef.current else nil
		
		if Current == nil then
			return nil
		else
			local Connection = Current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(UseResult)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end
	end, { UseResult, p1.verticalScrollingFrameRef })
	local OnActivatedFunction = p1.onActivated
	local SurfaceColor3 = UseTokensResult.Color.Surface.Surface_0.Color3
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetSduiFullBleedHeroFadesModule (upval), p1 (copy)
		return GetSduiFullBleedHeroFadesModule(p1.bottomFadeEasingExponent, p1.cornerScrimEasingExponent)
	end, {
		p1.bottomFadeEasingExponent,
		p1.cornerScrimEasingExponent
	})
	local BackgroundBottomBleed = p1.backgroundBottomBleed or 0
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseBindingResult (copy), BackgroundBottomBleed (copy)
		return {
			fadePosition = UseBindingResult:map(function(p2): UDim2
				-- upvalues: BackgroundBottomBleed (upval)
				return UDim2.new(0, 0, 1, -math.max(p2.heroHeight + p2.topBleed + BackgroundBottomBleed - math.ceil(math.ceil(p2.heroWidth + p2.leftBleed + p2.rightBleed) / 1.7777777777777777), 0))
			end),
			mediaSize = UseBindingResult:map(function(p2): UDim2
				local Ceiled = math.ceil(p2.heroWidth + p2.leftBleed + p2.rightBleed)
				
				return UDim2.fromOffset(Ceiled, (math.ceil(Ceiled / 1.7777777777777777)))
			end),
			backgroundPosition = UseBindingResult:map(function(p2): UDim2
				return UDim2.fromOffset(-p2.leftBleed, -p2.topBleed)
			end),
			backgroundSize = UseBindingResult:map(function(p2): UDim2
				-- upvalues: BackgroundBottomBleed (upval)
				return UDim2.new(1, p2.leftBleed + p2.rightBleed, 1, p2.topBleed + BackgroundBottomBleed)
			end)
		}
	end, { UseBindingResult, BackgroundBottomBleed })
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p1.layoutOrder,
		ref = UseRefResult,
		[ReactModule.Change.AbsoluteSize] = UseResult,
		[ReactModule.Event.MouseEnter] = ReactModule.useCallback(function()
			-- upvalues: GetInputModeStoreFunction (upval), ResponsiveModule (upval), UseStateResult2 (copy)
			if GetInputModeStoreFunction(false).getPreferredInputType(false) == ResponsiveModule.Input.Pointer then
				UseStateResult2(true)
			end
		end, {}),
		[ReactModule.Event.MouseLeave] = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end, {}),
		[ReactModule.Tag] = GetTestIdFunction(p1.testId or "sdui-full-bleed-hero")
	}, {
		Background = ReactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			ZIndex = 1,
			BackgroundColor3 = SurfaceColor3,
			Position = UseMemoResult1.backgroundPosition,
			Size = UseMemoResult1.backgroundSize
		}, {
			Image = if p1.backgroundImage == nil or p1.backgroundImage == "" then nil else ReactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 1,
				Size = UseMemoResult1.mediaSize,
				Image = p1.backgroundImage,
				ScaleType = Enum.ScaleType.Crop
			}),
			MediaCover = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Size = UseMemoResult1.mediaSize
			}, {
				Media = ReactModule.createElement(SduiGameVideoThumbnailModule, {
					cornerRadius = 0,
					sduiContext = p1.sduiContext,
					analyticsContext = p1.analyticsContext,
					videoPlayer = p1.videoPlayer,
					universeId = UniverseId,
					placeId = PlaceId,
					isHovered = UseStateResult,
					isSelected = UseStateResult1,
					playbackCandidateRef = UseRefResult,
					isUserIntentModeAutoplayCandidate = p1.isUserIntentModeAutoplayCandidate ~= false
				})
			}),
			CornerScrim = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 3,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = SurfaceColor3
			}, {
				Gradient = ReactModule.createElement("UIGradient", {
					Rotation = p1.cornerScrimRotation or -70,
					Transparency = UseMemoResult.cornerScrimTransparency
				})
			}),
			BottomFade = ReactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				ZIndex = 4,
				AnchorPoint = Vector2.new(0, 1),
				Position = UseMemoResult1.fadePosition,
				Size = UDim2.new(1, 0, 0, p1.bottomFadeHeight or 0),
				BackgroundColor3 = SurfaceColor3
			}, {
				Gradient = ReactModule.createElement("UIGradient", {
					Rotation = 90,
					Transparency = UseMemoResult.bottomFadeTransparency
				})
			})
		}),
		TapTarget = ReactModule.createElement("TextButton", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			AutoButtonColor = false,
			Selectable = true,
			SelectionImageObject = p1.sduiContext.dependencies.cursors.tileCursor,
			ZIndex = 2,
			[ReactModule.Event.Activated] = ReactModule.useCallback(function()
				-- upvalues: p1 (copy), VideoEndReason (upval), UniverseId (copy), OnActivatedFunction (copy)
				local VideoPlaybackContext = p1.sduiContext.videoPlaybackContext
				
				if VideoPlaybackContext then
					VideoPlaybackContext.videoPlaybackCoordinator:reset(VideoEndReason.TileClicked, nil, UniverseId, nil)
				end
				if OnActivatedFunction then
					OnActivatedFunction()
				end
			end, { OnActivatedFunction, p1.sduiContext, UniverseId }),
			[ReactModule.Event.SelectionGained] = ReactModule.useCallback(function()
				-- upvalues: UseStateResult2_1 (copy)
				UseStateResult2_1(true)
			end, {}),
			[ReactModule.Event.SelectionLost] = ReactModule.useCallback(function()
				-- upvalues: UseStateResult2_1 (copy)
				UseStateResult2_1(false)
			end, {})
		}),
		Content = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 3,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1),
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, { ContentComponent = p1.contentComponent })
	})
end