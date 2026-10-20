local Foundation = script:FindFirstAncestor("Foundation")
local ColorNamespaceModule = require(Foundation.Enums.ColorNamespace)
local CursorTypeModule = require(Foundation.Enums.CursorType)
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(Foundation.Components.Types)

return {
	encodeKey = function(p1, p2, p3, p4, p5): string
		-- upvalues: ColorNamespaceModule (copy)
		local P1 = p2 or UDim.new(0, 0)
		local Thicker = p1.Stroke.Thicker
		local P3 = p4 or Thicker
		
		return P1.Scale .. " " .. P1.Offset .. " " .. (p3 or p1.Size.Size_150) - P3 .. " " .. P3 .. " " .. (p5 or ColorNamespaceModule.Color)
	end,
	decodeKey = function(Text: string)
		local Parts = if typeof(Text) == "string" then string.split(Text, " ") else Text
		local Number: number? = tonumber(Parts[3])
		
		return UDim.new(tonumber(Parts[1]), (math.max(0, tonumber(Parts[2]) + Number))), Number, tonumber(Parts[4]), Parts[5]
	end,
	encodeCursorTypeKey = function(Text, p1): string
		-- upvalues: ColorNamespaceModule (copy)
		return Text .. " " .. (p1 or ColorNamespaceModule.Color)
	end,
	decodeCursorTypeKey = function(Text: string)
		local Parts = if typeof(Text) == "string" then string.split(Text, " ") else Text
		
		return Parts[1], Parts[2]
	end,
	migrateCursorType = function(p1)
		-- upvalues: CursorTypeModule (copy)
		local Text = tostring(p1)
		
		return CursorTypeModule[string.gsub(Text, if Text:find("Kind") then "CursorKind%." else "CursorType%.", "")]
	end,
	mapCursorToKey = function(Text, p1): string
		-- upvalues: ColorNamespaceModule (copy), CursorTypeModule (copy)
		if typeof(Text) == "table" then
			local Radius = Text.radius or UDim.new(0, 0)
			local Thicker = p1.Stroke.Thicker
			local BorderWidth = Text.borderWidth or Thicker
			
			return Radius.Scale .. " " .. Radius.Offset .. " " .. (Text.offset or p1.Size.Size_150) - BorderWidth .. " " .. BorderWidth .. " " .. ColorNamespaceModule.Color
		elseif Text == nil then
			local _UDim = UDim.new(0, 0)
			local Thicker = p1.Stroke.Thicker
			
			return _UDim.Scale .. " " .. _UDim.Offset .. " " .. p1.Size.Size_150 - Thicker .. " " .. Thicker .. " " .. ColorNamespaceModule.Color
		elseif typeof(Text) == "userdata" then
			local Text1 = tostring(Text)
			
			return CursorTypeModule[string.gsub(Text1, if Text1:find("Kind") then "CursorKind%." else "CursorType%.", "")] .. " " .. ColorNamespaceModule.Color
		else
			return Text .. " " .. ColorNamespaceModule.Color
		end
	end
}