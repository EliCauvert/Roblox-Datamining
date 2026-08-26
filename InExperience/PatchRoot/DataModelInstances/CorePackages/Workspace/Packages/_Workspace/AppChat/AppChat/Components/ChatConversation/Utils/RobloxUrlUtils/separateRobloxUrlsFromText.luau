local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local addMessageModule = require(script.Parent.Parent.Parent.Utils.addMessage)
local robloxUrlMapModule = require(script.Parent.RobloxUrlMap)
local constantsModule = require(script.Parent.Constants)
local fFlagAppChatFullPlaintextBeforeGameCardsModule = require(appChat.Flags.FFlagAppChatFullPlaintextBeforeGameCards)
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
		return p1 .. var7
	end),
	subdomainPatterns = { constants.ANY_DOMAIN_NAME }
}, robloxUrlMapModule)

return function(p1)
	-- upvalues: var2 (ref), fFlagAppChatFullPlaintextBeforeGameCardsModule (ref), addMessageModule (ref), text (ref)
	local t = {}
	local var3 = var2:process(p1)
	
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