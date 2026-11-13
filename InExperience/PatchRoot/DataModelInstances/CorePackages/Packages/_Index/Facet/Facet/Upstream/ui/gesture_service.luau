local _ = require("./types")
local GestureArbitrationModule = require("./gesture_arbitration")
local self = setmetatable({}, { __mode = "k" })
local self1 = setmetatable({}, { __mode = "k" })

return function(Key)
	-- upvalues: self (copy), GestureArbitrationModule (copy), self1 (copy)
	local UserInputService = Key.config.userInputService
	
	if UserInputService then
		if not self[UserInputService] then
			self[UserInputService] = GestureArbitrationModule.new()
		end
		return self[UserInputService]
	else
		if not self1[Key] then
			self1[Key] = GestureArbitrationModule.new()
		end
		return self1[Key]
	end
end