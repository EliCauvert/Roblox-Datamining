local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local View = FoundationModule.View
local Text = FoundationModule.Text
local MarqueeTextMotionModule = require(script.Parent.MarqueeTextMotion)
local MarqueePlayStatus = require(SocialCarousel.Common.Enums).MarqueePlayStatus

local function renderCopy(Text1, FontStyle, XOffset1, XOffset)
	-- upvalues: ReactModule (copy), Text (copy)
	return ReactModule.createElement(Text, {
		tag = "auto-y text-align-x-left content-default",
		Text = Text1,
		fontStyle = FontStyle,
		TextTruncate = Enum.TextTruncate.None,
		Size = UDim2.fromOffset(XOffset, 0),
		Position = UDim2.fromOffset(XOffset1, 0)
	})
end

return function(Frame)
	-- upvalues: UseTokensFunction (copy), UsePreferencesFunction (copy), MarqueeTextMotionModule (copy), MarqueePlayStatus (copy), ReactModule (copy), View (copy), renderCopy (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local UsePreferencesResult = UsePreferencesFunction()
	local FontStyle = Frame.fontStyle or UseTokensResult.Typography.LabelSmall
	local DEFAULTSPEED = if Frame.speed == nil then MarqueeTextMotionModule.DEFAULT_SPEED else Frame.speed
	local DEFAULTMAXLOOPS = if Frame.maxLoops == nil then MarqueeTextMotionModule.DEFAULT_MAX_LOOPS else Frame.maxLoops
	local PlayStatus = Frame.playStatus or MarqueePlayStatus.Playing
	local ReducedMotion = if Frame.reducedMotion == nil then UsePreferencesResult.reducedMotion else Frame.reducedMotion
	local Direction = Frame.direction or MarqueeTextMotionModule.textDirectionFromLocale(game:GetService("LocalizationService").RobloxLocaleId)
	local Heartbeat = Frame.heartbeat or game:GetService("RunService").Heartbeat
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(false)
	local TravelDistanceResult: number = MarqueeTextMotionModule.travelDistance(UseStateResult, UseStateResult1)
	local OverflowsResult = MarqueeTextMotionModule.overflows(UseStateResult, UseStateResult1)
	local IsNotRequiresOverflow = PlayStatus ~= MarqueePlayStatus.Idle and (not ReducedMotion and (not UseStateResult3 and (TravelDistanceResult > 0 and (Frame.requiresOverflow ~= true or OverflowsResult))))
	local IsPlayStatusMatch: boolean = IsNotRequiresOverflow and PlayStatus == MarqueePlayStatus.Playing
	local OverflowsResult1 = not IsNotRequiresOverflow and OverflowsResult
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseBindingResult2 (copy), UseStateResult2_2 (copy)
		UseRefResult.current = 0
		UseRefResult1.current = false
		UseBindingResult2(0)
		UseStateResult2_2(false)
	end, { Frame.text, DEFAULTMAXLOOPS, ReducedMotion, Frame.runId })
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: IsPlayStatusMatch (copy), MarqueeTextMotionModule (upval), UseBindingResult (copy), UseRefResult (copy), TravelDistanceResult (copy), DEFAULTSPEED (copy), DEFAULTMAXLOOPS (copy), UseRefResult1 (copy), UseBindingResult2 (copy), UseStateResult2_2 (copy), Frame (copy)
		if not IsPlayStatusMatch then return end
		local AdvanceResult = MarqueeTextMotionModule.advance({
			finished = false,
			offset = UseBindingResult:getValue(),
			loopsCompleted = UseRefResult.current
		}, TravelDistanceResult, DEFAULTSPEED, p1, DEFAULTMAXLOOPS)
		UseRefResult.current = AdvanceResult.loopsCompleted
		
		if not AdvanceResult.finished then
			UseBindingResult2(AdvanceResult.offset)
		elseif UseRefResult1.current then return end
		UseRefResult1.current = true
		UseBindingResult2(0)
		UseStateResult2_2(true)
		
		if Frame.onFinished then
			Frame.onFinished()
			
			return
		end
	end, {
		IsPlayStatusMatch, TravelDistanceResult, DEFAULTSPEED, DEFAULTMAXLOOPS,
		Frame.onFinished, UseBindingResult
	})
	ReactModule.useEffect(function()
		-- upvalues: IsPlayStatusMatch (copy), Heartbeat (copy), UseResult (copy)
		if IsPlayStatusMatch then
			local Connection = Heartbeat:Connect(UseResult)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		else
			return function() end
		end
	end, { IsPlayStatusMatch, Heartbeat, UseResult })
	local IsDirectionMatch = Direction == Enum.TextDirection.RightToLeft
	local MapResult = UseBindingResult:map(function(p1): UDim2
		-- upvalues: IsNotRequiresOverflow (copy), MarqueeTextMotionModule (upval), Direction (copy), IsDirectionMatch (copy)
		if IsNotRequiresOverflow then
			local SignedOffsetResult = MarqueeTextMotionModule.signedOffset(p1, Direction)
			
			return if IsDirectionMatch then UDim2.new(1, SignedOffsetResult, 0, 0) else UDim2.fromOffset(SignedOffsetResult, 0)
		else
			return UDim2.fromOffset(0, 0)
		end
	end)
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y clip",
		LayoutOrder = Frame.LayoutOrder,
		onAbsoluteSizeChanged = function(Frame)
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(Frame.AbsoluteSize.X)
		end
	}, {
		Measure = ReactModule.createElement(Text, {
			TextTransparency = 1,
			tag = "size-0 auto-x",
			Text = Frame.text,
			fontStyle = FontStyle,
			TextTruncate = Enum.TextTruncate.None,
			onAbsoluteSizeChanged = function(Frame)
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(Frame.AbsoluteSize.X)
			end
		}),
		Content = if IsNotRequiresOverflow then ReactModule.createElement(View, {
			tag = "auto-y no-clip",
			Size = UDim2.fromOffset(TravelDistanceResult + UseStateResult, 0),
			AnchorPoint = if IsDirectionMatch then Vector2.new(1, 0) else Vector2.new(0, 0),
			Position = MapResult
		}, {
			Leading = renderCopy(Frame.text, FontStyle, if IsDirectionMatch then TravelDistanceResult else 0, UseStateResult),
			Trailing = renderCopy(Frame.text, FontStyle, if IsDirectionMatch then 0 else TravelDistanceResult, UseStateResult)
		}) else ReactModule.createElement(Text, {
			testId = "marquee-text",
			Text = Frame.text,
			fontStyle = FontStyle,
			TextTruncate = if OverflowsResult1 then Enum.TextTruncate.AtEnd else Enum.TextTruncate.None,
			tag = {
				["size-full-0 auto-y text-align-x-center text-truncate-end content-default"] = OverflowsResult1,
				["size-full-0 auto-y text-align-x-center content-default"] = not OverflowsResult1
			}
		})
	})
end