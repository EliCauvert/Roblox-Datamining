return {
	isUserInput = function(Input): boolean
		return Input.UserInputType ~= Enum.UserInputType.MouseMovement and (Input.UserInputType ~= Enum.UserInputType.Focus and Input.UserInputType ~= Enum.UserInputType.None)
	end,
	isUserScroll = function(Input): boolean
		return Input.UserInputType == Enum.UserInputType.MouseWheel or (if Input.KeyCode == Enum.KeyCode.Thumbstick1 then Input.Position.Magnitude > 0.2 else Input.KeyCode == Enum.KeyCode.Thumbstick2 and Input.Position.Magnitude > 0.2)
	end
}