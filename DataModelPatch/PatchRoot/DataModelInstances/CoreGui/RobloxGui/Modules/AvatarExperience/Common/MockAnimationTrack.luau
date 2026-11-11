local MockAnimationTrackModule = {}
MockAnimationTrackModule.__index = MockAnimationTrackModule

function MockAnimationTrackModule.new()
	-- upvalues: MockAnimationTrackModule (copy)
	local t = {}
	setmetatable(t, MockAnimationTrackModule)
	t.StoppedBindableEvent = Instance.new("BindableEvent")
	t.EndedBindableEvent = Instance.new("BindableEvent")
	t.DidLoopBindableEvent = Instance.new("BindableEvent")
	t.Stopped = t.StoppedBindableEvent.Event
	t.Ended = t.EndedBindableEvent.Event
	t.DidLoop = t.DidLoopBindableEvent.Event
	t.IsPlaying = false
	
	return t
end

function MockAnimationTrackModule:Play(_)
	self.IsPlaying = true
	task.spawn(function()
		-- upvalues: self (copy)
		task.wait(1)
		
		if self.IsPlaying then
			self.IsPlaying = false
			self.StoppedBindableEvent:Fire()
			task.wait(0.2)
			self.EndedBindableEvent:Fire()
		end
	end)
end

function MockAnimationTrackModule:Stop(_)
	if self.IsPlaying then
		task.spawn(function()
			-- upvalues: self (copy)
			self.IsPlaying = false
			self.StoppedBindableEvent:Fire()
			task.wait(0.2)
			self.EndedBindableEvent:Fire()
		end)
	end
end

function MockAnimationTrackModule:Destroy() end

return MockAnimationTrackModule