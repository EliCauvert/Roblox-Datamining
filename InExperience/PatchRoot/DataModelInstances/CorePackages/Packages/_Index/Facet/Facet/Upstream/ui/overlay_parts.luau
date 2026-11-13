local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./theme_types")
local _ = require("./overlay_types")
local MeasuredScrollModule = require("./measured_scroll")
local ScrollLockModule = require("./scroll_lock")
local FreezeModule = require("./freeze")
local _ = require("./input_props")
local NativeDecorationModule = require("./native_decoration")
local OverlayPartsModule = {
	WIDTHS = FreezeModule({
		automatic = "controls.alert.maxWidth",
		narrow = "controls.popup.panelWidth",
		wide = "controls.dialog.wideWidth"
	}),
	instance = function(Content): boolean
		return typeof(Content) == "Instance" or type(Content) == "table" and type(Content.IsA) == "function"
	end,
	readable = function(p1, Callback)
		return type(Callback) == "function" or p1.Compose.isValue(Callback)
	end
}
local Frozen = table.freeze({
	"aspectRatio",
	"background",
	"height",
	"image",
	"scaleMode"
})
local Frozen1 = table.freeze({
	"aspectRatio", "background", "content", "height", "image", "scaleMode",
	"sticky"
})
local Frozen2 = table.freeze({
	"busy", "enabled", "id", "label", "onActivate", "role"
})
local Frozen3 = table.freeze({
	"busy", "enabled", "id", "keepOpen", "label", "onActivate", "role"
})
local FreezeModuleResult = FreezeModule({ fit = true, crop = true, stretch = true })
local FreezeModuleResult1 = FreezeModule({ default = true, cancel = true, destructive = true })

function OverlayPartsModule.bound(p1, Label, ValueType)
	-- upvalues: OverlayPartsModule (copy)
	return type(Label) == ValueType or OverlayPartsModule.readable(p1, Label)
end

function OverlayPartsModule.known(p1, List1, List, p2)
	for i in List1 do
		if type(i) ~= "string" or not table.find(List, i) then
			error(`Facet {p1}: unknown {p2} option '{tostring(i)}'`, 0)
		end
	end
end

local function _(p3: number): boolean
	return type(p3) == "number" and (p3 == p3 and p3 > 0) and p3 < 1e999
end

local function checkShape(p3, p4, p5)
	-- upvalues: FreezeModuleResult (copy)
	local AspectRatio: number = p4.aspectRatio
	local Height: number = p4.height
	
	if AspectRatio == nil == (Height == nil) then
		error(`Facet {p3}: {p5} takes exactly one of aspectRatio or height`, 0)
	end
	if AspectRatio ~= nil and (type(AspectRatio) ~= "number" or (AspectRatio ~= AspectRatio or (AspectRatio <= 0 or AspectRatio >= 1e999))) then
		error(`Facet {p3}: {p5}.aspectRatio must be a positive finite number`, 0)
	end
	if Height ~= nil and ((type(Height) ~= "number" or (Height ~= Height or (Height <= 0 or Height >= 1e999))) and (type(Height) ~= "string" or Height == "")) then
		error(`Facet {p3}: {p5}.height must be positive finite pixels or a theme metric name`, 0)
	end
	if p4.scaleMode ~= nil and (type(p4.scaleMode) ~= "string" or not FreezeModuleResult[p4.scaleMode]) then
		error(`Facet {p3}: {p5}.scaleMode must be fit, crop or stretch`, 0)
	end
end

function OverlayPartsModule.checkMedia(p3, p4)
	-- upvalues: OverlayPartsModule (copy), Frozen (copy), checkShape (copy)
	if p4 == nil then return end
	if type(p4) ~= "table" then
		error(`Facet {p3}: media must be a table with image and aspectRatio or height`, 0)
	end
	OverlayPartsModule.known(p3, p4, Frozen, "media")
	
	if type(p4.image) ~= "string" or p4.image == "" then
		error(`Facet {p3}: media.image must be an image source string`, 0)
	end
	checkShape(p3, p4, "media")
end

function OverlayPartsModule.checkHero(p3, p4)
	-- upvalues: OverlayPartsModule (copy), Frozen1 (copy), checkShape (copy)
	if p4 == nil then return end
	if type(p4) ~= "table" then
		error(`Facet {p3}: hero must be a table with image or content`, 0)
	end
	OverlayPartsModule.known(p3, p4, Frozen1, "hero")
	
	if p4.image == nil == (p4.content == nil) then
		error(`Facet {p3}: hero takes exactly one of image or content`, 0)
	end
	if p4.image ~= nil and (type(p4.image) ~= "string" or p4.image == "") then
		error(`Facet {p3}: hero.image must be an image source string`, 0)
	end
	if p4.content ~= nil then
		if not OverlayPartsModule.instance(p4.content) and type(p4.content) ~= "function" then
			error(`Facet {p3}: hero.content must be an Instance or a content factory`, 0)
		end
		if p4.scaleMode ~= nil then
			error(`Facet {p3}: hero.scaleMode applies to an image only`, 0)
		end
	end
	if p4.sticky ~= nil and type(p4.sticky) ~= "boolean" then
		error(`Facet {p3}: hero.sticky must be a boolean`, 0)
	end
	checkShape(p3, p4, "hero")
end

function OverlayPartsModule.checkActions(p3, p4, List1, p5, List, p6): number
	-- upvalues: OverlayPartsModule (copy), Frozen3 (copy), Frozen2 (copy), FreezeModuleResult1 (copy)
	if List1 == nil then
		return 0
	end
	if type(List1) ~= "table" or p5 < #List1 then
		error(`Facet {p4}: actions must be a list of at most {p5} actions`, 0)
	end
	local t = {}
	local Count = 0
	local Count1 = 0
	
	for _, value in List1 do
		if type(value) ~= "table" then
			error(`Facet {p4}: each action must be a table with id, label and onActivate`, 0)
		end
		OverlayPartsModule.known(p4, value, if p6 then Frozen3 else Frozen2, "action")
		
		if value.keepOpen ~= nil and type(value.keepOpen) ~= "boolean" then
			error(`Facet {p4}: action keepOpen must be a boolean`, 0)
		end
		local Id: string = value.id
		
		if type(Id) ~= "string" or Id == "" or t[Id] or string.find(Id, "/", 1, true) then
			error(`Facet {p4}: every action needs a unique string id without '/'`, 0)
		end
		if List and table.find(List, Id) then
			error(`Facet {p4}: action id '{Id}' is reserved for a built-in button`, 0)
		end
		t[Id] = true
		
		if not OverlayPartsModule.bound(p3, value.label, "string") then
			error(`Facet {p4}: action '{Id}' needs a string label or a bound one`, 0)
		end
		for _, value1 in { "enabled", "busy" } do
			if value[value1] ~= nil and not OverlayPartsModule.bound(p3, value[value1], "boolean") then
				error(`Facet {p4}: action '{Id}' {value1} must be a boolean or a bound one`, 0)
			end
		end
		if value.role ~= nil and (type(value.role) ~= "string" or not FreezeModuleResult1[value.role]) then
			error(`Facet {p4}: action '{Id}' role must be default, cancel or destructive`, 0)
		end
		if value.role == "default" then
			Count += 1
		elseif value.role == "cancel" then
			Count1 += 1
		end
		if type(value.onActivate) ~= "function" then
			error(`Facet {p4}: action '{Id}' needs an onActivate function`, 0)
		end
	end
	if Count > 1 or Count1 > 1 then
		error(`Facet {p4}: only one action may take each of role default and role cancel`, 0)
	end
	return #List1
end

function OverlayPartsModule.closeTarget(p7)
	return function(p8)
		-- upvalues: p7 (copy)
		local Largest = math.max(44, p7.metric("targetSizes.minimum", p8))
		
		return p7.types.UDim2.fromOffset(Largest, Largest)
	end
end

function OverlayPartsModule.closeRow(p7)
	return function(p8)
		-- upvalues: p7 (copy)
		return p7.types.UDim2.new(1, 0, 0, (math.max(44, p7.metric("targetSizes.minimum", p8))))
	end
end

function OverlayPartsModule.usable(p7, p8, p9): boolean
	return p8 ~= nil and (p7.read(p8.enabled, p9) ~= false and p7.read(p8.busy, p9) ~= true)
end

function OverlayPartsModule.initialAction(List)
	local Id = nil
	local v1 = nil
	
	for _, value in List do
		if value.usable and value.role ~= "destructive" then
			if value.default or value.role == "default" then
				return value.id
			end
			if value.role == "cancel" and Id == nil then
				Id = value.id
			end
			v1 = v1 or value.id
		end
	end
	return Id or v1
end

function OverlayPartsModule.call(p7, Callback: () -> (), ...)
	local Success, Result = pcall(p7, ...)
	
	if Callback then
		Callback()
	end
	if not Success then
		error(Result, 0)
	end
end

function OverlayPartsModule.width(p7, p8, p9)
	-- upvalues: OverlayPartsModule (copy)
	local ReadResult = p7.read(p8, p9) or "automatic"
	local WIDTH = OverlayPartsModule.WIDTHS[ReadResult]
	assert(WIDTH, `Facet width must be automatic, narrow or wide, not {tostring(ReadResult)}`)
	
	return p7.metric(WIDTH, p9)
end

function OverlayPartsModule.checkPreset(p7, p8, p9, Value, List)
	-- upvalues: OverlayPartsModule (copy)
	if Value ~= nil and not OverlayPartsModule.readable(p7, Value) and not table.find(List, Value) then
		error(`Facet {p8}: {p9} must be {table.concat(List, ", ")} or a readable of one`, 0)
	end
end

OverlayPartsModule.WIDTH_PRESETS = FreezeModule({ "automatic", "narrow", "wide" })
OverlayPartsModule.ACTION_LAYOUTS = FreezeModule({ "automatic", "row", "stacked" })

local _ = function(p7, p8, p9)
	return if type(p8) == "number" then p8 else p7.metric(p8, p9)
end

function OverlayPartsModule.media(p7, p8, p9)
	local Host = p7.Host
	local TypesEnum = p7.types.Enum
	local TypesUDim2 = p7.types.UDim2
	local List = {}
	
	if p8.image then
		table.insert(List, Host.ImageLabel("Image")({
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromScale(1, 1),
			Image = p8.image,
			ScaleType = if p8.scaleMode == "crop" then TypesEnum.ScaleType.Crop elseif p8.scaleMode == "stretch" then TypesEnum.ScaleType.Stretch else TypesEnum.ScaleType.Fit
		}))
	end
	local Height = p8.height
	local config = {
		BorderSizePixel = 0,
		Name = p9 or "Media",
		BackgroundTransparency = if p8.background then 0 else 1,
		BackgroundColor3 = p8.background,
		Size = if Height then function(p10)
			-- upvalues: TypesUDim2 (copy), p7 (copy), Height (copy)
			return TypesUDim2.new(1, 0, 0, if type(Height) == "number" then Height else p7.metric(Height, p10))
		end elseif p8.aspectRatio then TypesUDim2.new(1, 0, 0, 100000) else TypesUDim2.fromScale(1, 0)
	}
	
	for _, value in List do
		config[#config + 1] = value
	end
	local AspectRatio = p8.aspectRatio
	
	if AspectRatio and not Height then
		config[#config + 1] = Host.UIAspectRatioConstraint({
			AspectRatio = AspectRatio,
			DominantAxis = TypesEnum.DominantAxis.Width
		})
	end
	return Host.Frame(config)
end

function OverlayPartsModule.stackedForm(p10)
	local TypesEnum = p10.types.Enum
	local TenFootResult = p10.tenFoot()
	local GuiService = p10.config.guiService
	local PreferredTextSizeResult = if GuiService and GuiService.GetPropertyChangedSignal then p10.observe.PreferredTextSize(GuiService) else nil
	
	return function(Callback)
		-- upvalues: PreferredTextSizeResult (copy), TenFootResult (copy), TypesEnum (copy)
		local CallbackResult = if PreferredTextSizeResult then Callback(PreferredTextSizeResult) else nil
		
		return TenFootResult(Callback) or (CallbackResult == TypesEnum.PreferredTextSize.Larger or CallbackResult == TypesEnum.PreferredTextSize.Largest)
	end
end

function OverlayPartsModule.actions(p10, p11, List, p12, Callback, Callback1, p13)
	-- upvalues: OverlayPartsModule (copy)
	local Compose = p10.Compose
	local Host = p10.Host
	local TypesEnum = p10.types.Enum
	local TypesUDim2 = p10.types.UDim2
	
	local function _(p14)
		-- upvalues: p10 (copy), p12 (copy), OverlayPartsModule (upval)
		local ReadResult = p10.read(p12, p14) or "automatic"
		assert(table.find(OverlayPartsModule.ACTION_LAYOUTS, ReadResult), "Facet actionLayout must be automatic, row or stacked")
		
		return ReadResult
	end
	
	assert(table.find(OverlayPartsModule.ACTION_LAYOUTS, p10.read(p12, nil) or "automatic"), "Facet actionLayout must be automatic, row or stacked")
	local P48 = p13 or 44
	local List1 = {}
	local CellResult = Compose.cell(0)
	local StackedFormResult = OverlayPartsModule.stackedForm(p10)
	local FormulaResult = Compose.formula(function(Callback1): boolean
		-- upvalues: p10 (copy), p12 (copy), OverlayPartsModule (upval), List (copy), StackedFormResult (copy), CellResult (copy), Callback (copy)
		local ReadResult = p10.read(p12, Callback1) or "automatic"
		assert(table.find(OverlayPartsModule.ACTION_LAYOUTS, ReadResult), "Facet actionLayout must be automatic, row or stacked")
		
		return if ReadResult == "stacked" or ReadResult ~= "row" and (#List > 2 or StackedFormResult(Callback1)) then true else p10.read(p10.config.controlSize, Callback1) == "large" and ReadResult ~= "row" or Callback(Callback1) < Callback1(CellResult)
	end)
	local config = {
		Name = "Actions",
		BackgroundTransparency = 1,
		Size = TypesUDim2.new(1, 0, 0, 0),
		AutomaticSize = TypesEnum.AutomaticSize.Y,
		Host.UIListLayout({
			FillDirection = function(Callback)
				-- upvalues: FormulaResult (copy), TypesEnum (copy)
				return if Callback(FormulaResult) then TypesEnum.FillDirection.Vertical else TypesEnum.FillDirection.Horizontal
			end,
			HorizontalFlex = function(Callback)
				-- upvalues: FormulaResult (copy), TypesEnum (copy)
				return if Callback(FormulaResult) then TypesEnum.UIFlexAlignment.None else TypesEnum.UIFlexAlignment.Fill
			end,
			SortOrder = TypesEnum.SortOrder.LayoutOrder,
			Padding = p10.types.UDim.new(0, 8)
		})
	}
	
	for i, value in List do
		local ButtonResult = p11.Button({
			TextWrapped = false,
			Name = value.id,
			label = value.label,
			role = value.role,
			appearance = if value.role == "default" then "emphasis" else nil,
			enabled = value.enabled,
			busy = value.busy,
			dialogAction = if value.role == "default" then "default" else nil,
			Size = function(Callback)
				-- upvalues: FormulaResult (copy), TypesUDim2 (copy), P48 (copy)
				return if Callback(FormulaResult) then TypesUDim2.new(1, 0, 0, P48) else TypesUDim2.fromOffset(0, P48)
			end,
			AutomaticSize = TypesEnum.AutomaticSize.None,
			TextTruncate = function(Callback)
				-- upvalues: FormulaResult (copy), TypesEnum (copy)
				return if Callback(FormulaResult) then TypesEnum.TextTruncate.AtEnd else TypesEnum.TextTruncate.None
			end,
			LayoutOrder = function(Callback)
				-- upvalues: value (copy), FormulaResult (copy), List (copy), i (copy)
				return if value.role == "cancel" then if Callback(FormulaResult) then #List + 1 else 0 else i
			end,
			onActivate = function()
				-- upvalues: Callback1 (copy), value (copy)
				Callback1(value)
			end
		})
		config[#config + 1] = ButtonResult
		table.insert(List1, p10.observe.TextBounds(ButtonResult))
	end
	Compose.watch(function(Callback)
		-- upvalues: List1 (copy), CellResult (copy), List (copy)
		local Largest = 0
		
		for _, value in List1 do
			Largest = math.max(Largest, Callback(value).X + 24)
		end
		CellResult:set(#List * Largest + (#List - 1) * 8)
	end)
	
	return { frame = Host.Frame(config), stacked = FormulaResult }
end

function OverlayPartsModule.room(p14, List, p15, Callback1, Callback, p16, p17, p18)
	-- upvalues: ScrollLockModule (copy), OverlayPartsModule (copy)
	local Compose = p14.Compose
	local Host = p14.Host
	local TypesEnum = p14.types.Enum
	local TypesUDim2 = p14.types.UDim2
	
	local function _(Callback)
		-- upvalues: p16 (copy)
		return if type(p16) == "boolean" then p16 else Callback(p16)
	end
	
	local LayoutSizeResults = {}
	
	for _, value in List do
		if value ~= p15 then
			table.insert(LayoutSizeResults, p14.layoutSize(value, p17))
		end
	end
	local FormulaResult = Compose.formula(function(Callback)
		-- upvalues: List (copy), LayoutSizeResults (copy)
		local ScaledLargest = math.max(0, #List - 1) * 8
		
		for _, layoutSizeResult in LayoutSizeResults do
			ScaledLargest += Callback(layoutSizeResult).Y
		end
		return ScaledLargest
	end)
	local FormulaResult1 = Compose.formula(function(Callback2): boolean
		-- upvalues: Callback (copy), p15 (copy), Callback1 (copy), FormulaResult (copy)
		local CallbackResult: number = Callback(Callback2)
		
		return CallbackResult > 0 and CallbackResult + 0.5 < Callback2(FormulaResult) + (if p15 then math.min(44, Callback1(Callback2)) else 0)
	end)
	local FormulaResult2 = Compose.formula(function(Callback2): number
		-- upvalues: Callback1 (copy), FormulaResult1 (copy), Callback (copy), FormulaResult (copy), p16 (copy)
		local CallbackResult: number = Callback1(Callback2)
		
		if Callback2(FormulaResult1) then
			return CallbackResult
		else
			local Largest = math.max(0, Callback(Callback2) - Callback2(FormulaResult))
			
			return if if type(p16) == "boolean" then p16 else Callback2(p16) then Largest else math.min(CallbackResult, Largest)
		end
	end)
	local FormulaResult3 = Compose.formula(function(Callback): boolean
		-- upvalues: FormulaResult1 (copy), Callback1 (copy), FormulaResult2 (copy)
		return not Callback(FormulaResult1) and Callback(FormulaResult2) + 1 < Callback1(Callback)
	end)
	
	if p15 then
		p14.runtime.decorate(p15, {
			Size = function(Callback)
				-- upvalues: TypesUDim2 (copy), FormulaResult2 (copy)
				return TypesUDim2.new(1, 0, 0, Callback(FormulaResult2))
			end,
			ScrollingEnabled = function(Callback): boolean
				-- upvalues: FormulaResult1 (copy)
				return not Callback(FormulaResult1)
			end
		})
	end
	local UIListLayoutResult = Host.UIListLayout({
		SortOrder = TypesEnum.SortOrder.LayoutOrder,
		Padding = p14.types.UDim.new(0, 8)
	})
	local config = {
		Name = "Room",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 4,
		ScrollingDirection = TypesEnum.ScrollingDirection.Y,
		CanvasSize = TypesUDim2.fromOffset(0, 0),
		AutomaticCanvasSize = TypesEnum.AutomaticSize.Y,
		ScrollingEnabled = FormulaResult1,
		AutomaticSize = function(Callback)
			-- upvalues: p16 (copy), FormulaResult1 (copy), TypesEnum (copy)
			return if (if type(p16) == "boolean" then p16 else Callback(p16)) or Callback(FormulaResult1) then TypesEnum.AutomaticSize.None else TypesEnum.AutomaticSize.Y
		end,
		Size = function(Callback1)
			-- upvalues: p16 (copy), FormulaResult1 (copy), TypesUDim2 (copy), Callback (copy), p18 (copy)
			return if (if type(p16) == "boolean" then p16 else Callback1(p16)) or Callback1(FormulaResult1) then TypesUDim2.new(1, 0, 0, Callback(Callback1) + (if p18 then p18.verticalInset(Callback1) else 0)) else TypesUDim2.new(1, 0, 0, 0)
		end
	}
	
	for LayoutOrder, value1 in List do
		p14.runtime.decorate(value1, { LayoutOrder = LayoutOrder })
	end
	if p18 then
		config[#config + 1] = Host.Frame("Regions")({
			BackgroundTransparency = 1,
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y,
			UIListLayoutResult,
			p18.padding,
			table.unpack(List)
		})
	else
		config[#config + 1] = UIListLayoutResult
		
		for _, value2 in List do
			config[#config + 1] = value2
		end
	end
	config.Selectable = false
	config.SelectionGroup = false
	local ScrollingFrameResult = Host.ScrollingFrame(config)
	ScrollLockModule.own(ScrollingFrameResult, p14)
	OverlayPartsModule.reach(p14, ScrollingFrameResult, FormulaResult1, if p18 then p18.padding else nil, p17)
	
	return {
		frame = ScrollingFrameResult,
		pinned = FormulaResult,
		tight = FormulaResult1,
		bodyHeight = FormulaResult2,
		overflowing = FormulaResult3
	}
end

function OverlayPartsModule.reach(p19, ScrollFrame, FormulaResult, Padding, p20)
	local Compose = p19.Compose
	local TypesVector2 = p19.types.Vector2
	local UserInputService = p19.config.userInputService
	local Frames = p19.runtime.host.frames
	
	if p19.config.guiService ~= nil and UserInputService ~= nil and Frames ~= nil then
		local function shown(Frame): boolean
			-- upvalues: ScrollFrame (copy)
			local Gui = Frame
			while Gui and Gui ~= ScrollFrame do
				if Gui:IsA("GuiObject") and (not Gui.Visible or not Gui.Interactable) then
					return false
				end
				Gui = Gui.Parent
			end
			return Gui == ScrollFrame
		end
		
		local function nearest(Frame: Frame, p21: number)
			-- upvalues: ScrollFrame (copy), shown (copy)
			local Y: number = Frame.AbsolutePosition.Y
			local NewY = Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y
			local NewX = Frame.AbsolutePosition.X + Frame.AbsoluteSize.X / 2
			local v2 = nil
			local v3 = 1e999
			local v4 = 1e999
			
			for _, descendant in ScrollFrame:GetDescendants() do
				if descendant:IsA("GuiObject") and descendant ~= Frame and descendant.Selectable and not descendant:IsA("ScrollingFrame") and not Frame:IsDescendantOf(descendant) and descendant.AbsoluteSize.X > 0 and descendant.AbsoluteSize.Y > 0 and shown(descendant) then
					local AbsolutePosition = descendant.AbsolutePosition
					local AbsoluteSize = descendant.AbsoluteSize
					local YDelta = if p21 > 0 then AbsolutePosition.Y - NewY else Y - (AbsolutePosition.Y + AbsoluteSize.Y)
					
					if (if p21 > 0 then Y + 1 < AbsolutePosition.Y else AbsolutePosition.Y + AbsoluteSize.Y < NewY - 1) and -AbsoluteSize.Y / 2 <= YDelta then
						local Magnitude = math.abs(AbsolutePosition.X + AbsoluteSize.X / 2 - NewX)
						
						if YDelta < v3 - 0.5 or math.abs(YDelta - v3) <= 0.5 and Magnitude < v4 then
							v2 = descendant
							v3 = YDelta
							v4 = Magnitude
						end
					end
				end
			end
			return v2
		end
		
		local function reveal(Frame: Frame)
			-- upvalues: ScrollFrame (copy), Padding (copy), p20 (copy), TypesVector2 (copy)
			local Y = ScrollFrame.AbsolutePosition.Y
			local Y1 = ScrollFrame.AbsoluteWindowSize.Y
			local Y2 = Frame.AbsolutePosition.Y
			local Y3 = Frame.AbsoluteSize.Y
			local CanvasPosition = ScrollFrame.CanvasPosition
			local Largest = math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - Y1)
			local NewSmallest = Y
			local NewY = Y + Y1
			
			if Padding then
				local Largest1 = math.max(0, (Y1 - Y3) / 2)
				local PeekResult = if p20 then p20:peek() else 1
				NewSmallest += math.min(Largest1, Padding.PaddingTop.Offset * PeekResult)
				NewY -= math.min(Largest1, Padding.PaddingBottom.Offset * PeekResult)
			end
			ScrollFrame.CanvasPosition = TypesVector2.new(CanvasPosition.X, (math.clamp(CanvasPosition.Y + (if NewY < Y2 + Y3 then Y2 + Y3 - NewY elseif Y2 < NewSmallest then Y2 - NewSmallest else 0), 0, Largest)))
		end
		
		local OnFrameResult = nil
		Compose.cleanup(function()
			-- upvalues: OnFrameResult (ref)
			local Callback: () -> () = OnFrameResult
			OnFrameResult = nil
			
			if Callback then
				Callback()
			end
		end)
		local v5 = nil
		local OnFrameResult1 = nil
		
		local function untrack()
			-- upvalues: OnFrameResult1 (ref), v5 (ref)
			local Callback: () -> () = OnFrameResult1
			OnFrameResult1 = nil
			v5 = nil
			
			if Callback then
				Callback()
			end
		end
		
		Compose.watch(function(Callback1)
			-- upvalues: FormulaResult (copy), OnFrameResult1 (ref), v5 (ref), TypesVector2 (copy), Frames (copy), p19 (copy), ScrollFrame (copy), reveal (copy)
			if not Callback1(FormulaResult) then
				local Callback: () -> () = OnFrameResult1
				OnFrameResult1 = nil
				v5 = nil
				
				if Callback then
					Callback()
					
					return
				end
			elseif OnFrameResult1 == nil then
				local Zero = TypesVector2.zero
				local Zero1 = TypesVector2.zero
				OnFrameResult1 = Frames.onFrame(function()
					-- upvalues: p19 (upval), Zero (ref), ScrollFrame (upval), Zero1 (ref), v5 (upval), reveal (upval)
					local GetResult = p19.selection.get()
					local IsNotZeroMatch: boolean = Zero ~= ScrollFrame.AbsoluteWindowSize or Zero1 ~= ScrollFrame.AbsoluteCanvasSize
					
					if GetResult and GetResult:IsDescendantOf(ScrollFrame) and (GetResult ~= v5 or IsNotZeroMatch) then
						reveal(GetResult)
					end
					Zero = ScrollFrame.AbsoluteWindowSize
					Zero1 = ScrollFrame.AbsoluteCanvasSize
					v5 = GetResult
				end)
			end
		end)
		Compose.cleanup(untrack)
		local config = { Down = 1, DPadDown = 1, Up = -1, DPadUp = -1 }
		p19.runtime.connect(UserInputService, "InputBegan", function(Input)
			-- upvalues: config (copy), p19 (copy), v5 (ref), FormulaResult (copy), ScrollFrame (copy), OnFrameResult (ref), Frames (copy), nearest (copy), reveal (copy)
			local Entry = if Input.KeyCode then config[Input.KeyCode.Name] else nil
			local GetResult = p19.selection.get()
			
			if Entry == nil or GetResult == nil or GetResult ~= v5 or not FormulaResult:peek() or not GetResult:IsDescendantOf(ScrollFrame) then return end
			local Callback: () -> () = OnFrameResult
			OnFrameResult = nil
			
			if Callback then
				Callback()
			end
			local Count = 0
			OnFrameResult = Frames.onFrame(function()
				-- upvalues: Count (ref), OnFrameResult (upval), p19 (upval), GetResult (copy), FormulaResult (upval), nearest (upval), Entry (copy), reveal (upval)
				Count += 1
				
				if Count < 6 then return end
				local Callback: () -> () = OnFrameResult
				OnFrameResult = nil
				
				if Callback then
					Callback()
				end
				if p19.selection.get() ~= GetResult or GetResult.Parent == nil or not FormulaResult:peek() then return end
				local NearestResult = nearest(GetResult, Entry)
				
				if NearestResult then
					reveal(NearestResult)
					p19.selection.set(NearestResult)
				end
			end)
		end)
		
		return
	end
end

function OverlayPartsModule.back(p21, p22, p23, Callback, p24)
	local P69 = p24 or {}
	local Back = p22.Button({
		Name = "Back",
		icon = "chevron.leading",
		appearance = "utility",
		label = p23 or "Back",
		onActivate = function(_, _)
			-- upvalues: Callback (copy)
			Callback()
		end,
		AnchorPoint = P69.AnchorPoint,
		Position = P69.Position,
		Size = P69.Size,
		LayoutOrder = P69.LayoutOrder,
		Visible = P69.Visible
	})
	local UIListLayout = Back:FindFirstChildWhichIsA("UIListLayout", true)
	
	if UIListLayout then
		p21.runtime.decorate(UIListLayout, {
			HorizontalAlignment = p21.types.Enum.HorizontalAlignment.Left,
			Padding = function(p25)
				-- upvalues: p21 (copy)
				return p21.types.UDim.new(0, p21.metric("space.xs", p25) / 2)
			end
		})
	end
	return Back
end

function OverlayPartsModule.tailSize(p21, p22)
	return p21.metric("space.m", p22)
end

local _ = function(p21, p22)
	local ReadResult = p21.read(p21.config.theme, p22)
	local PanelTail = ReadResult and (ReadResult.chrome and ReadResult.chrome.panelTail)
	
	return if PanelTail and PanelTail.kind == "fill" then PanelTail else nil
end

function OverlayPartsModule.tailWidth(p21, p22)
	-- upvalues: OverlayPartsModule (copy)
	local ReadResult = p21.read(p21.config.theme, p22)
	local PanelTail = ReadResult and (ReadResult.chrome and ReadResult.chrome.panelTail)
	local PanelTail1 = if PanelTail and PanelTail.kind == "fill" then PanelTail else nil
	
	return if PanelTail1 and type(PanelTail1.size) == "table" then PanelTail1.size.w else OverlayPartsModule.tailSize(p21, p22) * 1.4142135623730951
end

function OverlayPartsModule.tailDepth(p21, p22)
	-- upvalues: OverlayPartsModule (copy)
	local ReadResult = p21.read(p21.config.theme, p22)
	local PanelTail = ReadResult and (ReadResult.chrome and ReadResult.chrome.panelTail)
	local PanelTail1 = if PanelTail and PanelTail.kind == "fill" then PanelTail else nil
	
	return if PanelTail1 then PanelTail1.overhang or 0 else OverlayPartsModule.tailWidth(p21, p22) / 2
end

local function outlinePoints(X: number, Y: number, p21: number, p22, p23: number, p24: number, IsNotNone)
	local List = {}
	
	local function _(p25, p26, p27, p28, p29, p30)
		-- upvalues: List (copy)
		table.insert(List, {
			x = p25,
			y = p26,
			inX = p27 or 0,
			inY = p28 or 0,
			outX = p29 or 0,
			outY = p30 or 0
		})
	end
	
	local v2 = p21 * 0.5523
	local v3 = 0
	
	local _ = function(p25, p26, p27, p28, p29, p30, p31)
		-- upvalues: p22 (copy), v3 (ref), List (copy)
		if p22 == p25 then
			v3 = #List + 1
			table.insert(List, {
				inX = 0,
				inY = 0,
				outX = 0,
				outY = 0,
				x = p26,
				y = p27
			})
			table.insert(List, {
				inX = 0,
				inY = 0,
				outX = 0,
				outY = 0,
				x = p28,
				y = p29
			})
			table.insert(List, {
				inX = 0,
				inY = 0,
				outX = 0,
				outY = 0,
				x = p30,
				y = p31
			})
		end
	end
	
	table.insert(List, {
		y = 0,
		inY = 0,
		outX = 0,
		outY = 0,
		x = p21,
		inX = -v2 or 0
	})
	local v4 = p23 - p24
	local Negated = -p24
	local v5 = p23 + p24
	
	if p22 == "bottom" then
		v3 = #List + 1
		table.insert(List, {
			y = 0,
			inX = 0,
			inY = 0,
			outX = 0,
			outY = 0,
			x = v4
		})
		table.insert(List, {
			inX = 0,
			inY = 0,
			outX = 0,
			outY = 0,
			x = p23,
			y = Negated
		})
		table.insert(List, {
			y = 0,
			inX = 0,
			inY = 0,
			outX = 0,
			outY = 0,
			x = v5
		})
	end
	table.insert(List, {
		y = 0,
		inX = 0,
		inY = 0,
		outY = 0,
		x = X - p21,
		outX = v2 or 0
	})
	table.insert(List, {
		inX = 0,
		outX = 0,
		outY = 0,
		x = X,
		y = p21,
		inY = -v2 or 0
	})
	local v6 = p23 - p24
	local NewX = X + p24
	local v7 = p23 + p24
	
	if p22 == "left" then
		v3 = #List + 1
		table.insert(List, {
			inX = 0,
			inY = 0,
			outX = 0,
			outY = 0,
			x = X,
			y = v6
		})
		table.insert(List, {
			inX = 0,
			inY = 0,
			outX = 0,
			outY = 0,
			x = NewX,
			y = p23
		})
		table.insert(List, {
			inX = 0,
			inY = 0,
			outX = 0,
			outY = 0,
			x = X,
			y = v7
		})
	end
	table.insert(List, {
		inX = 0,
		inY = 0,
		outX = 0,
		x = X,
		y = Y - p21,
		outY = v2 or 0
	})
	table.insert(List, {
		inY = 0,
		outX = 0,
		outY = 0,
		x = X - p21,
		y = Y,
		inX = v2 or 0
	})
	local v8 = p23 + p24
	local NewY = Y + p24
	local v9 = p23 - p24
	
	if p22 == "top" then
		v3 = #List + 1
		table.insert(List, {
			inX = 0,
			inY = 0,
			outX = 0,
			outY = 0,
			x = v8,
			y = Y
		})
		table.insert(List, {
			inX = 0,
			inY = 0,
			outX = 0,
			outY = 0,
			x = p23,
			y = NewY
		})
		table.insert(List, {
			inX = 0,
			inY = 0,
			outX = 0,
			outY = 0,
			x = v9,
			y = Y
		})
	end
	table.insert(List, {
		inX = 0,
		inY = 0,
		outY = 0,
		x = p21,
		y = Y,
		outX = -v2 or 0
	})
	table.insert(List, {
		x = 0,
		inX = 0,
		outX = 0,
		outY = 0,
		y = Y - p21,
		inY = v2 or 0
	})
	local v10 = p23 + p24
	local Negated1 = -p24
	local v11 = p23 - p24
	
	if p22 == "right" then
		v3 = #List + 1
		table.insert(List, {
			x = 0,
			inX = 0,
			inY = 0,
			outX = 0,
			outY = 0,
			y = v10
		})
		table.insert(List, {
			inX = 0,
			inY = 0,
			outX = 0,
			outY = 0,
			x = Negated1,
			y = p23
		})
		table.insert(List, {
			x = 0,
			inX = 0,
			inY = 0,
			outX = 0,
			outY = 0,
			y = v11
		})
	end
	table.insert(List, {
		x = 0,
		inX = 0,
		inY = 0,
		outX = 0,
		y = p21,
		outY = -v2 or 0
	})
	
	return if IsNotNone then if v3 > 0 then { List[v3], List[v3 + 1], List[v3 + 2] } else {} else List
end

OverlayPartsModule.outlinePoints = outlinePoints

function OverlayPartsModule.tail(p21, Name, Callback, Callback2, Callback1, p22)
	-- upvalues: OverlayPartsModule (copy), NativeDecorationModule (copy), outlinePoints (copy)
	local Compose = p21.Compose
	local Host = p21.Host
	local TypesUDim2 = p21.types.UDim2
	local TypesVector2 = p21.types.Vector2
	local AnchorPointResult = p21.observe.AnchorPoint(p22.node)
	
	local function _(p23)
		-- upvalues: p22 (copy), p21 (copy)
		if p22.role == "floating" then
			local ReadResult = p21.read(p21.config.theme, p23)
			local PanelTail = ReadResult and (ReadResult.chrome and ReadResult.chrome.panelTail)
			
			return if PanelTail and PanelTail.kind == "fill" then PanelTail else nil
		else
			return nil
		end
	end
	
	local _ = function(p23): boolean
		-- upvalues: p21 (copy), p22 (copy)
		local ReadResult = p21.read(p21.config.theme, p23)
		local Panel = ReadResult and (ReadResult.chrome and ReadResult.chrome.panel)
		
		return p22.role == "floating" and (Panel ~= nil and (Panel.kind ~= "native" and Panel.kind ~= "none"))
	end
	
	local function geometry(Callback1)
		-- upvalues: p22 (copy), Callback (copy), p21 (copy), OverlayPartsModule (upval), TypesVector2 (copy)
		local CallbackResult = Callback1(p22.size)
		local CallbackResult1, CallbackResult2 = Callback(Callback1)
		local Smallest = math.min(p22.radius(Callback1), CallbackResult.X / 2, CallbackResult.Y / 2)
		local PanelTail1 = nil
		
		if p22.role == "floating" then
			local ReadResult = p21.read(p21.config.theme, Callback1)
			local PanelTail = ReadResult and (ReadResult.chrome and ReadResult.chrome.panelTail)
			PanelTail1 = if PanelTail and PanelTail.kind == "fill" then PanelTail else nil
		else
			PanelTail1 = nil
		end
		local v2 = (if PanelTail1 then OverlayPartsModule.tailWidth(p21, Callback1) else OverlayPartsModule.tailSize(p21, Callback1) * 1.4142135623730951) / 2
		
		if CallbackResult1 == nil then
			return nil, CallbackResult2, Smallest, v2, 0
		end
		local CornerResult = p22.corner(Callback1)
		local IsLeft: boolean = CallbackResult2 == "left" or CallbackResult2 == "right"
		local Y = if IsLeft then CallbackResult.Y else CallbackResult.X
		local YDelta = if IsLeft then CallbackResult1.Y - CornerResult.Y else CallbackResult1.X - CornerResult.X
		local PanelTail2 = nil
		
		if p22.role == "floating" then
			local ReadResult = p21.read(p21.config.theme, Callback1)
			local PanelTail = ReadResult and (ReadResult.chrome and ReadResult.chrome.panelTail)
			PanelTail2 = if PanelTail and PanelTail.kind == "fill" then PanelTail else nil
		else
			PanelTail2 = nil
		end
		local Largest: number = if PanelTail2 then math.max(Smallest, PanelTail2.margin or 0) else Smallest
		local Smallest1 = math.min(v2, (math.max(0, Y / 2 - Largest)))
		local NewLargest: number = if PanelTail2 then Largest + Smallest1 else Smallest + Smallest1 + math.min(Smallest1, (math.max(0, Y / 2 - Smallest - Smallest1)))
		local ClampedValue = math.clamp(YDelta, NewLargest, (math.max(NewLargest, Y - NewLargest)))
		
		return if IsLeft then TypesVector2.new(CallbackResult1.X, CornerResult.Y + ClampedValue) else TypesVector2.new(CornerResult.X + ClampedValue, CallbackResult1.Y), CallbackResult2, Smallest, Smallest1, ClampedValue
	end
	
	local function rotation(p23): number
		-- upvalues: geometry (copy), p22 (copy), p21 (copy)
		local _, GeometryResult2 = geometry(p23)
		local PanelTail1 = nil
		
		if p22.role == "floating" then
			local ReadResult = p21.read(p21.config.theme, p23)
			local PanelTail = ReadResult and (ReadResult.chrome and ReadResult.chrome.panelTail)
			PanelTail1 = if PanelTail and PanelTail.kind == "fill" then PanelTail else nil
		else
			PanelTail1 = nil
		end
		return if PanelTail1 then if GeometryResult2 == "bottom" then 0 elseif GeometryResult2 == "left" then 90 elseif GeometryResult2 == "top" then 180 else -90 else 45
	end
	
	local Tail = p21.styled(p21.fade({
		BorderSizePixel = 0,
		Name = Name,
		Size = function(p23)
			-- upvalues: geometry (copy), p22 (copy), p21 (copy), TypesUDim2 (copy)
			local GeometryResult, _, _, GeometryResult4 = geometry(p23)
			local PanelTail1 = nil
			
			if p22.role == "floating" then
				local ReadResult = p21.read(p21.config.theme, p23)
				local PanelTail = ReadResult and (ReadResult.chrome and ReadResult.chrome.panelTail)
				PanelTail1 = if PanelTail and PanelTail.kind == "fill" then PanelTail else nil
			else
				PanelTail1 = nil
			end
			if PanelTail1 and type(PanelTail1.size) == "table" then
				local ScaleResult = if GeometryResult and GeometryResult4 > 0 then p22.scale(p23) else 0
				
				return TypesUDim2.fromOffset(GeometryResult4 * 2 * ScaleResult, PanelTail1.size.h * ScaleResult)
			else
				local ScaledGeometryResult = if GeometryResult then GeometryResult4 * 1.4142135623730951 * p22.scale(p23) else 0
				
				return TypesUDim2.fromOffset(ScaledGeometryResult, ScaledGeometryResult)
			end
		end,
		AnchorPoint = TypesVector2.new(0.5, 0.5),
		Rotation = rotation,
		ZIndex = function(p23): number
			-- upvalues: Callback1 (copy)
			return Callback1(p23) - 1
		end,
		BackgroundTransparency = function(p23): number
			-- upvalues: p22 (copy), p21 (copy)
			local PanelTail1 = nil
			if p22.role == "floating" then
				local ReadResult = p21.read(p21.config.theme, p23)
				local PanelTail = ReadResult and (ReadResult.chrome and ReadResult.chrome.panelTail)
				PanelTail1 = if PanelTail and PanelTail.kind == "fill" then PanelTail else nil
			else
				PanelTail1 = nil
			end
			return if PanelTail1 then 1 else 0
		end,
		Position = function(Callback)
			-- upvalues: geometry (copy), TypesVector2 (copy), p22 (copy), p21 (copy), AnchorPointResult (copy), TypesUDim2 (copy)
			local GeometryResult, GeometryResult2 = geometry(Callback)
			
			if not GeometryResult then
				GeometryResult = TypesVector2.zero
			end
			local PanelTail1 = nil
			if p22.role == "floating" then
				local ReadResult = p21.read(p21.config.theme, Callback)
				local PanelTail = ReadResult and (ReadResult.chrome and ReadResult.chrome.panelTail)
				PanelTail1 = if PanelTail and PanelTail.kind == "fill" then PanelTail else nil
			else
				PanelTail1 = nil
			end
			if PanelTail1 and type(PanelTail1.size) == "table" then
				local HDelta = PanelTail1.size.h / 2 - (PanelTail1.overhang or 0)
				GeometryResult += if GeometryResult2 == "bottom" then TypesVector2.new(0, HDelta) elseif GeometryResult2 == "left" then TypesVector2.new(-HDelta, 0) elseif GeometryResult2 == "top" then TypesVector2.new(0, -HDelta) else TypesVector2.new(HDelta, 0)
			end
			local CornerResult = p22.corner(Callback)
			local CallbackResult = Callback(p22.size)
			local CallbackResult1 = Callback(AnchorPointResult)
			local NewCornerResult = CornerResult + TypesVector2.new(CallbackResult.X * CallbackResult1.X, CallbackResult.Y * CallbackResult1.Y)
			local NewNewCornerResult = NewCornerResult + (GeometryResult - NewCornerResult) * p22.scale(Callback)
			
			return TypesUDim2.fromOffset(NewNewCornerResult.X, NewNewCornerResult.Y)
		end,
		GroupTransparency = function(p23): number
			-- upvalues: Callback2 (copy)
			return 1 - Callback2(p23)
		end
	}), "tail")
	p21.styled(Tail, "tail-" .. p22.role)
	
	if p22.role == "floating" then
		local VisibleResult = p21.observe.Visible(Tail)
		p21.runtime.mountFragment(function()
			-- upvalues: Compose (copy), p22 (copy), p21 (copy), Name (copy), TypesVector2 (copy), geometry (copy), VisibleResult (copy), TypesUDim2 (copy), rotation (copy), Callback2 (copy), Host (copy), NativeDecorationModule (upval)
			return {
				Compose.show(function(p23): boolean
					-- upvalues: p22 (upval), p21 (upval)
					local PanelTail1 = nil
					if p22.role == "floating" then
						local ReadResult = p21.read(p21.config.theme, p23)
						local PanelTail = ReadResult and (ReadResult.chrome and ReadResult.chrome.panelTail)
						PanelTail1 = if PanelTail and PanelTail.kind == "fill" then PanelTail else nil
					else
						PanelTail1 = nil
					end
					return PanelTail1 ~= nil
				end, function()
					-- upvalues: p21 (upval), Name (upval), TypesVector2 (upval), geometry (upval), VisibleResult (upval), p22 (upval), TypesUDim2 (upval), rotation (upval), Callback2 (upval), Host (upval), NativeDecorationModule (upval), Compose (upval)
					local FadeResult = p21.fade({
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						ZIndex = 0,
						Name = Name .. "Artwork",
						AnchorPoint = TypesVector2.new(0.5, 0.5),
						Visible = function(Callback): boolean
							-- upvalues: geometry (upval), VisibleResult (upval)
							local GeometryResult, _, _, GeometryResult4 = geometry(Callback)
							
							return Callback(VisibleResult) and (GeometryResult ~= nil and GeometryResult4 > 0)
						end,
						Size = function(p23)
							-- upvalues: geometry (upval), p22 (upval), p21 (upval), TypesUDim2 (upval)
							local _, _, _, GeometryResult4 = geometry(p23)
							local PanelTail1 = nil
							
							if p22.role == "floating" then
								local ReadResult = p21.read(p21.config.theme, p23)
								local PanelTail = ReadResult and (ReadResult.chrome and ReadResult.chrome.panelTail)
								PanelTail1 = if PanelTail and PanelTail.kind == "fill" then PanelTail else nil
							else
								PanelTail1 = nil
							end
							return if PanelTail1 and type(PanelTail1.size) == "table" then TypesUDim2.fromOffset(GeometryResult4 * 2, PanelTail1.size.h) else TypesUDim2.fromOffset(0, 0)
						end,
						Position = function(Callback)
							-- upvalues: geometry (upval), p22 (upval), p21 (upval), TypesUDim2 (upval)
							local _, GeometryResult2, _, _, GeometryResult5 = geometry(Callback)
							local PanelTail1 = nil
							
							if p22.role == "floating" then
								local ReadResult = p21.read(p21.config.theme, Callback)
								local PanelTail = ReadResult and (ReadResult.chrome and ReadResult.chrome.panelTail)
								PanelTail1 = if PanelTail and PanelTail.kind == "fill" then PanelTail else nil
							else
								PanelTail1 = nil
							end
							local CallbackResult = Callback(p22.size)
							local HDelta = if PanelTail1 and type(PanelTail1.size) == "table" then PanelTail1.size.h / 2 - (PanelTail1.overhang or 0) else 0
							
							return if GeometryResult2 == "bottom" then TypesUDim2.fromOffset(GeometryResult5, HDelta) elseif GeometryResult2 == "top" then TypesUDim2.fromOffset(GeometryResult5, CallbackResult.Y - HDelta) elseif GeometryResult2 == "left" then TypesUDim2.fromOffset(CallbackResult.X - HDelta, GeometryResult5) else TypesUDim2.fromOffset(HDelta, GeometryResult5)
						end,
						Rotation = rotation,
						GroupTransparency = function(p23): number
							-- upvalues: Callback2 (upval)
							return 1 - Callback2(p23)
						end
					})
					p21.skin(FadeResult, "panelTail")
					local NativeDecorationModuleResult = NativeDecorationModule(Compose, p21.runtime, p21.types, p22.node, (Host.Frame(Name .. "Chrome")({
						Size = TypesUDim2.fromScale(1, 1),
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						ZIndex = 0,
						FadeResult
					})))
					NativeDecorationModuleResult:AddTag("facet-independent-fade")
					
					return NativeDecorationModuleResult
				end)
			}
		end, p22.node)
	end
	p22.node:AddTag("facet-outlined")
	local Outline = p21.styled(Host.Path2D("Outline")({
		Closed = function(p23): boolean
			-- upvalues: p21 (copy), p22 (copy)
			local ReadResult = p21.read(p21.config.theme, p23)
			local Panel = ReadResult and (ReadResult.chrome and ReadResult.chrome.panel)
			
			return not (p22.role == "floating" and (Panel ~= nil and (Panel.kind ~= "native" and Panel.kind ~= "none")))
		end,
		Visible = function(p23): boolean
			-- upvalues: p21 (copy), p22 (copy)
			local ReadResult = p21.read(p21.config.theme, p23)
			local Panel = ReadResult and (ReadResult.chrome and ReadResult.chrome.panel)
			local IsNotNone: boolean = p22.role == "floating" and (Panel ~= nil and (Panel.kind ~= "native" and Panel.kind ~= "none"))
			
			if IsNotNone then
				local PanelTail1 = nil
				if p22.role == "floating" then
					local ReadResult1 = p21.read(p21.config.theme, p23)
					local PanelTail = ReadResult1 and (ReadResult1.chrome and ReadResult1.chrome.panelTail)
					PanelTail1 = if PanelTail and PanelTail.kind == "fill" then PanelTail else nil
				else
					PanelTail1 = nil
				end
				IsNotNone = PanelTail1 ~= nil
			end
			return not IsNotNone
		end,
		ZIndex = Callback1
	}), "outline")
	p21.styled(Outline, "outline-" .. p22.role)
	Compose.watch(function(Callback)
		-- upvalues: p22 (copy), geometry (copy), outlinePoints (upval), p21 (copy), TypesUDim2 (copy), Outline (copy)
		local CallbackResult = Callback(p22.size)
		
		if CallbackResult.X <= 0 or CallbackResult.Y <= 0 then return end
		local GeometryResult, GeometryResult2, GeometryResult3, GeometryResult4, GeometryResult5 = geometry(Callback)
		local List = {}
		local X = CallbackResult.X
		local Y = CallbackResult.Y
		local v2 = nil
		repeat
			if GeometryResult then
				local PanelTail1 = nil
				if p22.role == "floating" then
					local ReadResult = p21.read(p21.config.theme, Callback)
					local PanelTail = ReadResult and (ReadResult.chrome and ReadResult.chrome.panelTail)
					PanelTail1 = if PanelTail and PanelTail.kind == "fill" then PanelTail else nil
				else
					PanelTail1 = nil
				end
				if not PanelTail1 then
					v2 = GeometryResult2
					break
				end
			end
			v2 = nil
		until true
		local ReadResult = p21.read(p21.config.theme, Callback)
		local Panel = ReadResult and (ReadResult.chrome and ReadResult.chrome.panel)
		local IsNotNone: boolean = p22.role == "floating" and (Panel ~= nil and (Panel.kind ~= "native" and Panel.kind ~= "none"))
		for _, value in outlinePoints(X, Y, GeometryResult3, v2, GeometryResult5, GeometryResult4, IsNotNone) do
			table.insert(List, p21.types.Path2DControlPoint.new(TypesUDim2.fromScale(value.x / CallbackResult.X, value.y / CallbackResult.Y), TypesUDim2.fromScale(value.inX / CallbackResult.X, value.inY / CallbackResult.Y), TypesUDim2.fromScale(value.outX / CallbackResult.X, value.outY / CallbackResult.Y)))
		end
		Outline:SetControlPoints(List)
	end)
	
	local _ = function(p23): number
		-- upvalues: OverlayPartsModule (upval), p21 (copy)
		return (math.ceil(OverlayPartsModule.tailSize(p21, p23) * 1.4142135623730951))
	end
	
	return {
		Tail,
		(p21.fade({
			Name = "OutlineFade",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = Callback1,
			Position = function(p23)
				-- upvalues: p22 (copy), OverlayPartsModule (upval), p21 (copy), TypesUDim2 (copy)
				local CornerResult = p22.corner(p23)
				local Ceiled = math.ceil(OverlayPartsModule.tailSize(p21, p23) * 1.4142135623730951)
				
				return TypesUDim2.fromOffset(CornerResult.X - Ceiled, CornerResult.Y - Ceiled)
			end,
			Size = function(Callback)
				-- upvalues: p22 (copy), OverlayPartsModule (upval), p21 (copy), TypesUDim2 (copy)
				local CallbackResult = Callback(p22.size)
				local Ceiled = math.ceil(OverlayPartsModule.tailSize(p21, Callback) * 1.4142135623730951)
				
				return TypesUDim2.fromOffset(CallbackResult.X + Ceiled * 2, CallbackResult.Y + Ceiled * 2)
			end,
			GroupTransparency = function(p23): number
				-- upvalues: Callback2 (copy)
				return 1 - Callback2(p23)
			end,
			(Host.Frame("OutlineBoundary")({
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = Callback1,
				AnchorPoint = AnchorPointResult,
				Position = function(Callback)
					-- upvalues: p22 (copy), AnchorPointResult (copy), OverlayPartsModule (upval), p21 (copy), TypesUDim2 (copy)
					local CallbackResult = Callback(p22.size)
					local CallbackResult1 = Callback(AnchorPointResult)
					local Ceiled = math.ceil(OverlayPartsModule.tailSize(p21, Callback) * 1.4142135623730951)
					
					return TypesUDim2.fromOffset(Ceiled + CallbackResult.X * CallbackResult1.X, Ceiled + CallbackResult.Y * CallbackResult1.Y)
				end,
				Size = function(Callback)
					-- upvalues: p22 (copy), TypesUDim2 (copy)
					local ScaledCallbackResult = Callback(p22.size) * p22.scale(Callback)
					
					return TypesUDim2.fromOffset(ScaledCallbackResult.X, ScaledCallbackResult.Y)
				end,
				Outline
			}))
		}))
	}
end

OverlayPartsModule.scroller = MeasuredScrollModule

return OverlayPartsModule