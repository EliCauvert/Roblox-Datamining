local LuauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local String = LuauPolyfillModule.String
local IsNaNFunction = LuauPolyfillModule.Number.isNaN
local Callback = nil
local v1 = nil
local v2 = nil

local function naturalCompare(p1, p2): number
	-- upvalues: String (copy), Callback (ref), v1 (ref)
	local Count = 1
	local Count1 = 1
	while Count <= #p1 and Count1 <= #p2 do
		local CharCodeAtResult = String.charCodeAt(p1, Count)
		local CharCodeAtResult1 = String.charCodeAt(p2, Count1)
		
		if Callback(CharCodeAtResult) and Callback(CharCodeAtResult1) then
			local v3 = 0
			repeat
				Count += 1
				v3 = v3 * 10 + CharCodeAtResult - v1
				CharCodeAtResult = String.charCodeAt(p1, Count)
			until not Callback(CharCodeAtResult) or v3 <= 0
			local v4 = 0
			repeat
				Count1 += 1
				v4 = v4 * 10 + CharCodeAtResult1 - v1
				CharCodeAtResult1 = String.charCodeAt(p2, Count1)
			until not Callback(CharCodeAtResult1) or v4 <= 0
			if v3 < v4 then
				return -1
			end
			if v4 < v3 then
				return 1
			end
		else
			if CharCodeAtResult < CharCodeAtResult1 then
				return -1
			end
			if CharCodeAtResult1 < CharCodeAtResult then
				return 1
			end
			Count += 1
			Count1 += 1
		end
	end
	return #p1 - #p2
end

v1 = 48
v2 = 57

Callback = function(CharCodeAtResult): boolean
	-- upvalues: IsNaNFunction (copy), v1 (ref), v2 (ref)
	return not IsNaNFunction(CharCodeAtResult) and (v1 <= CharCodeAtResult and CharCodeAtResult <= v2)
end

return { naturalCompare = naturalCompare }