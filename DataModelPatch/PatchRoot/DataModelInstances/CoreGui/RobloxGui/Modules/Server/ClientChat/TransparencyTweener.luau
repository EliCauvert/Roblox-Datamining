local RunService = game:GetService("RunService")
local _ = script.Parent
local config = {
	__ClassName = "TransparencyTweener",
	__tostring = function(p1): string
		return p1.__ClassName .. ": " .. p1.MemoryLocation
	end,
	__metatable = "The metatable is locked"
}

function config.__index(p1, Text, _)
	-- upvalues: config (copy)
	if rawget(p1, Text) then
		return (rawget(p1, Text))
	elseif rawget(config, Text) then
		return (rawget(config, Text))
	elseif Text == "Transparency" then
		return (rawget(p1, "InternalLastTweenPercentage"))
	else
		error(Text .. " is not a valid member of " .. p1.__ClassName)
	end
end

function config.__newindex(p1, Text, InternalLastTweenPercentage)
	if Text == "Transparency" then
		p1.InternalLastTweenPercentage = InternalLastTweenPercentage
		p1:SetPropertiesToTweenPercentage(InternalLastTweenPercentage)
		
		return
	else
		error(Text .. " is not a valid member of " .. p1.__ClassName)
	end
end

function config.Dump(p1): string
	local Text = tostring(p1)
	
	for i, tweenObject in pairs(p1.TweenObjects) do
		local Text1 = " | "
		
		if type(i) == "table" then
			Text1 ..= "{{" .. i:Dump() .. "}}"
		elseif type(i) == "userdata" then
			Text1 ..= i.Name .. "/" .. i:GetFullName()
		end
		for i1, value in pairs(tweenObject) do
			Text1 ..= " [" .. i1 .. "=" .. string.sub(tostring(value), 1, 4) .. "]"
		end
		Text ..= Text1
	end
	return Text
end

function config.OutputTest(p2)
	print("Test Output for {={" .. p2:Dump() .. "}=}")
	
	for i, tweenObject in pairs(p2.TweenObjects) do
		print("TweenObject:", i)
		
		for i1, value in pairs(tweenObject) do
			print("\t[" .. i1 .. "=" .. string.sub(tostring(value), 1, 4) .. "] Actual:" .. i[i1])
		end
	end
end

function config.RegisterTweenObjectProperty(p3, p4, p5, p6)
	local P12 = p6 or p4[p5]
	
	if not p3.TweenObjects[p4] then
		p3.TweenObjects[p4] = {}
	end
	p3.TweenObjects[p4][p5] = P12
	p3:SetObjectPropertyToPercentValue(p4, p5, P12, p3.InternalLastTweenPercentage)
end

function config.UnregisterTweenObject(p3, p4)
	p3.TweenObjects[p4] = nil
end

function config:SetObjectPropertyToPercentValue(p3, Key, p4: number, InternalLastTweenPercentage)
	p3[Key] = p4 + (1 - p4) * InternalLastTweenPercentage
end

function config.SetPropertiesToTweenPercentage(p3, InternalLastTweenPercentage)
	for i, tweenObject in pairs(p3.TweenObjects) do
		for i1, value in pairs(tweenObject) do
			p3:SetObjectPropertyToPercentValue(i, i1, value, InternalLastTweenPercentage)
		end
	end
end

function config.Tween(p4, p5: number, InternalLastTweenPercentage, InternalLastTweenPercentage1)
	-- upvalues: RunService (copy)
	if p4.Tweening then
		p4.QueuedTween = {
			p5,
			InternalLastTweenPercentage,
			InternalLastTweenPercentage1
		}
		p4.TweenIsQueued = true
		p4:CancelTween()
		
		return
	end
	p4.Tweening = true
	local InternalLastTweenPercentage2 = InternalLastTweenPercentage1
	
	if InternalLastTweenPercentage2 then
		p4:SetPropertiesToTweenPercentage(InternalLastTweenPercentage2)
	else
		InternalLastTweenPercentage2 = p4.InternalLastTweenPercentage
	end
	local CurrentTime = tick()
	local NewCurrentTime = CurrentTime + p5
	local InternalLastTweenPercentageDelta = InternalLastTweenPercentage - InternalLastTweenPercentage2
	local Smallest = 0
	spawn(function()
		-- upvalues: NewCurrentTime (copy), p4 (copy), Smallest (ref), CurrentTime (copy), p5 (copy), InternalLastTweenPercentage2 (ref), InternalLastTweenPercentageDelta (copy), RunService (upval), InternalLastTweenPercentage (copy)
		local CurrentTime1 = tick()
		while CurrentTime1 < NewCurrentTime and not p4.Canceled do
			Smallest = math.min(math.max((CurrentTime1 - CurrentTime) / p5, 0), 1)
			local NewInternalLastTweenPercentage = InternalLastTweenPercentage2 + InternalLastTweenPercentageDelta * Smallest
			p4.InternalLastTweenPercentage = NewInternalLastTweenPercentage
			p4:SetPropertiesToTweenPercentage(NewInternalLastTweenPercentage)
			RunService.RenderStepped:wait()
			CurrentTime1 = tick()
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
			p4.InternalLastTweenPercentage = InternalLastTweenPercentage
			p4:SetPropertiesToTweenPercentage(InternalLastTweenPercentage)
		end
		p4.Tweening = false
	end)
end

function config.CancelTween(p6)
	p6.Canceled = true
end

return {
	new = function()
		-- upvalues: config (copy)
		local t = {}
		t.MemoryLocation = tostring(t):match("[0123456789ABCDEF]+")
		t.TweenObjects = setmetatable({}, { __mode = "k" })
		t.Transparency = nil
		t.InternalLastTweenPercentage = 0
		t.Tweening = false
		t.Canceled = false
		t.TweenIsQueued = false
		t.QueuedTween = {}
		
		return (setmetatable(t, config))
	end
}