local _ = require(script:FindFirstAncestor("CommonMark").renderer.html.UrlSanitizer)
local ByteFunction = string.byte
local GsubFunction = string.gsub
local LowerFunction = string.lower
local SubFunction = string.sub
local DefaultUrlSanitizerModule = {}
DefaultUrlSanitizerModule.__index = DefaultUrlSanitizerModule

function DefaultUrlSanitizerModule.new()
	-- upvalues: DefaultUrlSanitizerModule (copy)
	return DefaultUrlSanitizerModule.newCollection({ "http", "https", "mailto", "data" })
end

function DefaultUrlSanitizerModule.newCollection(List)
	-- upvalues: DefaultUrlSanitizerModule (copy)
	local _protocols = {}
	
	for _, value in ipairs(List) do
		_protocols[value] = true
	end
	return (setmetatable({ _protocols = _protocols }, DefaultUrlSanitizerModule))
end

function DefaultUrlSanitizerModule:sanitizeLinkUrl(p1)
	-- upvalues: ByteFunction (copy), GsubFunction (copy), LowerFunction (copy), SubFunction (copy)
	local StripHtmlSpacesResult = self:stripHtmlSpaces(p1)
	
	for i = 0, #StripHtmlSpacesResult - 1 do
		local ByteResult = ByteFunction(StripHtmlSpacesResult, i + 1)
		
		if ByteResult == 47 or ByteResult == 35 then break end
		if ByteResult == 63 then
			return StripHtmlSpacesResult
		end
		if ByteResult ~= 58 then
			continue
		elseif self._protocols[GsubFunction(LowerFunction((SubFunction(StripHtmlSpacesResult, 1, i))), "K", "k")] then
			break
		else
			return ""
		end
	end
	return StripHtmlSpacesResult
end

function DefaultUrlSanitizerModule:sanitizeImageUrl(p2)
	return self:sanitizeLinkUrl(p2)
end

function DefaultUrlSanitizerModule.stripHtmlSpaces(p2, p3)
	-- upvalues: ByteFunction (copy), SubFunction (copy)
	local Count = 0
	local CountP6 = #p3
	while Count < CountP6 and p2:isHtmlSpace(ByteFunction(p3, CountP6 - 1 + 1)) do
		CountP6 -= 1
	end
	while Count < CountP6 and p2:isHtmlSpace(ByteFunction(p3, Count + 1)) do
		Count += 1
	end
	return if Count == 0 and CountP6 == #p3 then p3 else SubFunction(p3, Count + 1, CountP6)
end

function DefaultUrlSanitizerModule:isHtmlSpace(p4): boolean
	return p4 == 32 or (p4 == 9 or (p4 == 10 or (p4 == 12 or p4 == 13)))
end

return DefaultUrlSanitizerModule