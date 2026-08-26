return {
	mouseMovement = function(p1)
		return {
			UserInputType = Enum.UserInputType.MouseMovement,
			Position = p1 or Vector3.new(0, 0, 0)
		}
	end,
	mouseButton1 = function(p1)
		return {
			UserInputType = Enum.UserInputType.MouseButton1,
			Position = p1 or Vector3.new(0, 0, 0)
		}
	end,
	mouseButton2 = function(p1)
		return {
			UserInputType = Enum.UserInputType.MouseButton2,
			Position = p1 or Vector3.new(0, 0, 0)
		}
	end,
	mouseWheel = function(p1)
		return {
			UserInputType = Enum.UserInputType.MouseWheel,
			Position = Vector3.new(0, 0, p1)
		}
	end,
	touch = function(p1)
		return {
			UserInputType = Enum.UserInputType.Touch,
			Position = p1 or Vector3.new(0, 0, 0)
		}
	end,
	keyboard = function()
		return { UserInputType = Enum.UserInputType.Keyboard }
	end
}