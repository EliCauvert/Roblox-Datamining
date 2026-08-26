local runService = game:GetService("RunService")
local guiService = game:GetService("GuiService")
local textService = game:GetService("TextService")
local playersService = game:GetService("Players")
local _ = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local var1 = nil
pcall(function()
	-- upvalues: var1 (write)
	var1 = game:GetService("PlatformService")
end)
local t = {
	IsFinite = function(p1)
		return p1 == p1 and (p1 ~= 1e999 and p1 ~= -1e999)
	end
}

function t.FindAncestorOfType(p1, p2)
	-- upvalues: t (ref)
	local parent = p1 and p1.Parent
	
	return if parent then if parent:IsA(p2) then parent else t.FindAncestorOfType(parent, p2) else nil
end

function t.CalculateRelativeDimensions(p1, p2, p3, _)
	-- upvalues: guiService (ref), t (ref)
	local screenResolution = guiService:GetScreenResolution()
	local surfaceGui = t.FindAncestorOfType(p1, "SurfaceGui")
	
	if surfaceGui then
		screenResolution = surfaceGui.CanvasSize
	end
	local var2 = p2 / p3
	
	if p3.y > 0 and screenResolution.y > 0 then
		var2 *= p3.x / p3.y / (screenResolution.x / screenResolution.y)
		local parent = p1.Parent
		
		if parent then
			local var3 = 1 / (parent.AbsoluteSize / screenResolution)
			
			return if t.IsFinite(var3.x) and t.IsFinite(var3.y) then UDim2.new(var3.x * var2.x, 0, var3.y * var2.y, 0) else UDim2.new(var2.x, 0, var2.y, 0)
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

function t.CalculateFit(p1, p2)
	local var2 = p1.AbsoluteSize / p2
	local var3 = p2 * math.min(var2.X, var2.Y)
	
	return UDim2.new(0, var3.X, 0, var3.Y)
end

function t.CalculateFill(p1, p2)
	local var2 = p1.AbsoluteSize / p2
	local var3 = p2 * math.max(var2.X, var2.Y)
	
	return UDim2.new(0, var3.X, 0, var3.Y)
end

local t_1 = {}

local function _(p1, p2)
	-- upvalues: t_1 (ref)
	return t_1[p1] and t_1[p1][p2]
end

local _ = function(value, p1, p2)
	-- upvalues: t_1 (ref)
	if not t_1[value] then
		t_1[value] = {}
	end
	t_1[value][p1] = p2
end

function t.Linear(p1, p2, p3, p4)
	return if p4 <= p1 then p2 + p3 else p3 * p1 / p4 + p2
end

function t.EaseOutQuad(p1, p2, p3, p4)
	if p4 <= p1 then
		return p2 + p3
	end
	p1 /= p4
	
	return -p3 * p1 * (p1 - 2) + p2
end

function t.EaseInOutQuad(p1, p2, p3, p4)
	if p4 <= p1 then
		return p2 + p3
	end
	p1 /= p4 / 2
	
	if p1 < 1 then
		return p3 / 2 * p1 * p1 + p2
	end
	p1 -= 1
	
	return -p3 / 2 * (p1 * (p1 - 2) - 1) + p2
end

function t.SCurveUDim2(p1, p2, p3, p4)
	if p4 <= p1 then
		return p2 + p3
	end
	p1 /= p4
	
	if p1 < 0 then
		p1 = 0
	end
	if p1 > 1 then
		p1 = 1
	end
	local var2 = 3 * p1 * p1 - 2 * p1 * p1 * p1
	
	return UDim2.new(var2 * p3.X.Scale, var2 * p3.X.Offset, var2 * p3.Y.Scale, var2 * p3.Y.Offset) + p2
end

function t.SCurveVector2(p1, p2, p3, p4)
	if p4 <= p1 then
		return p2 + p3
	end
	p1 /= p4
	
	if p1 < 0 then
		p1 = 0
	end
	if p1 > 1 then
		p1 = 1
	end
	local var2 = 3 * p1 * p1 - 2 * p1 * p1 * p1
	
	return Vector2.new(var2 * p3.X, var2 * p3.Y) + p2
end

function t.PropertyTweener(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: t (ref), t_1 (ref), runService (ref)
	p6 = p6 or t.Linear
	p7 = p7 or false
	local t_2 = { StartTime = tick() }
	t_2.EndTime = t_2.StartTime + p5
	t_2.Cancelled = false
	local var2 = false
	local var3 = 0
	
	local function _(value)
		-- upvalues: p1 (ref), p2 (ref)
		if p1 then
			p1[p2] = value
		end
	end
	
	local function finalize()
		-- upvalues: p6 (write), p3 (ref), p4 (ref), p1 (ref), p2 (ref), var2 (write), var3 (write), t_1 (copy), t_2 (ref), p8 (ref)
		local var4 = p6(1, p3, p4 - p3, 1)
		
		if p1 then
			p1[p2] = var4
		end
		var2 = true
		var3 = 1
		
		if (t_1[p2] and t_1[p2][p1]) == t_2 then
			local var5 = p2
			local var6 = p1
			
			if not t_1[var5] then
				t_1[var5] = {}
			end
			t_1[var5][var6] = nil
		end
		if p8 then
			p8()
		end
	end
	
	if p7 or (not t_1[p2] or not t_1[p2][p1]) then
		if t_1[p2] and t_1[p2][p1] then
			(t_1[p2] and t_1[p2][p1]):Cancel()
		end
		if not t_1[p2] then
			t_1[p2] = {}
		end
		t_1[p2][p1] = t_2
		local var4 = p6(0, p3, p4 - p3, p5)
		
		if p1 then
			p1[p2] = var4
		end
		spawn(function()
			-- upvalues: t_2 (ref), p1 (ref), p6 (write), p3 (ref), p4 (ref), p5 (ref), p2 (ref), var3 (write), t (copy), runService (copy), finalize (ref), t_1 (copy)
			local currentTime = tick()
			while currentTime < t_2.EndTime and (p1 and not t_2.Cancelled) do
				local var5 = p6(currentTime - t_2.StartTime, p3, p4 - p3, p5)
				
				if p1 then
					p1[p2] = var5
				end
				var3 = t.Clamp(0, 1, (currentTime - t_2.StartTime) / p5)
				runService.RenderStepped:wait()
				currentTime = tick()
			end
			if t_2.Cancelled == false and p1 then
				finalize()
			end
			if (t_1[p2] and t_1[p2][p1]) == t_2 then
				local var6 = p2
				local var7 = p1
				
				if not t_1[var6] then
					t_1[var6] = {}
				end
				t_1[var6][var7] = nil
			end
		end)
	else
		var2 = true
	end
	function t_2.GetFinal(_)
		-- upvalues: p4 (ref)
		return p4
	end
	
	function t_2.GetPercentComplete(_)
		-- upvalues: var3 (write)
		return var3
	end
	
	function t_2.IsFinished(_)
		-- upvalues: var2 (write)
		return var2
	end
	
	function t_2.Finish(p9)
		-- upvalues: var2 (write), finalize (ref)
		if not var2 then
			p9:Cancel()
			finalize()
		end
	end
	
	function t_2.Cancel(_)
		-- upvalues: t_2 (ref), var2 (write), p2 (ref), p1 (ref), t_1 (copy)
		t_2.Cancelled = true
		var2 = true
		
		if (t_1[p2] and t_1[p2][p1]) == t_2 then
			local var5 = p2
			local var6 = p1
			
			if not t_1[var5] then
				t_1[var5] = {}
			end
			t_1[var5][var6] = nil
		end
	end
	
	return t_2
end

function t.CancelTweens(p9)
	for i, v in pairs(p9) do
		v:Finish()
		p9[i] = nil
	end
end

function t.Signal()
	local t = {}
	local bindableEvent = Instance.new("BindableEvent")
	local var5 = nil
	local var6 = nil
	
	function t.fire(_, ...)
		-- upvalues: var5 (write), var6 (write), bindableEvent (ref)
		var5 = { ... }
		var6 = select("#", ...)
		bindableEvent:Fire()
	end
	
	function t.connect(_, p10)
		-- upvalues: bindableEvent (ref), var5 (write), var6 (write)
		if not p10 then
			error("connect(nil)", 2)
		end
		return bindableEvent.Event:connect(function()
			-- upvalues: p10 (ref), var5 (copy), var6 (copy)
			p10(unpack(var5, 1, var6))
		end)
	end
	
	function t.wait(_)
		-- upvalues: bindableEvent (ref), var5 (write), var6 (write)
		bindableEvent.Event:wait()
		assert(var5, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
		
		return unpack(var5, 1, var6)
	end
	
	return t
end

function t.DisconnectEvent(p10)
	if p10 then
		p10:disconnect()
	end
	return nil
end

function t.DisconnectEvents(p10)
	if p10 and type(p10) == "table" then
		for i, v in pairs(p10) do
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
	local var5 = if value.Parent then value.Parent.AbsoluteSize else Vector2.new(0, 0)
	local vector2 = Vector2.new(value.CanvasSize.X.Scale * var5.X + value.CanvasSize.X.Offset, value.CanvasSize.Y.Scale * var5.Y + value.CanvasSize.Y.Offset)
	
	return Vector2.new(t.Clamp(0, vector2.X - value.AbsoluteWindowSize.X, minValue.X), t.Clamp(0, vector2.Y - value.AbsoluteWindowSize.Y, minValue.Y))
end

function t.Round(value, p11)
	p11 = p11 or 1
	
	return math.floor((value + p11 / 2) / p11) * p11
end

function t.ChompString(p11)
	return tostring(p11):gsub("^%s+", ""):gsub("%s+$", "")
end

function t.SpaceNormalizeString(p11)
	return tostring(p11):gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
end

local function getDelimiterByLocale()
	-- upvalues: localizationService (ref)
	local var5 = localizationService.RobloxLocaleId:lower()
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
	
	return if t[var5] then t[var5] else ","
end

function t.FormatNumberString(p11)
	-- upvalues: getDelimiterByLocale (ref), t (ref)
	local var5 = t.ChompString(p11)
	local formattedText = string.format("%%1%s%%2", getDelimiterByLocale())
	local _ = nil
	repeat
		local replaced, replaced_1 = string.gsub(var5, "^(-?%d+)(%d%d%d)", formattedText)
		var5 = replaced
	until replaced_1 == 0
	return var5
end

function t.PrettyPrint(p11)
	-- upvalues: t (ref)
	if type(p11) == "table" then
		local var5 = "{"
		
		for i, v in pairs(p11) do
			var5 = if var5 == "{" then var5 else var5 .. ", "
			
			if type(i) == "string" then
				var5 ..= i .. " = "
			elseif type(i) ~= "number" then
				var5 ..= "[" .. i .. "] = "
			end
			var5 ..= t.PrettyPrint(v)
		end
		return var5 .. "}"
	else
		return if type(p11) == "string" then "'" .. p51 .. "'" else tostring(p11)
	end
end

local _ = function(p12, p13, p14)
	-- upvalues: t (ref)
	p13 = p13 or 0.35
	p14 = p14 or 0.8
	local var6 = t.Clamp(-1, 1, p12)
	
	return if var6 >= 0 then p13 * var6 / (p13 - var6 + 1) else -(p14 * -var6 / (p14 + var6 + 1))
end

local _ = function(p12, p13)
	p13 = p13 or 0.1
	
	return (1 + p13) * (math.abs(p12) * 2 - 1) - p13
end

local _ = function(p12)
	return p12 / 2 + 0.5
end

function t.GamepadLinearToCurve(p12, p13, _, _)
	-- upvalues: t (ref)
	local function onAxis(p14)
		-- upvalues: p13 (ref), t (copy)
		local var6 = if p14 < 0 then -1 else 1
		local p15 = p13 or 0.1
		local var7 = (1 + p15) * (math.abs(math.abs(p14)) * 2 - 1) - p15
		local var8 = nil or 0.35
		local var9 = nil or 0.8
		local var10 = t.Clamp(-1, 1, var7)
		
		return t.Clamp(-1, 1, ((if var10 >= 0 then var8 * var10 / (var8 - var10 + 1) else -(var9 * -var10 / (var9 + var10 + 1))) / 2 + 0.5) * var6)
	end
	
	local new = Vector2.new
	local x = p12.x
	local var6 = if x < 0 then -1 else 1
	p13 = p13 or 0.1
	local var7 = (1 + p13) * (math.abs(math.abs(x)) * 2 - 1) - p13
	local var8 = nil or 0.35
	local var9 = nil or 0.8
	local var10 = t.Clamp(-1, 1, var7)
	
	return new(t.Clamp(-1, 1, ((if var10 >= 0 then var8 * var10 / (var8 - var10 + 1) else -(var9 * -var10 / (var9 + var10 + 1))) / 2 + 0.5) * var6), onAxis(p12.y))
end

function t.IsFastFlagEnabled(p12)
	local ok, status = pcall(function()
		-- upvalues: p12 (ref)
		return settings():GetFFlag(p12)
	end)
	
	return ok and status
end

function t.GetFastVariable(p12)
	local ok, status = pcall(function()
		-- upvalues: p12 (ref)
		return settings():GetFVariable(p12)
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

function t.IsFeatureNonZero(p12)
	-- upvalues: t (ref)
	return (tonumber(t.GetFastVariable(p12)) or 0) ~= 0
end

function t.IsFeatureRolledOut(p12)
	-- upvalues: playersService (ref), t (ref)
	while playersService.LocalPlayer == nil do
		wait()
	end
	return playersService.LocalPlayer.UserId % 100 < (tonumber(t.GetFastVariable(p12)) or 0)
end

function t.ExponentialRepeat(p13, p14, p15)
	p15 = p15 or 6
	local var6 = 1
	while var6 <= p15 and p13() do
		if not p14() then
			wait(var6 ^ 2)
			var6 += 1
			continue
		end
		return
	end
end

function t.SplitString(p16, p17)
	local t = {}
	
	if p16 and p17 then
		for i in string.gmatch(p16, "([^" .. p69 .. "]+)") do
			table.insert(t, i)
		end
	end
	return t
end

local function findAssetsHelper(value, p18, p19)
	-- upvalues: findAssetsHelper (ref)
	if not value then return end
	if value:IsA("CharacterMesh") then
		if value.MeshId > 0 then
			table.insert(p18, p19 .. tostring(value.MeshId))
		end
		if value.BaseTextureId > 0 then
			table.insert(p18, p19 .. tostring(value.BaseTextureId))
		end
		if value.OverlayTextureId > 0 then
			table.insert(p18, p19 .. tostring(value.OverlayTextureId))
		end
	elseif value:IsA("FileMesh") then
		table.insert(p18, value.MeshId)
		table.insert(p18, value.TextureId)
	elseif value:IsA("Decal") then
		table.insert(p18, value.Texture)
	elseif value:IsA("Pants") then
		table.insert(p18, value.PantsTemplate)
	elseif value:IsA("Shirt") then
		table.insert(p18, value.ShirtTemplate)
	end
	for i, v in pairs(value:GetChildren()) do
		findAssetsHelper(v, p18, p19)
	end
end

function t.FindAssetsInModel(value, p20)
	-- upvalues: findAssetsHelper (ref)
	local t = {}
	findAssetsHelper(value, t, p20 or "https://assetgame.roblox.com/asset/?id=")
	
	return t
end

function t.ConvertFontSizeEnumToInt(p20)
	return string.match(p20.Name, "%d+") or 10
end

function t.Upper(p20)
	-- upvalues: var1 (write)
	return if var1 then var1:Upper(p20) else string.upper(p20)
end

function t.SetSelectedCoreObject(value)
	-- upvalues: guiService (ref)
	guiService.SelectedCoreObject = value
end

function t.AddSelectionParent(p20, p21)
	-- upvalues: guiService (ref)
	guiService:AddSelectionParent(p20, p21)
end

function t.RemoveSelectionGroup(p20)
	-- upvalues: guiService (ref)
	guiService:RemoveSelectionGroup(p20)
end

function t.GetTextBounds(p20)
	-- upvalues: textService (ref)
	local var7 = false
	local textTextSize = nil
	
	if p20 then
		if p20.TextFits then
			textTextSize = p20.TextBounds
			var7 = true
			
			return var7, textTextSize
		elseif not p20.TextWrapped then
			textTextSize = textService:GetTextSize(p20.Text, p20.TextSize, p20.Font, Vector2.new(0, 0))
			var7 = true
		end
	end
	return var7, textTextSize
end

function t.ResizeButtonWithText(p20, p21, p22, p23)
	-- upvalues: t (ref)
	local var7 = false
	local textBounds, textBounds_1 = t.GetTextBounds(p21)
	
	if textBounds and p20.Size.X.Scale == 0 and p20.Size.Y.Scale == 0 then
		local vector2 = Vector2.new(p20.Size.X.Offset, p20.Size.Y.Offset)
		local x = vector2.X
		local y = vector2.Y
		
		if p22 and vector2.X < textBounds_1.X + p22 * 2 then
			x = textBounds_1.X + p22 * 2
			var7 = true
		end
		if p23 and vector2.Y < textBounds_1.Y + p23 * 2 then
			y = textBounds_1.Y + p23 * 2
			var7 = true
		end
		if var7 then
			p20.Size = UDim2.new(0, x, 0, y)
		end
	end
	return var7
end

function t.ResizeButtonWithDynamicText(p20, p21, p22, p23, p24)
	-- upvalues: t (ref)
	local var7 = t.ResizeButtonWithText(p20, p21, p23, p24) or false
	local text = p21.Text
	
	if p22 and #p22 > 0 then
		for i = 1, #p22 do
			p21.Text = p22[i]
			var7 = t.ResizeButtonWithText(p20, p21, p23, p24) or var7
		end
	end
	p21.Text = text
	
	return var7
end

return t