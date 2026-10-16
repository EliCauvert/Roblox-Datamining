local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.MomentsCommon)
local SampleWindowModule = require(script.Parent.sampleWindow)
local RunService = game:GetService("RunService")
local VideoService = game:GetService("VideoService")
local DefaultConfig = SampleWindowModule.defaultConfig

return function(p1, p2, Callback) --[[ Line: 59 | Named "useVideoScrubPreview" ]]
	-- upvalues: ReactModule (copy), VideoService (copy), SampleWindowModule (copy), DefaultConfig (copy), RunService (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(nil)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(nil)
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(true)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(false)
	local UseRefResult4 = ReactModule.useRef(0)
	local UseRefResult5 = ReactModule.useRef(false)
	local UseRefResult6 = ReactModule.useRef(false)
	local UseRefResult7 = ReactModule.useRef(0)
	local UseRefResult8 = ReactModule.useRef(nil)
	local UseRefResult9 = ReactModule.useRef(false)
	local UseRefResult10 = ReactModule.useRef(0)
	local UseRefResult11 = ReactModule.useRef({})
	local UseRefResult12 = ReactModule.useRef(nil)
	
	if UseRefResult12.current == nil then
		UseRefResult12.current = { byTime = {}, set = {}, times = {} }
	end
	local Current = UseRefResult12.current
	
	local function rebuildCache() --[[ Line: 89 ]]
		-- upvalues: Current (copy)
		local Set = {}
		local List = {}
		
		for i in Current.byTime do
			Set[i] = true
			table.insert(List, i)
		end
		table.sort(List)
		Current.set = Set
		Current.times = List
	end
	
	local function getRange() --[[ Line: 103 ]]
		-- upvalues: p1 (copy), UseRefResult4 (copy)
		return if p1 == nil or p1.region == nil then { min = 0, max = UseRefResult4.current } else { min = p1.region.startTime, max = p1.region.endTime }
	end
	
	local function _() --[[ Line: 110 | Named "ensureSampler" ]]
		-- upvalues: UseRefResult2 (copy), UseRefResult3 (copy), p1 (copy), UseRefResult7 (copy), VideoService (upval), UseRefResult4 (copy)
		if UseRefResult2.current == nil and not UseRefResult3.current and p1 ~= nil then
			UseRefResult3.current = true
			local Current = UseRefResult7.current
			local Content = p1.content
			task.spawn(function() --[[ Line: 117 ]]
				-- upvalues: VideoService (upval), Content (copy), Current (copy), UseRefResult7 (upval), UseRefResult3 (upval), UseRefResult2 (upval), UseRefResult4 (upval)
				local Success, Result = pcall(function() --[[ Line: 118 ]]
					-- upvalues: VideoService (upval), Content (upval)
					return VideoService:CreateVideoSamplerAsync(Content, { Size = Enum.VideoSampleSize.Small })
				end)
				
				if Current ~= UseRefResult7.current then return end
				UseRefResult3.current = false
				
				if Success then
					UseRefResult2.current = Result
					UseRefResult4.current = Result.TimeLength or 0
					
					return
				else
					warn(`[moments] scrub preview sampler failed: {tostring(Result)}`)
				end
			end)
			
			return
		end
	end
	
	local _ = function(p3) --[[ Line: 136 | Named "runFetch" ]]
		-- upvalues: UseRefResult5 (copy), UseRefResult7 (copy), UseRefResult2 (copy), Current (copy), rebuildCache (copy)
		UseRefResult5.current = true
		local Current1 = UseRefResult7.current
		task.spawn(function() --[[ Line: 139 ]]
			-- upvalues: UseRefResult2 (upval), p3 (copy), Current1 (copy), UseRefResult7 (upval), UseRefResult5 (upval), Current (upval), rebuildCache (upval)
			local Current = UseRefResult2.current
			local Success, Result = pcall(function() --[[ Line: 141 ]]
				-- upvalues: Current (copy), p3 (upval)
				return Current:GetSamplesAtTimesAsync(p3)
			end)
			
			if Current1 ~= UseRefResult7.current then return end
			UseRefResult5.current = false
			
			if not Success then return end
			for i, value in p3 do
				local Entry = Result[i]
				
				if Entry ~= nil and Entry.Image ~= nil then
					Current.byTime[value] = Entry.Image
				end
			end
			rebuildCache()
		end)
	end
	
	local function tick() --[[ Line: 161 ]]
		-- upvalues: Callback (copy), getRange (copy), UseRefResult11 (copy), SampleWindowModule (upval), DefaultConfig (upval), Current (copy), rebuildCache (copy), UseRefResult5 (copy), UseRefResult2 (copy), UseRefResult7 (copy), UseRefResult9 (copy), UseBindingResult3 (copy), UseRefResult (copy), UseRefResult1 (copy), UseRefResult10 (copy), UseBindingResult2_2 (copy), UseRefResult6 (copy), UseStateResult2 (copy), UseRefResult8 (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy)
		local CallbackResult = Callback()
		
		if CallbackResult == nil then return end
		local Range = getRange()
		
		if Range.max <= Range.min then return end
		local NewMin = Range.min + CallbackResult * (Range.max - Range.min)
		local ClockTime = os.clock()
		local Current1 = UseRefResult11.current
		table.insert(Current1, { time = ClockTime, position = NewMin })
		while #Current1 > 1 and ClockTime - Current1[1].time > 0.12 do
			table.remove(Current1, 1)
		end
		local DiffResult = SampleWindowModule.diff(SampleWindowModule.planTargets(NewMin, SampleWindowModule.estimateVelocity(Current1), Range, DefaultConfig), Current.set)
		
		if #DiffResult.evict > 0 then
			for _, value in DiffResult.evict do
				Current.byTime[value] = nil
			end
			rebuildCache()
		end
		if not UseRefResult5.current and #DiffResult.fetch > 0 and UseRefResult2.current ~= nil then
			local Fetch = DiffResult.fetch
			UseRefResult5.current = true
			local Current2 = UseRefResult7.current
			task.spawn(function() --[[ Line: 139 ]]
				-- upvalues: UseRefResult2 (upval), Fetch (copy), Current2 (copy), UseRefResult7 (upval), UseRefResult5 (upval), Current (upval), rebuildCache (upval)
				local Current = UseRefResult2.current
				local Success, Result = pcall(function() --[[ Line: 141 ]]
					-- upvalues: Current (copy), Fetch (upval)
					return Current:GetSamplesAtTimesAsync(Fetch)
				end)
				
				if Current2 ~= UseRefResult7.current then return end
				UseRefResult5.current = false
				
				if not Success then return end
				for i, value in Fetch do
					local Entry = Result[i]
					
					if Entry ~= nil and Entry.Image ~= nil then
						Current.byTime[value] = Entry.Image
					end
				end
				rebuildCache()
			end)
		end
		if UseRefResult9.current then
			local Inverted = not UseBindingResult3:getValue()
			local Current3 = if Inverted then UseRefResult.current else UseRefResult1.current
			local Elapsed = os.clock() - UseRefResult10.current
			
			if Current3 == nil or Current3.IsLoaded or Elapsed >= 0.2 then
				UseBindingResult2_2(Inverted)
				UseRefResult9.current = false
				
				if not UseRefResult6.current then
					UseRefResult6.current = true
					UseStateResult2(false)
				end
			end
		end
		local SelectFrameTimeResult = SampleWindowModule.selectFrameTime(NewMin, Current.times)
		local ByTimeEntry = if SelectFrameTimeResult == nil then nil else Current.byTime[SelectFrameTimeResult]
		
		if ByTimeEntry ~= nil and ByTimeEntry ~= UseRefResult8.current then
			UseRefResult8.current = ByTimeEntry
			
			if not UseBindingResult3:getValue() then
				UseBindingResult2(ByTimeEntry)
			else
				UseBindingResult2_1(ByTimeEntry)
			end
			UseRefResult10.current = os.clock()
			UseRefResult9.current = true
		end
	end
	
	ReactModule.useEffect(function() --[[ Line: 231 ]]
		-- upvalues: p2 (copy), p1 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult7 (copy), VideoService (upval), UseRefResult4 (copy), UseRefResult11 (copy), RunService (upval), tick (copy)
		if not p2 or p1 == nil then return end
		if UseRefResult2.current == nil and not UseRefResult3.current and p1 ~= nil then
			UseRefResult3.current = true
			local Current = UseRefResult7.current
			local Content = p1.content
			task.spawn(function() --[[ Line: 117 ]]
				-- upvalues: VideoService (upval), Content (copy), Current (copy), UseRefResult7 (upval), UseRefResult3 (upval), UseRefResult2 (upval), UseRefResult4 (upval)
				local Success, Result = pcall(function() --[[ Line: 118 ]]
					-- upvalues: VideoService (upval), Content (upval)
					return VideoService:CreateVideoSamplerAsync(Content, { Size = Enum.VideoSampleSize.Small })
				end)
				
				if Current ~= UseRefResult7.current then return end
				UseRefResult3.current = false
				
				if Success then
					UseRefResult2.current = Result
					UseRefResult4.current = Result.TimeLength or 0
					
					return
				else
					warn(`[moments] scrub preview sampler failed: {tostring(Result)}`)
				end
			end)
		end
		UseRefResult11.current = {}
		local RenderSteppedConnection = RunService.RenderStepped:Connect(tick)
		
		return function() --[[ Line: 238 ]]
			-- upvalues: RenderSteppedConnection (copy)
			RenderSteppedConnection:Disconnect()
		end
	end, { p2, p1 })
	ReactModule.useEffect(function() --[[ Line: 244 ]]
		-- upvalues: UseRefResult7 (copy), UseRefResult2 (copy), UseRefResult12 (copy)
		return function() --[[ Line: 245 ]]
			-- upvalues: UseRefResult7 (upval), UseRefResult2 (upval), UseRefResult12 (upval)
			UseRefResult7.current += 1
			local Current = UseRefResult2.current
			
			if Current ~= nil then
				pcall(function() --[[ Line: 249 ]]
					-- upvalues: Current (copy)
					Current:Destroy()
				end)
			end
			UseRefResult2.current = nil
			UseRefResult12.current = { byTime = {}, set = {}, times = {} }
		end
	end, {})
	
	return {
		contentA = UseBindingResult,
		contentB = UseBindingResult1,
		frontIsA = UseBindingResult3,
		imageARef = UseRefResult,
		imageBRef = UseRefResult1,
		isLoading = UseStateResult
	}
end