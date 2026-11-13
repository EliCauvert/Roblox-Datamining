local _ = require("../vendor/compose/core")
local _ = require("./types")
local NativeDecorationModule = require("./native_decoration")
local list = { "top", "left", "bottom", "right" }
local self = setmetatable({}, { __mode = "k" })

local function apart()
	return {
		meets = { top = false, left = false, bottom = false, right = false },
		glass = { top = 0, left = 0, bottom = 0, right = 0 }
	}
end

local function same(PeekResult, p1): boolean
	-- upvalues: list (copy)
	for _, value in list do
		if PeekResult.meets[value] ~= p1.meets[value] or PeekResult.glass[value] ~= p1.glass[value] then
			return false
		end
	end
	return true
end

local function bands(p2, GuiService, ScreenGui)
	local TypesEnum = p2.types.Enum
	local TypesVector2 = p2.types.Vector2
	
	if GuiService.GetInsetArea then
		local Success, Result, Result3 = pcall(function()
			-- upvalues: GuiService (copy), TypesEnum (copy), ScreenGui (copy)
			return GuiService:GetInsetArea(TypesEnum.ScreenInsets.None), GuiService:GetInsetArea(ScreenGui.ScreenInsets)
		end)
		
		if Success and typeof(Result) == "Rect" and typeof(Result3) == "Rect" then
			return Result3.Min - Result.Min, Result.Max - Result3.Max
		end
	end
	if not ScreenGui.IgnoreGuiInset and ScreenGui.ScreenInsets == TypesEnum.ScreenInsets.CoreUISafeInsets then
		local Success1, Result1, Result3_1 = pcall(GuiService.GetGuiInset, GuiService)
		
		if Success1 and typeof(Result1) == "Vector2" then
			if typeof(Result3_1) == "Vector2" then
				return Result1, Result3_1
			else
				return Result1, TypesVector2.zero
			end
		end
	end
	return TypesVector2.zero, TypesVector2.zero
end

local function margins(Frame: Frame, Frame1: Frame)
	local AbsolutePosition = Frame.AbsolutePosition
	local AbsoluteSize = Frame.AbsoluteSize
	local AbsolutePosition1 = Frame1.AbsolutePosition
	local AbsoluteSize1 = Frame1.AbsoluteSize
	
	return if AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 or AbsoluteSize1.X <= 0 or AbsoluteSize1.Y <= 0 then nil else {
		top = AbsolutePosition.Y - AbsolutePosition1.Y,
		left = AbsolutePosition.X - AbsolutePosition1.X,
		bottom = AbsolutePosition1.Y + AbsoluteSize1.Y - AbsolutePosition.Y - AbsoluteSize.Y,
		right = AbsolutePosition1.X + AbsoluteSize1.X - AbsolutePosition.X - AbsoluteSize.X
	}
end

local function hold(p2, p3, FormulaResult)
	-- upvalues: self (copy)
	local Compose = p2.Compose
	local ScreenGui = nil
	
	local function release()
		-- upvalues: ScreenGui (ref), self (upval)
		local ScreenGui1 = ScreenGui
		ScreenGui = nil
		local SelfEntry = if ScreenGui1 then self[ScreenGui1] else nil
		
		if ScreenGui1 and SelfEntry then
			SelfEntry.count -= 1
			
			if SelfEntry.count == 0 then
				self[ScreenGui1] = nil
				
				if ScreenGui1.ClipToDeviceSafeArea ~= SelfEntry.clipped then
					ScreenGui1.ClipToDeviceSafeArea = SelfEntry.clipped
				end
			end
		end
	end
	
	local function acquire()
		-- upvalues: FormulaResult (copy), p3 (copy), ScreenGui (ref), self (upval)
		local NoFormulaResult = FormulaResult == nil or FormulaResult:peek()
		local ScreenGui1 = if NoFormulaResult then p3:FindFirstAncestorWhichIsA("ScreenGui") else nil
		
		if ScreenGui1 == ScreenGui then return end
		local ScreenGui2 = ScreenGui
		ScreenGui = nil
		local SelfEntry = if ScreenGui2 then self[ScreenGui2] else nil
		
		if ScreenGui2 and SelfEntry then
			SelfEntry.count -= 1
			
			if SelfEntry.count == 0 then
				self[ScreenGui2] = nil
				
				if ScreenGui2.ClipToDeviceSafeArea ~= SelfEntry.clipped then
					ScreenGui2.ClipToDeviceSafeArea = SelfEntry.clipped
				end
			end
		end
		if ScreenGui1 then
			local SelfEntry1 = self[ScreenGui1]
			
			if SelfEntry1 == nil then
				SelfEntry1 = {
					count = 0,
					clipped = ScreenGui1.ClipToDeviceSafeArea == true
				}
				self[ScreenGui1] = SelfEntry1
			end
			SelfEntry1.count += 1
			ScreenGui = ScreenGui1
			
			if ScreenGui1.ClipToDeviceSafeArea ~= false then
				ScreenGui1.ClipToDeviceSafeArea = false
			end
		end
	end
	
	p2.runtime.connect(p3, "AncestryChanged", acquire)
	
	if FormulaResult then
		Compose.watch(function(Callback: (any) -> ())
			-- upvalues: FormulaResult (copy), acquire (copy)
			Callback(FormulaResult)
			acquire()
		end)
	else
		acquire()
	end
	Compose.cleanup(release)
end

local function reach(p2, Frame, Enabled)
	-- upvalues: apart (copy), margins (copy), bands (copy), list (copy), same (copy)
	local Compose = p2.Compose
	local Runtime = p2.runtime
	local GuiService = p2.config.guiService
	local CellResult = Compose.cell((apart()))
	
	local function measure()
		-- upvalues: apart (upval), Frame (copy), margins (upval), GuiService (copy), bands (upval), p2 (copy), list (upval), same (upval), CellResult (copy)
		local ApartResult = apart()
		local ScreenGui = Frame:FindFirstAncestorWhichIsA("ScreenGui")
		local MarginsResult = if ScreenGui then margins(Frame, ScreenGui) else nil
		
		if ScreenGui and GuiService and MarginsResult then
			local BandsResult, BandsResult2 = bands(p2, GuiService, ScreenGui)
			local config = {
				top = BandsResult.Y,
				left = BandsResult.X,
				bottom = BandsResult2.Y,
				right = BandsResult2.X
			}
			
			for _, value in list do
				if MarginsResult[value] <= 1 then
					ApartResult.meets[value] = true
					ApartResult.glass[value] = math.max(0, config[value] + MarginsResult[value])
				end
			end
		end
		if not same(CellResult:peek(), ApartResult) then
			CellResult:set(ApartResult)
		end
	end
	
	local AbsolutePositionResult = p2.observe.AbsolutePosition(Frame)
	local AbsoluteSizeResult = p2.observe.AbsoluteSize(Frame)
	local PbarInset = if GuiService then p2.observe.TopbarInset(GuiService) else nil
	Compose.watch(function(Callback: (any) -> ())
		-- upvalues: AbsolutePositionResult (copy), AbsoluteSizeResult (copy), PbarInset (copy), measure (copy)
		Callback(AbsolutePositionResult)
		Callback(AbsoluteSizeResult)
		
		if PbarInset then
			Callback(PbarInset)
		end
		measure()
	end)
	Runtime.connect(Frame, "AncestryChanged", measure)
	local RunService = p2.config.services.RunService
	
	if RunService and Enabled ~= false then
		Runtime.connect(RunService, "Heartbeat", measure)
	end
	return CellResult
end

local function spread(p3, p4, p5, p6)
	-- upvalues: reach (copy), list (copy), hold (copy)
	local Compose = p3.Compose
	local ReachResult = reach(p3, p4)
	local LayoutUnitResult = p3.layoutUnit(p4, p5)
	local FormulaResult = Compose.formula(function(Callback)
		-- upvalues: ReachResult (copy), LayoutUnitResult (copy), p6 (copy), p3 (copy), list (upval)
		local CallbackResult = Callback(ReachResult)
		local Largest = math.max(Callback(LayoutUnitResult), 0.001)
		local MetricResult = if p6 then p3.metric(p6, Callback) else 0
		local NewGlassEntries = {}
		
		for _, value in list do
			NewGlassEntries[value] = if CallbackResult.meets[value] then CallbackResult.glass[value] / Largest + MetricResult else 0
		end
		return NewGlassEntries
	end)
	hold(p3, p4, (Compose.formula(function(Callback): boolean
		-- upvalues: ReachResult (copy), list (upval)
		local CallbackResult = Callback(ReachResult)
		
		for _, value in list do
			if CallbackResult.meets[value] and CallbackResult.glass[value] > 0 then
				return true
			end
		end
		return false
	end)))
	
	return FormulaResult, LayoutUnitResult
end

local function _(p7, p8)
	local TypesUDim2 = p7.types.UDim2
	
	return function(Callback)
		-- upvalues: p8 (copy), TypesUDim2 (copy)
		local CallbackResult = Callback(p8)
		
		return TypesUDim2.fromOffset(-CallbackResult.left, -CallbackResult.top)
	end
end

local _ = function(p7, p8)
	local TypesUDim2 = p7.types.UDim2
	
	return function(Callback)
		-- upvalues: p8 (copy), TypesUDim2 (copy)
		local CallbackResult = Callback(p8)
		
		return TypesUDim2.new(1, CallbackResult.left + CallbackResult.right, 1, CallbackResult.top + CallbackResult.bottom)
	end
end

return {
	bands = bands,
	fills = function(Frame): boolean
		-- upvalues: margins (copy), list (copy)
		local ScreenGui = Frame:FindFirstAncestorWhichIsA("ScreenGui")
		local MarginsResult = if ScreenGui then margins(Frame, ScreenGui) else nil
		
		if MarginsResult == nil then
			return false
		end
		for _, value in list do
			if MarginsResult[value] > 1 then
				return false
			end
		end
		return true
	end,
	hold = hold,
	reach = reach,
	backdrop = function(p7, p8, Tag, p9, p10)
		-- upvalues: spread (copy), NativeDecorationModule (copy)
		local Compose = p7.Compose
		local Host = p7.Host
		local Runtime = p7.runtime
		local GlassUnit = spread(p7, p8, "GlassUnit", p9)
		local TypesUDim2 = p7.types.UDim2
		
		local function Position(Callback)
			-- upvalues: GlassUnit (copy), TypesUDim2 (copy)
			local CallbackResult = Callback(GlassUnit)
			
			return TypesUDim2.fromOffset(-CallbackResult.left, -CallbackResult.top)
		end
		
		local TypesUDim2_1 = p7.types.UDim2
		local Object = Host.Frame("Backdrop")({
			BorderSizePixel = 0,
			ZIndex = 0,
			Position = Position,
			Size = function(Callback)
				-- upvalues: GlassUnit (copy), TypesUDim2_1 (copy)
				local CallbackResult = Callback(GlassUnit)
				
				return TypesUDim2_1.new(1, CallbackResult.left + CallbackResult.right, 1, CallbackResult.top + CallbackResult.bottom)
			end
		})
		Object:AddTag(Tag)
		
		if p10 then
			p7.skin(Object, "panel")
		end
		Runtime.mount(function()
			-- upvalues: Host (copy), NativeDecorationModule (upval), Compose (copy), Runtime (copy), p7 (copy), p8 (copy), Object (copy)
			return Host.Folder("Glass")({
				NativeDecorationModule(Compose, Runtime, p7.types, p8, Object)
			})
		end, p8)
		
		return Object
	end,
	ground = function(p7, p8, p9)
		-- upvalues: spread (copy), NativeDecorationModule (copy)
		local Compose = p7.Compose
		local Host = p7.Host
		local Runtime = p7.runtime
		local TypesUDim2 = p7.types.UDim2
		local TypesVector2 = p7.types.Vector2
		local TypesEnum = p7.types.Enum
		local GroundUnit, GroundUnit2 = spread(p7, p8, "GroundUnit", nil)
		p9.AnchorPoint = TypesVector2.zero
		p9.AutomaticSize = TypesEnum.AutomaticSize.None
		p9.Position = TypesUDim2.new(0, 0, 0, 0)
		local TypesUDim21 = p7.types.UDim2
		local TypesUDim2_1 = p7.types.UDim2
		local Object = Host.Frame("Ground")({
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			ZIndex = 0,
			Position = function(Callback)
				-- upvalues: GroundUnit (copy), TypesUDim21 (copy)
				local CallbackResult = Callback(GroundUnit)
				
				return TypesUDim21.fromOffset(-CallbackResult.left, -CallbackResult.top)
			end,
			Size = function(Callback)
				-- upvalues: GroundUnit (copy), TypesUDim2_1 (copy)
				local CallbackResult = Callback(GroundUnit)
				
				return TypesUDim2_1.new(1, CallbackResult.left + CallbackResult.right, 1, CallbackResult.top + CallbackResult.bottom)
			end,
			p9
		})
		Object:AddTag("facet-ground")
		local AbsoluteSizeResult = p7.observe.AbsoluteSize(Object)
		Runtime.mount(function()
			-- upvalues: Host (copy), AbsoluteSizeResult (copy), GroundUnit2 (copy), TypesVector2 (copy)
			return Host.UISizeConstraint("GroundFill")({
				MinSize = function(Callback)
					-- upvalues: AbsoluteSizeResult (upval), GroundUnit2 (upval), TypesVector2 (upval)
					local CallbackResult = Callback(AbsoluteSizeResult)
					local Largest = math.max(Callback(GroundUnit2), 0.001)
					
					return TypesVector2.new(CallbackResult.X / Largest, CallbackResult.Y / Largest)
				end
			})
		end, p9)
		Runtime.mount(function()
			-- upvalues: Host (copy), NativeDecorationModule (upval), Compose (copy), Runtime (copy), p7 (copy), p8 (copy), Object (copy)
			return Host.Folder("GroundGlass")({
				NativeDecorationModule(Compose, Runtime, p7.types, p8, Object)
			})
		end, p8)
		
		return Object
	end
}