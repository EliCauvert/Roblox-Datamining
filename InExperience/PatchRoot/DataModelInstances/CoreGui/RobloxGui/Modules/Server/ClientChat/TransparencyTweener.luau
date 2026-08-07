local t = {}
local runService = game:GetService("RunService")
local _ = script.Parent
local t_1 = {
	__ClassName = "TransparencyTweener",
	__tostring = function(p0) --[[ line: 21 ]]
		return p0.__ClassName .. ": " .. p0.MemoryLocation
	end,
	__metatable = "The metatable is locked"
}

function t_1:__index(p1, _) --[[ line: 26 ]]
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

function t_1:__newindex(p2, p3) --[[ line: 36 ]]
	if p2 == "Transparency" then
		self.InternalLastTweenPercentage = p3
		self:SetPropertiesToTweenPercentage(p3)
		
		return
	end
	error(p2 .. " is not a valid member of " .. self.__ClassName)
end

function t_1.Dump(p4) --[[ line: 49 ]]
	local var3 = tostring(p4)
	
	for i, v in pairs(p4.TweenObjects) do
		local var4 = " | "
		
		if type(i) == "table" then
			var4 ..= "{{" .. i:Dump() .. "}}"
		elseif type(i) == "userdata" then
			var4 ..= i.Name .. "/" .. i:GetFullName()
		end
		for i_1, v_1 in pairs(v) do
			var4 ..= " [" .. i_1 .. "=" .. string.sub(tostring(v_1), 1, 4) .. "]"
		end
		var3 ..= var4
	end
	return var3
end

function t_1.OutputTest(p5) --[[ line: 70 ]]
	print("Test Output for {={" .. p5:Dump() .. "}=}")
	
	for i, v in pairs(p5.TweenObjects) do
		print("TweenObject:", i)
		
		for i_1, v_1 in pairs(v) do
			print("\t[" .. i_1 .. "=" .. string.sub(tostring(v_1), 1, 4) .. "] Actual:" .. i[i_1])
		end
	end
end

function t_1.RegisterTweenObjectProperty(p6, p7, p8, p9) --[[ line: 80 ]]
	p9 = p9 or p7[p8]
	
	if not p6.TweenObjects[p7] then
		p6.TweenObjects[p7] = {}
	end
	p6.TweenObjects[p7][p8] = p9
	p6:SetObjectPropertyToPercentValue(p7, p8, p9, p6.InternalLastTweenPercentage)
end

function t_1.UnregisterTweenObject(p10, p11) --[[ line: 92 ]]
	p10.TweenObjects[p11] = nil
end

function t_1.SetObjectPropertyToPercentValue(_, p12, p13, p14, p15) --[[ line: 96 ]]
	p12[p13] = p14 + (1 - p14) * p15
end

function t_1.SetPropertiesToTweenPercentage(value, p16) --[[ line: 102 ]]
	for i, v in pairs(value.TweenObjects) do
		for i_1, v_1 in pairs(v) do
			value:SetObjectPropertyToPercentValue(i, i_1, v_1, p16)
		end
	end
end

function t_1.Tween(p17, p18, p19, p20) --[[ line: 110 ]]
	-- upvalues: runService (ref)
	if p17.Tweening then
		p17.QueuedTween = { p18, p19, p20 }
		p17.TweenIsQueued = true
		p17:CancelTween()
		
		return
	end
	p17.Tweening = true
	local var6 = p20
	
	if var6 then
		p17:SetPropertiesToTweenPercentage(var6)
	else
		var6 = p17.InternalLastTweenPercentage
	end
	local currentTime = tick()
	local var8 = currentTime + p18
	local var9 = p19 - var6
	local var10 = 0
	spawn(function() --[[ line: 132 ]]
		-- upvalues: var8 (ref), p17 (ref), var10 (write), currentTime (ref), p18 (ref), var6 (write), var9 (ref), runService (copy), p19 (ref)
		local currentTime_1 = tick()
		while currentTime_1 < var8 and not p17.Canceled do
			var10 = math.min(math.max((currentTime_1 - currentTime) / p18, 0), 1)
			local var12 = var6 + var9 * var10
			p17.InternalLastTweenPercentage = var12
			p17:SetPropertiesToTweenPercentage(var12)
			runService.RenderStepped:wait()
			currentTime_1 = tick()
		end
		if p17.Canceled then
			p17.Canceled = false
			
			if p17.TweenIsQueued then
				p17.TweenIsQueued = false
				p17.Tweening = false
				p17:Tween(unpack(p17.QueuedTween))
				
				return
			end
		else
			p17.InternalLastTweenPercentage = p19
			p17:SetPropertiesToTweenPercentage(p19)
		end
		p17.Tweening = false
	end)
end

function t_1.CancelTween(p21) --[[ line: 163 ]]
	p21.Canceled = true
end

function t.new() --[[ line: 169 ]]
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