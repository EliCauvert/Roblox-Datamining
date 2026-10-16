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
	-- upvalues: motionModule (ref), var1 (ref), reactModule (ref), var5 (ref), fFlagTiltLoadingScreenEnterExitHold (ref), ANIMATION (ref), var4 (ref), var2 (ref), var3 (ref), var6 (ref), var7 (ref), runService (ref), TILT_DEGREES (ref), scaleFromReveal (ref), clamp01 (ref), slideFromReveal (ref), LOCKUP (ref)
	local var8, var9 = motionModule.useMotion(var1)
	local var10 = reactModule.useRef(var9)
	var10.current = var9
	local var11 = reactModule.useRef(p1)
	var11.current = p1
	local var12 = reactModule.useRef(p1.onEnterComplete)
	var12.current = p1.onEnterComplete
	local var13 = reactModule.useRef({})
	local var14 = reactModule.useRef({
		timeline = false,
		cascade = false,
		title = false,
		creator = false,
		enterComplete = false
	})
	local var15, var16 = reactModule.useBinding(0)
	local var17, var18 = reactModule.useBinding(p1.reducedMotion)
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), p1 (ref)
		var18(p1.reducedMotion)
	end, { p1.reducedMotion })
	
	local function cancelScheduled()
		-- upvalues: var13 (ref)
		for i, v in var13.current do
			pcall(task.cancel, v)
		end
		var13.current = {}
	end
	
	local function _(p2, p3)
		-- upvalues: var13 (ref)
		table.insert(var13.current, task.delay(p2, p3))
	end
	
	local _ = function()
		-- upvalues: var11 (ref)
		local current = var11.current
		
		return not current.reducedMotion and not current.isDismissing
	end
	
	local function fireEnterComplete()
		-- upvalues: var14 (ref), var12 (ref)
		if var14.current.enterComplete then return end
		var14.current.enterComplete = true
		
		if var12.current then
			var12.current()
		end
	end
	
	local function startCreator()
		-- upvalues: var14 (ref), var11 (ref), var10 (ref), var5 (copy), fFlagTiltLoadingScreenEnterExitHold (copy), ANIMATION (copy), fireEnterComplete (ref), var13 (ref)
		if not var14.current.creator then
			local current = var11.current
			
			if current.reducedMotion or current.isDismissing then return end
			var14.current.creator = true
			var10.current(var5)
			
			if fFlagTiltLoadingScreenEnterExitHold then
				table.insert(var13.current, task.delay(ANIMATION.textDur, fireEnterComplete))
			end
			return
		end
	end
	
	local _ = function()
		-- upvalues: var14 (ref), var11 (ref), var10 (ref), var4 (copy), ANIMATION (copy), startCreator (ref), var13 (ref)
		if not var14.current.title and var11.current.contentReady then
			local current = var11.current
			
			if not current.reducedMotion and not current.isDismissing then
				var14.current.title = true
				var10.current(var4)
				table.insert(var13.current, task.delay(ANIMATION.titleDelay, startCreator))
				
				return
			end
		end
	end
	
	local function startTimeline()
		-- upvalues: var14 (ref), var11 (ref), var10 (ref), var2 (copy), ANIMATION (copy), var3 (copy), var13 (ref), var4 (copy), startCreator (ref), fFlagTiltLoadingScreenEnterExitHold (copy), var12 (ref)
		if not var14.current.timeline then
			local current = var11.current
			
			if current.reducedMotion or current.isDismissing then return end
			var14.current.timeline = true
			var10.current(var2)
			table.insert(var13.current, task.delay(ANIMATION.artDelay, function()
				-- upvalues: var11 (copy), var10 (copy), var3 (copy)
				local current = var11.current
				
				if not current.reducedMotion and not current.isDismissing then
					var10.current(var3)
				end
			end))
			table.insert(var13.current, task.delay(ANIMATION.cascade, function()
				-- upvalues: var14 (copy), var11 (copy), var10 (copy), var4 (copy), ANIMATION (copy), startCreator (copy), var13 (copy)
				var14.current.cascade = true
				
				if not var14.current.title and var11.current.contentReady then
					local current = var11.current
					
					if current.reducedMotion or current.isDismissing then return end
					var14.current.title = true
					var10.current(var4)
					table.insert(var13.current, task.delay(ANIMATION.titleDelay, startCreator))
				end
			end))
			
			if fFlagTiltLoadingScreenEnterExitHold then
				table.insert(var13.current, task.delay(ANIMATION.artDur, function()
					-- upvalues: var14 (copy), var12 (copy)
					if not var14.current.title then
						if var14.current.enterComplete then return end
						var14.current.enterComplete = true
						
						if var12.current then
							var12.current()
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
		-- upvalues: p1 (ref), cancelScheduled (ref), var10 (ref), var1 (copy), var6 (copy), var14 (ref), var7 (copy), fFlagTiltLoadingScreenEnterExitHold (copy), var12 (ref), startTimeline (ref), var11 (ref), var4 (copy), ANIMATION (copy), startCreator (ref), var13 (ref)
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
			var14.current = {
				timeline = true,
				cascade = true,
				title = true,
				creator = true,
				enterComplete = false
			}
			var10.current(var7)
			
			if fFlagTiltLoadingScreenEnterExitHold then
				if var14.current.enterComplete then return end
				var14.current.enterComplete = true
				
				if var12.current then
					var12.current()
					
					return
				end
			end
		else
			startTimeline()
			
			if p1.contentReady and var14.current.cascade and (not var14.current.title and var11.current.contentReady) then
				local current = var11.current
				
				if current.reducedMotion or current.isDismissing then return end
				var14.current.title = true
				var10.current(var4)
				table.insert(var13.current, task.delay(ANIMATION.titleDelay, startCreator))
			end
		end
	end, { p1.contentReady, p1.isDismissing, p1.reducedMotion })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), runService (copy), var16 (ref)
		if p1.reducedMotion or p1.isDismissing then
			return
		end
		local processTime = os.clock()
		local heartbeatConnection = runService.Heartbeat:Connect(function()
			-- upvalues: var16 (copy), processTime (ref)
			var16(os.clock() - processTime)
		end)
		
		return function()
			-- upvalues: heartbeatConnection (ref)
			heartbeatConnection:Disconnect()
		end
	end, { p1.isDismissing, p1.reducedMotion })
	reactModule.useEffect(function()
		-- upvalues: cancelScheduled (ref), freeze (ref)
		return function()
			-- upvalues: cancelScheduled (copy), freeze (copy)
			cancelScheduled()
			freeze()
		end
	end, {})
	local var19 = reactModule.useRef(nil)
	
	if var19.current == nil then
		var19.current = {
			keyart = {
				rotation = var8.keyart:map(function(p2)
					-- upvalues: TILT_DEGREES (copy)
					return TILT_DEGREES * math.clamp(p2, 0, 1)
				end),
				sizeScale = var8.keyart:map(scaleFromReveal),
				coverTransparency = var8.keyart:map(clamp01)
			},
			frame = {
				rotation = reactModule.joinBindings({
					reveal = var8.frame,
					elapsed = var15,
					shouldReduceMotion = var17
				}):map(function(p2)
					-- upvalues: ANIMATION (copy), TILT_DEGREES (copy)
					local reveal = p2.reveal
					
					return -TILT_DEGREES * reveal + (if not p2.shouldReduceMotion then math.sin(p2.elapsed * ANIMATION.wobbleSpeed * 2 * 3.14159265359 * 0.28 + 0.9) * ANIMATION.wobbleAngle * 1.4 * math.clamp(reveal, 0, 1) else 0)
				end),
				sizeScale = var8.frame:map(scaleFromReveal),
				groupTransparency = var8.frame:map(function(p2)
					return math.min(1, (1 - math.clamp(p2, 0, 1)) * 2)
				end)
			},
			title = {
				reveal = var8.title,
				slide = var8.title:map(function(p2)
					-- upvalues: slideFromReveal (copy), LOCKUP (copy)
					return slideFromReveal(p2, LOCKUP.TITLE_SLIDE)
				end)
			},
			creator = {
				reveal = var8.creator,
				slide = var8.creator:map(function(p2)
					-- upvalues: slideFromReveal (copy), LOCKUP (copy)
					return slideFromReveal(p2, LOCKUP.SUB_SLIDE)
				end)
			},
			verified = { reveal = var8.verified }
		}
	end
	return var19.current
end