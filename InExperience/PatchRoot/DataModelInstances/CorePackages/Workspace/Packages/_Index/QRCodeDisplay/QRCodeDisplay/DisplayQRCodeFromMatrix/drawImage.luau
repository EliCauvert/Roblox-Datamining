return function(p0, p1, p2, p3, p4) --[[ line: 1 ]]
	local r = p3.R
	local g = p3.G
	local b = p3.B
	local var0 = 1 - p4
	local buff = buffer.create(p1 * p1 * 4)
	local var2 = 0
	
	for i_1 = 1, p1 do
		for i = 1, p1 do
			if p2[math.floor((i_1 - 1) / p1 * #p2) + 1][math.floor((i - 1) / p1 * #p2) + 1] > 0 then
				buffer.writeu8(buff, var2, r * 255)
				buffer.writeu8(buff, var2 + 1, g * 255)
				buffer.writeu8(buff, var2 + 2, b * 255)
				buffer.writeu8(buff, var2 + 3, var0 * 255)
			else
				buffer.writeu8(buff, var2, 255)
				buffer.writeu8(buff, var2 + 1, 255)
				buffer.writeu8(buff, var2 + 2, 255)
				buffer.writeu8(buff, var2 + 3, 0)
			end
			var2 += 4
		end
	end
	p0:WritePixelsBuffer(Vector2.new(0, 0), Vector2.new(p1, p1), buff)
	
	return buff
end