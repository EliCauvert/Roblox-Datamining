return {
	mouseMovement = function(p1) --[[ Line: 7 ]]
		return {
			UserInputType = Enum.UserInputType.MouseMovement,
			Position = p1 or vector.create(0, 0, 0)
		}
	end,
	mouseButton1 = function(p1) --[[ Line: 16 ]]
		return {
			UserInputType = Enum.UserInputType.MouseButton1,
			Position = p1 or vector.create(0, 0, 0)
		}
	end,
	mouseButton2 = function(p1) --[[ Line: 25 ]]
		return {
			UserInputType = Enum.UserInputType.MouseButton2,
			Position = p1 or vector.create(0, 0, 0)
		}
	end,
	mouseWheel = function(Z) --[[ Line: 34 ]]
		return {
			UserInputType = Enum.UserInputType.MouseWheel,
			Position = Vector3.new(0, 0, Z)
		}
	end,
	touch = function(p1) --[[ Line: 43 ]]
		return {
			UserInputType = Enum.UserInputType.Touch,
			Position = p1 or vector.create(0, 0, 0)
		}
	end,
	keyboard = function() --[[ Line: 52 ]]
		return { UserInputType = Enum.UserInputType.Keyboard }
	end
}