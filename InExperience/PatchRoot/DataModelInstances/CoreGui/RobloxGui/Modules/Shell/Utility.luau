local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local TextService = game:GetService("TextService")
local Players = game:GetService("Players")
local _ = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local PlatformService = nil
pcall(function() --[[ Line: 10 ]]
	-- upvalues: PlatformService (ref)
	PlatformService = game:GetService("PlatformService")
end)
local UtilityModule = {
	IsFinite = function(X): boolean --[[ Line: 15 ]]
		return X == X and (X ~= 1e999 and X ~= -1e999)
	end
}

function UtilityModule.FindAncestorOfType(Parent, ClassName) --[[ Line: 19 ]]
	-- upvalues: UtilityModule (copy)
	local Parent1 = Parent and Parent.Parent
	
	return if Parent1 then if Parent1:IsA(ClassName) then Parent1 else UtilityModule.FindAncestorOfType(Parent1, ClassName) else nil
end

function UtilityModule.CalculateRelativeDimensions(p1, p2, Vector, _): UDim2 --[[ Line: 31 ]]
	-- upvalues: GuiService (copy), UtilityModule (copy)
	local ScreenResolution = GuiService:GetScreenResolution()
	local SurfaceGui = UtilityModule.FindAncestorOfType(p1, "SurfaceGui")
	
	if SurfaceGui then
		ScreenResolution = SurfaceGui.CanvasSize
	end
	local ScaledX = p2 / Vector
	
	if Vector.y > 0 and ScreenResolution.y > 0 then
		ScaledX *= Vector.x / Vector.y / (ScreenResolution.x / ScreenResolution.y)
		local Parent = p1.Parent
		
		if Parent then
			local Vector1 = 1 / (Parent.AbsoluteSize / ScreenResolution)
			
			if UtilityModule.IsFinite(Vector1.x) and UtilityModule.IsFinite(Vector1.y) then
				return UDim2.new(Vector1.x * ScaledX.x, 0, Vector1.y * ScaledX.y, 0)
			end
		end
	end
	return UDim2.new(ScaledX.x, 0, ScaledX.y, 0)
end

UtilityModule.Enum = {
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

function UtilityModule.CalculateFit(Frame, p1): UDim2 --[[ Line: 76 ]]
	local AbsoluteSizeRatio = Frame.AbsoluteSize / p1
	local ScaledSmallest = p1 * math.min(AbsoluteSizeRatio.X, AbsoluteSizeRatio.Y)
	
	return UDim2.new(0, ScaledSmallest.X, 0, ScaledSmallest.Y)
end

function UtilityModule.CalculateFill(Frame, p1): UDim2 --[[ Line: 84 ]]
	local AbsoluteSizeRatio = Frame.AbsoluteSize / p1
	local ScaledLargest = p1 * math.max(AbsoluteSizeRatio.X, AbsoluteSizeRatio.Y)
	
	return UDim2.new(0, ScaledLargest.X, 0, ScaledLargest.Y)
end

local t = {}

local function _(p1, p2) --[[ Line: 95 | Named "getActiveTween" ]]
	-- upvalues: t (copy)
	return t[p1] and t[p1][p2]
end

local _ = function(Key, p1, p2) --[[ Line: 99 | Named "setActiveTween" ]]
	-- upvalues: t (copy)
	if not t[Key] then
		t[Key] = {}
	end
	t[Key][p1] = p2
end

function UtilityModule.Linear(p1, p2, p3, p4) --[[ Line: 106 ]]
	return if p4 <= p1 then p2 + p3 else p3 * p1 / p4 + p2
end

function UtilityModule.EaseOutQuad(p1, p2, p3, p4) --[[ Line: 112 ]]
	if p4 <= p1 then
		return p2 + p3
	else
		local v1 = p1 / p4
		
		return -p3 * v1 * (v1 - 2) + p2
	end
end

function UtilityModule.EaseInOutQuad(p1, p2: number, p3: number, p4: number): number --[[ Line: 119 ]]
	if p4 <= p1 then
		return p2 + p3
	end
	local v1 = p1 / (p4 / 2)
	
	if v1 < 1 then
		return p3 / 2 * v1 * v1 + p2
	else
		local v2 = v1 - 1
		
		return -p3 / 2 * (v2 * (v2 - 2) - 1) + p2
	end
end

function UtilityModule.SCurveUDim2(p1, p2, Vector, p3) --[[ Line: 128 ]]
	if p3 <= p1 then
		return p2 + Vector
	end
	local v1 = p1 / p3
	
	if v1 < 0 then
		v1 = 0
	end
	if v1 > 1 then
		v1 = 1
	end
	local v2 = 3 * v1 * v1 - 2 * v1 * v1 * v1
	
	return UDim2.new(v2 * Vector.X.Scale, v2 * Vector.X.Offset, v2 * Vector.Y.Scale, v2 * Vector.Y.Offset) + p2
end

function UtilityModule.SCurveVector2(p1, p2, Vector, p3) --[[ Line: 141 ]]
	if p3 <= p1 then
		return p2 + Vector
	end
	local v1 = p1 / p3
	
	if v1 < 0 then
		v1 = 0
	end
	if v1 > 1 then
		v1 = 1
	end
	local v2 = 3 * v1 * v1 - 2 * v1 * v1 * v1
	
	return Vector2.new(v2 * Vector.X, v2 * Vector.Y) + p2
end

function UtilityModule.PropertyTweener(p1, Key, p2, p3, p4, p5, p6, Callback1) --[[ Line: 152 ]]
	-- upvalues: UtilityModule (copy), t (copy), RunService (copy)
	local Callback = p5 or UtilityModule.Linear
	local P42 = p6 or false
	local config = { StartTime = tick() }
	config.EndTime = config.StartTime + p4
	config.Cancelled = false
	local Flag = false
	local ClampResult = 0
	
	local function _(p7) --[[ Line: 165 | Named "setValue" ]]
		-- upvalues: p1 (copy), Key (copy)
		if p1 then
			p1[Key] = p7
		end
	end
	
	local function finalize() --[[ Line: 171 ]]
		-- upvalues: Callback (ref), p2 (copy), p3 (copy), p1 (copy), Key (copy), Flag (ref), ClampResult (ref), t (upval), config (copy), Callback1 (copy)
		local CallbackResult = Callback(1, p2, p3 - p2, 1)
		
		if p1 then
			p1[Key] = CallbackResult
		end
		Flag = true
		ClampResult = 1
		
		if (t[Key] and t[Key][p1]) == config then
			if not t[Key] then
				t[Key] = {}
			end
			t[Key][p1] = nil
		end
		if Callback1 then
			Callback1()
		end
	end
	
	if P42 or (not t[Key] or not t[Key][p1]) then
		if t[Key] and t[Key][p1] then
			(t[Key] and t[Key][p1]):Cancel()
		end
		if not t[Key] then
			t[Key] = {}
		end
		t[Key][p1] = config
		local CallbackResult = Callback(0, p2, p3 - p2, p4)
		
		if p1 then
			p1[Key] = CallbackResult
		end
		spawn(function() --[[ Line: 193 ]]
			-- upvalues: config (copy), p1 (copy), Callback (ref), p2 (copy), p3 (copy), p4 (copy), Key (copy), ClampResult (ref), UtilityModule (upval), RunService (upval), finalize (copy), t (upval)
			local CurrentTime = tick()
			while CurrentTime < config.EndTime and (p1 and not config.Cancelled) do
				local CallbackResult = Callback(CurrentTime - config.StartTime, p2, p3 - p2, p4)
				
				if p1 then
					p1[Key] = CallbackResult
				end
				ClampResult = UtilityModule.Clamp(0, 1, (CurrentTime - config.StartTime) / p4)
				RunService.RenderStepped:wait()
				CurrentTime = tick()
			end
			if config.Cancelled == false and p1 then
				finalize()
			end
			if (t[Key] and t[Key][p1]) == config then
				if not t[Key] then
					t[Key] = {}
				end
				t[Key][p1] = nil
			end
		end)
	else
		Flag = true
	end
	function config:GetFinal() --[[ Line: 213 ]]
		-- upvalues: p3 (copy)
		return p3
	end
	
	function config:GetPercentComplete() --[[ Line: 217 ]]
		-- upvalues: ClampResult (ref)
		return ClampResult
	end
	
	function config:IsFinished() --[[ Line: 221 ]]
		-- upvalues: Flag (ref)
		return Flag
	end
	
	function config.Finish(p7) --[[ Line: 225 ]]
		-- upvalues: Flag (ref), finalize (copy)
		if not Flag then
			p7:Cancel()
			finalize()
		end
	end
	
	function config:Cancel() --[[ Line: 232 ]]
		-- upvalues: config (copy), Flag (ref), Key (copy), p1 (copy), t (upval)
		config.Cancelled = true
		Flag = true
		
		if (t[Key] and t[Key][p1]) == config then
			if not t[Key] then
				t[Key] = {}
			end
			t[Key][p1] = nil
		end
	end
	
	return config
end

function UtilityModule.CancelTweens(List) --[[ Line: 243 ]]
	for i, value in pairs(List) do
		value:Finish()
		List[i] = nil
	end
end

function UtilityModule.Signal() --[[ Line: 252 ]]
	local BindableEvent = Instance.new("BindableEvent")
	local List = nil
	local Selected = nil
	
	return {
		fire = function(_, ...) --[[ Line: 260 ]]
			-- upvalues: List (ref), Selected (ref), BindableEvent (copy)
			List = { ... }
			Selected = select("#", ...)
			BindableEvent:Fire()
		end,
		connect = function(_, Callback) --[[ Line: 266 ]]
			-- upvalues: BindableEvent (copy), List (ref), Selected (ref)
			if not Callback then
				error("connect(nil)", 2)
			end
			return BindableEvent.Event:connect(function() --[[ Line: 268 ]]
				-- upvalues: Callback (copy), List (upval), Selected (upval)
				Callback(unpack(List, 1, Selected))
			end)
		end,
		wait = function(_) --[[ Line: 273 ]]
			-- upvalues: BindableEvent (copy), List (ref), Selected (ref)
			BindableEvent.Event:wait()
			assert(List, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
			
			return unpack(List, 1, Selected)
		end
	}
end

function UtilityModule.DisconnectEvent(p7) --[[ Line: 282 ]]
	if p7 then
		p7:disconnect()
	end
	return nil
end

function UtilityModule.DisconnectEvents(List) --[[ Line: 289 ]]
	if List and type(List) == "table" then
		for _, value in pairs(List) do
			value:disconnect()
		end
	end
end

function UtilityModule.Clamp(X: number, X1: number, X2: number): number --[[ Line: 299 ]]
	return (math.max(X, (math.min(X1, X2))))
end

function UtilityModule.ClampVector2(Vector, Vector1, Vector3): Vector2 --[[ Line: 303 ]]
	-- upvalues: UtilityModule (copy)
	return Vector2.new(UtilityModule.Clamp(Vector.x, Vector1.x, Vector3.x), UtilityModule.Clamp(Vector.y, Vector1.y, Vector3.y))
end

function UtilityModule.TweenPositionOrSet(Object, ...) --[[ Line: 307 ]]
	if Object:IsDescendantOf(game) then
		Object:TweenPositionInternal(...)
		
		return
	else
		Object.Position = select(1, ...)
	end
end

function UtilityModule.ClampCanvasPosition(ScrollFrame, Vector): Vector2 --[[ Line: 316 ]]
	-- upvalues: UtilityModule (copy)
	local AbsoluteSize = ScrollFrame.Parent and ScrollFrame.Parent.AbsoluteSize or Vector2.new(0, 0)
	local _Vector2 = Vector2.new(ScrollFrame.CanvasSize.X.Scale * AbsoluteSize.X + ScrollFrame.CanvasSize.X.Offset, ScrollFrame.CanvasSize.Y.Scale * AbsoluteSize.Y + ScrollFrame.CanvasSize.Y.Offset)
	
	return Vector2.new(UtilityModule.Clamp(0, _Vector2.X - ScrollFrame.AbsoluteWindowSize.X, Vector.X), (UtilityModule.Clamp(0, _Vector2.Y - ScrollFrame.AbsoluteWindowSize.Y, Vector.Y)))
end

function UtilityModule.Round(p7, p8) --[[ Line: 327 ]]
	local P65 = p8 or 1
	
	return math.floor((p7 + P65 / 2) / P65) * P65
end

function UtilityModule.ChompString(p7) --[[ Line: 335 ]]
	return tostring(p7):gsub("^%s+", ""):gsub("%s+$", "")
end

function UtilityModule.SpaceNormalizeString(p7) --[[ Line: 340 ]]
	return tostring(p7):gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
end

local function getDelimiterByLocale() --[[ Line: 344 ]]
	-- upvalues: LocalizationService (copy)
	local Lowered = LocalizationService.RobloxLocaleId:lower()
	local config = {
		["en-us"] = ",",
		["zh-hk"] = "",
		["zh-tw"] = "",
		["nb-no"] = " ",
		["es-es"] = " ",
		["nl-nl"] = ".",
		["it-it"] = ".",
		["tr-tr"] = ".",
		["ru-ru"] = " ",
		["fi-fi"] = " ",
		["da-dk"] = ".",
		["de-de"] = ".",
		["fr-fr"] = " ",
		["pt-br"] = ".",
		["pt-pt"] = ".",
		["pl-pl"] = " ",
		["sv-se"] = " "
	}
	
	return if config[Lowered] then config[Lowered] else ","
end

function UtilityModule.FormatNumberString(p7): string --[[ Line: 375 ]]
	-- upvalues: getDelimiterByLocale (copy), UtilityModule (copy)
	local ChompStringResult: string = UtilityModule.ChompString(p7)
	local Formatted = string.format("%%1%s%%2", (getDelimiterByLocale()))
	repeat
		local Replaced2
		ChompStringResult, Replaced2 = string.gsub(ChompStringResult, "^(-?%d+)(%d%d%d)", Formatted)
	until Replaced2 == 0
	return ChompStringResult
end

function UtilityModule.PrettyPrint(List): string --[[ Line: 391 ]]
	-- upvalues: UtilityModule (copy)
	if type(List) ~= "table" then
		return if type(List) == "string" then "'" .. List .. "'" else tostring(List)
	end
	local v1 = "{"
	
	for i, value in pairs(List) do
		local V54: string = v1 == "{" and v1 or v1 .. ", "
		
		if type(i) == "string" then
			V54 ..= i .. " = "
		elseif type(i) ~= "number" then
			V54 ..= "[" .. i .. "] = "
		end
		v1 = V54 .. UtilityModule.PrettyPrint(value)
	end
	return v1 .. "}"
end

local _ = function(p7, p8, p9) --[[ Line: 415 | Named "SCurveTranform" ]]
	-- upvalues: UtilityModule (copy)
	local P71 = p8 or 0.35
	local P72 = p9 or 0.8
	local ClampResult: number = UtilityModule.Clamp(-1, 1, p7)
	
	return if ClampResult >= 0 then P71 * ClampResult / (P71 - ClampResult + 1) else -(P72 * -ClampResult / (P72 + ClampResult + 1))
end

local _ = function(Value: number, p7): number --[[ Line: 425 | Named "toSCurveSpace" ]]
	local P73 = p7 or 0.1
	
	return (1 + P73) * (math.abs(Value) * 2 - 1) - P73
end

local _ = function(p7: number): number --[[ Line: 430 | Named "fromSCurveSpace" ]]
	return p7 / 2 + 0.5
end

function UtilityModule.GamepadLinearToCurve(Vector, p7, _, _): Vector2 --[[ Line: 434 ]]
	-- upvalues: UtilityModule (copy)
	local X: number = Vector.x
	local P76 = p7 or 0.1
	local PDelta = (1 + P76) * (math.abs((math.abs(X))) * 2 - 1) - P76
	local v2 = 0.35
	local v3 = 0.8
	local ClampResult: number = UtilityModule.Clamp(-1, 1, PDelta)
	
	return Vector2.new(UtilityModule.Clamp(-1, 1, ((if ClampResult >= 0 then v2 * ClampResult / (v2 - ClampResult + 1) else -(v3 * -ClampResult / (v3 + ClampResult + 1))) / 2 + 0.5) * (if X < 0 then -1 else 1)), (function(Value: number) --[[ Line: 435 | Named "onAxis" ]]
		-- upvalues: p7 (copy), UtilityModule (upval)
		local P76 = p7 or 0.1
		local PDelta = (1 + P76) * (math.abs((math.abs(Value))) * 2 - 1) - P76
		local v4 = 0.35
		local v5 = 0.8
		local ClampResult: number = UtilityModule.Clamp(-1, 1, PDelta)
		
		return UtilityModule.Clamp(-1, 1, ((if ClampResult >= 0 then v4 * ClampResult / (v4 - ClampResult + 1) else -(v5 * -ClampResult / (v5 + ClampResult + 1))) / 2 + 0.5) * (if Value < 0 then -1 else 1))
	end)(Vector.y))
end

function UtilityModule.IsFastFlagEnabled(p7) --[[ Line: 444 ]]
	local Success, Result = pcall(function() --[[ Line: 445 ]]
		-- upvalues: p7 (copy)
		return settings():GetFFlag(p7)
	end)
	
	return Success and Result
end

function UtilityModule.GetFastVariable(p7) --[[ Line: 452 ]]
	local Success, Result = pcall(function() --[[ Line: 453 ]]
		-- upvalues: p7 (copy)
		return settings():GetFVariable(p7)
	end)
	
	return Success and Result
end

local _ = function() --[[ Line: 460 | Named "getLocalPlayer" ]]
	-- upvalues: Players (copy)
	while Players.LocalPlayer == nil do
		wait()
	end
	return Players.LocalPlayer
end

function UtilityModule.IsFeatureNonZero(p7): boolean --[[ Line: 467 ]]
	-- upvalues: UtilityModule (copy)
	return (tonumber(UtilityModule.GetFastVariable(p7)) or 0) ~= 0
end

function UtilityModule.IsFeatureRolledOut(p7): boolean --[[ Line: 471 ]]
	-- upvalues: Players (copy), UtilityModule (copy)
	while Players.LocalPlayer == nil do
		wait()
	end
	return Players.LocalPlayer.UserId % 100 < (tonumber(UtilityModule.GetFastVariable(p7)) or 0)
end

function UtilityModule.ExponentialRepeat(p8, Callback, p9) --[[ Line: 476 ]]
	local Count = 1
	local P84 = p9 or 6
	while Count <= P84 and p8() do
		if Callback() then break end
		wait(Count ^ 2)
		Count += 1
	end
end

function UtilityModule.SplitString(Text: string, Text1) --[[ Line: 490 ]]
	local List = {}
	
	if Text and Text1 then
		for i in string.gmatch(Text, "([^" .. Text1 .. "]+)") do
			table.insert(List, i)
		end
	end
	return List
end

local function findAssetsHelper(Object, List, Text) --[[ Line: 501 ]]
	-- upvalues: findAssetsHelper (copy)
	if not Object then return end
	if Object:IsA("CharacterMesh") then
		if Object.MeshId > 0 then
			table.insert(List, Text .. tostring(Object.MeshId))
		end
		if Object.BaseTextureId > 0 then
			table.insert(List, Text .. tostring(Object.BaseTextureId))
		end
		if Object.OverlayTextureId > 0 then
			table.insert(List, Text .. tostring(Object.OverlayTextureId))
		end
	elseif Object:IsA("FileMesh") then
		table.insert(List, Object.MeshId)
		table.insert(List, Object.TextureId)
	elseif Object:IsA("Decal") then
		table.insert(List, Object.Texture)
	elseif Object:IsA("Pants") then
		table.insert(List, Object.PantsTemplate)
	elseif Object:IsA("Shirt") then
		table.insert(List, Object.ShirtTemplate)
	end
	for _, child in pairs(Object:GetChildren()) do
		findAssetsHelper(child, List, Text)
	end
end

function UtilityModule.FindAssetsInModel(p10, p11) --[[ Line: 529 ]]
	-- upvalues: findAssetsHelper (copy)
	local t = {}
	findAssetsHelper(p10, t, p11 or "https://assetgame.roblox.com/asset/?id=")
	
	return t
end

function UtilityModule.ConvertFontSizeEnumToInt(p10): string --[[ Line: 536 ]]
	return string.match(p10.Name, "%d+") or 10
end

function UtilityModule.Upper(Text: string) --[[ Line: 543 ]]
	-- upvalues: PlatformService (ref)
	return if PlatformService then PlatformService:Upper(Text) else string.upper(Text)
end

function UtilityModule.SetSelectedCoreObject(SelectedCoreObject) --[[ Line: 551 ]]
	-- upvalues: GuiService (copy)
	GuiService.SelectedCoreObject = SelectedCoreObject
end

function UtilityModule.AddSelectionParent(SelectionName, SelectionName1) --[[ Line: 555 ]]
	-- upvalues: GuiService (copy)
	GuiService:AddSelectionParent(SelectionName, SelectionName1)
end

function UtilityModule.RemoveSelectionGroup(SelectionName) --[[ Line: 559 ]]
	-- upvalues: GuiService (copy)
	GuiService:RemoveSelectionGroup(SelectionName)
end

function UtilityModule.GetTextBounds(Label) --[[ Line: 563 ]]
	-- upvalues: TextService (copy)
	local Flag = false
	local TextBounds = nil
	
	if Label then
		if Label.TextFits then
			TextBounds = Label.TextBounds
			Flag = true
			
			return Flag, TextBounds
		end
		if not Label.TextWrapped then
			TextBounds = TextService:GetTextSize(Label.Text, Label.TextSize, Label.Font, Vector2.new(0, 0))
			Flag = true
		end
	end
	return Flag, TextBounds
end

function UtilityModule.ResizeButtonWithText(p10, Label, p11: number, p12: number): boolean --[[ Line: 589 ]]
	-- upvalues: UtilityModule (copy)
	local Flag = false
	local TextBounds, TextBounds2 = UtilityModule.GetTextBounds(Label)
	
	if TextBounds and p10.Size.X.Scale == 0 and p10.Size.Y.Scale == 0 then
		local _Vector2 = Vector2.new(p10.Size.X.Offset, p10.Size.Y.Offset)
		local X = _Vector2.X
		local Y = _Vector2.Y
		
		if p11 and _Vector2.X < TextBounds2.X + p11 * 2 then
			X = TextBounds2.X + p11 * 2
			Flag = true
		end
		if p12 and _Vector2.Y < TextBounds2.Y + p12 * 2 then
			Y = TextBounds2.Y + p12 * 2
			Flag = true
		end
		if Flag then
			p10.Size = UDim2.new(0, X, 0, Y)
		end
	end
	return Flag
end

function UtilityModule.ResizeButtonWithDynamicText(p10, p11, p12, p13, p14) --[[ Line: 616 ]]
	-- upvalues: UtilityModule (copy)
	local ResizeButtonWithTextResult = UtilityModule.ResizeButtonWithText(p10, p11, p13, p14) or false
	local Text = p11.Text
	
	if p12 and #p12 > 0 then
		for i = 1, #p12 do
			p11.Text = p12[i]
			ResizeButtonWithTextResult = UtilityModule.ResizeButtonWithText(p10, p11, p13, p14) or ResizeButtonWithTextResult
		end
	end
	p11.Text = Text
	
	return ResizeButtonWithTextResult
end

return UtilityModule