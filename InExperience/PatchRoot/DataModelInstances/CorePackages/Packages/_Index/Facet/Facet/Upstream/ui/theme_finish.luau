local _ = require("./theme_types")

local function _(p1: number)
	return if type(p1) == "number" and p1 == p1 and p1 >= 0 and p1 < 1e999 then p1 else nil
end

local _ = function(p1, p2)
	local Color = p1.colors[p2]
	
	if Color == nil and p1.extra then
		Color = p1.extra[p2]
	end
	local Color1 = Color
	
	if type(Color) == "table" then
		local R: number = Color1.r
		
		if if type(R) == "number" and R == R and R >= 0 and R < 1e999 then R else nil then
			local G: number = Color1.g
			
			if if type(G) == "number" and G == G and G >= 0 and G < 1e999 then G else nil then
				local B: number = Color1.b
				
				if if type(B) == "number" and B == B and B >= 0 and B < 1e999 then B else nil then
					return Color
				end
			end
		end
	end
	return nil
end

return {
	apply = function(p1, p2)
		local List = {}
		local List1 = {}
		
		local function _(Text, Message)
			-- upvalues: List (copy)
			table.insert(List, { field = "finish" .. Text, message = Message })
		end
		
		if type(p2) ~= "table" then
			table.insert(List, {
				field = "finish",
				message = "finish is a table with edge and depth"
			})
			
			return List, List1
		end
		local Edge = p2.edge
		local Depth = p2.depth
		
		if type(Edge) ~= "table" then
			table.insert(List, {
				field = "finish.edge",
				message = "State the edge. For no edge, use edge = { width = 0 }"
			})
		end
		if type(Depth) ~= "table" then
			table.insert(List, {
				field = "finish.depth",
				message = "State the depth. For a flat plate, use depth = { lift = 0, glow = 0, sheen = 0 }"
			})
		end
		if #List > 0 then
			return List, List1
		end
		local Style = p1.style
		local Theme = Style.themes[1]
		
		for _, theme in Style.themes do
			if theme.name == Style.defaultTheme then
				Theme = theme
			end
		end
		local _ = function(Text, p3, p4)
			-- upvalues: List (copy), Theme (ref)
			local v1 = if p3 == nil then p4 else p3
			
			if type(v1) ~= "string" then
				table.insert(List, {
					message = "A role is the name of a palette color",
					field = "finish" .. Text
				})
				
				return nil, p4
			end
			local Theme1 = Theme
			local Color = Theme1.colors[v1]
			
			if Color == nil and Theme1.extra then
				Color = Theme1.extra[v1]
			end
			local Color1 = Color
			local v2 = nil
			repeat
				if type(Color) == "table" then
					local R: number = Color1.r
					
					if if type(R) == "number" and R == R and R >= 0 and R < 1e999 then R else nil then
						local G: number = Color1.g
						
						if if type(G) == "number" and G == G and G >= 0 and G < 1e999 then G else nil then
							local B: number = Color1.b
							
							if if type(B) == "number" and B == B and B >= 0 and B < 1e999 then B else nil then
								v2 = Color
								break
							end
						end
					end
				end
				v2 = nil
			until true
			if v2 == nil then
				table.insert(List, {
					field = "finish" .. Text,
					message = `The palette {Theme.name} has no color {v1}`
				})
			end
			return v2, v1
		end
		
		local _ = function(Text, p3: number, p4)
			-- upvalues: List (copy)
			local v1 = if type(p3) == "number" and p3 == p3 and p3 >= 0 and p3 < 1e999 then p3 else nil
			
			if v1 == nil and (p4 or p3 ~= nil) then
				table.insert(List, {
					message = "Give a number of 0 or more",
					field = "finish" .. Text
				})
			end
			return v1 or 0
		end
		
		local _ = function(Text, p3: number, p4)
			-- upvalues: List (copy)
			local v1 = if p3 == nil then p4 elseif type(p3) == "number" and p3 == p3 and p3 >= 0 and p3 < 1e999 then p3 else nil
			
			if v1 == nil or v1 > 1 then
				table.insert(List, {
					message = "Give a number from 0 to 1",
					field = "finish" .. Text
				})
				
				return p4
			else
				return v1
			end
		end
		
		local Width: number = Edge.width
		local Width1 = if type(Width) == "number" and Width == Width and Width >= 0 and Width < 1e999 then Width else nil
		
		if Width1 == nil then
			table.insert(List, {
				field = "finish.edge.width",
				message = "Give a number of 0 or more"
			})
		end
		local Width1_1 = Width1 or 0
		local Role = Edge.role
		local Hairline = if Role == nil then "hairline" else Role
		local Role1 = nil
		repeat
			if type(Hairline) ~= "string" then
				table.insert(List, {
					field = "finish.edge.role",
					message = "A role is the name of a palette color"
				})
				Role1 = "hairline"
				break
			end
			local Theme1 = Theme
			local Color = Theme1.colors[Hairline]
			
			if Color == nil and Theme1.extra then
				Color = Theme1.extra[Hairline]
			end
			local Color1 = Color
			local v1 = nil
			repeat
				if type(Color) == "table" then
					local R: number = Color1.r
					
					if if type(R) == "number" and R == R and R >= 0 and R < 1e999 then R else nil then
						local G: number = Color1.g
						
						if if type(G) == "number" and G == G and G >= 0 and G < 1e999 then G else nil then
							local B: number = Color1.b
							
							if if type(B) == "number" and B == B and B >= 0 and B < 1e999 then B else nil then
								v1 = Color
								break
							end
						end
					end
				end
				v1 = nil
			until true
			if v1 == nil then
				table.insert(List, {
					field = "finish.edge.role",
					message = `The palette {Theme.name} has no color {Hairline}`
				})
			end
			Role1 = Hairline
		until true
		local Transparency: number = Edge.transparency
		local Transparency1 = if Transparency == nil then 0 elseif type(Transparency) == "number" and Transparency == Transparency and Transparency >= 0 and Transparency < 1e999 then Transparency else nil
		local Transparency2 = nil
		
		if Transparency1 == nil or Transparency1 > 1 then
			table.insert(List, {
				field = "finish.edge.transparency",
				message = "Give a number from 0 to 1"
			})
			Transparency2 = 0
		else
			Transparency2 = Transparency1
		end
		local Lift: number = Depth.lift
		local Lift1 = if type(Lift) == "number" and Lift == Lift and Lift >= 0 and Lift < 1e999 then Lift else nil
		
		if Lift1 == nil then
			table.insert(List, {
				field = "finish.depth.lift",
				message = "Give a number of 0 or more"
			})
		end
		local Lift1_1 = Lift1 or 0
		local Glow: number = Depth.glow
		local Glow1 = if type(Glow) == "number" and Glow == Glow and Glow >= 0 and Glow < 1e999 then Glow else nil
		
		if Glow1 == nil then
			table.insert(List, {
				field = "finish.depth.glow",
				message = "Give a number of 0 or more"
			})
		end
		local Glow1_1 = Glow1 or 0
		local Sheen: number = Depth.sheen
		local Sheen1 = (if type(Sheen) == "number" and Sheen == Sheen and Sheen >= 0 and Sheen < 1e999 then Sheen else nil) or -1
		
		if Sheen1 < 0 or Sheen1 > 1 then
			table.insert(List, {
				field = "finish.depth.sheen",
				message = "Give a number from 0 to 1"
			})
			Sheen1 = 0
		end
		local Blur: number = Depth.blur
		local Blur1 = if type(Blur) == "number" and Blur == Blur and Blur >= 0 and Blur < 1e999 then Blur else nil
		
		if Blur1 == nil and Blur ~= nil then
			table.insert(List, {
				field = "finish.depth.blur",
				message = "Give a number of 0 or more"
			})
		end
		local Blur1_1 = Blur1 or 0
		local Side: number = Depth.side
		local Side1 = if type(Side) == "number" and Side == Side and Side >= 0 and Side < 1e999 then Side else nil
		
		if Side1 == nil and Side ~= nil then
			table.insert(List, {
				field = "finish.depth.side",
				message = "Give a number of 0 or more"
			})
		end
		local Side1_1 = Side1 or 0
		local Role11 = Depth.role
		local Accent: string = if Glow1_1 > 0 then "accent" else "content"
		local Accent1 = if Role11 == nil then Accent else Role11
		local Color2 = nil
		local Accent2 = nil
		repeat
			if type(Accent1) ~= "string" then
				table.insert(List, {
					field = "finish.depth.role",
					message = "A role is the name of a palette color"
				})
				Color2 = nil
				Accent2 = Accent
				break
			end
			local Theme2 = Theme
			local Color3 = Theme2.colors[Accent1]
			
			if Color3 == nil and Theme2.extra then
				Color3 = Theme2.extra[Accent1]
			end
			local Color4 = Color3
			local v2 = nil
			repeat
				if type(Color3) == "table" then
					local R: number = Color4.r
					
					if if type(R) == "number" and R == R and R >= 0 and R < 1e999 then R else nil then
						local G: number = Color4.g
						
						if if type(G) == "number" and G == G and G >= 0 and G < 1e999 then G else nil then
							local B: number = Color4.b
							
							if if type(B) == "number" and (B == B and B >= 0 and B < 1e999) then B else nil then
								v2 = Color3
								break
							end
						end
					end
				end
				v2 = nil
			until true
			if v2 == nil then
				table.insert(List, {
					field = "finish.depth.role",
					message = `The palette {Theme.name} has no color {Accent1}`
				})
			end
			Color2 = v2
			Accent2 = Accent1
		until true
		local Strength: number = Depth.strength
		local v3: number = if Glow1_1 > 0 then 0.55 else 0.35
		local Strength1 = if Strength == nil then v3 elseif type(Strength) == "number" and Strength == Strength and (Strength >= 0 and Strength < 1e999) then Strength else nil
		local v4 = nil
		
		if Strength1 == nil or Strength1 > 1 then
			table.insert(List, {
				field = "finish.depth.strength",
				message = "Give a number from 0 to 1"
			})
			v4 = v3
		else
			v4 = Strength1
		end
		if Depth.controls ~= nil and type(Depth.controls) ~= "boolean" then
			table.insert(List, {
				field = "finish.depth.controls",
				message = "controls is true or false"
			})
		end
		if Lift1_1 > 0 and Glow1_1 > 0 then
			table.insert(List, {
				field = "finish.depth",
				message = "A plate has one shadow. Give lift or glow, and 0 for the other"
			})
		end
		if #List > 0 then
			return List, List1
		end
		if Glow1_1 > 0 and (Glow1_1 < 8 or v4 < 0.4) then
			table.insert(List1, {
				field = "finish.depth.glow",
				message = ("A glow of %d px at strength %.2f does not show in a capture. A glow reads as light from about 12 px at 0.5 on a dark ground, and it needs more on a bright one. Raise it until a capture shows it, or state glow = 0."):format(Glow1_1, v4)
			})
		end
		if Width1_1 > 0 then
			local Properties = {
				Color = { role = Role1 },
				Thickness = Width1_1,
				Transparency = Transparency2
			}
			
			if p1.metrics.radii.panel == 0 then
				Properties.LineJoinMode = "Miter"
			end
			local Copy = table.clone(p1.rules or {})
			table.insert(Copy, {
				selector = ".facet-panel::UIStroke, .facet-sheet::UIStroke",
				properties = Properties
			})
			p1.rules = Copy
		end
		if (Lift1_1 > 0 or Glow1_1 > 0) and Color2 then
			local Copy = table.clone(Style.shadows or {})
			Copy.finish = if Glow1_1 > 0 then {
				color = Color2,
				transparency = 1 - v4,
				blurRadius = { offset = Glow1_1 },
				offset = { x = { offset = 0 }, y = { offset = 0 } }
			} else {
				color = if Depth.role == nil then { r = 0, g = 0, b = 0 } else Color2,
				transparency = 1 - v4,
				blurRadius = {
					offset = if Depth.blur == nil then Lift1_1 * 2 else Blur1_1
				},
				offset = { x = { offset = Side1_1 }, y = { offset = Lift1_1 } }
			}
			Style.shadows = Copy
			local Chrome = p1.chrome
			local List2 = if Depth.controls == true then { "panel", "control" } else { "panel" }
			for _, value in List2 do
				local ChromeEntry = Chrome[value]
				
				if ChromeEntry == nil then
					Chrome[value] = { kind = "native", shadow = "finish" }
				elseif type(ChromeEntry) == "table" and ChromeEntry.kind == "native" then
					ChromeEntry.shadow = "finish"
				end
			end
		end
		if Sheen1 > 0 then
			for _, theme1 in Style.themes do
				local Color5 = theme1.colors[Accent2]
				
				if Color5 == nil and theme1.extra then
					Color5 = theme1.extra[Accent2]
				end
				local Color6 = Color5
				local v5 = nil
				
				if type(Color5) == "table" then
					local R: number = Color6.r
					
					if if type(R) == "number" and R == R and R >= 0 and R < 1e999 then R else nil then
						local G: number = Color6.g
						
						if if type(G) == "number" and G == G and G >= 0 and G < 1e999 then G else nil then
							local B: number = Color6.b
							
							if if type(B) == "number" and (B == B and B >= 0 and B < 1e999) then B else nil then
								v5 = Color5
								local V24 = v5 or Color2
								
								if V24 then
									local Extra = theme1.extra or {}
									local Copy = table.clone(Extra.chromeGradient or {})
									Copy.panel = {
										rotation = 90,
										stops = {
											{ t = 0, r = V24.r, g = V24.g, b = V24.b },
											{ t = 1, r = V24.r, g = V24.g, b = V24.b }
										},
										alpha = { { t = 0, v = Sheen1 }, { t = 1, v = 0 } }
									}
									Extra.chromeGradient = Copy
									theme1.extra = Extra
								end
								continue
							end
						end
					end
				end
				v5 = nil
			end
		end
		return List, List1
	end
}