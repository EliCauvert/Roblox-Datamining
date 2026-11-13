--!native

local _ = require("../types")
local RampModule = require("./ramp")
local CodecModule = require("./codec")
local DiagnosticsModule = require("../diagnostics")
local DynamicModule = require("../dynamic")
local EasingModule = require("./easing")
local HostModule = require("../host")
local OwnerModule = require("../ownership/owner")
local SpringModule = require("./spring")
local _ = require("../reactive/types")
local CellModule = require("../reactive/cell")
local WatchModule = require("../reactive/watch")
local NodeModule = require("../reactive/node")

local function running(p1)
	-- upvalues: NodeModule (copy), DiagnosticsModule (copy), CellModule (copy)
	local AsValueNodeResult = NodeModule.asValueNode(p1)
	local Activity = if AsValueNodeResult == nil then nil else AsValueNodeResult.activity
	
	if Activity == nil then
		return DiagnosticsModule.raise("animation/not-animated", "running needs an animated value", { expected = "a spring, tween or ramp value" })
	end
	local Value = Activity.value
	
	if Value == nil then
		Value = CellModule.cell(Activity.active)
		Activity.value = Value
	end
	return Value
end

local function _(p1, p2)
	-- upvalues: DiagnosticsModule (copy)
	local Frames = p1.frames
	
	return if Frames == nil then DiagnosticsModule.raise("animation/no-frames", ("host %q cannot drive %s"):format(p1.name, p2), {
		contract = "animation needs a frame loop, which is the host frames capability",
		fix = "implement host.frames.onFrame and host.frames.now, or animate outside Compose"
	}) else Frames
end

local function policyOf(Callback, p1)
	-- upvalues: CellModule (copy), DiagnosticsModule (copy)
	if Callback == nil then
		return nil
	elseif type(Callback) == "function" then
		return Callback
	elseif CellModule.isValue(Callback) then
		return function(Callback1)
			-- upvalues: Callback (copy)
			return Callback1(Callback)
		end
	else
		error(DiagnosticsModule.format("animation/bad-reduced-motion", ("%s cannot read this reduced motion policy"):format(p1), {
			key = "reducedMotion",
			expected = "a cell, a formula or a body returning a boolean",
			contract = "the policy is read reactively, because the setting changes while the application runs",
			actual = DiagnosticsModule.describe(Callback)
		}), 0)
		
		return nil
	end
end

local function advance(p1, p2, p3)
	-- upvalues: SpringModule (copy), EasingModule (copy)
	local Current = p1.current
	local Target = p1.target
	local Reference = p1.reference
	local Settings = p1.settings
	local AtRestResult = nil
	
	if Settings.ease == nil then
		SpringModule.advance(p1, Target, p2, Settings[1], Settings[2])
		AtRestResult = SpringModule.atRest(p1, Target, Reference, Settings[3])
		
		if AtRestResult then
			SpringModule.settle(p1, Target)
		end
		if p1.position ~= Current then
			for i1 = 1, p3.arity do
				Current[i1] = p1.position[i1]
			end
		end
	else
		Settings[1] = math.min(Settings[1] + p2, Settings[2])
		AtRestResult = Settings[2] <= Settings[1]
		local v1 = (Settings.ease or EasingModule.linear)(Settings[1] / Settings[2])
		
		for i = 1, p3.arity do
			Current[i] = if AtRestResult then Target[i] else Reference[i] + (Target[i] - Reference[i]) * v1
		end
	end
	local NormaliseFunction: (any) -> () = p3.normalise
	
	if NormaliseFunction ~= nil then
		NormaliseFunction(Current)
	end
	p1.output:set(p3.decode(Current))
	
	return AtRestResult
end

return {
	createMotion = function(p4, Callback, p5)
		-- upvalues: CodecModule (copy), DynamicModule (copy), advance (copy), OwnerModule (copy), DiagnosticsModule (copy), HostModule (copy), CellModule (copy), SpringModule (copy), policyOf (copy), EasingModule (copy), WatchModule (copy), running (copy), RampModule (copy)
		CodecModule.validate(p5)
		local t = {}
		local Count = 0
		local Count1 = 0
		local OnFrameResult = nil
		local Flag = false
		local Count2 = 0
		local v2 = 0
		
		local function compact()
			-- upvalues: Flag (ref), Count (ref), Count1 (ref), t (copy)
			if Flag or Count == Count1 then return end
			local Count2 = 0
			
			for i = 1, Count do
				local Entry = t[i]
				
				if Entry then
					Count2 += 1
					t[Count2] = Entry
					Entry.settings[4] = Count2
				end
			end
			for i1 = Count, Count2 + 1, -1 do
				t[i1] = nil
			end
			Count = Count2
		end
		
		local function stop(Settings)
			-- upvalues: DynamicModule (upval), t (copy), Count1 (ref), OnFrameResult (ref)
			local RawResult = DynamicModule.raw(Settings, 4)
			
			if type(RawResult) ~= "number" then return end
			local Entry = t[RawResult]
			
			if Entry == nil or Entry.settings ~= Settings then return end
			t[RawResult] = nil
			Entry.settings[4] = 0
			Count1 -= 1
			
			if Count1 == 0 and OnFrameResult then
				local Callback: () -> () = OnFrameResult
				OnFrameResult = nil
				Callback()
			end
			Entry.activity.active = false
			local Value = Entry.activity.value
			
			if Value ~= nil then
				Value:set(false)
			end
		end
		
		local function sweep(p6)
			-- upvalues: Count2 (ref), v2 (ref), t (copy), advance (upval), p5 (copy), stop (copy)
			while Count2 < v2 do
				Count2 += 1
				local Entry = t[Count2]
				
				if Entry and advance(Entry, p6, p5) then
					stop(Entry.settings)
				end
			end
		end
		
		local function onFrame(p7)
			-- upvalues: Count2 (ref), v2 (ref), Flag (ref), Count (ref), sweep (copy), compact (copy), OwnerModule (upval)
			local Count1: number = Count2
			local v3 = v2
			local Flag1: boolean = Flag
			Count2 = 0
			v2 = Count
			Flag = true
			local v4 = nil
			while true do
				local Success, Result = pcall(sweep, p7)
				if Success then break end
				local List = v4 or {}
				v4 = List
				table.insert(List, Result)
			end
			Count2 = Count1
			v2 = v3
			Flag = Flag1
			compact()
			
			if v4 then
				OwnerModule.raiseAll(v4)
			end
		end
		
		local function _(p8, p9, Entry, p10)
			-- upvalues: p4 (copy), DiagnosticsModule (upval), Callback (copy), OwnerModule (upval), HostModule (upval), p5 (copy), CellModule (upval), stop (copy), SpringModule (upval), compact (copy), Count (ref), Count1 (ref), t (copy), OnFrameResult (ref), onFrame (copy)
			local Frames = p4.frames
			local NoFrames = if Frames == nil then DiagnosticsModule.raise("animation/no-frames", ("host %q cannot drive %s"):format(p4.name, p8), {
				contract = "animation needs a frame loop, which is the host frames capability",
				fix = "implement host.frames.onFrame and host.frames.now, or animate outside Compose"
			}) else Frames
			local CallbackResult = Callback(p8)
			Entry[4] = 0
			local v5 = nil
			local TypeNameOfResult = ""
			OwnerModule.effectHeld(CallbackResult, function(p11)
				-- upvalues: p9 (copy), p10 (copy), v5 (ref), TypeNameOfResult (ref), HostModule (upval), p4 (upval), p5 (upval), Entry (copy), CellModule (upval), OwnerModule (upval), CallbackResult (copy), stop (upval), DiagnosticsModule (upval), p8 (copy), SpringModule (upval), compact (upval), Count (upval), Count1 (upval), t (upval), OnFrameResult (upval), NoFrames (copy), onFrame (upval)
				local v6 = p9(p11)
				local v7: boolean = p10 ~= nil and p10(p11) == true
				local v8 = v5
				
				if v8 == nil then
					TypeNameOfResult = HostModule.typeNameOf(p4, v6)
					local Buffer = table.create(p5.arity, 0)
					local Buffer1 = table.create(p5.arity, 0)
					local Buffer2 = table.create(p5.arity, 0)
					p5.encode(v6, Buffer)
					p5.encode(v6, Buffer1)
					p5.encode(v6, Buffer2)
					local config = {
						current = Buffer,
						target = Buffer1,
						reference = Buffer2,
						position = if Entry.ease == nil and p5.normalise then table.clone(Buffer) else Buffer,
						velocity = if Entry.ease then Buffer2 else table.create(p5.arity, 0),
						arity = p5.arity,
						output = CellModule.cell(v6),
						activity = { active = false },
						settings = Entry
					}
					v5 = config
					config.output.activity = config.activity
					OwnerModule.holdSubject(CallbackResult, stop, Entry)
					
					return
				end
				if HostModule.typeNameOf(p4, v6) ~= TypeNameOfResult then
					return DiagnosticsModule.raise("animation/type-changed", ("%s was given a different type mid-flight"):format(p8), {
						contract = "an animated value keeps one type for its lifetime",
						fix = "use show or switch to swap between differently-typed values",
						expected = TypeNameOfResult,
						actual = HostModule.typeNameOf(p4, v6)
					})
				end
				local Current = v8.current
				local Target = v8.target
				local Reference = v8.reference
				
				for i = 1, p5.arity do
					Reference[i] = Current[i]
				end
				p5.encode(v6, Target)
				
				if v7 then
					stop(Entry)
					
					if Entry.ease == nil then
						SpringModule.settle(v8, Target)
					end
					for i1 = 1, p5.arity do
						local TargetEntry = Target[i1]
						Current[i1] = Target[i1]
						Reference[i1] = TargetEntry
					end
					local NormaliseFunction: (any) -> () = p5.normalise
					
					if NormaliseFunction then
						NormaliseFunction(Current)
					end
					v8.output:set(p5.decode(Current))
					
					return
				else
					local DurationFunction = Entry.duration
					
					if DurationFunction then
						local DurationResult: number = DurationFunction()
						
						if type(DurationResult) ~= "number" or DurationResult <= 0 then
							return DiagnosticsModule.raise("animation/bad-duration", "a tween's duration source produced a bad length", {
								expected = "positive seconds, e.g. 0.25",
								contract = "a duration source yields positive seconds at every retarget",
								actual = tostring(DurationResult)
							})
						end
						Entry[2] = DurationResult
					end
					if Entry.ease then
						Entry[1] = 0
					end
					if Entry[4] == 0 and not OwnerModule.isDisposed(CallbackResult) then
						compact()
						Count += 1
						Count1 += 1
						Entry[4] = Count
						t[Count] = v8
						
						if OnFrameResult == nil then
							OnFrameResult = NoFrames.onFrame(onFrame)
						end
						v8.activity.active = true
						local Value = v8.activity.value
						
						if Value ~= nil then
							Value:set(true)
						end
					end
				end
			end)
			
			return if v5 == nil then nil else v5.output
		end
		
		local function tween(Callback1, Settings)
			-- upvalues: EasingModule (upval), DiagnosticsModule (upval), WatchModule (upval), CellModule (upval), policyOf (upval), p4 (copy), Callback (copy), OwnerModule (upval), HostModule (upval), p5 (copy), stop (copy), SpringModule (upval), compact (copy), Count (ref), Count1 (ref), t (copy), OnFrameResult (ref), onFrame (copy)
			local Seconds = if Settings == nil or Settings.seconds == nil then 0.25 else Settings.seconds
			local Settings1 = {
				0,
				0.25,
				ease = if Settings and Settings.ease then Settings.ease else EasingModule.linear
			}
			
			if type(Seconds) == "number" then
				Settings1[2] = Seconds
				
				if Seconds <= 0 then
					return DiagnosticsModule.raise("animation/bad-duration", "a tween needs a positive duration", {
						expected = "seconds, e.g. 0.25",
						actual = tostring(Seconds)
					})
				end
			elseif type(Seconds) == "function" then
				function Settings1.duration()
					-- upvalues: WatchModule (upval), Seconds (copy)
					return WatchModule.sample(function()
						-- upvalues: Seconds (upval)
						return Seconds(function(p12)
							return p12:peek()
						end)
					end)
				end
			else
				if not CellModule.isValue(Seconds) then
					return DiagnosticsModule.raise("animation/bad-duration", "a tween duration must be seconds or a source of seconds", {
						expected = "a number, a cell, a formula, or a body, e.g. 0.25",
						contract = "TweenOptions.seconds is a number or a source of one",
						actual = type(Seconds)
					})
				end
				function Settings1.duration()
					-- upvalues: Seconds (copy)
					return Seconds:peek()
				end
			end
			local Tween = policyOf(if Settings == nil then nil else Settings.reducedMotion, "tween")
			local Frames = p4.frames
			local NoFrames = if Frames == nil then DiagnosticsModule.raise("animation/no-frames", ("host %q cannot drive %s"):format(p4.name, "tween"), {
				contract = "animation needs a frame loop, which is the host frames capability",
				fix = "implement host.frames.onFrame and host.frames.now, or animate outside Compose"
			}) else Frames
			local Tween1 = Callback("tween")
			Settings1[4] = 0
			local v9 = nil
			local TypeNameOfResult = ""
			local v10 = "tween"
			OwnerModule.effectHeld(Tween1, function(p12)
				-- upvalues: Callback1 (copy), Tween (copy), v9 (ref), TypeNameOfResult (ref), HostModule (upval), p4 (upval), p5 (upval), Settings1 (copy), CellModule (upval), OwnerModule (upval), Tween1 (copy), stop (upval), DiagnosticsModule (upval), v10 (copy), SpringModule (upval), compact (upval), Count (upval), Count1 (upval), t (upval), OnFrameResult (upval), NoFrames (copy), onFrame (upval)
				local v11 = Callback1(p12)
				local v12: boolean = Tween ~= nil and Tween(p12) == true
				local v13 = v9
				
				if v13 == nil then
					TypeNameOfResult = HostModule.typeNameOf(p4, v11)
					local Buffer = table.create(p5.arity, 0)
					local Buffer1 = table.create(p5.arity, 0)
					local Buffer2 = table.create(p5.arity, 0)
					p5.encode(v11, Buffer)
					p5.encode(v11, Buffer1)
					p5.encode(v11, Buffer2)
					local config = {
						current = Buffer,
						target = Buffer1,
						reference = Buffer2,
						position = if Settings1.ease == nil and p5.normalise then table.clone(Buffer) else Buffer,
						velocity = if Settings1.ease then Buffer2 else table.create(p5.arity, 0),
						arity = p5.arity,
						output = CellModule.cell(v11),
						activity = { active = false },
						settings = Settings1
					}
					v9 = config
					config.output.activity = config.activity
					OwnerModule.holdSubject(Tween1, stop, Settings1)
					
					return
				end
				if HostModule.typeNameOf(p4, v11) ~= TypeNameOfResult then
					return DiagnosticsModule.raise("animation/type-changed", ("%s was given a different type mid-flight"):format(v10), {
						contract = "an animated value keeps one type for its lifetime",
						fix = "use show or switch to swap between differently-typed values",
						expected = TypeNameOfResult,
						actual = HostModule.typeNameOf(p4, v11)
					})
				end
				local Current = v13.current
				local Target = v13.target
				local Reference = v13.reference
				
				for i = 1, p5.arity do
					Reference[i] = Current[i]
				end
				p5.encode(v11, Target)
				
				if v12 then
					stop(Settings1)
					
					if Settings1.ease == nil then
						SpringModule.settle(v13, Target)
					end
					for i1 = 1, p5.arity do
						local TargetEntry = Target[i1]
						Current[i1] = Target[i1]
						Reference[i1] = TargetEntry
					end
					local NormaliseFunction: (any) -> () = p5.normalise
					
					if NormaliseFunction then
						NormaliseFunction(Current)
					end
					v13.output:set(p5.decode(Current))
					
					return
				else
					local DurationFunction = Settings1.duration
					
					if DurationFunction then
						local DurationResult: number = DurationFunction()
						
						if type(DurationResult) ~= "number" or DurationResult <= 0 then
							return DiagnosticsModule.raise("animation/bad-duration", "a tween's duration source produced a bad length", {
								expected = "positive seconds, e.g. 0.25",
								contract = "a duration source yields positive seconds at every retarget",
								actual = tostring(DurationResult)
							})
						end
						Settings1[2] = DurationResult
					end
					if Settings1.ease then
						Settings1[1] = 0
					end
					if Settings1[4] == 0 and not OwnerModule.isDisposed(Tween1) then
						compact()
						Count += 1
						Count1 += 1
						Settings1[4] = Count
						t[Count] = v13
						
						if OnFrameResult == nil then
							OnFrameResult = NoFrames.onFrame(onFrame)
						end
						v13.activity.active = true
						local Value = v13.activity.value
						
						if Value ~= nil then
							Value:set(true)
						end
					end
				end
			end)
			
			return if v9 == nil then nil else v9.output
		end
		
		return {
			spring = function(p13, p14)
				-- upvalues: DiagnosticsModule (upval), SpringModule (upval), policyOf (upval), p4 (copy), Callback (copy), OwnerModule (upval), HostModule (upval), p5 (copy), CellModule (upval), stop (copy), compact (copy), Count (ref), Count1 (ref), t (copy), OnFrameResult (ref), onFrame (copy)
				local Period = if p14 == nil or p14.period == nil then 0.5 else p14.period
				local Damping = if p14 == nil or p14.damping == nil then 1 else p14.damping
				
				if Period <= 0 then
					return DiagnosticsModule.raise("animation/bad-period", "a spring needs a positive period", {
						expected = "seconds for one undamped oscillation, e.g. 0.4",
						actual = tostring(Period)
					})
				else
					local CoefficientsResult, CoefficientsResult2 = SpringModule.coefficients(Period, Damping)
					local Spring = policyOf(if p14 == nil then nil else p14.reducedMotion, "spring")
					local Frames = p4.frames
					local NoFrames = if Frames == nil then DiagnosticsModule.raise("animation/no-frames", ("host %q cannot drive %s"):format(p4.name, "spring"), {
						contract = "animation needs a frame loop, which is the host frames capability",
						fix = "implement host.frames.onFrame and host.frames.now, or animate outside Compose"
					}) else Frames
					local Spring1 = Callback("spring")
					local Settings = {
						CoefficientsResult,
						CoefficientsResult2,
						if p14 == nil or p14.tolerance == nil then 0.0001 else p14.tolerance,
						[4] = 0
					}
					local v14 = nil
					local TypeNameOfResult = ""
					local v15 = "spring"
					OwnerModule.effectHeld(Spring1, function(p15)
						-- upvalues: p13 (copy), Spring (copy), v14 (ref), TypeNameOfResult (ref), HostModule (upval), p4 (upval), p5 (upval), Settings (copy), CellModule (upval), OwnerModule (upval), Spring1 (copy), stop (upval), DiagnosticsModule (upval), v15 (copy), SpringModule (upval), compact (upval), Count (upval), Count1 (upval), t (upval), OnFrameResult (upval), NoFrames (copy), onFrame (upval)
						local v16 = p13(p15)
						local v17: boolean = Spring ~= nil and Spring(p15) == true
						local v18 = v14
						
						if v18 == nil then
							TypeNameOfResult = HostModule.typeNameOf(p4, v16)
							local Buffer = table.create(p5.arity, 0)
							local Buffer1 = table.create(p5.arity, 0)
							local Buffer2 = table.create(p5.arity, 0)
							p5.encode(v16, Buffer)
							p5.encode(v16, Buffer1)
							p5.encode(v16, Buffer2)
							local config = {
								current = Buffer,
								target = Buffer1,
								reference = Buffer2,
								position = if Settings.ease == nil and p5.normalise then table.clone(Buffer) else Buffer,
								velocity = if Settings.ease then Buffer2 else table.create(p5.arity, 0),
								arity = p5.arity,
								output = CellModule.cell(v16),
								activity = { active = false },
								settings = Settings
							}
							v14 = config
							config.output.activity = config.activity
							OwnerModule.holdSubject(Spring1, stop, Settings)
							
							return
						end
						if HostModule.typeNameOf(p4, v16) ~= TypeNameOfResult then
							return DiagnosticsModule.raise("animation/type-changed", ("%s was given a different type mid-flight"):format(v15), {
								contract = "an animated value keeps one type for its lifetime",
								fix = "use show or switch to swap between differently-typed values",
								expected = TypeNameOfResult,
								actual = HostModule.typeNameOf(p4, v16)
							})
						end
						local Current = v18.current
						local Target = v18.target
						local Reference = v18.reference
						
						for i = 1, p5.arity do
							Reference[i] = Current[i]
						end
						p5.encode(v16, Target)
						
						if v17 then
							stop(Settings)
							
							if Settings.ease == nil then
								SpringModule.settle(v18, Target)
							end
							for i1 = 1, p5.arity do
								local TargetEntry = Target[i1]
								Current[i1] = Target[i1]
								Reference[i1] = TargetEntry
							end
							local NormaliseFunction: (any) -> () = p5.normalise
							
							if NormaliseFunction then
								NormaliseFunction(Current)
							end
							v18.output:set(p5.decode(Current))
							
							return
						else
							local DurationFunction = Settings.duration
							
							if DurationFunction then
								local DurationResult: number = DurationFunction()
								
								if type(DurationResult) ~= "number" or DurationResult <= 0 then
									return DiagnosticsModule.raise("animation/bad-duration", "a tween's duration source produced a bad length", {
										expected = "positive seconds, e.g. 0.25",
										contract = "a duration source yields positive seconds at every retarget",
										actual = tostring(DurationResult)
									})
								end
								Settings[2] = DurationResult
							end
							if Settings.ease then
								Settings[1] = 0
							end
							if Settings[4] == 0 and not OwnerModule.isDisposed(Spring1) then
								compact()
								Count += 1
								Count1 += 1
								Settings[4] = Count
								t[Count] = v18
								
								if OnFrameResult == nil then
									OnFrameResult = NoFrames.onFrame(onFrame)
								end
								v18.activity.active = true
								local Value = v18.activity.value
								
								if Value ~= nil then
									Value:set(true)
								end
							end
						end
					end)
					
					return if v14 == nil then nil else v14.output
				end
			end,
			tween = tween,
			running = running,
			ramp = RampModule.createRamps(tween, Callback)
		}
	end
}