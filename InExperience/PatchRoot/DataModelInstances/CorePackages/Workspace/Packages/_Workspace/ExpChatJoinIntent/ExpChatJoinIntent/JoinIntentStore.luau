local HttpService = game:GetService("HttpService")
local MemStorageService = game:GetService("MemStorageService")
local Parent = script.Parent
local GetGameLaunchPlaceIdModule = require(Parent.getGameLaunchPlaceId)
local ParseNotificationTypesModule = require(Parent.parseNotificationTypes)
local JoinIntentStore = {}
JoinIntentStore.__index = JoinIntentStore

local function toJoinIntent(JoinIntent)
	if type(JoinIntent) ~= "table" then
		return nil
	elseif JoinIntent.version == 1 and type(JoinIntent.source) == "string" and type(JoinIntent.notificationType) == "string" and type(JoinIntent.placeId) == "number" and type(JoinIntent.createdAt) == "number" then
		local NotificationId = JoinIntent.notificationId
		local ChatTarget = JoinIntent.chatTarget
		
		return {
			version = 1,
			source = JoinIntent.source,
			notificationType = JoinIntent.notificationType,
			notificationId = if type(NotificationId) == "string" then NotificationId else nil,
			chatTarget = if type(ChatTarget) == "string" then ChatTarget else nil,
			placeId = JoinIntent.placeId,
			createdAt = JoinIntent.createdAt
		}
	else
		return nil
	end
end

function JoinIntentStore.new(p1)
	-- upvalues: ParseNotificationTypesModule (copy), JoinIntentStore (copy)
	return (setmetatable({
		cachedRead = nil,
		notificationTypes = ParseNotificationTypesModule(p1.notificationTypes),
		now = p1.now or os.time
	}, JoinIntentStore))
end

function JoinIntentStore:handleDeeplinkTap(JoinIntent)
	-- upvalues: GetGameLaunchPlaceIdModule (copy), MemStorageService (copy), HttpService (copy)
	local NotificationType = JoinIntent.notificationType
	
	if NotificationType == nil then return end
	local NotificationType1 = self.notificationTypes[NotificationType]
	
	if NotificationType1 == nil then return end
	local GameLaunchPlaceIdModule = GetGameLaunchPlaceIdModule(JoinIntent.url)
	
	if GameLaunchPlaceIdModule ~= nil then
		MemStorageService:SetItem("ExpChatJoinIntent", HttpService:JSONEncode({
			version = 1,
			source = JoinIntent.source,
			notificationType = NotificationType,
			notificationId = JoinIntent.notificationId,
			chatTarget = NotificationType1.chatTarget,
			placeId = GameLaunchPlaceIdModule,
			createdAt = self.now()
		}))
		
		return
	end
end

function JoinIntentStore:read(PlaceId)
	-- upvalues: MemStorageService (copy), HttpService (copy), toJoinIntent (copy)
	local CachedRead = self.cachedRead
	
	if CachedRead then
		return CachedRead
	end
	local ExpChatJoinIntentItem = MemStorageService:GetItem("ExpChatJoinIntent")
	local CachedRead1 = nil
	
	if ExpChatJoinIntentItem == "" then
		CachedRead1 = { result = "none" }
	else
		MemStorageService:SetItem("ExpChatJoinIntent", "")
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, ExpChatJoinIntentItem)
		local JoinIntent = if Success then toJoinIntent(Result) else nil
		CachedRead1 = if JoinIntent == nil then { result = "invalid" } elseif self.now() - JoinIntent.createdAt > 300 then { result = "expired", intent = JoinIntent } elseif JoinIntent.placeId == PlaceId then { result = "accepted", intent = JoinIntent } else { result = "placeMismatch", intent = JoinIntent }
	end
	self.cachedRead = CachedRead1
	
	return CachedRead1
end

function JoinIntentStore:getIntent()
	local CachedRead = self.cachedRead
	
	return if CachedRead and CachedRead.result == "accepted" then CachedRead.intent else nil
end

return JoinIntentStore