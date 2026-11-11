local MockAnimationStreamTrackModule = {}
MockAnimationStreamTrackModule.__index = MockAnimationStreamTrackModule

function MockAnimationStreamTrackModule.new()
	-- upvalues: MockAnimationStreamTrackModule (copy)
	local t = {}
	setmetatable(t, MockAnimationStreamTrackModule)
	t.StoppedBindableEvent = Instance.new("BindableEvent")
	t.Stopped = t.StoppedBindableEvent.Event
	t.WeightCurrent = 1
	t.IsPlaying = false
	
	return t
end

function MockAnimationStreamTrackModule:Play(_)
	self.IsPlaying = true
end

function MockAnimationStreamTrackModule:Stop(_)
	if self.IsPlaying then
		self.IsPlaying = false
		self.StoppedBindableEvent:Fire()
	end
end

function MockAnimationStreamTrackModule:AdjustWeight(WeightCurrent)
	self.WeightCurrent = WeightCurrent
end

function MockAnimationStreamTrackModule:Destroy() end

return MockAnimationStreamTrackModule