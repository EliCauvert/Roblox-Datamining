local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local createProxy = require(parent.SignalsExperimental).createProxy
local inlineRichTextModule = require(parent.InlineRichText)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local _ = require(appChat.MessageData.Types)
local escapeRichFormatting = inlineRichTextModule.escapeRichFormatting

local function _(p0) --[[ line: 31 | named "withRichContent" ]]
	-- upvalues: fFlagExpChatEnableFriendsTab (ref), cryoModule (ref), escapeRichFormatting (ref)
	if not fFlagExpChatEnableFriendsTab then
		return p0
	end
	local content = p0.content
	
	return if content == nil then p0 else cryoModule.Dictionary.join(p0, { richContent = escapeRichFormatting(content) })
end

return function() --[[ line: 51 | named "createConversationMessageStore" ]]
	-- upvalues: createProxy (ref), fFlagExpChatEnableFriendsTab (ref), cryoModule (ref), escapeRichFormatting (ref)
	local var3 = createProxy({})
	
	return {
		messages = var3,
		getMessage = function(p1, p2) --[[ line: 55 ]]
			-- upvalues: var3 (ref)
			return var3(p2)[p1]
		end,
		upsertMessages = function(p3) --[[ line: 59 ]]
			-- upvalues: var3 (ref), fFlagExpChatEnableFriendsTab (copy), cryoModule (copy), escapeRichFormatting (copy)
			for i, v in p3 do
				local var5
				local var4 = var3
				
				if not fFlagExpChatEnableFriendsTab then
					var5 = v
				elseif fFlagExpChatEnableFriendsTab then
					local content = v.content
					var5 = if content == nil then v else cryoModule.Dictionary.join(v, { richContent = escapeRichFormatting(content) })
				else
					var5 = v
				end
				var4[i] = var5
			end
		end,
		updateMessage = function(p4, p5) --[[ line: 65 ]]
			-- upvalues: var3 (ref), cryoModule (copy), fFlagExpChatEnableFriendsTab (copy), escapeRichFormatting (copy)
			local var6 = var3[p4]
			
			if var6 ~= nil then
				local var9
				local var7 = cryoModule.Dictionary.join(var6, p5)
				local var8 = var3
				
				if not fFlagExpChatEnableFriendsTab then
					var9 = var7
				elseif fFlagExpChatEnableFriendsTab then
					local content = var7.content
					var9 = if content == nil then var7 else cryoModule.Dictionary.join(var7, { richContent = escapeRichFormatting(content) })
				else
					var9 = var7
				end
				var8[p4] = var9
			end
		end,
		removeMessage = function(p6) --[[ line: 73 ]]
			-- upvalues: var3 (ref)
			var3[p6] = nil
		end,
		clear = function() --[[ line: 77 ]]
			-- upvalues: var3 (ref)
			for i in var3 do
				var3[i] = nil
			end
		end
	}
end