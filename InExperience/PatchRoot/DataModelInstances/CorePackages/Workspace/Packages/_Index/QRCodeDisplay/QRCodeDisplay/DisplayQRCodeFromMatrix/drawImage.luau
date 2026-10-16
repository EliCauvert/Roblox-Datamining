return function(EditableImage, X, p1, p2, p3: number) --[[ Line: 1 ]]
	local R: number = p2.R
	local G: number = p2.G
	local B: number = p2.B
	local v1 = 1 - p3
	local Buf = buffer.create(X * X * 4)
	local Offset = 0
	
	for i = 1, X do
		for i1 = 1, X do
			if p1[math.floor((i - 1) / X * #p1) + 1][math.floor((i1 - 1) / X * #p1) + 1] > 0 then
				buffer.writeu8(Buf, Offset, R * 255)
				buffer.writeu8(Buf, Offset + 1, G * 255)
				buffer.writeu8(Buf, Offset + 2, B * 255)
				buffer.writeu8(Buf, Offset + 3, v1 * 255)
			else
				buffer.writeu8(Buf, Offset, 255)
				buffer.writeu8(Buf, Offset + 1, 255)
				buffer.writeu8(Buf, Offset + 2, 255)
				buffer.writeu8(Buf, Offset + 3, 0)
			end
			Offset += 4
		end
	end
	EditableImage:WritePixelsBuffer(Vector2.new(0, 0), Vector2.new(X, X), Buf)
	
	return Buf
end