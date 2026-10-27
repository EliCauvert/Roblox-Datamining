local CommonMark = script:FindFirstAncestor("CommonMark")
local CaseFoldingModule = require(CommonMark.internal.data.CaseFolding)
local Html5EntitiesModule = require(CommonMark.internal.util.Html5Entities)
local Utf8Module = require(CommonMark.internal.port.Utf8)
local ByteFunction = string.byte
local FindFunction = string.find
local GsubFunction = string.gsub
local SubFunction = string.sub
local EscapingModule = { ESCAPABLE = "[!\"#$%%&'()*+,./:;<=>?@%[\\%]^_`{|}~%-]" }
local Text = "^\\" .. EscapingModule.ESCAPABLE

local function _(p1, p2, p3: number): number
	-- upvalues: FindFunction (copy)
	local FindResult: number = FindFunction(p1, p2, p3 + 1)
	
	return if FindResult then FindResult - 1 else -1
end

local function matchEntity(p1, p2: number)
	-- upvalues: FindFunction (copy)
	local v1 = p2 + 1
	local _, Xx09AFaF2 = FindFunction(p1, "^#[Xx][0-9A-Fa-f]*;", v1 + 1)
	
	if Xx09AFaF2 ~= nil then
		local Xx09AFaFDelta = Xx09AFaF2 - v1 - 3
		
		return if Xx09AFaFDelta >= 1 and Xx09AFaFDelta <= 6 then Xx09AFaF2 else nil
	end
	local _, _092 = FindFunction(p1, "^#[0-9]*;", v1 + 1)
	
	if _092 ~= nil then
		local v2 = _092 - v1 - 2
		
		return if v2 >= 1 and v2 <= 7 then _092 else nil
	end
	local _, AZaZAZaZ092 = FindFunction(p1, "^[A-Za-z][A-Za-z0-9]*;", v1 + 1)
	
	if AZaZAZaZ092 == nil then
		return nil
	else
		local AZaZAZaZDelta = AZaZAZaZ092 - v1 - 2
		
		return if AZaZAZaZDelta >= 1 and AZaZAZaZDelta <= 31 then AZaZAZaZ092 else nil
	end
end

local function findEntityOrEscapedChar(p1, p2: number)
	-- upvalues: FindFunction (copy), ByteFunction (copy), Text (copy), matchEntity (copy)
	local v1: number = FindFunction(p1, "[\\&]", p2 + 1)
	local v2: number = if v1 then v1 - 1 else -1
	local FindResult = nil
	while v2 ~= -1 do
		if ByteFunction(p1, v2 + 1) == 92 then
			local _, FindResult2 = FindFunction(p1, Text, v2 + 1)
			FindResult = FindResult2
		else
			FindResult = matchEntity(p1, v2)
		end
		if FindResult ~= nil then
			return v2, FindResult
		end
		local v3: number = FindFunction(p1, "[\\&]", v2 + 1 + 1)
		v2 = if v3 then v3 - 1 else -1
	end
	return -1, -1
end

local _ = function(p3: number): number
	return if p3 < 128 then 1 elseif p3 < 2048 then 2 elseif p3 < 65536 then 3 else 4
end

local function findEscapeInUri(p3, p4: number)
	-- upvalues: FindFunction (copy), ByteFunction (copy), Utf8Module (copy)
	local AZaZ09: number = FindFunction(p3, "[^:/?#@!$&'()*+,;=A-Za-z0-9%-._~]", p4 + 1)
	local AZaZDelta: number = if AZaZ09 then AZaZ09 - 1 else -1
	
	if AZaZDelta == -1 then
		return -1, -1
	elseif ByteFunction(p3, AZaZDelta + 1) == 37 then
		local _, _09AFaF09AFaF2 = FindFunction(p3, "^[0-9A-Fa-f]?[0-9A-Fa-f]?", AZaZDelta + 2)
		
		return AZaZDelta, _09AFaF09AFaF2
	else
		local CodePointAtResult: number = Utf8Module.codePointAt(p3, AZaZDelta)
		
		return AZaZDelta, AZaZDelta + (if CodePointAtResult < 128 then 1 elseif CodePointAtResult < 2048 then 2 elseif CodePointAtResult < 65536 then 3 else 4)
	end
end

local list = {
	"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"
}

local function v11(p3)
	-- upvalues: ByteFunction (copy), SubFunction (copy), Html5EntitiesModule (copy)
	return if ByteFunction(p3, 1) == 92 then SubFunction(p3, 2, #p3) else Html5EntitiesModule.entityToString(p3)
end

local function v12(p3)
	-- upvalues: ByteFunction (copy), SubFunction (copy), list (copy)
	if ByteFunction(p3, 1) == 37 then
		return if #p3 == 3 then p3 else "%25" .. SubFunction(p3, 2, #p3)
	end
	local List = {}
	
	for i = 1, #p3 do
		local ByteResult: number = ByteFunction(p3, i)
		List[i] = "%" .. list[ByteResult // 16 + 1] .. list[ByteResult % 16 + 1]
	end
	return table.concat(List)
end

local config = {
	["&"] = "&amp;",
	["<"] = "&lt;",
	[">"] = "&gt;",
	["\""] = "&quot;"
}

function EscapingModule.escapeHtml(p4)
	-- upvalues: FindFunction (copy), GsubFunction (copy), config (copy)
	return if FindFunction(p4, "[&<>\"]") == nil then p4 else GsubFunction(p4, "[&<>\"]", config)
end

local function replaceAll(Callback, p4, Callback1)
	-- upvalues: SubFunction (copy)
	local CallbackResult, CallbackResult2 = Callback(p4, 0)
	
	if CallbackResult == -1 then
		return p4
	end
	local List = {}
	local v4 = 0
	local Count = 0
	repeat
		local v5 = v4 + 1
		List[v5] = SubFunction(p4, Count + 1, CallbackResult)
		v4 = v5 + 1
		List[v4] = Callback1((SubFunction(p4, CallbackResult + 1, CallbackResult2)))
		Count = CallbackResult2
		CallbackResult, CallbackResult2 = Callback(p4, Count)
	until CallbackResult == -1
	if Count ~= #p4 then
		List[v4 + 1] = SubFunction(p4, Count + 1, #p4)
	end
	return table.concat(List)
end

function EscapingModule.unescapeString(p4)
	-- upvalues: FindFunction (copy), replaceAll (copy), findEntityOrEscapedChar (copy), v11 (copy)
	return if FindFunction(p4, "[\\&]") == nil then p4 else replaceAll(findEntityOrEscapedChar, p4, v11)
end

function EscapingModule.percentEncodeUrl(p4)
	-- upvalues: replaceAll (copy), findEscapeInUri (copy), v12 (copy)
	return replaceAll(findEscapeInUri, p4, v12)
end

local function trim(p4)
	-- upvalues: ByteFunction (copy), SubFunction (copy)
	local Count = 0
	local CountP16 = #p4
	while Count < CountP16 and ByteFunction(p4, Count + 1) <= 32 do
		Count += 1
	end
	while Count < CountP16 and ByteFunction(p4, CountP16 - 1 + 1) <= 32 do
		CountP16 -= 1
	end
	return (SubFunction(p4, Count + 1, CountP16))
end

local function caseFold(p5)
	-- upvalues: FindFunction (copy), Utf8Module (copy), CaseFoldingModule (copy), SubFunction (copy)
	local AZ: number = FindFunction(p5, "[A-Z\128-\255]", 1)
	local AZDelta: number = if AZ then AZ - 1 else -1
	
	if AZDelta == -1 then
		return p5
	end
	local List = {}
	local v4 = 0
	local v5 = 0
	while AZDelta ~= -1 do
		local CodePointAtResult: number = Utf8Module.codePointAt(p5, AZDelta)
		local v6: number = if CodePointAtResult < 128 then 1 elseif CodePointAtResult < 2048 then 2 elseif CodePointAtResult < 65536 then 3 else 4
		local CaseFoldingModuleEntry = CaseFoldingModule[CodePointAtResult]
		
		if CaseFoldingModuleEntry ~= nil then
			local v7 = v4 + 1
			List[v7] = SubFunction(p5, v5 + 1, AZDelta)
			v4 = v7 + 1
			List[v4] = CaseFoldingModuleEntry
			v5 = AZDelta + v6
		end
		local AZ1: number = FindFunction(p5, "[A-Z\128-\255]", AZDelta + v6 + 1)
		AZDelta = if AZ1 then AZ1 - 1 else -1
	end
	List[v4 + 1] = SubFunction(p5, v5 + 1, #p5)
	
	return table.concat(List)
end

function EscapingModule.normalizeLabelContent(p6)
	-- upvalues: trim (copy), caseFold (copy), GsubFunction (copy)
	return (GsubFunction(caseFold((trim(p6))), "[ \t\r\n]+", " "))
end

EscapingModule._findEntityOrEscapedChar = findEntityOrEscapedChar
EscapingModule._findEscapeInUri = findEscapeInUri

return EscapingModule