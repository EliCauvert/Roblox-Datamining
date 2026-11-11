local LocalizationService = game:GetService("LocalizationService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local SignalsModule = require(Parent.Signals)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local GetConversationTitleModule = require(AppChat.Conversations.getConversationTitle)
local UseIsUserPendingModule = require(AppChat.Hooks.useIsUserPending)
local ShouldShowOSAForConversationModule = require(AppChat.Utils.shouldShowOSAForConversation)
local ShouldShowU13ChatOptInForConversationModule = require(AppChat.Utils.shouldShowU13ChatOptInForConversation)
local _ = require(AppChat.Stores.GetConversationStore.createConversationStore)
local _ = require(AppChat.Stores.GetConversationMessageStore.createConversationMessageStore)
local EnumsModule = require(AppChat.MessageData.Enums)
local _ = require(AppChat.MessageData.Types)
local Localization = require(Parent.RobloxAppLocales).Localization
local MessageType = EnumsModule.MessageType
local MessageVisibility = EnumsModule.MessageVisibility

local function _(Entry)
	return if type(Entry) == "table" and type(Entry[1]) == "table" and type(Entry[1].alt_text) == "string" then Entry[1].alt_text else nil
end

local _ = function(Text: string)
	if type(Text) == "string" then
		local v1 = Text:split("\n")
		
		return v1 and v1[1] or ""
	else
		return ""
	end
end

local _ = function()
	-- upvalues: Localization (copy), LocalizationService (copy)
	return Localization.new(LocalizationService.RobloxLocaleId):Format("Feature.Chat.Label.MessageNotAvailable")
end

local _ = function(p1)
	return if p1 == nil then nil elseif typeof(p1) == "DateTime" then p1.UnixTimestamp elseif type(p1) == "table" and p1.GetUnixTimestamp ~= nil then p1:GetUnixTimestamp() else nil
end

local function getSubtitle(Conversation, Message)
	-- upvalues: MessageVisibility (copy), Localization (copy), LocalizationService (copy), MessageType (copy)
	if Message == nil then
		local PreviewContent: string = Conversation.previewContent
		
		if type(PreviewContent) == "string" then
			local v1 = PreviewContent:split("\n")
			
			return v1 and v1[1] or ""
		else
			return ""
		end
	else
		local FeatureChatLabelMessageNotAvailable = if Message.visibility == MessageVisibility.Hidden then Localization.new(LocalizationService.RobloxLocaleId):Format("Feature.Chat.Label.MessageNotAvailable") else Message.preview_content or (Message.content_to_display or Message.content)
		
		if FeatureChatLabelMessageNotAvailable == nil and Message.type == MessageType.System then
			local Cards = Message.cards
			FeatureChatLabelMessageNotAvailable = if type(Cards) == "table" and type(Cards[1]) == "table" and type(Cards[1].alt_text) == "string" then Cards[1].alt_text else nil
		end
		local Text: string = FeatureChatLabelMessageNotAvailable
		
		if type(Text) == "string" then
			local v2 = Text:split("\n")
			
			return v2 and v2[1] or ""
		else
			return ""
		end
	end
end

local _ = function(p1)
	-- upvalues: GetConversationTitleModule (copy)
	return GetConversationTitleModule(p1) or ""
end

local _ = function(p1)
	-- upvalues: GetConversationTitleModule (copy)
	return p1.title or (GetConversationTitleModule(p1) or "")
end

local _ = function(p1, Key, Key1, p2)
	-- upvalues: SignalsModule (copy)
	local v1 = p1[Key]
	
	if v1 then
		local v2 = v1[Key1]
		
		if v2 ~= nil then
			return v2
		end
	else
		v1 = {}
		p1[Key] = v1
	end
	local Computed = SignalsModule.createComputed(p2)
	v1[Key1] = Computed
	
	return Computed
end

return function(p1, p2)
	-- upvalues: GetConversationTitleModule (copy), SignalsModule (copy), getSubtitle (copy), UseIsUserPendingModule (copy), ShouldShowOSAForConversationModule (copy), ShouldShowU13ChatOptInForConversationModule (copy), DomLocatorsModule (copy)
	local t = {}
	
	return {
		getTitle = function(Key)
			-- upvalues: t (copy), p1 (copy), GetConversationTitleModule (upval), SignalsModule (upval)
			local function v35(p3)
				-- upvalues: p1 (upval), Key (copy), GetConversationTitleModule (upval)
				local Conversation = p1.getConversation(Key, p3)
				
				return if Conversation == nil then nil else GetConversationTitleModule(Conversation) or ""
			end
			
			local Entry = t[Key]
			
			if Entry then
				local Title = Entry.title
				
				if Title ~= nil then
					return Title
				end
			else
				Entry = {}
				t[Key] = Entry
			end
			local Computed = SignalsModule.createComputed(v35)
			Entry.title = Computed
			
			return Computed
		end,
		getSubtitle = function(Key)
			-- upvalues: t (copy), p1 (copy), p2 (copy), getSubtitle (upval), SignalsModule (upval)
			local function v40(p3)
				-- upvalues: p1 (upval), Key (copy), p2 (upval), getSubtitle (upval)
				local Conversation = p1.getConversation(Key, p3)
				
				return if Conversation == nil then "" else getSubtitle(Conversation, if Conversation.previewMessageId == nil then nil else p2.getMessage(Conversation.previewMessageId, p3))
			end
			
			local Entry = t[Key]
			
			if Entry then
				local Subtitle = Entry.subtitle
				
				if Subtitle ~= nil then
					return Subtitle
				end
			else
				Entry = {}
				t[Key] = Entry
			end
			local Computed = SignalsModule.createComputed(v40)
			Entry.subtitle = Computed
			
			return Computed
		end,
		getIsSubtitlePending = function(Key)
			-- upvalues: t (copy), p1 (copy), UseIsUserPendingModule (upval), SignalsModule (upval)
			local function v45(p3)
				-- upvalues: p1 (upval), Key (copy), UseIsUserPendingModule (upval)
				local Conversation = p1.getConversation(Key, p3)
				
				return Conversation ~= nil and UseIsUserPendingModule(Conversation)
			end
			
			local Entry = t[Key]
			
			if Entry then
				local IsSubtitlePending = Entry.isSubtitlePending
				
				if IsSubtitlePending ~= nil then
					return IsSubtitlePending
				end
			else
				Entry = {}
				t[Key] = Entry
			end
			local Computed = SignalsModule.createComputed(v45)
			Entry.isSubtitlePending = Computed
			
			return Computed
		end,
		getHasUnreadMessages = function(Key)
			-- upvalues: t (copy), p1 (copy), SignalsModule (upval)
			local function v50(p3): boolean
				-- upvalues: p1 (upval), Key (copy)
				local Conversation = p1.getConversation(Key, p3)
				
				return Conversation ~= nil and Conversation.hasUnreadMessages == true
			end
			
			local Entry = t[Key]
			
			if Entry then
				local HasUnreadMessages = Entry.hasUnreadMessages
				
				if HasUnreadMessages ~= nil then
					return HasUnreadMessages
				end
			else
				Entry = {}
				t[Key] = Entry
			end
			local Computed = SignalsModule.createComputed(v50)
			Entry.hasUnreadMessages = Computed
			
			return Computed
		end,
		getHasGroupUp = function(Key)
			-- upvalues: t (copy), p1 (copy), SignalsModule (upval)
			local function v55(p3): boolean
				-- upvalues: p1 (upval), Key (copy)
				local Conversation = p1.getConversation(Key, p3)
				
				return Conversation ~= nil and Conversation.hasGroupUp == true
			end
			
			local Entry = t[Key]
			
			if Entry then
				local HasGroupUp = Entry.hasGroupUp
				
				if HasGroupUp ~= nil then
					return HasGroupUp
				end
			else
				Entry = {}
				t[Key] = Entry
			end
			local Computed = SignalsModule.createComputed(v55)
			Entry.hasGroupUp = Computed
			
			return Computed
		end,
		getShouldShowOSA = function(Key)
			-- upvalues: t (copy), p1 (copy), ShouldShowOSAForConversationModule (upval), SignalsModule (upval)
			local function v60(p3): boolean
				-- upvalues: p1 (upval), Key (copy), ShouldShowOSAForConversationModule (upval)
				local Conversation = p1.getConversation(Key, p3)
				
				return Conversation ~= nil and ShouldShowOSAForConversationModule(Conversation) == true
			end
			
			local Entry = t[Key]
			
			if Entry then
				local ShouldShowOSA = Entry.shouldShowOSA
				
				if ShouldShowOSA ~= nil then
					return ShouldShowOSA
				end
			else
				Entry = {}
				t[Key] = Entry
			end
			local Computed = SignalsModule.createComputed(v60)
			Entry.shouldShowOSA = Computed
			
			return Computed
		end,
		getShouldShowU13ChatOptIn = function(Key)
			-- upvalues: t (copy), p1 (copy), ShouldShowU13ChatOptInForConversationModule (upval), SignalsModule (upval)
			local function v65(p3): boolean
				-- upvalues: p1 (upval), Key (copy), ShouldShowU13ChatOptInForConversationModule (upval)
				local Conversation = p1.getConversation(Key, p3)
				
				return Conversation ~= nil and ShouldShowU13ChatOptInForConversationModule(Conversation) == true
			end
			
			local Entry = t[Key]
			
			if Entry then
				local ShouldShowU13ChatOptIn = Entry.shouldShowU13ChatOptIn
				
				if ShouldShowU13ChatOptIn ~= nil then
					return ShouldShowU13ChatOptIn
				end
			else
				Entry = {}
				t[Key] = Entry
			end
			local Computed = SignalsModule.createComputed(v65)
			Entry.shouldShowU13ChatOptIn = Computed
			
			return Computed
		end,
		getConversationType = function(Key)
			-- upvalues: t (copy), p1 (copy), SignalsModule (upval)
			local function v70(p3)
				-- upvalues: p1 (upval), Key (copy)
				local Conversation = p1.getConversation(Key, p3)
				
				return if Conversation == nil then nil else Conversation.conversationType
			end
			
			local Entry = t[Key]
			
			if Entry then
				local ConversationType = Entry.conversationType
				
				if ConversationType ~= nil then
					return ConversationType
				end
			else
				Entry = {}
				t[Key] = Entry
			end
			local Computed = SignalsModule.createComputed(v70)
			Entry.conversationType = Computed
			
			return Computed
		end,
		getUnixTime = function(Key)
			-- upvalues: t (copy), p1 (copy), SignalsModule (upval)
			local function v75(p3)
				-- upvalues: p1 (upval), Key (copy)
				local Conversation = p1.getConversation(Key, p3)
				
				if Conversation == nil then
					return nil
				else
					local LastUpdated = Conversation.lastUpdated
					
					return if LastUpdated == nil then nil elseif typeof(LastUpdated) == "DateTime" then LastUpdated.UnixTimestamp elseif type(LastUpdated) == "table" and LastUpdated.GetUnixTimestamp ~= nil then LastUpdated:GetUnixTimestamp() else nil
				end
			end
			
			local Entry = t[Key]
			
			if Entry then
				local UnixTime = Entry.unixTime
				
				if UnixTime ~= nil then
					return UnixTime
				end
			else
				Entry = {}
				t[Key] = Entry
			end
			local Computed = SignalsModule.createComputed(v75)
			Entry.unixTime = Computed
			
			return Computed
		end,
		getTestId = function(Key)
			-- upvalues: t (copy), p1 (copy), DomLocatorsModule (upval), GetConversationTitleModule (upval), SignalsModule (upval)
			local function v81(p3)
				-- upvalues: p1 (upval), Key (copy), DomLocatorsModule (upval), GetConversationTitleModule (upval)
				local Conversation = p1.getConversation(Key, p3)
				
				return if Conversation == nil then nil else DomLocatorsModule.chatLandingConversationEntry(Conversation.title or (GetConversationTitleModule(Conversation) or ""))
			end
			
			local Entry = t[Key]
			
			if Entry then
				local TestId = Entry.testId
				
				if TestId ~= nil then
					return TestId
				end
			else
				Entry = {}
				t[Key] = Entry
			end
			local Computed = SignalsModule.createComputed(v81)
			Entry.testId = Computed
			
			return Computed
		end,
		getLocatorTitle = function(Key)
			-- upvalues: t (copy), p1 (copy), GetConversationTitleModule (upval), SignalsModule (upval)
			local function v86(p3)
				-- upvalues: p1 (upval), Key (copy), GetConversationTitleModule (upval)
				local Conversation = p1.getConversation(Key, p3)
				local Title = nil
				
				if Conversation == nil then
					Title = nil
				else
					Title = Conversation.title
					
					if not Title then
						return GetConversationTitleModule(Conversation) or ""
					end
				end
				return Title
			end
			
			local Entry = t[Key]
			
			if Entry then
				local LocatorTitle = Entry.locatorTitle
				
				if LocatorTitle ~= nil then
					return LocatorTitle
				end
			else
				Entry = {}
				t[Key] = Entry
			end
			local Computed = SignalsModule.createComputed(v86)
			Entry.locatorTitle = Computed
			
			return Computed
		end
	}
end