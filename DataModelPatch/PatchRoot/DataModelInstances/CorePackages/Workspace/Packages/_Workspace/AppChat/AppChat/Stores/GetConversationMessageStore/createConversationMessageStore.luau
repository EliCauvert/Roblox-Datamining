local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local CreateProxyFunction = require(Parent.SignalsExperimental).createProxy
local FFlagExpChatEnableFriendsTab = require(Parent.SharedFlags).FFlagExpChatEnableFriendsTab
local _ = require(AppChat.MessageData.Types)
local EscapeRichFormattingFunction = require(Parent.InlineRichText).escapeRichFormatting

local function _(p1)
	-- upvalues: FFlagExpChatEnableFriendsTab (copy), CryoModule (copy), EscapeRichFormattingFunction (copy)
	if FFlagExpChatEnableFriendsTab then
		local Content = p1.content
		
		return if Content == nil then p1 else CryoModule.Dictionary.join(p1, { richContent = EscapeRichFormattingFunction(Content) })
	else
		return p1
	end
end

return function()
	-- upvalues: CreateProxyFunction (copy), FFlagExpChatEnableFriendsTab (copy), CryoModule (copy), EscapeRichFormattingFunction (copy)
	local Proxy = CreateProxyFunction({})
	
	return {
		messages = Proxy,
		getMessage = function(p1, p2)
			-- upvalues: Proxy (copy)
			return Proxy(p2)[p1]
		end,
		upsertMessages = function(List)
			-- upvalues: Proxy (copy), FFlagExpChatEnableFriendsTab (upval), CryoModule (upval), EscapeRichFormattingFunction (upval)
			for i, value in List do
				local JoinResult = nil
				if FFlagExpChatEnableFriendsTab then
					if FFlagExpChatEnableFriendsTab then
						local Content = value.content
						JoinResult = if Content == nil then value else CryoModule.Dictionary.join(value, { richContent = EscapeRichFormattingFunction(Content) })
					else
						JoinResult = value
					end
				else
					JoinResult = value
				end
				Proxy[i] = JoinResult
			end
		end,
		updateMessage = function(Key, p1)
			-- upvalues: Proxy (copy), CryoModule (upval), FFlagExpChatEnableFriendsTab (upval), EscapeRichFormattingFunction (upval)
			local ProxyEntry = Proxy[Key]
			
			if ProxyEntry ~= nil then
				local JoinResult = CryoModule.Dictionary.join(ProxyEntry, p1)
				local JoinResult1 = nil
				
				if FFlagExpChatEnableFriendsTab then
					if FFlagExpChatEnableFriendsTab then
						local Content = JoinResult.content
						JoinResult1 = if Content == nil then JoinResult else CryoModule.Dictionary.join(JoinResult, { richContent = EscapeRichFormattingFunction(Content) })
					else
						JoinResult1 = JoinResult
					end
				else
					JoinResult1 = JoinResult
				end
				Proxy[Key] = JoinResult1
			end
		end,
		removeMessage = function(Key)
			-- upvalues: Proxy (copy)
			Proxy[Key] = nil
		end,
		clear = function()
			-- upvalues: Proxy (copy)
			for i in Proxy do
				Proxy[i] = nil
			end
		end
	}
end