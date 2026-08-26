local t = {}
t.__index = t

function t.new(p1, p2, p3, p4)
	-- upvalues: t (ref)
	return setmetatable({
		IsEnabled = p1,
		EnableVoice = p2,
		GetPropertyChangedSignal = p3,
		GetClientFeaturesAsync = p4
	}, t)
end

return t