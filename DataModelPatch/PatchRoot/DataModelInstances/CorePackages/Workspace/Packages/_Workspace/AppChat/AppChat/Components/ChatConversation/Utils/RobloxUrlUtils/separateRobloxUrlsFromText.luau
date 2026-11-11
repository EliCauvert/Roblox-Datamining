local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AddMessageModule = require(script.Parent.Parent.Parent.Utils.addMessage)
local ConstantsModule = require(script.Parent.Constants)
local FFlagAppChatFullPlaintextBeforeGameCardsModule = require(AppChat.Flags.FFlagAppChatFullPlaintextBeforeGameCards)
local UrlMatchingModule = require(Parent.UrlMatching)
local Text = require(Parent.AppCommonLib).Text
local Regex = UrlMatchingModule.Regex
local ZeroOrOneOfResult = Regex.zeroOrOneOf(Regex.SLASH .. ConstantsModule.LOCALE_LANGUAGE_PATTERN .. Regex.zeroOrOneOf(Regex.DASH .. ConstantsModule.LOCALE_COUNTRY_PATTERN))
local NewResult = UrlMatchingModule.UrlProcessor.new({
	protocolStrict = false,
	subdomainStrict = false,
	trimPunctuation = true,
	domainsPatterns = require(Parent.Cryo).List.map(ConstantsModule.ROBLOX_DOMAIN_PATTERNS, function(Text): string
		-- upvalues: ZeroOrOneOfResult (copy)
		return Text .. ZeroOrOneOfResult
	end),
	subdomainPatterns = { UrlMatchingModule.Constants.ANY_DOMAIN_NAME }
}, (require(script.Parent.RobloxUrlMap)))

return function(Text1: string)
	-- upvalues: NewResult (copy), FFlagAppChatFullPlaintextBeforeGameCardsModule (copy), AddMessageModule (copy), Text (copy)
	local List = {}
	local ProcessResult = NewResult:process(Text1)
	
	if FFlagAppChatFullPlaintextBeforeGameCardsModule then
		List = AddMessageModule(List, Text1)
		
		for _, value in ProcessResult do
			table.insert(List, value.result)
		end
		return List
	else
		if ProcessResult == nil or #ProcessResult == 0 then
			return AddMessageModule(List, Text1)
		end
		local NewEndIndex = 1
		
		for _, value1 in ProcessResult do
			List = AddMessageModule(List, Text.Trim(Text1:sub(NewEndIndex, value1.startIndex - 1)))
			table.insert(List, value1.result)
			NewEndIndex = value1.endIndex + 1
		end
		return AddMessageModule(List, Text.Trim(Text1:sub(NewEndIndex)))
	end
end