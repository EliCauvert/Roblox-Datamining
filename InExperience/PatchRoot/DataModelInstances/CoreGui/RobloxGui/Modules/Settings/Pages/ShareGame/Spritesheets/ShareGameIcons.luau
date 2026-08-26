local function _(p1, p2)
	return { offset = p1, size = p2 }
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
	GetFrame = function(_, p1)
		-- upvalues: t (ref)
		return t.frames[p1]
	end,
	GetImagePath = function(_)
		return "rbxasset://textures/ui/Settings/ShareGame/icons.png"
	end,
	ApplyImage = function(p1, p2, p3)
		local var1 = p1:GetFrame(p3)
		p2.Image = "rbxasset://textures/ui/Settings/ShareGame/icons.png"
		p2.ImageRectOffset = var1.offset
		p2.ImageRectSize = var1.size
	end
}