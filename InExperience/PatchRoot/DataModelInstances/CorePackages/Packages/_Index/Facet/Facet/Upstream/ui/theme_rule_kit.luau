local _ = require("./theme_types")
local _ = require("./engine_types")
local ThemeSupportModule = require("./theme_support")
local MergeFunction = ThemeSupportModule.merge
local PaletteForFunction = ThemeSupportModule.paletteFor
local FontFunction = ThemeSupportModule.font
local Presses = {}
local Matches = {}

local function _(Text: string)
	-- upvalues: Presses (copy)
	local Press = Presses[Text]
	
	if Press == nil then
		Press = if string.find(Text, ":Press", 1, true) then "press" elseif string.find(Text, ":Hover", 1, true) then "hover" else "normal"
		Presses[Text] = Press
	end
	return Press
end

local function fingerprint(Properties): string
	local List = {}
	
	for property in Properties do
		table.insert(List, property)
	end
	table.sort(List)
	
	return table.concat(List, "|")
end

local _ = function(Text: string)
	-- upvalues: Matches (copy)
	local Match = Matches[Text]
	
	if Match == nil then
		Match = string.match(Text, ", (.+)$") or Text
		Matches[Text] = Match
	end
	return Match
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: PaletteForFunction (copy), ThemeSupportModule (copy), MergeFunction (copy), FontFunction (copy), Matches (copy), Presses (copy), fingerprint (copy)
	local ColorFunction = p5.color
	local PaletteForResult = PaletteForFunction(p1, p2)
	local NeutralBaseResult = ThemeSupportModule.neutralBase(p4, PaletteForResult.colors)
	local MergeResult = MergeFunction(NeutralBaseResult.colors, PaletteForResult.colors)
	local MergeResult1 = MergeFunction(NeutralBaseResult.extra, PaletteForResult.extra)
	local Tokens = {}
	local t = {}
	local config = {
		selection = "accent",
		onSelection = "onAccent",
		inverseSurface = "contentStrong",
		onInverse = "surface",
		tableHeader = "control",
		tableRow = "control",
		tableRowAlternate = "controlHover"
	}
	
	local function source(p6)
		-- upvalues: MergeResult (copy), MergeResult1 (copy), config (copy)
		local MergeResultEntry = MergeResult[p6] or MergeResult1[p6]
		local Entry = config[p6]
		
		if MergeResultEntry == nil and Entry then
			MergeResultEntry = MergeResult[Entry] or MergeResult1[Entry]
		end
		return MergeResultEntry
	end
	
	local dataValue = nil
	
	local function c(Role)
		-- upvalues: Tokens (copy), ColorFunction (copy), p3 (copy), MergeResult (copy), MergeResult1 (copy), config (copy)
		local Text = "FacetColor_" .. Role
		
		if Tokens[Text] == nil then
			local MergeResultEntry = MergeResult[Role] or MergeResult1[Role]
			local Entry = config[Role]
			
			if MergeResultEntry == nil and Entry then
				MergeResultEntry = MergeResult[Entry] or MergeResult1[Entry]
			end
			local ColorResult = ColorFunction(p3, MergeResultEntry)
			
			if ColorResult == nil and Role == "voice" then
				local Warning = MergeResult.warning or MergeResult1.warning
				local Warning1 = config.warning
				
				if Warning == nil and Warning1 then
					Warning = MergeResult[Warning1] or MergeResult1[Warning1]
				end
				local ColorResult1 = ColorFunction(p3, Warning)
				local Danger = MergeResult.danger or MergeResult1.danger
				local Danger1 = config.danger
				
				if Danger == nil and Danger1 then
					Danger = MergeResult[Danger1] or MergeResult1[Danger1]
				end
				ColorResult = ColorResult1:Lerp(ColorFunction(p3, Danger), 0.5)
			end
			Tokens[Text] = ColorResult
		end
		return if Tokens[Text] == nil then nil else "$" .. Text
	end
	
	local function numbers(p6, p7, Udim, Count)
		assert(type(Udim) == "table", `Facet theme rule: {p6}.{p7} must be a list of {Count} numbers`)
		assert(#Udim == Count, `Facet theme rule: {p6}.{p7} must be a list of {Count} numbers`)
		local t = {}
		
		for i = 1, Count do
			local Value: number = Udim[i]
			assert(type(Value) == "number" and Value == Value and math.abs(Value) < 1e999, `Facet theme rule: {p6}.{p7} must be a list of {Count} finite numbers`)
			t[i] = Value
		end
		return t
	end
	
	local function ruleColor(p8, Text: string)
		-- upvalues: ColorFunction (copy), p3 (copy), MergeResult (copy), MergeResult1 (copy), config (copy)
		if type(Text) == "string" then
			local Match: string? = string.match(Text, "^#?(%x%x%x%x%x%x)$")
			assert(Match ~= nil, `Facet theme rule: {p8} hex colors must be #RRGGBB`)
			
			local function _(StartIndex: number): number
				-- upvalues: Match (copy)
				return tonumber(string.sub(Match, StartIndex, StartIndex + 1), 16) / 255
			end
			
			return assert(ColorFunction(p3, {
				r = tonumber(string.sub(Match, 1, 2), 16) / 255,
				g = tonumber(string.sub(Match, 3, 4), 16) / 255,
				b = tonumber(string.sub(Match, 5, 6), 16) / 255
			}))
		end
		if type(Text) == "table" then
			if type(Text.role) == "string" then
				local Role = Text.role
				local MergeResultEntry = MergeResult[Role] or MergeResult1[Role]
				local Entry = config[Role]
				
				if MergeResultEntry == nil and Entry then
					MergeResultEntry = MergeResult[Entry] or MergeResult1[Entry]
				end
				return assert(ColorFunction(p3, MergeResultEntry), `Facet theme rule: {p8} names unknown role {Text.role}`)
			elseif type(Text.r) == "number" and type(Text.g) == "number" and type(Text.b) == "number" then
				return assert(ColorFunction(p3, { r = Text.r, g = Text.g, b = Text.b }))
			end
		end
		error(`Facet theme rule: {p8} colors must be a #hex string, a role or r, g and b`, 0)
	end
	
	local function keypoints(p8, p9, ColorSequence)
		assert(type(ColorSequence) == "table" and #ColorSequence >= 2, `Facet theme rule: {p8}.{p9} needs at least two keypoints`)
		local v1 = -1
		
		for i, value in ColorSequence do
			assert(type(value) == "table", `Facet theme rule: {p8}.{p9} keypoints must be tables`)
			local Time: number = value.time
			assert(type(Time) == "number" and (Time >= 0 and Time <= 1) and v1 < Time, `Facet theme rule: {p8}.{p9} times must rise from 0 to 1`)
			assert(i > 1 or Time == 0, `Facet theme rule: {p8}.{p9} must start at time 0`)
			assert(i < #ColorSequence or Time == 1, `Facet theme rule: {p8}.{p9} must end at time 1`)
			v1 = Time
		end
		return ColorSequence
	end
	
	dataValue = function(p8, p9)
		-- upvalues: numbers (copy), p3 (copy), keypoints (copy), ruleColor (copy)
		if p9.udim ~= nil then
			local Udim = numbers(p8, "udim", p9.udim, 2)
			
			return p3.UDim.new(Udim[1], Udim[2])
		end
		if p9.udim2 ~= nil then
			local Udim2 = numbers(p8, "udim2", p9.udim2, 4)
			
			return p3.UDim2.new(Udim2[1], Udim2[2], Udim2[3], Udim2[4])
		end
		if p9.vector2 ~= nil then
			local _Vector2 = numbers(p8, "vector2", p9.vector2, 2)
			
			return p3.Vector2.new(_Vector2[1], _Vector2[2])
		end
		if p9.colorSequence == nil then
			if p9.numberSequence == nil then
				error(`Facet theme rule: {p8} must be a native value, a role, a metric, udim, udim2, vector2, colorSequence or numberSequence`, 0)
				
				return
			end
			local List = {}
			
			for _, value1 in keypoints(p8, "numberSequence", p9.numberSequence) do
				local Value: number = value1.value
				assert(type(Value) == "number" and Value == Value and math.abs(Value) < 1e999, `Facet theme rule: {p8}.numberSequence values must be finite numbers`)
				table.insert(List, p3.NumberSequenceKeypoint.new(value1.time, Value))
			end
			return p3.NumberSequence.new(List)
		else
			local List = {}
			
			for _, value in keypoints(p8, "colorSequence", p9.colorSequence) do
				table.insert(List, p3.ColorSequenceKeypoint.new(value.time, ruleColor(p8, value.color)))
			end
			return p3.ColorSequence.new(List)
		end
	end
	
	local function derived(Text, p10): string?
		-- upvalues: Tokens (copy)
		if p10 == nil then
			return nil
		else
			local Text1 = "FacetColor_" .. Text
			Tokens[Text1] = p10
			
			return "$" .. Text1
		end
	end
	
	local function f(p10)
		-- upvalues: t (copy), FontFunction (upval), p3 (copy)
		if typeof(p10) == "Font" then
			return p10
		end
		local Text = (p10.family or "BuilderSans") .. ":" .. (p10.weight or "Regular") .. ":" .. (p10.style or "Normal")
		
		if t[Text] == nil then
			t[Text] = FontFunction(p3, p10)
		end
		return t[Text]
	end
	
	local List = {}
	local t1 = {}
	
	local function _(Selector, Properties)
		-- upvalues: t1 (copy), List (copy), Tokens (copy)
		local v1 = (t1[Selector] or 0) + 1
		t1[Selector] = v1
		table.insert(List, {
			id = Selector .. ":" .. tostring(v1),
			selector = Selector,
			properties = Properties,
			priority = #List * 10,
			tokens = Tokens
		})
	end
	
	local function rule(Text: string, Tbl, p10)
		-- upvalues: p3 (copy), t1 (copy), List (copy), Tokens (copy)
		if string.sub(Text, -10) == "::UIStroke" then
			Tbl = table.clone(Tbl)
			Tbl.ApplyStrokeMode = Tbl.ApplyStrokeMode or p3.Enum.ApplyStrokeMode.Border
			
			if not p10 and Tbl.ApplyStrokeMode == p3.Enum.ApplyStrokeMode.Border then
				Tbl.BorderStrokePosition = Tbl.BorderStrokePosition or p3.Enum.BorderStrokePosition.Inner
			end
		end
		local ImageColor3 = Tbl.ImageColor3
		local ImageTransparency: number = Tbl.ImageTransparency
		local List1 = {}
		
		if ImageColor3 ~= nil or type(ImageTransparency) == "number" then
			for _, value in string.split(Text, ",") do
				local Match: string = string.match(value, "^%s*(.-)%s*$") or value
				
				if string.match(Match, "%.facet%-icon[%w%-]*$") ~= nil then
					table.insert(List1, Match .. " > .facet-icon-stroke")
				end
			end
		end
		if string.sub(Text, -10) == "::UIStroke" then
			local Text1 = Text .. ", " .. string.sub(Text, 1, -11) .. " > .facet-fade-stroke"
			local v1 = (t1[Text1] or 0) + 1
			t1[Text1] = v1
			table.insert(List, {
				id = Text1 .. ":" .. tostring(v1),
				selector = Text1,
				properties = Tbl,
				priority = #List * 10,
				tokens = Tokens
			})
		elseif string.sub(Text, -11) == "::UIPadding" then
			local Text2 = Text .. ", " .. string.sub(Text, 1, -12) .. " > UIPadding"
			local v2 = (t1[Text2] or 0) + 1
			t1[Text2] = v2
			table.insert(List, {
				id = Text2 .. ":" .. tostring(v2),
				selector = Text2,
				properties = Tbl,
				priority = #List * 10,
				tokens = Tokens
			})
		elseif ImageColor3 == nil or #List1 <= 0 then
			local v3 = (t1[Text] or 0) + 1
			t1[Text] = v3
			table.insert(List, {
				id = Text .. ":" .. tostring(v3),
				selector = Text,
				properties = Tbl,
				priority = #List * 10,
				tokens = Tokens
			})
		else
			local Copy = table.clone(Tbl)
			Copy.Color3 = ImageColor3
			local Text3 = Text .. ", " .. table.concat(List1, ", ")
			local v4 = (t1[Text3] or 0) + 1
			t1[Text3] = v4
			table.insert(List, {
				id = Text3 .. ":" .. tostring(v4),
				selector = Text3,
				properties = Copy,
				priority = #List * 10,
				tokens = Tokens
			})
		end
		if type(ImageTransparency) == "number" and #List1 > 0 then
			local Joined = table.concat(List1, ", ")
			local v5 = (t1[Joined] or 0) + 1
			t1[Joined] = v5
			table.insert(List, {
				id = Joined .. ":" .. tostring(v5),
				selector = Joined,
				properties = { Visible = ImageTransparency < 1 },
				priority = #List * 10,
				tokens = Tokens
			})
		end
	end
	
	local v6 = (t1[".facet-fade-stroke"] or 0) + 1
	t1[".facet-fade-stroke"] = v6
	table.insert(List, {
		selector = ".facet-fade-stroke",
		id = ".facet-fade-stroke" .. ":" .. tostring(v6),
		properties = { Enabled = false, Transparency = 1 },
		priority = #List * 10,
		tokens = Tokens
	})
	
	return {
		extra = MergeResult1,
		source = source,
		c = c,
		derived = derived,
		resolved = function(p11)
			-- upvalues: c (copy), Tokens (copy)
			local CResult: string = c(p11)
			
			return if CResult then Tokens[string.sub(CResult, 2)] else nil
		end,
		f = f,
		rule = rule,
		finish = function()
			-- upvalues: p3 (copy), t1 (copy), List (copy), Tokens (copy), p1 (copy), c (copy), ThemeSupportModule (upval), dataValue (ref), rule (copy), Matches (upval), Presses (upval), fingerprint (upval)
			local v7 = (t1[".facet-fading::UIStroke"] or 0) + 1
			t1[".facet-fading::UIStroke"] = v7
			table.insert(List, {
				selector = ".facet-fading::UIStroke",
				id = ".facet-fading::UIStroke" .. ":" .. tostring(v7),
				properties = {
					Enabled = false,
					ApplyStrokeMode = p3.Enum.ApplyStrokeMode.Border,
					BorderStrokePosition = p3.Enum.BorderStrokePosition.Inner
				},
				priority = #List * 10,
				tokens = Tokens
			})
			local v8 = (t1[".facet-fading > .facet-fade-stroke"] or 0) + 1
			t1[".facet-fading > .facet-fade-stroke"] = v8
			table.insert(List, {
				selector = ".facet-fading > .facet-fade-stroke",
				id = ".facet-fading > .facet-fade-stroke" .. ":" .. tostring(v8),
				properties = { Enabled = true },
				priority = #List * 10,
				tokens = Tokens
			})
			local Rules = p1.rules or {}
			for _, rule1 in Rules do
				local Properties = {}
				local Properties1 = rule1.properties or (rule1.props or {})
				for i1, value1 in Properties1 do
					if type(value1) == "table" and type(value1.role) == "string" then
						Properties[i1] = c(value1.role)
					elseif type(value1) == "table" and value1.metric ~= nil then
						local Metric = value1.metric
						Properties[i1] = assert(ThemeSupportModule.numericMetric(p1.metrics, Metric), `Facet theme rule: invalid numeric metric {tostring(Metric)}`)
					elseif typeof(value1) == "table" and getmetatable(value1) == nil then
						Properties[i1] = dataValue(i1, value1)
					else
						Properties[i1] = value1
					end
				end
				rule(rule1.selector, Properties, true)
			end
			local t = {}
			local List1 = {}
			
			for _, value3 in List do
				local Selector1: string = value3.selector
				local Match = Matches[Selector1]
				
				if Match == nil then
					Match = string.match(Selector1, ", (.+)$") or Selector1
					Matches[Selector1] = Match
				end
				if string.sub(Match, -21) == " > .facet-fade-stroke" and Match ~= ".facet-fading > .facet-fade-stroke" and not t[Match] then
					t[Match] = true
					table.insert(List1, {
						id = Match .. ":presence",
						selector = Match,
						properties = { Transparency = 0 },
						priority = #List1
					})
				end
			end
			local list = { List[1] }
			table.move(List1, 1, #List1, 2, list)
			table.move(List, 2, #List, #list + 1, list)
			local List2 = {}
			local List3 = {}
			local List4 = {}
			local Flag = nil
			local Flag1 = nil
			
			for _, value2 in list do
				Flag = false
				local Selector: string = value2.selector
				local Press = Presses[Selector]
				
				if Press == nil then
					Press = if string.find(Selector, ":Press", 1, true) then "press" elseif string.find(Selector, ":Hover", 1, true) then "hover" else "normal"
					Presses[Selector] = Press
				end
				local FingerprintResult = fingerprint(value2.properties)
				local v9 = nil
				
				for i2 = #List2, 1, -1 do
					v9 = List2[i2]
					
					if List3[i2] == Press and List4[i2] == FingerprintResult and ThemeSupportModule.sameProperties(v9.properties, value2.properties) then
						v9.selector ..= ", " .. value2.selector
						Flag = true
						break
					end
					Flag1 = false
					
					for property in value2.properties do
						if v9.properties[property] ~= nil then
							Flag1 = true
							break
						end
					end
					if Flag1 then break end
				end
				if not Flag then
					table.insert(List2, value2)
					table.insert(List3, Press)
					table.insert(List4, FingerprintResult)
				end
			end
			for i, value in List2 do
				value.priority = (i - 1) * 10
			end
			return List2
		end
	}
end