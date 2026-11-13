local DragPointerModule = require("./drag_pointer")
local _ = require("./input_kit")
local _ = require("./input_types")
local _ = require("./types")
local _ = require("./control_types")
local _ = require("./input_props")
local _ = require("../vendor/compose/core")

return function(p1, p2, p3)
	-- upvalues: DragPointerModule (copy)
	local Runtime = p1.runtime
	local Host = p1.Host
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local ReadFunction1 = p1.read
	local TypesUDim = p1.types.UDim
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	local EnabledFunction = p3.enabled
	local ChangedFunction = p3.changed
	
	local function level(p4, p5)
		-- upvalues: p3 (copy), EnabledFunction (copy), ChangedFunction (copy), Compose (copy), ReadFunction (copy), TypesUDim2 (copy), p1 (copy), TypesEnum (copy), Host (copy), ReadFunction1 (copy), TypesVector2 (copy), Runtime (copy), TypesUDim (copy), DragPointerModule (upval)
		p3.requireValue(p4, "number", if p5 then "Rating" else "LevelPicker")
		local Count = p4.count or 5
		assert(type(Count) == "number" and (Count > 0 and Count % 1 == 0) and Count < 1e999, "Facet.LevelPicker: count must be a positive integer")
		local MinValue: number = if p4.allowZero == false then 1 else 0
		local Glyph = if p5 then "glyph" else p4.segment or "bar"
		assert(table.find({ "bar", "glyph", "image" }, Glyph), "Facet.LevelPicker: invalid segment")
		assert(Glyph == "glyph" or p4.glyphs == nil, "Facet.LevelPicker: glyphs require glyph segments")
		assert(Glyph == "image" or p4.images == nil, "Facet.LevelPicker: images require image segments")
		local FacetLevelPickerInvalidSize = assert(({ small = 20, medium = 28, large = 36 })[p4.starSize or (p4.segmentSize or "small")], "Facet.LevelPicker: invalid size")
		local Glyphs = p4.glyphs or { filled = "★", empty = "☆" }
		
		local function interactive(p6): boolean
			-- upvalues: EnabledFunction (upval), p4 (copy)
			return EnabledFunction(p4, p6) and p4.readOnly ~= true
		end
		
		local function _(Value: number)
			-- upvalues: EnabledFunction (upval), p4 (copy), ChangedFunction (upval), MinValue (copy), Count (copy)
			if EnabledFunction(p4, nil) and p4.readOnly ~= true then
				ChangedFunction(p4, (math.clamp(Value, MinValue, Count)))
			end
		end
		
		local CellResult = Compose.cell(1e999)
		local CellResult1 = Compose.cell(1e999)
		local FormulaResult = Compose.formula(function(Callback): number
			-- upvalues: CellResult (copy), CellResult1 (copy), FacetLevelPickerInvalidSize (copy), Count (copy)
			return (math.min(FacetLevelPickerInvalidSize, (math.max(1, (math.floor((math.min(Callback(CellResult), Callback(CellResult1)) - math.max(0, Count - 1) * 2) / Count))))))
		end)
		local Images = {}
		
		for i = 1, Count do
			local _ = function(p6): boolean
				-- upvalues: ReadFunction (upval), p4 (copy), i (copy)
				return i <= ReadFunction(p4.value, p6)
			end
			
			local LevelName: string = `Level{i}`
			
			local function Size(Callback)
				-- upvalues: TypesUDim2 (upval), FormulaResult (copy)
				return TypesUDim2.fromOffset(Callback(FormulaResult), Callback(FormulaResult))
			end
			
			local TextResult = nil
			local v1 = nil
			
			if Glyph == "glyph" then
				TextResult = p1.text({
					BackgroundTransparency = 1,
					Selectable = false,
					Name = LevelName,
					Size = Size,
					AutomaticSize = TypesEnum.AutomaticSize.XY,
					TextSize = FormulaResult,
					TextXAlignment = TypesEnum.TextXAlignment.Center,
					Text = function(p6)
						-- upvalues: ReadFunction (upval), p4 (copy), i (copy), Glyphs (copy)
						return if ReadFunction(p4.value, p6) >= i then Glyphs.filled else Glyphs.empty
					end
				})
				v1 = "TextColor3"
			elseif Glyph == "image" then
				local Images1 = p4.images
				assert(Images1 and (Images1.filled and Images1.empty), "Facet.LevelPicker: image segments require filled and empty images")
				TextResult = Host.ImageLabel({
					BackgroundTransparency = 1,
					Selectable = false,
					Name = LevelName,
					Size = Size,
					Image = function(p6)
						-- upvalues: ReadFunction (upval), p4 (copy), i (copy), Images1 (copy)
						return if ReadFunction(p4.value, p6) >= i then Images1.filled else Images1.empty
					end
				})
				v1 = "ImageColor3"
			else
				TextResult = p1.styled(Host.Frame(LevelName)({
					Size = function(Callback)
						-- upvalues: TypesUDim2 (upval), FormulaResult (copy), i (copy), Count (copy)
						return TypesUDim2.fromOffset(Callback(FormulaResult), (math.round(Callback(FormulaResult) * (0.3 + i * 0.7 / Count))))
					end,
					Selectable = false,
					p1.corner(2)
				}), "level-segment")
				v1 = "BackgroundColor3"
				local Object = TextResult
				Compose.watch(function(p6)
					-- upvalues: ReadFunction (upval), p4 (copy), i (copy), Object (copy)
					if ReadFunction(p4.value, p6) >= i then
						Object:AddTag("facet-level-on")
						
						return
					end
					if Object:HasTag("facet-level-on") then
						Object:RemoveTag("facet-level-on")
					end
				end)
			end
			if p4.tint then
				Compose.watch(function(p6)
					-- upvalues: ReadFunction1 (upval), ReadFunction (upval), p4 (copy), i (copy), TextResult (ref), v1 (ref)
					local IsIBelow = i <= ReadFunction(p4.value, p6)
					local ReadResult = ReadFunction1(if IsIBelow then p4.tint.filled else p4.tint.empty, p6)
					
					if ReadResult == nil then
						TextResult:ResetPropertyToDefault(v1)
						
						return
					end
					if TextResult:IsA("TextLabel") then
						TextResult.TextColor3 = ReadResult
						
						return
					end
					if TextResult:IsA("ImageLabel") then
						TextResult.ImageColor3 = ReadResult
						
						return
					else
						TextResult.BackgroundColor3 = ReadResult
					end
				end)
			end
			table.insert(Images, TextResult)
		end
		local config = {
			Name = "Marks",
			Size = TypesUDim2.fromOffset(0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			AnchorPoint = TypesVector2.new(0.5, 0.5),
			Position = TypesUDim2.fromScale(0.5, 0.5),
			p3.lists.list({ gap = 2, align = "end" }, false)
		}
		
		for LayoutOrder, image in Images do
			Runtime.decorate(image, { LayoutOrder = LayoutOrder })
			config[#config + 1] = image
		end
		local FrameResult = Host.Frame(config)
		local EffectiveInputResult = p1.effectiveInput()
		
		local function spacing(Callback, p6): number
			-- upvalues: EffectiveInputResult (copy), p1 (upval), FormulaResult (copy), FacetLevelPickerInvalidSize (copy), Count (copy)
			local TargetSizesMinimum = if EffectiveInputResult(Callback) == "Touch" then p1.metric("targetSizes.minimum", Callback) else 0
			local CallbackResult = Callback(FormulaResult)
			
			return if CallbackResult < FacetLevelPickerInvalidSize then 2 else math.max(2, (math.min(TargetSizesMinimum - CallbackResult, if Count > 1 then math.floor((p6 - Count * CallbackResult) / (Count - 1)) else 1e999)))
		end
		
		local _ = function(Callback)
			-- upvalues: spacing (copy), CellResult (copy)
			return (spacing(Callback, Callback(CellResult)))
		end
		
		Runtime.decorate(assert(FrameResult:FindFirstChildWhichIsA("UIListLayout")), {
			Padding = function(Callback)
				-- upvalues: TypesUDim (upval), spacing (copy), CellResult (copy), CellResult1 (copy)
				return TypesUDim.new(0, (math.min(spacing(Callback, Callback(CellResult)), (spacing(Callback, Callback(CellResult1))))))
			end
		})
		local Frame = nil
		local Flag = nil
		local ClampedValue = nil
		local Flag1 = nil
		local v2 = nil
		local Flag2 = false
		local ClampedValue1 = nil
		
		local _ = function(p6)
			-- upvalues: FrameResult (copy), Frame (ref), ReadFunction (upval), p4 (copy), Count (copy)
			local X = FrameResult.AbsoluteSize.X
			local X1 = FrameResult.AbsolutePosition.X
			
			if X <= 0 then
				X = Frame.AbsoluteSize.X
				X1 = Frame.AbsolutePosition.X
			end
			return if X <= 0 then ReadFunction(p4.value) else math.clamp(math.floor((p6.X - X1) / X * Count) + 1, 1, Count)
		end
		
		local function cancel()
			-- upvalues: Flag (ref), Flag1 (ref), ChangedFunction (upval), p4 (copy), ClampedValue (ref)
			if Flag then
				Flag = false
				Flag1 = true
				ChangedFunction(p4, assert(ClampedValue))
			end
		end
		
		local PropsResult = p1.props(p4, {
			"value", "count", "allowZero", "enabled", "readOnly", "glyphs", "images",
			"tint", "segment", "starSize", "segmentSize", "onChange"
		}, {
			PressHapticEffect = if p4.PressHapticEffect == nil and p1.haptic(true) then Compose.static(p1.haptic(true)) else nil,
			Text = "",
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			Size = function(Callback)
				-- upvalues: TypesUDim2 (upval), Count (copy), FacetLevelPickerInvalidSize (copy), spacing (copy), CellResult (copy)
				return TypesUDim2.fromOffset(Count * FacetLevelPickerInvalidSize + math.max(0, Count - 1) * spacing(Callback, Callback(CellResult)), (math.max(44, FacetLevelPickerInvalidSize)))
			end,
			Selectable = interactive,
			Interactable = interactive,
			FrameResult,
			Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Shrink }),
			Host.UIDragDetector("Scrub")({
				ResponseStyle = TypesEnum.UIDragDetectorResponseStyle.CustomOffset,
				Enabled = interactive,
				DragStart = function(p6)
					-- upvalues: EnabledFunction (upval), p4 (copy), Flag (ref), ClampedValue (ref), ReadFunction (upval), v2 (ref), DragPointerModule (upval), p1 (upval), Flag2 (ref), ClampedValue1 (ref), FrameResult (copy), Frame (ref), Count (copy), ChangedFunction (upval), MinValue (copy)
					if EnabledFunction(p4, nil) and p4.readOnly ~= true then
						local ReadResult = ReadFunction(p4.value)
						Flag = true
						ClampedValue = ReadResult
						v2 = DragPointerModule(p1, p6)
						Flag2 = false
						local v3 = assert(v2)
						local X = FrameResult.AbsoluteSize.X
						local X1 = FrameResult.AbsolutePosition.X
						
						if X <= 0 then
							X = Frame.AbsoluteSize.X
							X1 = Frame.AbsolutePosition.X
						end
						ClampedValue1 = if X <= 0 then ReadFunction(p4.value) else math.clamp(math.floor((v3.X - X1) / X * Count) + 1, 1, Count)
						local Value: number = assert(ClampedValue1)
						
						if EnabledFunction(p4, nil) and p4.readOnly ~= true then
							ChangedFunction(p4, (math.clamp(Value, MinValue, Count)))
						end
					end
				end,
				DragContinue = function(p6)
					-- upvalues: Flag (ref), DragPointerModule (upval), p1 (upval), Flag2 (ref), v2 (ref), ClampedValue1 (ref), FrameResult (copy), Frame (ref), ReadFunction (upval), p4 (copy), Count (copy), EnabledFunction (upval), ChangedFunction (upval), MinValue (copy)
					if Flag then
						local DragPointerModuleResult = DragPointerModule(p1, p6)
						Flag2 = Flag2 or DragPointerModuleResult ~= v2
						local X = FrameResult.AbsoluteSize.X
						local X1 = FrameResult.AbsolutePosition.X
						
						if X <= 0 then
							X = Frame.AbsoluteSize.X
							X1 = Frame.AbsolutePosition.X
						end
						ClampedValue1 = if X <= 0 then ReadFunction(p4.value) else math.clamp(math.floor((DragPointerModuleResult.X - X1) / X * Count) + 1, 1, Count)
						local Value: number = assert(ClampedValue1)
						
						if EnabledFunction(p4, nil) and p4.readOnly ~= true then
							ChangedFunction(p4, (math.clamp(Value, MinValue, Count)))
						end
					end
				end,
				DragEnd = function()
					-- upvalues: Flag (ref), Flag1 (ref), Flag2 (ref), ClampedValue1 (ref), ClampedValue (ref), MinValue (copy), EnabledFunction (upval), p4 (copy), ChangedFunction (upval), Count (copy)
					if Flag then
						Flag = false
						Flag1 = true
						
						if not Flag2 and ClampedValue1 == ClampedValue and MinValue == 0 and (EnabledFunction(p4, nil) and p4.readOnly ~= true) then
							ChangedFunction(p4, (math.clamp(0, MinValue, Count)))
						end
					end
				end
			})
		})
		
		function PropsResult.Activated(p6, p7)
			-- upvalues: Flag1 (ref), FrameResult (copy), Frame (ref), ReadFunction (upval), p4 (copy), Count (copy), MinValue (copy), EnabledFunction (upval), ChangedFunction (upval)
			if Flag1 then
				Flag1 = false
				
				return
			end
			if p6 and p6.Position then
				local Position = p6.Position
				local X = FrameResult.AbsoluteSize.X
				local X1 = FrameResult.AbsolutePosition.X
				
				if X <= 0 then
					X = Frame.AbsoluteSize.X
					X1 = Frame.AbsolutePosition.X
				end
				local ReadResult = if X <= 0 then ReadFunction(p4.value) else math.clamp(math.floor((Position.X - X1) / X * Count) + 1, 1, Count)
				local Value = if ReadResult == ReadFunction(p4.value) and MinValue == 0 then 0 else ReadResult
				
				if EnabledFunction(p4, nil) and p4.readOnly ~= true then
					ChangedFunction(p4, (math.clamp(Value, MinValue, Count)))
				end
			else
				local MinValue1 = if ReadFunction(p4.value) == Count then MinValue else ReadFunction(p4.value) + 1
				
				if EnabledFunction(p4, nil) and p4.readOnly ~= true then
					ChangedFunction(p4, (math.clamp(MinValue1, MinValue, Count)))
				end
			end
			if p4.Activated then
				p4.Activated(p6, p7)
			end
		end
		
		Frame = p1.styled(Host.TextButton(PropsResult), if p5 then "rating" else "level-picker")
		local ParentResult = p1.observe.Parent(Frame)
		local LayoutUnitResult = p1.layoutUnit(Frame)
		local CellResult2 = Compose.cell(0)
		Compose.watch(function(Callback)
			-- upvalues: ParentResult (copy), TypesEnum (upval), p1 (upval), Compose (upval), CellResult2 (copy)
			local CallbackResult = Callback(ParentResult)
			
			if CallbackResult and CallbackResult:IsA("GuiObject") and CallbackResult.AutomaticSize ~= TypesEnum.AutomaticSize.X and CallbackResult.AutomaticSize ~= TypesEnum.AutomaticSize.XY then
				local AbsoluteSizeResult = p1.observe.AbsoluteSize(CallbackResult)
				Compose.watch(function(Callback)
					-- upvalues: CellResult2 (upval), AbsoluteSizeResult (copy)
					CellResult2:set(Callback(AbsoluteSizeResult).X)
				end)
				
				return
			else
				CellResult2:set(0)
			end
		end)
		local AbsoluteSizeResult = p1.observe.AbsoluteSize(Frame)
		Compose.watch(function(Callback)
			-- upvalues: CellResult2 (copy), LayoutUnitResult (copy), CellResult (copy), AbsoluteSizeResult (copy), CellResult1 (copy)
			local CallbackResult: number = Callback(CellResult2)
			local CallbackResult1: number = Callback(LayoutUnitResult)
			CellResult:set(if CallbackResult > 0 and CallbackResult1 > 0 then CallbackResult / CallbackResult1 else 1e999)
			local X: number = Callback(AbsoluteSizeResult).X
			CellResult1:set(if X > 0 and CallbackResult1 > 0 then X / CallbackResult1 else 1e999)
		end)
		p3.attributes(Frame, {
			value = function(p6): number
				-- upvalues: ReadFunction (upval), p4 (copy), MinValue (copy), Count (copy)
				return (math.clamp(ReadFunction(p4.value, p6), MinValue, Count))
			end,
			minimum = MinValue,
			maximum = Count,
			semanticValue = function(p6): string
				-- upvalues: ReadFunction (upval), p4 (copy), MinValue (copy), Count (copy)
				return `{math.clamp(ReadFunction(p4.value, p6), MinValue, Count)} of {MinValue} to {Count}`
			end
		})
		Runtime.connect(Frame, "InputBegan", function()
			-- upvalues: Flag1 (ref)
			Flag1 = false
		end)
		p3.adjustment(Frame, p4, function(p6)
			-- upvalues: ReadFunction (upval), p4 (copy), EnabledFunction (upval), ChangedFunction (upval), MinValue (copy), Count (copy)
			local NewReadResult = ReadFunction(p4.value) + p6
			
			if EnabledFunction(p4, nil) and p4.readOnly ~= true then
				ChangedFunction(p4, (math.clamp(NewReadResult, MinValue, Count)))
			end
		end, cancel, MinValue, Count)
		Compose.watch(function(p6)
			-- upvalues: EnabledFunction (upval), p4 (copy), Flag (ref), Flag1 (ref), ChangedFunction (upval), ClampedValue (ref)
			if (not EnabledFunction(p4, p6) or p4.readOnly == true) and Flag then
				Flag = false
				Flag1 = true
				ChangedFunction(p4, assert(ClampedValue))
			end
		end)
		local UserInputService = p1.config.services.UserInputService
		
		if UserInputService then
			local PreferredInputResult = p1.observe.PreferredInput(UserInputService)
			Compose.watch(function(Callback)
				-- upvalues: PreferredInputResult (copy), TypesEnum (upval), Flag (ref), Flag1 (ref), ChangedFunction (upval), p4 (copy), ClampedValue (ref)
				if Callback(PreferredInputResult) == TypesEnum.PreferredInput.Gamepad and Flag then
					Flag = false
					Flag1 = true
					ChangedFunction(p4, assert(ClampedValue))
				end
			end)
		end
		return Frame
	end
	
	p2.Rating = p1.construct("Rating", function(p6)
		-- upvalues: level (copy)
		return (level(p6, true))
	end)
	p2.LevelPicker = p1.construct("LevelPicker", function(p6)
		-- upvalues: level (copy)
		return (level(p6, false))
	end)
end