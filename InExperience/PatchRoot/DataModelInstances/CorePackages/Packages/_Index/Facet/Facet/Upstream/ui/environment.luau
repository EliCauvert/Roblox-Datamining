local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./environment_types")
local _ = require("./theme_types")
local AdaptiveModule = require("./adaptive")
local MotionModule = require("./motion")
local FreezeModule = require("./freeze")
local ThemeSupportModule = require("./theme_support")
local GameplayHoldModule = require("./gameplay_hold")
local ThemeDistanceModule = require("./theme_distance")
local SafeAreaModule = require("./safe_area")
local config = {
	target = true,
	padding = true,
	offscreen = true,
	occlusion = true,
	camera = true
}

local function _(Value: number): boolean
	return type(Value) == "number" and Value == Value and math.abs(Value) < 1e999
end

local _ = function(p1, p2)
	return if typeof(p1) == "EnumItem" then p1.Name else p2
end

local self = setmetatable({}, { __mode = "k" })

return function(p1, p2)
	-- upvalues: MotionModule (copy), ThemeSupportModule (copy), self (copy), AdaptiveModule (copy), FreezeModule (copy), SafeAreaModule (copy), ThemeDistanceModule (copy), GameplayHoldModule (copy), config (copy)
	local Compose = p1.Compose
	local Config = p1.config
	local Runtime = p1.runtime
	local TypesVector2 = p1.types.Vector2
	
	local function _(p3, p4, p5)
		-- upvalues: Compose (copy)
		if p3 ~= nil then
			local Success, Result = pcall(p4, p3)
			
			if Success then
				return Result
			end
		end
		return Compose.cell(p5)
	end
	
	local _ = function()
		-- upvalues: Config (copy)
		return Config.services.Workspace
	end
	
	function p2.focusRing(Key)
		-- upvalues: Compose (copy), p1 (copy), Config (copy), Runtime (copy), p2 (copy), MotionModule (upval), ThemeSupportModule (upval), self (upval)
		assert(Compose.currentOwner() ~= nil, "Facet UI.focusRing must run inside a component or Compose owner")
		local Host = p1.Host
		local TypesEnum = p1.types.Enum
		local TypesUDim = p1.types.UDim
		local TypesUDim2 = p1.types.UDim2
		local Services = Config.services
		local CellResult = Compose.cell(false)
		local CellResult1 = Compose.cell(false)
		local GamepadService = Config.services.GamepadService
		local GamepadCursorEnabled = p1.observe.GamepadCursorEnabled
		local CellResult2 = nil
		repeat
			if GamepadService ~= nil then
				local Success, Result = pcall(GamepadCursorEnabled, GamepadService)
				
				if Success then
					CellResult2 = Result
					break
				end
			end
			CellResult2 = Compose.cell(false)
		until true
		local function heard(Keyboard)
			-- upvalues: CellResult (copy), TypesEnum (copy), CellResult1 (copy)
			CellResult:set(Keyboard == TypesEnum.UserInputType.Keyboard or string.find(Keyboard.Name, "^Gamepad") ~= nil)
			CellResult1:set(Keyboard == TypesEnum.UserInputType.Touch or string.find(Keyboard.Name, "^Mouse") ~= nil)
		end
		
		local UserInputService = Services.UserInputService
		
		if UserInputService then
			local Success1, Result1 = pcall(function()
				-- upvalues: UserInputService (copy)
				return UserInputService:GetLastInputType()
			end)
			
			if Success1 and Result1 then
				heard(Result1)
			end
			Runtime.connect(UserInputService, "LastInputTypeChanged", heard)
		end
		local EnvironmentResult = p2.environment()
		local TenFootResult = p1.tenFoot()
		local ReducedResult = MotionModule.reduced(p1)
		local FormulaResult = Compose.formula(function(p3)
			-- upvalues: p1 (upval), Config (upval)
			return p1.read(Config.theme, p3)
		end)
		local FormulaResult1 = Compose.formula(function(Callback)
			-- upvalues: FormulaResult (copy)
			local CallbackResult = Callback(FormulaResult)
			local Chrome = if CallbackResult then CallbackResult.chrome else nil
			
			return (if Chrome then Chrome.focus else nil) or { kind = "ring" }
		end)
		
		local function _(Callback)
			-- upvalues: FormulaResult1 (copy)
			return Callback(FormulaResult1)
		end
		
		local _ = function(Callback)
			-- upvalues: CellResult2 (copy), CellResult (copy), EnvironmentResult (copy), CellResult1 (copy)
			return Callback(CellResult2) ~= true and (Callback(CellResult) or Callback(EnvironmentResult.effectiveInput) == "Gamepad" and not Callback(CellResult1))
		end
		
		local _ = function(p3, p4, p5)
			-- upvalues: TenFootResult (copy)
			return if TenFootResult(p3) then math.round(p4 * p5) else p4
		end
		
		local CellResult3 = Compose.cell(0)
		
		local _ = function(Callback, p3)
			-- upvalues: CellResult2 (copy), CellResult (copy), EnvironmentResult (copy), CellResult1 (copy), CellResult3 (copy)
			local CallbackResult = Callback(CellResult2) ~= true and (Callback(CellResult) or Callback(EnvironmentResult.effectiveInput) == "Gamepad" and not Callback(CellResult1))
			
			return if CallbackResult then Callback(CellResult3) * p3 else 1
		end
		
		local UICornerResult = Host.UICorner({})
		local FocusRingPaint = Host.Frame({
			Name = "FocusRingPaint",
			Visible = false,
			Size = TypesUDim2.fromOffset(0, 0),
			UICornerResult
		})
		FocusRingPaint:AddTag("facet-focus-ring")
		local BackgroundColor3Result = p1.observeStyled.BackgroundColor3(FocusRingPaint)
		local CornerRadiusResult = p1.observeStyled.CornerRadius(UICornerResult)
		local ObserveResult = if Config.guiService then p1.selection.observe() else Compose.cell(nil)
		local CellResult4 = Compose.cell(0)
		
		local function partOf(Gui)
			local FacetFocusPartAttribute = if Gui then Gui:GetAttribute("FacetFocusPart") else nil
			
			if type(FacetFocusPartAttribute) ~= "string" then
				return nil
			end
			local Gui1 = Gui
			
			for ChildName in string.gmatch(FacetFocusPartAttribute, "[^/]+") do
				if Gui1 == nil then
					Gui1 = nil
				elseif ChildName == ".." then
					Gui1 = Gui1.Parent
				else
					Gui1 = Gui1:FindFirstChild(ChildName)
				end
			end
			return if Gui1 and Gui1:IsA("GuiObject") then Gui1 else nil
		end
		
		local CellResult5 = Compose.cell(0)
		
		local function partShare(Frame: Frame)
			-- upvalues: partOf (copy), p1 (upval)
			local PartOfResult = partOf(Frame)
			
			if PartOfResult == nil or Frame == nil or not Frame:IsA("GuiObject") then
				return nil, nil
			end
			local AbsoluteSize = Frame.AbsoluteSize
			
			if AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 then
				return nil, nil
			else
				local AbsolutePositionDelta = PartOfResult.AbsolutePosition - Frame.AbsolutePosition
				
				return p1.types.Vector2.new(AbsolutePositionDelta.X / AbsoluteSize.X, AbsolutePositionDelta.Y / AbsoluteSize.Y), p1.types.Vector2.new(PartOfResult.AbsoluteSize.X / AbsoluteSize.X, PartOfResult.AbsoluteSize.Y / AbsoluteSize.Y)
			end
		end
		
		local Observation = Runtime.host.observation
		
		local function bump()
			-- upvalues: CellResult4 (copy)
			CellResult4:set(CellResult4:peek() + 1)
		end
		
		local AfterLayoutResult = p1.afterLayout(bump)
		Compose.watch(function(Callback)
			-- upvalues: ObserveResult (copy), CellResult5 (copy), Observation (copy), Compose (upval), AfterLayoutResult (copy), bump (copy), CellResult4 (copy), partOf (copy)
			local CallbackResult = Callback(ObserveResult)
			Callback(CellResult5)
			
			if Observation and CallbackResult and CallbackResult:IsA("GuiObject") then
				Compose.cleanup(Observation.observeProperty(CallbackResult, "AbsoluteSize", AfterLayoutResult))
				Compose.cleanup(Observation.observeProperty(CallbackResult, "SelectionImageObject", bump))
				local Connection = CallbackResult:GetAttributeChangedSignal("FacetFocusHeight"):Connect(bump)
				local Connection1 = CallbackResult:GetAttributeChangedSignal("FacetFocusPart"):Connect(function()
					-- upvalues: CellResult5 (upval), CellResult4 (upval)
					CellResult5:set(CellResult5:peek() + 1)
					CellResult4:set(CellResult4:peek() + 1)
				end)
				Compose.cleanup(function()
					-- upvalues: Connection (copy), Connection1 (copy)
					Connection:Disconnect()
					Connection1:Disconnect()
				end)
				local PartOfResult = partOf(CallbackResult)
				
				if PartOfResult then
					Compose.cleanup(Observation.observeProperty(PartOfResult, "AbsoluteSize", AfterLayoutResult))
					Compose.cleanup(Observation.observeProperty(PartOfResult, "AbsolutePosition", AfterLayoutResult))
					Compose.cleanup(Observation.observeProperty(CallbackResult, "AbsolutePosition", AfterLayoutResult))
				end
				local UICorner = (PartOfResult or CallbackResult):FindFirstChildWhichIsA("UICorner")
				
				if UICorner then
					Compose.cleanup(Observation.observeProperty(UICorner, "CornerRadius", bump))
				end
			end
		end)
		local TweenService = Config.services.TweenService
		
		if TweenService and Observation then
			Runtime.mountFragment(function()
				-- upvalues: Compose (upval), CellResult2 (copy), CellResult (copy), EnvironmentResult (copy), CellResult1 (copy), FormulaResult1 (copy), ReducedResult (copy), Runtime (upval), TweenService (copy), p1 (upval), TypesEnum (copy), Observation (copy), CellResult3 (copy)
				return {
					Compose.show(function(Callback): boolean
						-- upvalues: CellResult2 (upval), CellResult (upval), EnvironmentResult (upval), CellResult1 (upval), FormulaResult1 (upval), ReducedResult (upval)
						return Callback(CellResult2) ~= true and (Callback(CellResult) or Callback(EnvironmentResult.effectiveInput) == "Gamepad" and not Callback(CellResult1)) and (Callback(FormulaResult1).pulse == true and not ReducedResult(Callback))
					end, function()
						-- upvalues: Runtime (upval), TweenService (upval), p1 (upval), TypesEnum (upval), Observation (upval), CellResult3 (upval), Compose (upval)
						local FocusPulse = Runtime.host.render.createNode("NumberValue")
						assert(typeof(FocusPulse) == "Instance" and FocusPulse:IsA("NumberValue"))
						FocusPulse.Name = "FocusPulse"
						local Tween = TweenService:Create(FocusPulse, p1.types.TweenInfo.new(p1.metric("motion.durations.focusPulse"), p1.motionStyle("pulse"), TypesEnum.EasingDirection.InOut, -1, true), { Value = 1 })
						local Value = Observation.observeProperty(FocusPulse, "Value", function()
							-- upvalues: CellResult3 (upval), FocusPulse (copy)
							CellResult3:set(FocusPulse.Value)
						end)
						Tween:Play()
						Compose.cleanup(function()
							-- upvalues: Tween (copy), Value (copy), CellResult3 (upval)
							Tween:Cancel()
							Value()
							CellResult3:set(0)
						end)
						
						return FocusPulse
					end)
				}
			end, FocusRingPaint)
		end
		local function art(Callback)
			-- upvalues: FormulaResult (copy), FormulaResult1 (copy)
			local CallbackResult = Callback(FormulaResult)
			local CallbackResult1 = Callback(FormulaResult1)
			
			return if CallbackResult1.kind == "nineSlice" and type(CallbackResult1.asset) == "string" and CallbackResult ~= nil then (CallbackResult.assets or {})[CallbackResult1.asset] else nil
		end
		
		local _ = function(Callback)
			-- upvalues: FormulaResult1 (copy), TenFootResult (copy)
			local Outset = Callback(FormulaResult1).outset or 0
			
			return if TenFootResult(Callback) then math.round(Outset * 1.5) else Outset
		end
		
		local function thickness(Callback)
			-- upvalues: FormulaResult1 (copy), TenFootResult (copy)
			local CallbackResult = Callback(FormulaResult1)
			
			if CallbackResult.kind == "brackets" then
				local Thickness = CallbackResult.thickness or 4
				
				return if TenFootResult(Callback) then math.round(Thickness * 1.5) else Thickness
			else
				local Thickness = CallbackResult.thickness or 2
				
				return if TenFootResult(Callback) then math.round(Thickness * 2) else Thickness
			end
		end
		
		local function v70(Callback): number
			-- upvalues: TenFootResult (copy), FormulaResult1 (copy)
			local v1: number = if TenFootResult(Callback) then 3 else 0
			local Kind = Callback(FormulaResult1).kind
			local Rounded = nil
			
			if Kind == "ring" or Kind == "brackets" then
				local CallbackResult = Callback(FormulaResult1)
				
				if CallbackResult.kind == "brackets" then
					local Thickness = CallbackResult.thickness or 4
					Rounded = if TenFootResult(Callback) then math.round(Thickness * 1.5) else Thickness
				else
					local Thickness = CallbackResult.thickness or 2
					Rounded = if TenFootResult(Callback) then math.round(Thickness * 2) else Thickness
				end
			else
				Rounded = 0
			end
			local NewRounded = v1 + Rounded
			local Rounded1 = nil
			
			if Callback(FormulaResult1).kind == "ring" then
				Rounded1 = 0
			else
				local Outset = Callback(FormulaResult1).outset or 0
				Rounded1 = if TenFootResult(Callback) then math.round(Outset * 1.5) else Outset
			end
			return NewRounded + Rounded1
		end
		
		local config = {
			Name = "Glow",
			Color = BackgroundColor3Result,
			Enabled = function(Callback)
				-- upvalues: FormulaResult1 (copy), CellResult2 (copy), CellResult (copy), EnvironmentResult (copy), CellResult1 (copy)
				return Callback(FormulaResult1).kind == "glow" and (Callback(CellResult2) ~= true and (Callback(CellResult) or Callback(EnvironmentResult.effectiveInput) == "Gamepad" and not Callback(CellResult1)))
			end,
			BlurRadius = function(Callback)
				-- upvalues: FormulaResult1 (copy), TypesUDim (copy), TenFootResult (copy)
				local BlurRadius = Callback(FormulaResult1).blurRadius
				local Offset = (if BlurRadius then BlurRadius.offset else nil) or 24
				
				return TypesUDim.new(0, (math.round(if TenFootResult(Callback) then math.round(Offset * 1.6) else Offset)))
			end,
			Transparency = function(Callback): number
				-- upvalues: FormulaResult1 (copy), TenFootResult (copy), CellResult3 (copy)
				local Transparency = Callback(FormulaResult1).transparency or 0.25
				
				return (math.clamp((if TenFootResult(Callback) then Transparency * 0.55 else Transparency) + Callback(CellResult3) * 0.2, 0, 1))
			end,
			ZIndex = function(Callback)
				-- upvalues: FormulaResult1 (copy)
				return Callback(FormulaResult1).zIndex or -1
			end
		}
		local ImageLabelFunction = Host.ImageLabel
		local UICornerResult1 = Host.UICorner({
			CornerRadius = function(Callback)
				-- upvalues: FormulaResult1 (copy), art (copy), TypesUDim (copy), CellResult4 (copy), ObserveResult (copy), CornerRadiusResult (copy), partOf (copy), p1 (upval), v70 (copy)
				local Corner = Callback(FormulaResult1).corner
				
				if Corner == "square" or art(Callback) then
					return TypesUDim.new(0, 0)
				end
				if Corner == "pill" then
					return TypesUDim.new(0.5, 0)
				end
				Callback(CellResult4)
				local CallbackResult = Callback(ObserveResult)
				local CallbackResult1 = Callback(CornerRadiusResult)
				
				if CallbackResult then
					local UICorner = (partOf(CallbackResult) or CallbackResult):FindFirstChildWhichIsA("UICorner")
					
					if UICorner then
						CallbackResult1 = UICorner.CornerRadius
					else
						if CallbackResult:HasTag("facet-shape-circle") then
							return TypesUDim.new(0.5, 0)
						end
						if CallbackResult:HasTag("facet-chip") then
							CallbackResult1 = TypesUDim.new(0, p1.metric("radii.pill", Callback))
						end
					end
				end
				return if CallbackResult1.Scale > 0 then CallbackResult1 else TypesUDim.new(0, CallbackResult1.Offset + v70(Callback))
			end
		})
		local UIStrokeResult = Host.UIStroke({
			ApplyStrokeMode = TypesEnum.ApplyStrokeMode.Border,
			BorderStrokePosition = TypesEnum.BorderStrokePosition.Inner,
			Color = BackgroundColor3Result,
			Enabled = function(Callback): boolean
				-- upvalues: FormulaResult1 (copy)
				local Kind = Callback(FormulaResult1).kind
				
				return Kind == "ring" or Kind == "brackets"
			end,
			Thickness = thickness,
			Transparency = function(Callback)
				-- upvalues: CellResult2 (copy), CellResult (copy), EnvironmentResult (copy), CellResult1 (copy), CellResult3 (copy)
				local CallbackResult = Callback(CellResult2) ~= true and (Callback(CellResult) or Callback(EnvironmentResult.effectiveInput) == "Gamepad" and not Callback(CellResult1))
				
				return if CallbackResult then Callback(CellResult3) * 0.35 else 1
			end,
			Host.UIGradient({
				Name = "Brackets",
				Enabled = function(Callback): boolean
					-- upvalues: FormulaResult1 (copy)
					return Callback(FormulaResult1).kind == "brackets"
				end,
				Transparency = function(Callback)
					-- upvalues: FormulaResult1 (copy), CellResult4 (copy), ObserveResult (copy), partOf (copy), v70 (copy), TenFootResult (copy), p1 (upval)
					local CallbackResult = Callback(FormulaResult1)
					Callback(CellResult4)
					local CallbackResult1 = Callback(ObserveResult)
					local PartOfResult = partOf(CallbackResult1) or CallbackResult1
					local v1 = (if PartOfResult then PartOfResult.AbsoluteSize.X else 0) + 2 * v70(Callback)
					local Size = if type(CallbackResult.size) == "number" then CallbackResult.size else 12
					local Rounded = if TenFootResult(Callback) then math.round(Size * 1.5) else Size
					local ClampedValue: number = if v1 > 0 then math.clamp(Rounded / v1, 0.02, 0.45) else 0.2
					local NumberSequenceKeypoint = p1.types.NumberSequenceKeypoint
					
					return p1.types.NumberSequence.new({
						NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(ClampedValue, 0),
						NumberSequenceKeypoint.new(ClampedValue + 0.001, 1),
						NumberSequenceKeypoint.new(1 - ClampedValue - 0.001, 1),
						NumberSequenceKeypoint.new(1 - ClampedValue, 0),
						NumberSequenceKeypoint.new(1, 0)
					})
				end
			})
		})
		local Halo = Host.UIStroke({
			Name = "Halo",
			ZIndex = 0,
			ApplyStrokeMode = TypesEnum.ApplyStrokeMode.Border,
			BorderStrokePosition = TypesEnum.BorderStrokePosition.Outer,
			LineJoinMode = function(Callback)
				-- upvalues: FormulaResult1 (copy), TypesEnum (copy)
				return if Callback(FormulaResult1).corner == "square" then TypesEnum.LineJoinMode.Miter else TypesEnum.LineJoinMode.Round
			end,
			Color = function(Callback)
				-- upvalues: FormulaResult1 (copy), p1 (upval), BackgroundColor3Result (copy), ThemeSupportModule (upval)
				local Halo = Callback(FormulaResult1).halo
				
				if type(Halo) == "table" then
					return p1.types.Color3.new(Halo.r, Halo.g, Halo.b)
				else
					local CallbackResult = Callback(BackgroundColor3Result)
					local NewResult = p1.types.Color3.new(0, 0, 0)
					local NewResult1 = p1.types.Color3.new(1, 1, 1)
					
					return if ThemeSupportModule.contrast(CallbackResult, NewResult1) <= ThemeSupportModule.contrast(CallbackResult, NewResult) then NewResult else NewResult1
				end
			end,
			Enabled = function(Callback): boolean
				-- upvalues: FormulaResult1 (copy)
				return Callback(FormulaResult1).kind == "ring" and Callback(FormulaResult1).halo ~= false
			end,
			Thickness = function(Callback): number
				-- upvalues: FormulaResult1 (copy), TenFootResult (copy)
				local v1 = 1
				local CallbackResult = Callback(FormulaResult1)
				local Rounded = nil
				
				if CallbackResult.kind == "brackets" then
					local Thickness = CallbackResult.thickness or 4
					Rounded = if TenFootResult(Callback) then math.round(Thickness * 1.5) else Thickness
				else
					local Thickness = CallbackResult.thickness or 2
					Rounded = if TenFootResult(Callback) then math.round(Thickness * 2) else Thickness
				end
				return (math.max(v1, (math.round(Rounded / 2))))
			end,
			Transparency = function(Callback)
				-- upvalues: CellResult2 (copy), CellResult (copy), EnvironmentResult (copy), CellResult1 (copy), CellResult3 (copy)
				local CallbackResult = Callback(CellResult2) ~= true and (Callback(CellResult) or Callback(EnvironmentResult.effectiveInput) == "Gamepad" and not Callback(CellResult1))
				
				return if CallbackResult then Callback(CellResult3) * 0.35 else 1
			end
		})
		local UIShadowFunction = Host.UIShadow
		local Copy = table.clone(config)
		
		function Copy.Enabled(Callback)
			-- upvalues: ObserveResult (copy), FormulaResult1 (copy), CellResult2 (copy), CellResult (copy), EnvironmentResult (copy), CellResult1 (copy)
			return Callback(ObserveResult) == nil and Callback(FormulaResult1).kind == "glow" and (Callback(CellResult2) ~= true and (Callback(CellResult) or Callback(EnvironmentResult.effectiveInput) == "Gamepad" and not Callback(CellResult1)))
		end
		
		local FacetFocusRing = ImageLabelFunction({
			Name = "FacetFocusRing",
			BackgroundTransparency = 1,
			ScaleType = TypesEnum.ScaleType.Slice,
			Size = function(Callback)
				-- upvalues: v70 (copy), CellResult4 (copy), ObserveResult (copy), partShare (copy), TypesUDim2 (copy)
				local v1: number = v70(Callback)
				Callback(CellResult4)
				local CallbackResult = Callback(ObserveResult)
				local _, PartShareResult2 = partShare(CallbackResult)
				
				if PartShareResult2 then
					return TypesUDim2.new(PartShareResult2.X, 2 * v1, PartShareResult2.Y, 2 * v1)
				else
					local FacetFocusHeightAttribute = if CallbackResult then CallbackResult:GetAttribute("FacetFocusHeight") else nil
					
					return TypesUDim2.new(1, 2 * v1, if type(FacetFocusHeightAttribute) == "number" then FacetFocusHeightAttribute else 1, 2 * v1)
				end
			end,
			Position = function(Callback)
				-- upvalues: v70 (copy), CellResult4 (copy), ObserveResult (copy), partShare (copy), TypesUDim2 (copy)
				local v1 = v70(Callback)
				Callback(CellResult4)
				local PartShareResult = partShare((Callback(ObserveResult)))
				
				return if PartShareResult then TypesUDim2.new(PartShareResult.X, -v1, PartShareResult.Y, -v1) else TypesUDim2.fromOffset(-v1, -v1)
			end,
			ImageTransparency = function(Callback)
				-- upvalues: art (copy), CellResult2 (copy), CellResult (copy), EnvironmentResult (copy), CellResult1 (copy), CellResult3 (copy)
				if art(Callback) then
					local CallbackResult = Callback(CellResult2) ~= true and (Callback(CellResult) or Callback(EnvironmentResult.effectiveInput) == "Gamepad" and not Callback(CellResult1))
					
					return if CallbackResult then Callback(CellResult3) * 0.35 else 1
				else
					return 1
				end
			end,
			Image = function(p3)
				-- upvalues: art (copy)
				local ArtResult = art(p3)
				local Content = nil
				
				if ArtResult then
					Content = ArtResult.content
					
					if not Content then
						Content = ArtResult.contentId
						
						if not Content then
							return ""
						end
					end
				else
					Content = ""
				end
				return Content
			end,
			SliceCenter = function(p3)
				-- upvalues: art (copy), p1 (upval)
				local ArtResult = art(p3)
				local SliceCenter = if ArtResult then ArtResult.sliceCenter else nil
				
				return if SliceCenter then p1.types.Rect.new(SliceCenter.x0, SliceCenter.y0, SliceCenter.x1, SliceCenter.y1) else p1.types.Rect.new(0, 0, 0, 0)
			end,
			SliceScale = function(Callback)
				-- upvalues: art (copy), FormulaResult1 (copy), TenFootResult (copy)
				local ArtResult = art(Callback)
				local SliceScale = Callback(FormulaResult1).sliceScale or ((if ArtResult then ArtResult.sliceScale else nil) or 1)
				
				return if TenFootResult(Callback) then SliceScale * 1.5 else SliceScale
			end,
			UICornerResult1,
			UIStrokeResult,
			Halo,
			UIShadowFunction(Copy)
		})
		Runtime.mountFragment(function()
			-- upvalues: Compose (upval), CellResult5 (copy), ObserveResult (copy), CellResult4 (copy), FormulaResult1 (copy), partOf (copy), Runtime (upval), Host (copy), TypesEnum (copy), BackgroundColor3Result (copy), config (copy), thickness (copy)
			return {
				Compose.keyed({
					from = function(Callback)
						-- upvalues: CellResult5 (upval), ObserveResult (upval), CellResult4 (upval), FormulaResult1 (upval), partOf (upval)
						Callback(CellResult5)
						local CallbackResult = Callback(ObserveResult)
						Callback(CellResult4)
						
						return if CallbackResult == nil then {} elseif CallbackResult.SelectionImageObject or Callback(FormulaResult1).kind ~= "glow" then {} else { partOf(CallbackResult) or CallbackResult }
					end,
					render = function(p3)
						-- upvalues: Runtime (upval), Host (upval), TypesEnum (upval), BackgroundColor3Result (upval), config (upval), thickness (upval)
						Runtime.mount(function()
							-- upvalues: Host (upval), TypesEnum (upval), BackgroundColor3Result (upval), config (upval), thickness (upval)
							return Host.UIStroke({
								Name = "FacetFocusGlow",
								ApplyStrokeMode = TypesEnum.ApplyStrokeMode.Border,
								BorderStrokePosition = TypesEnum.BorderStrokePosition.Inner,
								Color = BackgroundColor3Result,
								Enabled = config.Enabled,
								Transparency = config.Transparency,
								Thickness = thickness
							})
						end, p3:peek())
						
						return Host.Folder({ Name = "FocusGlowOwner" })
					end
				})
			}
		end, FacetFocusRing)
		local SelfEntry = self[Key]
		
		if SelfEntry == nil then
			SelfEntry = { prior = Key.SelectionImageObject, rings = {} }
			self[Key] = SelfEntry
		end
		table.insert(SelfEntry.rings, FacetFocusRing)
		Key.SelectionImageObject = FacetFocusRing
		Compose.cleanup(function()
			-- upvalues: SelfEntry (copy), FacetFocusRing (copy), Key (copy), Runtime (upval), self (upval)
			local FoundIndex: number? = table.find(SelfEntry.rings, FacetFocusRing)
			
			if FoundIndex then
				table.remove(SelfEntry.rings, FoundIndex)
			end
			if Key.SelectionImageObject == FacetFocusRing then
				Runtime.host.render.setProperty(Key, "SelectionImageObject", SelfEntry.rings[#SelfEntry.rings] or SelfEntry.prior)
			end
			if #SelfEntry.rings == 0 then
				self[Key] = nil
			end
		end)
		
		return FocusRingPaint
	end
	
	local function layoutSize(Parent)
		-- upvalues: Compose (copy), p1 (copy)
		assert(Compose.currentOwner() ~= nil, "Facet environment.layoutSize must run inside a component or Compose owner")
		local LayoutSizeResult = p1.layoutSize(Parent)
		local v1 = nil
		
		return Compose.formula(function(Callback)
			-- upvalues: LayoutSizeResult (copy), v1 (ref), Parent (copy)
			local CallbackResult = Callback(LayoutSizeResult)
			local v2 = v1
			local Parent1 = Parent
			while Parent1 do
				local FacetTransitionZoomAttribute = Parent1:GetAttribute("FacetTransitionZoom")
				
				if v2 and type(FacetTransitionZoomAttribute) == "number" and FacetTransitionZoomAttribute ~= 1 then
					return v2
				end
				Parent1 = Parent1.Parent
			end
			v1 = CallbackResult
			
			return CallbackResult
		end)
	end
	
	local function build(p3)
		-- upvalues: Config (copy), p1 (copy), TypesVector2 (copy), Compose (copy), AdaptiveModule (upval), FreezeModule (upval), SafeAreaModule (upval), MotionModule (upval), ThemeDistanceModule (upval), layoutSize (copy), GameplayHoldModule (upval)
		local Object = p3
		local CellResult = nil
		
		if Object == nil then
			local Workspace = Config.services.Workspace
			Object = if Workspace then Workspace.CurrentCamera else nil
		end
		repeat
			if Object and Object:IsA("GuiBase2d") then
				local AbsoluteSize = p1.observe.AbsoluteSize
				local Zero = TypesVector2.zero
				
				if Object ~= nil then
					local Success, Result = pcall(AbsoluteSize, Object)
					
					if Success then
						CellResult = Result
						break
					end
				end
				CellResult = Compose.cell(Zero)
				break
			else
				if Object and Object:IsA("Camera") then
					local ViewportSize1 = p1.observe.ViewportSize
					local Zero1 = TypesVector2.zero
					
					if Object ~= nil then
						local Success1, Result1 = pcall(ViewportSize1, Object)
						
						if Success1 then
							CellResult = Result1
							break
						end
					end
					CellResult = Compose.cell(Zero1)
					break
				end
				CellResult = Compose.cell(TypesVector2.zero)
			end
		until true
		local LayoutUnitResult = if Object and Object:IsA("GuiBase2d") then p1.layoutUnit(Object) else nil
		local ViewportSize = if p3 == nil and Config.environment then Config.environment.viewportSize else nil
		local Zero = TypesVector2.zero
		local FormulaResult = Compose.formula(function(Callback)
			-- upvalues: p1 (upval), ViewportSize (copy), CellResult (copy), LayoutUnitResult (copy), Zero (ref)
			local ReadResult = p1.read(ViewportSize, Callback)
			
			if ReadResult == nil then
				local CallbackResult = Callback(CellResult)
				ReadResult = if LayoutUnitResult and typeof(CallbackResult) == "Vector2" then CallbackResult / Callback(LayoutUnitResult) else CallbackResult
			end
			if typeof(ReadResult) == "Vector2" and ReadResult.X >= 2 and ReadResult.Y >= 2 then
				Zero = ReadResult
			end
			return Zero
		end)
		
		local function derived(p4)
			-- upvalues: Compose (upval)
			return Compose.formula(p4)
		end
		
		local FormulaResult1 = Compose.formula(function(Callback)
			-- upvalues: FormulaResult (copy)
			return Callback(FormulaResult).X
		end)
		local FormulaResult2 = Compose.formula(function(Callback)
			-- upvalues: FormulaResult (copy)
			return Callback(FormulaResult).Y
		end)
		local TenFootResult = p1.tenFoot()
		local FormulaResult3 = Compose.formula(function(Callback)
			-- upvalues: AdaptiveModule (upval), FormulaResult1 (copy), TenFootResult (copy)
			local SizeClassResult = AdaptiveModule.sizeClass(Callback(FormulaResult1))
			
			return if SizeClassResult == "wide" and TenFootResult(Callback) then "regular" else SizeClassResult
		end)
		local FormulaResult4 = Compose.formula(function(Callback)
			-- upvalues: AdaptiveModule (upval), FormulaResult2 (copy), TenFootResult (copy)
			local HeightClassResult = AdaptiveModule.heightClass(Callback(FormulaResult2))
			
			return if HeightClassResult == "tall" and TenFootResult(Callback) then "medium" else HeightClassResult
		end)
		
		local function atLeast(p4)
			-- upvalues: derived (copy), FormulaResult3 (copy), AdaptiveModule (upval)
			assert(p4 == "compact" or (p4 == "regular" or p4 == "wide"), "Facet environment.atLeast expects compact, regular or wide")
			
			return derived(function(Callback)
				-- upvalues: FormulaResult3 (upval), AdaptiveModule (upval), p4 (copy)
				return AdaptiveModule.sizeClassAtLeast(Callback(FormulaResult3), p4)
			end)
		end
		
		local GuiService = Config.guiService
		local UserInputService = Config.userInputService
		local EffectiveInputResult = p1.effectiveInput()
		local MouseEnabled = p1.observe.MouseEnabled
		local CellResult1 = nil
		repeat
			if UserInputService ~= nil then
				local Success2, Result2 = pcall(MouseEnabled, UserInputService)
				
				if Success2 then
					CellResult1 = Result2
					break
				end
			end
			CellResult1 = Compose.cell(false)
		until true
		local TouchEnabled = p1.observe.TouchEnabled
		local CellResult2 = nil
		repeat
			if UserInputService ~= nil then
				local Success3, Result3 = pcall(TouchEnabled, UserInputService)
				
				if Success3 then
					CellResult2 = Result3
					break
				end
			end
			CellResult2 = Compose.cell(false)
		until true
		local GamepadEnabled = p1.observe.GamepadEnabled
		local CellResult3 = nil
		repeat
			if UserInputService ~= nil then
				local Success4, Result4 = pcall(GamepadEnabled, UserInputService)
				
				if Success4 then
					CellResult3 = Result4
					break
				end
			end
			CellResult3 = Compose.cell(false)
		until true
		local KeyboardEnabled = p1.observe.KeyboardEnabled
		local CellResult4 = nil
		repeat
			if UserInputService ~= nil then
				local Success5, Result5 = pcall(KeyboardEnabled, UserInputService)
				
				if Success5 then
					CellResult4 = Result5
					break
				end
			end
			CellResult4 = Compose.cell(false)
		until true
		local FormulaResult5 = Compose.formula(function(Callback)
			-- upvalues: CellResult1 (copy), CellResult2 (copy), CellResult3 (copy), CellResult4 (copy), EffectiveInputResult (copy), FreezeModule (upval)
			local config = {
				primary = "pointer",
				pointer = Callback(CellResult1) == true,
				touch = Callback(CellResult2) == true,
				gamepad = Callback(CellResult3) == true,
				keyboard = Callback(CellResult4) == true
			}
			local EffectiveInputResultResult = EffectiveInputResult(Callback)
			config.primary = if EffectiveInputResultResult == "Touch" then "touch" elseif EffectiveInputResultResult == "Gamepad" then "gamepad" else "pointer"
			
			if config.primary == "pointer" then
				config.pointer = true
			elseif config.primary == "touch" then
				config.touch = true
			else
				config.gamepad = true
			end
			return FreezeModule(config)
		end)
		local FormulaResult6 = Compose.formula(function(p4)
			-- upvalues: EffectiveInputResult (copy)
			return EffectiveInputResult(p4)
		end)
		local ViewportDisplaySize = p1.observe.ViewportDisplaySize
		local CellResult5 = nil
		repeat
			if GuiService ~= nil then
				local Success6, Result6 = pcall(ViewportDisplaySize, GuiService)
				
				if Success6 then
					CellResult5 = Result6
					break
				end
			end
			CellResult5 = Compose.cell(nil)
		until true
		local FormulaResult7 = Compose.formula(function(Callback)
			-- upvalues: CellResult5 (copy)
			local CallbackResult = Callback(CellResult5)
			local Name = if typeof(CallbackResult) == "EnumItem" then CallbackResult.Name else "Medium"
			
			return if Name == "Small" or Name == "Large" then Name else "Medium"
		end)
		local PreferredTextSize = p1.observe.PreferredTextSize
		local CellResult6 = nil
		repeat
			if GuiService ~= nil then
				local Success7, Result7 = pcall(PreferredTextSize, GuiService)
				
				if Success7 then
					CellResult6 = Result7
					break
				end
			end
			CellResult6 = Compose.cell(nil)
		until true
		local FormulaResult8 = Compose.formula(function(Callback)
			-- upvalues: CellResult6 (copy)
			local CallbackResult = Callback(CellResult6)
			
			return if typeof(CallbackResult) == "EnumItem" then CallbackResult.Name else "Medium"
		end)
		local TopbarInset = p1.observe.TopbarInset
		local CellResult7 = nil
		repeat
			if GuiService ~= nil then
				local Success8, Result8 = pcall(TopbarInset, GuiService)
				
				if Success8 then
					CellResult7 = Result8
					break
				end
			end
			CellResult7 = Compose.cell(nil)
		until true
		local FormulaResult9 = Compose.formula(function(Callback)
			-- upvalues: CellResult7 (copy), p1 (upval)
			local CallbackResult = Callback(CellResult7)
			
			return if typeof(CallbackResult) == "Rect" then CallbackResult else p1.types.Rect.new()
		end)
		local FormulaResult10 = Compose.formula(function(Callback): number
			-- upvalues: FormulaResult (copy), GuiService (copy), FormulaResult9 (copy)
			Callback(FormulaResult)
			local v2 = false
			
			if GuiService then
				local Success, Result = pcall(function()
					-- upvalues: GuiService (copy)
					return GuiService:IsTenFootInterface()
				end)
				
				if Success then
					Success = Result == true
				end
				v2 = Success
			end
			return (math.round(Callback(FormulaResult9).Height * (if v2 then 0.5 else 0.75)))
		end)
		local BarsResult = SafeAreaModule.bars(p1, UserInputService)
		local ZoneRevisionResult = SafeAreaModule.zoneRevision(p1, GuiService)
		local FormulaResult11 = Compose.formula(function(Callback: (any) -> ())
			-- upvalues: CellResult (copy), FormulaResult (copy), CellResult7 (copy), ZoneRevisionResult (copy), SafeAreaModule (upval), p1 (upval), GuiService (copy), BarsResult (copy)
			Callback(CellResult)
			Callback(FormulaResult)
			Callback(CellResult7)
			Callback(ZoneRevisionResult)
			
			return SafeAreaModule.insets(p1, GuiService, BarsResult, Callback)
		end)
		local FormulaResult12 = Compose.formula(function(Callback)
			-- upvalues: p1 (upval), Config (upval), TenFootResult (copy), FreezeModule (upval), FormulaResult (copy), AdaptiveModule (upval)
			local ReadResult = p1.read(Config.environment and Config.environment.overscanInsets, Callback)
			
			if ReadResult == "none" or ReadResult == nil and not TenFootResult(Callback) then
				return FreezeModule({ top = 0, left = 0, bottom = 0, right = 0 })
			elseif type(ReadResult) == "table" then
				return FreezeModule(table.clone(ReadResult))
			else
				local CallbackResult = Callback(FormulaResult)
				
				return AdaptiveModule.overscanInsets(CallbackResult.X, CallbackResult.Y)
			end
		end)
		local LevelResult = MotionModule.level(p1)
		local FormulaResult13 = Compose.formula(function(p4)
			-- upvalues: TenFootResult (copy)
			return TenFootResult(p4)
		end)
		local FormulaResult14 = Compose.formula(function(Callback)
			-- upvalues: p1 (upval), Config (upval), ThemeDistanceModule (upval), FormulaResult13 (copy), AdaptiveModule (upval)
			return ThemeDistanceModule.resolutionScale((p1.read(Config.theme, Callback))) * (if Callback(FormulaResult13) then AdaptiveModule.TEN_FOOT_SCALE else 1)
		end)
		local Services = Config.services
		
		local function textFactor(p4, Callback: (any) -> ())
			-- upvalues: p1 (upval), FormulaResult8 (copy), Services (copy), TypesVector2 (upval)
			local TypographyName: string = `typography.{p4}.size`
			local MetricResult: number = p1.metric(TypographyName, Callback, true)
			local MetricResult1 = p1.metric(TypographyName, Callback)
			Callback(FormulaResult8)
			local Largest = 1
			local TextService = Services.TextService
			
			if TextService and MetricResult > 0 then
				local Success, Result = pcall(function()
					-- upvalues: TextService (copy), MetricResult (copy), p1 (upval), TypesVector2 (upval)
					return TextService:GetTextSize("Mg", MetricResult, p1.types.Enum.Font.SourceSans, TypesVector2.new(100000, 100000))
				end)
				
				if Success and typeof(Result) == "Vector2" and Result.Y > 0 then
					Largest = math.max(1, Result.Y / MetricResult)
				end
			end
			return Largest * (if MetricResult > 0 then MetricResult1 / MetricResult else 1)
		end
		
		local function scaled(p4, p5)
			-- upvalues: p1 (upval), derived (copy), textFactor (copy), FormulaResult14 (copy)
			assert(p5 == nil or type(p5) == "string" and pcall(p1.metric, `typography.{p5}.size`, nil, nil), "Facet environment.scaled relativeTo must be a type role")
			
			if type(p4) == "string" then
				p1.metric(p4)
				
				return derived(function(p6)
					-- upvalues: p1 (upval), p4 (copy), p5 (copy), textFactor (upval)
					local MetricResult = p1.metric(p4, p6)
					
					return if p5 then MetricResult * textFactor(p5, p6) else MetricResult
				end)
			else
				assert(type(p4) == "number" and p4 == p4 and (p4 ~= 1e999 and p4 ~= -1e999), "Facet environment.scaled expects a finite number or a theme metric path")
				
				return derived(function(Callback)
					-- upvalues: p4 (copy), FormulaResult14 (upval), p5 (copy), textFactor (upval)
					local ScaledCallbackResult = p4 * Callback(FormulaResult14)
					
					return if p5 then ScaledCallbackResult * textFactor(p5, Callback) else ScaledCallbackResult
				end)
			end
		end
		
		local config = {
			viewportSize = FormulaResult,
			viewportWidth = FormulaResult1,
			viewportHeight = FormulaResult2,
			sizeClass = FormulaResult3,
			heightClass = FormulaResult4,
			orientation = Compose.formula(function(Callback)
				-- upvalues: FormulaResult (copy), AdaptiveModule (upval)
				local CallbackResult = Callback(FormulaResult)
				
				return AdaptiveModule.orientationFor(CallbackResult.X, CallbackResult.Y)
			end),
			isCompact = Compose.formula(function(Callback): boolean
				-- upvalues: FormulaResult3 (copy)
				return Callback(FormulaResult3) == "compact"
			end),
			isRegular = Compose.formula(function(Callback): boolean
				-- upvalues: FormulaResult3 (copy)
				return Callback(FormulaResult3) == "regular"
			end),
			isWide = Compose.formula(function(Callback): boolean
				-- upvalues: FormulaResult3 (copy)
				return Callback(FormulaResult3) == "wide"
			end)
		}
		assert(true, "Facet environment.atLeast expects compact, regular or wide")
		local v2 = "regular"
		config.isRegularOrWider = Compose.formula(function(Callback)
			-- upvalues: FormulaResult3 (copy), AdaptiveModule (upval), v2 (copy)
			return AdaptiveModule.sizeClassAtLeast(Callback(FormulaResult3), v2)
		end)
		config.isShort = Compose.formula(function(Callback): boolean
			-- upvalues: FormulaResult4 (copy)
			return Callback(FormulaResult4) == "short"
		end)
		config.isTall = Compose.formula(function(Callback): boolean
			-- upvalues: FormulaResult4 (copy)
			return Callback(FormulaResult4) == "tall"
		end)
		config.thumbTarget = Compose.formula(function(Callback)
			-- upvalues: FormulaResult (copy), p1 (upval)
			local CallbackResult = Callback(FormulaResult)
			
			return p1.metric(if math.min(CallbackResult.X, CallbackResult.Y) <= 500 then "targetSizes.thumb" else "targetSizes.thumbLarge", Callback)
		end)
		config.isLandscape = Compose.formula(function(Callback): boolean
			-- upvalues: FormulaResult (copy)
			local CallbackResult = Callback(FormulaResult)
			
			return CallbackResult.Y < CallbackResult.X
		end)
		config.axis = Compose.formula(function(Callback)
			-- upvalues: AdaptiveModule (upval), FormulaResult1 (copy)
			return AdaptiveModule.axisFor(Callback(FormulaResult1))
		end)
		config.atLeast = atLeast
		config.interactionClasses = FormulaResult5
		config.effectiveInput = FormulaResult6
		config.displaySize = FormulaResult7
		config.isTenFoot = FormulaResult13
		config.viewingDistanceSource = Compose.formula(function(p4): string
			-- upvalues: p1 (upval)
			return if p1.viewingDistance(p4) == "automatic" then "inferred" else "authored"
		end)
		config.metricScale = FormulaResult14
		config.scaled = scaled
		config.layoutSize = layoutSize
		config.overscanInsets = FormulaResult12
		config.navPlacement = Compose.formula(function(Callback)
			-- upvalues: AdaptiveModule (upval), FormulaResult3 (copy), FormulaResult4 (copy), FormulaResult5 (copy), FormulaResult7 (copy), FormulaResult13 (copy)
			return AdaptiveModule.navPlacement({
				sizeClass = Callback(FormulaResult3),
				heightClass = Callback(FormulaResult4),
				primary = Callback(FormulaResult5).primary,
				displaySize = Callback(FormulaResult7),
				tenFoot = Callback(FormulaResult13)
			})
		end)
		config.safeInsets = FormulaResult11
		config.topbarInset = FormulaResult9
		config.topbarControlDiameter = FormulaResult10
		config.gameplaySuspended = GameplayHoldModule.suspended(p1)
		config.preferredTextSize = FormulaResult8
		config.reducedMotion = Compose.formula(function(p4): boolean
			-- upvalues: LevelResult (copy)
			return LevelResult(p4) ~= "normal"
		end)
		config.motionLevel = Compose.formula(function(p4)
			-- upvalues: LevelResult (copy)
			return LevelResult(p4)
		end)
		
		return (FreezeModule(config))
	end
	
	local v2 = nil
	local SharedResource = Compose.createSharedResource(function()
		-- upvalues: Compose (copy), build (copy), Runtime (copy), v2 (ref)
		local v3 = nil
		local RootOwner = Compose.createRootOwner(function()
			-- upvalues: v3 (ref), build (upval)
			v3 = build(nil)
		end, Runtime.reactor)
		local v4 = assert(v3)
		v2 = v4
		
		return v4, function()
			-- upvalues: v2 (upval), v4 (copy), RootOwner (copy)
			if v2 == v4 then
				v2 = nil
			end
			RootOwner.dispose()
		end
	end)
	
	function p2.environment(p3)
		-- upvalues: Compose (copy), v2 (ref), SharedResource (copy), build (copy)
		local HasCurrentOwnerResult = Compose.currentOwner() ~= nil
		
		if p3 == nil and not HasCurrentOwnerResult and v2 ~= nil then
			return v2
		else
			assert(HasCurrentOwnerResult, "Facet UI.environment must run inside a component or Compose owner. Call it once at the top of the component and read its fields with use().")
			
			return if p3 == nil then SharedResource() else build(p3)
		end
	end
	
	p2.responder = p1.responder
	local config1 = {
		entry = true,
		preferred = true,
		focusOnAppear = true,
		returnFocus = true
	}
	
	function p2.focusSection(Ancestor, p3)
		-- upvalues: Compose (copy), config1 (copy), Config (copy), p1 (copy), Runtime (copy)
		assert(Compose.currentOwner() ~= nil, "Facet UI.focusSection must run inside a component or Compose owner")
		assert(Ancestor ~= nil and (Ancestor.IsA ~= nil and Ancestor:IsA("GuiObject")), "Facet UI.focusSection expects a GuiObject")
		local P34 = p3 or {}
		assert(type(P34) == "table")
		
		for i in P34 do
			assert(type(i) == "string" and config1[i] == true, `Facet UI.focusSection: unknown option '{tostring(i)}'`)
		end
		local Entry = P34.entry or "restore"
		assert(Entry == "restore" or (Entry == "first" or Entry == "nearest"), "Facet UI.focusSection: entry must be restore, first or nearest")
		local FocusOnAppear = P34.focusOnAppear
		assert(FocusOnAppear == nil or (type(FocusOnAppear) == "boolean" or type(FocusOnAppear) == "string" and FocusOnAppear ~= ""), "Facet UI.focusSection: focusOnAppear is a boolean or a descendant name")
		local GuiService = Config.guiService
		
		if GuiService == nil then return end
		local function _(Object): boolean
			-- upvalues: Ancestor (copy)
			return Object ~= nil and (Object:IsDescendantOf(Ancestor) and (Object.Selectable and (Object.Visible and Object:FindFirstAncestorWhichIsA("LayerCollector") ~= nil)))
		end
		
		local function ordered(Ancestor, List)
			-- upvalues: ordered (copy)
			local Children = Ancestor:GetChildren()
			local t = {}
			
			for i, child in Children do
				t[child] = i
			end
			table.sort(Children, function(A: Frame, B: Frame): boolean
				-- upvalues: t (copy)
				local LayoutOrder = if A:IsA("GuiObject") then A.LayoutOrder else 0
				local LayoutOrder1 = if B:IsA("GuiObject") then B.LayoutOrder else 0
				
				return if LayoutOrder == LayoutOrder1 then t[A] < t[B] else LayoutOrder < LayoutOrder1
			end)
			
			for _, Gui in Children do
				if Gui:IsA("GuiObject") then
					if Gui.Visible then
						if Gui.Selectable then
							table.insert(List, Gui)
						end
					else
						continue
					end
				end
				ordered(Gui, List)
			end
		end
		
		local function named(Text: string)
			-- upvalues: Ancestor (copy)
			local Gui = Ancestor
			
			for ChildName in string.gmatch(Text, "[^/]+") do
				if Gui then
					Gui = Gui:FindFirstChild(ChildName, true)
				else
					Gui = nil
				end
			end
			if Gui and Gui:IsA("GuiObject") and (Gui ~= nil and (Gui:IsDescendantOf(Ancestor) and (Gui.Selectable and (Gui.Visible and Gui:FindFirstAncestorWhichIsA("LayerCollector") ~= nil)))) then
				return Gui
			else
				return nil
			end
		end
		
		local _ = function()
			-- upvalues: ordered (copy), Ancestor (copy)
			local t = {}
			ordered(Ancestor, t)
			
			return t[1]
		end
		
		local ObserveResult = p1.selection.observe()
		local v3 = nil
		local Flag = false
		Compose.watch(function(Callback)
			-- upvalues: ObserveResult (copy), Ancestor (copy), Flag (ref), Entry (copy), ordered (copy), v3 (ref), P34 (copy), named (copy), p1 (upval)
			local CallbackResult = Callback(ObserveResult)
			local IsDescendantOf = CallbackResult ~= nil and CallbackResult:IsDescendantOf(Ancestor)
			
			if IsDescendantOf and not Flag and Entry ~= "nearest" then
				local v4 = nil
				
				if Entry == "first" then
					local t = {}
					ordered(Ancestor, t)
					v4 = t[1]
				else
					local Object = v3
					
					if Object ~= nil and (Object:IsDescendantOf(Ancestor) and (Object.Selectable and (Object.Visible and Object:FindFirstAncestorWhichIsA("LayerCollector") ~= nil))) then
						v4 = v3
					elseif P34.preferred then
						v4 = named(P34.preferred)
					end
				end
				Flag = true
				
				if v4 and v4 ~= CallbackResult then
					p1.selection.set(v4)
					
					return
				end
			end
			Flag = IsDescendantOf
			
			if IsDescendantOf then
				v3 = CallbackResult
			end
		end)
		
		if FocusOnAppear or P34.returnFocus then
			local UserInputService = Config.userInputService
			local GetResult = nil
			local v4 = nil
			
			local function claim()
				-- upvalues: Ancestor (copy), v4 (ref), GetResult (ref), p1 (upval), UserInputService (copy), FocusOnAppear (copy), named (copy), ordered (copy), GuiService (copy)
				local LayerCollector = Ancestor:FindFirstAncestorWhichIsA("LayerCollector")
				
				if v4 or LayerCollector == nil then return end
				v4 = LayerCollector
				GetResult = p1.selection.get()
				
				if GetResult == nil and (UserInputService == nil or UserInputService.PreferredInput ~= p1.types.Enum.PreferredInput.Gamepad) or not FocusOnAppear then return end
				local NamedResult = nil
				if type(FocusOnAppear) == "string" then
					NamedResult = named(FocusOnAppear)
				else
					local t = {}
					ordered(Ancestor, t)
					NamedResult = t[1]
				end
				if not pcall(function()
					-- upvalues: NamedResult (copy), p1 (upval), FocusOnAppear (upval), GuiService (upval), Ancestor (upval)
					if NamedResult then
						p1.selection.set(NamedResult)
						
						return
					end
					if FocusOnAppear == true then
						GuiService:Select(Ancestor)
					end
				end) then
					v4 = nil
				end
			end
			
			Runtime.connect(Ancestor, "AncestryChanged", claim)
			claim()
			
			if P34.returnFocus then
				local v5 = false
				local Flag1 = false
				
				local _ = function()
					-- upvalues: Flag1 (ref), GetResult (ref), p1 (upval), v4 (ref), GuiService (copy)
					Flag1 = true
					local GetResult1 = GetResult
					
					if GetResult1 and GetResult1:FindFirstAncestorWhichIsA("LayerCollector") then
						p1.selection.set(GetResult1)
						
						return
					end
					if GetResult1 and v4 then
						GuiService:Select(v4)
					end
				end
				
				Compose.watch(function(Callback)
					-- upvalues: ObserveResult (copy), Ancestor (copy), v5 (ref), Flag1 (ref), GetResult (ref), p1 (upval), v4 (ref), GuiService (copy)
					local CallbackResult = Callback(ObserveResult)
					local IsDescendantOf = CallbackResult ~= nil and CallbackResult:IsDescendantOf(Ancestor)
					
					if not v5 or IsDescendantOf or Flag1 or Ancestor:FindFirstAncestorWhichIsA("LayerCollector") ~= nil then
						v5 = IsDescendantOf
						
						return
					end
					Flag1 = true
					local GetResult1 = GetResult
					
					if GetResult1 and GetResult1:FindFirstAncestorWhichIsA("LayerCollector") then
						p1.selection.set(GetResult1)
						
						return
					end
					if GetResult1 and v4 then
						GuiService:Select(v4)
					end
				end)
				Compose.cleanup(function()
					-- upvalues: p1 (upval), Flag1 (ref), GetResult (ref), Ancestor (copy), v4 (ref), GuiService (copy)
					local GetResult1 = p1.selection.get()
					
					if Flag1 or GetResult == nil or GetResult1 ~= nil and not GetResult1:IsDescendantOf(Ancestor) then return end
					Flag1 = true
					local GetResult2 = GetResult
					
					if GetResult2 and GetResult2:FindFirstAncestorWhichIsA("LayerCollector") then
						p1.selection.set(GetResult2)
						
						return
					end
					if GetResult2 and v4 then
						GuiService:Select(v4)
					end
				end)
			end
		end
	end
	
	function p2.worldAnchor(List)
		-- upvalues: config (upval), Config (copy), p1 (copy), Compose (copy), FreezeModule (upval)
		assert(type(List) == "table", "Facet UI.worldAnchor expects an options table")
		assert(type(List) == "table")
		
		for i in List do
			assert(type(i) == "string" and config[i] == true, `Facet UI.worldAnchor: unknown option '{tostring(i)}'`)
		end
		assert(List.target ~= nil, "Facet UI.worldAnchor: target is required")
		local Padding = if List.padding == nil then 0.15 else List.padding
		assert(type(Padding) == "number" and (Padding == Padding and math.abs(Padding) < 1e999 and (Padding >= 0 and Padding <= 1)), "Facet UI.worldAnchor: padding must be a fraction from 0 to 1")
		assert(List.offscreen == nil or (List.offscreen == "hide" or List.offscreen == "retain"), "Facet UI.worldAnchor: offscreen must be hide or retain")
		assert(List.occlusion == nil or type(List.occlusion) == "boolean", "Facet UI.worldAnchor: occlusion must be a boolean")
		local Workspace = Config.services.Workspace
		
		local function sample()
			-- upvalues: Workspace (copy), p1 (upval), List (copy), Padding (copy)
			local ReadResult = p1.read(List.target)
			local ReadResult1 = p1.read(List.camera) or (if Workspace then Workspace.CurrentCamera else nil)
			
			if ReadResult == nil or ReadResult1 == nil or Workspace == nil then
				return { visible = false }
			end
			assert(ReadResult:IsA("BasePart") or (ReadResult:IsA("Model") or ReadResult:IsA("Player")), "Facet UI.worldAnchor: target must be a BasePart, Model or Player")
			local Character = if ReadResult:IsA("Player") then ReadResult.Character else ReadResult
			
			if Character == nil or not Character:IsDescendantOf(Workspace) then
				return { visible = false }
			end
			local Size = nil
			local CharacterCFrame = nil
			if Character:IsA("Model") then
				if not Character:FindFirstChildWhichIsA("BasePart", true) then
					return { visible = false }
				end
				CharacterCFrame, Size = Character:GetBoundingBox()
			else
				assert(Character:IsA("BasePart"))
				CharacterCFrame = Character.CFrame
				Size = Character.Size
			end
			if List.occlusion then
				local Position = ReadResult1.CFrame.Position
				local RaycastResult = Workspace:Raycast(Position, CharacterCFrame.Position - Position)
				
				if RaycastResult and RaycastResult.Instance ~= Character and not RaycastResult.Instance:IsDescendantOf(Character) then
					return { visible = false, occluded = true }
				end
			end
			local Magnitude = math.abs(ReadResult1.NearPlaneZ)
			local ViewportSize = ReadResult1.ViewportSize
			
			if List.offscreen == "retain" then
				local ViewportPoint = ReadResult1:WorldToViewportPoint(CharacterCFrame.Position)
				local X: number = ViewportPoint.X
				
				if type(X) == "number" and (X == X and math.abs(X) < 1e999) then
					local Y: number = ViewportPoint.Y
					
					if type(Y) == "number" and (Y == Y and math.abs(Y) < 1e999) then
						local Z: number = ViewportPoint.Z
						
						if type(Z) == "number" and (Z == Z and math.abs(Z) < 1e999) then
							local X1 = ViewportPoint.X
							local Y1 = ViewportPoint.Y
							local IsYBelow: boolean = Magnitude < ViewportPoint.Z and (X1 >= 0 and (Y1 >= 0 and (X1 <= ViewportSize.X and Y1 <= ViewportSize.Y)))
							
							if ViewportPoint.Z <= 0 then
								local XDelta = ViewportSize.X / 2 - X1
								local YDelta = ViewportSize.Y / 2 - Y1
								local SquareRoot = math.sqrt(XDelta * XDelta + YDelta * YDelta)
								
								if SquareRoot < 0.001 then
									XDelta = 0
									YDelta = 1
									SquareRoot = 1
								end
								local ScaledLargest = math.max(ViewportSize.X, ViewportSize.Y) * 2
								X1 = ViewportSize.X / 2 + XDelta / SquareRoot * ScaledLargest
								Y1 = ViewportSize.Y / 2 + YDelta / SquareRoot * ScaledLargest
							end
							return {
								visible = true,
								clearance = 0,
								x = X1,
								y = Y1,
								onscreen = IsYBelow
							}
						end
					end
				end
				return { visible = false }
			else
				local List1 = {}
				local Smallest = 1e999
				local Smallest1 = 1e999
				local Largest = -1e999
				local Largest1 = -1e999
				
				for _, value in { -1, 1 } do
					for _, value1 in { -1, 1 } do
						for _, value2 in { -1, 1 } do
							local ViewportPoint = ReadResult1:WorldToViewportPoint(CharacterCFrame.Position + CharacterCFrame.RightVector * (Size.X * value / 2) + CharacterCFrame.UpVector * (Size.Y * value1 / 2) + CharacterCFrame.LookVector * (Size.Z * value2 / 2))
							local X: number = ViewportPoint.X
							
							if type(X) == "number" and (X == X and math.abs(X) < 1e999) then
								local Y: number = ViewportPoint.Y
								
								if type(Y) == "number" and (Y == Y and math.abs(Y) < 1e999) then
									local Z: number = ViewportPoint.Z
									
									if type(Z) == "number" and (Z == Z and math.abs(Z) < 1e999) and ViewportPoint.Z > Magnitude then
										Smallest = math.min(Smallest, ViewportPoint.X)
										Smallest1 = math.min(Smallest1, ViewportPoint.Y)
										Largest = math.max(Largest, ViewportPoint.X)
										Largest1 = math.max(Largest1, ViewportPoint.Y)
										table.insert(List1, ViewportPoint)
										continue
									end
								end
							end
							return { visible = false }
						end
					end
				end
				local SmallestRatio = (Smallest + Largest) / 2
				local SmallestRatio1 = (Smallest1 + Largest1) / 2
				
				if SmallestRatio < 0 or SmallestRatio1 < 0 or ViewportSize.X < SmallestRatio or ViewportSize.Y < SmallestRatio1 then
					return { visible = false }
				end
				local Largest2 = 0
				
				for _, value3 in List1 do
					Largest2 = math.max(Largest2, (math.sqrt((value3.X - SmallestRatio) ^ 2 + (value3.Y - SmallestRatio1) ^ 2)))
				end
				return {
					visible = true,
					x = SmallestRatio,
					y = SmallestRatio1,
					clearance = Largest2 * (1 + Padding)
				}
			end
		end
		
		local CellResult = Compose.cell((sample()))
		local RunService = Config.services.RunService
		local HeartbeatConnection = if RunService then RunService.Heartbeat:Connect(function()
			-- upvalues: sample (copy), CellResult (copy)
			local Success, Result = pcall(sample)
			local Result1 = if Success then Result else { visible = false }
			local PeekResult = CellResult:peek()
			
			if PeekResult.visible ~= Result1.visible or PeekResult.x ~= Result1.x or PeekResult.y ~= Result1.y or PeekResult.clearance ~= Result1.clearance or PeekResult.onscreen ~= Result1.onscreen or PeekResult.occluded ~= Result1.occluded then
				CellResult:set(Result1)
			end
		end) else nil
		local Flag = false
		
		local function dispose()
			-- upvalues: Flag (ref), HeartbeatConnection (ref), CellResult (copy)
			if Flag then return end
			Flag = true
			
			if HeartbeatConnection then
				HeartbeatConnection:Disconnect()
				HeartbeatConnection = nil
			end
			CellResult:set({ visible = false })
		end
		
		if Compose.currentOwner() then
			Compose.cleanup(dispose)
		end
		return FreezeModule({ anchor = CellResult, dispose = dispose })
	end
end