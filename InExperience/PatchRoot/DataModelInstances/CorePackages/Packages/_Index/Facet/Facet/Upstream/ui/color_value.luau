local function byte(p1: number): number
	return (math.clamp(math.floor(p1 * 255 + 0.5), 0, 255))
end

return function(p1)
	-- upvalues: byte (copy)
	local config = {
		byte = byte,
		channels = function(p2)
			return math.clamp(math.floor(p2.R * 255 + 0.5), 0, 255), math.clamp(math.floor(p2.G * 255 + 0.5), 0, 255), (math.clamp(math.floor(p2.B * 255 + 0.5), 0, 255))
		end
	}
	
	function config.hex(Color, p2: number): string
		-- upvalues: config (copy)
		local ChannelsResult, ChannelsResult2, ChannelsResult3 = config.channels(Color)
		local Formatted = string.format("#%02X%02X%02X", ChannelsResult, ChannelsResult2, ChannelsResult3)
		
		return if p2 == nil then Formatted else Formatted .. string.format("%02X", (math.clamp(math.floor(p2 * 255 + 0.5), 0, 255)))
	end
	
	function config.same(p2, p3): boolean
		-- upvalues: config (copy)
		if p2 == nil or p3 == nil then
			return p2 == p3
		else
			local ChannelsResult, ChannelsResult2, ChannelsResult3 = config.channels(p2)
			local ChannelsResult1, ChannelsResult2_1, ChannelsResult3_1 = config.channels(p3)
			
			return ChannelsResult == ChannelsResult1 and ChannelsResult2 == ChannelsResult2_1 and ChannelsResult3 == ChannelsResult3_1
		end
	end
	
	function config.fromBytes(p2, p3, p4)
		-- upvalues: p1 (copy)
		return p1.Color3.fromRGB(p2, p3, p4)
	end
	
	function config.parseHex(Text: string, p2)
		-- upvalues: config (copy)
		local Segment = if string.sub(Text, 1, 1) == "#" then string.sub(Text, 2) else Text
		
		if string.match(Segment, "^%x+$") == nil then
			return nil, nil, if p2 then "Use hex digits: #RGB, #RRGGBB or #RRGGBBAA." else "Use hex digits: #RGB or #RRGGBB."
		end
		if #Segment == 3 then
			Segment = string.gsub(Segment, "%x", "%0%0")
		end
		if #Segment == 8 and not p2 then
			return nil, nil, "This colour has no opacity: use #RRGGBB."
		elseif #Segment == 6 or #Segment == 8 then
			return config.fromBytes(assert((tonumber(string.sub(Segment, 1, 2), 16))), assert((tonumber(string.sub(Segment, 3, 4), 16))), (function(StartIndex: number)
				-- upvalues: Segment (ref)
				return assert((tonumber(string.sub(Segment, StartIndex, StartIndex + 1), 16)))
			end)(5)), if #Segment == 8 then assert((tonumber(string.sub(Segment, 7, 8), 16))) / 255 else nil, nil
		else
			return nil, nil, if p2 then "Use #RGB, #RRGGBB or #RRGGBBAA." else "Use #RGB or #RRGGBB."
		end
	end
	
	function config.hsvOf(p2, p3)
		local HSV, HSV2, HSV3 = p2:ToHSV()
		
		if p3 ~= nil then
			if HSV3 == 0 then
				HSV = p3.h
				HSV2 = p3.s
			elseif HSV2 == 0 then
				HSV = p3.h
			end
		end
		return { h = HSV, s = HSV2, v = HSV3 }
	end
	
	function config.toColor(p2)
		-- upvalues: p1 (copy)
		return p1.Color3.fromHSV(math.clamp(p2.h, 0, 1), math.clamp(p2.s, 0, 1), (math.clamp(p2.v, 0, 1)))
	end
	
	function config.standard(p2)
		-- upvalues: config (copy)
		local Largest = math.max(2, p2 or 8)
		local List = {}
		
		for _, value in {
			{ 0.35, 1 },
			{ 0.65, 1 },
			{ 1, 1 },
			{ 1, 0.8 },
			{ 1, 0.55 }
		} do
			for i = 0, Largest - 1 do
				local Color = config.toColor({ h = i / Largest, s = value[1], v = value[2] })
				table.insert(List, { color = Color, key = config.hex(Color) })
			end
		end
		for i1 = 0, Largest - 1 do
			local Color = config.toColor({ h = 0, s = 0, v = i1 / (Largest - 1) })
			table.insert(List, { color = Color, key = config.hex(Color) })
		end
		return List
	end
	
	local v1 = nil
	
	function config.brick()
		-- upvalues: v1 (ref), p1 (copy)
		if v1 ~= nil then
			return v1
		end
		local FacetColorPickerTheBrickModeRequiresBrickColor = assert(p1.BrickColor, "Facet ColorPicker: the brick mode requires BrickColor")
		local List = {}
		
		for i = 0, 127 do
			local PaletteResult = FacetColorPickerTheBrickModeRequiresBrickColor.palette(i)
			local Color = PaletteResult.Color
			local HSV, HSV2, HSV3 = Color:ToHSV()
			local Order = {}
			Order[1] = if HSV2 < 0.08 then 0 else 1
			Order[2] = if HSV2 < 0.08 then 0 else HSV
			Order[3] = HSV3
			Order[4] = i
			table.insert(List, {
				swatch = {
					color = Color,
					label = PaletteResult.Name,
					key = PaletteResult.Name
				},
				order = Order
			})
		end
		table.sort(List, function(A, B): boolean
			for i = 1, 4 do
				if A.order[i] ~= B.order[i] then
					return A.order[i] < B.order[i]
				end
			end
			return false
		end)
		local List1 = {}
		
		for _, value in List do
			table.insert(List1, value.swatch)
		end
		v1 = List1
		
		return List1
	end
	
	return config
end