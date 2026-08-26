local t = {}
local runService = game:GetService("RunService")
local _ = script.Parent
local t_1 = {
	__ClassName = "TransparencyTweener",
	__tostring = function(p1)
		return p1.__ClassName .. ": " .. p0.MemoryLocation
	end,
	__metatable = "The metatable is locked"
}

function t_1:__index(p1, _)
	-- upvalues: t_1 (ref)
	if rawget(self, p1) then
		return rawget(self, p1)
	elseif rawget(t_1, p1) then
		return rawget(t_1, p1)
	elseif p1 == "Transparency" then
		return rawget(self, "InternalLastTweenPercentage")
	end
	error(p1 .. " is not a valid member of " .. self.__ClassName)
end

function t_1:__newindex(p1, p2)
	if p1 == "Transparency" then
		self.InternalLastTweenPercentage = p2
		self:SetPropertiesToTweenPercentage(p2)
		
		return
	end
	error(p1 .. " is not a valid member of " .. self.__ClassName)
end

function t_1.Dump(p1)
	local var1 = tostring(p1)
	
	for i, v in pairs(p1.TweenObjects) do
		local var2 = " | "
		
		if type(i) == "table" then
			var2 ..= "{{" .. i:Dump() .. "}}"
		elseif type(i) == "userdata" then
			var2 ..= i.Name .. "/" .. i:GetFullName()
		end
		for i_1, v_1 in pairs(v) do
			var2 ..= " [" .. i_1 .. "=" .. string.sub(tostring(v_1), 1, 4) .. "]"
		end
		var1 ..= var2
	end
	return var1
end

function t_1.OutputTest(p2)
	print("Test Output for {={" .. p5:Dump() .. "}=}")
	
	for i, v in pairs(p2.TweenObjects) do
		print("TweenObject:", i)
		
		for i_1, v_1 in pairs(v) do
			print("\t[" .. i_1 .. "=" .. string.sub(tostring(v_1), 1, 4) .. "] Actual:" .. i[i_1])
		end
	end
end

function t_1.RegisterTweenObjectProperty(p3, p4, p5, p6)
	p6 = p6 or p4[p5]
	
	if not p3.TweenObjects[p4] then
		p3.TweenObjects[p4] = {}
	end
	p3.TweenObjects[p4][p5] = p6
	p3:SetObjectPropertyToPercentValue(p4, p5, p6, p3.InternalLastTweenPercentage)
end

function t_1.UnregisterTweenObject(p3, p4)
	p3.TweenObjects[p4] = nil
end

function t_1.SetObjectPropertyToPercentValue(_, p3, p4, p5, p6)
	p3[p4] = p5 + (1 - p5) * p6
end

function t_1.SetPropertiesToTweenPercentage(value, p3)
	for i, v in pairs(value.TweenObjects) do
		for i_1, v_1 in pairs(v) do
			value:SetObjectPropertyToPercentValue(i, i_1, v_1, p3)
		end
	end
end

function t_1.Tween(p4, p5, p6, p7)
	-- upvalues: runService (ref)
	if p4.Tweening then
		p4.QueuedTween = { p5, p6, p7 }
		p4.TweenIsQueued = true
		p4:CancelTween()
		
		return
	end
	p4.Tweening = true
	local var3 = p7
	
	if var3 then
		p4:SetPropertiesToTweenPercentage(var3)
	else
		var3 = p4.InternalLastTweenPercentage
	end
	local currentTime = tick()
	local var4 = currentTime + p5
	local var5 = p6 - var3
	local var6 = 0
	spawn(function()
		-- upvalues: var4 (ref), p4 (ref), var6 (write), currentTime (ref), p5 (ref), var3 (write), var5 (ref), runService (copy), p6 (ref)
		local currentTime_1 = tick()
		while currentTime_1 < var4 and not p4.Canceled do
			var6 = math.min(math.max((currentTime_1 - currentTime) / p5, 0), 1)
			local var7 = var3 + var5 * var6
			p4.InternalLastTweenPercentage = var7
			p4:SetPropertiesToTweenPercentage(var7)
			runService.RenderStepped:wait()
			currentTime_1 = tick()
		end
		if p4.Canceled then
			p4.Canceled = false
			
			if p4.TweenIsQueued then
				p4.TweenIsQueued = false
				p4.Tweening = false
				p4:Tween(unpack(p4.QueuedTween))
				
				return
			end
		else
			p4.InternalLastTweenPercentage = p6
			p4:SetPropertiesToTweenPercentage(p6)
		end
		p4.Tweening = false
	end)
end

function t_1.CancelTween(p8)
	p8.Canceled = true
end

function t.new()
	-- upvalues: t_1 (ref)
	local t = {}
	t.MemoryLocation = tostring(t):match("[0123456789ABCDEF]+")
	t.TweenObjects = setmetatable({}, { __mode = "k" })
	t.Transparency = nil
	t.InternalLastTweenPercentage = 0
	t.Tweening = false
	t.Canceled = false
	t.TweenIsQueued = false
	t.QueuedTween = {}
	
	return setmetatable(t, t_1)
end

return t