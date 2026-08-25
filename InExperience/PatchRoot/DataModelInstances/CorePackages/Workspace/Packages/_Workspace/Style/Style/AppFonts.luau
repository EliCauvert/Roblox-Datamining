local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: t (ref)
	local t_1 = { _enableNewFont = p0 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:getDefault()
	return if self._enableNewFont then Enum.Font.BuilderSans else Enum.Font.Gotham
end

function t:getMedium()
	return if self._enableNewFont then Enum.Font.BuilderSansMedium else Enum.Font.GothamMedium
end

function t:getBlack()
	return if self._enableNewFont then Enum.Font.BuilderSansExtraBold else Enum.Font.GothamBlack
end

function t:getBold()
	return if self._enableNewFont then Enum.Font.BuilderSansBold else Enum.Font.GothamBold
end

function t:getSemibold()
	return if self._enableNewFont then Enum.Font.BuilderSansMedium else Enum.Font.GothamMedium
end

t.default = t.new(true)

return t