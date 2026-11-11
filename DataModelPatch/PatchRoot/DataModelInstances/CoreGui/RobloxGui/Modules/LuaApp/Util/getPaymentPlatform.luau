local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UserInputService = game:GetService("UserInputService")
local GetHasAmazonUserAgentModule = require(Modules.LuaApp.Util.getHasAmazonUserAgent)
local GetHasQuestUserAgentModule = require(Modules.LuaApp.Util.getHasQuestUserAgent)
local GetPaymentFromPlatformModule = require(Modules.LuaApp.Util.getPaymentFromPlatform)

return function()
	-- upvalues: UserInputService (copy), GetHasAmazonUserAgentModule (copy), GetHasQuestUserAgentModule (copy), GetPaymentFromPlatformModule (copy)
	return GetPaymentFromPlatformModule(UserInputService:GetPlatform(), GetHasAmazonUserAgentModule(), (GetHasQuestUserAgentModule()))
end