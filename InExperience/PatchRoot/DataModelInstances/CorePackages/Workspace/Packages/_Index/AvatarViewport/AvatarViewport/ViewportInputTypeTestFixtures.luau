return {
	mouseMovement = function(p0) --[[ line: 8 ]]
		return {
			UserInputType = Enum.UserInputType.MouseMovement,
			Position = p0 or Vector3.new(0, 0, 0)
		}
	end,
	mouseButton1 = function(p1) --[[ line: 17 ]]
		return {
			UserInputType = Enum.UserInputType.MouseButton1,
			Position = p1 or Vector3.new(0, 0, 0)
		}
	end,
	mouseButton2 = function(p2) --[[ line: 26 ]]
		return {
			UserInputType = Enum.UserInputType.MouseButton2,
			Position = p2 or Vector3.new(0, 0, 0)
		}
	end,
	mouseWheel = function(p3) --[[ line: 35 ]]
		return {
			UserInputType = Enum.UserInputType.MouseWheel,
			Position = Vector3.new(0, 0, p3)
		}
	end,
	touch = function(p4) --[[ line: 44 ]]
		return {
			UserInputType = Enum.UserInputType.Touch,
			Position = p4 or Vector3.new(0, 0, 0)
		}
	end,
	keyboard = function() --[[ line: 53 ]]
		return { UserInputType = Enum.UserInputType.Keyboard }
	end
}