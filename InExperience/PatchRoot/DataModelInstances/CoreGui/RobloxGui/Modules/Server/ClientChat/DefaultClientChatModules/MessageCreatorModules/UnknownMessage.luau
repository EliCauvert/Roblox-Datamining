local _ = require(script.Parent.Parent:WaitForChild("ChatSettings"))
local UtilModule = require(script.Parent:WaitForChild("Util"))

function CreateUnknownMessageLabel(p1) --[[ Line: 13 ]]
	print("No message creator for message: " .. p1.Message)
end

return {
	[UtilModule.KEY_MESSAGE_TYPE] = "UnknownMessage",
	[UtilModule.KEY_CREATOR_FUNCTION] = CreateUnknownMessageLabel
}