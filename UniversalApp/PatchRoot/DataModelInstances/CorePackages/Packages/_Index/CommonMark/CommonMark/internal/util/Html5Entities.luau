local HtmlEntitiesModule = require(script:FindFirstAncestor("CommonMark").internal.data.HtmlEntities)
local ByteFunction = string.byte
local FindFunction = string.find
local SubFunction = string.sub

local function parseInt(p1, p2)
	-- upvalues: ByteFunction (copy), SubFunction (copy), FindFunction (copy)
	local ByteResult = ByteFunction(p1, 1)
	local IsByteResultMatch = ByteResult == 45
	local SubResult = if IsByteResultMatch or ByteResult == 43 then SubFunction(p1, 2) else p1
	
	if FindFunction(SubResult, if p2 == 16 then "^[0-9A-Fa-f]+$" else "^[0-9]+$") == nil then
		return nil
	end
	local _0 = FindFunction(SubResult, "[^0]")
	local SubResult1 = if _0 then SubFunction(SubResult, _0) else ""
	
	if #SubResult1 > 10 then
		return nil
	else
		local Number: number = tonumber(SubResult1, p2) or 0
		local Negated = if IsByteResultMatch then -Number else Number
		
		return if Negated < -2147483648 or Negated > 2147483647 then nil else Negated
	end
end

return {
	entityToString = function(p1)
		-- upvalues: ByteFunction (copy), SubFunction (copy), parseInt (copy), HtmlEntitiesModule (copy)
		if ByteFunction(p1, 1) ~= 38 or ByteFunction(p1, #p1) ~= 59 then
			return p1
		end
		local SubResult = SubFunction(p1, 2, #p1 - 1)
		
		if ByteFunction(SubResult, 1) ~= 35 then
			local HtmlEntitiesModuleEntry = HtmlEntitiesModule[SubResult]
			
			return if HtmlEntitiesModuleEntry == nil then p1 else HtmlEntitiesModuleEntry
		end
		SubResult = SubFunction(SubResult, 2)
		local v1 = 10
		local ByteResult = ByteFunction(SubResult, 1)
		
		if ByteResult == 120 or ByteResult == 88 then
			SubResult = SubFunction(SubResult, 2)
			v1 = 16
		end
		local ParseIntResult: number = parseInt(SubResult, v1)
		
		return if ParseIntResult == 0 then "�" elseif ParseIntResult == nil or ParseIntResult < 0 or ParseIntResult > 1114111 or ParseIntResult >= 55296 and ParseIntResult <= 57343 then "�" else utf8.char(ParseIntResult)
	end
}