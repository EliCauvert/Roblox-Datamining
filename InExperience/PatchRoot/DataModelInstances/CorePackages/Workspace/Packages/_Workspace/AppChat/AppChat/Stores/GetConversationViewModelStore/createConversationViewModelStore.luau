local localizationService = game:GetService("LocalizationService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local signalsModule = require(parent.Signals)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local getConversationTitleModule = require(appChat.Conversations.getConversationTitle)
local useIsUserPendingModule = require(appChat.Hooks.useIsUserPending)
local shouldShowOSAForConversationModule = require(appChat.Utils.shouldShowOSAForConversation)
local shouldShowU13ChatOptInForConversationModule = require(appChat.Utils.shouldShowU13ChatOptInForConversation)
local _ = require(appChat.Stores.GetConversationStore.createConversationStore)
local _ = require(appChat.Stores.GetConversationMessageStore.createConversationMessageStore)
local enumsModule = require(appChat.MessageData.Enums)
local _ = require(appChat.MessageData.Types)
local localization = require(parent.RobloxAppLocales).Localization
local messageType = enumsModule.MessageType
local messageVisibility = enumsModule.MessageVisibility

local function _(p1)
	return if not (type(p1) ~= "table" or type(p1[1]) ~= "table") then if type(p1[1].alt_text) == "string" then p1[1].alt_text else nil else nil
end

local _ = function(p1)
	if type(p1) == "string" then
		local var1 = p1:split("\n")
		
		return if var1 then var1[1] else ""
	end
	return ""
end

local _ = function()
	-- upvalues: localization (ref), localizationService (ref)
	return localization.new(localizationService.RobloxLocaleId):Format("Feature.Chat.Label.MessageNotAvailable")
end

local _ = function(p1)
	return if p1 == nil then nil elseif typeof(p1) == "DateTime" then p1.UnixTimestamp elseif type(p1) == "table" and p1.GetUnixTimestamp ~= nil then p1:GetUnixTimestamp() else nil
end

local function getSubtitle(p1, p2)
	-- upvalues: messageVisibility (ref), localization (ref), localizationService (ref), messageType (ref)
	local cards
	if p2 == nil then
		cards = p1.previewContent
		
		if type(cards) == "string" then
			local var1 = cards:split("\n")
			
			return if var1 then var1[1] else ""
		end
		return ""
	else
		local var2 = if p2.visibility == messageVisibility.Hidden then localization.new(localizationService.RobloxLocaleId):Format("Feature.Chat.Label.MessageNotAvailable") else p2.preview_content or (p2.content_to_display or p2.content)
		
		if var2 == nil and p2.type == messageType.System then
			cards = p2.cards
			var2 = if type(cards) == "table" and type(cards[1]) == "table" then if type(cards[1].alt_text) == "string" then cards[1].alt_text else nil else nil
		end
		local var3 = var2
		
		if type(var3) == "string" then
			local var4 = var3:split("\n")
			
			return if var4 then var4[1] else ""
		end
		return ""
	end
end

local _ = function(p1)
	-- upvalues: getConversationTitleModule (ref)
	return getConversationTitleModule(p1) or ""
end

local _ = function(p1)
	-- upvalues: getConversationTitleModule (ref)
	return p1.title or (getConversationTitleModule(p1) or "")
end

local _ = function(p1, p2, p3, p4)
	-- upvalues: signalsModule (ref)
	local var1 = p1[p2]
	
	if var1 then
		local var2 = var1[p3]
		
		if var2 == nil then
			local var3 = signalsModule.createComputed(p4)
			var1[p3] = var3
			
			return var3
		else
			return var2
		end
	else
		var1 = {}
		p1[p2] = var1
	end
end

return function(p1, p2)
	-- upvalues: getConversationTitleModule (ref), signalsModule (ref), getSubtitle (ref), useIsUserPendingModule (ref), shouldShowOSAForConversationModule (ref), shouldShowU13ChatOptInForConversationModule (ref), domLocatorsModule (ref)
	local t = {}
	
	return {
		getTitle = function(p3)
			-- upvalues: t (ref), p1 (ref), getConversationTitleModule (copy), signalsModule (copy)
			local var1 = function(p4)
				-- upvalues: p1 (copy), p3 (ref), getConversationTitleModule (copy)
				local conversation = p1.getConversation(p3, p4)
				
				return if conversation == nil then nil else getConversationTitleModule(conversation) or ""
			end
			
			local var2 = t[p3]
			
			if var2 then
				local title = var2.title
				
				if title == nil then
					local var3 = signalsModule.createComputed(var1)
					var2.title = var3
					
					return var3
				else
					return title
				end
			else
				var2 = {}
				t[p3] = var2
			end
		end,
		getSubtitle = function(p3)
			-- upvalues: t (ref), p1 (ref), p2 (ref), getSubtitle (copy), signalsModule (copy)
			local var1 = function(p4)
				-- upvalues: p1 (copy), p3 (ref), p2 (copy), getSubtitle (copy)
				local conversation = p1.getConversation(p3, p4)
				
				return if conversation == nil then "" else getSubtitle(conversation, if conversation.previewMessageId ~= nil then nil else p2.getMessage(conversation.previewMessageId, p4))
			end
			
			local var2 = t[p3]
			
			if var2 then
				local subtitle = var2.subtitle
				
				if subtitle == nil then
					local var3 = signalsModule.createComputed(var1)
					var2.subtitle = var3
					
					return var3
				else
					return subtitle
				end
			else
				var2 = {}
				t[p3] = var2
			end
		end,
		getIsSubtitlePending = function(p3)
			-- upvalues: t (ref), p1 (ref), useIsUserPendingModule (copy), signalsModule (copy)
			local var1 = function(p4)
				-- upvalues: p1 (copy), p3 (ref), useIsUserPendingModule (copy)
				local conversation = p1.getConversation(p3, p4)
				
				return if conversation == nil then false else useIsUserPendingModule(conversation)
			end
			
			local var2 = t[p3]
			
			if var2 then
				local isSubtitlePending = var2.isSubtitlePending
				
				if isSubtitlePending == nil then
					local var3 = signalsModule.createComputed(var1)
					var2.isSubtitlePending = var3
					
					return var3
				else
					return isSubtitlePending
				end
			else
				var2 = {}
				t[p3] = var2
			end
		end,
		getHasUnreadMessages = function(p3)
			-- upvalues: t (ref), p1 (ref), signalsModule (copy)
			local var1 = function(p4)
				-- upvalues: p1 (copy), p3 (ref)
				local conversation = p1.getConversation(p3, p4)
				
				return conversation ~= nil and conversation.hasUnreadMessages == true
			end
			
			local var2 = t[p3]
			
			if var2 then
				local hasUnreadMessages = var2.hasUnreadMessages
				
				if hasUnreadMessages == nil then
					local var3 = signalsModule.createComputed(var1)
					var2.hasUnreadMessages = var3
					
					return var3
				else
					return hasUnreadMessages
				end
			else
				var2 = {}
				t[p3] = var2
			end
		end,
		getHasGroupUp = function(p3)
			-- upvalues: t (ref), p1 (ref), signalsModule (copy)
			local var1 = function(p4)
				-- upvalues: p1 (copy), p3 (ref)
				local conversation = p1.getConversation(p3, p4)
				
				return conversation ~= nil and conversation.hasGroupUp == true
			end
			
			local var2 = t[p3]
			
			if var2 then
				local hasGroupUp = var2.hasGroupUp
				
				if hasGroupUp == nil then
					local var3 = signalsModule.createComputed(var1)
					var2.hasGroupUp = var3
					
					return var3
				else
					return hasGroupUp
				end
			else
				var2 = {}
				t[p3] = var2
			end
		end,
		getShouldShowOSA = function(p3)
			-- upvalues: t (ref), p1 (ref), shouldShowOSAForConversationModule (copy), signalsModule (copy)
			local var1 = function(p4)
				-- upvalues: p1 (copy), p3 (ref), shouldShowOSAForConversationModule (copy)
				local conversation = p1.getConversation(p3, p4)
				
				return conversation ~= nil and shouldShowOSAForConversationModule(conversation) == true
			end
			
			local var2 = t[p3]
			
			if var2 then
				local shouldShowOSA = var2.shouldShowOSA
				
				if shouldShowOSA == nil then
					local var3 = signalsModule.createComputed(var1)
					var2.shouldShowOSA = var3
					
					return var3
				else
					return shouldShowOSA
				end
			else
				var2 = {}
				t[p3] = var2
			end
		end,
		getShouldShowU13ChatOptIn = function(p3)
			-- upvalues: t (ref), p1 (ref), shouldShowU13ChatOptInForConversationModule (copy), signalsModule (copy)
			local var1 = function(p4)
				-- upvalues: p1 (copy), p3 (ref), shouldShowU13ChatOptInForConversationModule (copy)
				local conversation = p1.getConversation(p3, p4)
				
				return conversation ~= nil and shouldShowU13ChatOptInForConversationModule(conversation) == true
			end
			
			local var2 = t[p3]
			
			if var2 then
				local shouldShowU13ChatOptIn = var2.shouldShowU13ChatOptIn
				
				if shouldShowU13ChatOptIn == nil then
					local var3 = signalsModule.createComputed(var1)
					var2.shouldShowU13ChatOptIn = var3
					
					return var3
				else
					return shouldShowU13ChatOptIn
				end
			else
				var2 = {}
				t[p3] = var2
			end
		end,
		getConversationType = function(p3)
			-- upvalues: t (ref), p1 (ref), signalsModule (copy)
			local var1 = function(p4)
				-- upvalues: p1 (copy), p3 (ref)
				local conversation = p1.getConversation(p3, p4)
				
				return if conversation == nil then nil else conversation.conversationType
			end
			
			local var2 = t[p3]
			
			if var2 then
				local conversationType = var2.conversationType
				
				if conversationType == nil then
					local var3 = signalsModule.createComputed(var1)
					var2.conversationType = var3
					
					return var3
				else
					return conversationType
				end
			else
				var2 = {}
				t[p3] = var2
			end
		end,
		getUnixTime = function(p3)
			-- upvalues: t (ref), p1 (ref), signalsModule (copy)
			local var1 = function(p4)
				-- upvalues: p1 (copy), p3 (ref)
				local conversation = p1.getConversation(p3, p4)
				
				if conversation == nil then
					return nil
				end
				local lastUpdated = conversation.lastUpdated
				
				return if lastUpdated == nil then nil elseif typeof(lastUpdated) == "DateTime" then lastUpdated.UnixTimestamp elseif type(lastUpdated) == "table" and lastUpdated.GetUnixTimestamp ~= nil then lastUpdated:GetUnixTimestamp() else nil
			end
			
			local var2 = t[p3]
			
			if var2 then
				local unixTime = var2.unixTime
				
				if unixTime == nil then
					local var3 = signalsModule.createComputed(var1)
					var2.unixTime = var3
					
					return var3
				else
					return unixTime
				end
			else
				var2 = {}
				t[p3] = var2
			end
		end,
		getTestId = function(p3)
			-- upvalues: t (ref), p1 (ref), domLocatorsModule (copy), getConversationTitleModule (copy), signalsModule (copy)
			local var1 = function(p4)
				-- upvalues: p1 (copy), p3 (ref), domLocatorsModule (copy), getConversationTitleModule (copy)
				local conversation = p1.getConversation(p3, p4)
				
				return if conversation == nil then nil else domLocatorsModule.chatLandingConversationEntry(conversation.title or (getConversationTitleModule(conversation) or ""))
			end
			
			local var2 = t[p3]
			
			if var2 then
				local testId = var2.testId
				
				if testId == nil then
					local var3 = signalsModule.createComputed(var1)
					var2.testId = var3
					
					return var3
				else
					return testId
				end
			else
				var2 = {}
				t[p3] = var2
			end
		end,
		getLocatorTitle = function(p3)
			-- upvalues: t (ref), p1 (ref), getConversationTitleModule (copy), signalsModule (copy)
			local var1 = function(p4)
				-- upvalues: p1 (copy), p3 (ref), getConversationTitleModule (copy)
				local title
				local conversation = p1.getConversation(p3, p4)
				
				if conversation == nil then
					title = nil
				else
					title = conversation.title
					
					return title or (getConversationTitleModule(conversation) or "")
				end
			end
			
			local var2 = t[p3]
			
			if var2 then
				local locatorTitle = var2.locatorTitle
				
				if locatorTitle == nil then
					local var3 = signalsModule.createComputed(var1)
					var2.locatorTitle = var3
					
					return var3
				else
					return locatorTitle
				end
			else
				var2 = {}
				t[p3] = var2
			end
		end
	}
end