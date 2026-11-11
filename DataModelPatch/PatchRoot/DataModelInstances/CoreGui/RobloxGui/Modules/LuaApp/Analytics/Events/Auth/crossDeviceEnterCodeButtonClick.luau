return function(p1, p2, Btn, Cstm, Ctype)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(Btn) == "string", "Expected buttonName to be a string")
	assert(type(Ctype) == "string", "Expected ctype to be a string")
	local config = { btn = Btn, ctype = Ctype }
	
	if Cstm ~= nil then
		assert(type(Cstm) == "string", "Expected extraData to be a string")
		config.cstm = Cstm
	end
	p1:setRBXEventStream(p2, "buttonClick", config)
end