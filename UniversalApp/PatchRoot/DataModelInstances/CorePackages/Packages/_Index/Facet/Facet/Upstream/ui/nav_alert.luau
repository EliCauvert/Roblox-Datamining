local _ = require("./theme_types")
local LayoutKitModule = require("./layout_kit")
local _ = require("./types")
local _ = require("./navigation_types")
local MaterializeModule = require("./materialize")
local _ = require("../vendor/compose/core")
local OverlayPartsModule = require("./overlay_parts")
local _ = require("./control_types")
local _ = require("./navigation_props")
local ReducedFunction = require("./motion").reduced
local _ = require("./nav_surface_parts")
local OverlayArrivalModule = require("./overlay_arrival")

return function(p1, p2, p3, p4)
	-- upvalues: LayoutKitModule (copy), ReducedFunction (copy), OverlayPartsModule (copy), OverlayArrivalModule (copy), MaterializeModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local OfResult = LayoutKitModule.of(p1)
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	
	local function _(p5)
		assert(p5.isPresented or p5.item, "A presented control requires isPresented or item")
		
		return function(Callback)
			-- upvalues: p5 (copy)
			return if p5.item then Callback(p5.item) ~= nil else Callback(assert(p5.isPresented))
		end
	end
	
	local _ = function(p5)
		if p5.item then
			p5.item:set(nil)
		end
		if p5.isPresented then
			p5.isPresented:set(false)
		end
		if p5.error and p5.error.set then
			p5.error:set(nil)
		end
	end
	
	p2.Alert = p1.construct("Alert", function(p5)
		-- upvalues: p4 (copy), ReducedFunction (upval), p1 (copy), p3 (copy), Host (copy), ReadFunction (copy), OverlayPartsModule (upval), Compose (copy), TypesVector2 (copy), TypesUDim2 (copy), TypesEnum (copy), p2 (copy), OfResult (copy), Runtime (copy), OverlayArrivalModule (upval), MaterializeModule (upval)
		local function _(Callback, p6)
			return if type(Callback) == "function" then Callback(p6) else Callback
		end
		
		local _ = function(Callback, p6)
			return if type(Callback) == "function" then Callback(p6) else Callback
		end
		
		local Alert = p4.empty(p5, {
			"title", "message", "actions", "isPresented", "presenting", "item", "error",
			"icon", "severity", "suppression", "content", "maxWidth", "padding", "surface",
			"transition"
		}, "Alert")
		local IsFullScreen = p5.surface == "fullScreen"
		assert(p5.surface == nil or (p5.surface == "dialog" or IsFullScreen), "Alert.surface must be dialog or fullScreen")
		assert(p5.transition == nil or (p5.transition == false or type(p5.transition) == "table"), "Alert transition must be a table or false")
		local Transition = if type(p5.transition) == "table" then p5.transition else nil
		
		if Transition then
			assert(type(Transition) == "table", "Alert.transition requires Compose tween options and an optional native source")
			
			for i in Transition do
				assert(i == "source" or (i == "seconds" or i == "ease"), "Alert.transition supports source, seconds, ease")
			end
		end
		local ReducedResult = ReducedFunction(p1)
		assert(p5.isPresented or p5.item, "A presented control requires isPresented or item")
		local v1 = nil
		local Count = 0
		p3.attach(Alert, {
			p3.overlay(Alert, function(Callback)
				-- upvalues: p5 (copy)
				return if p5.item then Callback(p5.item) ~= nil else Callback(assert(p5.isPresented))
			end, function(p6)
				-- upvalues: p5 (copy), Host (upval), ReadFunction (upval), OverlayPartsModule (upval), Compose (upval), TypesVector2 (upval), p1 (upval), TypesUDim2 (upval), TypesEnum (upval), p2 (upval), IsFullScreen (copy), OfResult (upval), Runtime (upval), p3 (upval), Transition (copy), OverlayArrivalModule (upval), ReducedResult (copy), MaterializeModule (upval)
				if p5.suppression and p5.suppression.isSuppressed:peek() then
					if p5.item then
						p5.item:set(nil)
					end
					if p5.isPresented then
						p5.isPresented:set(false)
					end
					if p5.error and p5.error.set then
						p5.error:set(nil)
					end
					return Host.Folder({})
				else
					local PeekResult = if p5.item then p5.item:peek() else ReadFunction(p5.presenting)
					local ActionsFunction = p5.actions
					local ActionsResult = (if type(ActionsFunction) == "function" then ActionsFunction(PeekResult) else ActionsFunction) or { { id = "OK", label = "OK" } }
					assert(#ActionsResult > 0, "Alert requires at least one action")
					local v2 = nil
					local v3 = nil
					local List = {}
					local t = {}
					
					for _, value in ActionsResult do
						assert(type(value.id) == "string" and not t[value.id], "Alert actions require unique ids")
						t[value.id] = true
						
						if value.role == "cancel" or value.shortcut == "cancelAction" then
							assert(v2 == nil, "Alert accepts one cancel action")
							v2 = value
						end
						if value.role == "default" then
							assert(v3 == nil, "Alert accepts one default action")
							v3 = value
						end
						table.insert(List, {
							id = value.id,
							role = if value.shortcut == "cancelAction" then value.role or "cancel" else value.role,
							usable = ReadFunction(value.enabled) ~= false,
							default = value.shortcut == "defaultAction"
						})
					end
					local InitialActionResult = OverlayPartsModule.initialAction(List)
					
					local function _(p7)
						-- upvalues: ReadFunction (upval), p5 (upval), PeekResult (copy)
						if p7 and ReadFunction(p7.enabled) == false then return end
						if p5.item then
							p5.item:set(nil)
						end
						if p5.isPresented then
							p5.isPresented:set(false)
						end
						if p5.error and p5.error.set then
							p5.error:set(nil)
						end
						if p7 and p7.onActivate then
							p7.onActivate(PeekResult)
						end
					end
					
					local CellResult = Compose.cell(TypesVector2.new(720, 720))
					local Padding = p5.padding or 20
					local CellResult1 = Compose.cell(0)
					local StackedFormResult = OverlayPartsModule.stackedForm(p1)
					local FormulaResult = Compose.formula(function(Callback)
						-- upvalues: ActionsResult (copy), StackedFormResult (copy), CellResult (copy), CellResult1 (copy), p5 (upval), Padding (copy)
						return #ActionsResult > 2 or (StackedFormResult(Callback) or (Callback(CellResult).X < 480 or math.min(Callback(CellResult).X - 32, p5.maxWidth or 440) - Padding * 2 < Callback(CellResult1)))
					end)
					local List1 = {}
					
					if p5.icon or p5.severity == "critical" or p5.error then
						table.insert(List1, p1.icon(p5.icon or "status.warning", { Name = "AlertIcon", Size = TypesUDim2.fromOffset(28, 28) }))
					end
					local TitleFunction = p5.title
					local TitleResult = (if type(TitleFunction) == "function" then TitleFunction(PeekResult) else TitleFunction) or p5.error and "Something went wrong"
					
					if TitleResult then
						local LayoutOrder = #List1 + 1
						table.insert(List1, Compose.show(function(p7): boolean
							-- upvalues: ReadFunction (upval), TitleResult (copy)
							return string.find(tostring(ReadFunction(TitleResult, p7)), "%S") ~= nil
						end, function()
							-- upvalues: p1 (upval), TitleResult (copy), TypesEnum (upval), LayoutOrder (copy), TypesUDim2 (upval)
							local Title = p1.text({
								Name = "Title",
								TextWrapped = true,
								Text = TitleResult,
								TextXAlignment = TypesEnum.TextXAlignment.Center,
								LayoutOrder = LayoutOrder,
								Size = TypesUDim2.new(1, 0, 0, 0),
								AutomaticSize = TypesEnum.AutomaticSize.Y
							})
							p1.textRole(Title, "heading")
							
							return Title
						end))
					end
					local MessageFunction = p5.message
					local MessageResult = (if type(MessageFunction) == "function" then MessageFunction(PeekResult) else MessageFunction) or p5.error and tostring(ReadFunction(p5.error))
					
					if MessageResult then
						table.insert(List1, p1.styled(p1.text({
							Name = "Message",
							TextWrapped = true,
							Text = MessageResult,
							TextXAlignment = TypesEnum.TextXAlignment.Center,
							Size = TypesUDim2.new(1, 0, 0, 0),
							AutomaticSize = TypesEnum.AutomaticSize.Y
						}), "secondary"))
					end
					if p5.content then
						table.insert(List1, p5.content(PeekResult))
					end
					local ColumnResult = p1.column(List1, {
						Name = "AlertContent",
						Size = TypesUDim2.new(1, 0, 0, 0),
						AutomaticSize = TypesEnum.AutomaticSize.Y
					})
					local UIListLayout = ColumnResult:FindFirstChildWhichIsA("UIListLayout")
					
					if UIListLayout then
						UIListLayout.HorizontalAlignment = TypesEnum.HorizontalAlignment.Center
					end
					local CellResult2 = Compose.cell(0)
					local config = {
						Name = "Actions",
						BackgroundTransparency = 1,
						Size = TypesUDim2.new(1, 0, 0, 0),
						AutomaticSize = TypesEnum.AutomaticSize.Y,
						Host.UIListLayout({
							FillDirection = function(Callback)
								-- upvalues: FormulaResult (copy), TypesEnum (upval)
								return if Callback(FormulaResult) then TypesEnum.FillDirection.Vertical else TypesEnum.FillDirection.Horizontal
							end,
							HorizontalFlex = function(Callback)
								-- upvalues: FormulaResult (copy), TypesEnum (upval)
								return if Callback(FormulaResult) then TypesEnum.UIFlexAlignment.None else TypesEnum.UIFlexAlignment.Fill
							end,
							SortOrder = TypesEnum.SortOrder.LayoutOrder,
							Padding = p1.types.UDim.new(0, 8)
						})
					}
					local List11 = {}
					
					for i, value1 in ActionsResult do
						local ButtonResult = p2.Button({
							Name = value1.id,
							label = value1.label,
							enabled = value1.enabled,
							role = value1.role,
							appearance = if value1.role == "default" then "emphasis" else nil,
							haptic = value1.role == "destructive" or value1.shortcut == "defaultAction",
							shortcut = if value1.shortcut == "defaultAction" then { keyCode = "Return" } elseif type(value1.shortcut) == "table" then value1.shortcut else nil,
							Size = function(Callback)
								-- upvalues: FormulaResult (copy), TypesUDim2 (upval)
								return if Callback(FormulaResult) then TypesUDim2.new(1, 0, 0, 44) else TypesUDim2.fromOffset(0, 44)
							end,
							AutomaticSize = TypesEnum.AutomaticSize.None,
							LayoutOrder = function(Callback)
								-- upvalues: value1 (copy), FormulaResult (copy), ActionsResult (copy), i (copy)
								return if value1.role == "cancel" then if Callback(FormulaResult) then #ActionsResult + 1 else 0 else i
							end,
							onActivate = function()
								-- upvalues: value1 (copy), ReadFunction (upval), p5 (upval), PeekResult (copy)
								if value1 and ReadFunction(value1.enabled) == false then return end
								if p5.item then
									p5.item:set(nil)
								end
								if p5.isPresented then
									p5.isPresented:set(false)
								end
								if p5.error and p5.error.set then
									p5.error:set(nil)
								end
								if value1 and value1.onActivate then
									value1.onActivate(PeekResult)
								end
							end
						})
						config[#config + 1] = ButtonResult
						table.insert(List11, p1.observe.TextBounds(ButtonResult))
					end
					Compose.watch(function(Callback)
						-- upvalues: ActionsResult (copy), List11 (copy), CellResult1 (copy)
						local NewX = (#ActionsResult - 1) * 8
						
						for _, value in List11 do
							NewX += Callback(value).X + 24
						end
						CellResult1:set(NewX)
					end)
					local FrameResult = Host.Frame(config)
					
					if p5.suppression then
						FrameResult = p1.column({
							FrameResult,
							p2.Toggle("Suppression")({
								value = p5.suppression.isSuppressed,
								label = p5.suppression.label or "Do not show again"
							})
						}, {
							Name = "AlertFooter",
							Size = TypesUDim2.new(1, 0, 0, 0),
							AutomaticSize = TypesEnum.AutomaticSize.Y
						})
					end
					local LayoutSizeResult = p1.layoutSize(FrameResult)
					
					local function chrome(p7): number
						-- upvalues: ReadFunction (upval), p1 (upval), Padding (copy)
						local ReadResult = ReadFunction(p1.config.theme, p7)
						local Panel = if ReadResult and ReadResult.chrome then ReadResult.chrome.panel else nil
						local ContentInsets = if Panel then Panel.contentInsets else nil
						
						return Padding * 2 + 8 + math.max(0, ContentInsets and ContentInsets.top or 0) + math.max(0, ContentInsets and ContentInsets.bottom or 0)
					end
					
					local ScrollerResult, _, _, ScrollerResult4, ScrollerResult5 = OverlayPartsModule.scroller(p1, {
						Name = "AlertMessage",
						Selectable = false,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						ScrollBarThickness = 4,
						ScrollingDirection = TypesEnum.ScrollingDirection.Y,
						VerticalScrollBarInset = TypesEnum.ScrollBarInset.ScrollBar,
						Size = function(Callback)
							-- upvalues: IsFullScreen (upval), TypesUDim2 (upval), LayoutSizeResult (copy), CellResult2 (copy), CellResult (copy), chrome (copy)
							return if IsFullScreen then TypesUDim2.new(1, 0, 1, -Callback(LayoutSizeResult).Y - 12) else TypesUDim2.new(1, 0, 0, (math.min(Callback(CellResult2), (math.max(44, (math.floor(Callback(CellResult).Y - Callback(LayoutSizeResult).Y - chrome(Callback) - 32)))))))
						end
					}, { OfResult.list({}, true), ColumnResult }, { rest = p5.transition == nil })
					local ColumnResult1 = nil
					
					if IsFullScreen then
						local NewTypesVector = TypesVector2.new(p5.maxWidth or 960, 1e999)
						Runtime.decorate(FrameResult, {
							AnchorPoint = TypesVector2.new(0.5, 1),
							Position = TypesUDim2.fromScale(0.5, 1)
						})
						Runtime.decorate(ScrollerResult, {
							AnchorPoint = TypesVector2.new(0.5, 0),
							Position = TypesUDim2.fromScale(0.5, 0)
						})
						p3.attach(FrameResult, {
							Host.UISizeConstraint("ReadableWidth")({ MaxSize = NewTypesVector })
						})
						p3.attach(ScrollerResult, {
							Host.UISizeConstraint("ReadableWidth")({ MaxSize = NewTypesVector })
						})
						ColumnResult1 = Host.Frame("AlertLayout")({
							BackgroundTransparency = 1,
							Size = function(Callback)
								-- upvalues: CellResult (copy), TypesUDim2 (upval), p3 (upval)
								local CallbackResult = Callback(CellResult)
								
								return if CallbackResult.X <= 0 or CallbackResult.Y <= 0 then TypesUDim2.fromScale(1, 1) else TypesUDim2.fromOffset(CallbackResult.X - (p3.inset(0, "left", nil, Callback) + p3.inset(0, "right", nil, Callback)), CallbackResult.Y - (p3.inset(0, "top", nil, Callback) + p3.inset(0, "bottom", nil, Callback)))
							end,
							ScrollerResult,
							FrameResult,
							p1.padding(Padding, Padding)
						})
					else
						ColumnResult1 = p1.column({
							ScrollerResult,
							FrameResult,
							p1.padding(Padding, Padding),
							p1.corner()
						}, {
							Name = "AlertLayout",
							Size = TypesUDim2.new(1, 0, 0, 0),
							AutomaticSize = TypesEnum.AutomaticSize.Y
						})
					end
					local Alert = p1.styled(p1.fade({
						Name = "AlertPanel",
						BackgroundTransparency = 0,
						BorderSizePixel = 0,
						Size = TypesUDim2.fromScale(1, 1),
						ColumnResult1
					}, true), "alert")
					
					if not IsFullScreen then
						p3.centered(Alert, p5.maxWidth or 440)
					end
					p1.styled(Alert, if IsFullScreen then "pane" else "panel")
					p3.skin(Alert, "panel")
					local CellResult3 = Compose.cell(false)
					local AppearanceResult = if p5.transition == nil then p3.appearance(p6, p1.motionTiming("dialog"), CellResult3) else nil
					Compose.watch(function(Callback)
						-- upvalues: ScrollerResult4 (copy), ScrollerResult5 (copy), AppearanceResult (copy), CellResult2 (copy), CellResult3 (copy), List1 (copy)
						local CallbackResult = Callback(ScrollerResult4)
						
						if not Callback(ScrollerResult5) or AppearanceResult == nil or AppearanceResult.travel(Callback) >= 1 then
							CellResult2:set(CallbackResult)
						end
						CellResult3:set(Callback(ScrollerResult5) or #List1 == 0)
					end)
					
					if AppearanceResult then
						p1.fadeTo(Alert, function(p7): number
							-- upvalues: AppearanceResult (copy)
							return 1 - AppearanceResult.opacity(p7)
						end)
					end
					local ModalResult = p3.modal(function()
						-- upvalues: Alert (copy)
						return Alert
					end, function()
						-- upvalues: v2 (ref), ReadFunction (upval), p5 (upval), PeekResult (copy)
						if v2 and ReadFunction(v2.enabled) == false then
							if p5.item then
								p5.item:set(nil)
							end
							if p5.isPresented then
								p5.isPresented:set(false)
							end
							if p5.error and p5.error.set then
								p5.error:set(nil)
								
								return
							end
						else
							local v4 = v2
							
							if v4 and ReadFunction(v4.enabled) == false then return end
							if p5.item then
								p5.item:set(nil)
							end
							if p5.isPresented then
								p5.isPresented:set(false)
							end
							if p5.error and p5.error.set then
								p5.error:set(nil)
							end
							if v4 and v4.onActivate then
								v4.onActivate(PeekResult)
							end
						end
					end, {
						Name = "AlertModal",
						outsideDismiss = false,
						initialFocus = InitialActionResult,
						exiting = if p6 then p6.exiting else nil,
						appearance = if AppearanceResult then AppearanceResult.opacity else nil
					})
					
					if Transition then
						local v4 = assert(p6)
						local CellResult4 = Compose.cell(false)
						local ReadResult = ReadFunction(Transition.source)
						local AbsolutePositionResult = if ReadResult then p1.observe.AbsolutePosition(ReadResult) else Compose.cell(TypesVector2.zero)
						local AbsoluteSizeResult = if ReadResult then p1.observe.AbsoluteSize(ReadResult) else Compose.cell(TypesVector2.zero)
						local AbsolutePositionResult1 = p1.observe.AbsolutePosition(ModalResult)
						local ReadyResult = OverlayArrivalModule.ready(v4)
						local TweenResult = Runtime.tween(function(Callback): number
							-- upvalues: v4 (copy), CellResult4 (copy), ReadyResult (copy)
							return if Callback(v4.exiting) then 0 elseif Callback(CellResult4) and (ReadyResult == nil or Callback(ReadyResult)) then 1 else 0
						end, {
							seconds = Transition.seconds or p1.metric("motion.normal"),
							ease = Transition.ease
						})
						
						local _ = function(Callback)
							-- upvalues: ReducedResult (upval), TweenResult (copy)
							return if ReducedResult(Callback) then 1 else Callback(TweenResult)
						end
						
						if IsFullScreen then
							local ParentResult = if ReadResult then p1.observe.Parent(ReadResult) else Compose.cell(nil)
							local UICornerResult = p1.Host.UICorner({ CornerRadius = p1.types.UDim.new(0, 0) })
							local UICorner = if ReadResult then ReadResult:FindFirstChildWhichIsA("UICorner") else nil
							local Offset = if UICorner then UICorner.CornerRadius.Offset else 12
							local ReadResultClone = if ReadResult then ReadResult:Clone() else nil
							
							if ReadResultClone then
								Runtime.adopt(ReadResultClone)
								local ViewportFrames = {}
								
								local function match(Key, Object)
									-- upvalues: ViewportFrames (copy), match (copy)
									ViewportFrames[Key] = Object
									local Children = Object:GetChildren()
									
									for _, child in Key:GetChildren() do
										if child.Archivable then
											for i, child1 in Children do
												if child1.Name == child.Name and child1.ClassName == child.ClassName then
													table.remove(Children, i)
													match(child, child1)
													break
												end
											end
										end
									end
								end
								
								match(assert(ReadResult), ReadResultClone)
								
								for ViewportFrame, ViewportFrame1 in ViewportFrames do
									if ViewportFrame:IsA("ViewportFrame") and ViewportFrame1:IsA("ViewportFrame") then
										local CurrentCamera = ViewportFrame.CurrentCamera
										local Camera = if CurrentCamera then ViewportFrames[CurrentCamera] else nil
										ViewportFrame1.CurrentCamera = if Camera and Camera:IsA("Camera") then Camera elseif CurrentCamera and not CurrentCamera:IsDescendantOf(assert(ReadResult)) then CurrentCamera else nil
									end
								end
								local Descendants = ReadResultClone:GetDescendants()
								table.insert(Descendants, ReadResultClone)
								
								for _, Object in Descendants do
									if Object:IsA("GuiObject") then
										Object.Interactable = false
										Object.Active = false
										Object.Selectable = false
									elseif Object:IsA("UIDragDetector") then
										Object.Enabled = false
									elseif Object:IsA("InputContext") then
										Object.Enabled = false
									end
								end
								Runtime.decorate(ReadResultClone, {
									Name = "SourceSnapshot",
									AnchorPoint = TypesVector2.zero,
									Position = TypesUDim2.fromOffset(0, 0),
									Size = function(Callback)
										-- upvalues: AbsoluteSizeResult (copy), TypesUDim2 (upval)
										local CallbackResult = Callback(AbsoluteSizeResult)
										
										return TypesUDim2.fromOffset(CallbackResult.X, CallbackResult.Y)
									end,
									AutomaticSize = TypesEnum.AutomaticSize.None
								})
								p3.attach(Alert, {
									p1.fade({
										Name = "SourcePreview",
										BackgroundTransparency = 1,
										Size = TypesUDim2.fromScale(1, 1),
										Interactable = false,
										ZIndex = 2,
										Visible = function(Callback): boolean
											-- upvalues: ParentResult (copy), ReducedResult (upval), TweenResult (copy)
											return Callback(ParentResult) ~= nil and (if ReducedResult(Callback) then 1 else Callback(TweenResult)) < 0.35
										end,
										GroupTransparency = function(Callback): number
											-- upvalues: ReducedResult (upval), TweenResult (copy)
											return (math.clamp((if ReducedResult(Callback) then 1 else Callback(TweenResult)) / 0.35, 0, 1))
										end,
										ReadResultClone
									})
								})
							end
							Runtime.decorate(ColumnResult1, {
								Interactable = function(Callback): boolean
									-- upvalues: v4 (copy), ReducedResult (upval), TweenResult (copy)
									return not Callback(v4.exiting) and (if ReducedResult(Callback) then 1 else Callback(TweenResult)) >= 0.65
								end
							})
							Runtime.decorate(Alert, {
								ClipsDescendants = true,
								AnchorPoint = TypesVector2.zero,
								AutomaticSize = TypesEnum.AutomaticSize.None,
								Position = function(Callback)
									-- upvalues: ReducedResult (upval), TweenResult (copy), ParentResult (copy), AbsolutePositionResult (copy), AbsolutePositionResult1 (copy), TypesVector2 (upval), TypesUDim2 (upval)
									local CallbackResult = if ReducedResult(Callback) then 1 else Callback(TweenResult)
									local CallbackResultDelta = if Callback(ParentResult) then Callback(AbsolutePositionResult) - Callback(AbsolutePositionResult1) else TypesVector2.zero
									
									return TypesUDim2.fromOffset(CallbackResultDelta.X * (1 - CallbackResult), CallbackResultDelta.Y * (1 - CallbackResult))
								end,
								Size = function(Callback)
									-- upvalues: ReducedResult (upval), TweenResult (copy), CellResult (copy), ParentResult (copy), AbsoluteSizeResult (copy), TypesUDim2 (upval)
									local CallbackResult = if ReducedResult(Callback) then 1 else Callback(TweenResult)
									local CallbackResult1 = Callback(CellResult)
									local CallbackResult2 = if Callback(ParentResult) then Callback(AbsoluteSizeResult) else CallbackResult1
									
									return TypesUDim2.fromOffset(CallbackResult2.X + (CallbackResult1.X - CallbackResult2.X) * CallbackResult, CallbackResult2.Y + (CallbackResult1.Y - CallbackResult2.Y) * CallbackResult)
								end
							})
							p1.fadeTo(Alert, function(Callback): number
								-- upvalues: ParentResult (copy), ReducedResult (upval), TweenResult (copy)
								return if Callback(ParentResult) then 0 else 1 - (if ReducedResult(Callback) then 1 else Callback(TweenResult))
							end)
							Runtime.decorate(UICornerResult, {
								CornerRadius = function(Callback)
									-- upvalues: p1 (upval), Offset (copy), ReducedResult (upval), TweenResult (copy)
									return p1.types.UDim.new(0, Offset * (1 - (if ReducedResult(Callback) then 1 else Callback(TweenResult))))
								end
							})
							p3.attach(Alert, { UICornerResult })
							local PreferenceResult = p3.preference()
							Runtime.decorate(assert((ModalResult:FindFirstChild("Scrim"))), {
								BackgroundTransparency = function(Callback): number
									-- upvalues: ReducedResult (upval), TweenResult (copy), PreferenceResult (copy)
									return 1 - (if ReducedResult(Callback) then 1 else Callback(TweenResult)) * (1 - 0.35 * PreferenceResult(Callback))
								end
							})
						else
							p1.fadeTo(Alert, function(Callback): number
								-- upvalues: ReducedResult (upval), TweenResult (copy)
								return 1 - (if ReducedResult(Callback) then 1 else Callback(TweenResult))
							end)
							Runtime.decorate(Alert, {
								Position = function(Callback)
									-- upvalues: CellResult (copy), AbsolutePositionResult (copy), AbsoluteSizeResult (copy), AbsolutePositionResult1 (copy), ReducedResult (upval), TweenResult (copy), ReadResult (copy), TypesUDim2 (upval)
									local CallbackResult = Callback(CellResult)
									local CallbackResult1 = Callback(AbsolutePositionResult)
									local CallbackResult2 = Callback(AbsoluteSizeResult)
									local CallbackResult3 = Callback(AbsolutePositionResult1)
									local CallbackResult4 = if ReducedResult(Callback) then 1 else Callback(TweenResult)
									local XRatio = CallbackResult.X / 2
									local YRatio = CallbackResult.Y / 2
									
									if ReadResult and ReadResult.Parent then
										XRatio = (CallbackResult1.X - CallbackResult3.X + CallbackResult2.X / 2) * (1 - CallbackResult4) + XRatio * CallbackResult4
										YRatio = (CallbackResult1.Y - CallbackResult3.Y + CallbackResult2.Y / 2) * (1 - CallbackResult4) + YRatio * CallbackResult4
									end
									return TypesUDim2.fromOffset(XRatio, YRatio)
								end
							})
							MaterializeModule(p1, Alert, {
								Size = TypesUDim2.new(1, -32, 0, 0),
								AutomaticSize = TypesEnum.AutomaticSize.Y
							}, function(Callback): number
								-- upvalues: ReadResult (copy), ReducedResult (upval), TweenResult (copy), CellResult (copy), p5 (upval), AbsoluteSizeResult (copy)
								if ReadResult then
									local CallbackResult = if ReducedResult(Callback) then 1 else Callback(TweenResult)
									
									return math.max(0.01, Callback(AbsoluteSizeResult).X / math.max(1, (math.min(Callback(CellResult).X - 32, p5.maxWidth or 440)))) * (1 - CallbackResult) + CallbackResult
								else
									return 1
								end
							end)
						end
						local ParentResult1 = p1.observe.Parent(ModalResult)
						local AbsoluteSizeResult2 = p1.observe.AbsoluteSize(ModalResult)
						Compose.watch(function(Callback)
							-- upvalues: AbsoluteSizeResult2 (copy), ParentResult1 (copy), IsFullScreen (upval), CellResult4 (copy)
							local CallbackResult = Callback(AbsoluteSizeResult2)
							
							if Callback(ParentResult1) and (not IsFullScreen or CallbackResult.X > 0 and CallbackResult.Y > 0) then
								CellResult4:set(true)
							end
						end)
					end
					local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(ModalResult)
					Compose.watch(function(Callback)
						-- upvalues: AbsoluteSizeResult1 (copy), CellResult (copy)
						local CallbackResult = Callback(AbsoluteSizeResult1)
						
						if CallbackResult.X > 0 and CallbackResult.Y > 0 then
							CellResult:set(CallbackResult)
						end
					end)
					
					return ModalResult
				end
			end, {
				presence = if Transition then {
					exit = function()
						-- upvalues: ReducedResult (copy), Compose (upval), Runtime (upval), ReadFunction (upval), Transition (copy), p1 (upval)
						return if ReducedResult() then { completed = Compose.cell(true) } else {
							completed = Runtime.timeline({
								duration = ReadFunction(Transition.seconds) or p1.metric("motion.normal")
							}).completed
						}
					end
				} else nil,
				motion = if p5.transition == nil then p1.motionTiming("dialog") else nil,
				identity = if p5.item then function(Callback): number
					-- upvalues: p5 (copy), v1 (ref), Count (ref)
					local CallbackResult = Callback(assert(p5.item))
					
					if CallbackResult ~= nil and CallbackResult ~= v1 then
						v1 = CallbackResult
						Count += 1
					end
					return Count
				end else nil,
				failure = function(p7)
					-- upvalues: Alert (copy), p5 (copy), p1 (upval), Host (upval)
					Alert:SetAttribute("FacetError", (tostring(p7)))
					
					if p5.item then
						p5.item:set(nil)
					end
					if p5.isPresented then
						p5.isPresented:set(false)
					end
					if p5.error and p5.error.set then
						p5.error:set(nil)
					end
					if p1.config.onError then
						p1.config.onError(p7)
					elseif task and task.spawn then
						task.spawn(error, "Facet Alert did not open because its content failed to build: " .. tostring(p7), 0)
					end
					return Host.Folder("FailedAlert")({})
				end
			})
		})
		
		return Alert
	end)
end