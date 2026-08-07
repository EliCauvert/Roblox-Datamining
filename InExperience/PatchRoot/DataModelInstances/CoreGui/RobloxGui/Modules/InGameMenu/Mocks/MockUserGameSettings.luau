local t = {}
t.__index = t

function t.new() --[[ line: 8 ]]
	-- upvalues: t (ref)
	local bindableEvent = Instance.new("BindableEvent")
	local t_1 = {
		FullscreenChanged = {
			Connect = function(_, p0) --[[ line: 13 ]]
				-- upvalues: bindableEvent (ref)
				return bindableEvent.Event:Connect(p0)
			end,
			GoFullscreen = function() --[[ line: 16 ]]
				-- upvalues: bindableEvent (ref)
				bindableEvent:Fire(true)
			end
		}
	}
	setmetatable(t_1, { __index = t })
	
	return t_1
end

function t.InFullScreen(_) --[[ line: 28 ]]
	return false
end

return t