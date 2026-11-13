local AmbientModule = require("./ambient")
local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./theme_types")
local IconsModule = require("./icons")
local IconStrokesModule = require("./icon_strokes")
local LayoutKitModule = require("./layout_kit")
local TextMeasureModule = require("./text_measure")
local TextChangesModule = require("./text_changes")
local ThemeSupportModule = require("./theme_support")
local Frozen = table.freeze({ "ref" })
local config = { styled = true }
local t = {}
local OnFrameResult = nil
local Frame = 0

local function flushGeometry()
	-- upvalues: Frame (ref), t (copy), OnFrameResult (ref)
	Frame += 1
	local t1 = {}
	
	for i, value in t do
		if value.frame < Frame - 1 then
			t1[i] = value
		end
	end
	for i1 in t1 do
		t[i1] = nil
		i1()
	end
	for _, value1 in t1 do
		value1.apply()
	end
	if next(t) == nil and OnFrameResult then
		local Callback: () -> () = OnFrameResult
		OnFrameResult = nil
		Callback()
	end
end

local function attachMeasuredLayout(FontFaceStyled, Label, Connection, p1, CurrentOwner, Enabled1, CurrentOwner1, Styled, FontFaceStyled1)
	-- upvalues: AmbientModule (copy), t (copy), Frame (ref), OnFrameResult (ref), flushGeometry (copy), TextChangesModule (copy), TextMeasureModule (copy)
	local Compose = FontFaceStyled.Compose
	local Runtime = FontFaceStyled.runtime
	local Types = FontFaceStyled.types
	local Host = FontFaceStyled.Host
	local TypesEnum = Types.Enum
	local Services = FontFaceStyled.config.services
	local AutomaticSize = Label.AutomaticSize
	local Size = Label.Size
	local Enabled = nil
	
	local function _(): boolean
		-- upvalues: Enabled (ref), Label (copy)
		if Enabled == nil then
			Enabled = Label:GetStyled("TextWrapped") == true
		end
		return Enabled == true
	end
	
	local v1 = nil
	
	local function textStyle()
		-- upvalues: v1 (ref), Styled (ref), FontFaceStyled1 (ref), Enabled (ref), Label (copy), AutomaticSize (ref)
		local v2 = v1
		
		if v2 then
			return v2
		end
		local Face = assert(Styled)
		local Size = assert(FontFaceStyled1)
		
		if Enabled == nil then
			Enabled = Label:GetStyled("TextWrapped") == true
		end
		local IsEnabled = Enabled == true
		local TextTruncateStyled = Label:GetStyled("TextTruncate")
		local LineHeightStyled = Label:GetStyled("LineHeight")
		local RichText = Label.RichText
		local config = {
			face = Face,
			size = Size,
			rich = RichText,
			wrapped = IsEnabled,
			truncate = TextTruncateStyled,
			lineHeight = LineHeightStyled,
			key = `{Face.Family}|{Face.Weight.Name}|{Face.Style.Name}|{Size}|{RichText}|{AutomaticSize.Name}|{IsEnabled}|{TextTruncateStyled}|{LineHeightStyled}`
		}
		v1 = config
		
		return config
	end
	
	local RunService = Services.RunService
	local PreRenderConnection = nil
	local UISizeConstraint = nil
	local Flag = true
	local Flag1 = false
	local NoCurrentOwner = not CurrentOwner
	
	local function v36() end
	
	local _ = function(): boolean
		-- upvalues: Services (copy), UISizeConstraint (ref)
		return Services.TextService ~= nil and UISizeConstraint ~= nil
	end
	
	local function reflow(Enabled)
		-- upvalues: AutomaticSize (ref), TypesEnum (copy), Flag1 (ref), textStyle (copy), Label (copy)
		local AutomaticSize1 = AutomaticSize
		
		if AutomaticSize1 ~= TypesEnum.AutomaticSize.None then
			Flag1 = true
			local TextStyleResult = textStyle()
			local Face = TextStyleResult.face
			local Size = TextStyleResult.size
			local IsNotFontFaceMatch: boolean = Enabled == true and Label.FontFace ~= Face
			local IsNotTextSizeMatch: boolean = Enabled == true and Label.TextSize ~= Size
			
			if IsNotFontFaceMatch then
				Label.FontFace = Face
			end
			if IsNotTextSizeMatch then
				Label.TextSize = Size
			end
			Label.AutomaticSize = TypesEnum.AutomaticSize.None
			Label.AutomaticSize = AutomaticSize1
			
			if IsNotFontFaceMatch then
				Label:ResetPropertyToDefault("FontFace")
			end
			if IsNotTextSizeMatch then
				Label:ResetPropertyToDefault("TextSize")
			end
			Flag1 = false
		end
	end
	
	local function deferReflow()
		-- upvalues: PreRenderConnection (ref), RunService (copy), Flag (ref), Flag1 (ref), AutomaticSize (ref), TypesEnum (copy), reflow (copy)
		if PreRenderConnection == nil and RunService and Flag and not Flag1 and AutomaticSize ~= TypesEnum.AutomaticSize.None then
			local function nextFrame()
				-- upvalues: PreRenderConnection (upval), reflow (upval)
				if PreRenderConnection then
					PreRenderConnection:Disconnect()
					PreRenderConnection = nil
				end
				reflow(true)
			end
			
			PreRenderConnection = if RunService.PreRender then RunService.PreRender:Connect(nextFrame) else RunService.Heartbeat:Connect(nextFrame)
		end
	end
	
	local function refreshMetrics()
		-- upvalues: Label (copy), Styled (ref), FontFaceStyled1 (ref), Flag (ref), NoCurrentOwner (ref), v36 (ref), reflow (copy), deferReflow (copy)
		local FontFaceStyled = Label:GetStyled("FontFace")
		local TextSizeStyled = Label:GetStyled("TextSize")
		local HasStyled: boolean = Styled ~= nil or FontFaceStyled1 ~= nil
		local IsNotFontFaceStyledMatch: boolean = FontFaceStyled ~= Styled or TextSizeStyled ~= FontFaceStyled1
		Styled = FontFaceStyled
		FontFaceStyled1 = TextSizeStyled
		
		if Flag and not NoCurrentOwner and (FontFaceStyled ~= Label.FontFace or TextSizeStyled ~= Label.TextSize) then
			NoCurrentOwner = true
			v36()
		end
		if Flag and HasStyled and IsNotFontFaceStyledMatch then
			reflow()
			deferReflow()
		end
	end
	
	local CellResult = Compose.cell(0)
	local HasAmbientModuleResult: boolean = Services.RunService ~= nil and AmbientModule() ~= nil
	local AbsoluteSize = Label.AbsoluteSize
	local CellResult1 = Compose.cell(Label.TextBounds)
	local Frames = Runtime.host.frames
	
	local function v46() end
	
	local Flag2 = false
	local Flag3 = false
	NoCurrentOwner = NoCurrentOwner or Enabled1 == true and not HasAmbientModuleResult
	local TextBounds = nil
	
	local function sampleGeometry()
		-- upvalues: Flag (ref), Flag2 (ref), AbsoluteSize (ref), Label (copy), Flag3 (ref), TextBounds (ref)
		if Flag then
			if Flag2 then
				AbsoluteSize = Label.AbsoluteSize
			end
			if Flag3 then
				TextBounds = Label.TextBounds
			end
			Flag2 = false
			Flag3 = false
		end
	end
	
	local function applyGeometry()
		-- upvalues: Flag (ref), TextBounds (ref), CellResult1 (copy), Enabled1 (copy), NoCurrentOwner (ref), v36 (ref), v46 (ref)
		if Flag then
			local TextBounds1 = TextBounds
			TextBounds = nil
			
			if TextBounds1 then
				CellResult1:set(TextBounds1)
			end
			if Enabled1 and not NoCurrentOwner then
				NoCurrentOwner = true
				v36()
			end
			v46()
		end
	end
	
	local function geometryChanged(p2)
		-- upvalues: Frames (copy), Flag2 (ref), Flag3 (ref), HasAmbientModuleResult (copy), Flag (ref), AbsoluteSize (ref), Label (copy), TextBounds (ref), CellResult1 (copy), Enabled1 (copy), NoCurrentOwner (ref), v36 (ref), v46 (ref), t (upval), sampleGeometry (copy), Frame (upval), applyGeometry (copy), OnFrameResult (upval), flushGeometry (upval)
		if p2 == "AbsoluteSize" then
			Flag2 = true
		else
			Flag3 = true
		end
		if HasAmbientModuleResult and Frames ~= nil then
			local Entry = t[sampleGeometry]
			
			if Entry then
				Entry.frame = Frame
			else
				t[sampleGeometry] = { apply = applyGeometry, frame = Frame }
			end
			if OnFrameResult == nil then
				OnFrameResult = Frames.onFrame(flushGeometry)
			end
			return
		else
			if Flag then
				if Flag2 then
					AbsoluteSize = Label.AbsoluteSize
				end
				if Flag3 then
					TextBounds = Label.TextBounds
				end
				Flag2 = false
				Flag3 = false
			end
			if Flag then
				local TextBounds1 = TextBounds
				TextBounds = nil
				
				if TextBounds1 then
					CellResult1:set(TextBounds1)
				end
				if Enabled1 and not NoCurrentOwner then
					NoCurrentOwner = true
					v36()
				end
				v46()
			end
		end
	end
	
	local Text = Label.Text
	local CurrentOwner1_1 = CurrentOwner1 or Text
	
	local function v55() end
	
	local function invalidate(Enabled1)
		-- upvalues: Flag1 (ref), v1 (ref), Enabled (ref), refreshMetrics (copy), CellResult (copy), v36 (ref), v55 (ref), v46 (ref)
		if not Flag1 then
			v1 = nil
			Enabled = nil
			
			if Enabled1 == true then
				refreshMetrics()
			end
			CellResult:set(CellResult:peek() + 1)
			v36()
			v55()
			v46()
		end
	end
	
	local StyledPropertiesChangedConnection = Label.StyledPropertiesChanged:Connect(function()
		-- upvalues: Flag1 (ref), v1 (ref), Enabled (ref), refreshMetrics (copy), CellResult (copy), v36 (ref), v55 (ref), v46 (ref)
		if not Flag1 then
			v1 = nil
			Enabled = nil
			refreshMetrics()
			CellResult:set(CellResult:peek() + 1)
			v36()
			v55()
			v46()
		end
	end)
	local TextChangesModuleResult = TextChangesModule(FontFaceStyled, Label, function(p2)
		-- upvalues: Flag1 (ref), v1 (ref), Enabled (ref), refreshMetrics (copy), CellResult (copy), v36 (ref), v55 (ref), v46 (ref), geometryChanged (copy), CurrentOwner1_1 (ref), Text (ref), Label (copy), NoCurrentOwner (ref), Services (copy), UISizeConstraint (ref), FontFaceStyled1 (ref), deferReflow (copy), AutomaticSize (ref), Size (ref)
		if p2 ~= "FontFace" and p2 ~= "TextSize" then
			if p2 == "AbsoluteSize" or p2 == "TextBounds" then
				geometryChanged(p2)
				
				return
			end
			if p2 == "Text" then
				CurrentOwner1_1 = Text
				Text = Label.Text
				
				if not NoCurrentOwner then
					NoCurrentOwner = true
					v36()
				end
				v55()
				
				if (Services.TextService == nil or UISizeConstraint == nil) and FontFaceStyled1 ~= nil and Label.TextSize ~= FontFaceStyled1 then
					deferReflow()
					
					return
				end
			elseif p2 == "AutomaticSize" then
				if not Flag1 then
					AutomaticSize = Label.AutomaticSize
					
					if not Flag1 then
						v1 = nil
						Enabled = nil
						CellResult:set(CellResult:peek() + 1)
						v36()
						v55()
						v46()
						
						return
					end
				end
			elseif p2 == "Size" then
				Size = Label.Size
				
				if not Flag1 then
					v1 = nil
					Enabled = nil
					CellResult:set(CellResult:peek() + 1)
					v36()
					v55()
					v46()
					
					return
				end
			elseif (p2 == "TextWrapped" or p2 == "TextTruncate" or p2 == "LineHeight" or p2 == "RichText") and not Flag1 then
				v1 = nil
				Enabled = nil
				CellResult:set(CellResult:peek() + 1)
				v36()
				v55()
				v46()
			end
		elseif not Flag1 then
			v1 = nil
			Enabled = nil
			refreshMetrics()
			CellResult:set(CellResult:peek() + 1)
			v36()
			v55()
			v46()
			
			return
		end
	end)
	refreshMetrics()
	
	if p1 then
		local function observePadding(UIPadding)
			-- upvalues: Runtime (copy), invalidate (copy), Flag1 (ref), v1 (ref), Enabled (ref), CellResult (copy), v36 (ref), v55 (ref), v46 (ref)
			if UIPadding:IsA("UIPadding") then
				Runtime.connect(UIPadding, "StyledPropertiesChanged", invalidate)
				Runtime.connect(UIPadding, "Changed", invalidate)
				
				if not Flag1 then
					v1 = nil
					Enabled = nil
					CellResult:set(CellResult:peek() + 1)
					v36()
					v55()
					v46()
				end
			end
		end
		
		for _, UIPadding in Label:GetChildren() do
			if UIPadding:IsA("UIPadding") then
				Runtime.connect(UIPadding, "StyledPropertiesChanged", invalidate)
				Runtime.connect(UIPadding, "Changed", invalidate)
				
				if not Flag1 then
					v1 = nil
					Enabled = nil
					CellResult:set(CellResult:peek() + 1)
					v36()
					v55()
					v46()
				end
			end
		end
		Runtime.connect(Label, "ChildAdded", observePadding)
		Runtime.connect(Label, "ChildRemoved", function(UIPadding)
			-- upvalues: Flag1 (ref), v1 (ref), Enabled (ref), CellResult (copy), v36 (ref), v55 (ref), v46 (ref)
			if UIPadding:IsA("UIPadding") and not Flag1 then
				v1 = nil
				Enabled = nil
				CellResult:set(CellResult:peek() + 1)
				v36()
				v55()
				v46()
			end
		end)
	end
	local v2 = nil
	
	v46 = function()
		-- upvalues: CellResult1 (copy), AutomaticSize (ref), TypesEnum (copy), Services (copy), UISizeConstraint (ref), AbsoluteSize (ref), Label (copy), v2 (ref), NoCurrentOwner (ref), v36 (ref), deferReflow (copy)
		local PeekResult = CellResult1:peek()
		local XY = AutomaticSize
		local IsXYMatch: boolean = XY == TypesEnum.AutomaticSize.X or XY == TypesEnum.AutomaticSize.XY
		local IsXYMatch1: boolean = XY == TypesEnum.AutomaticSize.Y or XY == TypesEnum.AutomaticSize.XY
		local HasUISizeConstraint: boolean = Services.TextService ~= nil and UISizeConstraint ~= nil
		local NoTextFits: boolean = if HasUISizeConstraint then IsXYMatch and (PeekResult.X > 0 and (PeekResult.Y > 0 and (PeekResult.X <= AbsoluteSize.X and (PeekResult.Y <= AbsoluteSize.Y and not Label.TextFits)))) else Services.TextService ~= nil and (IsXYMatch and (PeekResult.X > 0 and (PeekResult.Y > 0 and (PeekResult.X <= AbsoluteSize.X and (PeekResult.Y <= AbsoluteSize.Y and not Label.TextFits)))))
		
		if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 and (NoTextFits or not HasUISizeConstraint and (IsXYMatch and AbsoluteSize.X < PeekResult.X or IsXYMatch1 and AbsoluteSize.Y < PeekResult.Y)) then
			local Text: string = `{AbsoluteSize.X},{AbsoluteSize.Y},{PeekResult.X},{PeekResult.Y},{XY.Value},{Label.Text}`
			
			if Text == v2 then return end
			v2 = Text
			
			if not HasUISizeConstraint and not NoCurrentOwner and Services.TextService ~= nil then
				NoCurrentOwner = true
				v36()
			end
			deferReflow()
		end
	end
	
	v46()
	
	local function buildWrapped(CellResult1, Callback)
		-- upvalues: TextMeasureModule (upval), FontFaceStyled (copy), Runtime (copy), Label (copy), HasAmbientModuleResult (copy), Compose (copy), CellResult (copy), AutomaticSize (ref), Enabled (ref), TypesEnum (copy), v55 (ref), textStyle (copy), Services (copy), Flag (ref), deferReflow (copy)
		local Count = 0
		local v3 = ""
		local Flag1 = true
		local HoldResult: (() -> ())? = nil
		local PrepareResult = TextMeasureModule.prepare(FontFaceStyled)
		
		local function _()
			-- upvalues: HoldResult (ref)
			if HoldResult then
				HoldResult()
				HoldResult = nil
			end
		end
		
		local Text = Runtime.observe(Label, "Text", if HasAmbientModuleResult then { frame = true } else nil)
		local AbsoluteSize = Runtime.observe(Label, "AbsoluteSize", if HasAmbientModuleResult then { frame = true } else nil)
		Compose.cleanup(function()
			-- upvalues: Flag1 (ref), HoldResult (ref)
			Flag1 = false
			
			if HoldResult then
				HoldResult()
				HoldResult = nil
			end
		end)
		Compose.watch(function(Callback1)
			-- upvalues: CellResult (upval), AutomaticSize (upval), Enabled (upval), Label (upval), TypesEnum (upval), Count (ref), v3 (ref), CellResult1 (copy), v55 (upval), HoldResult (ref), AbsoluteSize (copy), Callback (copy), Text (copy), textStyle (upval), TextMeasureModule (upval), PrepareResult (copy), Services (upval), Flag1 (ref), Flag (upval), deferReflow (upval)
			Callback1(CellResult)
			local AutomaticSize1 = AutomaticSize
			
			if Enabled == nil then
				Enabled = Label:GetStyled("TextWrapped") == true
			end
			if Enabled == true and (AutomaticSize1 == TypesEnum.AutomaticSize.Y or AutomaticSize1 == TypesEnum.AutomaticSize.XY) then
				local CallbackResult = Callback1(AbsoluteSize)
				assert(typeof(CallbackResult) == "Vector2")
				local XRatio = CallbackResult.X / Callback1(Callback())
				local UIPadding = Label:FindFirstChildWhichIsA("UIPadding")
				
				if UIPadding then
					local PaddingLeftStyled = UIPadding:GetStyled("PaddingLeft")
					local PaddingRightStyled = UIPadding:GetStyled("PaddingRight")
					XRatio -= PaddingLeftStyled.Offset + PaddingRightStyled.Offset + XRatio * (PaddingLeftStyled.Scale + PaddingRightStyled.Scale)
				end
				local CallbackResult1 = Callback1(Text)
				assert(type(CallbackResult1) == "string")
				local TextStyleResult = textStyle()
				local Face = TextStyleResult.face
				local Size = TextStyleResult.size
				local LineHeight = TextStyleResult.lineHeight
				
				if XRatio <= 0 or CallbackResult1 == "" then
					Count += 1
					v3 = ""
					CellResult1:set(0)
					v55()
					
					if HoldResult then
						HoldResult()
						HoldResult = nil
					end
					return
				else
					local Text1: string = `{XRatio}|{CallbackResult1}|{Size}|{LineHeight}|{Face.Family}|{Face.Weight.Name}|{Face.Style.Name}`
					
					if Text1 == v3 then return end
					v3 = Text1
					Count += 1
					local Count1: number = Count
					
					if HoldResult then
						HoldResult()
						HoldResult = nil
					end
					HoldResult = TextMeasureModule.hold(Label)
					local PrepareResultResult, PrepareResultResult2 = PrepareResult(CallbackResult1, TextStyleResult.rich, Face, Size, XRatio)
					local TextService = assert(Services.TextService)
					
					local function measure()
						-- upvalues: TextService (copy), PrepareResultResult (copy), PrepareResultResult2 (copy), Flag1 (upval), Flag (upval), Count1 (copy), Count (upval), Size (copy), Label (upval), LineHeight (copy), CellResult1 (upval), v55 (upval), deferReflow (upval), HoldResult (upval)
						local Success, Result = pcall(function()
							-- upvalues: TextService (upval), PrepareResultResult (upval)
							return TextService:GetTextBoundsAsync(PrepareResultResult)
						end)
						PrepareResultResult2()
						
						if Success and Flag1 and Flag and Count1 == Count and Result.Y > 0 then
							local UIPadding = Label:FindFirstChildWhichIsA("UIPadding")
							local NewY = Result.Y + math.ceil((math.max(1, (math.round(Result.Y / Size))) - 1) * Size * (math.max(LineHeight, 1) - 1)) + (if UIPadding then UIPadding:GetStyled("PaddingTop").Offset + UIPadding:GetStyled("PaddingBottom").Offset else 0)
							local IsNewYBelow = NewY < CellResult1:peek()
							CellResult1:set(NewY)
							v55()
							
							if IsNewYBelow then
								deferReflow()
							end
						end
						if Count1 == Count and HoldResult then
							HoldResult()
							HoldResult = nil
						end
					end
					
					if task and task.spawn then
						task.spawn(measure)
						
						return
					else
						measure()
						
						return
					end
				end
			else
				Count += 1
				v3 = ""
				CellResult1:set(0)
				v55()
				
				if HoldResult then
					HoldResult()
					HoldResult = nil
				end
			end
		end)
	end
	
	local function buildFloor(CellResult2, Callback: (any) -> ())
		-- upvalues: Compose (copy), FontFaceStyled (copy), Label (copy), Services (copy), TextMeasureModule (upval), Connection (copy), textStyle (copy), v55 (ref), CurrentOwner1_1 (ref), Text (ref), Host (copy), CellResult (copy), AutomaticSize (ref), Size (ref), CellResult1 (copy), p1 (copy), TypesEnum (copy), Types (copy), UISizeConstraint (ref)
		local TextBoundsUnit = nil
		local BindOwnerResult = Compose.bindOwner(function()
			-- upvalues: TextBoundsUnit (ref), FontFaceStyled (upval), Label (upval)
			TextBoundsUnit = FontFaceStyled.layoutUnit(Label, "TextBoundsUnit")
		end)
		
		local function unit()
			-- upvalues: TextBoundsUnit (ref), BindOwnerResult (copy)
			if TextBoundsUnit == nil then
				BindOwnerResult()
			end
			return assert(TextBoundsUnit)
		end
		
		Callback(unit)
		local InlineResult: (any) -> () = if Services.TextService then TextMeasureModule.inline(FontFaceStyled, Label, Connection, textStyle, function()
			-- upvalues: v55 (upval)
			v55()
		end) else nil
		
		if InlineResult and Connection and CurrentOwner1_1 ~= Text then
			InlineResult(CurrentOwner1_1)
		end
		local Object = Host.UISizeConstraint("TextBoundsFloor")({})
		local MinSize = Object.MinSize
		local MaxSize = Object.MaxSize
		local Vector = nil
		local PeekResult = -1
		local Largest = 0
		local Largest1 = 0
		local Key = ""
		local Text1 = Text
		local Flag = false
		local Length: number = utf8.len(Text1) or #Text1
		local v3 = 0
		local v4 = 0
		local NewOffset = 0
		local NewOffset1 = 0
		local Largest2 = 1
		local Largest3 = 1
		
		local function readInsets()
			-- upvalues: NewOffset (ref), NewOffset1 (ref), Largest2 (ref), Largest3 (ref), Label (upval)
			NewOffset = 0
			NewOffset1 = 0
			Largest2 = 1
			Largest3 = 1
			local UIPadding = Label:FindFirstChildWhichIsA("UIPadding")
			
			if UIPadding then
				local PaddingLeftStyled = UIPadding:GetStyled("PaddingLeft")
				local PaddingRightStyled = UIPadding:GetStyled("PaddingRight")
				local PaddingTopStyled = UIPadding:GetStyled("PaddingTop")
				local PaddingBottomStyled = UIPadding:GetStyled("PaddingBottom")
				NewOffset = PaddingLeftStyled.Offset + PaddingRightStyled.Offset
				NewOffset1 = PaddingTopStyled.Offset + PaddingBottomStyled.Offset
				Largest2 = math.max(1 - PaddingLeftStyled.Scale - PaddingRightStyled.Scale, 0.000001)
				Largest3 = math.max(1 - PaddingTopStyled.Scale - PaddingBottomStyled.Scale, 0.000001)
			end
		end
		
		local function apply(Callback)
			-- upvalues: CellResult (upval), CellResult2 (copy), InlineResult (copy), Text (upval), AutomaticSize (upval), Size (upval), CellResult1 (upval), Vector (ref), PeekResult (ref), p1 (upval), readInsets (copy), unit (copy), TextBoundsUnit (ref), BindOwnerResult (copy), textStyle (upval), TypesEnum (upval), Connection (upval), Key (ref), Largest (ref), Largest1 (ref), v3 (ref), v4 (ref), Flag (ref), Text1 (ref), Length (ref), NewOffset (ref), Largest2 (ref), NewOffset1 (ref), Largest3 (ref), MaxSize (ref), Types (upval), MinSize (ref), Object (copy)
			if Callback then
				Callback(CellResult)
			end
			local CallbackResult = if Callback then Callback(CellResult2) else CellResult2:peek()
			local Height = CallbackResult.height
			
			if CallbackResult.free == nil and Height == nil then return end
			local InlineResultResult = if InlineResult and CallbackResult.free then InlineResult(Text) else nil
			local XY = AutomaticSize
			local Vector1 = Size
			local InlineResultResult1 = InlineResultResult or (if Callback then Callback(CellResult1) else CellResult1:peek())
			
			if InlineResultResult and InlineResultResult1 == Vector and CellResult:peek() == PeekResult then return end
			if not p1 or PeekResult ~= CellResult:peek() then
				readInsets()
			end
			Vector = InlineResultResult
			PeekResult = CellResult:peek()
			local PeekResult1 = nil
			
			if InlineResultResult then
				PeekResult1 = 1
			elseif Callback then
				PeekResult1 = Callback(unit())
			else
				if TextBoundsUnit == nil then
					BindOwnerResult()
				end
				PeekResult1 = assert(TextBoundsUnit):peek()
			end
			local XRatio = InlineResultResult1.X / PeekResult1
			local YRatio = InlineResultResult1.Y / PeekResult1
			local TextStyleResult = textStyle()
			local IsTruncateMatch: boolean = not TextStyleResult.wrapped and TextStyleResult.truncate == TypesEnum.TextTruncate.None
			local IsTruncateMatch1: boolean = (XY == TypesEnum.AutomaticSize.X or XY == TypesEnum.AutomaticSize.XY) and IsTruncateMatch
			local NoInlineResultResult: boolean = (XY == TypesEnum.AutomaticSize.Y or XY == TypesEnum.AutomaticSize.XY) and IsTruncateMatch and (InlineResultResult == nil or TextStyleResult.lineHeight == 1)
			local IsXRatioBelow = XRatio < 1e999
			local IsXRatioBelow1: boolean = IsTruncateMatch1 and IsXRatioBelow
			local IsXRatioBelow2: boolean = NoInlineResultResult and IsXRatioBelow
			local XRatio1: number = if InlineResultResult then XRatio else math.ceil(XRatio)
			local YRatio1 = if InlineResultResult then YRatio else math.ceil(YRatio)
			
			if Connection and InlineResultResult == nil then
				local Key1 = TextStyleResult.key
				
				if Key1 ~= Key then
					Largest = 0
					Largest1 = 0
					Key = Key1
					v3 = 0
					v4 = 0
					Flag = false
				end
				if Text1 ~= Text then
					local Length1: number = utf8.len(Text) or #Text
					
					if Length1 == Length then
						Largest = math.max(Largest, v3)
						Largest1 = math.max(Largest1, v4)
					else
						Largest = 0
						Largest1 = 0
					end
					Text1 = Text
					Length = Length1
					Flag = true
				end
				if not Flag then
					Largest = 0
					Largest1 = 0
				end
				v3 = XRatio1
				v4 = YRatio1
				
				if IsXRatioBelow1 then
					XRatio1 = math.max(Largest, XRatio1)
				end
				if IsXRatioBelow2 then
					YRatio1 = math.max(Largest1, YRatio1)
				end
			end
			local XRatioRatio = (XRatio1 + NewOffset) / Largest2
			local YRatioRatio = (YRatio1 + NewOffset1) / Largest3
			local Largest4: number = if IsXRatioBelow1 and XRatio > 0 and Vector1.X.Scale == 0 then math.max(XRatioRatio, Vector1.X.Offset) else 1e999
			local Largest5: number = if IsXRatioBelow2 and YRatio > 0 and Vector1.Y.Scale == 0 then math.max(YRatioRatio, Vector1.Y.Offset) else 1e999
			local XRatioRatio1: number = if IsXRatioBelow1 then XRatioRatio else 0
			local YRatioRatio1 = if IsXRatioBelow2 then YRatioRatio elseif Height then if Callback then Callback(Height) else Height:peek() else 0
			local MaxSize1 = if MaxSize.X == Largest4 and MaxSize.Y == Largest5 then MaxSize else Types.Vector2.new(Largest4, Largest5)
			local MinSize1 = if MinSize.X == XRatioRatio1 and MinSize.Y == YRatioRatio1 then MinSize else Types.Vector2.new(XRatioRatio1, YRatioRatio1)
			local MinSize2 = MinSize
			
			if MinSize2.X <= MaxSize1.X and MinSize2.Y <= MaxSize1.Y then
				if MaxSize ~= MaxSize1 then
					Object.MaxSize = MaxSize1
				end
				if MinSize2 ~= MinSize1 then
					Object.MinSize = MinSize1
				end
			else
				Object.MinSize = MinSize1
				
				if MaxSize ~= MaxSize1 then
					Object.MaxSize = MaxSize1
				end
			end
			MinSize = MinSize1
			MaxSize = MaxSize1
		end
		
		if Services.TextService then
			v55 = function()
				-- upvalues: apply (copy)
				apply(nil)
			end
			
			Compose.cleanup(function()
				-- upvalues: v55 (upval)
				v55 = function() end
			end)
			apply(nil)
		else
			Compose.watch(apply)
		end
		UISizeConstraint = Object
		Object.Parent = Label
		Compose.cleanup(function()
			-- upvalues: UISizeConstraint (upval), Object (copy)
			if UISizeConstraint == Object then
				UISizeConstraint = nil
			end
			Object:Destroy()
		end)
	end
	
	if Label:FindFirstChildWhichIsA("UISizeConstraint") == nil then
		local Flag4 = false
		local v3 = "none"
		local v4 = nil
		local v5 = nil
		local CellResult2 = Compose.cell({})
		local v6 = nil
		local BindOwnerResult = Compose.bindOwner(function(p2)
			-- upvalues: Compose (copy), Runtime (copy)
			return Compose.createRootOwner(p2, Runtime.reactor)
		end)
		
		local _ = function()
			-- upvalues: v5 (ref), v4 (ref)
			local v7 = v5
			local v8 = v4
			v5 = nil
			v4 = nil
			
			if v7 then
				v7.dispose()
			end
			if v8 then
				v8.dispose()
			end
		end
		
		v36 = function()
			-- upvalues: Flag4 (ref), Flag (ref), Services (copy), AutomaticSize (ref), TypesEnum (copy), UISizeConstraint (ref), Enabled (ref), Label (copy), NoCurrentOwner (ref), Size (ref), textStyle (copy), v3 (ref), v5 (ref), v4 (ref), CellResult2 (copy), BindOwnerResult (copy), buildFloor (copy), v6 (ref), Compose (copy), buildWrapped (copy), v55 (ref)
			local v7 = "none"
			repeat
				if Flag4 or not Flag then break end
				local HasTextService = Services.TextService ~= nil
				local XY = AutomaticSize
				local IsXYMatch: boolean = XY == TypesEnum.AutomaticSize.X or XY == TypesEnum.AutomaticSize.XY
				local IsXYMatch1: boolean = XY == TypesEnum.AutomaticSize.Y or XY == TypesEnum.AutomaticSize.XY
				local IsXYMatch2: boolean = UISizeConstraint ~= nil and XY == TypesEnum.AutomaticSize.None
				
				if HasTextService then
					if Enabled == nil then
						Enabled = Label:GetStyled("TextWrapped") == true
					end
					if Enabled == true and (IsXYMatch1 or IsXYMatch2) then
						v7 = "wrapped"
						break
					end
				end
				if not NoCurrentOwner and HasTextService or not IsXYMatch and (not IsXYMatch1 or Size.X.Scale ~= 0) and not IsXYMatch2 then break end
				if Enabled == nil then
					Enabled = Label:GetStyled("TextWrapped") == true
				end
				if Enabled == true or textStyle().truncate ~= TypesEnum.TextTruncate.None then break end
				v7 = "free"
			until true
			if v7 == v3 then return end
			v3 = v7
			
			if v7 == "none" then
				local v8 = v5
				local v9 = v4
				v5 = nil
				v4 = nil
				
				if v8 then
					v8.dispose()
				end
				if v9 then
					v9.dispose()
				end
				CellResult2:set({})
				
				return
			else
				if v5 then
					local v10 = v5
					v5 = nil
					v10.dispose()
				end
				if v4 == nil then
					CellResult2:set(if v7 == "free" then { free = true } else {})
					v4 = BindOwnerResult(function()
						-- upvalues: buildFloor (upval), CellResult2 (upval), v6 (upval)
						buildFloor(CellResult2, function(p2)
							-- upvalues: v6 (upval)
							v6 = p2
						end)
					end)
				end
				if v7 == "wrapped" then
					v5 = BindOwnerResult(function()
						-- upvalues: Compose (upval), buildWrapped (upval), v6 (upval), CellResult2 (upval), v55 (upval)
						local CellResult = Compose.cell(0)
						buildWrapped(CellResult, assert(v6))
						CellResult2:set({ height = CellResult })
						v55()
					end)
					
					return
				end
				if not CellResult2:peek().free then
					CellResult2:set({ free = true })
					v55()
				end
			end
		end
		
		local ChildAddedConnection = Label.ChildAdded:Connect(function(Child)
			-- upvalues: UISizeConstraint (ref), Flag4 (ref), v36 (ref)
			if Child ~= UISizeConstraint and Child:IsA("UISizeConstraint") and not Flag4 then
				Flag4 = true
				v36()
			end
		end)
		Compose.cleanup(function()
			-- upvalues: ChildAddedConnection (copy), v5 (ref), v4 (ref)
			ChildAddedConnection:Disconnect()
			local v7 = v5
			local v8 = v4
			v5 = nil
			v4 = nil
			
			if v7 then
				v7.dispose()
			end
			if v8 then
				v8.dispose()
			end
		end)
		v36()
	end
	Compose.cleanup(function()
		-- upvalues: Flag (ref), StyledPropertiesChangedConnection (copy), TextChangesModuleResult (copy), PreRenderConnection (ref)
		Flag = false
		StyledPropertiesChangedConnection:Disconnect()
		TextChangesModuleResult()
		
		if PreRenderConnection then
			PreRenderConnection:Disconnect()
			PreRenderConnection = nil
		end
	end)
end

local function attachLayout(p2, Frame: Frame, p3, p4, p5, IsValue)
	-- upvalues: attachLayout (copy), TextChangesModule (copy), attachMeasuredLayout (copy)
	local function _(): boolean
		-- upvalues: Frame (copy), p2 (copy)
		local AutomaticSize = Frame.AutomaticSize
		local Size = Frame.Size
		
		return AutomaticSize ~= p2.types.Enum.AutomaticSize.None and (AutomaticSize ~= p2.types.Enum.AutomaticSize.Y or (Size.X.Scale == 0 or Frame:GetStyled("TextWrapped") == true))
	end
	
	local AutomaticSize = Frame.AutomaticSize
	local Size = Frame.Size
	
	if AutomaticSize == p2.types.Enum.AutomaticSize.None or AutomaticSize == p2.types.Enum.AutomaticSize.Y and (Size.X.Scale ~= 0 and Frame:GetStyled("TextWrapped") ~= true) then
		local TypesEnum = p2.types.Enum
		local FontFaceStyled = Frame:GetStyled("FontFace")
		local TextSizeStyled = Frame:GetStyled("TextSize")
		local PreRenderConnection = nil
		local Flag = false
		local CurrentOwner = true
		
		local _ = function()
			-- upvalues: PreRenderConnection (ref)
			if PreRenderConnection then
				PreRenderConnection:Disconnect()
				PreRenderConnection = nil
			end
		end
		
		local function reflow(Enabled)
			-- upvalues: Frame (copy), CurrentOwner (ref), Flag (ref), TypesEnum (copy), FontFaceStyled (ref), TextSizeStyled (ref)
			local AutomaticSize = Frame.AutomaticSize
			
			if not CurrentOwner or Flag or AutomaticSize == TypesEnum.AutomaticSize.None then return end
			Flag = true
			local IsNotFontFaceMatch: boolean = Enabled == true and Frame.FontFace ~= FontFaceStyled
			local IsNotTextSizeMatch: boolean = Enabled == true and Frame.TextSize ~= TextSizeStyled
			
			if IsNotFontFaceMatch then
				Frame.FontFace = FontFaceStyled
			end
			if IsNotTextSizeMatch then
				Frame.TextSize = TextSizeStyled
			end
			Frame.AutomaticSize = TypesEnum.AutomaticSize.None
			Frame.AutomaticSize = AutomaticSize
			
			if IsNotFontFaceMatch then
				Frame:ResetPropertyToDefault("FontFace")
			end
			if IsNotTextSizeMatch then
				Frame:ResetPropertyToDefault("TextSize")
			end
			Flag = false
		end
		
		local function refreshMetrics()
			-- upvalues: Frame (copy), FontFaceStyled (ref), TextSizeStyled (ref), TypesEnum (copy), reflow (copy), p2 (copy), PreRenderConnection (ref)
			local FontFaceStyled1 = Frame:GetStyled("FontFace")
			local TextSizeStyled1 = Frame:GetStyled("TextSize")
			local IsNotFontFaceStyledMatch: boolean = FontFaceStyled ~= FontFaceStyled1 or TextSizeStyled ~= TextSizeStyled1
			FontFaceStyled = FontFaceStyled1
			TextSizeStyled = TextSizeStyled1
			
			if not IsNotFontFaceStyledMatch or Frame.AutomaticSize == TypesEnum.AutomaticSize.None then return end
			reflow()
			local RunService = p2.config.services.RunService
			
			if PreRenderConnection == nil and RunService then
				local function apply()
					-- upvalues: PreRenderConnection (upval), reflow (upval)
					if PreRenderConnection then
						PreRenderConnection:Disconnect()
						PreRenderConnection = nil
					end
					reflow(true)
				end
				
				PreRenderConnection = if RunService.PreRender then RunService.PreRender:Connect(apply) else RunService.Heartbeat:Connect(apply)
			end
		end
		
		local BindOwnerResult = p2.Compose.bindOwner(function()
			-- upvalues: attachLayout (upval), p2 (copy), Frame (copy), p3 (copy), p4 (copy), p5 (copy), IsValue (copy)
			attachLayout(p2, Frame, p3, p4, p5, IsValue)
		end)
		local Callback2 = nil
		Callback2 = TextChangesModule(p2, Frame, function(p6)
			-- upvalues: Flag (ref), refreshMetrics (copy), Frame (copy), p2 (copy), PreRenderConnection (ref), Callback2 (ref), BindOwnerResult (copy)
			if Flag then return end
			if p6 == "FontFace" or p6 == "TextSize" then
				refreshMetrics()
			end
			if p6 == "AutomaticSize" or p6 == "Size" or p6 == "TextWrapped" then
				local AutomaticSize = Frame.AutomaticSize
				local Size = Frame.Size
				
				if AutomaticSize ~= p2.types.Enum.AutomaticSize.None and (AutomaticSize ~= p2.types.Enum.AutomaticSize.Y or (Size.X.Scale == 0 or Frame:GetStyled("TextWrapped") == true)) then
					if PreRenderConnection then
						PreRenderConnection:Disconnect()
						PreRenderConnection = nil
					end
					local Callback: () -> () = Callback2
					Callback2 = nil
					
					if Callback then
						Callback()
					end
					BindOwnerResult()
				end
			end
		end, function()
			-- upvalues: CurrentOwner (ref), PreRenderConnection (ref)
			CurrentOwner = false
			
			if PreRenderConnection then
				PreRenderConnection:Disconnect()
				PreRenderConnection = nil
			end
		end)
		
		return
	end
	if p5 and not IsValue and p2.config.services.TextService then
		local TextSizeStyled = "TextWrapped"
		
		if Frame:GetStyled(TextSizeStyled) ~= true then
			TextSizeStyled = "FontFace"
			local Styled = Frame:GetStyled(TextSizeStyled)
			local PreRenderConnection = "TextSize"
			local FontFaceStyled = Frame:GetStyled(PreRenderConnection)
			TextSizeStyled = Frame.FontFace
			
			if Styled == TextSizeStyled then
				TextSizeStyled = Frame.TextSize
				
				if FontFaceStyled == TextSizeStyled then
					TextSizeStyled = p2.Compose
					PreRenderConnection = p2.types
					PreRenderConnection = PreRenderConnection.Enum
					local CurrentOwner = TextSizeStyled.currentOwner
					local Flag = assert
					Flag = Flag(CurrentOwner())
					CurrentOwner = Frame.Text
					local Callback1: (() -> ())? = nil
					local Connection = nil
					local Flag1 = false
					
					local function release()
						-- upvalues: Callback1 (ref), Connection (ref)
						if Callback1 then
							Callback1()
							Callback1 = nil
						end
						if Connection then
							Connection:Disconnect()
							Connection = nil
						end
					end
					
					local function Callback2(...)
						-- upvalues: Flag1 (ref), Frame (copy), PreRenderConnection (copy), Styled (copy), FontFaceStyled (copy), Callback1 (ref), Connection (ref), TextSizeStyled (copy), Flag (copy), attachMeasuredLayout (upval), p2 (copy), p3 (copy), p4 (copy), IsValue (copy), CurrentOwner (copy)
						local v7 = (...)
						
						if Flag1 then return end
						if v7 == nil or v7 == "AbsoluteSize" or v7 == "TextBounds" then
							Flag1 = true
							local AutomaticSize = Frame.AutomaticSize
							local TextBounds = Frame.TextBounds
							local AbsoluteSize = Frame.AbsoluteSize
							local IsAutomaticSizeMatch: boolean = AutomaticSize == PreRenderConnection.AutomaticSize.X or AutomaticSize == PreRenderConnection.AutomaticSize.XY
							local IsAutomaticSizeMatch1: boolean = AutomaticSize == PreRenderConnection.AutomaticSize.Y or AutomaticSize == PreRenderConnection.AutomaticSize.XY
							local NoTextFits: boolean = IsAutomaticSizeMatch and (TextBounds.X > 0 and (TextBounds.Y > 0 and (TextBounds.X <= AbsoluteSize.X and TextBounds.Y <= AbsoluteSize.Y)) and not Frame.TextFits)
							Flag1 = false
							
							if (AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 or not NoTextFits and ((not IsAutomaticSizeMatch or AbsoluteSize.X >= TextBounds.X) and (not IsAutomaticSizeMatch1 or AbsoluteSize.Y >= TextBounds.Y))) and (v7 ~= nil or Frame:GetStyled("TextWrapped") ~= true and Frame:GetStyled("FontFace") == Styled and Frame:GetStyled("TextSize") == FontFaceStyled) then return end
						elseif v7 ~= "Text" and v7 ~= "FontFace" and v7 ~= "TextSize" and v7 ~= "AutomaticSize" and v7 ~= "Size" and v7 ~= "TextWrapped" and v7 ~= "TextTruncate" and v7 ~= "LineHeight" and v7 ~= "RichText" then return end
						if Callback1 then
							Callback1()
							Callback1 = nil
						end
						if Connection then
							Connection:Disconnect()
							Connection = nil
						end
						TextSizeStyled.withOwner(Flag, function()
							-- upvalues: attachMeasuredLayout (upval), p2 (upval), Frame (upval), p3 (upval), p4 (upval), v7 (copy), IsValue (upval), CurrentOwner (upval), Styled (upval), FontFaceStyled (upval)
							attachMeasuredLayout(p2, Frame, p3, p4, v7 ~= "Text", IsValue, CurrentOwner, Styled, FontFaceStyled)
						end)
					end
					
					local AfterLayoutResult = p2.afterLayout(function()
						-- upvalues: Callback1 (ref), Callback2 (copy)
						if Callback1 then
							Callback2("AbsoluteSize")
						end
					end)
					Callback1 = TextChangesModule(p2, Frame, function(p6)
						-- upvalues: AfterLayoutResult (copy), Callback2 (copy)
						if p6 == "AbsoluteSize" or p6 == "TextBounds" then
							AfterLayoutResult()
							
							return
						else
							Callback2(p6)
						end
					end)
					Connection = Frame.StyledPropertiesChanged:Connect(Callback2)
					TextSizeStyled.cleanup(release)
					Callback2("AbsoluteSize")
					
					return
				end
			end
		end
	end
	local FontFaceStyled = p2
	local TextSizeStyled = Frame
	local PreRenderConnection = p3
	local Flag = p4
	local CurrentOwner = p5
	local Callback1 = IsValue
	attachMeasuredLayout(FontFaceStyled, TextSizeStyled, PreRenderConnection, Flag, CurrentOwner, Callback1)
end

return function(p2, p3, _, p4, Callback)
	-- upvalues: LayoutKitModule (copy), attachLayout (copy), Frozen (copy), ThemeSupportModule (copy), config (copy), IconsModule (copy), IconStrokesModule (copy)
	local Compose = p2.Compose
	local Runtime = p2.runtime
	local Types = p2.types
	local Host = p2.Host
	local TypesEnum = Types.Enum
	
	local function _(Size)
		-- upvalues: TypesEnum (copy)
		return {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			Size = Size,
			AutomaticSize = TypesEnum.AutomaticSize.Y,
			TextXAlignment = TypesEnum.TextXAlignment.Left
		}
	end
	
	local config1 = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Text = "",
		Size = Types.UDim2.fromScale(1, 0),
		AutomaticSize = TypesEnum.AutomaticSize.Y,
		TextXAlignment = TypesEnum.TextXAlignment.Left
	}
	local config2 = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Text = "",
		Size = Types.UDim2.fromOffset(0, 0),
		AutomaticSize = TypesEnum.AutomaticSize.Y,
		TextXAlignment = TypesEnum.TextXAlignment.Left
	}
	
	local function applyRole(Object, ReadResult)
		-- upvalues: p4 (copy)
		local Value = ReadResult or "body"
		assert(table.find(p4.TYPE_ROLES, Value) ~= nil, `Facet text: unknown type role {Value}`)
		local Text = "facet-type-" .. Value
		
		for _, tag in Object:GetTags() do
			if tag ~= Text and string.sub(tag, 1, 11) == "facet-type-" then
				Object:RemoveTag(tag)
			end
		end
		if not Object:HasTag(Text) then
			Object:AddTag(Text)
		end
	end
	
	function p2.textRole(p5, Callback)
		-- upvalues: Compose (copy), applyRole (copy), p2 (copy)
		if Compose.isValue(Callback) or type(Callback) == "function" then
			Compose.watch(function(p6)
				-- upvalues: applyRole (upval), p5 (copy), p2 (upval), Callback (copy)
				applyRole(p5, p2.read(Callback, p6))
			end)
			
			return
		else
			applyRole(p5, Callback)
		end
	end
	
	local AttachResult = LayoutKitModule.attach(p2)
	
	function p2.textLayout(Frame, p5, p6, p7)
		-- upvalues: attachLayout (upval), p2 (copy)
		attachLayout(p2, Frame, p5, p6, p7)
	end
	
	function p2.padding(Left, Bottom)
		-- upvalues: AttachResult (copy)
		return assert(AttachResult.insets({ top = Bottom, right = Left, bottom = Bottom, left = Left }))
	end
	
	function p2.round(p5, ...)
		-- upvalues: p2 (copy), Types (copy)
		local v7 = (...)
		local NewResult = nil
		
		if p2.metric("radii.pill", p5) > 0 then
			NewResult = v7
			
			if not NewResult then
				return (Types.UDim.new(1, 0))
			end
		else
			NewResult = Types.UDim.new(0, 0)
		end
		return NewResult
	end
	
	function p2.corner(p5)
		-- upvalues: Host (copy), p2 (copy), Types (copy)
		return if p5 == nil then Host.UICorner({}) else Host.UICorner({
			CornerRadius = function(p6)
				-- upvalues: p2 (upval), Types (upval), p5 (copy)
				return p2.round(p6, Types.UDim.new(0, p5))
			end
		})
	end
	
	local t = {}
	
	function p2.layoutUnit(Parent, p5)
		-- upvalues: t (copy), Compose (copy), Host (copy), Types (copy), p2 (copy), Runtime (copy)
		local P44 = p5 or "LayoutUnit"
		local Entry = t[Parent]
		
		if Entry == nil then
			Entry = {}
			t[Parent] = Entry
		end
		local Entry1 = Entry[P44]
		
		if Entry1 == nil then
			local FormulaResult = nil
			Entry1 = {
				users = 0,
				value = FormulaResult,
				dispose = Compose.createRootOwner(function()
					-- upvalues: Host (upval), P44 (copy), Types (upval), Parent (copy), p2 (upval), FormulaResult (ref), Compose (upval)
					local v7 = Host.Frame(P44)({ Visible = false, Size = Types.UDim2.fromOffset(100, 1) })
					
					if Parent:IsA("ScrollingFrame") then
						Host.Folder(P44 .. "Container")({ v7 }).Parent = Parent
					else
						v7.Parent = Parent
					end
					local AbsoluteSizeResult = p2.observe.AbsoluteSize(v7)
					FormulaResult = Compose.formula(function(Callback): number
						-- upvalues: AbsoluteSizeResult (copy)
						local XRatio = Callback(AbsoluteSizeResult).X / 100
						
						return if XRatio > 0 then XRatio else 1
					end)
				end, Runtime.reactor).dispose
			}
			Entry[P44] = Entry1
		end
		local v7 = assert(Entry1)
		v7.users += 1
		Compose.cleanup(function()
			-- upvalues: v7 (copy), Entry (ref), P44 (copy), t (upval), Parent (copy)
			v7.users -= 1
			
			if v7.users > 0 then return end
			if Entry[P44] == v7 then
				Entry[P44] = nil
				
				if next(Entry) == nil and t[Parent] == Entry then
					t[Parent] = nil
				end
			end
			v7.dispose()
		end)
		
		return v7.value
	end
	
	function p2.layoutSize(Parent, p5)
		-- upvalues: p2 (copy), Compose (copy)
		local AbsoluteSizeResult = p2.observe.AbsoluteSize(Parent)
		local P46 = p5 or p2.layoutUnit(Parent)
		
		return Compose.formula(function(Callback)
			-- upvalues: AbsoluteSizeResult (copy), P46 (copy)
			return Callback(AbsoluteSizeResult) / Callback(P46)
		end)
	end
	
	function p2.layoutBounds(Parent, p5)
		-- upvalues: p2 (copy), Compose (copy)
		local TextBoundsResult = p2.observe.TextBounds(Parent)
		local P48 = p5 or p2.layoutUnit(Parent)
		
		return Compose.formula(function(Callback)
			-- upvalues: TextBoundsResult (copy), P48 (copy)
			return Callback(TextBoundsResult) / Callback(P48)
		end)
	end
	
	function p2.text(p5, p6, p7)
		-- upvalues: TypesEnum (copy), config1 (copy), config2 (copy), p2 (copy), Frozen (upval), Compose (copy), Host (copy), attachLayout (upval)
		local P49 = p5 or {}
		assert(p7 == nil or P49.TextSize == nil, "Facet text: pick the size with a type role or with a pixel TextSize, not both")
		local AutomaticSize = P49.AutomaticSize
		local PropsResult = p2.props(P49, Frozen, if AutomaticSize == nil or AutomaticSize == TypesEnum.AutomaticSize.Y then config1 else config2)
		local IsValue = Compose.isValue(PropsResult.Text) or type(PropsResult.Text) == "function"
		local Text = p2.styled(Host.TextLabel(PropsResult), "Text")
		
		if P49.TextSize == nil then
			p2.textRole(Text, p7)
		end
		attachLayout(p2, Text, p6, nil, true, IsValue)
		
		return Text
	end
	
	function p2.clampLines(Object, p5)
		-- upvalues: p2 (copy), Runtime (copy), Host (copy), Types (copy)
		local TextSizeResult = p2.observeStyled.TextSize(Object)
		local LineHeightResult = p2.observeStyled.LineHeight(Object)
		Runtime.mount(function()
			-- upvalues: Host (upval), Object (copy), Types (upval), p5 (copy), TextSizeResult (copy), LineHeightResult (copy)
			return Host.UISizeConstraint({
				Name = "LineClamp",
				MaxSize = function(Callback)
					-- upvalues: Object (upval), Types (upval), p5 (upval), TextSizeResult (upval), LineHeightResult (upval)
					local UIPadding = Object:FindFirstChildWhichIsA("UIPadding")
					
					return Types.Vector2.new(1e999, math.ceil(p5 * Callback(TextSizeResult) * Callback(LineHeightResult)) + (if UIPadding then UIPadding.PaddingTop.Offset + UIPadding.PaddingBottom.Offset else 0))
				end
			})
		end, Object)
	end
	
	function p2.row(ColumnResults, p5)
		-- upvalues: AttachResult (copy)
		return AttachResult.stack(ColumnResults, p5, { gap = 8 }, false)
	end
	
	function p2.column(Captions, p5)
		-- upvalues: AttachResult (copy)
		return AttachResult.stack(Captions, p5, { gap = 8 }, true)
	end
	
	function p2.listRow(p5)
		-- upvalues: Types (copy), TypesEnum (copy), p2 (copy), Host (copy), Runtime (copy), Callback (copy), p3 (copy), Compose (copy)
		for _, caption in p5.captions do
			if caption.Name == "Description" then
				caption:AddTag("facet-secondary")
			end
			if caption:IsA("TextLabel") then
				caption.Size = Types.UDim2.fromScale(1, 0)
				caption.AutomaticSize = TypesEnum.AutomaticSize.Y
				caption.TextWrapped = true
			end
		end
		local Copy = table.clone(p5.leading or {})
		table.insert(Copy, p2.column(p5.captions, {
			Name = "Captions",
			Size = Types.UDim2.new(0, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y,
			Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
		}))
		table.move(p5.trailing or {}, 1, #(p5.trailing or {}), #Copy + 1, Copy)
		local RowResult = p2.row(Copy, {
			Name = "Content",
			ZIndex = 1,
			Size = Types.UDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y,
			AnchorPoint = if p5.described then Types.Vector2.zero else Types.Vector2.new(0, 0.5),
			Position = Types.UDim2.fromScale(0, if p5.described then 0 else 0.5)
		})
		assert(RowResult:FindFirstChildWhichIsA("UIListLayout")).VerticalAlignment = TypesEnum.VerticalAlignment.Center
		local Trailing = p5.trailing or {}
		for _, Label in Trailing do
			if typeof(Label) == "Instance" and Label:IsA("TextLabel") then
				Label.TextWrapped = true
				Label.TextTruncate = TypesEnum.TextTruncate.None
				local LayoutSizeResult = p2.layoutSize(RowResult)
				Runtime.mount(function()
					-- upvalues: Host (upval), Types (upval), LayoutSizeResult (copy)
					return Host.UISizeConstraint("TrailingBounds")({
						MaxSize = function(Callback)
							-- upvalues: Types (upval), LayoutSizeResult (upval)
							return Types.Vector2.new(math.max(0, Callback(LayoutSizeResult).X / 2), 1e999)
						end
					})
				end, Label)
			end
		end
		local ControlSize = p5.controlSize
		
		local function height(p6)
			-- upvalues: Types (upval), p2 (upval), ControlSize (copy)
			return Types.UDim2.new(1, 0, 0, p2.controlSize(ControlSize, "height", p6))
		end
		
		return RowResult, if Callback(p3.theme) or Callback(ControlSize) then height else Types.UDim2.new(1, 0, 0, p2.controlSize(ControlSize, "height", nil)), function(Object)
			-- upvalues: RowResult (copy), TypesEnum (upval), p5 (copy), Types (upval), Runtime (upval), p2 (upval), ControlSize (copy), Callback (upval), Compose (upval)
			Object:AddTag("facet-list-row")
			local Captions = RowResult:FindFirstChild("Captions")
			assert(Captions and Captions:IsA("GuiObject"))
			local AutomaticSize = Object.AutomaticSize
			
			local function hug()
				-- upvalues: Object (copy), TypesEnum (upval), AutomaticSize (copy), RowResult (upval), Captions (copy), p5 (upval), Types (upval)
				local Parent = Object.Parent
				local AutomaticSize1 = if Parent and Parent:IsA("GuiObject") then Parent.AutomaticSize else nil
				local IsAutomaticSizeMatch: boolean = AutomaticSize1 == TypesEnum.AutomaticSize.X or AutomaticSize1 == TypesEnum.AutomaticSize.XY
				local XY = if IsAutomaticSizeMatch then TypesEnum.AutomaticSize.XY else TypesEnum.AutomaticSize.Y
				Object.AutomaticSize = if IsAutomaticSizeMatch then TypesEnum.AutomaticSize.XY else AutomaticSize
				RowResult.AutomaticSize = XY
				Captions.AutomaticSize = XY
				
				for _, caption in p5.captions do
					if caption:IsA("TextLabel") then
						caption.Size = Types.UDim2.fromScale(if IsAutomaticSizeMatch then 0 else 1, 0)
						caption.AutomaticSize = XY
					end
				end
			end
			
			Runtime.connect(Object, "AncestryChanged", hug)
			hug()
			
			local function tagRung(p6)
				-- upvalues: p2 (upval), ControlSize (upval), Object (copy)
				local ReadResult = p2.read(ControlSize, p6)
				
				for _, value in { "xsmall", "compact", "regular", "large" } do
					if ReadResult == value then
						Object:AddTag("facet-size-" .. value)
					elseif Object:HasTag("facet-size-" .. value) then
						Object:RemoveTag("facet-size-" .. value)
					end
				end
			end
			
			if Callback(ControlSize) then
				Compose.watch(tagRung)
				
				return
			else
				tagRung()
			end
		end
	end
	
	local function registry(p6)
		-- upvalues: p2 (copy), p3 (copy)
		local ReadResult = p2.read(p3.theme, p6) or {}
		local ReadResult1 = p2.read(p3.icons, p6)
		
		if ReadResult1 then
			ReadResult = { icons = ReadResult1, assets = ReadResult.assets }
		end
		return ReadResult
	end
	
	function p2.iconShows(Text: string): boolean
		-- upvalues: p4 (copy), registry (copy)
		return Text ~= "" and (string.match(Text, "^rbx") ~= nil or p4.resolveIcon(registry(), Text, "default") ~= nil)
	end
	
	function p2.iconVaries(p6): boolean
		-- upvalues: Callback (copy), p3 (copy), p2 (copy), registry (copy), p4 (copy)
		if p6 == nil then
			return false
		elseif Callback(p6) or Callback(p3.theme) or Callback(p3.icons) then
			return true
		else
			local ReadResult: string = p2.read(p6)
			
			if type(ReadResult) == "string" and ReadResult ~= "" and not string.match(ReadResult, "^rbx") then
				local RegistryResult = registry()
				local Default = p4.resolveIcon(RegistryResult, ReadResult, "default")
				
				return p4.resolveIcon(RegistryResult, ReadResult, "hover") ~= Default or (p4.resolveIcon(RegistryResult, ReadResult, "pressed") ~= Default or p4.resolveIcon(RegistryResult, ReadResult, "selected") ~= Default) or p4.resolveIcon(RegistryResult, ReadResult, "disabled") ~= Default
			else
				return false
			end
		end
	end
	
	local function glyphText(p6): string
		local Codepoint: number = p6.codepoint
		assert(type(Codepoint) == "number" and (Codepoint % 1 == 0 and Codepoint >= 0) and Codepoint <= 1114111, `Facet icon glyph codepoint {tostring(Codepoint)} must be an integer from 0 to 0x10FFFF`)
		
		return utf8.char(Codepoint)
	end
	
	local function glyphFace(p6)
		-- upvalues: ThemeSupportModule (upval), Types (copy)
		assert(p6.font ~= nil, "Facet icon glyph requires a font")
		
		return ThemeSupportModule.font(Types, p6.font)
	end
	
	local function glyphLabel(Icon, Callback, p6)
		-- upvalues: Runtime (copy), p2 (copy), config (upval), Types (copy), TypesEnum (copy), glyphText (copy), glyphFace (copy), ThemeSupportModule (upval), Host (copy)
		local Size = Runtime.observe(Icon, "Size")
		local AbsoluteSizeResult = p2.observe.AbsoluteSize(Icon)
		local ImageColor3 = Runtime.observe(Icon, "ImageColor3", config)
		local ImageTransparency = Runtime.observe(Icon, "ImageTransparency", config)
		local Label = {
			Name = "Glyph",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutoLocalize = false,
			TextScaled = false,
			TextWrapped = false,
			Size = Types.UDim2.fromScale(1, 1),
			TextXAlignment = TypesEnum.TextXAlignment.Center,
			TextYAlignment = TypesEnum.TextYAlignment.Center,
			TextColor3 = function(Callback)
				-- upvalues: ImageColor3 (copy)
				local CallbackResult = Callback(ImageColor3)
				assert(typeof(CallbackResult) == "Color3")
				
				return CallbackResult
			end,
			TextTransparency = function(Callback)
				-- upvalues: ImageTransparency (copy)
				local CallbackResult = Callback(ImageTransparency)
				assert(type(CallbackResult) == "number")
				
				return CallbackResult
			end
		}
		
		if p6 then
			local function Character(p7)
				-- upvalues: glyphText (upval), Callback (copy)
				return glyphText(Callback(p7))
			end
		else
			local Codepoint: number = Callback().codepoint
			assert(type(Codepoint) == "number" and (Codepoint % 1 == 0 and Codepoint >= 0) and Codepoint <= 1114111, `Facet icon glyph codepoint {tostring(Codepoint)} must be an integer from 0 to 0x10FFFF`)
			local Character: (any) -> any = utf8.char(Codepoint)
		end
		Label.Text = Character
		
		if p6 then
			local function FontResult(p7)
				-- upvalues: glyphFace (upval), Callback (copy)
				return glyphFace(Callback(p7))
			end
		else
			local CallbackResult = Callback()
			assert(CallbackResult.font ~= nil, "Facet icon glyph requires a font")
			local FontResult: (any) -> any = ThemeSupportModule.font(Types, CallbackResult.font)
		end
		Label.FontFace = FontResult
		
		function Label.TextSize(Callback): number
			-- upvalues: Size (copy), AbsoluteSizeResult (copy)
			local CallbackResult = Callback(Size)
			assert(typeof(CallbackResult) == "UDim2")
			local Smallest = math.min(CallbackResult.X.Offset, CallbackResult.Y.Offset)
			
			if Smallest > 0 then
				return Smallest
			else
				local CallbackResult1 = Callback(AbsoluteSizeResult)
				
				return (math.max(0, (math.round((math.min(CallbackResult1.X, CallbackResult1.Y))))))
			end
		end
		
		return p2.styled(Host.TextLabel(Label), "icon-glyph")
	end
	
	local _ = function(p6, p7)
		-- upvalues: Runtime (copy), Compose (copy), glyphLabel (copy)
		local v7 = nil
		
		local function current(p8)
			-- upvalues: p7 (copy), v7 (ref)
			local v8 = p7(p8)
			
			if type(v8) == "table" then
				v7 = v8
			end
			return assert(v7)
		end
		
		Runtime.mountFragment(function()
			-- upvalues: Compose (upval), p7 (copy), glyphLabel (upval), p6 (copy), current (copy)
			return {
				Compose.show(function(p8): boolean
					-- upvalues: p7 (upval)
					return type(p7(p8)) == "table"
				end, function()
					-- upvalues: glyphLabel (upval), p6 (upval), current (upval)
					return glyphLabel(p6, current, true)
				end)
			}
		end, p6)
	end
	
	local t2 = {}
	
	local function pointsOf(Key)
		-- upvalues: t2 (copy), Types (copy)
		local Entry = t2[Key]
		
		if Entry then
			return Entry
		end
		local List = {}
		
		for _, point in Key.points do
			table.insert(List, Types.Path2DControlPoint.new(Types.UDim2.fromScale(point[1], point[2]), Types.UDim2.new(), Types.UDim2.new()))
		end
		t2[Key] = List
		
		return List
	end
	
	local IconStrokes = {}
	
	local _ = function(p6): number
		local Size = p6.Size
		
		return (math.max(1, math.min(Size.X.Offset, Size.Y.Offset) / 12))
	end
	
	local function strokePath(Parent, Key, Largest)
		-- upvalues: IconStrokes (copy), p2 (copy), Host (copy), pointsOf (copy)
		local IconStroke = IconStrokes[Key]
		local IconStroke1 = nil
		
		if IconStroke and IconStroke.Parent ~= nil then
			IconStroke1 = IconStroke:Clone()
		else
			IconStroke1 = p2.styled(Host.Path2D({ Name = "Stroke", Closed = Key.closed }), "icon-stroke")
			IconStroke1:SetControlPoints((pointsOf(Key)))
			IconStrokes[Key] = IconStroke1
		end
		IconStroke1.Thickness = Largest
		IconStroke1.Parent = Parent
		
		return IconStroke1
	end
	
	local _ = function(Parent, List)
		-- upvalues: strokePath (copy)
		local Size = Parent.Size
		local Largest = math.max(1, math.min(Size.X.Offset, Size.Y.Offset) / 12)
		
		for _, value in List do
			strokePath(Parent, value, Largest)
		end
	end
	
	local _ = function(Text: string)
		-- upvalues: IconsModule (upval), IconStrokesModule (upval)
		return if type(Text) == "string" and IconsModule.registered(Text) then IconStrokesModule[Text] or IconStrokesModule[string.match(Text, "^(.+)%.fill$") or Text] else nil
	end
	
	local function armStrokes(Icon, Callback)
		-- upvalues: Compose (copy), IconsModule (upval), IconStrokesModule (upval), pointsOf (copy), strokePath (copy)
		local WithOwnerResults = {}
		local v7 = assert(Compose.currentOwner())
		Compose.watch(function(p6)
			-- upvalues: Callback (copy), IconsModule (upval), IconStrokesModule (upval), Icon (copy), WithOwnerResults (copy), pointsOf (upval), Compose (upval), v7 (copy), strokePath (upval)
			local CallbackResult: string = Callback(p6)
			local IconStrokesModuleEntry = (if type(CallbackResult) == "string" and IconsModule.registered(CallbackResult) then IconStrokesModule[CallbackResult] or IconStrokesModule[string.match(CallbackResult, "^(.+)%.fill$") or CallbackResult] else nil) or {}
			local Size = Icon.Size
			local Largest = math.max(1, math.min(Size.X.Offset, Size.Y.Offset) / 12)
			
			for i, value in IconStrokesModuleEntry do
				local WithOwnerResult = WithOwnerResults[i]
				
				if WithOwnerResult then
					WithOwnerResult.Closed = value.closed
					WithOwnerResult:SetControlPoints((pointsOf(value)))
				else
					WithOwnerResults[i] = Compose.withOwner(v7, function()
						-- upvalues: strokePath (upval), Icon (upval), value (copy), Largest (copy)
						return (strokePath(Icon, value, Largest))
					end)
				end
			end
			for i1 = #WithOwnerResults, #IconStrokesModuleEntry + 1, -1 do
				WithOwnerResults[i1]:Destroy()
				WithOwnerResults[i1] = nil
			end
		end)
		Compose.cleanup(function()
			-- upvalues: WithOwnerResults (copy)
			for _, withOwnerResult in WithOwnerResults do
				withOwnerResult:Destroy()
			end
		end)
	end
	
	function p2.icon(p7, p8, p9)
		-- upvalues: p2 (copy), p4 (copy), registry (copy), IconsModule (upval), Callback (copy), p3 (copy), Compose (copy), IconStrokesModule (upval), armStrokes (copy), Runtime (copy), glyphLabel (copy), Types (copy), TypesEnum (copy), Host (copy), Frozen (upval), strokePath (copy)
		local function resolve(p10, ReadResult)
			-- upvalues: p2 (upval), p7 (copy), p4 (upval), registry (upval), IconsModule (upval)
			local ReadResult1: string = p2.read(p7, p10)
			
			if ReadResult1 == nil or ReadResult1 == "" then
				return nil
			elseif type(ReadResult1) ~= "string" then
				return ReadResult1
			elseif string.match(ReadResult1, "^rbx") then
				return ReadResult1
			else
				local ResolveIconResult = p4.resolveIcon(registry(p10), ReadResult1, ReadResult)
				
				if ResolveIconResult == nil and IconsModule.registered(ReadResult1) then
					return nil
				else
					assert(ResolveIconResult ~= nil, `Facet icon {ReadResult1} requires an image asset or a font glyph`)
					
					return ResolveIconResult
				end
			end
		end
		
		local function resolved(p10)
			-- upvalues: resolve (copy), p2 (upval), p9 (copy)
			return (resolve(p10, p2.read(p9, p10)))
		end
		
		local CallbackResult = Callback(p7) or (Callback(p3.theme) or (Callback(p3.icons) or Callback(p9)))
		local CurrentOwnerResult = if CallbackResult then Compose.currentOwner() else nil
		local v8 = nil
		local Flag = false
		local Flag1 = false
		
		local function unsupplied(p10)
			-- upvalues: resolve (copy), p2 (upval), p9 (copy), p7 (copy)
			return if resolve(p10, p2.read(p9, p10)) == nil then p2.read(p7, p10) else nil
		end
		
		local function image(p10)
			-- upvalues: resolve (copy), p2 (upval), p9 (copy), Flag1 (ref), v8 (ref), CurrentOwnerResult (copy), p7 (copy), IconsModule (upval), IconStrokesModule (upval), Compose (upval), armStrokes (upval), unsupplied (copy), Flag (ref), resolved (copy), Runtime (upval), glyphLabel (upval)
			local ResolveResult = resolve(p10, p2.read(p9, p10))
			
			if type(ResolveResult) == "string" then
				return ResolveResult
			end
			if ResolveResult == nil and not Flag1 and v8 and CurrentOwnerResult then
				local ReadResult: string = p2.read(p7, p10)
				
				if if type(ReadResult) == "string" and IconsModule.registered(ReadResult) then IconStrokesModule[ReadResult] or IconStrokesModule[string.match(ReadResult, "^(.+)%.fill$") or ReadResult] else nil then
					Flag1 = true
					local v9 = v8
					Compose.withOwner(CurrentOwnerResult, function()
						-- upvalues: armStrokes (upval), v9 (copy), unsupplied (upval)
						armStrokes(v9, unsupplied)
					end)
				end
			end
			if ResolveResult ~= nil and not Flag and v8 and CurrentOwnerResult then
				Flag = true
				local v10 = v8
				Compose.withOwner(CurrentOwnerResult, function()
					-- upvalues: v10 (copy), resolved (upval), Runtime (upval), Compose (upval), glyphLabel (upval)
					local v11 = nil
					
					local function current(p11)
						-- upvalues: resolved (copy), v11 (ref)
						local v12 = resolved(p11)
						
						if type(v12) == "table" then
							v11 = v12
						end
						return assert(v11)
					end
					
					Runtime.mountFragment(function()
						-- upvalues: Compose (upval), resolved (copy), glyphLabel (upval), v10 (copy), current (copy)
						return {
							Compose.show(function(p11): boolean
								-- upvalues: resolved (upval)
								return type(resolved(p11)) == "table"
							end, function()
								-- upvalues: glyphLabel (upval), v10 (upval), current (upval)
								return glyphLabel(v10, current, true)
							end)
						}
					end, v10)
				end)
			end
			return ""
		end
		
		local ResolveResult = if CallbackResult then nil else resolve(nil, p2.read(p9, nil))
		local config = {
			BackgroundTransparency = 1,
			Image = if CallbackResult then image elseif type(ResolveResult) == "string" then ResolveResult else ""
		}
		
		local function iconSize(p10)
			-- upvalues: p2 (upval), p3 (upval), Types (upval)
			local IconSize = p2.controlSize(p3.controlSize, "iconSize", p10)
			
			return Types.UDim2.fromOffset(IconSize, IconSize)
		end
		
		local function resample(p10)
			-- upvalues: p2 (upval), p3 (upval), TypesEnum (upval)
			local ReadResult = p2.read(p3.theme, p10)
			
			return if ReadResult and ReadResult.identity.rendering == "pixel" then TypesEnum.ResamplerMode.Pixelated else TypesEnum.ResamplerMode.Default
		end
		
		local CallbackResult1 = Callback(p3.theme)
		local FromOffsetResult = nil
		
		if CallbackResult1 or Callback(p3.controlSize) then
			FromOffsetResult = iconSize
		else
			local IconSize = p2.controlSize(p3.controlSize, "iconSize", nil)
			FromOffsetResult = Types.UDim2.fromOffset(IconSize, IconSize)
		end
		config.Size = FromOffsetResult
		
		if CallbackResult1 then
			config.ResampleMode = resample
		else
			local ReadResult = p2.read(p3.theme, nil)
			
			if (if ReadResult and ReadResult.identity.rendering == "pixel" then TypesEnum.ResamplerMode.Pixelated else TypesEnum.ResamplerMode.Default) ~= TypesEnum.ResamplerMode.Default then
				local ReadResult1 = p2.read(p3.theme, nil)
				config.ResampleMode = if ReadResult1 and ReadResult1.identity.rendering == "pixel" then TypesEnum.ResamplerMode.Pixelated else TypesEnum.ResamplerMode.Default
			end
		end
		local Icon = p2.styled(Host.ImageLabel(p2.props(p8 or {}, Frozen, config)), "Icon")
		v8 = Icon
		repeat
			if type(ResolveResult) == "table" then
				Runtime.mount(function()
					-- upvalues: glyphLabel (upval), Icon (copy), ResolveResult (copy)
					return glyphLabel(Icon, function()
						-- upvalues: ResolveResult (upval)
						return ResolveResult
					end, false)
				end, Icon)
				break
			end
			if CallbackResult and type((resolve(nil, p2.read(p9, nil)))) == "table" then
				Flag = true
				local v9 = nil
				
				local function current(p10)
					-- upvalues: resolved (copy), v9 (ref)
					local v10 = resolved(p10)
					
					if type(v10) == "table" then
						v9 = v10
					end
					return assert(v9)
				end
				
				Runtime.mountFragment(function()
					-- upvalues: Compose (upval), resolved (copy), glyphLabel (upval), Icon (copy), current (copy)
					return {
						Compose.show(function(p10): boolean
							-- upvalues: resolved (upval)
							return type(resolved(p10)) == "table"
						end, function()
							-- upvalues: glyphLabel (upval), Icon (upval), current (upval)
							return glyphLabel(Icon, current, true)
						end)
					}
				end, Icon)
				break
			end
			if CallbackResult and resolve(nil, p2.read(p9, nil)) == nil then
				local ReadResult: string = p2.read(p7)
				
				if if type(ReadResult) == "string" and IconsModule.registered(ReadResult) then IconStrokesModule[ReadResult] or IconStrokesModule[string.match(ReadResult, "^(.+)%.fill$") or ReadResult] else nil then
					Flag1 = true
					armStrokes(Icon, unsupplied)
					break
				end
			end
			if CallbackResult or ResolveResult ~= nil then break end
			local ReadResult: string = p2.read(p7)
			local IconStrokesModuleEntry = if type(ReadResult) == "string" and IconsModule.registered(ReadResult) then IconStrokesModule[ReadResult] or IconStrokesModule[string.match(ReadResult, "^(.+)%.fill$") or ReadResult] else nil
			
			if not IconStrokesModuleEntry then break end
			local Size = Icon.Size
			local Largest = math.max(1, math.min(Size.X.Offset, Size.Y.Offset) / 12)
			
			for _, value in IconStrokesModuleEntry do
				strokePath(Icon, value, Largest)
			end
			break
		until true
		return Icon
	end
end