local foundation = script:FindFirstAncestor("Foundation")
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local cursorTypeModule = require(foundation.Enums.CursorType)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(foundation.Components.Types)

return {
	encodeKey = function(p1, p2, p3, p4, p5)
		-- upvalues: colorNamespaceModule (ref)
		p2 = p2 or UDim.new(0, 0)
		p4 = p4 or p1.Stroke.Thicker
		
		return p2.Scale .. " " .. p1.Offset .. " " .. (p3 or p1.Size.Size_150) - p4 .. " " .. p3 .. " " .. (p5 or colorNamespaceModule.Color)
	end,
	decodeKey = function(p1)
		local var1 = if typeof(p1) == "string" then string.split(p1, " ") else p1
		local var2 = tonumber(var1[3])
		
		return UDim.new(tonumber(var1[1]), math.max(0, tonumber(var1[2]) + var2)), var2, tonumber(var1[4]), var1[5]
	end,
	encodeCursorTypeKey = function(p1, p2)
		-- upvalues: colorNamespaceModule (ref)
		return p1 .. " " .. (p2 or colorNamespaceModule.Color)
	end,
	decodeCursorTypeKey = function(p1)
		local var1 = if typeof(p1) == "string" then string.split(p1, " ") else p1
		
		return var1[1], var1[2]
	end,
	migrateCursorType = function(p1)
		-- upvalues: cursorTypeModule (ref)
		local var1 = tostring(p1)
		
		return cursorTypeModule[string.gsub(var1, if var1:find("Kind") then "CursorKind%." else "CursorType%.", "")]
	end,
	mapCursorToKey = function(p1, p2)
		-- upvalues: colorNamespaceModule (ref), cursorTypeModule (ref)
		local _ = nil
		
		if typeof(p1) == "table" then
			local offset = p1.offset
			local radius = p1.radius or UDim.new(0, 0)
			local borderWidth = p1.borderWidth or p2.Stroke.Thicker
			
			return radius.Scale .. " " .. radius.Offset .. " " .. (offset or p2.Size.Size_150) - borderWidth .. " " .. borderWidth .. " " .. colorNamespaceModule.Color
		elseif p1 == nil then
			local uDim = UDim.new(0, 0)
			local thicker = p2.Stroke.Thicker
			
			return uDim.Scale .. " " .. uDim.Offset .. " " .. p11.Size.Size_150 - thicker .. " " .. thicker .. " " .. colorNamespaceModule.Color
		elseif typeof(p1) == "userdata" then
			local var1 = tostring(p1)
			
			return cursorTypeModule[string.gsub(var1, if var1:find("Kind") then "CursorKind%." else "CursorType%.", "")] .. " " .. colorNamespaceModule.Color
		end
		return p1 .. " " .. colorNamespaceModule.Color
	end
}