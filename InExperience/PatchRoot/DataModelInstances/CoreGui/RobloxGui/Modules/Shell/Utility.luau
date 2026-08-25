local runService = game:GetService("RunService")
local guiService = game:GetService("GuiService")
local textService = game:GetService("TextService")
local playersService = game:GetService("Players")
local _ = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local var5 = nil
pcall(function()
	-- upvalues: var5 (write)
	var5 = game:GetService("PlatformService")
end)
local t = {
	IsFinite = function(p0)
		return p0 == p0 and (p0 ~= 1e999 and p0 ~= -1e999)
	end
}

function t.FindAncestorOfType(p1, p2)
	-- upvalues: t (ref)
	local parent = p1 and p1.Parent
	
	return if parent then if parent:IsA(p2) then parent else t.FindAncestorOfType(parent, p2) else nil
end

function t.CalculateRelativeDimensions(p3, p4, p5, _)
	-- upvalues: guiService (ref), t (ref)
	local screenResolution = guiService:GetScreenResolution()
	local surfaceGui = t.FindAncestorOfType(p3, "SurfaceGui")
	
	if surfaceGui then
		screenResolution = surfaceGui.CanvasSize
	end
	local var13 = p4 / p5
	
	if p5.y > 0 and screenResolution.y > 0 then
		var13 *= p5.x / p5.y / (screenResolution.x / screenResolution.y)
		local parent = p3.Parent
		
		if parent then
			local var14 = 1 / (parent.AbsoluteSize / screenResolution)
			
			return if t.IsFinite(var14.x) and t.IsFinite(var14.y) then UDim2.new(var14.x * var13.x, 0, var14.y * var13.y, 0) else UDim2.new(var13.x, 0, var13.y, 0)
		end
	end
end

t.Enum = {
	Anchor = {
		TopLeft = 1,
		TopMiddle = 2,
		TopRight = 3,
		CenterLeft = 4,
		Center = 5,
		CenterRight = 6,
		BottomLeft = 7,
		BottomMiddle = 8,
		BottomRight = 9
	}
}

function t.CalculateFit(p6, p7)
	local var15 = p6.AbsoluteSize / p7
	local var16 = p7 * math.min(var15.X, var15.Y)
	
	return UDim2.new(0, var16.X, 0, var16.Y)
end

function t.CalculateFill(p8, p9)
	local var17 = p8.AbsoluteSize / p9
	local var18 = p9 * math.max(var17.X, var17.Y)
	
	return UDim2.new(0, var18.X, 0, var18.Y)
end

local t_1 = {}

local function _(p10, p11)
	-- upvalues: t_1 (ref)
	return t_1[p10] and t_1[p10][p11]
end

local _ = function(value, p12, p13)
	-- upvalues: t_1 (ref)
	if not t_1[value] then
		t_1[value] = {}
	end
	t_1[value][p12] = p13
end

function t.Linear(p14, p15, p16, p17)
	return if p17 <= p14 then p15 + p16 else p16 * p14 / p17 + p15
end

function t.EaseOutQuad(p18, p19, p20, p21)
	if p21 <= p18 then
		return p19 + p20
	end
	p18 /= p21
	
	return -p20 * p18 * (p18 - 2) + p19
end

function t.EaseInOutQuad(p22, p23, p24, p25)
	if p25 <= p22 then
		return p23 + p24
	end
	p22 /= p25 / 2
	
	if p22 < 1 then
		return p24 / 2 * p22 * p22 + p23
	end
	p22 -= 1
	
	return -p24 / 2 * (p22 * (p22 - 2) - 1) + p23
end

function t.SCurveUDim2(p26, p27, p28, p29)
	if p29 <= p26 then
		return p27 + p28
	end
	p26 /= p29
	
	if p26 < 0 then
		p26 = 0
	end
	if p26 > 1 then
		p26 = 1
	end
	local var19 = 3 * p26 * p26 - 2 * p26 * p26 * p26
	
	return UDim2.new(var19 * p28.X.Scale, var19 * p28.X.Offset, var19 * p28.Y.Scale, var19 * p28.Y.Offset) + p27
end

function t.SCurveVector2(p30, p31, p32, p33)
	if p33 <= p30 then
		return p31 + p32
	end
	p30 /= p33
	
	if p30 < 0 then
		p30 = 0
	end
	if p30 > 1 then
		p30 = 1
	end
	local var20 = 3 * p30 * p30 - 2 * p30 * p30 * p30
	
	return Vector2.new(var20 * p32.X, var20 * p32.Y) + p31
end

function t.PropertyTweener(p34, p35, p36, p37, p38, p39, p40, p41)
	-- upvalues: t (ref), t_1 (ref), runService (ref)
	p39 = p39 or t.Linear
	p40 = p40 or false
	local t_2 = { StartTime = tick() }
	t_2.EndTime = t_2.StartTime + p38
	t_2.Cancelled = false
	local var22 = false
	local var23 = 0
	
	local function _(value)
		-- upvalues: p34 (ref), p35 (ref)
		if p34 then
			p34[p35] = value
		end
	end
	
	local function finalize()
		-- upvalues: p39 (write), p36 (ref), p37 (ref), p34 (ref), p35 (ref), var22 (write), var23 (write), t_1 (copy), t_2 (ref), p41 (ref)
		local var26 = p39(1, p36, p37 - p36, 1)
		
		if p34 then
			p34[p35] = var26
		end
		var22 = true
		var23 = 1
		
		if (t_1[p35] and t_1[p35][p34]) == t_2 then
			local var27 = p35
			local var28 = p34
			
			if not t_1[var27] then
				t_1[var27] = {}
			end
			t_1[var27][var28] = nil
		end
		if p41 then
			p41()
		end
	end
	
	if p40 or (not t_1[p35] or not t_1[p35][p34]) then
		if t_1[p35] and t_1[p35][p34] then
			(t_1[p35] and t_1[p35][p34]):Cancel()
		end
		if not t_1[p35] then
			t_1[p35] = {}
		end
		t_1[p35][p34] = t_2
		local var25 = p39(0, p36, p37 - p36, p38)
		
		if p34 then
			p34[p35] = var25
		end
		spawn(function()
			-- upvalues: t_2 (ref), p34 (ref), p39 (write), p36 (ref), p37 (ref), p38 (ref), p35 (ref), var23 (write), t (copy), runService (copy), finalize (ref), t_1 (copy)
			local currentTime = tick()
			while currentTime < t_2.EndTime and (p34 and not t_2.Cancelled) do
				local var30 = p39(currentTime - t_2.StartTime, p36, p37 - p36, p38)
				
				if p34 then
					p34[p35] = var30
				end
				var23 = t.Clamp(0, 1, (currentTime - t_2.StartTime) / p38)
				runService.RenderStepped:wait()
				currentTime = tick()
			end
			if t_2.Cancelled == false and p34 then
				finalize()
			end
			if (t_1[p35] and t_1[p35][p34]) == t_2 then
				local var31 = p35
				local var32 = p34
				
				if not t_1[var31] then
					t_1[var31] = {}
				end
				t_1[var31][var32] = nil
			end
		end)
	else
		var22 = true
	end
	function t_2.GetFinal(_)
		-- upvalues: p37 (ref)
		return p37
	end
	
	function t_2.GetPercentComplete(_)
		-- upvalues: var23 (write)
		return var23
	end
	
	function t_2.IsFinished(_)
		-- upvalues: var22 (write)
		return var22
	end
	
	function t_2.Finish(p42)
		-- upvalues: var22 (write), finalize (ref)
		if not var22 then
			p42:Cancel()
			finalize()
		end
	end
	
	function t_2.Cancel(_)
		-- upvalues: t_2 (ref), var22 (write), p35 (ref), p34 (ref), t_1 (copy)
		t_2.Cancelled = true
		var22 = true
		
		if (t_1[p35] and t_1[p35][p34]) == t_2 then
			local var33 = p35
			local var34 = p34
			
			if not t_1[var33] then
				t_1[var33] = {}
			end
			t_1[var33][var34] = nil
		end
	end
	
	return t_2
end

function t.CancelTweens(p43)
	for i, v in pairs(p43) do
		v:Finish()
		p43[i] = nil
	end
end

function t.Signal()
	local t = {}
	local bindableEvent = Instance.new("BindableEvent")
	local var37 = nil
	local var38 = nil
	
	function t.fire(_, ...)
		-- upvalues: var37 (write), var38 (write), bindableEvent (ref)
		var37 = { ... }
		var38 = select("#", ...)
		bindableEvent:Fire()
	end
	
	function t.connect(_, p44)
		-- upvalues: bindableEvent (ref), var37 (write), var38 (write)
		if not p44 then
			error("connect(nil)", 2)
		end
		return bindableEvent.Event:connect(function()
			-- upvalues: p44 (ref), var37 (copy), var38 (copy)
			p44(unpack(var37, 1, var38))
		end)
	end
	
	function t.wait(_)
		-- upvalues: bindableEvent (ref), var37 (write), var38 (write)
		bindableEvent.Event:wait()
		assert(var37, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
		
		return unpack(var37, 1, var38)
	end
	
	return t
end

function t.DisconnectEvent(p45)
	if p45 then
		p45:disconnect()
	end
	return nil
end

function t.DisconnectEvents(p46)
	if p46 and type(p46) == "table" then
		for i, v in pairs(p46) do
			v:disconnect()
		end
	end
end

function t.Clamp(value, minValue, maxValue)
	return math.max(value, math.min(minValue, maxValue))
end

function t.ClampVector2(value, minValue, maxValue)
	-- upvalues: t (ref)
	return Vector2.new(t.Clamp(value.x, minValue.x, maxValue.x), t.Clamp(value.y, minValue.y, maxValue.y))
end

function t.TweenPositionOrSet(value, ...)
	if value:IsDescendantOf(game) then
		value:TweenPositionInternal(...)
		
		return
	end
	value.Position = select(1, ...)
end

function t.ClampCanvasPosition(value, minValue)
	-- upvalues: t (ref)
	local var39 = if value.Parent then value.Parent.AbsoluteSize else Vector2.new(0, 0)
	local vector2 = Vector2.new(value.CanvasSize.X.Scale * var39.X + value.CanvasSize.X.Offset, value.CanvasSize.Y.Scale * var39.Y + value.CanvasSize.Y.Offset)
	
	return Vector2.new(t.Clamp(0, vector2.X - value.AbsoluteWindowSize.X, minValue.X), t.Clamp(0, vector2.Y - value.AbsoluteWindowSize.Y, minValue.Y))
end

function t.Round(value, p47)
	p47 = p47 or 1
	
	return math.floor((value + p47 / 2) / p47) * p47
end

function t.ChompString(p48)
	return tostring(p48):gsub("^%s+", ""):gsub("%s+$", "")
end

function t.SpaceNormalizeString(p49)
	return tostring(p49):gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
end

local function getDelimiterByLocale()
	-- upvalues: localizationService (ref)
	local var41 = localizationService.RobloxLocaleId:lower()
	local t = {
		["en-us"] = ",",
		["zh-hk"] = "",
		["zh-tw"] = "",
		["nb-no"] = "\194\160",
		["es-es"] = " ",
		["nl-nl"] = ".",
		["it-it"] = ".",
		["tr-tr"] = ".",
		["ru-ru"] = " ",
		["fi-fi"] = "\194\160",
		["da-dk"] = ".",
		["de-de"] = ".",
		["fr-fr"] = "\194\160",
		["pt-br"] = ".",
		["pt-pt"] = ".",
		["pl-pl"] = " ",
		["sv-se"] = " "
	}
	
	return if t[var41] then t[var41] else ","
end

function t.FormatNumberString(p50)
	-- upvalues: getDelimiterByLocale (ref), t (ref)
	local var43 = t.ChompString(p50)
	local formattedText = string.format("%%1%s%%2", getDelimiterByLocale())
	local _ = nil
	repeat
		local replaced, replaced_1 = string.gsub(var43, "^(-?%d+)(%d%d%d)", formattedText)
		var43 = replaced
	until replaced_1 == 0
	return var43
end

function t.PrettyPrint(p51)
	-- upvalues: t (ref)
	if type(p51) == "table" then
		local var47 = "{"
		
		for i, v in pairs(p51) do
			var47 = if var47 == "{" then var47 else var47 .. ", "
			
			if type(i) == "string" then
				var47 ..= i .. " = "
			elseif type(i) ~= "number" then
				var47 ..= "[" .. i .. "] = "
			end
			var47 ..= t.PrettyPrint(v)
		end
		return var47 .. "}"
	else
		return if type(p51) == "string" then "'" .. p51 .. "'" else tostring(p51)
	end
end

local _ = function(p52, p53, p54)
	-- upvalues: t (ref)
	p53 = p53 or 0.35
	p54 = p54 or 0.8
	local var48 = t.Clamp(-1, 1, p52)
	
	return if var48 >= 0 then p53 * var48 / (p53 - var48 + 1) else -(p54 * -var48 / (p54 + var48 + 1))
end

local _ = function(p55, p56)
	p56 = p56 or 0.1
	
	return (1 + p56) * (math.abs(p55) * 2 - 1) - p56
end

local _ = function(p57)
	return p57 / 2 + 0.5
end

function t.GamepadLinearToCurve(p58, p59, _, _)
	-- upvalues: t (ref)
	local function onAxis(p60)
		-- upvalues: p59 (ref), t (copy)
		local var56 = if p60 < 0 then -1 else 1
		local p59_1 = p59 or 0.1
		local var58 = (1 + p59_1) * (math.abs(math.abs(p60)) * 2 - 1) - p59_1
		local var59 = nil or 0.35
		local var60 = nil or 0.8
		local var61 = t.Clamp(-1, 1, var58)
		
		return t.Clamp(-1, 1, ((if var61 >= 0 then var59 * var61 / (var59 - var61 + 1) else -(var60 * -var61 / (var60 + var61 + 1))) / 2 + 0.5) * var56)
	end
	
	local new = Vector2.new
	local x = p58.x
	local var50 = if x < 0 then -1 else 1
	p59 = p59 or 0.1
	local var52 = (1 + p59) * (math.abs(math.abs(x)) * 2 - 1) - p59
	local var53 = nil or 0.35
	local var54 = nil or 0.8
	local var55 = t.Clamp(-1, 1, var52)
	
	return new(t.Clamp(-1, 1, ((if var55 >= 0 then var53 * var55 / (var53 - var55 + 1) else -(var54 * -var55 / (var54 + var55 + 1))) / 2 + 0.5) * var50), onAxis(p58.y))
end

function t.IsFastFlagEnabled(p61)
	local ok, status = pcall(function()
		-- upvalues: p61 (ref)
		return settings():GetFFlag(p61)
	end)
	
	return ok and status
end

function t.GetFastVariable(p62)
	local ok, status = pcall(function()
		-- upvalues: p62 (ref)
		return settings():GetFVariable(p62)
	end)
	
	return ok and status
end

local _ = function()
	-- upvalues: playersService (ref)
	while playersService.LocalPlayer == nil do
		wait()
	end
	return playersService.LocalPlayer
end

function t.IsFeatureNonZero(p63)
	-- upvalues: t (ref)
	return (tonumber(t.GetFastVariable(p63)) or 0) ~= 0
end

function t.IsFeatureRolledOut(p64)
	-- upvalues: playersService (ref), t (ref)
	while playersService.LocalPlayer == nil do
		wait()
	end
	return playersService.LocalPlayer.UserId % 100 < (tonumber(t.GetFastVariable(p64)) or 0)
end

function t.ExponentialRepeat(p65, p66, p67)
	p67 = p67 or 6
	local var62 = 1
	while var62 <= p67 and p65() do
		if not p66() then
			wait(var62 ^ 2)
			var62 += 1
			continue
		end
		return
	end
end

function t.SplitString(p68, p69)
	local t = {}
	
	if p68 and p69 then
		for i in string.gmatch(p68, "([^" .. p69 .. "]+)") do
			table.insert(t, i)
		end
	end
	return t
end

local function findAssetsHelper(value, p70, p71)
	-- upvalues: findAssetsHelper (ref)
	if not value then return end
	if value:IsA("CharacterMesh") then
		if value.MeshId > 0 then
			table.insert(p70, p71 .. tostring(value.MeshId))
		end
		if value.BaseTextureId > 0 then
			table.insert(p70, p71 .. tostring(value.BaseTextureId))
		end
		if value.OverlayTextureId > 0 then
			table.insert(p70, p71 .. tostring(value.OverlayTextureId))
		end
	elseif value:IsA("FileMesh") then
		table.insert(p70, value.MeshId)
		table.insert(p70, value.TextureId)
	elseif value:IsA("Decal") then
		table.insert(p70, value.Texture)
	elseif value:IsA("Pants") then
		table.insert(p70, value.PantsTemplate)
	elseif value:IsA("Shirt") then
		table.insert(p70, value.ShirtTemplate)
	end
	for i, v in pairs(value:GetChildren()) do
		findAssetsHelper(v, p70, p71)
	end
end

function t.FindAssetsInModel(value, p72)
	-- upvalues: findAssetsHelper (ref)
	local t = {}
	findAssetsHelper(value, t, p72 or "https://assetgame.roblox.com/asset/?id=")
	
	return t
end

function t.ConvertFontSizeEnumToInt(p73)
	return string.match(p73.Name, "%d+") or 10
end

function t.Upper(p74)
	-- upvalues: var5 (write)
	return if var5 then var5:Upper(p74) else string.upper(p74)
end

function t.SetSelectedCoreObject(value)
	-- upvalues: guiService (ref)
	guiService.SelectedCoreObject = value
end

function t.AddSelectionParent(p75, p76)
	-- upvalues: guiService (ref)
	guiService:AddSelectionParent(p75, p76)
end

function t.RemoveSelectionGroup(p77)
	-- upvalues: guiService (ref)
	guiService:RemoveSelectionGroup(p77)
end

function t.GetTextBounds(p78)
	-- upvalues: textService (ref)
	local var65 = false
	local textTextSize = nil
	
	if p78 then
		if p78.TextFits then
			textTextSize = p78.TextBounds
			var65 = true
			
			return var65, textTextSize
		elseif not p78.TextWrapped then
			textTextSize = textService:GetTextSize(p78.Text, p78.TextSize, p78.Font, Vector2.new(0, 0))
			var65 = true
		end
	end
	return var65, textTextSize
end

function t.ResizeButtonWithText(p79, p80, p81, p82)
	-- upvalues: t (ref)
	local var67 = false
	local textBounds, textBounds_1 = t.GetTextBounds(p80)
	
	if textBounds and p79.Size.X.Scale == 0 and p79.Size.Y.Scale == 0 then
		local vector2 = Vector2.new(p79.Size.X.Offset, p79.Size.Y.Offset)
		local x = vector2.X
		local y = vector2.Y
		
		if p81 and vector2.X < textBounds_1.X + p81 * 2 then
			x = textBounds_1.X + p81 * 2
			var67 = true
		end
		if p82 and vector2.Y < textBounds_1.Y + p82 * 2 then
			y = textBounds_1.Y + p82 * 2
			var67 = true
		end
		if var67 then
			p79.Size = UDim2.new(0, x, 0, y)
		end
	end
	return var67
end

function t.ResizeButtonWithDynamicText(p83, p84, p85, p86, p87)
	-- upvalues: t (ref)
	local var71 = t.ResizeButtonWithText(p83, p84, p86, p87) or false
	local text = p84.Text
	
	if p85 and #p85 > 0 then
		for i = 1, #p85 do
			p84.Text = p85[i]
			var71 = t.ResizeButtonWithText(p83, p84, p86, p87) or var71
		end
	end
	p84.Text = text
	
	return var71
end

return t