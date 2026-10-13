local tiltLoadingScreen = script:FindFirstAncestor("TiltLoadingScreen")
local parent = tiltLoadingScreen.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local motionModule = require(parent_1.Motion)
local _ = require(parent.LoadingScreenMilestones.Types)
local contentId = require(parent.LoadingScreenMilestones.Constants).ContentId
local runService = game:GetService("RunService")
local fFlagLoadingScreenMilestones = require(parent_1.SharedFlags).FFlagLoadingScreenMilestones
local fFlagTiltLoadingScreenEnterExitHold = require(parent_1.SharedFlags).FFlagTiltLoadingScreenEnterExitHold
local constantsModule = require(tiltLoadingScreen.Constants)
local ANIMATION = constantsModule.ANIMATION
local LOCKUP = constantsModule.LOCKUP
local TILT_DEGREES = constantsModule.KEYART.TILT_DEGREES
local var1 = motionModule.createState({
	keyart = 0,
	frame = 0,
	title = 0,
	creator = 0,
	verified = 0
})

local function revealed(p1, p2)
	-- upvalues: motionModule (ref)
	return motionModule.createState(p1, { default = motionModule.transition({ duration = p2 }) })
end

local var2 = revealed({ keyart = 1 }, ANIMATION.artDur)
local var3 = revealed({ frame = 1 }, ANIMATION.artDur)
local var4 = revealed({ title = 1 }, ANIMATION.textDur)
local var5 = revealed({ creator = 1, verified = 1 }, ANIMATION.textDur)
local var6 = motionModule.createState({
	keyart = 0,
	frame = 0,
	title = 0,
	creator = 0,
	verified = 0
}, {
	default = motionModule.transition({ duration = ANIMATION.closeDur })
})
local var7 = motionModule.createState({
	keyart = 1,
	frame = 1,
	title = 1,
	creator = 1,
	verified = 1
}, { default = motionModule.transition({ duration = 0 }) })

local function clamp01(value)
	return math.clamp(value, 0, 1)
end

local function scaleFromReveal(p1)
	return math.min(1, math.clamp(p1, 0, 1) * 0.5 + 0.5)
end

local function slideFromReveal(p1, p2)
	return UDim.new(0, (1 - math.clamp(p1, 0, 1)) * p2)
end

local _ = require(tiltLoadingScreen.Types)

return function(p1)
	-- upvalues: motionModule (ref), var1 (ref), reactModule (ref), fFlagLoadingScreenMilestones (ref), var5 (ref), contentId (ref), fFlagTiltLoadingScreenEnterExitHold (ref), ANIMATION (ref), var4 (ref), var2 (ref), var3 (ref), var6 (ref), var7 (ref), runService (ref), TILT_DEGREES (ref), scaleFromReveal (ref), clamp01 (ref), slideFromReveal (ref), LOCKUP (ref)
	local var8, var9 = motionModule.useMotion(var1)
	local var10 = reactModule.useRef(var9)
	var10.current = var9
	local var11 = if fFlagLoadingScreenMilestones then reactModule.useRef({}) else nil
	local var12 = if fFlagLoadingScreenMilestones then reactModule.useRef(p1.onContentRevealComplete) else nil
	
	if fFlagLoadingScreenMilestones then
		reactModule.useLayoutEffect(function()
			-- upvalues: var12 (ref), p1 (ref)
			if var12 then
				var12.current = p1.onContentRevealComplete
			end
			return function()
				-- upvalues: var12 (copy)
				if var12 then
					var12.current = nil
				end
			end
		end, { p1.onContentRevealComplete })
	end
	local var13 = reactModule.useRef(p1)
	var13.current = p1
	local var14 = reactModule.useRef(p1.onEnterComplete)
	var14.current = p1.onEnterComplete
	local var15 = reactModule.useRef({})
	local var16 = reactModule.useRef({
		timeline = false,
		cascade = false,
		title = false,
		creator = false,
		enterComplete = false
	})
	local var17, var18 = reactModule.useBinding(0)
	local var19, var20 = reactModule.useBinding(p1.reducedMotion)
	reactModule.useEffect(function()
		-- upvalues: var20 (ref), p1 (ref)
		var20(p1.reducedMotion)
	end, { p1.reducedMotion })
	
	local function cancelScheduled()
		-- upvalues: var15 (ref)
		for i, v in var15.current do
			pcall(task.cancel, v)
		end
		var15.current = {}
	end
	
	local function _(p2, p3)
		-- upvalues: var15 (ref)
		table.insert(var15.current, task.delay(p2, p3))
	end
	
	local _ = function()
		-- upvalues: var13 (ref)
		local current = var13.current
		
		return not current.reducedMotion and not current.isDismissing
	end
	
	local function fireEnterComplete()
		-- upvalues: var16 (ref), var14 (ref)
		if var16.current.enterComplete then return end
		var16.current.enterComplete = true
		
		if var14.current then
			var14.current()
		end
	end
	
	local function animateContentReveal(p2, p3)
		-- upvalues: var11 (ref), var10 (ref), var13 (ref), var12 (ref)
		local t = {}
		
		for i, v in p3 do
			var11.current[v] = t
		end
		var10.current(p2, {
			onAnimationComplete = function(p4)
				-- upvalues: var13 (copy), var12 (copy), p3 (ref), var11 (ref), t (ref)
				if p4 ~= true or var13.current.isDismissing then return end
				local var21 = if var12 then var12.current else nil
				
				if var21 then
					for i, v in p3 do
						if var11.current[v] == t then
							var21(v)
						end
					end
				end
			end
		})
	end
	
	local function startCreator()
		-- upvalues: var16 (ref), var13 (ref), fFlagLoadingScreenMilestones (copy), animateContentReveal (ref), var5 (copy), contentId (copy), var10 (ref), fFlagTiltLoadingScreenEnterExitHold (copy), ANIMATION (copy), fireEnterComplete (ref), var15 (ref)
		if not var16.current.creator then
			local current = var13.current
			
			if current.reducedMotion or current.isDismissing then return end
			var16.current.creator = true
			
			if fFlagLoadingScreenMilestones then
				animateContentReveal(var5, { contentId.Creator })
			else
				var10.current(var5)
			end
			if fFlagTiltLoadingScreenEnterExitHold then
				table.insert(var15.current, task.delay(ANIMATION.textDur, fireEnterComplete))
			end
			return
		end
	end
	
	local function startTitle()
		-- upvalues: var16 (ref), var13 (ref), fFlagLoadingScreenMilestones (copy), animateContentReveal (ref), var4 (copy), contentId (copy), var10 (ref), ANIMATION (copy), startCreator (ref), var15 (ref)
		if not var16.current.title and var13.current.contentReady then
			local current = var13.current
			
			if current.reducedMotion or current.isDismissing then return end
			var16.current.title = true
			
			if fFlagLoadingScreenMilestones then
				animateContentReveal(var4, { contentId.Title })
			else
				var10.current(var4)
			end
			table.insert(var15.current, task.delay(ANIMATION.titleDelay, startCreator))
			
			return
		end
	end
	
	local function startTimeline()
		-- upvalues: var16 (ref), var13 (ref), fFlagLoadingScreenMilestones (copy), animateContentReveal (ref), var2 (copy), contentId (copy), var10 (ref), ANIMATION (copy), var3 (copy), var15 (ref), startTitle (ref), fFlagTiltLoadingScreenEnterExitHold (copy), var14 (ref)
		if not var16.current.timeline then
			local current = var13.current
			
			if current.reducedMotion or current.isDismissing then return end
			var16.current.timeline = true
			
			if fFlagLoadingScreenMilestones then
				animateContentReveal(var2, { contentId.Thumbnail })
			else
				var10.current(var2)
			end
			table.insert(var15.current, task.delay(ANIMATION.artDelay, function()
				-- upvalues: var13 (copy), var10 (copy), var3 (copy)
				local current = var13.current
				
				if not current.reducedMotion and not current.isDismissing then
					var10.current(var3)
				end
			end))
			table.insert(var15.current, task.delay(ANIMATION.cascade, function()
				-- upvalues: var16 (copy), startTitle (copy)
				var16.current.cascade = true
				startTitle()
			end))
			
			if fFlagTiltLoadingScreenEnterExitHold then
				table.insert(var15.current, task.delay(ANIMATION.artDur, function()
					-- upvalues: var16 (copy), var14 (copy)
					if not var16.current.title then
						if var16.current.enterComplete then return end
						var16.current.enterComplete = true
						
						if var14.current then
							var14.current()
						end
					end
				end))
			end
			return
		end
	end
	
	local _ = function()
		-- upvalues: var10 (ref), var6 (copy)
		var10.current(var6)
	end
	
	local function freeze()
		-- upvalues: var10 (ref), motionModule (copy), var8 (ref)
		var10.current(motionModule.createState({
			keyart = var8.keyart:getValue(),
			frame = var8.frame:getValue(),
			title = var8.title:getValue(),
			creator = var8.creator:getValue(),
			verified = var8.verified:getValue()
		}, { default = motionModule.transition({ duration = 0 }) }))
	end
	
	reactModule.useEffect(function()
		-- upvalues: fFlagLoadingScreenMilestones (copy), var11 (ref), p1 (ref), cancelScheduled (ref), var10 (ref), var1 (copy), var6 (copy), var16 (ref), animateContentReveal (ref), var7 (copy), contentId (copy), fFlagTiltLoadingScreenEnterExitHold (copy), var14 (ref), startTimeline (ref), startTitle (ref)
		if fFlagLoadingScreenMilestones and var11 and (p1.isDismissing or p1.reducedMotion) then
			var11.current = {}
		end
		if p1.isDismissing then
			cancelScheduled()
			
			if p1.reducedMotion then
				var10.current(var1)
				
				return
			end
			var10.current(var6)
			
			return
		elseif p1.reducedMotion then
			cancelScheduled()
			var16.current = {
				timeline = true,
				cascade = true,
				title = true,
				creator = true,
				enterComplete = false
			}
			
			if fFlagLoadingScreenMilestones then
				animateContentReveal(var7, { contentId.Title, contentId.Creator, contentId.Thumbnail })
			else
				var10.current(var7)
			end
			if fFlagTiltLoadingScreenEnterExitHold then
				if var16.current.enterComplete then return end
				var16.current.enterComplete = true
				
				if var14.current then
					var14.current()
					
					return
				end
			end
		else
			startTimeline()
			
			if p1.contentReady and var16.current.cascade then
				startTitle()
			end
		end
	end, { p1.contentReady, p1.isDismissing, p1.reducedMotion })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), runService (copy), var18 (ref)
		if p1.reducedMotion or p1.isDismissing then
			return
		end
		local processTime = os.clock()
		local heartbeatConnection = runService.Heartbeat:Connect(function()
			-- upvalues: var18 (copy), processTime (ref)
			var18(os.clock() - processTime)
		end)
		
		return function()
			-- upvalues: heartbeatConnection (ref)
			heartbeatConnection:Disconnect()
		end
	end, { p1.isDismissing, p1.reducedMotion })
	reactModule.useEffect(function()
		-- upvalues: fFlagLoadingScreenMilestones (copy), var11 (ref), cancelScheduled (ref), freeze (ref)
		return function()
			-- upvalues: fFlagLoadingScreenMilestones (copy), var11 (copy), cancelScheduled (copy), freeze (copy)
			if fFlagLoadingScreenMilestones and var11 then
				var11.current = {}
			end
			cancelScheduled()
			freeze()
		end
	end, {})
	local var21 = reactModule.useRef(nil)
	
	if var21.current == nil then
		var21.current = {
			keyart = {
				rotation = var8.keyart:map(function(p4)
					-- upvalues: TILT_DEGREES (copy)
					return TILT_DEGREES * math.clamp(p4, 0, 1)
				end),
				sizeScale = var8.keyart:map(scaleFromReveal),
				coverTransparency = var8.keyart:map(clamp01)
			},
			frame = {
				rotation = reactModule.joinBindings({
					reveal = var8.frame,
					elapsed = var17,
					shouldReduceMotion = var19
				}):map(function(p4)
					-- upvalues: ANIMATION (copy), TILT_DEGREES (copy)
					local reveal = p4.reveal
					
					return -TILT_DEGREES * reveal + (if not p4.shouldReduceMotion then math.sin(p4.elapsed * ANIMATION.wobbleSpeed * 2 * 3.14159265359 * 0.28 + 0.9) * ANIMATION.wobbleAngle * 1.4 * math.clamp(reveal, 0, 1) else 0)
				end),
				sizeScale = var8.frame:map(scaleFromReveal),
				groupTransparency = var8.frame:map(function(p4)
					return math.min(1, (1 - math.clamp(p4, 0, 1)) * 2)
				end)
			},
			title = {
				reveal = var8.title,
				slide = var8.title:map(function(p4)
					-- upvalues: slideFromReveal (copy), LOCKUP (copy)
					return slideFromReveal(p4, LOCKUP.TITLE_SLIDE)
				end)
			},
			creator = {
				reveal = var8.creator,
				slide = var8.creator:map(function(p4)
					-- upvalues: slideFromReveal (copy), LOCKUP (copy)
					return slideFromReveal(p4, LOCKUP.SUB_SLIDE)
				end)
			},
			verified = { reveal = var8.verified }
		}
	end
	return var21.current
end