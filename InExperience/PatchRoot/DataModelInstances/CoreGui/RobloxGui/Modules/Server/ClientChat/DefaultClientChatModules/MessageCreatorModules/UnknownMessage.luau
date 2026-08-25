local _ = require(script.Parent.Parent:WaitForChild("ChatSettings"))
local utilModule = require(script.Parent:WaitForChild("Util"))

function CreateUnknownMessageLabel(p0)
	print("No message creator for message: " .. p0.Message)
end

return {
	[utilModule.KEY_MESSAGE_TYPE] = "UnknownMessage",
	[utilModule.KEY_CREATOR_FUNCTION] = CreateUnknownMessageLabel
}