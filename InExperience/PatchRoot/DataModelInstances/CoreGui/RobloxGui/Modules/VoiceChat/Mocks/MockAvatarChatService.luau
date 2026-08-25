local t = {}
t.__index = t

function t.new(p0, p1, p2, p3)
	-- upvalues: t (ref)
	return setmetatable({
		IsEnabled = p0,
		EnableVoice = p1,
		GetPropertyChangedSignal = p2,
		GetClientFeaturesAsync = p3
	}, t)
end

return t