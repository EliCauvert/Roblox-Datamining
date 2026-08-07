local t = {}
t.__index = t

function t.new(p0) --[[ line: 4 ]]
	-- upvalues: t (ref)
	local t_1 = { _enableNewFont = p0 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:getDefault() --[[ line: 12 ]]
	return if self._enableNewFont then Enum.Font.BuilderSans else Enum.Font.Gotham
end

function t:getMedium() --[[ line: 21 ]]
	return if self._enableNewFont then Enum.Font.BuilderSansMedium else Enum.Font.GothamMedium
end

function t:getBlack() --[[ line: 30 ]]
	return if self._enableNewFont then Enum.Font.BuilderSansExtraBold else Enum.Font.GothamBlack
end

function t:getBold() --[[ line: 39 ]]
	return if self._enableNewFont then Enum.Font.BuilderSansBold else Enum.Font.GothamBold
end

function t:getSemibold() --[[ line: 48 ]]
	return if self._enableNewFont then Enum.Font.BuilderSansMedium else Enum.Font.GothamMedium
end

t.default = t.new(true)

return t