local foundation = script:FindFirstAncestor("Foundation")
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local cursorTypeModule = require(foundation.Enums.CursorType)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(foundation.Components.Types)

return {
	encodeKey = function(p0, p1, p2, p3, p4)
		-- upvalues: colorNamespaceModule (ref)
		p1 = p1 or UDim.new(0, 0)
		p3 = p3 or p0.Stroke.Thicker
		
		return p1.Scale .. " " .. p1.Offset .. " " .. (p2 or p0.Size.Size_150) - p3 .. " " .. p3 .. " " .. (p4 or colorNamespaceModule.Color)
	end,
	decodeKey = function(p5)
		local var5 = if typeof(p5) == "string" then string.split(p5, " ") else p5
		local var6 = tonumber(var5[3])
		
		return UDim.new(tonumber(var5[1]), math.max(0, tonumber(var5[2]) + var6)), var6, tonumber(var5[4]), var5[5]
	end,
	encodeCursorTypeKey = function(p6, p7)
		-- upvalues: colorNamespaceModule (ref)
		return p6 .. " " .. (p7 or colorNamespaceModule.Color)
	end,
	decodeCursorTypeKey = function(p8)
		local var7 = if typeof(p8) == "string" then string.split(p8, " ") else p8
		
		return var7[1], var7[2]
	end,
	migrateCursorType = function(p9)
		-- upvalues: cursorTypeModule (ref)
		local var8 = tostring(p9)
		
		return cursorTypeModule[string.gsub(var8, if var8:find("Kind") then "CursorKind%." else "CursorType%.", "")]
	end,
	mapCursorToKey = function(p10, p11)
		-- upvalues: colorNamespaceModule (ref), cursorTypeModule (ref)
		local _ = nil
		
		if typeof(p10) == "table" then
			local offset = p10.offset
			local radius = p10.radius or UDim.new(0, 0)
			local borderWidth = p10.borderWidth or p11.Stroke.Thicker
			
			return radius.Scale .. " " .. radius.Offset .. " " .. (offset or p11.Size.Size_150) - borderWidth .. " " .. borderWidth .. " " .. colorNamespaceModule.Color
		elseif p10 == nil then
			local uDim = UDim.new(0, 0)
			local thicker = p11.Stroke.Thicker
			
			return uDim.Scale .. " " .. uDim.Offset .. " " .. p11.Size.Size_150 - thicker .. " " .. thicker .. " " .. colorNamespaceModule.Color
		elseif typeof(p10) == "userdata" then
			local var12 = tostring(p10)
			
			return cursorTypeModule[string.gsub(var12, if var12:find("Kind") then "CursorKind%." else "CursorType%.", "")] .. " " .. colorNamespaceModule.Color
		end
		return p10 .. " " .. colorNamespaceModule.Color
	end
}