local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./theme_types")
local AdaptiveModule = require("./adaptive")
local ThemeSupportModule = require("./theme_support")

return function(p1, p2, p3, p4, Callback1, Callback)
	-- upvalues: AdaptiveModule (copy), ThemeSupportModule (copy)
	local Compose = p1.Compose
	
	function p1.pointerOnly()
		-- upvalues: p2 (copy), p1 (copy)
		local UserInputService = p2.userInputService
		
		if UserInputService == nil then
			return function(): boolean
				return false
			end
		else
			local MouseEnabledResult = p1.observe.MouseEnabled(UserInputService)
			local UchEnabled = p1.observe.TouchEnabled(UserInputService)
			local GamepadEnabledResult = p1.observe.GamepadEnabled(UserInputService)
			
			return function(p5): boolean
				-- upvalues: p1 (upval), MouseEnabledResult (copy), UchEnabled (copy), GamepadEnabledResult (copy)
				return p1.readSource(MouseEnabledResult, p5) == true and (p1.readSource(UchEnabled, p5) ~= true and p1.readSource(GamepadEnabledResult, p5) ~= true)
			end
		end
	end
	
	function p1.viewingDistance(p5)
		-- upvalues: p1 (copy), p4 (copy)
		local ReadResult = p1.read(p4.viewingDistance, p5)
		assert(ReadResult == nil or (ReadResult == "automatic" or (ReadResult == "near" or ReadResult == "ten-foot")), "Facet environment viewingDistance must be automatic, near or ten-foot")
		
		return ReadResult or "automatic"
	end
	
	function p1.tenFoot()
		-- upvalues: p2 (copy), p1 (copy), AdaptiveModule (upval)
		local GuiService = p2.guiService
		local UserInputService = p2.userInputService
		local TenFootInterface = false
		
		if GuiService then
			local Success, Result = pcall(function()
				-- upvalues: GuiService (copy)
				return GuiService:IsTenFootInterface()
			end)
			
			if Success then
				Success = Result == true
			end
			TenFootInterface = Success
		end
		local function _(p5): boolean
			return p5 ~= nil and p5.GetPropertyChangedSignal ~= nil
		end
		
		local HasGetPropertyChangedSignal: boolean = GuiService ~= nil and GuiService.GetPropertyChangedSignal ~= nil
		local ViewportDisplaySizeResult = if HasGetPropertyChangedSignal then p1.observe.ViewportDisplaySize(GuiService) else nil
		local HasGetPropertyChangedSignal1: boolean = UserInputService ~= nil and UserInputService.GetPropertyChangedSignal ~= nil
		local MouseEnabledResult = if HasGetPropertyChangedSignal1 then p1.observe.MouseEnabled(UserInputService) else nil
		local HasGetPropertyChangedSignal2: boolean = UserInputService ~= nil and UserInputService.GetPropertyChangedSignal ~= nil
		local UchEnabled = if HasGetPropertyChangedSignal2 then p1.observe.TouchEnabled(UserInputService) else nil
		
		return function(p5)
			-- upvalues: ViewportDisplaySizeResult (copy), p1 (upval), AdaptiveModule (upval), TenFootInterface (ref), MouseEnabledResult (copy), UchEnabled (copy)
			local Source = if ViewportDisplaySizeResult then p1.readSource(ViewportDisplaySizeResult, p5) else nil
			
			return AdaptiveModule.isTenFoot({
				viewingDistance = p1.viewingDistance(p5),
				tenFootInterface = TenFootInterface,
				displaySize = if typeof(Source) == "EnumItem" then Source.Name else nil,
				mouse = if MouseEnabledResult then p1.readSource(MouseEnabledResult, p5) == true else false,
				touch = if UchEnabled then p1.readSource(UchEnabled, p5) == true else false
			})
		end
	end
	
	local ReadFunction = p1.read
	local Theme = p2.theme
	p1.runtime:watch(function()
		-- upvalues: Compose (copy), p1 (copy), Callback (copy), Theme (copy), p2 (copy), ReadFunction (copy), p3 (copy), ThemeSupportModule (upval)
		local FormulaResult = Compose.formula(p1.tenFoot())
		Callback(function(p5)
			-- upvalues: p1 (upval), FormulaResult (copy)
			return p1.readSource(FormulaResult, p5)
		end)
		
		if Theme ~= nil then
			p2.theme = Compose.formula(function(p5)
				-- upvalues: ReadFunction (upval), Theme (copy), p1 (upval), FormulaResult (copy), p3 (upval)
				local ReadResult = ReadFunction(Theme, p5)
				
				return if p1.readSource(FormulaResult, p5) then p3.forDistance(ReadResult, "ten-foot") else ReadResult
			end, ThemeSupportModule.sameBesidesPalettes)
		end
	end)
	
	function p1.hitFloor()
		-- upvalues: p1 (copy), p2 (copy), Callback1 (copy)
		local PointerOnlyResult = p1.pointerOnly()
		
		return function(p5)
			-- upvalues: p1 (upval), p2 (upval), Callback1 (upval), PointerOnlyResult (copy)
			local TargetSizesMinimum = p1.metric("targetSizes.minimum", p5)
			local ReadResult = p1.read(p2.theme, p5)
			local TargetSizesPointer = Callback1(if ReadResult then ReadResult.metrics else nil, "targetSizes.pointer")
			
			return if TargetSizesPointer == nil or TargetSizesMinimum <= TargetSizesPointer or not PointerOnlyResult(p5) then TargetSizesMinimum else TargetSizesPointer
		end
	end
	
	function p1.effectiveInput()
		-- upvalues: p2 (copy), p1 (copy)
		local UserInputService = p2.userInputService
		
		local function watch(p5)
			-- upvalues: UserInputService (copy), p1 (upval)
			if UserInputService == nil then
				return nil
			else
				local Success, Result = pcall(({
					PreferredInput = p1.observe.PreferredInput,
					MouseEnabled = p1.observe.MouseEnabled,
					TouchEnabled = p1.observe.TouchEnabled,
					GamepadEnabled = p1.observe.GamepadEnabled
				})[p5], UserInputService)
				
				return if Success then Result else nil
			end
		end
		
		local PreferredInput = watch("PreferredInput")
		local MouseEnabled = watch("MouseEnabled")
		local TouchEnabled = watch("TouchEnabled")
		local GamepadEnabled = watch("GamepadEnabled")
		
		local function _(p5, p6): boolean
			-- upvalues: p1 (upval)
			return p5 ~= nil and p1.readSource(p5, p6) == true
		end
		
		return function(p5)
			-- upvalues: PreferredInput (copy), p1 (upval), MouseEnabled (copy), TouchEnabled (copy), GamepadEnabled (copy)
			local Source = if PreferredInput then p1.readSource(PreferredInput, p5) else nil
			local Name = if typeof(Source) == "EnumItem" then Source.Name else Source
			
			if Name == "Touch" or Name == "Gamepad" then
				return Name
			elseif MouseEnabled ~= nil and p1.readSource(MouseEnabled, p5) == true then
				return "KeyboardAndMouse"
			elseif TouchEnabled ~= nil and p1.readSource(TouchEnabled, p5) == true then
				return "Touch"
			else
				local IsSource: boolean = GamepadEnabled ~= nil and p1.readSource(GamepadEnabled, p5) == true
				
				return if IsSource then "Gamepad" else "KeyboardAndMouse"
			end
		end
	end
	
	function p1.thumbFloor(p5)
		-- upvalues: p2 (copy), p1 (copy)
		if p2.userInputService == nil then
			return function(): number
				return 0
			end
		else
			local EffectiveInputResult = p1.effectiveInput()
			local UchFloor = p1.touchFloor()
			
			return function(Callback)
				-- upvalues: EffectiveInputResult (copy), UchFloor (copy), p5 (copy)
				return if EffectiveInputResult(Callback) == "Touch" then if Callback then Callback(p5) else p5:peek() else UchFloor(Callback)
			end
		end
	end
	
	function p1.touchFloor()
		-- upvalues: p2 (copy), p1 (copy)
		if p2.userInputService == nil then
			return function(): number
				return 0
			end
		else
			local EffectiveInputResult = p1.effectiveInput()
			
			return function(p5)
				-- upvalues: EffectiveInputResult (copy), p1 (upval)
				return if EffectiveInputResult(p5) == "KeyboardAndMouse" then 0 else p1.metric("targetSizes.minimum", p5)
			end
		end
	end
	
	p1.runtime:watch(function()
		-- upvalues: p1 (copy)
		local EffectiveInputResult = p1.effectiveInput()
		
		function p1.effectiveInput()
			-- upvalues: EffectiveInputResult (copy)
			return EffectiveInputResult
		end
		
		local PointerOnlyResult = p1.pointerOnly()
		local TenFootResult = p1.tenFoot()
		local HitFloorResult = p1.hitFloor()
		local UchFloor = p1.touchFloor()
		
		function p1.pointerOnly()
			-- upvalues: PointerOnlyResult (copy)
			return PointerOnlyResult
		end
		
		function p1.tenFoot()
			-- upvalues: TenFootResult (copy)
			return TenFootResult
		end
		
		function p1.hitFloor()
			-- upvalues: HitFloorResult (copy)
			return HitFloorResult
		end
		
		function p1.touchFloor()
			-- upvalues: UchFloor (copy)
			return UchFloor
		end
		
		local FormulaResult = p1.Compose.formula(function(p5): boolean
			-- upvalues: UchFloor (copy)
			return UchFloor(p5) > 0
		end)
		
		function p1.touchFloorActive()
			-- upvalues: FormulaResult (copy)
			return FormulaResult
		end
	end)
end