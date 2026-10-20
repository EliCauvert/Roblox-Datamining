local CorePackages = game:GetService("CorePackages")
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local SendGameLinkMessagePolicy = Logger.new(Logger, "SendGameLinkMessagePolicy")
local MessageModelModule = require(CorePackages.Workspace.Packages.AppChat.MessageModel)
local DEPRECATEDChatSendGameLinkMessageFunction = require(CorePackages.Workspace.Packages.Http).Requests.DEPRECATED_ChatSendGameLinkMessage
local SendChatMessagePolicyModule = require(CorePackages.Workspace.Packages.AppChat.SendChatMessagePolicy)
local HttpRequestModule = require(CorePackages.Packages.HttpRequest)
local ConfigResult = HttpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: SendGameLinkMessagePolicy (copy), HttpRequestModule (copy)
		SendGameLinkMessagePolicy:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
		
		return HttpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
	end,
	maxRetryCount = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("SendGameLinkMessagePolicyHttpRetryCount", 4) else nil
})
local self = setmetatable({}, SendChatMessagePolicyModule)
self.__index = self

function self.new(Logger, p1, UniverseId, Decorators, IsExperienceInvite, UserId, PlaceId)
	-- upvalues: SendChatMessagePolicyModule (copy)
	local NewResult = SendChatMessagePolicyModule:new(p1, nil)
	setmetatable(NewResult, Logger)
	NewResult.universeId = UniverseId
	NewResult.decorators = Decorators
	NewResult.isExperienceInvite = IsExperienceInvite
	NewResult.userId = UserId
	NewResult.placeId = PlaceId
	
	return NewResult
end

function self:sendMessage(_)
	-- upvalues: DEPRECATEDChatSendGameLinkMessageFunction (copy), ConfigResult (copy)
	return DEPRECATEDChatSendGameLinkMessageFunction(ConfigResult, self.conversationId, self.universeId, self.decorators, self.isExperienceInvite or false, self.userId or 0, self.placeId or 0)
end

function self:sendingMessagePayload()
	-- upvalues: MessageModelModule (copy)
	return {
		messageType = MessageModelModule.MessageTypes.Link,
		link = {
			type = MessageModelModule.LinkTypes.Game,
			game = { universeId = self.universeId }
		}
	}
end

return self