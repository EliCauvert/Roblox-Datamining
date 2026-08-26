return function(p1, p2, p3, p4, p5)
	local r = p4.R
	local g = p4.G
	local b = p4.B
	local var1 = 1 - p5
	local buff = buffer.create(p2 * p2 * 4)
	local var2 = 0
	
	for i_1 = 1, p2 do
		for i = 1, p2 do
			if p3[math.floor((i_1 - 1) / p2 * #p3) + 1][math.floor((i - 1) / p2 * #p3) + 1] > 0 then
				buffer.writeu8(buff, var2, r * 255)
				buffer.writeu8(buff, var2 + 1, g * 255)
				buffer.writeu8(buff, var2 + 2, b * 255)
				buffer.writeu8(buff, var2 + 3, var1 * 255)
			else
				buffer.writeu8(buff, var2, 255)
				buffer.writeu8(buff, var2 + 1, 255)
				buffer.writeu8(buff, var2 + 2, 255)
				buffer.writeu8(buff, var2 + 3, 0)
			end
			var2 += 4
		end
	end
	p1:WritePixelsBuffer(Vector2.new(0, 0), Vector2.new(p2, p2), buff)
	
	return buff
end