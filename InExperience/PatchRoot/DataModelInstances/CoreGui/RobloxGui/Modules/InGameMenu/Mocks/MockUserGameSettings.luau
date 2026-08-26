local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	local bindableEvent = Instance.new("BindableEvent")
	local t_1 = {
		FullscreenChanged = {
			Connect = function(_, p1)
				-- upvalues: bindableEvent (ref)
				return bindableEvent.Event:Connect(p1)
			end,
			GoFullscreen = function()
				-- upvalues: bindableEvent (ref)
				bindableEvent:Fire(true)
			end
		}
	}
	setmetatable(t_1, { __index = t })
	
	return t_1
end

function t.InFullScreen(_)
	return false
end

return t