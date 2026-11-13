local _ = require("./engine")
local KeyboardAndMouse = { class = "KeyboardAndMouse", token = "keyboard-and-mouse" }
local config = {
	Touch = { class = "Touch", token = "touch" },
	KeyboardAndMouse = KeyboardAndMouse,
	Gamepad = { class = "Gamepad", token = "gamepad" }
}

local function _(p1): string
	return (string.gsub(tostring(p1), "^Enum%.PreferredInput%.", ""))
end

return {
	specOf = function(p1)
		-- upvalues: config (copy), KeyboardAndMouse (copy)
		return config[string.gsub(tostring(p1), "^Enum%.PreferredInput%.", "")] or KeyboardAndMouse
	end
}