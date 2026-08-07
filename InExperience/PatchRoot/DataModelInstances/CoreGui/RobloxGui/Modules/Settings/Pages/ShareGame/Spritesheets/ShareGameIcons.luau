local function _(p0, p1) --[[ line: 3 | named "createFrameModel" ]]
	return { offset = p0, size = p1 }
end

local t = {
	frames = {
		back = { offset = Vector2.new(2, 19), size = Vector2.new(24, 24) },
		clear = { offset = Vector2.new(6, 51), size = Vector2.new(16, 16) },
		invite = { offset = Vector2.new(2, 75), size = Vector2.new(24, 24) },
		search_border = { offset = Vector2.new(11, 1), size = Vector2.new(7, 7) },
		search_large = { offset = Vector2.new(3, 132), size = Vector2.new(22, 22) },
		search_small = { offset = Vector2.new(6, 106), size = Vector2.new(16, 16) },
		friends = { offset = Vector2.new(0, 159), size = Vector2.new(72, 72) },
		cross = { offset = Vector2.new(4, 231), size = Vector2.new(24, 24) },
		modal_border = { offset = Vector2.new(0, 255), size = Vector2.new(7, 7) }
	}
}

return {
	GetFrame = function(_, p2) --[[ line: 26 ]]
		-- upvalues: t (ref)
		return t.frames[p2]
	end,
	GetImagePath = function(_) --[[ line: 30 ]]
		return "rbxasset://textures/ui/Settings/ShareGame/icons.png"
	end,
	ApplyImage = function(p3, p4, p5) --[[ line: 34 ]]
		local var1 = p3:GetFrame(p5)
		p4.Image = "rbxasset://textures/ui/Settings/ShareGame/icons.png"
		p4.ImageRectOffset = var1.offset
		p4.ImageRectSize = var1.size
	end
}