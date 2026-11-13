local _ = require("./theme_types")
local _ = require("./control_types")
local SegmentMetricsModule = require("./segment_metrics")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("./media_types")
local _ = require("./content_types")
local ReducedFunction = require("./motion").reduced
local ScrollLockModule = require("./scroll_lock")
local _ = require("../vendor/compose/core")
local _ = require("./navigation_props")
local _ = require("./nav_picker_parts")

return function(p1, p2, p3, p4)
	-- upvalues: ReducedFunction (copy), SegmentMetricsModule (copy), ScrollLockModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesUDim = p1.types.UDim
	local Keys = p4.keys
	local DeriveFunction = p4.derive
	local LayoutWidthFunction = p4.layoutWidth
	local SideChromeFunction = p4.sideChrome
	local WrapCaptionsFunction = p4.wrapCaptions
	
	local function slideSelection(Object, Frames, p5, Indicator)
		-- upvalues: ReducedFunction (upval), p1 (copy), Runtime (copy), ReadFunction (copy), Host (copy), TypesUDim2 (copy), TypesVector2 (copy), Compose (copy)
		local ReducedResult = ReducedFunction(p1)
		local Control = p1.motionSpring("control")
		local AbsoluteContentSizeResult = p1.observe.AbsoluteContentSize(assert(Object:FindFirstChildWhichIsA("UIListLayout", true)))
		local v1 = nil
		local Vector = nil
		
		local function reshaped(Vector, Vector1): boolean
			return if Vector.Y <= 0 or Vector1.Y <= 0 then math.abs(Vector1.X - Vector.X) > 0.5 or math.abs(Vector1.Y - Vector.Y) > 0.5 else math.max(Vector.Y, Vector1.Y) * 0.5 < math.abs(Vector1.X * Vector.Y - Vector.X * Vector1.Y)
		end
		
		local SpringResult = Runtime.spring(function(Callback)
			-- upvalues: AbsoluteContentSizeResult (copy), ReadFunction (upval), Indicator (copy), ReducedResult (copy), p5 (copy)
			local CallbackResult = Callback(AbsoluteContentSizeResult)
			
			return if CallbackResult.X > 0 and CallbackResult.Y > 0 and ReadFunction(Indicator, Callback) ~= "underline" and not ReducedResult(Callback) then Callback(p5) else 0
		end, {
			tolerance = 0.001,
			period = Control.period,
			damping = Control.damping,
			reducedMotion = function(Callback)
				-- upvalues: AbsoluteContentSizeResult (copy), p5 (copy), Vector (ref), v1 (ref), reshaped (copy), ReducedResult (copy)
				local CallbackResult = Callback(AbsoluteContentSizeResult)
				
				if CallbackResult.X <= 0 or CallbackResult.Y <= 0 then
					return true
				else
					local CallbackResult1 = Callback(p5)
					local NoVector = Vector == nil or CallbackResult1 == v1 and reshaped(Vector, CallbackResult)
					v1 = CallbackResult1
					Vector = CallbackResult
					
					return ReducedResult(Callback) or NoVector
				end
			end
		})
		local v2 = nil
		local _, MountResult2 = Runtime.mount(function()
			-- upvalues: v2 (ref), Host (upval), TypesUDim2 (upval)
			v2 = Host.Frame("SlideUnit")({ Visible = false, Size = TypesUDim2.fromScale(1, 1) })
			
			return Host.Folder("Slide")({ v2 })
		end, Object)
		local AbsoluteSizeResult = p1.observe.AbsoluteSize(assert(v2))
		local AbsolutePositionResult = p1.observe.AbsolutePosition(assert(v2))
		
		local function rectAt(Callback, Floored)
			-- upvalues: AbsoluteSizeResult (copy), AbsoluteContentSizeResult (copy), Frames (copy), AbsolutePositionResult (copy), TypesVector2 (upval)
			local CallbackResult = Callback(AbsoluteSizeResult)
			
			if CallbackResult.X <= 0 or CallbackResult.Y <= 0 then
				return nil, nil
			end
			local CallbackResult1 = Callback(AbsoluteContentSizeResult)
			
			for _, frame in Frames do
				if Callback(frame.order) == Floored then
					local CallbackResultDelta = Callback(frame.at) - Callback(AbsolutePositionResult)
					local CallbackResult2 = Callback(frame.size)
					local NewTypesVector = TypesVector2.new(math.clamp(CallbackResultDelta.X, 0, CallbackResult1.X), (math.clamp(CallbackResultDelta.Y, 0, CallbackResult1.Y)))
					
					return NewTypesVector / CallbackResult, TypesVector2.new(math.min(CallbackResult2.X, CallbackResult1.X - NewTypesVector.X), (math.min(CallbackResult2.Y, CallbackResult1.Y - NewTypesVector.Y))) / CallbackResult
				end
			end
			return nil, nil
		end
		
		local FormulaResult = Compose.formula(function(Callback)
			-- upvalues: AbsoluteContentSizeResult (copy), SpringResult (copy), rectAt (copy), p5 (copy)
			local CallbackResult = Callback(AbsoluteContentSizeResult)
			
			if CallbackResult.X <= 0 or CallbackResult.Y <= 0 then
				return nil
			end
			local CallbackResult1: number = Callback(SpringResult)
			local Floored = math.floor(CallbackResult1)
			local RectAtResult, RectAtResult2 = rectAt(Callback, Floored)
			local RectAtResult1, RectAtResult2_1 = rectAt(Callback, Floored + 1)
			local CallbackResultDelta = CallbackResult1 - Floored
			
			if RectAtResult == nil or RectAtResult2 == nil or CallbackResultDelta > 0 and (RectAtResult1 == nil or RectAtResult2_1 == nil) then
				RectAtResult, RectAtResult2 = rectAt(Callback, Callback(p5))
				CallbackResultDelta = 0
			end
			return if RectAtResult == nil or RectAtResult2 == nil then nil elseif CallbackResultDelta > 0 and RectAtResult1 ~= nil and RectAtResult2_1 ~= nil then {
				RectAtResult:Lerp(RectAtResult1, CallbackResultDelta),
				RectAtResult2:Lerp(RectAtResult2_1, CallbackResultDelta)
			} else { RectAtResult, RectAtResult2 }
		end)
		
		local function shown(Callback): boolean
			-- upvalues: ReadFunction (upval), Indicator (copy), ReducedResult (copy), FormulaResult (copy), p5 (copy)
			return ReadFunction(Indicator, Callback) ~= "underline" and (not ReducedResult(Callback) and (Callback(FormulaResult) ~= nil and Callback(p5) ~= 0))
		end
		
		Compose.watch(function(Callback)
			-- upvalues: ReadFunction (upval), Indicator (copy), ReducedResult (copy), FormulaResult (copy), p5 (copy), Object (copy)
			if ReadFunction(Indicator, Callback) ~= "underline" and (not ReducedResult(Callback) and (Callback(FormulaResult) ~= nil and Callback(p5) ~= 0)) then
				Object:AddTag("facet-segmented-slides")
				
				return
			end
			if Object:HasTag("facet-segmented-slides") then
				Object:RemoveTag("facet-segmented-slides")
			end
		end)
		Runtime.mount(function()
			-- upvalues: p1 (upval), Host (upval), shown (copy), FormulaResult (copy), TypesUDim2 (upval)
			return p1.styled(Host.Frame("SelectionFill")({
				ZIndex = 0,
				Active = false,
				Visible = shown,
				Position = function(Callback)
					-- upvalues: FormulaResult (upval), TypesUDim2 (upval)
					local CallbackResult = Callback(FormulaResult)
					
					return if CallbackResult then TypesUDim2.fromScale(CallbackResult[1].X, CallbackResult[1].Y) else TypesUDim2.new()
				end,
				Size = function(Callback)
					-- upvalues: FormulaResult (upval), TypesUDim2 (upval)
					local CallbackResult = Callback(FormulaResult)
					
					return if CallbackResult then TypesUDim2.fromScale(CallbackResult[2].X, CallbackResult[2].Y) else TypesUDim2.new()
				end
			}), "segment-fill")
		end, MountResult2)
	end
	
	return function(Tbl: Frame, p6, p7)
		-- upvalues: ReadFunction (copy), Compose (copy), ReadFunction (copy), TypesEnum (copy), p1 (copy), ReadFunction (copy), SegmentMetricsModule (upval), Host (copy), DeriveFunction (copy), TypesUDim (copy), p2 (copy), TypesUDim2 (copy), ReadFunction (copy), p4 (copy), Runtime (copy), TypesVector2 (copy), p3 (copy), SideChromeFunction (copy), WrapCaptionsFunction (copy), Keys (copy), ScrollLockModule (upval), LayoutWidthFunction (copy), slideSelection (copy)
		local IsSelectedFunction = p6.isSelected
		local SelectFunction = p6.select
		local Options = p6.options
		local IsNotSegmented: boolean = p7 ~= "segmented" or ReadFunction(Tbl.axis) == "y"
		
		local function _(p8): boolean
			-- upvalues: p7 (copy), ReadFunction (upval), Tbl (copy)
			return p7 == "segmented" and ReadFunction(Tbl.axis, p8) ~= "y"
		end
		
		local CellResult = Compose.cell(1e999)
		local CellResult1 = Compose.cell(false)
		local NoIsNotSegmented: boolean = Tbl.label ~= nil and not IsNotSegmented
		local HasSize: boolean = p7 == "segmented" and Tbl.label == nil and (Tbl.Size ~= nil or Tbl.AutomaticSize ~= nil)
		local Size = Tbl.Size
		local AutomaticSize = Tbl.AutomaticSize
		
		local _ = function(p8): boolean
			-- upvalues: ReadFunction (upval), AutomaticSize (copy), p7 (copy), ReadFunction (upval), Tbl (copy), TypesEnum (upval)
			local ReadResult = ReadFunction(AutomaticSize, p8)
			
			return p7 == "segmented" and ReadFunction(Tbl.axis, p8) ~= "y" and (ReadResult == TypesEnum.AutomaticSize.Y or ReadResult == TypesEnum.AutomaticSize.XY)
		end
		
		local function stripAutomatic(p8)
			-- upvalues: ReadFunction (upval), AutomaticSize (copy), TypesEnum (upval), p7 (copy), ReadFunction (upval), Tbl (copy)
			local ReadResult = ReadFunction(AutomaticSize, p8) or TypesEnum.AutomaticSize.None
			local ReadResult1 = ReadFunction(AutomaticSize, p8)
			
			if p7 == "segmented" and ReadFunction(Tbl.axis, p8) ~= "y" and (ReadResult1 == TypesEnum.AutomaticSize.Y or ReadResult1 == TypesEnum.AutomaticSize.XY) then
				return if ReadResult == TypesEnum.AutomaticSize.XY then TypesEnum.AutomaticSize.X else TypesEnum.AutomaticSize.None
			elseif p7 == "segmented" and ReadFunction(Tbl.axis, p8) ~= "y" then
				return ReadResult
			else
				local IsReadResultMatch: boolean = ReadResult == TypesEnum.AutomaticSize.X or ReadResult == TypesEnum.AutomaticSize.XY
				
				return if IsReadResultMatch then TypesEnum.AutomaticSize.XY else TypesEnum.AutomaticSize.Y
			end
		end
		
		local _ = function(p8)
			-- upvalues: NoIsNotSegmented (copy), ReadFunction (upval), Tbl (copy)
			return NoIsNotSegmented or ReadFunction(Tbl.sizing, p8) == "hug"
		end
		
		local function segmentedAutomatic(p8)
			-- upvalues: p7 (copy), ReadFunction (upval), Tbl (copy), TypesEnum (upval), NoIsNotSegmented (copy)
			if p7 == "segmented" and ReadFunction(Tbl.axis, p8) ~= "y" then
				local NoIsNotSegmented1 = NoIsNotSegmented or ReadFunction(Tbl.sizing, p8) == "hug"
				
				return if NoIsNotSegmented1 then TypesEnum.AutomaticSize.X else TypesEnum.AutomaticSize.None
			else
				return TypesEnum.AutomaticSize.Y
			end
		end
		
		local _ = function(p8): boolean
			-- upvalues: p7 (copy), ReadFunction (upval), Tbl (copy), HasSize (copy), stripAutomatic (copy), TypesEnum (upval), NoIsNotSegmented (copy)
			if p7 ~= "segmented" or ReadFunction(Tbl.axis, p8) == "y" then
				return false
			end
			local StripAutomaticResult = nil
			if HasSize then
				StripAutomaticResult = stripAutomatic(p8)
			elseif p7 == "segmented" and ReadFunction(Tbl.axis, p8) ~= "y" then
				local NoIsNotSegmented1 = NoIsNotSegmented or ReadFunction(Tbl.sizing, p8) == "hug"
				StripAutomaticResult = if NoIsNotSegmented1 then TypesEnum.AutomaticSize.X else TypesEnum.AutomaticSize.None
			else
				StripAutomaticResult = TypesEnum.AutomaticSize.Y
			end
			return StripAutomaticResult == TypesEnum.AutomaticSize.X or StripAutomaticResult == TypesEnum.AutomaticSize.XY
		end
		
		local Frames = {}
		local CellResult2 = if Tbl.multiple == true then Compose.cell(0) else nil
		local CellResult2_1 = CellResult2 or Compose.formula(function(Callback)
			-- upvalues: Options (copy), IsSelectedFunction (copy)
			for i, value in Callback(Options) do
				if IsSelectedFunction(value.value, Callback) then
					return i
				end
			end
			return 0
		end)
		local YRatios = {}
		local CellResult3 = Compose.cell(0)
		
		local _ = function()
			-- upvalues: YRatios (copy), CellResult3 (copy)
			local Largest = 0
			
			for _, yRatio in YRatios do
				Largest = math.max(Largest, yRatio)
			end
			if Largest ~= CellResult3:peek() then
				CellResult3:set(Largest)
			end
		end
		
		local EffectiveInputResult = p1.effectiveInput()
		
		local function authoredHeight(p8)
			-- upvalues: ReadFunction (upval), Tbl (copy), ReadFunction (upval), TypesEnum (upval)
			local ReadResult = ReadFunction(Tbl.Size, p8)
			local ReadResult1 = ReadFunction(Tbl.AutomaticSize, p8)
			
			return if ReadResult and ReadResult.Y.Scale == 0 and ReadResult.Y.Offset > 0 and ReadResult1 ~= TypesEnum.AutomaticSize.Y and ReadResult1 ~= TypesEnum.AutomaticSize.XY then ReadResult.Y.Offset else nil
		end
		
		local function stripHeight(Callback)
			-- upvalues: p1 (upval), Tbl (copy), authoredHeight (copy), EffectiveInputResult (copy), SegmentMetricsModule (upval), ReadFunction (upval), CellResult3 (copy)
			local Height = p1.controlSize(Tbl.controlSize, "height", Callback)
			
			if Tbl.controlSize == nil and authoredHeight(Callback) == nil or EffectiveInputResult(Callback) == "Touch" then
				Height = math.max(Height, 44 + 2 * SegmentMetricsModule.inset)
			end
			local ReadResult = ReadFunction(p1.config.theme, Callback)
			local Control = if ReadResult and ReadResult.chrome then ReadResult.chrome.control else nil
			local ContentInsets = if Control then Control.contentInsets else nil
			local CallbackResult = if Callback then Callback(CellResult3) else CellResult3:peek()
			
			return if CallbackResult <= 0 or Control == nil or Control.kind == "native" or Control.kind == "none" then Height else math.max(Height, math.ceil(CallbackResult) + (math.max(0, ContentInsets and ContentInsets.top or 0) + math.max(0, ContentInsets and ContentInsets.bottom or 0)) + 2 * SegmentMetricsModule.inset)
		end
		
		local Inverted = not (Compose.isValue(Tbl.options) or type(Tbl.options) == "function")
		local List = {
			Host.UIListLayout({
				FillDirection = DeriveFunction(function(p8)
					-- upvalues: p7 (copy), ReadFunction (upval), Tbl (copy), TypesEnum (upval)
					return if p7 == "segmented" and ReadFunction(Tbl.axis, p8) ~= "y" then TypesEnum.FillDirection.Horizontal else TypesEnum.FillDirection.Vertical
				end, Tbl.axis),
				SortOrder = TypesEnum.SortOrder.LayoutOrder,
				Padding = TypesUDim.new(0, 4),
				HorizontalFlex = DeriveFunction(function(p8)
					-- upvalues: p7 (copy), ReadFunction (upval), Tbl (copy), HasSize (copy), stripAutomatic (copy), TypesEnum (upval), NoIsNotSegmented (copy)
					if p7 == "segmented" and ReadFunction(Tbl.axis, p8) ~= "y" and ReadFunction(Tbl.sizing, p8) ~= "hug" then
						local IsXMatch = nil
						if p7 == "segmented" and ReadFunction(Tbl.axis, p8) ~= "y" then
							local StripAutomaticResult = nil
							if HasSize then
								StripAutomaticResult = stripAutomatic(p8)
							elseif p7 == "segmented" and ReadFunction(Tbl.axis, p8) ~= "y" then
								local NoIsNotSegmented1 = NoIsNotSegmented or ReadFunction(Tbl.sizing, p8) == "hug"
								StripAutomaticResult = if NoIsNotSegmented1 then TypesEnum.AutomaticSize.X else TypesEnum.AutomaticSize.None
							else
								StripAutomaticResult = TypesEnum.AutomaticSize.Y
							end
							IsXMatch = StripAutomaticResult == TypesEnum.AutomaticSize.X or StripAutomaticResult == TypesEnum.AutomaticSize.XY
						else
							IsXMatch = false
						end
						if not IsXMatch then
							return TypesEnum.UIFlexAlignment.Fill
						end
					end
					return TypesEnum.UIFlexAlignment.None
				end, Tbl.axis, Tbl.sizing, Tbl.AutomaticSize),
				VerticalFlex = DeriveFunction(function(p8)
					-- upvalues: p7 (copy), ReadFunction (upval), Tbl (copy), TypesEnum (upval)
					return if p7 == "segmented" and ReadFunction(Tbl.axis, p8) == "y" and ReadFunction(Tbl.sizing, p8) ~= "hug" then TypesEnum.UIFlexAlignment.Fill else TypesEnum.UIFlexAlignment.None
				end, Tbl.axis, Tbl.sizing)
			})
		}
		
		if Tbl.query then
			table.insert(List, p2.TextInput("Search")({ placeholder = "Search", value = Tbl.query }))
		end
		table.insert(List, Compose.keyed({
			from = Options,
			key = function(p8)
				return p8.id or p8.value
			end,
			render = function(p8, LayoutOrder)
				-- upvalues: IsSelectedFunction (copy), Inverted (copy), Tbl (copy), p7 (copy), ReadFunction (upval), p2 (upval), stripHeight (copy), authoredHeight (copy), TypesUDim2 (upval), SegmentMetricsModule (upval), p1 (upval), ReadFunction (upval), TypesEnum (upval), DeriveFunction (upval), Compose (upval), ReadFunction (upval), p4 (upval), SelectFunction (copy), Host (upval), Runtime (upval), TypesVector2 (upval), p3 (upval), SideChromeFunction (upval), CellResult (copy), IsNotSegmented (copy), CellResult1 (copy), HasSize (copy), stripAutomatic (copy), NoIsNotSegmented (copy), WrapCaptionsFunction (upval), Options (copy), YRatios (copy), CellResult3 (copy), Frames (copy), CellResult2 (copy)
				local function Visible(Callback)
					-- upvalues: IsSelectedFunction (upval), p8 (copy)
					return IsSelectedFunction(Callback(p8).value, Callback)
				end
				
				local PeekResult = p8:peek()
				local NoQuery: boolean = Inverted and Tbl.query == nil
				local HasIcon: boolean = p7 == "segmented" and PeekResult.icon ~= nil
				local ButtonResult = p2.Button({
					Name = tostring(PeekResult.id or PeekResult.value),
					LayoutOrder = if NoQuery then LayoutOrder:peek() else LayoutOrder,
					Size = function(p9)
						-- upvalues: p7 (upval), ReadFunction (upval), Tbl (upval), stripHeight (upval), authoredHeight (upval), TypesUDim2 (upval), SegmentMetricsModule (upval), p1 (upval), ReadFunction (upval), TypesEnum (upval)
						if p7 == "segmented" and ReadFunction(Tbl.axis, p9) ~= "y" then
							return TypesUDim2.fromOffset(0, (math.max(0, math.max(authoredHeight(p9) or 0, (stripHeight(p9))) - 2 * SegmentMetricsModule.inset)))
						else
							local ReadResult = ReadFunction(Tbl.AutomaticSize, p9)
							local IsReadResultMatch: boolean = p7 == "segmented" and (ReadResult == TypesEnum.AutomaticSize.X or ReadResult == TypesEnum.AutomaticSize.XY)
							
							return TypesUDim2.new(if IsReadResultMatch then 0 else 1, 0, 0, if Tbl.controlSize == nil then 44 else p1.controlSize(Tbl.controlSize, "height", p9))
						end
					end,
					AutomaticSize = if p7 == "segmented" then DeriveFunction(function(p9)
						-- upvalues: ReadFunction (upval), Tbl (upval), p7 (upval), ReadFunction (upval), TypesEnum (upval)
						local ReadResult = ReadFunction(Tbl.AutomaticSize, p9)
						local IsNotY: boolean = p7 == "segmented" and ReadFunction(Tbl.axis, p9) ~= "y"
						
						return if IsNotY then TypesEnum.AutomaticSize.X elseif ReadResult == TypesEnum.AutomaticSize.X or ReadResult == TypesEnum.AutomaticSize.XY then TypesEnum.AutomaticSize.XY else TypesEnum.AutomaticSize.Y
					end, Tbl.axis, Tbl.AutomaticSize) else TypesEnum.AutomaticSize.Y,
					label = DeriveFunction(function(Callback)
						-- upvalues: ReadFunction (upval), Tbl (upval), p8 (copy)
						return if ReadFunction(Tbl.iconOnly, Callback) then "" else ReadFunction((if Callback then Callback(p8) else p8:peek()).label, Callback)
					end, if NoQuery then nil else p8, Tbl.iconOnly, PeekResult.label),
					name = function(Callback): string
						-- upvalues: p8 (copy), ReadFunction (upval)
						local CallbackResult = Callback(p8)
						local ReadResult = ReadFunction(CallbackResult.badge, Callback)
						
						return tostring(ReadFunction(CallbackResult.label, Callback)) .. (if ReadResult == nil or ReadResult == "" then "" else ` ({ReadResult})`)
					end,
					subtitle = if p8:peek().description == nil and p8:peek().badge == nil and p7 ~= "radioGroup" and not Compose.isValue(Tbl.options) and type(Tbl.options) ~= "function" then nil else function(Callback)
						-- upvalues: ReadFunction (upval), p8 (copy)
						return ReadFunction(Callback(p8).description, Callback) or ""
					end,
					icon = p4.liveIcon(p8),
					TextSize = Tbl.textSize,
					TextXAlignment = if p7 == "segmented" then TypesEnum.TextXAlignment.Center else nil,
					trailingIcon = if ReadFunction(Tbl.indicator) == "none" and p7 ~= "segmented" then "checkmark" else nil,
					selected = function(Callback): boolean
						-- upvalues: ReadFunction (upval), Tbl (upval), IsSelectedFunction (upval), p8 (copy), p7 (upval)
						local ReadResult = ReadFunction(Tbl.indicator, Callback)
						
						return IsSelectedFunction(Callback(p8).value, Callback) and (ReadResult ~= "underline" and (ReadResult ~= "none" or p7 == "segmented"))
					end,
					enabled = DeriveFunction(function(Callback): boolean
						-- upvalues: p8 (copy), ReadFunction (upval), Tbl (upval)
						local CallbackResult = if Callback then Callback(p8) else p8:peek()
						
						return ReadFunction(Tbl.enabled, Callback) ~= false and ReadFunction(CallbackResult.enabled, Callback) ~= false
					end, if NoQuery then nil else p8, Tbl.enabled, PeekResult.enabled),
					haptic = if Tbl.multiple then true else p1.config.pressHaptic ~= nil and function(Callback): boolean
						-- upvalues: IsSelectedFunction (upval), p8 (copy)
						return not IsSelectedFunction(Callback(p8).value, Callback)
					end,
					onActivate = function()
						-- upvalues: SelectFunction (upval), p8 (copy)
						SelectFunction(p8:peek().value)
					end
				})
				
				if HasIcon then
					Compose.watch(function(Callback)
						-- upvalues: ReadFunction (upval), Tbl (upval), p8 (copy), ButtonResult (copy)
						if (if ReadFunction(Tbl.iconOnly, Callback) then "" else ReadFunction((if Callback then Callback(p8) else p8:peek()).label, Callback)) == "" then
							ButtonResult:AddTag("facet-button-glyph")
							
							return
						else
							ButtonResult:RemoveTag("facet-button-glyph")
						end
					end)
				end
				local LeadingIcon = if HasIcon then ButtonResult:FindFirstChild("LeadingIcon", true) else nil
				
				if LeadingIcon and (PeekResult.badge ~= nil or not NoQuery) then
					local BadgedResult = p2.badged(Host.Frame({
						Name = "Anchor",
						BackgroundTransparency = 1,
						Size = TypesUDim2.fromScale(1, 1)
					}), function(Callback)
						-- upvalues: ReadFunction (upval), p8 (copy)
						local ReadResult = ReadFunction(Callback(p8).badge, Callback)
						
						return if ReadResult == nil then nil else tostring(ReadResult)
					end)
					Runtime.decorate(BadgedResult, {
						Size = TypesUDim2.fromScale(1, 1),
						AutomaticSize = TypesEnum.AutomaticSize.None
					})
					Runtime.mount(function()
						-- upvalues: BadgedResult (copy)
						return BadgedResult
					end, LeadingIcon)
				end
				if ReadFunction(Tbl.indicator) == "none" and p7 ~= "segmented" then
					local TrailingIcon = ButtonResult:FindFirstChild("TrailingIcon", true)
					
					if TrailingIcon and TrailingIcon:IsA("GuiObject") then
						Compose.watch(function(Callback)
							-- upvalues: TrailingIcon (copy), IsSelectedFunction (upval), p8 (copy)
							TrailingIcon.Visible = IsSelectedFunction(Callback(p8).value, Callback)
						end)
					end
				end
				local Content = ButtonResult:FindFirstChild("Content")
				
				if Content and (PeekResult.badge ~= nil or Compose.isValue(Tbl.options) or type(Tbl.options) == "function") then
					Runtime.mountFragment(function()
						-- upvalues: Compose (upval), ReadFunction (upval), p8 (copy), HasIcon (copy), p2 (upval)
						return {
							Compose.show(function(Callback): boolean
								-- upvalues: ReadFunction (upval), p8 (upval), HasIcon (upval)
								local ReadResult = ReadFunction(Callback(p8).badge, Callback)
								
								return ReadResult ~= nil and (ReadResult ~= "" and not HasIcon)
							end, function()
								-- upvalues: ReadFunction (upval), p8 (upval), p2 (upval)
								local Text = tostring(ReadFunction(p8:peek().badge))
								
								return p2.Badge({
									Name = "Count",
									LayoutOrder = 900,
									label = function(Callback): string
										-- upvalues: ReadFunction (upval), p8 (upval), Text (ref)
										local ReadResult = ReadFunction(Callback(p8).badge, Callback)
										
										if ReadResult ~= nil and ReadResult ~= "" then
											Text = tostring(ReadResult)
										end
										return Text
									end
								})
							end)
						}
					end, Content)
				end
				if p7 == "radioGroup" then
					local IsTrailing = Tbl.indicatorPosition == "trailing"
					Runtime.mountFragment(function()
						-- upvalues: p1 (upval), Host (upval), TypesUDim2 (upval), IsTrailing (copy), TypesVector2 (upval), Visible (copy)
						return {
							p1.styled(Host.Frame("Indicator")({
								Size = TypesUDim2.fromOffset(18, 18),
								LayoutOrder = if IsTrailing then 1000 else 0,
								BackgroundTransparency = 1,
								p1.corner(9),
								p1.styled(Host.Frame("Dot")({
									AnchorPoint = TypesVector2.new(0.5, 0.5),
									Position = TypesUDim2.fromScale(0.5, 0.5),
									Size = TypesUDim2.fromOffset(8, 8),
									Visible = Visible,
									p1.corner(4)
								}), "fill")
							}), "radio-mark")
						}
					end, (assert(ButtonResult:FindFirstChild("Content"), "Picker radio rows use a content row")))
				end
				if p8:peek().indicator ~= nil or Compose.isValue(Tbl.options) or type(Tbl.options) == "function" then
					p3.attach(ButtonResult, {
						Compose.show(function(Callback): boolean
							-- upvalues: p8 (copy)
							return Callback(p8).indicator ~= nil
						end, function()
							-- upvalues: p2 (copy), TypesVector2 (upval), TypesUDim2 (upval), p8 (copy), ReadFunction (upval), PeekResult (copy)
							return p2.StatusIndicator({
								Name = "Status",
								AnchorPoint = TypesVector2.new(1, 0.5),
								Position = TypesUDim2.new(1, -8, 0.5, 0),
								status = function(Callback)
									-- upvalues: p8 (upval), ReadFunction (upval)
									local Indicator = Callback(p8).indicator
									
									if Indicator == nil then
										return "neutral"
									else
										local ReadResult = ReadFunction(Indicator.status, Callback)
										
										return if ReadResult == nil then "neutral" else ReadResult
									end
								end,
								form = PeekResult.indicator and PeekResult.indicator.form,
								count = function(Callback)
									-- upvalues: p8 (upval), ReadFunction (upval)
									local Indicator = Callback(p8).indicator
									
									return if Indicator then ReadFunction(Indicator.count, Callback) else nil
								end
							})
						end)
					})
				end
				local IsValue = Compose.isValue(Tbl.indicator) or (type(Tbl.indicator) == "function" or Tbl.indicator == "underline")
				p3.attach(ButtonResult, {
					Host.UISizeConstraint({
						MinSize = function(Callback)
							-- upvalues: p7 (upval), ReadFunction (upval), Tbl (upval), SideChromeFunction (upval), HasIcon (copy), p8 (copy), TypesVector2 (upval)
							local IsNotY: boolean = p7 == "segmented" and ReadFunction(Tbl.axis, Callback) ~= "y"
							
							return TypesVector2.new(if IsNotY then math.max(0, 44 - SideChromeFunction(Tbl.controlSize, Callback, HasIcon and (if ReadFunction(Tbl.iconOnly, Callback) then "" else ReadFunction((if Callback then Callback(p8) else p8:peek()).label, Callback)) == "")) else 44, if Tbl.controlSize == nil and not IsNotY then 44 else 0)
						end,
						MaxSize = if p7 == "segmented" then function(Callback)
							-- upvalues: TypesVector2 (upval), CellResult (upval), SegmentMetricsModule (upval)
							return TypesVector2.new(math.max(44, Callback(CellResult) - 2 * SegmentMetricsModule.inset), 1e999)
						end else nil
					}),
					if IsValue then Compose.show(function(Callback)
						-- upvalues: ReadFunction (upval), Tbl (upval), IsSelectedFunction (upval), p8 (copy)
						return ReadFunction(Tbl.indicator, Callback) == "underline" and IsSelectedFunction(Callback(p8).value, Callback)
					end, function()
						-- upvalues: p1 (upval), Host (upval), TypesUDim2 (upval)
						return p1.styled(Host.Frame("SelectionIndicator")({
							BorderSizePixel = 0,
							Selectable = false,
							Size = TypesUDim2.new(1, 0, 0, 2),
							Position = TypesUDim2.new(0, 0, 1, -2)
						}), "selection-indicator")
					end) else nil
				})
				
				if p7 == "segmented" and not IsNotSegmented then
					p3.attach(ButtonResult, {
						Host.UIFlexItem({
							FlexMode = function(Callback)
								-- upvalues: ReadFunction (upval), Tbl (upval), TypesEnum (upval), p7 (upval), CellResult1 (upval), HasSize (upval), stripAutomatic (upval), NoIsNotSegmented (upval)
								if ReadFunction(Tbl.sizing, Callback) == "hug" then
									return TypesEnum.UIFlexMode.None
								end
								if p7 ~= "segmented" or ReadFunction(Tbl.axis, Callback) == "y" then
									return TypesEnum.UIFlexMode.Fill
								end
								if not Callback(CellResult1) then
									local IsXMatch = nil
									if p7 == "segmented" and ReadFunction(Tbl.axis, Callback) ~= "y" then
										local StripAutomaticResult = nil
										if HasSize then
											StripAutomaticResult = stripAutomatic(Callback)
										elseif p7 == "segmented" and ReadFunction(Tbl.axis, Callback) ~= "y" then
											local NoIsNotSegmented1 = NoIsNotSegmented or ReadFunction(Tbl.sizing, Callback) == "hug"
											StripAutomaticResult = if NoIsNotSegmented1 then TypesEnum.AutomaticSize.X else TypesEnum.AutomaticSize.None
										else
											StripAutomaticResult = TypesEnum.AutomaticSize.Y
										end
										IsXMatch = StripAutomaticResult == TypesEnum.AutomaticSize.X or StripAutomaticResult == TypesEnum.AutomaticSize.XY
									else
										IsXMatch = false
									end
									if not IsXMatch then
										return TypesEnum.UIFlexMode.Grow
									end
								end
								return TypesEnum.UIFlexMode.None
							end
						})
					})
				end
				if NoQuery and (not Compose.isValue(PeekResult.label) and type(PeekResult.label) ~= "function") then
					ButtonResult:SetAttribute("FacetLabel", PeekResult.label)
				else
					Compose.watch(function(Callback)
						-- upvalues: ButtonResult (copy), ReadFunction (upval), p8 (copy)
						ButtonResult:SetAttribute("FacetLabel", ReadFunction(Callback(p8).label, Callback))
					end)
				end
				local FacetSegment: string = if p7 == "segmented" then "facet-segment" else "facet-choice"
				ButtonResult:AddTag(FacetSegment)
				
				if p7 == "radioGroup" then
					WrapCaptionsFunction(ButtonResult, Tbl.controlSize, function(Callback): number
						-- upvalues: CellResult (upval)
						return Callback(CellResult) - 26
					end)
				end
				if p7 == "segmented" then
					WrapCaptionsFunction(ButtonResult, Tbl.controlSize, function(Callback)
						-- upvalues: CellResult (upval), SegmentMetricsModule (upval)
						return Callback(CellResult) - 2 * SegmentMetricsModule.inset
					end, function(Callback): number
						-- upvalues: Options (upval)
						return #Callback(Options)
					end)
					p4.wrapWhenLong(ButtonResult, function(Callback): string
						-- upvalues: CellResult (upval), SegmentMetricsModule (upval), Options (upval)
						return `{Callback(CellResult) - 2 * SegmentMetricsModule.inset}|{#Callback(Options)}`
					end, ButtonResult, true)
					local Title = ButtonResult:FindFirstChild("Title", true) or ButtonResult:FindFirstChild("Label", true)
					local AbsoluteSizeResult = p1.observe.AbsoluteSize(ButtonResult)
					
					if p1.config.theme ~= nil then
						local TextBoundsResult = if Title and Title:IsA("TextLabel") then p1.observe.TextBounds(Title) else p1.observe.TextBounds(ButtonResult)
						local LayoutUnitResult = p1.layoutUnit(ButtonResult)
						Compose.watch(function(Callback)
							-- upvalues: YRatios (upval), ButtonResult (copy), TextBoundsResult (copy), LayoutUnitResult (copy), CellResult3 (upval)
							YRatios[ButtonResult] = Callback(TextBoundsResult).Y / Callback(LayoutUnitResult)
							local Largest = 0
							
							for _, yRatio in YRatios do
								Largest = math.max(Largest, yRatio)
							end
							if Largest ~= CellResult3:peek() then
								CellResult3:set(Largest)
							end
						end)
					end
					Frames[ButtonResult] = {
						order = LayoutOrder,
						size = AbsoluteSizeResult,
						at = p1.observe.AbsolutePosition(ButtonResult)
					}
					Compose.cleanup(function()
						-- upvalues: YRatios (upval), ButtonResult (copy), Frames (upval), CellResult3 (upval)
						YRatios[ButtonResult] = nil
						Frames[ButtonResult] = nil
						local Largest = 0
						
						for _, yRatio in YRatios do
							Largest = math.max(Largest, yRatio)
						end
						if Largest ~= CellResult3:peek() then
							CellResult3:set(Largest)
						end
					end)
				end
				local Content1 = ButtonResult:FindFirstChild("Content")
				local UIListLayout = if Content1 then Content1:FindFirstChildWhichIsA("UIListLayout") else nil
				
				if p7 ~= "segmented" and UIListLayout then
					UIListLayout.HorizontalAlignment = TypesEnum.HorizontalAlignment.Left
				end
				Compose.watch(function(Callback)
					-- upvalues: ReadFunction (upval), Tbl (upval), IsSelectedFunction (upval), p8 (copy), p7 (upval), ButtonResult (copy), FacetSegment (copy), LayoutOrder (copy), CellResult2 (upval)
					local ReadResult = ReadFunction(Tbl.indicator, Callback)
					local IsSelected = IsSelectedFunction(Callback(p8).value, Callback)
					
					if IsSelected and (ReadResult ~= "underline" and (ReadResult ~= "none" or p7 == "segmented")) then
						ButtonResult:AddTag(FacetSegment .. "-current")
					elseif ButtonResult:HasTag(FacetSegment .. "-current") then
						ButtonResult:RemoveTag(FacetSegment .. "-current")
					end
					local CallbackResult = Callback(LayoutOrder)
					
					if p7 ~= "segmented" or Tbl.multiple ~= true then return end
					local v3 = assert(CellResult2)
					
					if IsSelected then
						v3:set(CallbackResult)
						
						return
					end
					if v3:peek() == CallbackResult then
						v3:set(0)
					end
				end)
				local SectionTitle = p8:peek().sectionTitle
				
				if SectionTitle == nil or p7 == "segmented" then
					return ButtonResult
				else
					Runtime.decorate(ButtonResult, { LayoutOrder = 2 })
					
					return p1.column({
						p1.text({
							Name = "SectionTitle",
							Text = function(p9)
								-- upvalues: ReadFunction (upval), SectionTitle (copy)
								return ReadFunction(SectionTitle, p9) or ""
							end
						}, nil, "caption"),
						ButtonResult
					}, {
						Name = "Section-" .. ButtonResult.Name,
						LayoutOrder = LayoutOrder,
						Size = TypesUDim2.new(1, 0, 0, 0),
						AutomaticSize = TypesEnum.AutomaticSize.Y
					})
				end
			end
		}))
		local Frame = Tbl
		
		if HasSize then
			Frame = table.clone(Tbl)
			Frame.Size = nil
			Frame.AutomaticSize = nil
		end
		local config = {
			Name = "Picker",
			BackgroundTransparency = if p7 == "segmented" then nil else 1,
			Size = if HasSize then function(p9)
				-- upvalues: p1 (upval), Tbl (copy), ReadFunction (upval), Size (copy), TypesUDim2 (upval), ReadFunction (upval), AutomaticSize (copy), p7 (copy), ReadFunction (upval), TypesEnum (upval)
				local Height = p1.controlSize(Tbl.controlSize, "height", p9)
				local ReadResult = ReadFunction(Size, p9) or TypesUDim2.new(1, 0, 0, Height)
				local ReadResult1 = ReadFunction(AutomaticSize, p9)
				local IsReadResultMatch: boolean = p7 == "segmented" and (ReadFunction(Tbl.axis, p9) ~= "y" and (ReadResult1 == TypesEnum.AutomaticSize.Y or ReadResult1 == TypesEnum.AutomaticSize.XY))
				
				return if IsReadResultMatch then TypesUDim2.new(ReadResult.X.Scale, ReadResult.X.Offset, 0, Height) else ReadResult
			end elseif p7 == "segmented" then function(p9)
				-- upvalues: p7 (copy), ReadFunction (upval), Tbl (copy), TypesUDim2 (upval), NoIsNotSegmented (copy), stripHeight (copy)
				if p7 == "segmented" and ReadFunction(Tbl.axis, p9) ~= "y" then
					local NewFunction = TypesUDim2.new
					local NoIsNotSegmented1 = NoIsNotSegmented or ReadFunction(Tbl.sizing, p9) == "hug"
					
					return NewFunction(if NoIsNotSegmented1 then 0 else 1, 0, 0, (stripHeight(p9)))
				else
					return TypesUDim2.new(1, 0, 0, 0)
				end
			end else TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = if HasSize then stripAutomatic elseif p7 == "segmented" then DeriveFunction(segmentedAutomatic, Tbl.axis, Tbl.sizing) else TypesEnum.AutomaticSize.Y
		}
		local PropsResult = if Tbl.label == nil then p1.props(Frame, Keys, config) else config
		for _, value in List do
			table.insert(PropsResult, value)
		end
		local NoIsNotSegmented1: boolean = p7 == "segmented" and not IsNotSegmented
		
		if NoIsNotSegmented1 then
			for i, value1 in {
				Selectable = false,
				ScrollingDirection = TypesEnum.ScrollingDirection.X,
				HorizontalScrollBarInset = TypesEnum.ScrollBarInset.None,
				AutomaticCanvasSize = TypesEnum.AutomaticSize.None
			} do
				if PropsResult[i] == nil then
					PropsResult[i] = value1
				end
			end
		end
		local CellResult4 = Compose.cell(false)
		local Label = nil
		local Options1 = nil
		
		if p7 == "segmented" and NoIsNotSegmented then
			function PropsResult.GroupTransparency(Callback): number
				-- upvalues: CellResult4 (copy)
				return if Callback(CellResult4) then 0 else 1
			end
			
			Options1 = p1.fade(PropsResult, nil, nil, true)
			local v3 = false
			local SettledResult = p1.runtime.settled({
				sample = function(): string
					-- upvalues: Options1 (ref), Label (ref), Frames (copy), v3 (ref)
					local List = { (tostring(Options1.AbsoluteSize)) }
					local IsYAbove: boolean = Options1.AbsoluteSize.X > 0 and Options1.AbsoluteSize.Y > 0
					local Frame = Label
					
					if Frame then
						table.insert(List, `{Frame.AbsolutePosition}:{Frame.AbsoluteSize}:{Frame.TextBounds}`)
						IsYAbove = IsYAbove and (Frame.AbsoluteSize.X > 0 and (Frame.AbsoluteSize.Y > 0 and Frame.TextBounds.X <= Frame.AbsoluteSize.X) and Frame.TextBounds.Y <= Frame.AbsoluteSize.Y)
					end
					for frame in Frames do
						table.insert(List, `{frame.AbsolutePosition}:{frame.AbsoluteSize}:{frame.TextBounds}`)
						IsYAbove = IsYAbove and (frame.AbsoluteSize.X > 0 and frame.AbsoluteSize.Y > 0)
					end
					v3 = IsYAbove
					
					return table.concat(List, ";")
				end,
				equals = function(p9, p10): boolean
					-- upvalues: v3 (ref)
					return v3 and p9 == p10
				end,
				timeout = p1.metric("motion.restLimit")
			})
			Compose.watch(function(Callback)
				-- upvalues: CellResult4 (copy), SettledResult (copy)
				CellResult4:set(Callback(SettledResult))
			end)
		else
			Options1 = if NoIsNotSegmented1 then Host.ScrollingFrame(PropsResult) else Host.Frame(PropsResult)
		end
		local v4 = nil
		
		if NoIsNotSegmented1 then
			local ScrollFrame = Options1
			ScrollLockModule.own(ScrollFrame, p1)
			local AbsoluteContentSizeResult = p1.observe.AbsoluteContentSize((assert(Options1:FindFirstChildWhichIsA("UIListLayout", true))))
			local LayoutUnitResult = p1.layoutUnit(Options1)
			local AbsoluteWindowSizeResult = p1.observe.AbsoluteWindowSize(ScrollFrame)
			local Size1 = PropsResult.Size
			
			local _ = function(Callback): number
				-- upvalues: LayoutUnitResult (copy)
				local CallbackResult: number = Callback(LayoutUnitResult)
				
				return if CallbackResult > 0 then CallbackResult else 1
			end
			
			Compose.watch(function(Callback)
				-- upvalues: p7 (copy), ReadFunction (upval), Tbl (copy), CellResult1 (copy), AbsoluteWindowSizeResult (copy), SegmentMetricsModule (upval), LayoutUnitResult (copy), AbsoluteContentSizeResult (copy)
				if p7 == "segmented" and ReadFunction(Tbl.axis, Callback) ~= "y" then
					local X = Callback(AbsoluteWindowSizeResult).X
					local ScaledInset = 2 * SegmentMetricsModule.inset
					local CallbackResult: number = Callback(LayoutUnitResult)
					local XDelta = X - ScaledInset * (if CallbackResult > 0 then CallbackResult else 1)
					CellResult1:set(XDelta > 0 and XDelta + 1 < Callback(AbsoluteContentSizeResult).X)
					
					return
				else
					CellResult1:set(false)
				end
			end)
			v4 = CellResult1
			local ScrollFrame1 = {
				Size = function(Callback)
					-- upvalues: ReadFunction (upval), Size1 (copy), TypesUDim2 (upval), stripHeight (copy), p7 (copy), ReadFunction (upval), Tbl (copy), AbsoluteContentSizeResult (copy), LayoutUnitResult (copy), SegmentMetricsModule (upval)
					local ReadResult = ReadFunction(Size1, Callback) or TypesUDim2.new(1, 0, 0, (stripHeight(Callback)))
					
					if p7 == "segmented" and ReadFunction(Tbl.axis, Callback) ~= "y" then
						local Y = Callback(AbsoluteContentSizeResult).Y
						local CallbackResult: number = Callback(LayoutUnitResult)
						
						return TypesUDim2.new(ReadResult.X.Scale, ReadResult.X.Offset, ReadResult.Y.Scale, (math.max(ReadResult.Y.Offset, Y / (if CallbackResult > 0 then CallbackResult else 1) + 2 * SegmentMetricsModule.inset)))
					else
						return ReadResult
					end
				end
			}
			
			if PropsResult.CanvasSize == nil then
				function ScrollFrame1.CanvasSize(Callback)
					-- upvalues: CellResult1 (copy), TypesUDim2 (upval), AbsoluteWindowSizeResult (copy), LayoutUnitResult (copy), AbsoluteContentSizeResult (copy), SegmentMetricsModule (upval)
					if Callback(CellResult1) then
						local NewFunction1 = TypesUDim2.new
						local X = Callback(AbsoluteContentSizeResult).X
						local CallbackResult: number = Callback(LayoutUnitResult)
						
						return NewFunction1(0, math.ceil(X / (if CallbackResult > 0 then CallbackResult else 1)) + 2 * SegmentMetricsModule.inset, 1, 0)
					else
						local NewFunction = TypesUDim2.new
						local X = Callback(AbsoluteWindowSizeResult).X
						local CallbackResult: number = Callback(LayoutUnitResult)
						
						return NewFunction(0, math.floor(X / (if CallbackResult > 0 then CallbackResult else 1)), 1, 0)
					end
				end
			end
			if PropsResult.ScrollingEnabled == nil then
				function ScrollFrame1.ScrollingEnabled(Callback)
					-- upvalues: CellResult1 (copy)
					return Callback(CellResult1)
				end
			end
			if PropsResult.ScrollBarThickness == nil then
				function ScrollFrame1.ScrollBarThickness(Callback): number
					-- upvalues: CellResult1 (copy), SegmentMetricsModule (upval)
					return if Callback(CellResult1) then SegmentMetricsModule.inset - 1 else 0
				end
			end
			if PropsResult.ClipsDescendants == nil then
				function ScrollFrame1.ClipsDescendants(Callback)
					-- upvalues: CellResult1 (copy)
					return Callback(CellResult1)
				end
			end
			Runtime.decorate(Options1, ScrollFrame1)
			local v5 = nil
			local v6 = 0
			Compose.watch(function(Callback)
				-- upvalues: CellResult1 (copy), v5 (ref), ScrollFrame (copy), TypesVector2 (upval), CellResult2_1 (copy), AbsoluteWindowSizeResult (copy), Frames (copy), AbsoluteContentSizeResult (copy), v6 (ref), SegmentMetricsModule (upval), LayoutUnitResult (copy), p2 (upval)
				if Callback(CellResult1) then
					local CallbackResult: number = Callback(CellResult2_1)
					local X: number = Callback(AbsoluteWindowSizeResult).X
					
					if CallbackResult <= 0 or X <= 0 then return end
					local Frame = nil
					
					for i, frame in Frames do
						if Callback(frame.order) == CallbackResult then
							Frame = i
							Callback(frame.at)
							Callback(frame.size)
						end
					end
					local Text: string = `{CallbackResult}:{X}:{Callback(AbsoluteContentSizeResult).X}`
					
					if Frame == nil or Frame.AbsoluteSize.X <= 0 or Text == v5 then return end
					local IsNotCallbackResultMatch: boolean = v5 ~= nil and CallbackResult ~= v6
					v5 = Text
					v6 = CallbackResult
					local Inset = SegmentMetricsModule.inset
					local CallbackResult1: number = Callback(LayoutUnitResult)
					local ScaledInset = Inset * (if CallbackResult1 > 0 then CallbackResult1 else 1)
					local XDelta = Frame.AbsolutePosition.X - ScrollFrame.AbsolutePosition.X - ScaledInset
					local NewX = Frame.AbsoluteSize.X + 2 * ScaledInset
					local XDelta1 = if XDelta < 0 then XDelta elseif X < XDelta + NewX then XDelta + NewX - X else 0
					
					if XDelta1 ~= 0 then
						p2.scrollTo(ScrollFrame, { x = ScrollFrame.CanvasPosition.X + XDelta1 }, { animated = IsNotCallbackResultMatch })
					end
					return
				else
					v5 = nil
					
					if ScrollFrame.CanvasPosition.X ~= 0 then
						ScrollFrame.CanvasPosition = TypesVector2.new(0, ScrollFrame.CanvasPosition.Y)
					end
				end
			end)
		end
		local _ = function(Object)
			-- upvalues: v4 (ref), Compose (upval)
			local v7 = v4
			
			if v7 then
				Compose.watch(function(Callback)
					-- upvalues: Object (copy), v7 (copy)
					Object:SetAttribute("FacetOverflow", if Callback(v7) then true else nil)
				end)
			end
			return Object
		end
		
		if not NoIsNotSegmented then
			local LayoutWidthResult = LayoutWidthFunction(Options1)
			Compose.watch(function(Callback)
				-- upvalues: CellResult (copy), LayoutWidthResult (copy)
				CellResult:set(Callback(LayoutWidthResult))
			end)
		end
		if p7 == "segmented" then
			Options1:AddTag("facet-segmented")
			
			if Tbl.multiple ~= true then
				slideSelection(Options1, Frames, CellResult2_1, Tbl.indicator)
			end
			p3.attach(Options1, {
				Host.UISizeConstraint("TargetFloor")({
					MinSize = function(p9)
						-- upvalues: Tbl (copy), p1 (upval), TypesVector2 (upval), ReadFunction (upval), EffectiveInputResult (copy), SegmentMetricsModule (upval), authoredHeight (copy)
						local Height = if Tbl.controlSize == nil then 44 else p1.controlSize(Tbl.controlSize, "height", p9)
						
						return TypesVector2.new(0, if ReadFunction(Tbl.axis, p9) == "y" then 0 elseif EffectiveInputResult(p9) == "Touch" then math.max(Height, 44 + 2 * SegmentMetricsModule.inset) elseif Tbl.controlSize == nil and authoredHeight(p9) == nil then Height + 2 * SegmentMetricsModule.inset else Height)
					end
				})
			})
			
			if Tbl.corners then
				p3.attach(Options1, {
					Host.UICorner("Corners")({
						CornerRadius = TypesUDim.new(if Tbl.corners == "pill" then 1 else 0, 0)
					})
				})
				Options1:AddTag(if Tbl.corners == "pill" then "facet-segmented-pill" else "facet-segmented-square")
			end
			if Tbl.appearance ~= nil then
				Compose.watch(function(p9)
					-- upvalues: p4 (upval), ReadFunction (upval), Tbl (copy), Options1 (ref)
					local Segmented = p4.appearanceFor("segmented", ReadFunction(Tbl.appearance, p9))
					local IsUtility = Segmented == "utility"
					
					if Segmented == "stroke" then
						Options1:AddTag("facet-segmented-stroke")
					elseif Options1:HasTag("facet-segmented-stroke") then
						Options1:RemoveTag("facet-segmented-stroke")
					end
					if IsUtility then
						Options1:AddTag("facet-segmented-utility")
						
						return
					end
					if Options1:HasTag("facet-segmented-utility") then
						Options1:RemoveTag("facet-segmented-utility")
					end
				end)
			end
		end
		if Tbl.label == nil then
			local Options2 = Options1
			local v7 = v4
			
			if v7 then
				Compose.watch(function(Callback)
					-- upvalues: Options2 (copy), v7 (copy)
					Options2:SetAttribute("FacetOverflow", if Callback(v7) then true else nil)
				end)
			end
			return Options2
		else
			Options1.Name = "Options"
			local Label1 = p1.text({
				Name = "Label",
				Text = DeriveFunction(function(p9)
					-- upvalues: ReadFunction (upval), Tbl (copy)
					return ReadFunction(Tbl.label, p9) or ""
				end, Tbl.label),
				Size = TypesUDim2.new(if IsNotSegmented then 1 else 0, 0, 0, 0),
				AutomaticSize = if IsNotSegmented then TypesEnum.AutomaticSize.Y else TypesEnum.AutomaticSize.XY,
				TextWrapped = IsNotSegmented,
				TextXAlignment = TypesEnum.TextXAlignment.Left
			})
			local PropsResult1 = p1.props(Tbl, Keys, {
				Name = "Picker",
				BackgroundTransparency = 1,
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y
			})
			
			if IsNotSegmented then
				return p1.column({ Label1, Options1 }, PropsResult1)
			end
			Label = Label1
			
			if p7 == "segmented" then
				Runtime.mount(function()
					-- upvalues: Host (upval), p1 (upval), CellResult4 (copy)
					return Host.UIGradient("FadePaint")({
						Transparency = function(Callback)
							-- upvalues: p1 (upval), CellResult4 (upval)
							return p1.types.NumberSequence.new(if Callback(CellResult4) then 0 else 1)
						end
					})
				end, Label1)
			end
			Runtime.mount(function()
				-- upvalues: Host (upval), TypesEnum (upval)
				return Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Grow })
			end, Label1)
			local RowResult = p1.row({ Label1, Options1 }, PropsResult1)
			local v8 = assert(RowResult:FindFirstChildWhichIsA("UIListLayout"))
			v8.VerticalAlignment = TypesEnum.VerticalAlignment.Center
			v8.Padding = TypesUDim.new(0, 16)
			v8.Wraps = true
			local LayoutWidthResult1 = LayoutWidthFunction(RowResult)
			Compose.watch(function(Callback)
				-- upvalues: CellResult (copy), LayoutWidthResult1 (copy)
				CellResult:set(Callback(LayoutWidthResult1))
			end)
			local TargetFloor = Options1:FindFirstChild("TargetFloor")
			
			local function MaxSize(Callback)
				-- upvalues: TypesVector2 (upval), LayoutWidthResult1 (copy)
				return TypesVector2.new(Callback(LayoutWidthResult1), 1e999)
			end
			
			if TargetFloor then
				Runtime.decorate(TargetFloor, { MaxSize = MaxSize })
			else
				p3.attach(Options1, { Host.UISizeConstraint({ MaxSize = MaxSize }) })
			end
			local v9 = v4
			
			if v9 then
				Compose.watch(function(Callback)
					-- upvalues: RowResult (copy), v9 (copy)
					RowResult:SetAttribute("FacetOverflow", if Callback(v9) then true else nil)
				end)
			end
			return RowResult
		end
	end
end