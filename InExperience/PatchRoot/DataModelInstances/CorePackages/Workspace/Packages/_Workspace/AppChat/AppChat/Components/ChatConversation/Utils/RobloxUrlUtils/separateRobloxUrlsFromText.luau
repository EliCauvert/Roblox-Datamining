local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AddMessageModule = require(script.Parent.Parent.Parent.Utils.addMessage)
local ConstantsModule = require(script.Parent.Constants)
local FFlagAppChatFullPlaintextBeforeGameCardsModule = require(AppChat.Flags.FFlagAppChatFullPlaintextBeforeGameCards)
local FFlagAppChatShareLinkV2FallbacksModule = require(AppChat.Flags.FFlagAppChatShareLinkV2Fallbacks)
local UrlMatchingModule = require(Parent.UrlMatching)
local CryoModule = require(Parent.Cryo)
local Text = require(Parent.AppCommonLib).Text
local Regex = UrlMatchingModule.Regex
local ZeroOrOneOfResult = Regex.zeroOrOneOf(Regex.SLASH .. ConstantsModule.LOCALE_LANGUAGE_PATTERN .. Regex.zeroOrOneOf(Regex.DASH .. ConstantsModule.LOCALE_COUNTRY_PATTERN))
local NewResult = UrlMatchingModule.UrlProcessor.new({
	protocolStrict = false,
	subdomainStrict = false,
	trimPunctuation = true,
	domainsPatterns = CryoModule.List.map(ConstantsModule.ROBLOX_DOMAIN_PATTERNS, function(Text): string --[[ Line: 22 ]]
		-- upvalues: ZeroOrOneOfResult (copy)
		return Text .. ZeroOrOneOfResult
	end),
	subdomainPatterns = { UrlMatchingModule.Constants.ANY_DOMAIN_NAME }
}, (require(script.Parent.RobloxUrlMap)))

local function _(p1, Text) --[[ Line: 36 | Named "prepareMatchesForMessages" ]]
	-- upvalues: CryoModule (copy)
	return CryoModule.List.filterMap(p1, function(p2) --[[ Line: 40 ]]
		-- upvalues: CryoModule (upval), Text (copy)
		local Result = p2.result
		
		return if Result == nil then nil elseif Result.shareLink and Result.shareLink.version == 2 then CryoModule.Dictionary.join(p2, {
			result = CryoModule.Dictionary.join(Result, {
				shareLink = CryoModule.Dictionary.join(Result.shareLink, { url = Text:sub(p2.startIndex, p2.endIndex) })
			})
		}) else p2
	end)
end

return function(Text1: string) --[[ Line: 58 ]]
	-- upvalues: NewResult (copy), FFlagAppChatShareLinkV2FallbacksModule (copy), CryoModule (copy), FFlagAppChatFullPlaintextBeforeGameCardsModule (copy), AddMessageModule (copy), Text (copy)
	local List = {}
	local ProcessResult = NewResult:process(Text1)
	
	if FFlagAppChatShareLinkV2FallbacksModule then
		ProcessResult = CryoModule.List.filterMap(ProcessResult, function(p1) --[[ Line: 40 ]]
			-- upvalues: CryoModule (upval), Text1 (copy)
			local Result = p1.result
			
			return if Result == nil then nil elseif Result.shareLink and Result.shareLink.version == 2 then CryoModule.Dictionary.join(p1, {
				result = CryoModule.Dictionary.join(Result, {
					shareLink = CryoModule.Dictionary.join(Result.shareLink, { url = Text1:sub(p1.startIndex, p1.endIndex) })
				})
			}) else p1
		end)
	end
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