local TiltLoadingScreen = script:FindFirstAncestor("TiltLoadingScreen")
local Parent = TiltLoadingScreen.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local MotionModule = require(Parent1.Motion)
local _ = require(Parent.LoadingScreenMilestones.Types)
local ContentId = require(Parent.LoadingScreenMilestones.Constants).ContentId
local RunService = game:GetService("RunService")
local FFlagLoadingScreenMilestones = require(Parent1.SharedFlags).FFlagLoadingScreenMilestones
local FFlagTiltLoadingScreenEnterExitHold = require(Parent1.SharedFlags).FFlagTiltLoadingScreenEnterExitHold
local ConstantsModule = require(TiltLoadingScreen.Constants)
local ANIMATION = ConstantsModule.ANIMATION
local LOCKUP = ConstantsModule.LOCKUP
local TILTDEGREES = ConstantsModule.KEYART.TILT_DEGREES
local State = MotionModule.createState({
	keyart = 0,
	frame = 0,
	title = 0,
	creator = 0,
	verified = 0
})

local function revealed(p1, ArtDur)
	-- upvalues: MotionModule (copy)
	return MotionModule.createState(p1, { default = MotionModule.transition({ duration = ArtDur }) })
end

local RevealedResult = revealed({ keyart = 1 }, ANIMATION.artDur)
local RevealedResult1 = revealed({ frame = 1 }, ANIMATION.artDur)
local RevealedResult2 = revealed({ title = 1 }, ANIMATION.textDur)
local RevealedResult3 = revealed({ creator = 1, verified = 1 }, ANIMATION.textDur)
local State1 = MotionModule.createState({
	keyart = 0,
	frame = 0,
	title = 0,
	creator = 0,
	verified = 0
}, {
	default = MotionModule.transition({ duration = ANIMATION.closeDur })
})
local State2 = MotionModule.createState({
	keyart = 1,
	frame = 1,
	title = 1,
	creator = 1,
	verified = 1
}, { default = MotionModule.transition({ duration = 0 }) })

local function clamp01(Value: number): number
	return (math.clamp(Value, 0, 1))
end

local function scaleFromReveal(Value: number): number
	return (math.min(1, math.clamp(Value, 0, 1) * 0.5 + 0.5))
end

local function slideFromReveal(Value: number, SUBSLIDE): UDim
	return UDim.new(0, (1 - math.clamp(Value, 0, 1)) * SUBSLIDE)
end

local _ = require(TiltLoadingScreen.Types)

return function(Current)
	-- upvalues: MotionModule (copy), State (copy), ReactModule (copy), FFlagLoadingScreenMilestones (copy), RevealedResult3 (copy), ContentId (copy), FFlagTiltLoadingScreenEnterExitHold (copy), ANIMATION (copy), RevealedResult2 (copy), RevealedResult (copy), RevealedResult1 (copy), State1 (copy), State2 (copy), RunService (copy), TILTDEGREES (copy), scaleFromReveal (copy), clamp01 (copy), slideFromReveal (copy), LOCKUP (copy)
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion(State)
	local UseRefResult = ReactModule.useRef(UseMotionResult2)
	UseRefResult.current = UseMotionResult2
	local UseRefResult1 = if FFlagLoadingScreenMilestones then ReactModule.useRef({}) else nil
	local UseRefResult2 = if FFlagLoadingScreenMilestones then ReactModule.useRef(Current.onContentRevealComplete) else nil
	
	if FFlagLoadingScreenMilestones then
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseRefResult2 (copy), Current (copy)
			if UseRefResult2 then
				UseRefResult2.current = Current.onContentRevealComplete
			end
			return function()
				-- upvalues: UseRefResult2 (upval)
				if UseRefResult2 then
					UseRefResult2.current = nil
				end
			end
		end, { Current.onContentRevealComplete })
	end
	local UseRefResult3 = ReactModule.useRef(Current)
	UseRefResult3.current = Current
	local UseRefResult4 = ReactModule.useRef(Current.onEnterComplete)
	UseRefResult4.current = Current.onEnterComplete
	local UseRefResult5 = ReactModule.useRef({})
	local UseRefResult6 = ReactModule.useRef({
		timeline = false,
		cascade = false,
		title = false,
		creator = false,
		enterComplete = false
	})
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(Current.reducedMotion)
	ReactModule.useEffect(function()
		-- upvalues: UseBindingResult2_1 (copy), Current (copy)
		UseBindingResult2_1(Current.reducedMotion)
	end, { Current.reducedMotion })
	
	local function cancelScheduled()
		-- upvalues: UseRefResult5 (copy)
		for _, value in UseRefResult5.current do
			pcall(task.cancel, value)
		end
		UseRefResult5.current = {}
	end
	
	local function _(Delay, p1)
		-- upvalues: UseRefResult5 (copy)
		table.insert(UseRefResult5.current, (task.delay(Delay, p1)))
	end
	
	local _ = function(): boolean
		-- upvalues: UseRefResult3 (copy)
		local Current = UseRefResult3.current
		
		return not Current.reducedMotion and not Current.isDismissing
	end
	
	local function fireEnterComplete()
		-- upvalues: UseRefResult6 (copy), UseRefResult4 (copy)
		if UseRefResult6.current.enterComplete then return end
		UseRefResult6.current.enterComplete = true
		
		if UseRefResult4.current then
			UseRefResult4.current()
		end
	end
	
	local function animateContentReveal(State, List)
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy), UseRefResult3 (copy), UseRefResult2 (copy)
		local CurrentEntry = {}
		
		for _, value in List do
			UseRefResult1.current[value] = CurrentEntry
		end
		UseRefResult.current(State, {
			onAnimationComplete = function(Enabled)
				-- upvalues: UseRefResult3 (upval), UseRefResult2 (upval), List (copy), UseRefResult1 (copy), CurrentEntry (copy)
				if Enabled ~= true or UseRefResult3.current.isDismissing then return end
				local Current: (any) -> () = if UseRefResult2 then UseRefResult2.current else nil
				
				if Current then
					for _, value in List do
						if UseRefResult1.current[value] == CurrentEntry then
							Current(value)
						end
					end
				end
			end
		})
	end
	
	local function startCreator()
		-- upvalues: UseRefResult6 (copy), UseRefResult3 (copy), FFlagLoadingScreenMilestones (upval), animateContentReveal (copy), RevealedResult3 (upval), ContentId (upval), UseRefResult (copy), FFlagTiltLoadingScreenEnterExitHold (upval), ANIMATION (upval), fireEnterComplete (copy), UseRefResult5 (copy)
		if not UseRefResult6.current.creator then
			local Current = UseRefResult3.current
			
			if not Current.reducedMotion and not Current.isDismissing then
				UseRefResult6.current.creator = true
				
				if FFlagLoadingScreenMilestones then
					animateContentReveal(RevealedResult3, { ContentId.Creator })
				else
					UseRefResult.current(RevealedResult3)
				end
				if FFlagTiltLoadingScreenEnterExitHold then
					table.insert(UseRefResult5.current, (task.delay(ANIMATION.textDur, fireEnterComplete)))
				end
				return
			end
		end
	end
	
	local function startTitle()
		-- upvalues: UseRefResult6 (copy), UseRefResult3 (copy), FFlagLoadingScreenMilestones (upval), animateContentReveal (copy), RevealedResult2 (upval), ContentId (upval), UseRefResult (copy), ANIMATION (upval), startCreator (copy), UseRefResult5 (copy)
		if not UseRefResult6.current.title and UseRefResult3.current.contentReady then
			local Current = UseRefResult3.current
			
			if not Current.reducedMotion and not Current.isDismissing then
				UseRefResult6.current.title = true
				
				if FFlagLoadingScreenMilestones then
					animateContentReveal(RevealedResult2, { ContentId.Title })
				else
					UseRefResult.current(RevealedResult2)
				end
				table.insert(UseRefResult5.current, (task.delay(ANIMATION.titleDelay, startCreator)))
				
				return
			end
		end
	end
	
	local function startTimeline()
		-- upvalues: UseRefResult6 (copy), UseRefResult3 (copy), FFlagLoadingScreenMilestones (upval), animateContentReveal (copy), RevealedResult (upval), ContentId (upval), UseRefResult (copy), ANIMATION (upval), RevealedResult1 (upval), UseRefResult5 (copy), startTitle (copy), FFlagTiltLoadingScreenEnterExitHold (upval), UseRefResult4 (copy)
		if not UseRefResult6.current.timeline then
			local Current = UseRefResult3.current
			
			if not Current.reducedMotion and not Current.isDismissing then
				UseRefResult6.current.timeline = true
				
				if FFlagLoadingScreenMilestones then
					animateContentReveal(RevealedResult, { ContentId.Thumbnail })
				else
					UseRefResult.current(RevealedResult)
				end
				table.insert(UseRefResult5.current, (task.delay(ANIMATION.artDelay, function()
					-- upvalues: UseRefResult3 (upval), UseRefResult (upval), RevealedResult1 (upval)
					local Current = UseRefResult3.current
					
					if not Current.reducedMotion and not Current.isDismissing then
						UseRefResult.current(RevealedResult1)
					end
				end)))
				table.insert(UseRefResult5.current, (task.delay(ANIMATION.cascade, function()
					-- upvalues: UseRefResult6 (upval), startTitle (upval)
					UseRefResult6.current.cascade = true
					startTitle()
				end)))
				
				if FFlagTiltLoadingScreenEnterExitHold then
					table.insert(UseRefResult5.current, (task.delay(ANIMATION.artDur, function()
						-- upvalues: UseRefResult6 (upval), UseRefResult4 (upval)
						if not UseRefResult6.current.title then
							if UseRefResult6.current.enterComplete then return end
							UseRefResult6.current.enterComplete = true
							
							if UseRefResult4.current then
								UseRefResult4.current()
							end
						end
					end)))
				end
				return
			end
		end
	end
	
	local _ = function()
		-- upvalues: UseRefResult (copy), State1 (upval)
		UseRefResult.current(State1)
	end
	
	local function freeze()
		-- upvalues: UseRefResult (copy), MotionModule (upval), UseMotionResult (copy)
		UseRefResult.current(MotionModule.createState({
			keyart = UseMotionResult.keyart:getValue(),
			frame = UseMotionResult.frame:getValue(),
			title = UseMotionResult.title:getValue(),
			creator = UseMotionResult.creator:getValue(),
			verified = UseMotionResult.verified:getValue()
		}, { default = MotionModule.transition({ duration = 0 }) }))
	end
	
	ReactModule.useEffect(function()
		-- upvalues: FFlagLoadingScreenMilestones (upval), UseRefResult1 (copy), Current (copy), cancelScheduled (copy), UseRefResult (copy), State (upval), State1 (upval), UseRefResult6 (copy), animateContentReveal (copy), State2 (upval), ContentId (upval), FFlagTiltLoadingScreenEnterExitHold (upval), UseRefResult4 (copy), startTimeline (copy), startTitle (copy)
		if FFlagLoadingScreenMilestones and UseRefResult1 and (Current.isDismissing or Current.reducedMotion) then
			UseRefResult1.current = {}
		end
		if Current.isDismissing then
			cancelScheduled()
			
			if Current.reducedMotion then
				UseRefResult.current(State)
				
				return
			else
				UseRefResult.current(State1)
				
				return
			end
		else
			if Current.reducedMotion then
				cancelScheduled()
				UseRefResult6.current = {
					timeline = true,
					cascade = true,
					title = true,
					creator = true,
					enterComplete = false
				}
				
				if FFlagLoadingScreenMilestones then
					animateContentReveal(State2, { ContentId.Title, ContentId.Creator, ContentId.Thumbnail })
				else
					UseRefResult.current(State2)
				end
				if FFlagTiltLoadingScreenEnterExitHold then
					if UseRefResult6.current.enterComplete then return end
					UseRefResult6.current.enterComplete = true
					
					if UseRefResult4.current then
						UseRefResult4.current()
						
						return
					end
				end
			else
				startTimeline()
				
				if Current.contentReady and UseRefResult6.current.cascade then
					startTitle()
				end
			end
		end
	end, {
		Current.contentReady,
		Current.isDismissing,
		Current.reducedMotion
	})
	ReactModule.useEffect(function()
		-- upvalues: Current (copy), RunService (upval), UseBindingResult2 (copy)
		if Current.reducedMotion or Current.isDismissing then return end
		local ClockTime = os.clock()
		local HeartbeatConnection = RunService.Heartbeat:Connect(function()
			-- upvalues: UseBindingResult2 (upval), ClockTime (copy)
			UseBindingResult2(os.clock() - ClockTime)
		end)
		
		return function()
			-- upvalues: HeartbeatConnection (copy)
			HeartbeatConnection:Disconnect()
		end
	end, { Current.isDismissing, Current.reducedMotion })
	ReactModule.useEffect(function()
		-- upvalues: FFlagLoadingScreenMilestones (upval), UseRefResult1 (copy), cancelScheduled (copy), freeze (copy)
		return function()
			-- upvalues: FFlagLoadingScreenMilestones (upval), UseRefResult1 (upval), cancelScheduled (upval), freeze (upval)
			if FFlagLoadingScreenMilestones and UseRefResult1 then
				UseRefResult1.current = {}
			end
			cancelScheduled()
			freeze()
		end
	end, {})
	local UseRefResult7 = ReactModule.useRef(nil)
	
	if UseRefResult7.current == nil then
		UseRefResult7.current = {
			keyart = {
				rotation = UseMotionResult.keyart:map(function(Value: number)
					-- upvalues: TILTDEGREES (upval)
					return TILTDEGREES * math.clamp(Value, 0, 1)
				end),
				sizeScale = UseMotionResult.keyart:map(scaleFromReveal),
				coverTransparency = UseMotionResult.keyart:map(clamp01)
			},
			frame = {
				rotation = ReactModule.joinBindings({
					reveal = UseMotionResult.frame,
					elapsed = UseBindingResult,
					shouldReduceMotion = UseBindingResult1
				}):map(function(p1)
					-- upvalues: ANIMATION (upval), TILTDEGREES (upval)
					local Reveal: number = p1.reveal
					local Elapsed = p1.elapsed
					
					return -TILTDEGREES * Reveal + (if p1.shouldReduceMotion then 0 else math.sin(Elapsed * ANIMATION.wobbleSpeed * 2 * 3.141592653589793 * 0.28 + 0.9) * ANIMATION.wobbleAngle * 1.4 * math.clamp(Reveal, 0, 1))
				end),
				sizeScale = UseMotionResult.frame:map(scaleFromReveal),
				groupTransparency = UseMotionResult.frame:map(function(Value: number): number
					return (math.min(1, (1 - math.clamp(Value, 0, 1)) * 2))
				end)
			},
			title = {
				reveal = UseMotionResult.title,
				slide = UseMotionResult.title:map(function(p1)
					-- upvalues: slideFromReveal (upval), LOCKUP (upval)
					return slideFromReveal(p1, LOCKUP.TITLE_SLIDE)
				end)
			},
			creator = {
				reveal = UseMotionResult.creator,
				slide = UseMotionResult.creator:map(function(p1)
					-- upvalues: slideFromReveal (upval), LOCKUP (upval)
					return slideFromReveal(p1, LOCKUP.SUB_SLIDE)
				end)
			},
			verified = { reveal = UseMotionResult.verified }
		}
	end
	return UseRefResult7.current
end