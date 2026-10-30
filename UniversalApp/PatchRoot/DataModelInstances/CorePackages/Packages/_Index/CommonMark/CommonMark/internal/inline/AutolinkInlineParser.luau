local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.text.CharMatcher)
local _ = require(CommonMark.parser.beta.InlineContentParser)
local _ = require(CommonMark.parser.beta.InlineContentParserFactory)
local _ = require(CommonMark.parser.beta.InlineParserState)
local NodesModule = require(CommonMark.node.Nodes)
local ParsedInlineModule = require(CommonMark.parser.beta.ParsedInline)
local _ = string.byte
local FindFunction = string.find
local SubFunction = string.sub
local AutolinkInlineParserModule = {}
AutolinkInlineParserModule.__index = AutolinkInlineParserModule
local BuildResult = require(CommonMark.text.AsciiMatcher).builder():c(60):c(62):build()

local function isUri(p1): boolean
	-- upvalues: FindFunction (copy)
	local _, AZaZAZaZ092 = FindFunction(p1, "^[A-Za-z][A-Za-z0-9.+%-]*:")
	
	if AZaZAZaZ092 == nil then
		return false
	else
		local AZaZAZaZDelta = AZaZAZaZ092 - 1
		
		return AZaZAZaZDelta >= 2 and AZaZAZaZDelta <= 32 and FindFunction(p1, "[%z\1- <>]", AZaZAZaZ092 + 1) == nil
	end
end

local function _(p1): boolean
	-- upvalues: FindFunction (copy)
	return #p1 <= 63 and (FindFunction(p1, "^[A-Za-z0-9]$") ~= nil or FindFunction(p1, "^[A-Za-z0-9][A-Za-z0-9%-]*[A-Za-z0-9]$") ~= nil)
end

local function isEmail(Content): boolean
	-- upvalues: FindFunction (copy), SubFunction (copy)
	local _, v1 = FindFunction(Content, "^[A-Za-z0-9.!#$%%&'*+/=?^_`{|}~%-]+@")
	
	if v1 == nil then
		return false
	end
	local v2 = v1 + 1
	while true do
		local v3: number = FindFunction(Content, ".", v2, true)
		local SubResult = SubFunction(Content, v2, if v3 == nil then #Content else v3 - 1)
		if #SubResult > 63 or FindFunction(SubResult, "^[A-Za-z0-9]$") == nil and FindFunction(SubResult, "^[A-Za-z0-9][A-Za-z0-9%-]*[A-Za-z0-9]$") == nil then
			return false
		elseif v3 ~= nil then
			v2 = v3 + 1
		else
			return true
		end
	end
end

function AutolinkInlineParserModule.new()
	-- upvalues: AutolinkInlineParserModule (copy)
	return (setmetatable({}, AutolinkInlineParserModule))
end

function AutolinkInlineParserModule:tryParse(p1)
	-- upvalues: BuildResult (copy), ParsedInlineModule (copy), FindFunction (copy), isEmail (copy), NodesModule (copy)
	local ScannerResult = p1:scanner()
	ScannerResult:next()
	local PositionResult = ScannerResult:position()
	
	if ScannerResult:findMatcher(BuildResult) > 0 then
		if ScannerResult:peek() ~= 62 then
			return ParsedInlineModule.none()
		end
		local Source = ScannerResult:getSource(PositionResult, ScannerResult:position())
		local Content = Source:getContent()
		ScannerResult:next()
		local v4: string? = nil
		local _, AZaZAZaZ092 = FindFunction(Content, "^[A-Za-z][A-Za-z0-9.+%-]*:")
		local NoZ = nil
		
		if AZaZAZaZ092 == nil then
			NoZ = false
		else
			local AZaZAZaZDelta = AZaZAZaZ092 - 1
			NoZ = AZaZAZaZDelta >= 2 and AZaZAZaZDelta <= 32 and FindFunction(Content, "[%z\1- <>]", AZaZAZaZ092 + 1) == nil
		end
		if NoZ then
			v4 = Content
		elseif isEmail(Content) then
			v4 = "mailto:" .. Content
		end
		if v4 ~= nil then
			local LinkResult = NodesModule.Link(v4, nil)
			local TextResult = NodesModule.Text(Content)
			TextResult:setSourceSpans(Source:getSourceSpans())
			LinkResult:appendChild(TextResult)
			
			return ParsedInlineModule.of(LinkResult, ScannerResult:position())
		end
	end
	return ParsedInlineModule.none()
end

local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy)
	return (setmetatable({}, Module))
end

function Module:getTriggerCharacters()
	return { [60] = true }
end

function Module:create()
	-- upvalues: AutolinkInlineParserModule (copy)
	return AutolinkInlineParserModule.new()
end

AutolinkInlineParserModule.Factory = Module
AutolinkInlineParserModule._isUri = isUri
AutolinkInlineParserModule._isEmail = isEmail

return AutolinkInlineParserModule