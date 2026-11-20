local function _(UserInputType, p1)
	return {
		UserInputType = UserInputType,
		Position = p1 or vector.create(0, 0, 0)
	}
end

return {
	mouseMovement = function(p1)
		return {
			UserInputType = Enum.UserInputType.MouseMovement,
			Position = p1 or vector.create(0, 0, 0)
		}
	end,
	mouseButton1 = function(p1)
		return {
			UserInputType = Enum.UserInputType.MouseButton1,
			Position = p1 or vector.create(0, 0, 0)
		}
	end,
	mouseButton2 = function(p1)
		return {
			UserInputType = Enum.UserInputType.MouseButton2,
			Position = p1 or vector.create(0, 0, 0)
		}
	end,
	mouseButton3 = function(p1)
		return {
			UserInputType = Enum.UserInputType.MouseButton3,
			Position = p1 or vector.create(0, 0, 0)
		}
	end,
	mouseWheel = function(Z)
		return {
			UserInputType = Enum.UserInputType.MouseWheel,
			Position = Vector3.new(0, 0, Z) or vector.create(0, 0, 0)
		}
	end,
	touch = function(p1)
		return {
			UserInputType = Enum.UserInputType.Touch,
			Position = p1 or vector.create(0, 0, 0)
		}
	end
}