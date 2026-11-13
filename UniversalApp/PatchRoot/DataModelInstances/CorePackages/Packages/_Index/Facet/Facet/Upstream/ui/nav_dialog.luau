local _ = require("./control_types")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("./overlay_types")
local CoreModule = require("../vendor/compose/core")
local OverlayPartsModule = require("./overlay_parts")
local _ = require("./freeze")
local _ = require("./overlay_props")
local KeyboardInsetModule = require("./keyboard_inset")
local VisualTargetModule = require("./visual_target")
local AdaptiveModule = require("./adaptive")
local list = {
	"isPresented", "onPresentedChange", "onDismiss", "title", "content", "hero",
	"actionLabel", "actions", "actionLayout", "closeButton", "width",
	"presentation", "bodyHeight", "contentSelectable"
}

return function(p1, p2, p3)
	-- upvalues: OverlayPartsModule (copy), list (copy), VisualTargetModule (copy), CoreModule (copy), KeyboardInsetModule (copy), AdaptiveModule (copy)
	local ReadFunction1 = p1.read
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	
	local function _(Text: string): boolean
		return type(Text) ~= "string" or string.match(Text, "%S") == nil
	end
	
	p2.Dialog = p1.construct("Dialog", function(p4)
		-- upvalues: OverlayPartsModule (upval), p1 (copy), Compose (copy), Host (copy), list (upval), TypesUDim2 (copy), VisualTargetModule (upval), ReadFunction (copy), p3 (copy), CoreModule (upval), p2 (copy), KeyboardInsetModule (upval), AdaptiveModule (upval), ReadFunction1 (copy), TypesEnum (copy), TypesVector2 (copy), Runtime (copy)
		if p4.isPresented == nil then
			error("Facet UI.Dialog: isPresented is required; it is the caller's boolean fact", 0)
		end
		for _, value in { "onPresentedChange", "onDismiss" } do
			local Callback = p4[value]
			
			if Callback ~= nil and type(Callback) ~= "function" then
				error(`Facet UI.Dialog: {value} must be a function`, 0)
			end
		end
		if p4.closeButton ~= nil and type(p4.closeButton) ~= "boolean" then
			error("Facet UI.Dialog: closeButton must be true or false", 0)
		end
		local NoActions = if p4.closeButton == nil then p4.actions == nil or #p4.actions == 0 else p4.closeButton
		
		if NoActions and p4.onPresentedChange == nil then
			error("Facet UI.Dialog: the close button proposes a close and needs onPresentedChange. Without it, set closeButton = false. The backdrop and Cancel then do nothing.", 0)
		end
		OverlayPartsModule.checkPreset(p1, "UI.Dialog", "width", p4.width, OverlayPartsModule.WIDTH_PRESETS)
		OverlayPartsModule.checkPreset(p1, "UI.Dialog", "presentation", p4.presentation, { "automatic", "inset" })
		
		local function _(p5): number
			-- upvalues: p1 (upval), p4 (copy)
			local ReadResult: number = p1.read(p4.bodyHeight, p5)
			assert(p4.bodyHeight == nil or (ReadResult == "fill" or type(ReadResult) == "number" and (ReadResult == ReadResult and ReadResult >= 0) and ReadResult < 1e999), "Facet UI.Dialog: bodyHeight must be fill or a finite nonnegative logical height")
			
			return ReadResult
		end
		
		local ReadResult: number = p1.read(p4.bodyHeight, nil)
		assert(p4.bodyHeight == nil or (ReadResult == "fill" or type(ReadResult) == "number" and (ReadResult == ReadResult and ReadResult >= 0) and ReadResult < 1e999), "Facet UI.Dialog: bodyHeight must be fill or a finite nonnegative logical height")
		OverlayPartsModule.checkPreset(p1, "UI.Dialog", "actionLayout", p4.actionLayout, OverlayPartsModule.ACTION_LAYOUTS)
		
		if p4.contentSelectable ~= nil and type(p4.contentSelectable) ~= "boolean" then
			error("Facet UI.Dialog: contentSelectable must be true or false", 0)
		end
		if p4.content ~= nil and type(p4.content) ~= "function" then
			error("Facet UI.Dialog: content must be a factory that returns the body", 0)
		end
		for _, value2 in { "title", "actionLabel" } do
			local v1 = p4[value2]
			
			if v1 ~= nil and not OverlayPartsModule.bound(p1, v1, "string") then
				error(`Facet UI.Dialog: {value2} must be a string or a bound string`, 0)
			end
		end
		OverlayPartsModule.checkMedia("UI.Dialog", p4.hero)
		local Actions = p4.actions or {}
		OverlayPartsModule.checkActions(p1, "UI.Dialog", p4.actions, 1e999, nil, true)
		local v2 = nil
		
		for _, value1 in Actions do
			if value1.role == "cancel" then
				v2 = value1
			end
		end
		local _ = function(Text: string): boolean
			return Text ~= nil and not (type(Text) == "string" and (type(Text) ~= "string" or string.match(Text, "%S") == nil))
		end
		
		local Title: string = p4.title
		
		if Title == nil or type(Title) == "string" and (type(Title) ~= "string" or string.match(Title, "%S") == nil) then
			local ActionLabel: string = p4.actionLabel
			
			if (ActionLabel == nil or type(ActionLabel) == "string" and (type(ActionLabel) ~= "string" or string.match(ActionLabel, "%S") == nil)) and (p4.hero == nil and p4.content == nil and #Actions == 0) then
				error("Facet UI.Dialog: nothing to show. Supply a title, content, hero, actionLabel or actions", 0)
			end
		end
		local v3 = assert(Compose.currentOwner())
		local FrameResult = Host.Frame(p1.props(p4, list, {
			Name = "Dialog",
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromOffset(0, 0)
		}))
		VisualTargetModule.create(Compose, FrameResult)
		
		local _ = function(): boolean
			-- upvalues: ReadFunction (upval), p4 (copy)
			return ReadFunction(p4.isPresented) == true
		end
		
		local v4 = nil
		
		local _ = function(p5)
			-- upvalues: p4 (copy)
			if p4.onDismiss then
				p4.onDismiss(p5)
			end
		end
		
		local _ = function(p5, p6): boolean
			-- upvalues: p4 (copy), v4 (ref), OverlayPartsModule (upval), ReadFunction (upval)
			local OnPresentedChange = p4.onPresentedChange
			
			if OnPresentedChange == nil then
				return false
			end
			if not p5 then
				v4 = p6
			end
			local v5 = false
			OverlayPartsModule.call(OnPresentedChange, function()
				-- upvalues: v5 (ref), ReadFunction (upval), p4 (upval), p5 (copy), v4 (upval)
				v5 = ReadFunction(p4.isPresented) == true == p5
				
				if not v5 then
					v4 = nil
				end
			end, p5)
			
			return v5
		end
		
		local function press(p5)
			-- upvalues: OverlayPartsModule (upval), p1 (upval), v4 (ref), ReadFunction (upval), p4 (copy)
			if not OverlayPartsModule.usable(p1, p5) then return end
			v4 = "action"
			OverlayPartsModule.call(p5.onActivate, function()
				-- upvalues: ReadFunction (upval), p4 (upval), v4 (upval)
				if ReadFunction(p4.isPresented) == true then
					v4 = nil
				end
			end)
			
			if ReadFunction(p4.isPresented) == true and not p5.keepOpen then
				local OnPresentedChange = p4.onPresentedChange
				
				if OnPresentedChange == nil then return end
				v4 = "action"
				local v5 = false
				local v6 = false
				OverlayPartsModule.call(OnPresentedChange, function()
					-- upvalues: v5 (ref), ReadFunction (upval), p4 (upval), v6 (copy), v4 (upval)
					v5 = ReadFunction(p4.isPresented) == true == v6
					
					if not v5 then
						v4 = nil
					end
				end, false)
			end
		end
		
		local _ = function()
			-- upvalues: v2 (ref), OverlayPartsModule (upval), p1 (upval), press (copy), p4 (copy), v4 (ref), ReadFunction (upval)
			if v2 and OverlayPartsModule.usable(p1, v2) then
				press(v2)
				
				return
			end
			local OnPresentedChange = p4.onPresentedChange
			
			if OnPresentedChange ~= nil then
				v4 = "cancel"
				local v5 = false
				local v6 = false
				OverlayPartsModule.call(OnPresentedChange, function()
					-- upvalues: v5 (ref), ReadFunction (upval), p4 (upval), v6 (copy), v4 (upval)
					v5 = ReadFunction(p4.isPresented) == true == v6
					
					if not v5 then
						v4 = nil
					end
				end, false)
				
				return
			end
		end
		
		local UserInputService = p3.service("UserInputService")
		local v5 = nil
		p3.attach(FrameResult, {
			p3.overlay(FrameResult, function(p5): boolean
				-- upvalues: ReadFunction (upval), p4 (copy)
				return ReadFunction(p4.isPresented, p5) == true
			end, function(p5)
				-- upvalues: v5 (ref), p3 (upval), FrameResult (copy), CoreModule (upval), v3 (copy), Compose (upval), p1 (upval), p4 (copy), p2 (upval), KeyboardInsetModule (upval), UserInputService (copy), AdaptiveModule (upval), OverlayPartsModule (upval), ReadFunction1 (upval), TypesUDim2 (upval), TypesEnum (upval), NoActions (copy), Host (upval), v4 (ref), ReadFunction (upval), Actions (copy), press (copy), TypesVector2 (upval), Runtime (upval), VisualTargetModule (upval), v2 (ref)
				local WithOwnerResult = v5
				local Layer = assert(p3.parent(FrameResult))
				
				if WithOwnerResult and WithOwnerResult.layer ~= Layer then
					CoreModule.owner.dispose(WithOwnerResult.owner)
					v5 = nil
					WithOwnerResult = nil
				end
				if WithOwnerResult == nil then
					local Child = CoreModule.owner.createChild(v3)
					WithOwnerResult = Compose.withOwner(Child, function()
						-- upvalues: p1 (upval), Layer (copy), p4 (upval), p2 (upval), Compose (upval), KeyboardInsetModule (upval), UserInputService (upval), AdaptiveModule (upval), OverlayPartsModule (upval), p3 (upval), ReadFunction1 (upval), TypesUDim2 (upval), TypesEnum (upval), NoActions (upval), Host (upval), v4 (upval), ReadFunction (upval), Actions (upval), press (upval), TypesVector2 (upval), Runtime (upval), Child (copy)
						local LayoutUnitResult = p1.layoutUnit(Layer)
						local LayoutSizeResult = p1.layoutSize(Layer, LayoutUnitResult)
						local CellResult = if p4.bodyHeight == nil then Compose.cell(1) else p2.environment(Layer).metricScale
						
						local function _(p6): boolean
							-- upvalues: p1 (upval), p4 (upval)
							local ReadResult = p1.read(p4.presentation, p6) or "automatic"
							assert(ReadResult == "automatic" or ReadResult == "inset", "Facet UI.Dialog: invalid presentation")
							
							return ReadResult == "inset"
						end
						
						local Er = KeyboardInsetModule.reader(p1, UserInputService)
						
						local _ = function(Callback)
							-- upvalues: Er (copy), LayoutUnitResult (copy)
							return Er(Callback) / Callback(LayoutUnitResult)
						end
						
						local _ = function(p6)
							-- upvalues: p1 (upval)
							return p1.metric("space.m", p6)
						end
						
						local function widthPx(Callback): number
							-- upvalues: p1 (upval), p4 (upval), AdaptiveModule (upval), LayoutSizeResult (copy), CellResult (copy), OverlayPartsModule (upval)
							local ReadResult = p1.read(p4.width, Callback) or "automatic"
							
							if p4.bodyHeight ~= nil and ReadResult == "automatic" and AdaptiveModule.sizeClass(Callback(LayoutSizeResult).X / Callback(CellResult)) == "wide" then
								ReadResult = "wide"
							end
							return (math.max(0, (math.min(OverlayPartsModule.width(p1, ReadResult, Callback), Callback(LayoutSizeResult).X - p1.metric("space.m", Callback) * 2))))
						end
						
						local CellResult1 = Compose.cell(false)
						
						local _ = function(Callback): number
							-- upvalues: LayoutSizeResult (copy), Er (copy), LayoutUnitResult (copy)
							return (math.max(0, Callback(LayoutSizeResult).Y - Er(Callback) / Callback(LayoutUnitResult)))
						end
						
						local function panelInset(p6, p7)
							-- upvalues: p3 (upval)
							return p3.inset(16, p6, "panel", p7)
						end
						
						local function padded(p6)
							-- upvalues: p3 (upval)
							return p3.inset(16, "top", "panel", p6) + p3.inset(16, "bottom", "panel", p6)
						end
						
						local function roomPx(Callback): number
							-- upvalues: p1 (upval), p4 (upval), CellResult1 (copy), LayoutSizeResult (copy), Er (copy), LayoutUnitResult (copy), p3 (upval)
							local ReadResult = p1.read(p4.presentation, Callback) or "automatic"
							assert(ReadResult == "automatic" or ReadResult == "inset", "Facet UI.Dialog: invalid presentation")
							
							return if ReadResult == "inset" or p4.bodyHeight ~= nil and not Callback(CellResult1) then math.max(0, math.max(0, Callback(LayoutSizeResult).Y - Er(Callback) / Callback(LayoutUnitResult)) - (p3.inset(16, "top", "panel", Callback) + p3.inset(16, "bottom", "panel", Callback)) - p1.metric("space.m", Callback) * 2) else math.max(math.min(p1.metric("targetSizes.minimum", Callback), (math.max(0, math.max(0, Callback(LayoutSizeResult).Y - Er(Callback) / Callback(LayoutUnitResult)) - 32))), math.max(0, Callback(LayoutSizeResult).Y - Er(Callback) / Callback(LayoutUnitResult)) - (if Callback(CellResult1) then p3.inset(16, "top", "panel", Callback) + p3.inset(16, "bottom", "panel", Callback) else p1.metric("space.m", Callback) * 4))
						end
						
						local List = {}
						
						if p4.hero then
							table.insert(List, OverlayPartsModule.media(p1, p4.hero, "Hero"))
						end
						local List1 = {}
						local CellResult2 = Compose.cell(false)
						
						if p4.title ~= nil then
							local Title = p4.title
							local Title1 = p1.text({
								Name = "Title",
								Text = function(p6)
									-- upvalues: ReadFunction1 (upval), Title (copy)
									return ReadFunction1(Title, p6) or ""
								end,
								TextWrapped = true,
								Size = TypesUDim2.new(1, 0, 0, 0),
								AutomaticSize = TypesEnum.AutomaticSize.Y,
								Visible = function(Callback): boolean
									-- upvalues: ReadFunction1 (upval), Title (copy), CellResult2 (copy)
									local ReadResult: string = ReadFunction1(Title, Callback)
									
									return not (type(ReadResult) ~= "string" or string.match(ReadResult, "%S") == nil) and not Callback(CellResult2)
								end,
								if NoActions then Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill }) else nil
							})
							p1.textRole(Title1, "heading")
							table.insert(List1, Title1)
						end
						if NoActions then
							table.insert(List1, p2.Button("Close")({
								name = "Close",
								icon = "close",
								Size = OverlayPartsModule.closeTarget(p1),
								AutomaticSize = TypesEnum.AutomaticSize.None,
								onActivate = function()
									-- upvalues: p4 (upval), v4 (upval), OverlayPartsModule (upval), ReadFunction (upval)
									local OnPresentedChange = p4.onPresentedChange
									
									if OnPresentedChange ~= nil then
										v4 = "close"
										local v6 = false
										local v7 = false
										OverlayPartsModule.call(OnPresentedChange, function()
											-- upvalues: v6 (ref), ReadFunction (upval), p4 (upval), v7 (copy), v4 (upval)
											v6 = ReadFunction(p4.isPresented) == true == v7
											
											if not v6 then
												v4 = nil
											end
										end, false)
										
										return
									end
								end
							}))
						end
						if #List1 > 0 then
							local RowResult = p1.row(List1, {
								Name = "Header",
								Size = TypesUDim2.new(1, 0, 0, 0),
								AutomaticSize = TypesEnum.AutomaticSize.Y
							})
							local UIListLayout = RowResult:FindFirstChildWhichIsA("UIListLayout")
							
							if UIListLayout then
								UIListLayout.VerticalAlignment = TypesEnum.VerticalAlignment.Center
							end
							table.insert(List, RowResult)
						end
						local ScrollFrame = nil
						local v6 = nil
						
						if p4.content then
							local v7 = nil
							local v8 = nil
							if p4.bodyHeight == nil then
								v8, v76 = OverlayPartsModule.scroller(p1, {
									Name = "Body",
									BackgroundTransparency = 1,
									BorderSizePixel = 0,
									ScrollBarThickness = 4,
									Selectable = false,
									ScrollingDirection = TypesEnum.ScrollingDirection.Y
								}, {
									Host.UIListLayout({ SortOrder = TypesEnum.SortOrder.LayoutOrder }),
									p4.content()
								}, { name = "Content" })
							else
								v7 = Host.Frame("Content")({
									BackgroundTransparency = 1,
									Size = TypesUDim2.fromScale(1, 1),
									p4.content()
								})
								v8 = Host.ScrollingFrame("Body")({
									BackgroundTransparency = 1,
									BorderSizePixel = 0,
									CanvasSize = TypesUDim2.fromOffset(0, 0),
									ScrollBarThickness = 0,
									Selectable = false,
									v7
								})
							end
							v6 = v7
							ScrollFrame = v8
							table.insert(List, assert(ScrollFrame))
						end
						if p4.actionLabel ~= nil then
							local ActionLabel = p4.actionLabel
							table.insert(List, p1.styled(p1.text({
								Name = "ActionLabel",
								TextWrapped = true,
								Text = function(p6)
									-- upvalues: ReadFunction1 (upval), ActionLabel (copy)
									return ReadFunction1(ActionLabel, p6) or ""
								end,
								Size = TypesUDim2.new(1, 0, 0, 0),
								AutomaticSize = TypesEnum.AutomaticSize.Y,
								Visible = function(p6): boolean
									-- upvalues: ReadFunction1 (upval), ActionLabel (copy)
									local ReadResult: string = ReadFunction1(ActionLabel, p6)
									
									return not (type(ReadResult) ~= "string" or string.match(ReadResult, "%S") == nil)
								end
							}), "secondary"))
						end
						if #Actions > 0 then
							table.insert(List, assert((OverlayPartsModule.actions(p1, p2, Actions, p4.actionLayout, function(p6)
								-- upvalues: widthPx (copy), p1 (upval)
								return widthPx(p6) - p1.metric("space.m", p6) * 2
							end, press))).frame)
						end
						local LayoutSizeResult1 = if v6 and p4.bodyHeight == nil then p1.layoutSize(v6, LayoutUnitResult) else Compose.cell(TypesVector2.zero)
						
						local function horizontalInset(Callback, p6)
							-- upvalues: p3 (upval), CellResult1 (copy), LayoutSizeResult (copy), widthPx (copy), p1 (upval)
							local Largest: number = if Callback(CellResult1) then math.max(0, Callback(LayoutSizeResult).X - widthPx(Callback)) else 0
							local Floored = math.floor(Largest / 2)
							
							return p1.types.UDim.new(0, p3.inset(16, p6, "panel", Callback) + (if p6 == "left" then Floored else Largest - Floored))
						end
						
						local RoomResult = OverlayPartsModule.room(p1, List, ScrollFrame, function(Callback)
							-- upvalues: p1 (upval), p4 (upval), roomPx (copy), CellResult (copy), LayoutSizeResult1 (copy)
							local ReadResult: number = p1.read(p4.bodyHeight, Callback)
							assert(p4.bodyHeight == nil or (ReadResult == "fill" or type(ReadResult) == "number" and (ReadResult == ReadResult and ReadResult >= 0) and ReadResult < 1e999), "Facet UI.Dialog: bodyHeight must be fill or a finite nonnegative logical height")
							
							return if ReadResult == nil then Callback(LayoutSizeResult1).Y elseif ReadResult == "fill" then roomPx(Callback) else ReadResult * Callback(CellResult)
						end, function(p6)
							-- upvalues: roomPx (copy)
							return (roomPx(p6))
						end, Compose.formula(function(Callback)
							-- upvalues: CellResult1 (copy), p1 (upval), p4 (upval)
							local CallbackResult = Callback(CellResult1)
							
							if not CallbackResult then
								local ReadResult: number = p1.read(p4.bodyHeight, Callback)
								assert(p4.bodyHeight == nil or (ReadResult == "fill" or type(ReadResult) == "number" and (ReadResult == ReadResult and ReadResult >= 0) and ReadResult < 1e999), "Facet UI.Dialog: bodyHeight must be fill or a finite nonnegative logical height")
								CallbackResult = ReadResult == "fill"
							end
							return CallbackResult
						end), LayoutUnitResult, {
							padding = Host.UIPadding({
								PaddingTop = function(p6)
									-- upvalues: p1 (upval), panelInset (copy)
									return p1.types.UDim.new(0, panelInset("top", p6))
								end,
								PaddingBottom = function(p6)
									-- upvalues: p1 (upval), panelInset (copy)
									return p1.types.UDim.new(0, panelInset("bottom", p6))
								end,
								PaddingLeft = function(p6)
									-- upvalues: horizontalInset (copy)
									return horizontalInset(p6, "left")
								end,
								PaddingRight = function(p6)
									-- upvalues: horizontalInset (copy)
									return horizontalInset(p6, "right")
								end
							}),
							verticalInset = padded
						})
						
						if ScrollFrame and p4.bodyHeight ~= nil then
							Runtime.decorate(ScrollFrame, {
								CanvasSize = function(Callback)
									-- upvalues: TypesUDim2 (upval), RoomResult (copy)
									return TypesUDim2.fromOffset(0, Callback(RoomResult.bodyHeight))
								end
							})
						end
						Compose.watch(function(Callback)
							-- upvalues: p1 (upval), p4 (upval), CellResult1 (copy), CellResult (copy), LayoutSizeResult1 (copy), RoomResult (copy), p3 (upval), LayoutSizeResult (copy), Er (copy), LayoutUnitResult (copy)
							local ReadResult = p1.read(p4.presentation, Callback) or "automatic"
							assert(ReadResult == "automatic" or ReadResult == "inset", "Facet UI.Dialog: invalid presentation")
							
							if ReadResult == "inset" then
								CellResult1:set(false)
								
								return
							else
								local ReadResult1: number = p1.read(p4.bodyHeight, Callback)
								assert(p4.bodyHeight == nil or (ReadResult1 == "fill" or type(ReadResult1) == "number" and (ReadResult1 == ReadResult1 and ReadResult1 >= 0) and ReadResult1 < 1e999), "Facet UI.Dialog: bodyHeight must be fill or a finite nonnegative logical height")
								CellResult1:set(math.max(0, Callback(LayoutSizeResult).Y - Er(Callback) / Callback(LayoutUnitResult)) < Callback(RoomResult.pinned) + (if ReadResult1 == "fill" then 0 elseif ReadResult1 == nil then Callback(LayoutSizeResult1).Y else ReadResult1 * Callback(CellResult)) + (p3.inset(16, "top", "panel", Callback) + p3.inset(16, "bottom", "panel", Callback)) + 2 * p1.metric("space.xl", Callback))
							end
						end)
						
						if ScrollFrame and p4.bodyHeight == nil and p4.contentSelectable ~= false then
							Runtime.decorate(ScrollFrame, { Selectable = RoomResult.overflowing })
							ScrollFrame:SetAttribute("FacetSelectionOwner", true)
							local ObserveResult = if p3.service("GuiService") then p1.selection.observe() else Compose.cell(nil)
							
							local _ = function(p6)
								-- upvalues: ScrollFrame (copy), TypesVector2 (upval)
								local Y: number = ScrollFrame.AbsoluteWindowSize.Y
								local CanvasPosition = ScrollFrame.CanvasPosition
								ScrollFrame.CanvasPosition = TypesVector2.new(CanvasPosition.X, (math.clamp(CanvasPosition.Y + p6 * math.max(1, Y * 0.8), 0, (math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - Y)))))
							end
							
							p3.attach(ScrollFrame, {
								Compose.show(RoomResult.overflowing, function()
									-- upvalues: p1 (upval), ScrollFrame (copy), v6 (ref), ObserveResult (copy), RoomResult (copy), TypesVector2 (upval), TypesEnum (upval), Compose (upval)
									local CanvasPositionResult = p1.observe.CanvasPosition(ScrollFrame)
									local AbsoluteWindowSizeResult = p1.observe.AbsoluteWindowSize(ScrollFrame)
									local AbsoluteSizeResult = p1.observe.AbsoluteSize(assert(v6))
									
									local function bind(p6, p7, p8)
										-- upvalues: p1 (upval), ScrollFrame (upval), ObserveResult (upval), RoomResult (upval), CanvasPositionResult (copy), AbsoluteSizeResult (copy), AbsoluteWindowSizeResult (copy), TypesVector2 (upval)
										p1.action(ScrollFrame, p6, p8, function(Callback): boolean
											-- upvalues: ObserveResult (upval), ScrollFrame (upval), RoomResult (upval), CanvasPositionResult (upval), AbsoluteSizeResult (upval), AbsoluteWindowSizeResult (upval), p7 (copy)
											if Callback(ObserveResult) == ScrollFrame and Callback(RoomResult.overflowing) then
												local Y: number = Callback(CanvasPositionResult).Y
												local Largest = math.max(0, Callback(AbsoluteSizeResult).Y - Callback(AbsoluteWindowSizeResult).Y)
												
												return if p7 > 0 then Y < Largest - 0.5 else Y > 0.5
											else
												return false
											end
										end, function()
											-- upvalues: p7 (copy), ScrollFrame (upval), TypesVector2 (upval)
											local Y: number = ScrollFrame.AbsoluteWindowSize.Y
											local CanvasPosition = ScrollFrame.CanvasPosition
											ScrollFrame.CanvasPosition = TypesVector2.new(CanvasPosition.X, (math.clamp(CanvasPosition.Y + p7 * math.max(1, Y * 0.8), 0, (math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - Y)))))
										end, { priority = 3000, capture = true })
									end
									
									bind("DialogBodyDown", 1, { TypesEnum.KeyCode.Down, TypesEnum.KeyCode.DPadDown })
									bind("DialogBodyUp", -1, { TypesEnum.KeyCode.Up, TypesEnum.KeyCode.DPadUp })
									
									return Compose.fragment(function()
										return {}
									end)
								end)
							})
						end
						return {
							owner = Child,
							layer = Layer,
							build = function(p6)
								-- upvalues: Compose (upval), p3 (upval), p1 (upval), LayoutUnitResult (copy), TypesVector2 (upval), TypesUDim2 (upval), Er (copy), CellResult1 (copy), LayoutSizeResult (copy), widthPx (copy), TypesEnum (upval), RoomResult (copy), p4 (upval), CellResult2 (copy)
								local CellResult = Compose.cell(false)
								local AppearanceResult = p3.appearance(p6, p1.motionTiming("dialog"), CellResult)
								local AtRestResult = {}
								local FormulaResult = Compose.formula(function(Callback)
									-- upvalues: CellResult (copy), AppearanceResult (copy), AtRestResult (ref), LayoutUnitResult (upval)
									return if Callback(CellResult) and AppearanceResult.travel(Callback) < 1 then Callback(AtRestResult[1]) / Callback(LayoutUnitResult) else nil
								end)
								local Dialog = p1.styled(p1.fade({
									Name = "Panel",
									AnchorPoint = TypesVector2.new(0.5, 0.5),
									Position = function(Callback)
										-- upvalues: TypesUDim2 (upval), Er (upval), LayoutUnitResult (upval)
										return TypesUDim2.new(0.5, 0, 0.5, -(Er(Callback) / Callback(LayoutUnitResult)) / 2)
									end,
									Size = function(Callback)
										-- upvalues: CellResult1 (upval), TypesUDim2 (upval), LayoutSizeResult (upval), Er (upval), LayoutUnitResult (upval), FormulaResult (copy), widthPx (upval)
										if Callback(CellResult1) then
											return TypesUDim2.fromOffset(Callback(LayoutSizeResult).X, (math.max(0, Callback(LayoutSizeResult).Y - Er(Callback) / Callback(LayoutUnitResult))))
										else
											local CallbackResult = Callback(FormulaResult)
											
											return TypesUDim2.fromOffset(widthPx(Callback), if CallbackResult then math.ceil(CallbackResult.Y) else 0)
										end
									end,
									AutomaticSize = function(Callback)
										-- upvalues: FormulaResult (copy), CellResult1 (upval), TypesEnum (upval)
										return if Callback(FormulaResult) or Callback(CellResult1) then TypesEnum.AutomaticSize.None else TypesEnum.AutomaticSize.Y
									end,
									BackgroundTransparency = 0,
									BorderSizePixel = 0,
									GroupTransparency = function(p7): number
										-- upvalues: AppearanceResult (copy)
										return 1 - AppearanceResult.opacity(p7)
									end,
									RoomResult.frame,
									p1.corner()
								}, true), "dialog")
								p1.styled(Dialog, "panel")
								AtRestResult = p3.atRest(AppearanceResult.travel, CellResult, { Dialog })
								p3.skin(Dialog, "panel", {
									fullPanelArtFade = true,
									padding = false,
									title = p4.title,
									onCaption = function(p7)
										-- upvalues: CellResult2 (upval)
										CellResult2:set(p7)
									end
								})
								
								return {
									panel = Dialog,
									shown = AppearanceResult,
									content = RoomResult.frame
								}
							end
						}
					end)
					v5 = WithOwnerResult
				end
				local BuildResult = assert(WithOwnerResult).build(p5)
				VisualTargetModule.bind(Compose, FrameResult, BuildResult.panel)
				local List = {}
				
				for _, action in Actions do
					table.insert(List, {
						id = action.id,
						role = action.role,
						usable = OverlayPartsModule.usable(p1, action)
					})
				end
				local InitialActionResult = OverlayPartsModule.initialAction(List)
				Compose.cleanup(function()
					-- upvalues: CoreModule (upval), v3 (upval), v4 (upval), p4 (upval), ReadFunction (upval), OverlayPartsModule (upval)
					if CoreModule.owner.isDisposed(v3) then
						v4 = nil
						
						if p4.onDismiss then
							p4.onDismiss("cancel")
						end
						return
					else
						local V25 = v4 or "cancel"
						v4 = nil
						
						if ReadFunction(p4.isPresented) == true then
							local OnPresentedChange = p4.onPresentedChange
							
							if OnPresentedChange ~= nil then
								v4 = "cancel"
								local v6 = false
								local v7 = false
								OverlayPartsModule.call(OnPresentedChange, function()
									-- upvalues: v6 (ref), ReadFunction (upval), p4 (upval), v7 (copy), v4 (upval)
									v6 = ReadFunction(p4.isPresented) == true == v7
									
									if not v6 then
										v4 = nil
									end
								end, false)
							end
							v4 = nil
							
							if p4.onDismiss then
								p4.onDismiss("cancel")
								
								return
							end
						elseif p4.onDismiss then
							p4.onDismiss(V25)
						end
					end
				end)
				local ModalResult = p3.modal(function()
					-- upvalues: BuildResult (copy)
					return BuildResult.panel
				end, function()
					-- upvalues: v2 (upval), OverlayPartsModule (upval), p1 (upval), press (upval), p4 (upval), v4 (upval), ReadFunction (upval)
					if v2 and OverlayPartsModule.usable(p1, v2) then
						press(v2)
						
						return
					end
					local OnPresentedChange = p4.onPresentedChange
					
					if OnPresentedChange ~= nil then
						v4 = "cancel"
						local v6 = false
						local v7 = false
						OverlayPartsModule.call(OnPresentedChange, function()
							-- upvalues: v6 (ref), ReadFunction (upval), p4 (upval), v7 (copy), v4 (upval)
							v6 = ReadFunction(p4.isPresented) == true == v7
							
							if not v6 then
								v4 = nil
							end
						end, false)
						
						return
					end
				end, {
					Name = "DialogModal",
					initialFocus = InitialActionResult,
					onOutside = function()
						-- upvalues: p4 (upval), v4 (upval), OverlayPartsModule (upval), ReadFunction (upval)
						local OnPresentedChange = p4.onPresentedChange
						
						if OnPresentedChange ~= nil then
							v4 = "outside"
							local v6 = false
							local v7 = false
							OverlayPartsModule.call(OnPresentedChange, function()
								-- upvalues: v6 (ref), ReadFunction (upval), p4 (upval), v7 (copy), v4 (upval)
								v6 = ReadFunction(p4.isPresented) == true == v7
								
								if not v6 then
									v4 = nil
								end
							end, false)
							
							return
						end
					end,
					exiting = if p5 then p5.exiting else nil,
					appearance = BuildResult.shown.opacity
				})
				Compose.cleanup(function()
					-- upvalues: BuildResult (copy)
					if BuildResult.content.Parent ~= nil then
						BuildResult.content.Parent = nil
					end
				end)
				
				return ModalResult
			end, { motion = p1.motionTiming("dialog") })
		})
		
		return FrameResult
	end)
end