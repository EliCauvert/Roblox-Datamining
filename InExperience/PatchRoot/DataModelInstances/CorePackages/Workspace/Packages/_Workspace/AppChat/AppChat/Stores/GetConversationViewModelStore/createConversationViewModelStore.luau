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

local function _(p0) --[[ line: 28 | named "getFirstCardAltText" ]]
	return if not (type(p0) ~= "table" or type(p0[1]) ~= "table") then if type(p0[1].alt_text) == "string" then p0[1].alt_text else nil else nil
end

local _ = function(p1) --[[ line: 49 | named "getContentFirstLine" ]]
	if type(p1) == "string" then
		local var10 = p1:split("\n")
		
		return if var10 then var10[1] else ""
	end
	return ""
end

local _ = function() --[[ line: 57 | named "getHiddenMessageText" ]]
	-- upvalues: localization (ref), localizationService (ref)
	return localization.new(localizationService.RobloxLocaleId):Format("Feature.Chat.Label.MessageNotAvailable")
end

local _ = function(p2) --[[ line: 61 | named "getUnixTime" ]]
	return if p2 == nil then nil elseif typeof(p2) == "DateTime" then p2.UnixTimestamp elseif type(p2) == "table" and p2.GetUnixTimestamp ~= nil then p2:GetUnixTimestamp() else nil
end

local function getSubtitle(p3, p4) --[[ line: 74 ]]
	-- upvalues: messageVisibility (ref), localization (ref), localizationService (ref), messageType (ref)
	local cards
	if p4 == nil then
		cards = p3.previewContent
		
		if type(cards) == "string" then
			local var14 = cards:split("\n")
			
			return if var14 then var14[1] else ""
		end
		return ""
	else
		local var11 = if p4.visibility == messageVisibility.Hidden then localization.new(localizationService.RobloxLocaleId):Format("Feature.Chat.Label.MessageNotAvailable") else p4.preview_content or (p4.content_to_display or p4.content)
		
		if var11 == nil and p4.type == messageType.System then
			cards = p4.cards
			var11 = if type(cards) == "table" and type(cards[1]) == "table" then if type(cards[1].alt_text) == "string" then cards[1].alt_text else nil else nil
		end
		local var12 = var11
		
		if type(var12) == "string" then
			local var13 = var12:split("\n")
			
			return if var13 then var13[1] else ""
		end
		return ""
	end
end

local _ = function(p5) --[[ line: 88 | named "getTitle" ]]
	-- upvalues: getConversationTitleModule (ref)
	return getConversationTitleModule(p5) or ""
end

local _ = function(p6) --[[ line: 92 | named "getLocatorTitle" ]]
	-- upvalues: getConversationTitleModule (ref)
	return p6.title or (getConversationTitleModule(p6) or "")
end

local _ = function(p7, p8, p9, p10) --[[ line: 98 | named "getCachedGetter" ]]
	-- upvalues: signalsModule (ref)
	local var15 = p7[p8]
	
	if var15 then
		local var16 = var15[p9]
		
		if var16 == nil then
			local var17 = signalsModule.createComputed(p10)
			var15[p9] = var17
			
			return var17
		else
			return var16
		end
	else
		var15 = {}
		p7[p8] = var15
	end
end

return function(p11, p12) --[[ line: 120 | named "createConversationViewModelStore" ]]
	-- upvalues: getConversationTitleModule (ref), signalsModule (ref), getSubtitle (ref), useIsUserPendingModule (ref), shouldShowOSAForConversationModule (ref), shouldShowU13ChatOptInForConversationModule (ref), domLocatorsModule (ref)
	local t = {}
	
	return {
		getTitle = function(p13) --[[ line: 126 ]]
			-- upvalues: t (ref), p11 (ref), getConversationTitleModule (copy), signalsModule (copy)
			local var19 = function(p14) --[[ line: 127 ]]
				-- upvalues: p11 (copy), p13 (ref), getConversationTitleModule (copy)
				local conversation = p11.getConversation(p13, p14)
				
				return if conversation == nil then nil else getConversationTitleModule(conversation) or ""
			end
			
			local var20 = t[p13]
			
			if var20 then
				local title = var20.title
				
				if title == nil then
					local var21 = signalsModule.createComputed(var19)
					var20.title = var21
					
					return var21
				else
					return title
				end
			else
				var20 = {}
				t[p13] = var20
			end
		end,
		getSubtitle = function(p15) --[[ line: 133 ]]
			-- upvalues: t (ref), p11 (ref), p12 (ref), getSubtitle (copy), signalsModule (copy)
			local var23 = function(p16) --[[ line: 134 ]]
				-- upvalues: p11 (copy), p15 (ref), p12 (copy), getSubtitle (copy)
				local conversation = p11.getConversation(p15, p16)
				
				return if conversation == nil then "" else getSubtitle(conversation, if conversation.previewMessageId ~= nil then nil else p12.getMessage(conversation.previewMessageId, p16))
			end
			
			local var24 = t[p15]
			
			if var24 then
				local subtitle = var24.subtitle
				
				if subtitle == nil then
					local var25 = signalsModule.createComputed(var23)
					var24.subtitle = var25
					
					return var25
				else
					return subtitle
				end
			else
				var24 = {}
				t[p15] = var24
			end
		end,
		getIsSubtitlePending = function(p17) --[[ line: 147 ]]
			-- upvalues: t (ref), p11 (ref), useIsUserPendingModule (copy), signalsModule (copy)
			local var27 = function(p18) --[[ line: 148 ]]
				-- upvalues: p11 (copy), p17 (ref), useIsUserPendingModule (copy)
				local conversation = p11.getConversation(p17, p18)
				
				return if conversation == nil then false else useIsUserPendingModule(conversation)
			end
			
			local var28 = t[p17]
			
			if var28 then
				local isSubtitlePending = var28.isSubtitlePending
				
				if isSubtitlePending == nil then
					local var29 = signalsModule.createComputed(var27)
					var28.isSubtitlePending = var29
					
					return var29
				else
					return isSubtitlePending
				end
			else
				var28 = {}
				t[p17] = var28
			end
		end,
		getHasUnreadMessages = function(p19) --[[ line: 154 ]]
			-- upvalues: t (ref), p11 (ref), signalsModule (copy)
			local var31 = function(p20) --[[ line: 155 ]]
				-- upvalues: p11 (copy), p19 (ref)
				local conversation = p11.getConversation(p19, p20)
				
				return conversation ~= nil and conversation.hasUnreadMessages == true
			end
			
			local var32 = t[p19]
			
			if var32 then
				local hasUnreadMessages = var32.hasUnreadMessages
				
				if hasUnreadMessages == nil then
					local var33 = signalsModule.createComputed(var31)
					var32.hasUnreadMessages = var33
					
					return var33
				else
					return hasUnreadMessages
				end
			else
				var32 = {}
				t[p19] = var32
			end
		end,
		getHasGroupUp = function(p21) --[[ line: 161 ]]
			-- upvalues: t (ref), p11 (ref), signalsModule (copy)
			local var35 = function(p22) --[[ line: 162 ]]
				-- upvalues: p11 (copy), p21 (ref)
				local conversation = p11.getConversation(p21, p22)
				
				return conversation ~= nil and conversation.hasGroupUp == true
			end
			
			local var36 = t[p21]
			
			if var36 then
				local hasGroupUp = var36.hasGroupUp
				
				if hasGroupUp == nil then
					local var37 = signalsModule.createComputed(var35)
					var36.hasGroupUp = var37
					
					return var37
				else
					return hasGroupUp
				end
			else
				var36 = {}
				t[p21] = var36
			end
		end,
		getShouldShowOSA = function(p23) --[[ line: 168 ]]
			-- upvalues: t (ref), p11 (ref), shouldShowOSAForConversationModule (copy), signalsModule (copy)
			local var39 = function(p24) --[[ line: 169 ]]
				-- upvalues: p11 (copy), p23 (ref), shouldShowOSAForConversationModule (copy)
				local conversation = p11.getConversation(p23, p24)
				
				return conversation ~= nil and shouldShowOSAForConversationModule(conversation) == true
			end
			
			local var40 = t[p23]
			
			if var40 then
				local shouldShowOSA = var40.shouldShowOSA
				
				if shouldShowOSA == nil then
					local var41 = signalsModule.createComputed(var39)
					var40.shouldShowOSA = var41
					
					return var41
				else
					return shouldShowOSA
				end
			else
				var40 = {}
				t[p23] = var40
			end
		end,
		getShouldShowU13ChatOptIn = function(p25) --[[ line: 175 ]]
			-- upvalues: t (ref), p11 (ref), shouldShowU13ChatOptInForConversationModule (copy), signalsModule (copy)
			local var43 = function(p26) --[[ line: 176 ]]
				-- upvalues: p11 (copy), p25 (ref), shouldShowU13ChatOptInForConversationModule (copy)
				local conversation = p11.getConversation(p25, p26)
				
				return conversation ~= nil and shouldShowU13ChatOptInForConversationModule(conversation) == true
			end
			
			local var44 = t[p25]
			
			if var44 then
				local shouldShowU13ChatOptIn = var44.shouldShowU13ChatOptIn
				
				if shouldShowU13ChatOptIn == nil then
					local var45 = signalsModule.createComputed(var43)
					var44.shouldShowU13ChatOptIn = var45
					
					return var45
				else
					return shouldShowU13ChatOptIn
				end
			else
				var44 = {}
				t[p25] = var44
			end
		end,
		getConversationType = function(p27) --[[ line: 182 ]]
			-- upvalues: t (ref), p11 (ref), signalsModule (copy)
			local var47 = function(p28) --[[ line: 183 ]]
				-- upvalues: p11 (copy), p27 (ref)
				local conversation = p11.getConversation(p27, p28)
				
				return if conversation == nil then nil else conversation.conversationType
			end
			
			local var48 = t[p27]
			
			if var48 then
				local conversationType = var48.conversationType
				
				if conversationType == nil then
					local var49 = signalsModule.createComputed(var47)
					var48.conversationType = var49
					
					return var49
				else
					return conversationType
				end
			else
				var48 = {}
				t[p27] = var48
			end
		end,
		getUnixTime = function(p29) --[[ line: 189 ]]
			-- upvalues: t (ref), p11 (ref), signalsModule (copy)
			local var51 = function(p30) --[[ line: 190 ]]
				-- upvalues: p11 (copy), p29 (ref)
				local conversation = p11.getConversation(p29, p30)
				
				if conversation == nil then
					return nil
				end
				local lastUpdated = conversation.lastUpdated
				
				return if lastUpdated == nil then nil elseif typeof(lastUpdated) == "DateTime" then lastUpdated.UnixTimestamp elseif type(lastUpdated) == "table" and lastUpdated.GetUnixTimestamp ~= nil then lastUpdated:GetUnixTimestamp() else nil
			end
			
			local var52 = t[p29]
			
			if var52 then
				local unixTime = var52.unixTime
				
				if unixTime == nil then
					local var53 = signalsModule.createComputed(var51)
					var52.unixTime = var53
					
					return var53
				else
					return unixTime
				end
			else
				var52 = {}
				t[p29] = var52
			end
		end,
		getTestId = function(p31) --[[ line: 196 ]]
			-- upvalues: t (ref), p11 (ref), domLocatorsModule (copy), getConversationTitleModule (copy), signalsModule (copy)
			local var55 = function(p32) --[[ line: 197 ]]
				-- upvalues: p11 (copy), p31 (ref), domLocatorsModule (copy), getConversationTitleModule (copy)
				local conversation = p11.getConversation(p31, p32)
				
				return if conversation == nil then nil else domLocatorsModule.chatLandingConversationEntry(conversation.title or (getConversationTitleModule(conversation) or ""))
			end
			
			local var56 = t[p31]
			
			if var56 then
				local testId = var56.testId
				
				if testId == nil then
					local var57 = signalsModule.createComputed(var55)
					var56.testId = var57
					
					return var57
				else
					return testId
				end
			else
				var56 = {}
				t[p31] = var56
			end
		end,
		getLocatorTitle = function(p33) --[[ line: 206 ]]
			-- upvalues: t (ref), p11 (ref), getConversationTitleModule (copy), signalsModule (copy)
			local var59 = function(p34) --[[ line: 207 ]]
				-- upvalues: p11 (copy), p33 (ref), getConversationTitleModule (copy)
				local title
				local conversation = p11.getConversation(p33, p34)
				
				if conversation == nil then
					title = nil
				else
					title = conversation.title
					
					return title or (getConversationTitleModule(conversation) or "")
				end
			end
			
			local var60 = t[p33]
			
			if var60 then
				local locatorTitle = var60.locatorTitle
				
				if locatorTitle == nil then
					local var61 = signalsModule.createComputed(var59)
					var60.locatorTitle = var61
					
					return var61
				else
					return locatorTitle
				end
			else
				var60 = {}
				t[p33] = var60
			end
		end
	}
end