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
local var7 = regex.zeroOrOneOf(regex.SLASH .. constantsModule.LOCALE_LANGUAGE_PATTERN .. regex.zeroOrOneOf(regex.DASH .. constantsModule.LOCALE_COUNTRY_PATTERN))
local var8 = urlProcessor.new({
	protocolStrict = false,
	subdomainStrict = false,
	trimPunctuation = true,
	domainsPatterns = cryoModule.List.map(constantsModule.ROBLOX_DOMAIN_PATTERNS, function(p0) --[[ line: 21 ]]
		-- upvalues: var7 (ref)
		return p0 .. var7
	end),
	subdomainPatterns = { constants.ANY_DOMAIN_NAME }
}, robloxUrlMapModule)

return function(p1) --[[ line: 32 ]]
	-- upvalues: var8 (ref), fFlagAppChatFullPlaintextBeforeGameCardsModule (ref), addMessageModule (ref), text (ref)
	local t = {}
	local var10 = var8:process(p1)
	
	if fFlagAppChatFullPlaintextBeforeGameCardsModule then
		t = addMessageModule(t, p1)
		
		for i, v in var10 do
			table.insert(t, v.result)
		end
		return t
	elseif var10 == nil or #var10 == 0 then
		return addMessageModule(t, p1)
	end
	local var11 = 1
	
	for i, v in var10 do
		t = addMessageModule(t, text.Trim(p1:sub(var11, v.startIndex - 1)))
		table.insert(t, v.result)
		var11 = v.endIndex + 1
	end
	return addMessageModule(t, text.Trim(p1:sub(var11)))
end