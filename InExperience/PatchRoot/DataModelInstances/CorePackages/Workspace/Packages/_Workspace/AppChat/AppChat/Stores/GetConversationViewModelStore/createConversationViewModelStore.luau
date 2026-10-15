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
local _ = require(appChat.Stores.GetConversationMessageListStore.createConversationMessageListStore)
local getPreciseUnixTimestampModule = require(appChat.Utils.getPreciseUnixTimestamp)
local enumsModule = require(appChat.MessageData.Enums)
local _ = require(appChat.MessageData.Types)
local localization = require(parent.RobloxAppLocales).Localization
local fFlagAppChatDerivedConversationLatestActivityModule = require(appChat.Flags.FFlagAppChatDerivedConversationLatestActivity)
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

local _ = function(p1, p2)
	-- upvalues: getPreciseUnixTimestampModule (ref)
	local var1 = getPreciseUnixTimestampModule(p1.lastUpdated)
	local var2 = if p2 ~= nil then nil else getPreciseUnixTimestampModule(p2.created_at)
	
	return if var2 == nil or var1 ~= nil and var1 >= var2 then var1 else var2
end

local _ = function(p1, p2)
	-- upvalues: getPreciseUnixTimestampModule (ref)
	local var1 = getPreciseUnixTimestampModule(p1.lastUpdated)
	local var2 = getPreciseUnixTimestampModule(p2.created_at)
	
	return var2 ~= nil and (if var1 ~= nil then var1 <= var2 else true)
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

return function(p1, p2, p3)
	-- upvalues: getConversationTitleModule (ref), signalsModule (ref), fFlagAppChatDerivedConversationLatestActivityModule (ref), getPreciseUnixTimestampModule (ref), getSubtitle (ref), useIsUserPendingModule (ref), shouldShowOSAForConversationModule (ref), shouldShowU13ChatOptInForConversationModule (ref), domLocatorsModule (ref)
	local t = {}
	
	local function _(p4)
		-- upvalues: t (ref), p3 (ref), p2 (ref), signalsModule (copy)
		local var1 = function(p5)
			-- upvalues: p3 (copy), p4 (ref), p2 (copy)
			for i, v in p3.getOrderedIds(p4, p5) do
				local message = p2.getMessage(v, p5)
				
				if message ~= nil and message.is_previewable == true then
					return message
				end
			end
			return nil
		end
		
		local var2 = t[p4]
		
		if var2 then
			local newestPreviewableMessage = var2.newestPreviewableMessage
			
			if newestPreviewableMessage == nil then
				local var3 = signalsModule.createComputed(var1)
				var2.newestPreviewableMessage = var3
				
				return var3
			else
				return newestPreviewableMessage
			end
		else
			var2 = {}
			t[p4] = var2
		end
	end
	
	return {
		getTitle = function(p5)
			-- upvalues: t (ref), p1 (ref), getConversationTitleModule (copy), signalsModule (copy)
			local var2 = function(p6)
				-- upvalues: p1 (copy), p5 (ref), getConversationTitleModule (copy)
				local conversation = p1.getConversation(p5, p6)
				
				return if conversation == nil then nil else getConversationTitleModule(conversation) or ""
			end
			
			local var3 = t[p5]
			
			if var3 then
				local title = var3.title
				
				if title == nil then
					local var4 = signalsModule.createComputed(var2)
					var3.title = var4
					
					return var4
				else
					return title
				end
			else
				var3 = {}
				t[p5] = var3
			end
		end,
		getSubtitle = function(p5)
			-- upvalues: t (ref), p1 (ref), fFlagAppChatDerivedConversationLatestActivityModule (copy), p3 (ref), p2 (ref), signalsModule (copy), getPreciseUnixTimestampModule (copy), getSubtitle (copy)
			local var2 = function(p6)
				-- upvalues: p1 (copy), p5 (ref), fFlagAppChatDerivedConversationLatestActivityModule (copy), t (copy), p3 (copy), p2 (copy), signalsModule (copy), getPreciseUnixTimestampModule (copy), getSubtitle (copy)
				local conversation = p1.getConversation(p5, p6)
				
				if conversation == nil then
					return ""
				elseif fFlagAppChatDerivedConversationLatestActivityModule then
					local newestPreviewableMessage, var3
					local var4 = t
					
					local var5 = function(p7)
						-- upvalues: p3 (copy), p5 (ref), p2 (copy)
						for i, v in p3.getOrderedIds(p5, p7) do
							local message = p2.getMessage(v, p7)
							
							if message ~= nil and message.is_previewable == true then
								return message
							end
						end
						return nil
					end
					
					local var6 = var4[p5]
					
					if var6 then
						newestPreviewableMessage = var6.newestPreviewableMessage
						
						if newestPreviewableMessage == nil then
							newestPreviewableMessage = signalsModule.createComputed(var5)
							var6.newestPreviewableMessage = newestPreviewableMessage
							var3 = newestPreviewableMessage
						else
							var3 = newestPreviewableMessage
						end
						var3 = var3(p6)
						
						if var3 ~= nil then
							local var7 = getPreciseUnixTimestampModule(conversation.lastUpdated)
							local var8 = getPreciseUnixTimestampModule(var3.created_at)
							
							return if var8 ~= nil and (if var7 ~= nil then var7 <= var8 else true) then getSubtitle(conversation, var3) else getSubtitle(conversation, if conversation.previewMessageId ~= nil then nil else p2.getMessage(conversation.previewMessageId, p6))
						end
					else
						var6 = {}
						var4[p5] = var6
					end
				end
			end
			
			local var6 = t[p5]
			
			if var6 then
				local subtitle = var6.subtitle
				
				if subtitle == nil then
					local var7 = signalsModule.createComputed(var2)
					var6.subtitle = var7
					
					return var7
				else
					return subtitle
				end
			else
				var6 = {}
				t[p5] = var6
			end
		end,
		getIsSubtitlePending = function(p6)
			-- upvalues: t (ref), p1 (ref), useIsUserPendingModule (copy), signalsModule (copy)
			local var3 = function(p7)
				-- upvalues: p1 (copy), p6 (ref), useIsUserPendingModule (copy)
				local conversation = p1.getConversation(p6, p7)
				
				return if conversation == nil then false else useIsUserPendingModule(conversation)
			end
			
			local var4 = t[p6]
			
			if var4 then
				local isSubtitlePending = var4.isSubtitlePending
				
				if isSubtitlePending == nil then
					local var5 = signalsModule.createComputed(var3)
					var4.isSubtitlePending = var5
					
					return var5
				else
					return isSubtitlePending
				end
			else
				var4 = {}
				t[p6] = var4
			end
		end,
		getHasUnreadMessages = function(p6)
			-- upvalues: t (ref), p1 (ref), signalsModule (copy)
			local var3 = function(p7)
				-- upvalues: p1 (copy), p6 (ref)
				local conversation = p1.getConversation(p6, p7)
				
				return conversation ~= nil and conversation.hasUnreadMessages == true
			end
			
			local var4 = t[p6]
			
			if var4 then
				local hasUnreadMessages = var4.hasUnreadMessages
				
				if hasUnreadMessages == nil then
					local var5 = signalsModule.createComputed(var3)
					var4.hasUnreadMessages = var5
					
					return var5
				else
					return hasUnreadMessages
				end
			else
				var4 = {}
				t[p6] = var4
			end
		end,
		getHasGroupUp = function(p6)
			-- upvalues: t (ref), p1 (ref), signalsModule (copy)
			local var3 = function(p7)
				-- upvalues: p1 (copy), p6 (ref)
				local conversation = p1.getConversation(p6, p7)
				
				return conversation ~= nil and conversation.hasGroupUp == true
			end
			
			local var4 = t[p6]
			
			if var4 then
				local hasGroupUp = var4.hasGroupUp
				
				if hasGroupUp == nil then
					local var5 = signalsModule.createComputed(var3)
					var4.hasGroupUp = var5
					
					return var5
				else
					return hasGroupUp
				end
			else
				var4 = {}
				t[p6] = var4
			end
		end,
		getShouldShowOSA = function(p6)
			-- upvalues: t (ref), p1 (ref), shouldShowOSAForConversationModule (copy), signalsModule (copy)
			local var3 = function(p7)
				-- upvalues: p1 (copy), p6 (ref), shouldShowOSAForConversationModule (copy)
				local conversation = p1.getConversation(p6, p7)
				
				return conversation ~= nil and shouldShowOSAForConversationModule(conversation) == true
			end
			
			local var4 = t[p6]
			
			if var4 then
				local shouldShowOSA = var4.shouldShowOSA
				
				if shouldShowOSA == nil then
					local var5 = signalsModule.createComputed(var3)
					var4.shouldShowOSA = var5
					
					return var5
				else
					return shouldShowOSA
				end
			else
				var4 = {}
				t[p6] = var4
			end
		end,
		getShouldShowU13ChatOptIn = function(p6)
			-- upvalues: t (ref), p1 (ref), shouldShowU13ChatOptInForConversationModule (copy), signalsModule (copy)
			local var3 = function(p7)
				-- upvalues: p1 (copy), p6 (ref), shouldShowU13ChatOptInForConversationModule (copy)
				local conversation = p1.getConversation(p6, p7)
				
				return conversation ~= nil and shouldShowU13ChatOptInForConversationModule(conversation) == true
			end
			
			local var4 = t[p6]
			
			if var4 then
				local shouldShowU13ChatOptIn = var4.shouldShowU13ChatOptIn
				
				if shouldShowU13ChatOptIn == nil then
					local var5 = signalsModule.createComputed(var3)
					var4.shouldShowU13ChatOptIn = var5
					
					return var5
				else
					return shouldShowU13ChatOptIn
				end
			else
				var4 = {}
				t[p6] = var4
			end
		end,
		getConversationType = function(p6)
			-- upvalues: t (ref), p1 (ref), signalsModule (copy)
			local var3 = function(p7)
				-- upvalues: p1 (copy), p6 (ref)
				local conversation = p1.getConversation(p6, p7)
				
				return if conversation == nil then nil else conversation.conversationType
			end
			
			local var4 = t[p6]
			
			if var4 then
				local conversationType = var4.conversationType
				
				if conversationType == nil then
					local var5 = signalsModule.createComputed(var3)
					var4.conversationType = var5
					
					return var5
				else
					return conversationType
				end
			else
				var4 = {}
				t[p6] = var4
			end
		end,
		getUnixTime = function(p6)
			-- upvalues: t (ref), p1 (ref), fFlagAppChatDerivedConversationLatestActivityModule (copy), p3 (ref), p2 (ref), signalsModule (copy), getPreciseUnixTimestampModule (copy)
			local var3 = function(p7)
				-- upvalues: p1 (copy), p6 (ref), fFlagAppChatDerivedConversationLatestActivityModule (copy), t (copy), p3 (copy), p2 (copy), signalsModule (copy), getPreciseUnixTimestampModule (copy)
				local conversation = p1.getConversation(p6, p7)
				
				if fFlagAppChatDerivedConversationLatestActivityModule then
					if conversation == nil then
						return nil
					end
					local newestPreviewableMessage, var4
					local var5 = function(p8)
						-- upvalues: p3 (copy), p6 (ref), p2 (copy)
						for i, v in p3.getOrderedIds(p6, p8) do
							local message = p2.getMessage(v, p8)
							
							if message ~= nil and message.is_previewable == true then
								return message
							end
						end
						return nil
					end
					
					local var6 = t[p6]
					
					if var6 then
						newestPreviewableMessage = var6.newestPreviewableMessage
						
						if newestPreviewableMessage == nil then
							newestPreviewableMessage = signalsModule.createComputed(var5)
							var6.newestPreviewableMessage = newestPreviewableMessage
							var4 = newestPreviewableMessage
						else
							var4 = newestPreviewableMessage
						end
						var4 = var4(p7)
						local var7 = getPreciseUnixTimestampModule(conversation.lastUpdated)
						local var8 = if var4 ~= nil then nil else getPreciseUnixTimestampModule(var4.created_at)
						
						return if var8 == nil or var7 ~= nil and var7 >= var8 then var7 else var8
					else
						var6 = {}
						t[p6] = var6
					end
				elseif conversation == nil then
					return nil
				end
				local lastUpdated = conversation.lastUpdated
				
				return if lastUpdated == nil then nil elseif typeof(lastUpdated) == "DateTime" then lastUpdated.UnixTimestamp elseif type(lastUpdated) == "table" and lastUpdated.GetUnixTimestamp ~= nil then lastUpdated:GetUnixTimestamp() else nil
			end
			
			local var6 = t[p6]
			
			if var6 then
				local unixTime = var6.unixTime
				
				if unixTime == nil then
					local var7 = signalsModule.createComputed(var3)
					var6.unixTime = var7
					
					return var7
				else
					return unixTime
				end
			else
				var6 = {}
				t[p6] = var6
			end
		end,
		getTestId = function(p7)
			-- upvalues: t (ref), p1 (ref), domLocatorsModule (copy), getConversationTitleModule (copy), signalsModule (copy)
			local var4 = function(p8)
				-- upvalues: p1 (copy), p7 (ref), domLocatorsModule (copy), getConversationTitleModule (copy)
				local conversation = p1.getConversation(p7, p8)
				
				return if conversation == nil then nil else domLocatorsModule.chatLandingConversationEntry(conversation.title or (getConversationTitleModule(conversation) or ""))
			end
			
			local var5 = t[p7]
			
			if var5 then
				local testId = var5.testId
				
				if testId == nil then
					local var6 = signalsModule.createComputed(var4)
					var5.testId = var6
					
					return var6
				else
					return testId
				end
			else
				var5 = {}
				t[p7] = var5
			end
		end,
		getLocatorTitle = function(p7)
			-- upvalues: t (ref), p1 (ref), getConversationTitleModule (copy), signalsModule (copy)
			local var4 = function(p8)
				-- upvalues: p1 (copy), p7 (ref), getConversationTitleModule (copy)
				local title
				local conversation = p1.getConversation(p7, p8)
				
				if conversation == nil then
					title = nil
				else
					title = conversation.title
					
					return title or (getConversationTitleModule(conversation) or "")
				end
			end
			
			local var5 = t[p7]
			
			if var5 then
				local locatorTitle = var5.locatorTitle
				
				if locatorTitle == nil then
					local var6 = signalsModule.createComputed(var4)
					var5.locatorTitle = var6
					
					return var6
				else
					return locatorTitle
				end
			else
				var5 = {}
				t[p7] = var5
			end
		end
	}
end