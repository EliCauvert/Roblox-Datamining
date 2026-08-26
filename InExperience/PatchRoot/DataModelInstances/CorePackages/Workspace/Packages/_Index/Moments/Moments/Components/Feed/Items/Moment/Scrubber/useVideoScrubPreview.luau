local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local _ = require(parent.MomentsCommon)
local sampleWindowModule = require(script.Parent.sampleWindow)
local runService = game:GetService("RunService")
local videoService = game:GetService("VideoService")
local defaultConfig = sampleWindowModule.defaultConfig

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), videoService (ref), sampleWindowModule (ref), defaultConfig (ref), runService (ref)
	local var1, var2 = reactModule.useBinding(nil)
	local var3, var4 = reactModule.useBinding(nil)
	local var5, var6 = reactModule.useBinding(true)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(nil)
	local var9, var10 = reactModule.useState(true)
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef(false)
	local var13 = reactModule.useRef(0)
	local var14 = reactModule.useRef(false)
	local var15 = reactModule.useRef(false)
	local var16 = reactModule.useRef(0)
	local var17 = reactModule.useRef(nil)
	local var18 = reactModule.useRef(false)
	local var19 = reactModule.useRef(0)
	local var20 = reactModule.useRef({})
	local var21 = reactModule.useRef(nil)
	
	if var21.current == nil then
		var21.current = { byTime = {}, set = {}, times = {} }
	end
	local current = var21.current
	
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
		-- upvalues: p1 (ref), var13 (ref)
		return if p1 == nil or p1.region == nil then { min = 0, max = var13.current } else { min = p1.region.startTime, max = p1.region.endTime }
	end
	
	local function _()
		-- upvalues: var11 (ref), var12 (ref), p1 (ref), var16 (ref), videoService (copy), var13 (ref)
		if var11.current == nil and not var12.current and p1 ~= nil then
			var12.current = true
			local current = var16.current
			local content = p1.content
			task.spawn(function()
				-- upvalues: videoService (copy), content (ref), current (ref), var16 (copy), var12 (copy), var11 (copy), var13 (copy)
				local ok, status = pcall(function()
					-- upvalues: videoService (copy), content (copy)
					return videoService:CreateVideoSamplerAsync(content, { Size = Enum.VideoSampleSize.Small })
				end)
				
				if current ~= var16.current then return end
				var12.current = false
				
				if ok then
					var11.current = status
					var13.current = status.TimeLength or 0
					
					return
				end
				warn(`[moments] scrub preview sampler failed: {tostring(status)}`)
			end)
			
			return
		end
	end
	
	local _ = function(p4)
		-- upvalues: var14 (ref), var16 (ref), var11 (ref), current (ref), rebuildCache (ref)
		var14.current = true
		local current_1 = var16.current
		task.spawn(function()
			-- upvalues: var11 (copy), p4 (ref), current_1 (ref), var16 (copy), var14 (copy), current (copy), rebuildCache (copy)
			local current_2 = var11.current
			local ok, status = pcall(function()
				-- upvalues: current_2 (ref), p4 (copy)
				return current_2:GetSamplesAtTimesAsync(p4)
			end)
			
			if current_1 ~= var16.current then return end
			var14.current = false
			
			if not ok then return end
			for i, v in p4 do
				local var22 = status[i]
				
				if var22 ~= nil and var22.Image ~= nil then
					current.byTime[v] = var22.Image
				end
			end
			rebuildCache()
		end)
	end
	
	local function tick()
		-- upvalues: p3 (ref), getRange (ref), var20 (ref), sampleWindowModule (copy), defaultConfig (copy), current (ref), rebuildCache (ref), var14 (ref), var11 (ref), var16 (ref), var18 (ref), var5 (ref), var7 (ref), var8 (ref), var19 (ref), var6 (ref), var15 (ref), var10 (ref), var17 (ref), var2 (ref), var4 (ref)
		local var22 = p3()
		
		if var22 == nil then return end
		local var23 = getRange()
		
		if var23.max <= var23.min then return end
		local var24 = var23.min + var22 * (var23.max - var23.min)
		local processTime = os.clock()
		local current_1 = var20.current
		table.insert(current_1, { time = processTime, position = var24 })
		while #current_1 > 1 and processTime - current_1[1].time > 0.12 do
			table.remove(current_1, 1)
		end
		local var25
		local var26 = sampleWindowModule.diff(sampleWindowModule.planTargets(var24, sampleWindowModule.estimateVelocity(current_1), var23, defaultConfig), current.set)
		
		if #var26.evict > 0 then
			for i, v in var26.evict do
				current.byTime[v] = nil
			end
			rebuildCache()
		end
		if not var14.current and #var26.fetch > 0 and var11.current ~= nil then
			local fetch = var26.fetch
			var14.current = true
			local current_2 = var16.current
			task.spawn(function()
				-- upvalues: var11 (copy), fetch (ref), current_2 (ref), var16 (copy), var14 (copy), current (copy), rebuildCache (copy)
				local current_2 = var11.current
				local ok, status = pcall(function()
					-- upvalues: current_2 (ref), fetch (copy)
					return current_2:GetSamplesAtTimesAsync(fetch)
				end)
				
				if current_2 ~= var16.current then return end
				var14.current = false
				
				if not ok then return end
				for i, v in fetch do
					local var27 = status[i]
					
					if var27 ~= nil and var27.Image ~= nil then
						current.byTime[v] = var27.Image
					end
				end
				rebuildCache()
			end)
		end
		if var18.current then
			local var27 = not var5:getValue()
			var25 = if var27 then var7.current else var8.current
			
			if var25 == nil or var25.IsLoaded or os.clock() - var19.current >= 0.2 then
				var6(var27)
				var18.current = false
				
				if not var15.current then
					var15.current = true
					var10(false)
				end
			end
		end
		local var28 = sampleWindowModule.selectFrameTime(var24, current.times)
		var25 = if var28 ~= nil then nil else current.byTime[var28]
		
		if var25 ~= nil and var25 ~= var17.current then
			var17.current = var25
			
			if var5:getValue() then
				var2(var25)
			else
				var4(var25)
			end
			var19.current = os.clock()
			var18.current = true
		end
	end
	
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), p1 (ref), var11 (ref), var12 (ref), var16 (ref), videoService (copy), var13 (ref), var20 (ref), runService (copy), tick (ref)
		if not p2 or p1 == nil then return end
		if var11.current == nil and not var12.current and p1 ~= nil then
			var12.current = true
			local current = var16.current
			local content = p1.content
			task.spawn(function()
				-- upvalues: videoService (copy), content (ref), current (ref), var16 (copy), var12 (copy), var11 (copy), var13 (copy)
				local ok, status = pcall(function()
					-- upvalues: videoService (copy), content (copy)
					return videoService:CreateVideoSamplerAsync(content, { Size = Enum.VideoSampleSize.Small })
				end)
				
				if current ~= var16.current then return end
				var12.current = false
				
				if ok then
					var11.current = status
					var13.current = status.TimeLength or 0
					
					return
				end
				warn(`[moments] scrub preview sampler failed: {tostring(status)}`)
			end)
		end
		var20.current = {}
		local renderSteppedConnection = runService.RenderStepped:Connect(tick)
		
		return function()
			-- upvalues: renderSteppedConnection (ref)
			renderSteppedConnection:Disconnect()
		end
	end, { p2, p1 })
	reactModule.useEffect(function()
		-- upvalues: var16 (ref), var11 (ref), var21 (ref)
		return function()
			-- upvalues: var16 (copy), var11 (copy), var21 (copy)
			var16.current += 1
			local current = var11.current
			
			if current ~= nil then
				pcall(function()
					-- upvalues: current (ref)
					current:Destroy()
				end)
			end
			var11.current = nil
			var21.current = { byTime = {}, set = {}, times = {} }
		end
	end, {})
	
	return {
		contentA = var1,
		contentB = var3,
		frontIsA = var5,
		imageARef = var7,
		imageBRef = var8,
		isLoading = var9
	}
end