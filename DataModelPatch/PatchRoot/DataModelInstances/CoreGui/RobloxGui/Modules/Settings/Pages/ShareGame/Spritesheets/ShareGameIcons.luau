local function _(Offset, Size)
	return { offset = Offset, size = Size }
end

local config = {
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
		-- upvalues: config (copy)
		return config.frames[p1]
	end,
	GetImagePath = function(_): string
		return "rbxasset://textures/ui/Settings/ShareGame/icons.png"
	end,
	ApplyImage = function(ThreadState, Image, p1)
		local Frame = ThreadState:GetFrame(p1)
		Image.Image = "rbxasset://textures/ui/Settings/ShareGame/icons.png"
		Image.ImageRectOffset = Frame.offset
		Image.ImageRectSize = Frame.size
	end
}