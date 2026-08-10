local tiltLoadingScreen = script:FindFirstAncestor("TiltLoadingScreen")
local parent = tiltLoadingScreen.Parent.Parent
local reactModule = require(parent.React)
local motionModule = require(parent.Motion)
local runService = game:GetService("RunService")
local fFlagTiltLoadingScreenEnterExitHold = require(parent.SharedFlags).FFlagTiltLoadingScreenEnterExitHold
local constantsModule = require(tiltLoadingScreen.Constants)
local ANIMATION = constantsModule.ANIMATION
local LOCKUP = constantsModule.LOCKUP
local TILT_DEGREES = constantsModule.KEYART.TILT_DEGREES
local var5 = motionModule.createState({
	keyart = 0,
	frame = 0,
	title = 0,
	creator = 0,
	verified = 0
})

local function revealed(p0, p1) --[[ line: 25 ]]
	-- upvalues: motionModule (ref)
	return motionModule.createState(p0, { default = motionModule.transition({ duration = p1 }) })
end

local var7 = revealed({ keyart = 1 }, ANIMATION.artDur)
local var8 = revealed({ frame = 1 }, ANIMATION.artDur)
local var9 = revealed({ title = 1 }, ANIMATION.textDur)
local var10 = revealed({ creator = 1, verified = 1 }, ANIMATION.textDur)
local var11 = motionModule.createState({
	keyart = 0,
	frame = 0,
	title = 0,
	creator = 0,
	verified = 0
}, {
	default = motionModule.transition({ duration = ANIMATION.closeDur })
})
local var12 = motionModule.createState({
	keyart = 1,
	frame = 1,
	title = 1,
	creator = 1,
	verified = 1
}, { default = motionModule.transition({ duration = 0 }) })

local function clamp01(value) --[[ line: 54 ]]
	return math.clamp(value, 0, 1)
end

local function scaleFromReveal(p2) --[[ line: 58 ]]
	return math.min(1, math.clamp(p2, 0, 1) * 0.5 + 0.5)
end

local function slideFromReveal(p3, p4) --[[ line: 62 ]]
	return UDim.new(0, (1 - math.clamp(p3, 0, 1)) * p4)
end

local _ = require(tiltLoadingScreen.Types)

return function(p5) --[[ line: 76 | named "useLoadingScreenAnimation" ]]
	-- upvalues: motionModule (ref), var5 (ref), reactModule (ref), var10 (ref), fFlagTiltLoadingScreenEnterExitHold (ref), ANIMATION (ref), var9 (ref), var7 (ref), var8 (ref), var11 (ref), var12 (ref), runService (ref), TILT_DEGREES (ref), scaleFromReveal (ref), clamp01 (ref), slideFromReveal (ref), LOCKUP (ref)
	local var16, var17 = motionModule.useMotion(var5)
	local var18 = reactModule.useRef(var17)
	var18.current = var17
	local var19 = reactModule.useRef(p5)
	var19.current = p5
	local var20 = reactModule.useRef(p5.onEnterComplete)
	var20.current = p5.onEnterComplete
	local var21 = reactModule.useRef({})
	local var22 = reactModule.useRef({
		timeline = false,
		cascade = false,
		title = false,
		creator = false,
		enterComplete = false
	})
	local var23, var24 = reactModule.useBinding(0)
	local var25, var26 = reactModule.useBinding(p5.reducedMotion)
	reactModule.useEffect(function() --[[ line: 93 ]]
		-- upvalues: var26 (ref), p5 (ref)
		var26(p5.reducedMotion)
	end, { p5.reducedMotion })
	
	local function cancelScheduled() --[[ line: 97 ]]
		-- upvalues: var21 (ref)
		for i, v in var21.current do
			pcall(task.cancel, v)
		end
		var21.current = {}
	end
	
	local function _(p6, p7) --[[ line: 104 | named "schedule" ]]
		-- upvalues: var21 (ref)
		table.insert(var21.current, task.delay(p6, p7))
	end
	
	local _ = function() --[[ line: 109 | named "canAnimate" ]]
		-- upvalues: var19 (ref)
		local current = var19.current
		
		return not current.reducedMotion and not current.isDismissing
	end
	
	local function fireEnterComplete() --[[ line: 114 ]]
		-- upvalues: var22 (ref), var20 (ref)
		if var22.current.enterComplete then return end
		var22.current.enterComplete = true
		
		if var20.current then
			var20.current()
		end
	end
	
	local function startCreator() --[[ line: 124 ]]
		-- upvalues: var22 (ref), var19 (ref), var18 (ref), var10 (copy), fFlagTiltLoadingScreenEnterExitHold (copy), ANIMATION (copy), fireEnterComplete (ref), var21 (ref)
		if not var22.current.creator then
			local current = var19.current
			
			if current.reducedMotion or current.isDismissing then return end
			var22.current.creator = true
			var18.current(var10)
			
			if fFlagTiltLoadingScreenEnterExitHold then
				table.insert(var21.current, task.delay(ANIMATION.textDur, fireEnterComplete))
			end
			return
		end
	end
	
	local _ = function() --[[ line: 135 | named "startTitle" ]]
		-- upvalues: var22 (ref), var19 (ref), var18 (ref), var9 (copy), ANIMATION (copy), startCreator (ref), var21 (ref)
		if not var22.current.title and var19.current.contentReady then
			local current = var19.current
			
			if not current.reducedMotion and not current.isDismissing then
				var22.current.title = true
				var18.current(var9)
				table.insert(var21.current, task.delay(ANIMATION.titleDelay, startCreator))
				
				return
			end
		end
	end
	
	local function startTimeline() --[[ line: 144 ]]
		-- upvalues: var22 (ref), var19 (ref), var18 (ref), var7 (copy), ANIMATION (copy), var8 (copy), var21 (ref), var9 (copy), startCreator (ref), fFlagTiltLoadingScreenEnterExitHold (copy), var20 (ref)
		if not var22.current.timeline then
			local current = var19.current
			
			if current.reducedMotion or current.isDismissing then return end
			var22.current.timeline = true
			var18.current(var7)
			table.insert(var21.current, task.delay(ANIMATION.artDelay, function() --[[ line: 150 ]]
				-- upvalues: var19 (copy), var18 (copy), var8 (copy)
				local current = var19.current
				
				if not current.reducedMotion and not current.isDismissing then
					var18.current(var8)
				end
			end))
			table.insert(var21.current, task.delay(ANIMATION.cascade, function() --[[ line: 155 ]]
				-- upvalues: var22 (copy), var19 (copy), var18 (copy), var9 (copy), ANIMATION (copy), startCreator (copy), var21 (copy)
				var22.current.cascade = true
				
				if not var22.current.title and var19.current.contentReady then
					local current = var19.current
					
					if current.reducedMotion or current.isDismissing then return end
					var22.current.title = true
					var18.current(var9)
					table.insert(var21.current, task.delay(ANIMATION.titleDelay, startCreator))
				end
			end))
			
			if fFlagTiltLoadingScreenEnterExitHold then
				table.insert(var21.current, task.delay(ANIMATION.artDur, function() --[[ line: 160 ]]
					-- upvalues: var22 (copy), var20 (copy)
					if not var22.current.title then
						if var22.current.enterComplete then return end
						var22.current.enterComplete = true
						
						if var20.current then
							var20.current()
						end
					end
				end))
			end
			return
		end
	end
	
	local _ = function() --[[ line: 168 | named "startExitTimeline" ]]
		-- upvalues: var18 (ref), var11 (copy)
		var18.current(var11)
	end
	
	local function freeze() --[[ line: 172 ]]
		-- upvalues: var18 (ref), motionModule (copy), var16 (ref)
		var18.current(motionModule.createState({
			keyart = var16.keyart:getValue(),
			frame = var16.frame:getValue(),
			title = var16.title:getValue(),
			creator = var16.creator:getValue(),
			verified = var16.verified:getValue()
		}, { default = motionModule.transition({ duration = 0 }) }))
	end
	
	reactModule.useEffect(function() --[[ line: 184 ]]
		-- upvalues: p5 (ref), cancelScheduled (ref), var18 (ref), var5 (copy), var11 (copy), var22 (ref), var12 (copy), fFlagTiltLoadingScreenEnterExitHold (copy), var20 (ref), startTimeline (ref), var19 (ref), var9 (copy), ANIMATION (copy), startCreator (ref), var21 (ref)
		if p5.isDismissing then
			cancelScheduled()
			
			if p5.reducedMotion then
				var18.current(var5)
				
				return
			end
			var18.current(var11)
			
			return
		elseif p5.reducedMotion then
			cancelScheduled()
			var22.current = {
				timeline = true,
				cascade = true,
				title = true,
				creator = true,
				enterComplete = false
			}
			var18.current(var12)
			
			if fFlagTiltLoadingScreenEnterExitHold then
				if var22.current.enterComplete then return end
				var22.current.enterComplete = true
				
				if var20.current then
					var20.current()
					
					return
				end
			end
		else
			startTimeline()
			
			if p5.contentReady and var22.current.cascade and (not var22.current.title and var19.current.contentReady) then
				local current = var19.current
				
				if current.reducedMotion or current.isDismissing then return end
				var22.current.title = true
				var18.current(var9)
				table.insert(var21.current, task.delay(ANIMATION.titleDelay, startCreator))
			end
		end
	end, { p5.contentReady, p5.isDismissing, p5.reducedMotion })
	reactModule.useEffect(function() --[[ line: 207 ]]
		-- upvalues: p5 (ref), runService (copy), var24 (ref)
		if p5.reducedMotion or p5.isDismissing then
			return
		end
		local processTime = os.clock()
		local heartbeatConnection = runService.Heartbeat:Connect(function() --[[ line: 213 ]]
			-- upvalues: var24 (copy), processTime (ref)
			var24(os.clock() - processTime)
		end)
		
		return function() --[[ line: 217 ]]
			-- upvalues: heartbeatConnection (ref)
			heartbeatConnection:Disconnect()
		end
	end, { p5.isDismissing, p5.reducedMotion })
	reactModule.useEffect(function() --[[ line: 222 ]]
		-- upvalues: cancelScheduled (ref), freeze (ref)
		return function() --[[ line: 223 ]]
			-- upvalues: cancelScheduled (copy), freeze (copy)
			cancelScheduled()
			freeze()
		end
	end, {})
	local var32 = reactModule.useRef(nil)
	
	if var32.current == nil then
		var32.current = {
			keyart = {
				rotation = var16.keyart:map(function(p8) --[[ line: 233 ]]
					-- upvalues: TILT_DEGREES (copy)
					return TILT_DEGREES * math.clamp(p8, 0, 1)
				end),
				sizeScale = var16.keyart:map(scaleFromReveal),
				coverTransparency = var16.keyart:map(clamp01)
			},
			frame = {
				rotation = reactModule.joinBindings({
					reveal = var16.frame,
					elapsed = var23,
					shouldReduceMotion = var25
				}):map(function(p9) --[[ line: 244 ]]
					-- upvalues: ANIMATION (copy), TILT_DEGREES (copy)
					local reveal = p9.reveal
					
					return -TILT_DEGREES * reveal + (if not p9.shouldReduceMotion then math.sin(p9.elapsed * ANIMATION.wobbleSpeed * 2 * 3.14159265359 * 0.28 + 0.9) * ANIMATION.wobbleAngle * 1.4 * math.clamp(reveal, 0, 1) else 0)
				end),
				sizeScale = var16.frame:map(scaleFromReveal),
				groupTransparency = var16.frame:map(function(p10) --[[ line: 258 ]]
					return math.min(1, (1 - math.clamp(p10, 0, 1)) * 2)
				end)
			},
			title = {
				reveal = var16.title,
				slide = var16.title:map(function(p11) --[[ line: 264 ]]
					-- upvalues: slideFromReveal (copy), LOCKUP (copy)
					return slideFromReveal(p11, LOCKUP.TITLE_SLIDE)
				end)
			},
			creator = {
				reveal = var16.creator,
				slide = var16.creator:map(function(p12) --[[ line: 270 ]]
					-- upvalues: slideFromReveal (copy), LOCKUP (copy)
					return slideFromReveal(p12, LOCKUP.SUB_SLIDE)
				end)
			},
			verified = { reveal = var16.verified }
		}
	end
	return var32.current
end