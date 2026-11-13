local SizeFloorModule = require("./size_floor")
local ReducedFunction = require("./motion").reduced
local NativeDecorationModule = require("./native_decoration")
local FeedbackPaintModule = require("./feedback_paint")
local RichTextModule = require("./rich_text")
local HelpModule = require("./help")
local ActivationModule = require("./activation")
local _ = require("./input_kit")
local InputButtonContentModule = require("./input_button_content")
local _ = require("./input_types")
local _ = require("./types")
local _ = require("./theme_types")
local _ = require("./engine_types")
local _ = require("./control_types")
local _ = require("./input_props")
local CoreModule = require("../vendor/compose/core")

return function(p1, p2, p3)
	-- upvalues: RichTextModule (copy), ReducedFunction (copy), ActivationModule (copy), HelpModule (copy), InputButtonContentModule (copy), CoreModule (copy), NativeDecorationModule (copy), SizeFloorModule (copy), FeedbackPaintModule (copy)
	local Runtime = p1.runtime
	local Host = p1.Host
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local TypesUDim = p1.types.UDim
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	local DynamicFunction = p3.dynamic
	local EnabledFunction = p3.enabled
	local NoKey = p3.noKey
	local TypeRoles = p3.typeRoles
	
	local function captioned(p4): boolean
		local Control = p4 and (p4.chrome and p4.chrome.control)
		
		return Control ~= nil and (Control.kind ~= "native" and Control.kind ~= "none")
	end
	
	local Count = 0
	local config = {
		default = true,
		cancel = true,
		destructive = true,
		onIndicator = true
	}
	local Tags = {}
	
	for i in config do
		Tags[i] = "facet-role-" .. i
	end
	local Height = nil
	local FromOffsetResult = nil
	
	local function heightSize(ControlSize, p4)
		-- upvalues: p1 (copy), Height (ref), FromOffsetResult (ref), TypesUDim2 (copy)
		local Height1 = p1.controlSize(ControlSize, "height", p4)
		
		if Height1 ~= Height then
			Height = Height1
			FromOffsetResult = TypesUDim2.fromOffset(0, Height1)
		end
		return assert(FromOffsetResult)
	end
	
	local Frozen = table.freeze({
		"cooldown", "charges", "haptic", "label", "compactLabel", "pop", "enabled",
		"disabled", "busy", "onActivate", "repeatDelay", "repeatInterval", "shortcut",
		"selected", "appearance", "help", "disclose", "controlSize", "corners", "role",
		"dialogAction", "icon", "glyph", "shortcutHint", "trailingIcon", "image",
		"imageAspectRatio", "imageFraming", "subtitle", "caption", "row", "name",
		"hint", "shape", "onPointerDown", "onPointerUp", "onPointerCancel", "textSize",
		"underline", "target"
	})
	local list = { "xsmall", "compact", "regular", "large" }
	local config1 = {
		large = "regular",
		regular = "compact",
		compact = "xsmall",
		xsmall = "xsmall"
	}
	local t = {}
	
	for i1, value in list do
		t[i1] = "facet-size-" .. value
	end
	local EscapeFunction = RichTextModule.escape
	
	local function v35() end
	
	local function sized(Object, TextSize)
		-- upvalues: TypeRoles (copy), DynamicFunction (copy), Compose (copy), ReadFunction (copy)
		if TextSize == nil then return end
		local function apply(TextSize)
			-- upvalues: TypeRoles (upval), Object (copy)
			for typeRole in TypeRoles do
				if TextSize ~= typeRole and Object:HasTag("facet-type-" .. typeRole) then
					Object:RemoveTag("facet-type-" .. typeRole)
				end
			end
			if type(TextSize) == "string" then
				assert(TypeRoles[TextSize], "Facet.Button: textSize must be a type role or a positive number")
				Object:AddTag("facet-type-" .. TextSize)
				Object:ResetPropertyToDefault("TextSize")
				
				return
			elseif type(TextSize) == "number" then
				Object.TextSize = TextSize
			end
		end
		
		if DynamicFunction(TextSize) then
			Compose.watch(function(p4)
				-- upvalues: apply (copy), ReadFunction (upval), TextSize (copy)
				apply(ReadFunction(TextSize, p4))
			end)
			
			return
		else
			apply(ReadFunction(TextSize))
		end
	end
	
	p2.Button = p1.construct("Button", function(Frame: Frame)
		-- upvalues: DynamicFunction (copy), Compose (copy), EnabledFunction (copy), ReadFunction (copy), TypesUDim (copy), TypeRoles (copy), p1 (copy), Runtime (copy), ReducedFunction (upval), p3 (copy), ActivationModule (upval), HelpModule (upval), heightSize (copy), Height (ref), FromOffsetResult (ref), TypesUDim2 (copy), TypesEnum (copy), Frozen (copy), p2 (copy), Host (copy), TypesVector2 (copy), EscapeFunction (copy), config1 (copy), InputButtonContentModule (upval), sized (copy), v35 (copy), CoreModule (upval), NativeDecorationModule (upval), captioned (copy), config (copy), Tags (copy), list (copy), t (copy), NoKey (copy), Count (ref), SizeFloorModule (upval), FeedbackPaintModule (upval)
		local OnActivateFunction = Frame.onActivate
		assert(Frame.onActivate == nil or type(Frame.onActivate) == "function", "Facet.Button: onActivate must be a function")
		assert(Frame.shape == nil or (Frame.shape == "rect" or Frame.shape == "circle"), "Facet.Button: shape must be rect or circle")
		assert(Frame.target == nil or (Frame.target == "hit" or (Frame.target == "thumb" or Frame.target == "inline")), "Facet.Button: target must be hit, thumb or inline")
		local DynamicResult = DynamicFunction(Frame.enabled) or (DynamicFunction(Frame.disabled) or DynamicFunction(Frame.busy))
		local FormulaResult = if DynamicResult then Compose.formula(function(p4)
			-- upvalues: EnabledFunction (upval), Frame (copy)
			return EnabledFunction(Frame, p4)
		end) else nil
		local EnabledResult = if DynamicResult then true else EnabledFunction(Frame)
		
		local function _(Callback)
			-- upvalues: FormulaResult (copy), EnabledResult (copy)
			return if FormulaResult == nil then EnabledResult elseif Callback then Callback(FormulaResult) else FormulaResult:peek()
		end
		
		local function cornerRadius(p4)
			-- upvalues: ReadFunction (upval), Frame (copy), TypesUDim (upval)
			local ReadResult = ReadFunction(Frame.corners, p4)
			assert(ReadResult == "pill" or ReadResult == "square", "Facet.Button: corners must be pill or square")
			
			return TypesUDim.new(if ReadResult == "pill" then 1 else 0, 0)
		end
		
		if Frame.corners ~= nil then
			local ReadResult = ReadFunction(Frame.corners, nil)
			assert(ReadResult == "pill" or ReadResult == "square", "Facet.Button: corners must be pill or square")
			local _ = TypesUDim.new(if ReadResult == "pill" then 1 else 0, 0)
		end
		assert(Frame.dialogAction == nil or (Frame.dialogAction == "default" or Frame.dialogAction == "cancel"), "Facet.Button: invalid dialogAction")
		assert(Frame.imageFraming == nil or (Frame.imageFraming == "fit" or Frame.imageFraming == "crop"), "Facet.Button: imageFraming must be fit or crop")
		local ShortcutHint = Frame.shortcutHint
		assert(ShortcutHint == nil or ShortcutHint.IsA and ShortcutHint:IsA("InputAction"), "Facet.Button: shortcutHint must be a native InputAction")
		local ReadResult: number = ReadFunction(Frame.textSize)
		assert(ReadResult == nil or (type(ReadResult) == "string" and TypeRoles[ReadResult] or type(ReadResult) == "number" and ReadResult > 0 and ReadResult < 1e999), "Facet.Button: textSize must be a type role or a positive number")
		local Underline = Frame.underline
		assert(Underline == nil or (Underline == "always" or Underline == "hover"), "Facet.Button: underline must be always or hover")
		local MotionDurationsButtonPop = if Frame.pop then p1.metric("motion.durations.buttonPop") else 0
		local TimelineResult = if Frame.pop then Runtime.timeline({ autoplay = false, duration = MotionDurationsButtonPop }) else nil
		local ReducedResult = if TimelineResult then ReducedFunction(p1) else nil
		local CellResult = if TimelineResult then Compose.cell(1) else nil
		local FormulaResult1 = nil
		
		if TimelineResult then
			TimelineResult:seek(MotionDurationsButtonPop)
			local Present = p1.motionEase("present")
			local MotionMaterializePopOvershoot = p1.metric("motion.materialize.popOvershoot")
			local MotionMaterializePopDecay = p1.metric("motion.materialize.popDecay")
			FormulaResult1 = Compose.formula(function(Callback): number
				-- upvalues: ReducedResult (copy), TimelineResult (copy), CellResult (copy), Present (copy), MotionMaterializePopOvershoot (copy), MotionMaterializePopDecay (copy)
				if assert(ReducedResult)(Callback) then
					return 1
				else
					local CallbackResult: number = Callback(TimelineResult.progress)
					
					return 1 + (Callback(assert(CellResult)) - 1) * (1 - Present(CallbackResult)) + MotionMaterializePopOvershoot * math.sin(3.141592653589793 * CallbackResult) * math.exp(-MotionMaterializePopDecay * CallbackResult)
				end
			end)
			Compose.watch(function(p4)
				-- upvalues: ReducedResult (copy), TimelineResult (copy), MotionDurationsButtonPop (copy)
				if assert(ReducedResult)(p4) then
					TimelineResult:pause()
					TimelineResult:seek(MotionDurationsButtonPop)
				end
			end)
		end
		local Button = nil
		local Default = nil
		local Icon = Frame.icon or Frame.row and Frame.row.icon
		local TrailingIcon = Frame.trailingIcon
		
		if (Icon ~= nil or TrailingIcon ~= nil) and (p1.iconVaries(Icon) or p1.iconVaries(TrailingIcon) or Frame.row ~= nil and Frame.onActivate ~= nil and p1.iconVaries("chevron.trailing")) then
			Default = Compose.cell("default")
		end
		local Flag1 = false
		local Flag2 = false
		local HasRepeatDelay: boolean = Frame.repeatDelay ~= nil or Frame.repeatInterval ~= nil
		local RepeatDelay = Frame.repeatDelay or p3.repeatDelay
		local RepeatInterval = Frame.repeatInterval or p3.repeatInterval
		assert(RepeatDelay > 0 and (RepeatDelay < 1e999 and RepeatInterval > 0) and RepeatInterval < 1e999, "Facet.Button: repeat timings must be finite and positive")
		
		local function activate(p4, p5)
			-- upvalues: Button (ref), ActivationModule (upval), HelpModule (upval), p1 (upval), FormulaResult (copy), EnabledResult (copy), OnActivateFunction (copy), TimelineResult (copy), FormulaResult1 (ref), ReducedResult (copy), Flag1 (ref), CellResult (copy)
			local Button1 = Button
			
			if ActivationModule.consumed(p4) or Button1 and (HelpModule.consume(Button1) or ActivationModule.intercepted(Button1, p4)) then return end
			local ShiftActivationResult: () -> () = if Button then p1.shiftActivation(Button, p4) else nil
			local AvailableResult = (if FormulaResult == nil then EnabledResult else FormulaResult:peek()) and (Button and p1.available(Button))
			
			if ShiftActivationResult and AvailableResult then
				ShiftActivationResult()
				
				return
			end
			if AvailableResult and OnActivateFunction then
				if TimelineResult and FormulaResult1 and ReducedResult and not Flag1 and not ReducedResult() then
					assert(CellResult):set(FormulaResult1:peek())
					TimelineResult:restart()
				end
				OnActivateFunction(p4, p5)
				AvailableResult = p1.available(Button)
			end
			if AvailableResult then
				ActivationModule.notify(Button, p4, p5)
			end
		end
		
		local function activateShortcut()
			-- upvalues: activate (copy)
			activate(nil, nil)
		end
		
		local function shortcutActive(Callback): boolean
			-- upvalues: p1 (upval), FormulaResult (copy), EnabledResult (copy), Button (ref)
			local UserInputService = p1.config.services.UserInputService
			
			return (if FormulaResult == nil then EnabledResult elseif Callback then Callback(FormulaResult) else FormulaResult:peek()) and (Button.Visible and (Button.Parent ~= nil and (not UserInputService or not UserInputService:GetFocusedTextBox())))
		end
		
		local GuiService = p1.config.services.GuiService
		local IsNotHover = Underline ~= "hover"
		local v1 = false
		local v2 = nil
		local HasIcon: boolean = Frame.icon ~= nil or (Frame.glyph ~= nil or (Frame.trailingIcon ~= nil or (Frame.image ~= nil or (Frame.row ~= nil or (Frame.subtitle ~= nil or Frame.hint ~= nil))))) or ShortcutHint ~= nil
		assert(Underline == nil or not HasIcon and (Frame.compactLabel == nil and Frame.shape ~= "circle"), "Facet.Button: underline belongs to a text button with no icon, image, row or compactLabel")
		local FormulaResult2 = FormulaResult or EnabledResult
		
		local function controlSize(p4)
			-- upvalues: heightSize (upval), Frame (copy)
			return heightSize(Frame.controlSize, p4)
		end
		
		local Label = {
			AutoButtonColor = false,
			Text = if HasIcon then "" else Frame.label or ""
		}
		local Size = nil
		
		if DynamicFunction(p1.config.theme) or DynamicFunction(Frame.controlSize) then
			Size = controlSize
		else
			local Height1 = p1.controlSize(Frame.controlSize, "height", nil)
			
			if Height1 ~= Height then
				Height = Height1
				FromOffsetResult = TypesUDim2.fromOffset(0, Height1)
			end
			Size = assert(FromOffsetResult)
		end
		Label.Size = Size
		Label.AutomaticSize = TypesEnum.AutomaticSize.XY
		local IsBare = Frame.appearance == "bare"
		
		if IsBare then
			Label.Size = TypesUDim2.new()
			Label.BackgroundTransparency = 1
		end
		local Size1 = Frame.Size
		
		local _ = function(Vector): boolean
			return Vector.X.Scale > 0 or Vector.X.Offset > 0
		end
		
		local DynamicResult2 = Frame.AutomaticSize == nil and DynamicFunction(Size1)
		local NoRow: boolean = if Frame.AutomaticSize == TypesEnum.AutomaticSize.None or (Frame.AutomaticSize == TypesEnum.AutomaticSize.Y or DynamicResult2 or DynamicFunction(Frame.AutomaticSize)) then Frame.image == nil and Frame.row == nil else Frame.AutomaticSize == nil and (typeof(Size1) == "UDim2" and ((Size1.X.Scale > 0 or Size1.X.Offset > 0) and (Frame.image == nil and Frame.row == nil)))
		
		if NoRow and Frame.AutomaticSize == nil then
			local NoTextTruncate: boolean = not HasIcon and (Frame.disclose ~= true and (Frame.TextTruncate == nil or Frame.TextTruncate == TypesEnum.TextTruncate.None))
			
			if DynamicResult2 then
				function Label.AutomaticSize(p4)
					-- upvalues: ReadFunction (upval), Size1 (copy), TypesEnum (upval)
					local ReadResult = ReadFunction(assert(Size1), p4)
					local IsScaleAbove: boolean = ReadResult.X.Scale > 0 or ReadResult.X.Offset > 0
					
					return if IsScaleAbove then TypesEnum.AutomaticSize.Y else TypesEnum.AutomaticSize.XY
				end
				
				if NoTextTruncate then
					function Label.TextWrapped(p4): boolean
						-- upvalues: ReadFunction (upval), Size1 (copy)
						local ReadResult = ReadFunction(assert(Size1), p4)
						
						return ReadResult.X.Scale > 0 or ReadResult.X.Offset > 0
					end
				end
			else
				Label.AutomaticSize = TypesEnum.AutomaticSize.Y
				
				if not HasIcon then
					Label.TextWrapped = NoTextTruncate
				end
			end
		end
		if FormulaResult2 ~= true then
			Label.Selectable = FormulaResult2
			Label.Interactable = FormulaResult2
		end
		local PropsResult = p1.props(Frame, Frozen, Label)
		local HasUserInputService: boolean = Frame.target == "thumb" and p1.config.userInputService ~= nil
		local ThumbFloorResult = if HasUserInputService then p1.thumbFloor(if p2.environment == nil then Compose.formula(function(p4)
			-- upvalues: p1 (upval)
			return p1.metric("targetSizes.thumb", p4)
		end) else p2.environment().thumbTarget) elseif p1.config.userInputService == nil then nil else p1.touchFloor()
		local EffectiveInputResult = if ThumbFloorResult then p1.effectiveInput() else nil
		local HasIcon1: boolean = Icon ~= nil or Frame.glyph ~= nil
		local HasIcon2: boolean = Frame.shape == "circle" and (Frame.icon ~= nil or Frame.glyph ~= nil)
		local HasTextFunction = p3.hasText
		
		local function worded(p4)
			-- upvalues: HasIcon2 (copy), IsBare (copy), Frame (copy), HasTextFunction (copy), HasIcon (copy), HasIcon1 (copy)
			if HasIcon2 or IsBare then
				return false
			else
				local Row = Frame.row
				
				return HasTextFunction(Frame.label, p4) or (HasTextFunction(Frame.subtitle, p4) or (HasTextFunction(Frame.hint, p4) or ((if HasIcon then HasIcon and not HasIcon1 and HasTextFunction(Frame.name, p4) else HasTextFunction(Frame.Text, p4) or HasIcon and not HasIcon1 and HasTextFunction(Frame.name, p4)) or Row ~= nil and (HasTextFunction(Row.title, p4) or (HasTextFunction(Row.description, p4) or Row.value ~= nil and Row.value ~= "")))))
			end
		end
		
		local _ = function(p4): boolean
			-- upvalues: EffectiveInputResult (copy)
			return EffectiveInputResult ~= nil and EffectiveInputResult(p4) == "Touch"
		end
		
		local _ = function(p4)
			-- upvalues: ThumbFloorResult (copy), HasUserInputService (copy), EffectiveInputResult (copy), worded (copy)
			if ThumbFloorResult == nil or (not HasUserInputService or (EffectiveInputResult == nil or EffectiveInputResult(p4) ~= "Touch")) and not worded(p4) then
				return 0
			else
				return ThumbFloorResult(p4)
			end
		end
		
		local _ = function(p4)
			-- upvalues: ThumbFloorResult (copy), HasUserInputService (copy), EffectiveInputResult (copy), worded (copy)
			if ThumbFloorResult == nil or HasUserInputService or (EffectiveInputResult == nil or EffectiveInputResult(p4) ~= "Touch" or worded(p4)) then
				return 0
			else
				return ThumbFloorResult(p4)
			end
		end
		
		local NoAutomaticSize: boolean = NoRow and (not DynamicFunction(Frame.AutomaticSize) and (Frame.label ~= nil and (Frame.label ~= "" and (Frame.shape ~= "circle" and (Frame.AutomaticSize == nil or HasIcon)))))
		
		local _ = function(p4: number, p5): number
			-- upvalues: Frame (copy), p1 (upval)
			return if Frame.target == "inline" then math.min(p4, p1.metric("targetSizes.inline", p5)) else p4
		end
		
		if NoAutomaticSize then
			PropsResult[#PropsResult + 1] = Host.UISizeConstraint({
				MinSize = function(p4)
					-- upvalues: ReadFunction (upval), p1 (upval), ThumbFloorResult (copy), HasUserInputService (copy), EffectiveInputResult (copy), worded (copy), Frame (copy), TypesVector2 (upval)
					local ReadResult = ReadFunction(p1.config.theme, p4)
					local Control = ReadResult and (ReadResult.chrome and ReadResult.chrome.control)
					local ContentInsets = if Control then Control.contentInsets or {} else {}
					local ThumbFloorResultResult = if ThumbFloorResult == nil then 0 elseif HasUserInputService and (EffectiveInputResult ~= nil and EffectiveInputResult(p4) == "Touch") then ThumbFloorResult(p4) elseif worded(p4) then ThumbFloorResult(p4) else 0
					local ReadResult1 = ReadFunction(Frame.icon, p4)
					local ReadResult11 = ReadFunction(Frame.trailingIcon, p4)
					local v3 = (if Frame.glyph or ReadResult1 ~= nil and ReadResult1 ~= "" then 1 else 0) + (if ReadResult11 == nil or ReadResult11 == "" then 0 else 1)
					local IconSize: number = p1.controlSize(if Frame.controlSize == nil then p1.config.controlSize else Frame.controlSize, "iconSize", p4)
					local ReadResult2 = ReadFunction(Frame.label, p4)
					local IsNotReadResultMatch: boolean = ReadResult2 ~= nil and ReadResult2 ~= ""
					
					return TypesVector2.new(math.max(if Frame.target == "inline" then math.min(ThumbFloorResultResult, p1.metric("targetSizes.inline", p4)) else ThumbFloorResultResult, 2 * p1.controlSize(Frame.controlSize, "paddingX", p4) + (ContentInsets.left or 0) + (ContentInsets.right or 0) + (if IsNotReadResultMatch then p1.metric("typography.control.size", p4) + v3 * (IconSize + 8) else v3 * IconSize + math.max(0, v3 - 1) * 8)), ThumbFloorResultResult)
				end
			})
		end
		if not HasIcon and PropsResult.TextTruncate == nil then
			local AutomaticSize = PropsResult.AutomaticSize
			
			local function truncate(p4)
				-- upvalues: ReadFunction (upval), AutomaticSize (copy), TypesEnum (upval)
				local ReadResult = ReadFunction(AutomaticSize, p4)
				
				return if ReadResult == TypesEnum.AutomaticSize.X or ReadResult == TypesEnum.AutomaticSize.XY then TypesEnum.TextTruncate.None else TypesEnum.TextTruncate.AtEnd
			end
			local None = nil
			
			if DynamicFunction(AutomaticSize) then
				None = truncate
			else
				local ReadResult1 = ReadFunction(AutomaticSize, nil)
				None = if ReadResult1 == TypesEnum.AutomaticSize.X or ReadResult1 == TypesEnum.AutomaticSize.XY then TypesEnum.TextTruncate.None else TypesEnum.TextTruncate.AtEnd
			end
			PropsResult.TextTruncate = None
		end
		local CellResult2 = if Underline == "hover" then Compose.cell(false) else nil
		local InputButtonContentModuleResult = false
		
		if Underline ~= nil then
			PropsResult.RichText = true
			
			function PropsResult.Text(Callback)
				-- upvalues: EscapeFunction (upval), ReadFunction (upval), Frame (copy), Underline (copy), CellResult2 (copy)
				local EscapeResult = EscapeFunction((tostring(ReadFunction(Frame.label, Callback) or "")))
				
				return if Underline == "always" or Callback(assert(CellResult2)) then `<u>{EscapeResult}</u>` else EscapeResult
			end
		end
		local function activated(p4, p5)
			-- upvalues: Flag2 (ref), activate (copy), Frame (copy)
			if not Flag2 then
				activate(p4, p5)
			end
			Flag2 = false
			
			if Frame.Activated then
				Frame.Activated(p4, p5)
			end
		end
		
		local Callback2 = if HasRepeatDelay or Frame.Activated then activated else activate
		PropsResult.Activated = Callback2
		
		if Frame.Size ~= nil and Frame.shape ~= "circle" then
			local Size11 = Frame.Size
			local AutomaticSize1 = Frame.AutomaticSize
			
			local function floored(p4)
				-- upvalues: ReadFunction (upval), Size11 (copy), AutomaticSize1 (copy), TypesEnum (upval), TypesUDim2 (upval), p1 (upval), Frame (copy)
				local ReadResult = ReadFunction(Size11, p4)
				local Y = if AutomaticSize1 == nil then TypesEnum.AutomaticSize.Y else ReadFunction(AutomaticSize1, p4)
				local IsYMatch: boolean = Y == TypesEnum.AutomaticSize.Y or Y == TypesEnum.AutomaticSize.XY
				
				return if IsYMatch and ReadResult.Y.Scale == 0 and ReadResult.Y.Offset == 0 then TypesUDim2.new(ReadResult.X.Scale, ReadResult.X.Offset, 0, p1.controlSize(Frame.controlSize, "height", p4)) else ReadResult
			end
			
			PropsResult.Size = if DynamicFunction(Size11) or (DynamicFunction(AutomaticSize1) or DynamicFunction(Frame.controlSize) or DynamicFunction(p1.config.theme)) then floored else floored()
		end
		if Frame.shape == "circle" then
			if Frame.Size == nil then
				function PropsResult.Size(p4)
					-- upvalues: p1 (upval), Frame (copy), TypesUDim2 (upval)
					local Height = p1.controlSize(Frame.controlSize, "height", p4)
					
					return TypesUDim2.fromOffset(Height, Height)
				end
			end
			PropsResult.AutomaticSize = TypesEnum.AutomaticSize.None
			local config2 = { AspectRatio = 1 }
			local Size2 = Frame.Size
			
			if Size2 ~= nil and not DynamicFunction(Size2) then
				local ReadResult2 = ReadFunction(Size2)
				local IsNotScaleMatch: boolean = ReadResult2.X.Scale ~= 0 or ReadResult2.X.Offset ~= 0
				
				if IsNotScaleMatch ~= (ReadResult2.Y.Scale ~= 0 or ReadResult2.Y.Offset ~= 0) then
					config2.AspectType = TypesEnum.AspectType.ScaleWithParentSize
					config2.DominantAxis = if IsNotScaleMatch then TypesEnum.DominantAxis.Width else TypesEnum.DominantAxis.Height
				end
			end
			PropsResult[#PropsResult + 1] = Host.UIAspectRatioConstraint(config2)
			PropsResult[#PropsResult + 1] = Host.UICorner({ CornerRadius = p1.round })
		elseif Frame.corners then
			local v3 = #PropsResult + 1
			local UICornerFunction = Host.UICorner
			local t1 = {}
			local CornerRadius = nil
			
			if DynamicFunction(Frame.corners) then
				CornerRadius = cornerRadius
			else
				local ReadResult3 = ReadFunction(Frame.corners, nil)
				assert(ReadResult3 == "pill" or ReadResult3 == "square", "Facet.Button: corners must be pill or square")
				CornerRadius = TypesUDim.new(if ReadResult3 == "pill" then 1 else 0, 0)
			end
			t1.CornerRadius = CornerRadius
			PropsResult[v3] = UICornerFunction(t1)
		end
		if Frame.busy ~= nil then
			PropsResult[#PropsResult + 1] = Host.UIPadding({
				PaddingRight = function(p4)
					-- upvalues: ReadFunction (upval), Frame (copy), TypesUDim (upval), p1 (upval)
					if ReadFunction(Frame.busy, p4) == true then
						local ReadResult = ReadFunction(p1.config.theme, p4)
						local Control = ReadResult and (ReadResult.chrome and ReadResult.chrome.control)
						
						return TypesUDim.new(0, 32 + (Control and Control.contentInsets and Control.contentInsets.right or 0))
					else
						return TypesUDim.new(0, 0)
					end
				end
			})
			PropsResult[#PropsResult + 1] = Compose.show(function(p4): boolean
				-- upvalues: ReadFunction (upval), Frame (copy)
				return ReadFunction(Frame.busy, p4) == true
			end, function()
				-- upvalues: Runtime (upval), p1 (upval), ReducedFunction (upval), TypesUDim2 (upval), TypesVector2 (upval), Host (upval)
				local TimelineResult = Runtime.timeline({
					repeats = 1e999,
					duration = p1.metric("motion.durations.busyLoop")
				})
				local ReducedResult = ReducedFunction(p1)
				local config = {
					Name = "Busy",
					BackgroundTransparency = 1,
					ZIndex = 2,
					Size = TypesUDim2.fromOffset(18, 18),
					AnchorPoint = TypesVector2.new(0, 0.5),
					Position = TypesUDim2.new(1, 5, 0.5, 0)
				}
				
				for i = 1, 3 do
					config[#config + 1] = p1.styled(Host.Frame(`Dot{i}`)({
						Size = TypesUDim2.fromOffset(4, 4),
						Position = TypesUDim2.fromOffset((i - 1) * 6, 7),
						BorderSizePixel = 0,
						BackgroundTransparency = function(Callback): number
							-- upvalues: ReducedResult (copy), TimelineResult (copy), i (copy)
							return if ReducedResult(Callback) then 0 else 0.2 + 0.6 * ((Callback(TimelineResult.progress) + i / 3) % 1)
						end,
						p1.corner(2)
					}), "fill")
				end
				local FrameResult = Host.Frame(config)
				p1.playWhileShown(TimelineResult, FrameResult)
				
				return FrameResult
			end)
		end
		local ShortcutHint1 = nil
		local IsCircle = Frame.shape == "circle"
		
		if ShortcutHint then
			local EffectiveInputResult1 = p1.effectiveInput()
			local EnabledResult1 = p1.observe.Enabled(ShortcutHint)
			local PreferredBindingResult = p1.observe.PreferredBinding(ShortcutHint)
			
			local function cornerSize(p4)
				-- upvalues: config1 (upval), ReadFunction (upval), Frame (copy)
				return config1[ReadFunction(Frame.controlSize, p4) or "regular"]
			end
			
			ShortcutHint1 = p2.ShortcutHint({
				Name = "ShortcutHint",
				cap = false,
				action = ShortcutHint,
				controlSize = if IsCircle then cornerSize else Frame.controlSize,
				AnchorPoint = if IsCircle then TypesVector2.new(0.5, 0.5) else nil,
				Position = if IsCircle then TypesUDim2.fromScale(0.8535533905932737, 0.8535533905932737) else nil,
				ZIndex = if IsCircle then 2 else nil,
				Visible = function(Callback): boolean
					-- upvalues: EffectiveInputResult1 (copy), EnabledResult1 (copy), PreferredBindingResult (copy)
					return EffectiveInputResult1(Callback) ~= "Touch" and Callback(EnabledResult1) ~= false and (if Callback(PreferredBindingResult) then true else false)
				end
			})
		end
		local ShortcutHint2 = if IsCircle then nil else ShortcutHint1
		local Callback: (any) -> () = nil
		
		if HasIcon then
			InputButtonContentModuleResult, Callback = InputButtonContentModule(p1, p3, Frame, PropsResult, Default, NoRow, sized, ShortcutHint2)
		end
		local CellResult1 = if p1.config.theme == nil then nil else Compose.cell(true)
		local Callback1 = nil
		local Flag = false
		local DynamicResult1 = PropsResult.PressHapticEffect == nil and DynamicFunction(Frame.haptic)
		
		if PropsResult.PressHapticEffect == nil and not DynamicResult1 then
			local HapticResult = p1.haptic(ReadFunction(Frame.haptic))
			
			if HapticResult then
				PropsResult.PressHapticEffect = Compose.static(HapticResult)
			end
		end
		Button = p1.styled(Host.TextButton(PropsResult), "button")
		
		if InputButtonContentModuleResult then
			Button:AddTag("facet-button-glyph")
		end
		if HasIcon and Frame.image ~= nil then
			Button:AddTag("facet-button-media")
		end
		if Callback then
			Callback(Button)
		end
		ActivationModule.mark(Button)
		Compose.cleanup(ActivationModule.provide(Button, activate))
		
		if Frame.caption ~= nil then
			local Caption = p1.text({
				Name = "Caption",
				Text = Frame.caption,
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				AnchorPoint = TypesVector2.new(0.5, 0),
				Position = function(p4)
					-- upvalues: TypesUDim2 (upval), p1 (upval)
					return TypesUDim2.new(0.5, 0, 1, p1.metric("space.xs", p4))
				end
			})
			p1.textRole(Caption, "caption")
			Caption:AddTag("facet-button-outside")
			Button.ClipsDescendants = false
			Caption.Parent = Button
		end
		if ShortcutHint1 and IsCircle then
			ShortcutHint1:AddTag("facet-button-outside")
			Button.ClipsDescendants = false
			ShortcutHint1.Parent = Button
		end
		if not HasIcon then
			sized(Button, Frame.textSize)
			
			if Frame.shape ~= "circle" then
				local v4 = assert(Compose.currentOwner())
				local Callback3: (() -> ())? = nil
				local Flag4 = false
				local Connection = nil
				
				local function attach()
					-- upvalues: Button (ref), Flag4 (ref), TypesEnum (upval), Connection (ref), Callback3 (ref), Compose (upval), v4 (copy), p1 (upval), Runtime (upval), CellResult1 (copy), ReadFunction (upval), Frame (copy), v35 (upval)
					local AutomaticSize = Button.AutomaticSize
					
					if Flag4 or AutomaticSize == TypesEnum.AutomaticSize.X or AutomaticSize == TypesEnum.AutomaticSize.XY then return end
					Flag4 = true
					
					if Connection then
						Connection:Disconnect()
						Connection = nil
					end
					if Callback3 then
						Callback3()
						Callback3 = nil
					end
					Compose.withOwner(v4, function()
						-- upvalues: p1 (upval), Button (upval), Runtime (upval), Compose (upval), TypesEnum (upval), CellResult1 (upval), ReadFunction (upval), Frame (upval), v35 (upval)
						local AutomaticSizeResult = p1.observe.AutomaticSize(Button)
						Runtime.mountFragment(function()
							-- upvalues: Compose (upval), AutomaticSizeResult (copy), TypesEnum (upval), p1 (upval), Button (upval), CellResult1 (upval), ReadFunction (upval), Frame (upval), v35 (upval)
							return {
								Compose.show(function(Callback): boolean
									-- upvalues: AutomaticSizeResult (upval), TypesEnum (upval)
									local CallbackResult = Callback(AutomaticSizeResult)
									
									return CallbackResult ~= TypesEnum.AutomaticSize.X and CallbackResult ~= TypesEnum.AutomaticSize.XY
								end, function()
									-- upvalues: p1 (upval), Button (upval), Compose (upval), CellResult1 (upval), ReadFunction (upval), Frame (upval), v35 (upval)
									local TextResult = p1.observe.Text(Button)
									
									return Compose.show(function(Callback): boolean
										-- upvalues: TextResult (copy)
										return Callback(TextResult) ~= ""
									end, function()
										-- upvalues: p1 (upval), Button (upval), Compose (upval), CellResult1 (upval), TextResult (copy), ReadFunction (upval), Frame (upval), v35 (upval)
										local TextFitsResult = p1.observe.TextFits(Button)
										local AbsoluteSizeResult = p1.observe.AbsoluteSize(Button)
										local v5 = nil
										Compose.watch(function(Callback)
											-- upvalues: AbsoluteSizeResult (copy), TextFitsResult (copy), Button (upval), CellResult1 (upval), p1 (upval), TextResult (upval), v5 (ref), ReadFunction (upval), Frame (upval)
											Callback(AbsoluteSizeResult)
											Callback(TextFitsResult)
											local X: number = Button.AbsoluteSize.X
											local NoCellResult = Button.TextFits and (CellResult1 == nil or Callback(CellResult1))
											
											if not Button:HasTag("facet-button-tight") and (NoCellResult or X <= 0) then return end
											local Text: string = `{X}|{Callback(TextResult)}|{Callback((p1.observeStyled.TextSize(Button)))}|{Callback((p1.observeStyled.FontFace(Button)))}`
											
											if Text ~= v5 and Button:HasTag("facet-button-tight") then
												v5 = Text
												local X1 = Button.TextBounds.X
												local ScaledScale = 1
												local Parent = Button
												while Parent do
													local UIScale = Parent:FindFirstChildWhichIsA("UIScale")
													
													if UIScale then
														ScaledScale *= UIScale.Scale
													end
													Parent = Parent.Parent
												end
												local ReadResult = ReadFunction(p1.config.theme, Callback)
												local Control = ReadResult and (ReadResult.chrome and ReadResult.chrome.control)
												local ContentInsets = if Control then Control.contentInsets or {} else {}
												local ScaledPaddingX = (2 * p1.controlSize(Frame.controlSize, "paddingX", Callback) + (ContentInsets.left or 0) + (ContentInsets.right or 0)) * ScaledScale
												
												if X1 == 0 or NoCellResult and X1 + ScaledPaddingX <= X then
													Button:RemoveTag("facet-button-tight")
												end
											end
											if not NoCellResult and X > 0 and not Button:HasTag("facet-button-tight") then
												v5 = Text
												Button:AddTag("facet-button-tight")
											end
										end)
										Compose.cleanup(function()
											-- upvalues: Button (upval)
											Button:RemoveTag("facet-button-tight")
										end)
										
										return v35
									end)
								end)
							}
						end, Button)
					end)
				end
				
				Callback1 = attach
				
				if Button.TextFits then
					local Connection1 = Button:GetPropertyChangedSignal("TextFits"):Connect(function()
						-- upvalues: Button (ref), attach (copy)
						if not Button.TextFits then
							attach()
						end
					end)
					Connection = Connection1
					Callback3 = Compose.cleanup(function()
						-- upvalues: Connection1 (copy)
						Connection1:Disconnect()
					end)
				else
					attach()
				end
			end
		end
		if DynamicResult1 then
			local v5 = nil
			local Flag3 = false
			Compose.watch(function(p4)
				-- upvalues: p1 (upval), ReadFunction (upval), Frame (copy), Flag3 (ref), v5 (ref), Runtime (upval), Button (ref)
				local HapticResult = p1.haptic(ReadFunction(Frame.haptic, p4))
				
				if not Flag3 or HapticResult ~= v5 then
					Flag3 = true
					v5 = HapticResult
					Runtime.host.render.setProperty(Button, "PressHapticEffect", HapticResult)
				end
			end)
		end
		if HasIcon and (Frame.subtitle ~= nil or Frame.hint ~= nil or Frame.row ~= nil and Frame.row.description ~= nil) then
			local Description = (Frame.row or {}).description or (Frame.subtitle or Frame.hint)
			Compose.watch(function(p4)
				-- upvalues: p3 (upval), Description (copy), Button (ref)
				if p3.hasText(Description, p4) then
					Button:AddTag("facet-button-described")
					
					return
				else
					Button:RemoveTag("facet-button-described")
				end
			end)
		end
		local NoDisclose: boolean = Frame.disclose == nil or type(Frame.disclose) == "boolean"
		assert(NoDisclose, "Facet.Button: disclose must be a boolean")
		local Gate = nil
		
		if Frame.disclose then
			local Title = Button:FindFirstChild("Title", true)
			local TextFitsResult = p1.observe.TextFits(if Title and Title:IsA("TextLabel") then Title else Button)
			Gate = TextFitsResult
			HelpModule.attach(p1, Button, Frame.label or "", {
				name = "Disclosure",
				gate = function(Callback): boolean
					-- upvalues: TextFitsResult (copy)
					return not Callback(TextFitsResult)
				end
			})
		end
		if Frame.help ~= nil then
			HelpModule.attach(p1, Button, Frame.help, if Gate then { gate = Gate } else nil)
		end
		local FacetButtonRequiresAComposeOwner = assert(Compose.currentOwner(), "Facet.Button requires a Compose owner")
		NoDisclose = false
		
		local function selectedLazily(...)
			-- upvalues: GuiService (copy), v2 (ref), Compose (upval), v1 (ref), NoDisclose (ref), CoreModule (upval), FacetButtonRequiresAComposeOwner (copy), p1 (upval), Button (ref), Runtime (upval), TypesEnum (upval), ReadFunction (upval), FormulaResult (copy), EnabledResult (copy), activate (copy), DynamicResult (copy), IsNotHover (copy), Flag (ref)
			local v6 = (...) ~= false
			
			if not GuiService then
				if v2 then
					v2:set(v6)
				else
					local CellResult = Compose.cell(v6)
					v2 = CellResult
					v1 = CellResult
				end
			end
			if not NoDisclose and not CoreModule.owner.isDisposed(FacetButtonRequiresAComposeOwner) then
				NoDisclose = true
				Compose.withOwner(FacetButtonRequiresAComposeOwner, function()
					-- upvalues: GuiService (upval), p1 (upval), v1 (upval), Button (upval), Runtime (upval), v2 (upval), TypesEnum (upval), ReadFunction (upval), FormulaResult (upval), EnabledResult (upval), activate (upval), DynamicResult (upval), IsNotHover (upval), Compose (upval), Flag (upval), FacetButtonRequiresAComposeOwner (upval)
					if GuiService then
						local ObserveResult = p1.selection.observe()
						
						v1 = function(Callback): boolean
							-- upvalues: ObserveResult (copy), Button (upval)
							return Callback(ObserveResult) == Button
						end
					else
						Runtime.connect(Button, "SelectionLost", function()
							-- upvalues: v2 (upval)
							assert(v2):set(false)
						end)
					end
					local function attachKeyboard()
						-- upvalues: p1 (upval), Button (upval), TypesEnum (upval), ReadFunction (upval), v1 (upval), FormulaResult (upval), EnabledResult (upval), activate (upval)
						p1.action(Button, "Activate", { TypesEnum.KeyCode.Return }, function(Callback): boolean
							-- upvalues: p1 (upval), ReadFunction (upval), v1 (upval), FormulaResult (upval), EnabledResult (upval), Button (upval)
							local UserInputService = p1.config.services.UserInputService
							
							return ReadFunction(v1, Callback) == true and (if FormulaResult == nil then EnabledResult and (Button.Visible and (Button.Parent ~= nil and (not UserInputService or not UserInputService:GetFocusedTextBox()))) else (if Callback then Callback(FormulaResult) else FormulaResult:peek()) and (Button.Visible and (Button.Parent ~= nil and (not UserInputService or not UserInputService:GetFocusedTextBox()))))
						end, function()
							-- upvalues: activate (upval)
							activate(nil, nil)
						end, {
							priority = 5000,
							conditional = {
								binding = TypesEnum.KeyCode.Space,
								when = p1.spaceActivates(Button)
							}
						})
					end
					
					if DynamicResult or not IsNotHover then
						Compose.watch(function(Callback)
							-- upvalues: Flag (upval), ReadFunction (upval), v1 (upval), FormulaResult (upval), EnabledResult (upval), Compose (upval), FacetButtonRequiresAComposeOwner (upval), attachKeyboard (copy)
							if not Flag and ReadFunction(v1, Callback) == true and (if FormulaResult == nil then EnabledResult elseif Callback then Callback(FormulaResult) else FormulaResult:peek()) then
								Flag = true
								Compose.withOwner(FacetButtonRequiresAComposeOwner, attachKeyboard)
							end
						end)
						
						return
					end
					if if FormulaResult == nil then EnabledResult else FormulaResult:peek() then
						Flag = true
						attachKeyboard()
					end
				end)
				
				return
			end
		end
		
		if GuiService then
			if IsNotHover then
				p1.whenSelected(GuiService, Button, selectedLazily)
			else
				selectedLazily()
			end
		else
			if not IsNotHover then
				selectedLazily(false)
			end
			Runtime.connect(Button, "SelectionGained", selectedLazily)
		end
		if Underline == "hover" then
			local GuiStateResult = p1.observe.GuiState(Button)
			Compose.watch(function(Callback)
				-- upvalues: GuiStateResult (copy), CellResult2 (copy), TypesEnum (upval), ReadFunction (upval), v1 (ref)
				local CallbackResult = Callback(GuiStateResult)
				assert(CellResult2):set(CallbackResult == TypesEnum.GuiState.Hover or (CallbackResult == TypesEnum.GuiState.Press or ReadFunction(v1, Callback) == true))
			end)
		end
		if not HasIcon and p1.config.theme ~= nil then
			local _ = function(p4): boolean
				-- upvalues: ReadFunction (upval), p1 (upval)
				local ReadResult = ReadFunction(p1.config.theme, p4)
				local Control = ReadResult and (ReadResult.chrome and ReadResult.chrome.control)
				
				return Control ~= nil and (Control.kind ~= "native" and Control.kind ~= "none")
			end
			
			local function caption()
				-- upvalues: Compose (upval), Button (ref), TypesUDim2 (upval), TypesEnum (upval), p1 (upval), ReadFunction (upval), CellResult1 (copy), Callback1 (ref), NativeDecorationModule (upval), Runtime (upval)
				Compose.cleanup(function()
					-- upvalues: Button (upval)
					Button:RemoveTag("facet-button-captioned")
				end)
				local ButtonCaption = p1.styled(p1.text({
					Name = "Label",
					ZIndex = 1,
					Size = TypesUDim2.fromScale(1, 1),
					AutomaticSize = TypesEnum.AutomaticSize.None,
					Text = p1.observe.Text(Button),
					TextColor3 = p1.observeStyled.TextColor3(Button),
					FontFace = p1.observeStyled.FontFace(Button),
					TextSize = p1.observeStyled.TextSize(Button),
					TextXAlignment = p1.observeStyled.TextXAlignment(Button),
					TextYAlignment = p1.observeStyled.TextYAlignment(Button),
					TextWrapped = p1.observeStyled.TextWrapped(Button),
					RichText = p1.observeStyled.RichText(Button),
					TextScaled = p1.observeStyled.TextScaled(Button),
					TextTruncate = p1.observeStyled.TextTruncate(Button),
					LineHeight = p1.observeStyled.LineHeight(Button)
				}), "button-caption")
				local TextFitsResult = p1.observe.TextFits(ButtonCaption)
				local AbsoluteSizeResult = p1.observe.AbsoluteSize(ButtonCaption)
				Compose.watch(function(Callback: (any) -> ())
					-- upvalues: AbsoluteSizeResult (copy), TextFitsResult (copy), ReadFunction (upval), p1 (upval), ButtonCaption (copy), CellResult1 (upval), Callback1 (upval)
					Callback(AbsoluteSizeResult)
					Callback(TextFitsResult)
					local ReadResult = ReadFunction(p1.config.theme, Callback)
					local Control = ReadResult and (ReadResult.chrome and ReadResult.chrome.control)
					local Inverted = not (Control ~= nil and (Control.kind ~= "native" and Control.kind ~= "none")) or ButtonCaption.TextFits
					assert(CellResult1):set(Inverted)
					
					if not Inverted and Callback1 then
						Callback1()
					end
				end)
				local NativeDecorationModuleResult = NativeDecorationModule(Compose, Runtime, p1.types, Button, ButtonCaption, { inset = true })
				Compose.watch(function(p4)
					-- upvalues: ReadFunction (upval), p1 (upval), NativeDecorationModuleResult (copy), Button (upval)
					local ReadResult = ReadFunction(p1.config.theme, p4)
					local Control = ReadResult and (ReadResult.chrome and ReadResult.chrome.control)
					local IsNotNone: boolean = Control ~= nil and (Control.kind ~= "native" and Control.kind ~= "none")
					NativeDecorationModuleResult.Visible = IsNotNone
					
					if IsNotNone then
						Button:AddTag("facet-button-captioned")
						
						return
					else
						Button:RemoveTag("facet-button-captioned")
					end
				end)
				
				return NativeDecorationModuleResult
			end
			
			if Compose.isValue(p1.config.theme) or type(p1.config.theme) == "function" then
				p1.whenTheme("caption", captioned, function()
					-- upvalues: Runtime (upval), caption (copy), Button (ref)
					Runtime.mount(caption, Button)
				end)
			else
				local ReadResult4 = ReadFunction(p1.config.theme, nil)
				local Control = ReadResult4 and (ReadResult4.chrome and ReadResult4.chrome.control)
				
				if Control ~= nil and (Control.kind ~= "native" and Control.kind ~= "none") then
					Runtime.mount(caption, Button)
				end
			end
		end
		if Frame.compactLabel then
			assert(not HasIcon, "Facet.Button: compactLabel requires a text button")
			local AbsoluteSizeResult = p1.observe.AbsoluteSize(Button)
			local FullLabelMeasure = nil
			Runtime.mount(function()
				-- upvalues: FullLabelMeasure (ref), p1 (upval), Frame (copy), Button (ref), TypesEnum (upval)
				FullLabelMeasure = p1.text({
					Name = "FullLabelMeasure",
					Visible = false,
					TextWrapped = false,
					Text = Frame.label,
					FontFace = p1.observeStyled.FontFace(Button),
					TextSize = p1.observeStyled.TextSize(Button),
					AutomaticSize = TypesEnum.AutomaticSize.XY
				})
				
				return FullLabelMeasure
			end, Button)
			local LayoutUnitResult = p1.layoutUnit(Button)
			local TextBoundsResult = p1.observe.TextBounds(FullLabelMeasure)
			local AutomaticSizeResult = p1.observe.AutomaticSize(Button)
			local ParentResult = p1.observe.Parent(Button)
			local CellResult3 = Compose.cell(0)
			Compose.watch(function(Callback)
				-- upvalues: ParentResult (copy), p1 (upval), Compose (upval), CellResult3 (copy)
				local CallbackResult = Callback(ParentResult)
				
				if CallbackResult and (CallbackResult:IsA("GuiObject") or CallbackResult:IsA("ScreenGui")) then
					local AbsoluteSizeResult = p1.observe.AbsoluteSize(CallbackResult)
					Compose.watch(function(Callback)
						-- upvalues: CellResult3 (upval), AbsoluteSizeResult (copy)
						CellResult3:set(Callback(AbsoluteSizeResult).X)
					end)
					
					return
				else
					CellResult3:set(0)
				end
			end)
			Runtime.decorate(Button, {
				Text = function(Callback)
					-- upvalues: AutomaticSizeResult (copy), LayoutUnitResult (copy), TypesEnum (upval), CellResult3 (copy), AbsoluteSizeResult (copy), TextBoundsResult (copy), p1 (upval), Frame (copy), ReadFunction (upval)
					local CallbackResult = Callback(AutomaticSizeResult)
					local CallbackResult1 = Callback(LayoutUnitResult)
					local IsCallbackResultMatch: boolean = CallbackResult == TypesEnum.AutomaticSize.X or CallbackResult == TypesEnum.AutomaticSize.XY
					local CallbackResultRatio = if IsCallbackResultMatch and Callback(CellResult3) > 0 then Callback(CellResult3) / CallbackResult1 else Callback(AbsoluteSizeResult).X / CallbackResult1
					local IsCallbackResultRatioBelow: boolean = CallbackResultRatio > 0 and CallbackResultRatio - 2 * p1.controlSize(Frame.controlSize, "paddingX", Callback) < Callback(TextBoundsResult).X / CallbackResult1
					
					return ReadFunction(if IsCallbackResultRatioBelow then Frame.compactLabel else Frame.label, Callback)
				end
			})
		end
		if not p3.unskinned[Frame] then
			local function skin(p4)
				-- upvalues: p1 (upval), Button (ref), ReadFunction (upval), Frame (copy), FormulaResult (copy), EnabledResult (copy)
				p1.skin(Button, "control", {
					emphasis = ReadFunction(Frame.appearance, p4) == "emphasis",
					selected = Frame.selected,
					disabled = function(Callback): boolean
						-- upvalues: FormulaResult (upval), EnabledResult (upval)
						return not (if FormulaResult == nil then EnabledResult elseif Callback then Callback(FormulaResult) else FormulaResult:peek())
					end
				})
			end
			
			local _ = function(p4): boolean
				-- upvalues: ReadFunction (upval), Frame (copy)
				local ReadResult = ReadFunction(Frame.appearance, p4)
				
				return ReadResult ~= "utility" and (ReadResult ~= "link" and (ReadResult ~= "bare" and ReadFunction(Frame.BackgroundTransparency, p4) ~= 1))
			end
			
			if DynamicFunction(Frame.appearance) or DynamicFunction(Frame.BackgroundTransparency) then
				Compose.watch(function(p4)
					-- upvalues: ReadFunction (upval), Frame (copy), skin (copy)
					local ReadResult = ReadFunction(Frame.appearance, p4)
					
					if ReadResult ~= "utility" and (ReadResult ~= "link" and (ReadResult ~= "bare" and ReadFunction(Frame.BackgroundTransparency, p4) ~= 1)) then
						skin(p4)
					end
				end)
			else
				local ReadResult5 = ReadFunction(Frame.appearance, nil)
				
				if ReadResult5 ~= "utility" and (ReadResult5 ~= "link" and (ReadResult5 ~= "bare" and ReadFunction(Frame.BackgroundTransparency, nil) ~= 1)) then
					skin()
				end
			end
		end
		local GuiStateResult1 = if Default then p1.observe.GuiState(Button) else nil
		local t2 = {}
		local t3 = {}
		local Flag5 = false
		local v6 = nil
		
		local _ = function(Tag, p4)
			-- upvalues: t2 (copy), Button (ref)
			if t2[Tag] == true ~= p4 then
				t2[Tag] = if p4 then true else nil
				
				if p4 then
					Button:AddTag(Tag)
					
					return
				end
				Button:RemoveTag(Tag)
			end
		end
		
		local SetAttributeFunction = Button.SetAttribute
		
		local _ = function(Key, p4)
			-- upvalues: Flag5 (ref), t3 (copy), SetAttributeFunction (copy), Button (ref)
			if not Flag5 or t3[Key] ~= p4 then
				t3[Key] = p4
				SetAttributeFunction(Button, Key, p4)
			end
		end
		
		local function updateState(Callback)
			-- upvalues: ReadFunction (upval), Frame (copy), FormulaResult (copy), EnabledResult (copy), Flag5 (ref), t3 (copy), config (upval), Button (ref), t2 (copy), Default (ref), GuiStateResult1 (copy), TypesEnum (upval), Tags (upval), v6 (ref), list (upval), t (upval), SetAttributeFunction (copy)
			local IsReadResult = ReadFunction(Frame.selected, Callback) == true
			local IsReadResult1 = ReadFunction(Frame.busy, Callback) == true
			local EnabledResult1 = if FormulaResult == nil then EnabledResult elseif Callback then Callback(FormulaResult) else FormulaResult:peek()
			local ReadResult = ReadFunction(Frame.role, Callback) or "default"
			local ReadResult1 = ReadFunction(Frame.appearance, Callback) or "standard"
			local NoFlag5: boolean = not Flag5 or t3.role ~= ReadResult
			local NoFlag5_1: boolean = not Flag5 or t3.appearance ~= ReadResult1
			assert(config[ReadResult], "Facet.Button: invalid semantic role")
			
			if not Flag5 then
				for _, tag in Button:GetTags() do
					t2[tag] = true
				end
			end
			if Default then
				local ReadResult2 = ReadFunction(GuiStateResult1, Callback)
				Default:set(if EnabledResult1 then if ReadResult2 == TypesEnum.GuiState.Press then "pressed" elseif ReadResult2 == TypesEnum.GuiState.Hover then "hover" elseif IsReadResult then "selected" else "default" else "disabled")
			end
			if NoFlag5 then
				for i, tag1 in Tags do
					local IsReadResultMatch = ReadResult == i
					
					if t2[tag1] == true ~= IsReadResultMatch then
						t2[tag1] = if IsReadResultMatch then true else nil
						
						if IsReadResultMatch then
							Button:AddTag(tag1)
						else
							Button:RemoveTag(tag1)
						end
					end
				end
			end
			if t2["facet-selected"] == true ~= IsReadResult then
				t2["facet-selected"] = if IsReadResult then true else nil
				
				if IsReadResult then
					Button:AddTag("facet-selected")
				else
					Button:RemoveTag("facet-selected")
				end
			end
			if t2["facet-busy"] == true ~= IsReadResult1 then
				t2["facet-busy"] = if IsReadResult1 then true else nil
				
				if IsReadResult1 then
					Button:AddTag("facet-busy")
				else
					Button:RemoveTag("facet-busy")
				end
			end
			if not Flag5 then
				local IsCircle = Frame.shape == "circle"
				
				if t2["facet-shape-circle"] == true ~= IsCircle then
					t2["facet-shape-circle"] = if IsCircle then true else nil
					
					if IsCircle then
						Button:AddTag("facet-shape-circle")
					else
						Button:RemoveTag("facet-shape-circle")
					end
				end
			end
			local NoEnabledResult1 = not EnabledResult1
			
			if t2["facet-disabled"] == true ~= NoEnabledResult1 then
				t2["facet-disabled"] = if NoEnabledResult1 then true else nil
				
				if NoEnabledResult1 then
					Button:AddTag("facet-disabled")
				else
					Button:RemoveTag("facet-disabled")
				end
			end
			if NoFlag5_1 then
				local IsEmphasis = ReadResult1 == "emphasis"
				
				if t2["facet-accent"] == true ~= IsEmphasis then
					t2["facet-accent"] = if IsEmphasis then true else nil
					
					if IsEmphasis then
						Button:AddTag("facet-accent")
					else
						Button:RemoveTag("facet-accent")
					end
				end
				local IsSoft = ReadResult1 == "soft"
				
				if t2["facet-appearance-soft"] == true ~= IsSoft then
					t2["facet-appearance-soft"] = if IsSoft then true else nil
					
					if IsSoft then
						Button:AddTag("facet-appearance-soft")
					else
						Button:RemoveTag("facet-appearance-soft")
					end
				end
				local IsUtility = ReadResult1 == "utility"
				
				if t2["facet-appearance-utility"] == true ~= IsUtility then
					t2["facet-appearance-utility"] = if IsUtility then true else nil
					
					if IsUtility then
						Button:AddTag("facet-appearance-utility")
					else
						Button:RemoveTag("facet-appearance-utility")
					end
				end
				local IsLink = ReadResult1 == "link"
				
				if t2["facet-appearance-link"] == true ~= IsLink then
					t2["facet-appearance-link"] = if IsLink then true else nil
					
					if IsLink then
						Button:AddTag("facet-appearance-link")
					else
						Button:RemoveTag("facet-appearance-link")
					end
				end
				local IsBare = ReadResult1 == "bare"
				
				if t2["facet-appearance-bare"] == true ~= IsBare then
					t2["facet-appearance-bare"] = if IsBare then true else nil
					
					if IsBare then
						Button:AddTag("facet-appearance-bare")
					else
						Button:RemoveTag("facet-appearance-bare")
					end
				end
				local IsInverse = ReadResult1 == "inverse"
				
				if t2["facet-appearance-inverse"] == true ~= IsInverse then
					t2["facet-appearance-inverse"] = if IsInverse then true else nil
					
					if IsInverse then
						Button:AddTag("facet-appearance-inverse")
					else
						Button:RemoveTag("facet-appearance-inverse")
					end
				end
			end
			if NoFlag5 or NoFlag5_1 then
				local IsUtility: boolean = ReadResult == "destructive" and (ReadResult1 == "utility" or ReadResult1 == "link")
				
				if t2["facet-quiet-destructive"] == true ~= IsUtility then
					t2["facet-quiet-destructive"] = if IsUtility then true else nil
					
					if IsUtility then
						Button:AddTag("facet-quiet-destructive")
					else
						Button:RemoveTag("facet-quiet-destructive")
					end
				end
			end
			local ReadResult3 = ReadFunction(Frame.controlSize, Callback)
			
			if not Flag5 or v6 ~= ReadResult3 then
				for i1, value in list do
					local Entry = t[i1]
					local v7 = ReadResult3 == value
					
					if t2[Entry] == true ~= v7 then
						t2[Entry] = if v7 then true else nil
						
						if v7 then
							Button:AddTag(Entry)
						else
							Button:RemoveTag(Entry)
						end
					end
				end
				v6 = ReadResult3
			end
			if not Flag5 or t3.selected ~= IsReadResult then
				t3.selected = IsReadResult
				SetAttributeFunction(Button, "selected", IsReadResult)
			end
			if not Flag5 or t3.busy ~= IsReadResult1 then
				t3.busy = IsReadResult1
				SetAttributeFunction(Button, "busy", IsReadResult1)
			end
			if not Flag5 or t3.appearance ~= ReadResult1 then
				t3.appearance = ReadResult1
				SetAttributeFunction(Button, "appearance", ReadResult1)
			end
			local ControlSize = ReadResult3 or "regular"
			
			if not Flag5 or t3.controlSize ~= ControlSize then
				t3.controlSize = ControlSize
				SetAttributeFunction(Button, "controlSize", ControlSize)
			end
			if not Flag5 or t3.role ~= ReadResult then
				t3.role = ReadResult
				SetAttributeFunction(Button, "role", ReadResult)
			end
			local ReadResult4 = ReadFunction(Frame.name or (Frame.label or ""), Callback) or ""
			
			if not Flag5 or t3.label ~= ReadResult4 then
				t3.label = ReadResult4
				SetAttributeFunction(Button, "label", ReadResult4)
			end
			Flag5 = true
		end
		
		if Default ~= nil or (DynamicFunction(Frame.selected) or (DynamicFunction(Frame.busy) or (DynamicFunction(Frame.enabled) or (DynamicFunction(Frame.disabled) or (DynamicFunction(Frame.role) or (DynamicFunction(Frame.appearance) or (DynamicFunction(Frame.controlSize) or (DynamicFunction(Frame.name) or DynamicFunction(Frame.label))))))))) then
			Compose.watch(updateState)
		else
			updateState()
		end
		local v8 = nil
		local v9 = nil
		local v10 = nil
		
		if HasRepeatDelay or (Frame.onPointerDown or (Frame.onPointerUp or Frame.onPointerCancel)) then
			local RepeatHeldResult: (() -> ())? = nil
			
			local _ = function()
				-- upvalues: Flag1 (ref), RepeatHeldResult (ref)
				Flag1 = false
				
				if RepeatHeldResult then
					RepeatHeldResult()
					RepeatHeldResult = nil
				end
			end
			
			local function cancel()
				-- upvalues: Flag1 (ref), RepeatHeldResult (ref), Frame (copy)
				local Flag: boolean = Flag1
				Flag1 = false
				
				if RepeatHeldResult then
					RepeatHeldResult()
					RepeatHeldResult = nil
				end
				if Flag and Frame.onPointerCancel then
					Frame.onPointerCancel()
				end
			end
			
			local function startRepeat()
				-- upvalues: RepeatHeldResult (ref), HasRepeatDelay (copy), p3 (upval), Runtime (upval), RepeatDelay (copy), RepeatInterval (copy), Flag1 (ref), FormulaResult (copy), EnabledResult (copy), p1 (upval), Button (ref), Flag2 (ref), activate (copy)
				if not RepeatHeldResult and HasRepeatDelay then
					RepeatHeldResult = p3.repeatHeld(assert(Runtime.host.frames), RepeatDelay, RepeatInterval, function(): boolean
						-- upvalues: Flag1 (upval), FormulaResult (upval), EnabledResult (upval), p1 (upval), Button (upval), RepeatHeldResult (upval)
						if Flag1 and ((if FormulaResult == nil then EnabledResult else FormulaResult:peek()) and p1.available(Button)) then
							return true
						end
						Flag1 = false
						
						if RepeatHeldResult then
							RepeatHeldResult()
							RepeatHeldResult = nil
						end
						return false
					end, function()
						-- upvalues: Flag2 (upval), activate (upval)
						Flag2 = true
						activate(nil, nil)
					end)
					
					return
				end
			end
			
			Compose.cleanup(cancel)
			Runtime.connect(Button, "Destroying", cancel)
			
			local function began(Input)
				-- upvalues: FormulaResult (copy), EnabledResult (copy), TypesEnum (upval), Flag1 (ref), Flag2 (ref), startRepeat (copy), Frame (copy)
				local Name = Input.UserInputType.Name
				
				if (if FormulaResult == nil then EnabledResult else FormulaResult:peek()) and (Name == "MouseButton1" or Name == "Touch" or Input.KeyCode == TypesEnum.KeyCode.ButtonA or Input.KeyCode == TypesEnum.KeyCode.Return or Input.KeyCode == TypesEnum.KeyCode.Space) then
					Flag1 = true
					Flag2 = false
					startRepeat()
					local OnPointerDownFunction: (any) -> () = Frame.onPointerDown
					
					if OnPointerDownFunction then
						OnPointerDownFunction(Input)
					end
				end
			end
			
			local function ended(p4)
				-- upvalues: Flag1 (ref), RepeatHeldResult (ref), Frame (copy)
				if Flag1 then
					Flag1 = false
					
					if RepeatHeldResult then
						RepeatHeldResult()
						RepeatHeldResult = nil
					end
					local OnPointerUpFunction: (any) -> () = Frame.onPointerUp
					
					if OnPointerUpFunction then
						OnPointerUpFunction(p4)
					end
				end
			end
			
			v8 = began
			v9 = ended
			v10 = cancel
			Runtime.connect(Button, "InputBegan", began)
			Runtime.connect(Button, "InputEnded", ended)
			Runtime.connect(Button, "MouseLeave", cancel)
		end
		local Inputs = {}
		
		if Frame.shortcut then
			local Shortcut = Frame.shortcut
			assert(Shortcut.keyCode ~= "Escape" and Shortcut.keyCode ~= "Tab", "Facet.Button: Escape and Tab retain native navigation ownership")
			local Modifiers = Shortcut.modifiers or {}
			local List = if Modifiers.shift then {
				TypesEnum.KeyCode.LeftShift,
				TypesEnum.KeyCode.RightShift
			} else { NoKey }
			for _, PrimaryModifier in List do
				Inputs[#Inputs + 1] = {
					KeyCode = assert(TypesEnum.KeyCode:FromName(Shortcut.keyCode)),
					PrimaryModifier = PrimaryModifier
				}
			end
		end
		if Frame.dialogAction then
			local Return = if Frame.dialogAction == "default" then TypesEnum.KeyCode.Return else TypesEnum.KeyCode.ButtonB
			local Flag6 = false
			
			for _, input in Inputs do
				if input.KeyCode == Return and input.PrimaryModifier == NoKey then
					Flag6 = true
				end
			end
			if not Flag6 then
				Inputs[#Inputs + 1] = { KeyCode = Return }
			end
		end
		if #Inputs > 0 then
			local IsShift: boolean = Frame.shortcut ~= nil and (Frame.shortcut.modifiers ~= nil and Frame.shortcut.modifiers.shift == true)
			local Priority: number = if IsShift then 2001 else 2000
			
			if Frame.dialogAction then
				Count += 1
				Priority -= Count
			end
			p1.action(Button, "Shortcut", Inputs, shortcutActive, activateShortcut, {
				priority = Priority,
				sink = Frame.dialogAction ~= nil or IsShift
			})
		end
		if ThumbFloorResult then
			local BindOwnerResult: () -> () = Compose.bindOwner(function()
				-- upvalues: NoAutomaticSize (copy), Runtime (upval), Compose (upval), ThumbFloorResult (copy), HasUserInputService (copy), EffectiveInputResult (copy), worded (copy), SizeFloorModule (upval), Button (ref), Host (upval), TypesVector2 (upval), Frame (copy), p1 (upval), ActivationModule (upval), Callback2 (copy), FormulaResult2 (copy), TypesUDim2 (upval), v8 (ref), v9 (ref), v10 (ref), NativeDecorationModule (upval)
				if not NoAutomaticSize then
					Runtime.mountFragment(function()
						-- upvalues: Compose (upval), ThumbFloorResult (upval), HasUserInputService (upval), EffectiveInputResult (upval), worded (upval), SizeFloorModule (upval), Button (upval), Host (upval), TypesVector2 (upval), Frame (upval), p1 (upval)
						return {
							Compose.show(function(p4): boolean
								-- upvalues: ThumbFloorResult (upval), HasUserInputService (upval), EffectiveInputResult (upval), worded (upval)
								return (if ThumbFloorResult == nil then 0 elseif HasUserInputService and (EffectiveInputResult ~= nil and EffectiveInputResult(p4) == "Touch") then ThumbFloorResult(p4) elseif worded(p4) then ThumbFloorResult(p4) else 0) > 0
							end, function()
								-- upvalues: SizeFloorModule (upval), Button (upval), Compose (upval), Host (upval), ThumbFloorResult (upval), HasUserInputService (upval), EffectiveInputResult (upval), worded (upval), TypesVector2 (upval), Frame (upval), p1 (upval)
								local OfResult = SizeFloorModule.of(Button, Compose.cell)
								
								return Host.UISizeConstraint("TargetFloor")({
									MinSize = function(Callback)
										-- upvalues: ThumbFloorResult (upval), HasUserInputService (upval), EffectiveInputResult (upval), worded (upval), TypesVector2 (upval), Frame (upval), p1 (upval), OfResult (copy)
										local ThumbFloorResultResult = if ThumbFloorResult == nil then 0 elseif HasUserInputService and (EffectiveInputResult ~= nil and EffectiveInputResult(Callback) == "Touch") then ThumbFloorResult(Callback) elseif worded(Callback) then ThumbFloorResult(Callback) else 0
										
										return TypesVector2.new(math.max(if Frame.target == "inline" then math.min(ThumbFloorResultResult, p1.metric("targetSizes.inline", Callback)) else ThumbFloorResultResult, Callback(OfResult.x)), (math.max(ThumbFloorResultResult, Callback(OfResult.y))))
									end
								})
							end)
						}
					end, Button)
				end
				local function reached(p4, p5)
					-- upvalues: Button (upval), ActivationModule (upval), Callback2 (upval)
					local LayerCollector = Button:FindFirstAncestorWhichIsA("LayerCollector")
					local BasePlayerGui = if LayerCollector then LayerCollector:FindFirstAncestorWhichIsA("BasePlayerGui") else nil
					
					if BasePlayerGui and p4 then
						local Position = p4.Position
						
						for _, value in BasePlayerGui:GetGuiObjectsAtPosition(Position.X, Position.Y) do
							if Button:IsDescendantOf(value) then break end
							if value ~= Button and not value:IsDescendantOf(Button) and ActivationModule.marked(value) and ActivationModule.trigger(value, p4, p5) then return end
						end
					end
					Callback2(p4, p5)
				end
				
				local function hitTarget(FormulaResult)
					-- upvalues: FormulaResult2 (upval), TypesUDim2 (upval), reached (copy), Host (upval), v8 (upval), v9 (upval), v10 (upval), Runtime (upval), TypesVector2 (upval), Frame (upval), Compose (upval), NativeDecorationModule (upval), p1 (upval), Button (upval)
					local function strip(p6, NewResult, FromScaleResult, p7)
						-- upvalues: FormulaResult2 (upval), FormulaResult (copy), TypesUDim2 (upval), reached (upval), Host (upval), v8 (upval), v9 (upval), v10 (upval), Runtime (upval)
						local v11 = Host.TextButton(p6)({
							Text = "",
							BackgroundTransparency = 1,
							AutoButtonColor = false,
							Selectable = false,
							Interactable = FormulaResult2,
							AnchorPoint = NewResult,
							Position = FromScaleResult,
							Size = function(Callback)
								-- upvalues: FormulaResult (upval), p7 (copy), TypesUDim2 (upval)
								local CallbackResult = Callback(FormulaResult)
								
								return if p7 then TypesUDim2.new(1, 2 * CallbackResult.X, 0, CallbackResult.Y) else TypesUDim2.new(0, CallbackResult.X, 1, 0)
							end,
							Visible = function(Callback): boolean
								-- upvalues: FormulaResult (upval), p7 (copy)
								local CallbackResult = Callback(FormulaResult)
								
								return (if p7 then CallbackResult.Y else CallbackResult.X) > 0
							end,
							Activated = reached
						})
						local v12 = v8
						local v13 = v9
						local v14 = v10
						
						if v12 and v13 and v14 then
							Runtime.connect(v11, "InputBegan", v12)
							Runtime.connect(v11, "InputEnded", v13)
							Runtime.connect(v11, "MouseLeave", v14)
						end
						return v11
					end
					
					local list = {
						strip("HitTop", TypesVector2.new(0.5, 1), TypesUDim2.fromScale(0.5, 0), true),
						strip("HitBottom", TypesVector2.new(0.5, 0), TypesUDim2.fromScale(0.5, 1), true),
						strip("HitLeading", TypesVector2.new(1, 0.5), TypesUDim2.fromScale(0, 0.5), false),
						(strip("HitTrailing", TypesVector2.new(0, 0.5), TypesUDim2.fromScale(1, 0.5), false))
					}
					
					return if Frame.busy == nil then Compose.fragment(function()
						-- upvalues: list (copy)
						return list
					end) else NativeDecorationModule(Compose, Runtime, p1.types, Button, (Host.Frame("HitTarget")({
						Size = TypesUDim2.fromScale(1, 1),
						BackgroundTransparency = 1,
						table.unpack(list)
					})))
				end
				
				Runtime.mountFragment(function()
					-- upvalues: Compose (upval), ThumbFloorResult (upval), HasUserInputService (upval), EffectiveInputResult (upval), worded (upval), Runtime (upval), Button (upval), p1 (upval), TypesVector2 (upval), Frame (upval), hitTarget (copy)
					return {
						Compose.show(function(p6): boolean
							-- upvalues: ThumbFloorResult (upval), HasUserInputService (upval), EffectiveInputResult (upval), worded (upval)
							return (if ThumbFloorResult == nil or HasUserInputService then 0 elseif EffectiveInputResult ~= nil and EffectiveInputResult(p6) == "Touch" and not worded(p6) then ThumbFloorResult(p6) else 0) > 0
						end, function()
							-- upvalues: Compose (upval), Runtime (upval), Button (upval), p1 (upval), ThumbFloorResult (upval), HasUserInputService (upval), EffectiveInputResult (upval), worded (upval), TypesVector2 (upval), Frame (upval), hitTarget (upval)
							local CellResult = Compose.cell(0)
							Runtime.connect(Button, "AncestryChanged", function()
								-- upvalues: CellResult (copy)
								CellResult:set(CellResult:peek() + 1)
							end)
							local FormulaResult = Compose.formula(function(Callback: (any) -> ())
								-- upvalues: CellResult (copy), Button (upval)
								Callback(CellResult)
								local Parent = Button.Parent
								
								return if Parent and Parent:IsA("GuiBase2d") and (Parent:IsA("LayerCollector") or Parent:FindFirstAncestorWhichIsA("LayerCollector")) then Parent else nil
							end)
							local CellResult1 = Compose.cell(1)
							Compose.watch(function(Callback)
								-- upvalues: FormulaResult (copy), p1 (upval), Compose (upval), CellResult1 (copy)
								local CallbackResult = Callback(FormulaResult)
								
								if CallbackResult then
									local LayoutUnitResult = p1.layoutUnit(CallbackResult)
									Compose.watch(function(Callback)
										-- upvalues: CellResult1 (upval), LayoutUnitResult (copy)
										CellResult1:set(Callback(LayoutUnitResult))
									end)
								end
							end)
							local LayoutSizeResult = p1.layoutSize(Button, CellResult1)
							local FormulaResult1 = Compose.formula(function(Callback)
								-- upvalues: LayoutSizeResult (copy), ThumbFloorResult (upval), HasUserInputService (upval), EffectiveInputResult (upval), worded (upval), TypesVector2 (upval), Frame (upval), p1 (upval)
								local CallbackResult = Callback(LayoutSizeResult)
								local ThumbFloorResultResult = if ThumbFloorResult == nil or HasUserInputService then 0 elseif EffectiveInputResult ~= nil and EffectiveInputResult(Callback) == "Touch" and not worded(Callback) then ThumbFloorResult(Callback) else 0
								
								return TypesVector2.new(math.max(0, ((if Frame.target == "inline" then math.min(ThumbFloorResultResult, p1.metric("targetSizes.inline", Callback)) else ThumbFloorResultResult) - CallbackResult.X) / 2), (math.max(0, (ThumbFloorResultResult - CallbackResult.Y) / 2)))
							end)
							
							return Compose.show(function(Callback): boolean
								-- upvalues: FormulaResult1 (copy)
								local CallbackResult = Callback(FormulaResult1)
								
								return CallbackResult.X > 0 or CallbackResult.Y > 0
							end, function()
								-- upvalues: hitTarget (upval), FormulaResult1 (copy)
								return hitTarget(FormulaResult1)
							end)
						end)
					}
				end, Button)
			end)
			local Flag7 = false
			
			local function arm(p4)
				-- upvalues: Flag7 (ref), BindOwnerResult (copy)
				if p4 and not Flag7 then
					Flag7 = true
					BindOwnerResult()
				end
			end
			
			local UchFloorActive = p1.touchFloorActive()
			
			if UchFloorActive:peek() and not Flag7 then
				Flag7 = true
				BindOwnerResult()
			end
			if not Flag7 then
				Compose.owner.watchStatic(FacetButtonRequiresAComposeOwner, UchFloorActive, arm)
			end
		end
		if TimelineResult then
			FeedbackPaintModule(p1, Button, Host.UIScale("Pop")({ Scale = FormulaResult1 }), {
				Size = PropsResult.Size,
				AutomaticSize = PropsResult.AutomaticSize
			})
		end
		if Frame.cooldown ~= nil or Frame.charges ~= nil then
			require("./input_button_cooldown")(p1, Button, Frame.cooldown, Frame.charges)
		end
		return Button
	end)
end