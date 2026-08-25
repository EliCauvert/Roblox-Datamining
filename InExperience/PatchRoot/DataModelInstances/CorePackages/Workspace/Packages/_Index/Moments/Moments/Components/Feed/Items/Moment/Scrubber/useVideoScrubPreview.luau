local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local _ = require(parent.MomentsCommon)
local sampleWindowModule = require(script.Parent.sampleWindow)
local runService = game:GetService("RunService")
local videoService = game:GetService("VideoService")
local defaultConfig = sampleWindowModule.defaultConfig

return function(p0, p1, p2)
	-- upvalues: reactModule (ref), videoService (ref), sampleWindowModule (ref), defaultConfig (ref), runService (ref)
	local var4, var5 = reactModule.useBinding(nil)
	local var6, var7 = reactModule.useBinding(nil)
	local var8, var9 = reactModule.useBinding(true)
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useRef(nil)
	local var12, var13 = reactModule.useState(true)
	local var14 = reactModule.useRef(nil)
	local var15 = reactModule.useRef(false)
	local var16 = reactModule.useRef(0)
	local var17 = reactModule.useRef(false)
	local var18 = reactModule.useRef(false)
	local var19 = reactModule.useRef(0)
	local var20 = reactModule.useRef(nil)
	local var21 = reactModule.useRef(false)
	local var22 = reactModule.useRef(0)
	local var23 = reactModule.useRef({})
	local var24 = reactModule.useRef(nil)
	
	if var24.current == nil then
		var24.current = { byTime = {}, set = {}, times = {} }
	end
	local current = var24.current
	
	local function rebuildCache()
		-- upvalues: current (ref)
		local t = {}
		local t_1 = {}
		
		for i in current.byTime do
			t[i] = true
			table.insert(t_1, i)
		end
		table.sort(t_1)
		current.set = t
		current.times = t_1
	end
	
	local function getRange()
		-- upvalues: p0 (ref), var16 (ref)
		return if p0 == nil or p0.region == nil then { min = 0, max = var16.current } else { min = p0.region.startTime, max = p0.region.endTime }
	end
	
	local function _()
		-- upvalues: var14 (ref), var15 (ref), p0 (ref), var19 (ref), videoService (copy), var16 (ref)
		if var14.current == nil and not var15.current and p0 ~= nil then
			var15.current = true
			local current = var19.current
			local content = p0.content
			task.spawn(function()
				-- upvalues: videoService (copy), content (ref), current (ref), var19 (copy), var15 (copy), var14 (copy), var16 (copy)
				local ok, status = pcall(function()
					-- upvalues: videoService (copy), content (copy)
					return videoService:CreateVideoSamplerAsync(content, { Size = Enum.VideoSampleSize.Small })
				end)
				
				if current ~= var19.current then return end
				var15.current = false
				
				if ok then
					var14.current = status
					var16.current = status.TimeLength or 0
					
					return
				end
				warn(`[moments] scrub preview sampler failed: {tostring(status)}`)
			end)
			
			return
		end
	end
	
	local _ = function(p3)
		-- upvalues: var17 (ref), var19 (ref), var14 (ref), current (ref), rebuildCache (ref)
		var17.current = true
		local current_1 = var19.current
		task.spawn(function()
			-- upvalues: var14 (copy), p3 (ref), current_1 (ref), var19 (copy), var17 (copy), current (copy), rebuildCache (copy)
			local current_2 = var14.current
			local ok, status = pcall(function()
				-- upvalues: current_2 (ref), p3 (copy)
				return current_2:GetSamplesAtTimesAsync(p3)
			end)
			
			if current_1 ~= var19.current then return end
			var17.current = false
			
			if not ok then return end
			for i, v in p3 do
				local var30 = status[i]
				
				if var30 ~= nil and var30.Image ~= nil then
					current.byTime[v] = var30.Image
				end
			end
			rebuildCache()
		end)
	end
	
	local function tick()
		-- upvalues: p2 (ref), getRange (ref), var23 (ref), sampleWindowModule (copy), defaultConfig (copy), current (ref), rebuildCache (ref), var17 (ref), var14 (ref), var19 (ref), var21 (ref), var8 (ref), var10 (ref), var11 (ref), var22 (ref), var9 (ref), var18 (ref), var13 (ref), var20 (ref), var5 (ref), var7 (ref)
		local var31 = p2()
		
		if var31 == nil then return end
		local var32 = getRange()
		
		if var32.max <= var32.min then return end
		local var33 = var32.min + var31 * (var32.max - var32.min)
		local processTime = os.clock()
		local current_1 = var23.current
		table.insert(current_1, { time = processTime, position = var33 })
		while #current_1 > 1 and processTime - current_1[1].time > 0.12 do
			table.remove(current_1, 1)
		end
		local var37
		local var35 = sampleWindowModule.diff(sampleWindowModule.planTargets(var33, sampleWindowModule.estimateVelocity(current_1), var32, defaultConfig), current.set)
		
		if #var35.evict > 0 then
			for i, v in var35.evict do
				current.byTime[v] = nil
			end
			rebuildCache()
		end
		if not var17.current and #var35.fetch > 0 and var14.current ~= nil then
			local fetch = var35.fetch
			var17.current = true
			local current_2 = var19.current
			task.spawn(function()
				-- upvalues: var14 (copy), fetch (ref), current_2 (ref), var19 (copy), var17 (copy), current (copy), rebuildCache (copy)
				local current_2 = var14.current
				local ok, status = pcall(function()
					-- upvalues: current_2 (ref), fetch (copy)
					return current_2:GetSamplesAtTimesAsync(fetch)
				end)
				
				if current_2 ~= var19.current then return end
				var17.current = false
				
				if not ok then return end
				for i, v in fetch do
					local var30 = status[i]
					
					if var30 ~= nil and var30.Image ~= nil then
						current.byTime[v] = var30.Image
					end
				end
				rebuildCache()
			end)
		end
		if var21.current then
			local var36 = not var8:getValue()
			var37 = if var36 then var10.current else var11.current
			
			if var37 == nil or var37.IsLoaded or os.clock() - var22.current >= 0.2 then
				var9(var36)
				var21.current = false
				
				if not var18.current then
					var18.current = true
					var13(false)
				end
			end
		end
		local var38 = sampleWindowModule.selectFrameTime(var33, current.times)
		var37 = if var38 ~= nil then nil else current.byTime[var38]
		
		if var37 ~= nil and var37 ~= var20.current then
			var20.current = var37
			
			if var8:getValue() then
				var5(var37)
			else
				var7(var37)
			end
			var22.current = os.clock()
			var21.current = true
		end
	end
	
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p0 (ref), var14 (ref), var15 (ref), var19 (ref), videoService (copy), var16 (ref), var23 (ref), runService (copy), tick (ref)
		if not p1 or p0 == nil then return end
		if var14.current == nil and not var15.current and p0 ~= nil then
			var15.current = true
			local current = var19.current
			local content = p0.content
			task.spawn(function()
				-- upvalues: videoService (copy), content (ref), current (ref), var19 (copy), var15 (copy), var14 (copy), var16 (copy)
				local ok, status = pcall(function()
					-- upvalues: videoService (copy), content (copy)
					return videoService:CreateVideoSamplerAsync(content, { Size = Enum.VideoSampleSize.Small })
				end)
				
				if current ~= var19.current then return end
				var15.current = false
				
				if ok then
					var14.current = status
					var16.current = status.TimeLength or 0
					
					return
				end
				warn(`[moments] scrub preview sampler failed: {tostring(status)}`)
			end)
		end
		var23.current = {}
		local renderSteppedConnection = runService.RenderStepped:Connect(tick)
		
		return function()
			-- upvalues: renderSteppedConnection (ref)
			renderSteppedConnection:Disconnect()
		end
	end, { p1, p0 })
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), var14 (ref), var24 (ref)
		return function()
			-- upvalues: var19 (copy), var14 (copy), var24 (copy)
			var19.current += 1
			local current = var14.current
			
			if current ~= nil then
				pcall(function()
					-- upvalues: current (ref)
					current:Destroy()
				end)
			end
			var14.current = nil
			var24.current = { byTime = {}, set = {}, times = {} }
		end
	end, {})
	
	return {
		contentA = var4,
		contentB = var6,
		frontIsA = var8,
		imageARef = var10,
		imageBRef = var11,
		isLoading = var12
	}
end