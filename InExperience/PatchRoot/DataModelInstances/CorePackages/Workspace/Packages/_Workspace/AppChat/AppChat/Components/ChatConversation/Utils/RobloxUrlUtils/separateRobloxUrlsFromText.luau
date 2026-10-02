local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local addMessageModule = require(script.Parent.Parent.Parent.Utils.addMessage)
local robloxUrlMapModule = require(script.Parent.RobloxUrlMap)
local constantsModule = require(script.Parent.Constants)
local fFlagAppChatFullPlaintextBeforeGameCardsModule = require(appChat.Flags.FFlagAppChatFullPlaintextBeforeGameCards)
local fFlagAppChatShareLinkV2FallbacksModule = require(appChat.Flags.FFlagAppChatShareLinkV2Fallbacks)
local urlMatchingModule = require(parent.UrlMatching)
local cryoModule = require(parent.Cryo)
local text = require(parent.AppCommonLib).Text
local urlProcessor = urlMatchingModule.UrlProcessor
local constants = urlMatchingModule.Constants
local regex = urlMatchingModule.Regex
local var1 = regex.zeroOrOneOf(regex.SLASH .. constantsModule.LOCALE_LANGUAGE_PATTERN .. regex.zeroOrOneOf(regex.DASH .. constantsModule.LOCALE_COUNTRY_PATTERN))
local var2 = urlProcessor.new({
	protocolStrict = false,
	subdomainStrict = false,
	trimPunctuation = true,
	domainsPatterns = cryoModule.List.map(constantsModule.ROBLOX_DOMAIN_PATTERNS, function(p1)
		-- upvalues: var1 (ref)
		return p1 .. var8
	end),
	subdomainPatterns = { constants.ANY_DOMAIN_NAME }
}, robloxUrlMapModule)

local function _(p1, p2)
	-- upvalues: cryoModule (ref)
	return cryoModule.List.filterMap(p1, function(p3)
		-- upvalues: cryoModule (copy), p2 (ref)
		local result = p3.result
		
		return if result == nil then nil elseif result.shareLink and result.shareLink.version == 2 then cryoModule.Dictionary.join(p3, {
			result = cryoModule.Dictionary.join(result, {
				shareLink = cryoModule.Dictionary.join(result.shareLink, { url = p2:sub(p3.startIndex, p3.endIndex) })
			})
		}) else p3
	end)
end

return function(p1)
	-- upvalues: var2 (ref), fFlagAppChatShareLinkV2FallbacksModule (ref), cryoModule (ref), fFlagAppChatFullPlaintextBeforeGameCardsModule (ref), addMessageModule (ref), text (ref)
	local t = {}
	local var3 = var2:process(p1)
	
	if fFlagAppChatShareLinkV2FallbacksModule then
		var3 = cryoModule.List.filterMap(var3, function(p2)
			-- upvalues: cryoModule (copy), p1 (ref)
			local result = p2.result
			
			return if result == nil then nil elseif result.shareLink and result.shareLink.version == 2 then cryoModule.Dictionary.join(p2, {
				result = cryoModule.Dictionary.join(result, {
					shareLink = cryoModule.Dictionary.join(result.shareLink, { url = p1:sub(p2.startIndex, p2.endIndex) })
				})
			}) else p2
		end)
	end
	if fFlagAppChatFullPlaintextBeforeGameCardsModule then
		t = addMessageModule(t, p1)
		
		for i, v in var3 do
			table.insert(t, v.result)
		end
		return t
	elseif var3 == nil or #var3 == 0 then
		return addMessageModule(t, p1)
	end
	local var4 = 1
	
	for i, v in var3 do
		t = addMessageModule(t, text.Trim(p1:sub(var4, v.startIndex - 1)))
		table.insert(t, v.result)
		var4 = v.endIndex + 1
	end
	return addMessageModule(t, text.Trim(p1:sub(var4)))
end