local _ = require("./theme_types")
local _ = require("./control_types")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("./overlay_types")
local CoreModule = require("../vendor/compose/core")
local OverlayPartsModule = require("./overlay_parts")
local ToastScheduleModule = require("./toast_schedule")
local MotionModule = require("./motion")
local ReservationsModule = require("./reservations")
local _ = require("./overlay_props")
local OverlayArrivalModule = require("./overlay_arrival")
local TextMeasureModule = require("./text_measure")
local VisualTargetModule = require("./visual_target")
local list = {
	"message", "content", "icon", "action", "closeButton", "isPresented",
	"onPresentedChange", "key", "priority", "duration", "readFloor", "position",
	"width", "fade", "onDismiss"
}
local list1 = { "content", "position", "width", "fade" }

return function(p1, p2, p3)
	-- upvalues: OverlayPartsModule (copy), CoreModule (copy), ToastScheduleModule (copy), ReservationsModule (copy), list1 (copy), OverlayArrivalModule (copy), MotionModule (copy), TextMeasureModule (copy), VisualTargetModule (copy), list (copy)
	local ReadFunction1 = p1.read
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesUDim = p1.types.UDim
	local Frames = Runtime.host.frames
	local GuiService = p3.service("GuiService")
	local t = {}
	setmetatable(t, { __mode = "k" })
	local self = setmetatable({}, { __mode = "k" })
	local self1 = setmetatable({}, { __mode = "k" })
	local v1 = nil
	
	local function status(p4, p5)
		if p4.state:peek() ~= p5 then
			p4.state:set(p5)
			local PeekResult = p4.state:peek()
			p4.root:SetAttribute("ToastVisible", PeekResult == "shown")
			p4.root:SetAttribute("ToastQueued", PeekResult == "queued")
		end
	end
	
	local function _(p4): boolean
		-- upvalues: ReadFunction (copy)
		return not p4.torn and (p4.spec.isPresented == nil or ReadFunction(p4.spec.isPresented) == true)
	end
	
	local function retire(p4, p5)
		-- upvalues: status (copy), GuiService (copy), p3 (copy), p1 (copy), v1 (ref), ReadFunction (copy), OverlayPartsModule (upval)
		p4.id = nil
		status(p4, "idle")
		local Row = p4.row
		local Spec = p4.spec
		
		if GuiService and Row and p3.within(p1.selection.get(), Row) then
			p1.selection.set(if v1 and v1.Parent then v1 else nil)
		end
		local OnPresentedChange = Spec.onPresentedChange
		
		if Spec.isPresented ~= nil and OnPresentedChange and not p4.torn and (not p4.torn and (p4.spec.isPresented == nil or ReadFunction(p4.spec.isPresented) == true)) then
			OverlayPartsModule.call(OnPresentedChange, nil, false)
		end
		p4.pending = nil
		
		if Spec.onDismiss then
			Spec.onDismiss(p5)
		end
	end
	
	local _ = function(p4, Pending, p5)
		-- upvalues: OverlayPartsModule (upval), ReadFunction (copy)
		p4.pending = Pending
		OverlayPartsModule.call(p5, function()
			-- upvalues: p4 (copy), ReadFunction (upval)
			if p4.id ~= nil and (not p4.torn and (p4.spec.isPresented == nil or ReadFunction(p4.spec.isPresented) == true)) then
				p4.pending = nil
			end
		end)
	end
	
	local _ = function(p4, p5)
		local Stack = p4.stack
		local Id = p4.id
		
		if Stack and Id then
			Stack.schedule.dismiss(Id, p5)
		end
	end
	
	local function finish(p4, Pending)
		-- upvalues: OverlayPartsModule (upval), ReadFunction (copy)
		if p4.torn or p4.id == nil then return end
		local OnPresentedChangeFunction = p4.spec.onPresentedChange
		
		if p4.spec.isPresented ~= nil and OnPresentedChangeFunction then
			p4.pending = Pending
			OverlayPartsModule.call(function()
				-- upvalues: OnPresentedChangeFunction (copy)
				OnPresentedChangeFunction(false)
			end, function()
				-- upvalues: p4 (copy), ReadFunction (upval)
				if p4.id ~= nil and (not p4.torn and (p4.spec.isPresented == nil or ReadFunction(p4.spec.isPresented) == true)) then
					p4.pending = nil
				end
			end)
			
			return
		end
		local Stack = p4.stack
		local Id = p4.id
		
		if Stack and Id then
			Stack.schedule.dismiss(Id, Pending)
		end
	end
	
	local function paused(p4)
		-- upvalues: GuiService (copy), p3 (copy), p1 (copy)
		local VisibleResultEntry = p4.schedule.visible()[1]
		
		if p4.lane == "action" and VisibleResultEntry ~= nil then
			local Data = VisibleResultEntry.data
			
			return if Data.row == nil or Data.hovered then true elseif GuiService == nil then #p1.modalScopes:peek() > 0 else p3.within(p1.selection.get(), Data.row) or #p1.modalScopes:peek() > 0
		else
			return false
		end
	end
	
	local _ = function(p4)
		-- upvalues: t (copy), CoreModule (upval)
		local Entry = t[p4.layer]
		
		if Entry and Entry[p4.lane] == p4 then
			Entry[p4.lane] = nil
		end
		local Owner = p4.owner
		p4.owner = nil
		
		if Owner and not CoreModule.owner.isDisposed(Owner) then
			CoreModule.owner.dispose(Owner)
		end
	end
	
	local function stackFor(Layer, Lane)
		-- upvalues: t (copy), ToastScheduleModule (upval), retire (copy), finish (copy), status (copy), Compose (copy), p1 (copy), CoreModule (upval), Runtime (copy), TypesUDim2 (copy), TypesVector2 (copy), Host (copy), TypesUDim (copy), TypesEnum (copy)
		local Entry = t[Layer] or {}
		t[Layer] = Entry
		local Entry1 = Entry[Lane]
		
		if Entry1 then
			return Entry1
		end
		local v2 = nil
		v2 = {
			time = 0,
			stop = nil,
			container = nil,
			owner = nil,
			users = 0,
			retained = false,
			schedule = ToastScheduleModule.new({
				maxVisible = if Lane == "action" then 1 else nil,
				now = function()
					-- upvalues: v2 (ref)
					return v2.time
				end,
				onDismiss = function(p4, p5)
					-- upvalues: retire (upval)
					retire(p4.data, p5)
				end,
				onPropose = function(p4, Pending)
					-- upvalues: finish (upval)
					finish(p4.data, Pending)
				end,
				onChange = function()
					-- upvalues: v2 (ref), status (upval), Lane (copy)
					for _, value in v2.schedule.queued() do
						status(value.data, "queued")
					end
					for i, value1 in v2.schedule.visible() do
						local Data = value1.data
						local Negated = if Lane == "bottom" then -i else i
						
						if Data.order ~= Negated then
							Data.order = Negated
							
							if Data.slot then
								Data.slot.LayoutOrder = Negated
							end
						end
						status(Data, "shown")
					end
					if v2.schedule.isEmpty() and v2.stop then
						v2.stop()
						v2.stop = nil
					end
				end
			}),
			inset = Compose.cell(0),
			lane = Lane,
			layer = Layer
		}
		
		if Lane ~= "action" then
			local Lifetime = p1.lifetime
			local Inverted = not CoreModule.owner.isDisposed(Lifetime)
			local Child = if Inverted then CoreModule.owner.createChild(Lifetime) else Compose.createRootOwner(function() end, Runtime.reactor).owner
			v2.owner = Child
			v2.retained = Inverted
			Compose.withOwner(Child, function()
				-- upvalues: Runtime (upval), TypesUDim2 (upval), TypesVector2 (upval), Host (upval), TypesUDim (upval), Lane (copy), v2 (ref), TypesEnum (upval), Layer (copy), t (upval), CoreModule (upval)
				local ToastStack = nil
				Runtime.mount(function()
					-- upvalues: TypesUDim2 (upval), TypesVector2 (upval), Host (upval), TypesUDim (upval), Lane (upval), v2 (upval), TypesEnum (upval), ToastStack (ref)
					ToastStack = Host.Frame({
						Name = "ToastStack",
						BackgroundTransparency = 1,
						Size = TypesUDim2.new(1, -32, 1, 0),
						AnchorPoint = TypesVector2.new(0.5, 0),
						Position = TypesUDim2.fromScale(0.5, 0),
						ZIndex = 70,
						Host.UIPadding({
							PaddingTop = function(Callback)
								-- upvalues: TypesUDim (upval), Lane (upval), v2 (upval)
								return TypesUDim.new(0, 8 + (if Lane == "top" then Callback(v2.inset) else 0))
							end,
							PaddingBottom = function(Callback)
								-- upvalues: TypesUDim (upval), Lane (upval), v2 (upval)
								return TypesUDim.new(0, 8 + (if Lane == "bottom" then Callback(v2.inset) else 0))
							end
						}),
						Host.UIListLayout({
							FillDirection = TypesEnum.FillDirection.Vertical,
							HorizontalAlignment = TypesEnum.HorizontalAlignment.Center,
							VerticalAlignment = if Lane == "bottom" then TypesEnum.VerticalAlignment.Bottom else TypesEnum.VerticalAlignment.Top,
							SortOrder = TypesEnum.SortOrder.LayoutOrder,
							Padding = TypesUDim.new(0, 8)
						})
					})
					
					return ToastStack
				end, Layer)
				v2.container = ToastStack
				Runtime.connect(ToastStack, "AncestryChanged", function()
					-- upvalues: ToastStack (ref), Layer (upval), v2 (upval), t (upval), CoreModule (upval)
					if ToastStack.Parent ~= Layer then
						local v3 = v2
						local Entry = t[v3.layer]
						
						if Entry and Entry[v3.lane] == v3 then
							Entry[v3.lane] = nil
						end
						local Owner = v3.owner
						v3.owner = nil
						
						if Owner and not CoreModule.owner.isDisposed(Owner) then
							CoreModule.owner.dispose(Owner)
						end
					end
				end)
			end)
		end
		Entry[Lane] = v2
		
		return v2
	end
	
	local function push(Data)
		-- upvalues: Frames (copy), paused (copy), ReservationsModule (upval), self1 (copy), ToastScheduleModule (upval)
		local v3 = assert(Data.stack)
		
		if v3.stop == nil and Frames then
			v3.stop = Frames.onFrame(function(p4)
				-- upvalues: paused (upval), v3 (copy), ReservationsModule (upval), self1 (upval)
				if not paused(v3) then
					v3.time += p4
				end
				v3.inset:set(if v3.lane == "action" then ReservationsModule.reserved(v3.layer, "bottom", self1) else ReservationsModule.reserved(v3.layer, v3.lane))
				v3.schedule.update()
			end)
		end
		local Spec = Data.spec
		local Duration = Spec.duration
		
		if Spec.action then
			if Duration then
				Duration = math.max(Duration, Spec.readFloor or ToastScheduleModule.DEFAULTS.readFloor)
			else
				Duration = 1e999
			end
		end
		local PushResult = v3.schedule.push({
			key = Spec.key,
			priority = Spec.priority,
			duration = Duration,
			readFloor = Spec.readFloor,
			data = Data,
			held = Spec.isPresented ~= nil
		})
		
		if Data.state:peek() ~= "idle" then
			Data.id = PushResult
		end
	end
	
	local function validate(Spec)
		-- upvalues: OverlayPartsModule (upval), p1 (copy), list1 (upval)
		local HasAction = Spec.action ~= nil
		
		if Spec.message == nil == (Spec.content == nil) then
			error("Facet UI.Toast: give exactly one of message or content", 0)
		end
		if Spec.message ~= nil and not OverlayPartsModule.bound(p1, Spec.message, "string") then
			error("Facet UI.Toast: message is a string or a bound string", 0)
		end
		if Spec.content ~= nil and type(Spec.content) ~= "function" then
			error("Facet UI.Toast: content is a factory that returns the body", 0)
		end
		if HasAction then
			for _, value in list1 do
				if Spec[value] ~= nil then
					error(`Facet UI.Toast: {value} is for a toast without an action; one with an action docks bottom`, 0)
				end
			end
			if type(Spec.action) ~= "table" then
				error("Facet UI.Toast: action must be { label, onActivate }", 0)
			end
			local Action = Spec.action
			OverlayPartsModule.known("UI.Toast", Action, { "label", "onActivate" }, "action")
			
			if not OverlayPartsModule.bound(p1, Action.label, "string") or type(Action.onActivate) ~= "function" then
				error("Facet UI.Toast: action needs a label and an onActivate function", 0)
			end
		elseif Spec.closeButton ~= nil then
			error("Facet UI.Toast: closeButton needs an action; a toast without one is display-only", 0)
		end
		if Spec.closeButton ~= nil and type(Spec.closeButton) ~= "boolean" then
			error("Facet UI.Toast: closeButton must be true or false", 0)
		end
		if Spec.icon ~= nil and (type(Spec.icon) ~= "string" or Spec.icon == "") then
			error("Facet UI.Toast: icon must be an icon name or an image source", 0)
		end
		if Spec.position ~= nil and Spec.position ~= "top" and Spec.position ~= "bottom" then
			error("Facet UI.Toast: position is top or bottom", 0)
		end
		if Spec.width ~= nil and Spec.width ~= "fill" and Spec.width ~= "hug" then
			error("Facet UI.Toast: width is fill or hug", 0)
		end
		for _, value2 in { "duration", "readFloor" } do
			local SpecEntry: number = Spec[value2]
			
			if SpecEntry ~= nil and (type(SpecEntry) ~= "number" or SpecEntry < 0 or SpecEntry >= 1e999) then
				error(`Facet UI.Toast: {value2} is seconds, 0 or more`, 0)
			end
		end
		if Spec.priority ~= nil and (type(Spec.priority) ~= "number" or math.abs(Spec.priority) >= 1e999) then
			error("Facet UI.Toast: priority is a finite number", 0)
		end
		if Spec.key ~= nil and type(Spec.key) ~= "string" then
			error("Facet UI.Toast: key is a string", 0)
		end
		if Spec.fade ~= nil and type(Spec.fade) ~= "boolean" then
			error("Facet UI.Toast: fade is a boolean", 0)
		end
		for _, value1 in { "onDismiss", "onPresentedChange" } do
			if Spec[value1] ~= nil and type(Spec[value1]) ~= "function" then
				error(`Facet UI.Toast: {value1} is a function`, 0)
			end
		end
		if Spec.isPresented ~= nil and not OverlayPartsModule.bound(p1, Spec.isPresented, "boolean") then
			error("Facet UI.Toast: isPresented is the caller's boolean fact", 0)
		end
		local NoHasAction: boolean = not HasAction or (Spec.closeButton ~= false or Spec.duration ~= nil)
		
		if Spec.isPresented ~= nil and NoHasAction and Spec.onPresentedChange == nil then
			error("Facet UI.Toast: a bound toast that can end itself (a duration or a close button) needs onPresentedChange. A read-only one has an action, closeButton = false and no duration.", 0)
		end
		if Spec.isPresented == nil and Spec.onPresentedChange ~= nil then
			error("Facet UI.Toast: onPresentedChange answers isPresented; give both or neither", 0)
		end
	end
	
	local function limitedSlide(p4, CellResult, Callback)
		-- upvalues: p1 (copy), OverlayArrivalModule (upval), Runtime (copy)
		local Toast = p1.motionTiming("toast")
		local ReadyResult = OverlayArrivalModule.ready(p4)
		local Present = p1.motionEase("present")
		local Fade = p1.motionEase("fade")
		
		local function shown(Callback): number
			-- upvalues: p4 (copy), ReadyResult (copy), CellResult (copy)
			return if p4 and Callback(p4.exiting) or ReadyResult and not Callback(ReadyResult) then 0 elseif Callback(CellResult) then 1 else 0
		end
		
		local function seconds(_)
			-- upvalues: Callback (copy), p1 (upval), p4 (copy), Toast (copy)
			return if Callback() == "limited" then p1.metric("motion.reducedFade") elseif p4 and p4.exiting:peek() then Toast.exit else Toast.enter
		end
		
		local TweenResult = Runtime.tween(shown, {
			seconds = seconds,
			ease = function(p5)
				-- upvalues: Callback (copy), Fade (copy), Present (copy)
				return if Callback() == "limited" then Fade(p5) else Present(p5)
			end
		})
		local TweenResult1 = Runtime.tween(shown, { seconds = seconds, ease = p1.motionEase("trail") })
		
		return TweenResult, function(Callback1, Callback2)
			-- upvalues: Callback (copy), TweenResult (copy), TweenResult1 (copy)
			local CallbackResult = Callback(Callback1)
			
			return if CallbackResult == "limited" then Callback1(TweenResult) elseif CallbackResult == "normal" then Callback1(TweenResult1) else Callback2(Callback1)
		end
	end
	
	local function passiveRow(p4, p5, p6)
		-- upvalues: p1 (copy), MotionModule (upval), ReadFunction1 (copy), TypesUDim2 (copy), TypesEnum (copy), TextMeasureModule (upval), p3 (copy), Host (copy), TypesUDim (copy), Compose (copy), limitedSlide (copy), TypesVector2 (copy), ReadFunction (copy), VisualTargetModule (upval), OverlayArrivalModule (upval)
		local Spec = p4.spec
		local IsBottom = Spec.position == "bottom"
		local IsHug = Spec.width == "hug"
		local HasContent: boolean = IsHug and Spec.content ~= nil
		local LayoutSizeResult = if HasContent then p1.layoutSize(p5.layer) else nil
		local NaturalResult = nil
		local LevelResult = MotionModule.level(p1)
		local ContentResult = nil
		
		if Spec.content then
			ContentResult = Spec.content()
		else
			local Message = Spec.message
			local Message1 = p1.text({
				Name = "Message",
				TextWrapped = true,
				LayoutOrder = 1,
				Text = function(p7)
					-- upvalues: ReadFunction1 (upval), Message (copy)
					return ReadFunction1(Message, p7) or ""
				end,
				Size = TypesUDim2.fromScale(1, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y
			})
			
			if IsHug then
				NaturalResult = TextMeasureModule.natural(p1, Message1)
			end
			ContentResult = Message1
			
			if Spec.icon then
				p3.attach(Message1, {
					Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
				})
				ContentResult = Host.Frame({
					Name = "Body",
					BackgroundTransparency = 1,
					Size = TypesUDim2.fromScale(1, 0),
					AutomaticSize = TypesEnum.AutomaticSize.Y,
					Host.UIListLayout({
						FillDirection = TypesEnum.FillDirection.Horizontal,
						VerticalAlignment = TypesEnum.VerticalAlignment.Center,
						SortOrder = TypesEnum.SortOrder.LayoutOrder,
						Padding = TypesUDim.new(0, 8)
					}),
					p1.icon(Spec.icon, { Name = "Icon", LayoutOrder = 0 }),
					Message1
				})
			end
		end
		local CellResult = Compose.cell(false)
		local LimitedSlideResult, LimitedSlideResult2 = limitedSlide(p6, CellResult, LevelResult)
		
		local function amount(Callback)
			-- upvalues: LevelResult (copy), p6 (copy), LimitedSlideResult (copy)
			local LevelResultResult = LevelResult(Callback)
			
			return if LevelResultResult == "normal" then Callback(LimitedSlideResult) elseif LevelResultResult == "none" and p6 and Callback(p6.exiting) then 0 else 1
		end
		
		local config = {
			Name = "ToastRow",
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Active = false,
			Interactable = false,
			ZIndex = 70,
			AutomaticSize = if HasContent then TypesEnum.AutomaticSize.XY else TypesEnum.AutomaticSize.Y,
			Size = if HasContent then TypesUDim2.fromOffset(0, 0) else TypesUDim2.fromScale(1, 0),
			ContentResult
		}
		config[#config + 1] = p1.padding(12, 8)
		config[#config + 1] = p1.corner()
		
		if IsHug then
			config[#config + 1] = Host.UISizeConstraint({
				Name = "WidthCap",
				MaxSize = function(Callback)
					-- upvalues: LayoutSizeResult (copy), TypesVector2 (upval), ReadFunction (upval), p1 (upval), Spec (copy), NaturalResult (ref)
					if LayoutSizeResult then
						return TypesVector2.new(math.max(0, (math.min(560, Callback(LayoutSizeResult).X - 32))), 1e999)
					else
						local ReadResult = ReadFunction(p1.config.theme, Callback)
						local Panel = if ReadResult and ReadResult.chrome then ReadResult.chrome.panel else nil
						local ContentInsets = if Panel then Panel.contentInsets else nil
						local NewLargest = math.max(12, ContentInsets and ContentInsets.left or 0) + math.max(12, ContentInsets and ContentInsets.right or 0) + (if Spec.icon then p1.controlSize(nil, "iconSize", Callback) + 8 else 0)
						
						return TypesVector2.new(math.min(560, if NaturalResult then Callback(NaturalResult).X + NewLargest else 560), 1e999)
					end
				end
			})
		end
		local Snackbar = p1.styled(p1.fade(config), "snackbar")
		VisualTargetModule.bind(Compose, p4.root, Snackbar)
		p1.styled(Snackbar, "panel")
		p1.styled(Snackbar, "floating")
		p3.skin(Snackbar, "panel")
		p1.fadeTo(Snackbar, function(Callback): number
			-- upvalues: OverlayArrivalModule (upval), p6 (copy), Spec (copy), LevelResult (copy), LimitedSlideResult2 (copy), amount (copy)
			local ReadyResult = OverlayArrivalModule.ready(p6)
			
			return if ReadyResult and not Callback(ReadyResult) then 1 elseif Spec.fade == false and LevelResult(Callback) == "normal" then 0 else 1 - LimitedSlideResult2(Callback, amount)
		end)
		
		if Spec.content then
			for _, Gui in Snackbar:GetDescendants() do
				if Gui:IsA("GuiObject") then
					Gui.Selectable = false
				end
			end
		end
		local Slot = Host.Frame("ToastSlot")({
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromScale(1, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y,
			LayoutOrder = p4.order,
			(Host.Frame("ToastLane")({
				BackgroundTransparency = 1,
				Size = TypesUDim2.fromScale(1, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				AnchorPoint = function(Callback)
					-- upvalues: TypesVector2 (upval), IsBottom (copy), LevelResult (copy), p6 (copy), LimitedSlideResult (copy)
					local NewFunction = TypesVector2.new
					local v3 = 0
					local v4 = nil
					
					if IsBottom then
						v4 = 0
					else
						local LevelResultResult = LevelResult(Callback)
						v4 = 1 - (if LevelResultResult == "normal" then Callback(LimitedSlideResult) elseif LevelResultResult == "none" and p6 and Callback(p6.exiting) then 0 else 1)
					end
					return NewFunction(v3, v4)
				end,
				Position = function(Callback)
					-- upvalues: LevelResult (copy), p6 (copy), LimitedSlideResult (copy), p5 (copy), TypesUDim2 (upval), IsBottom (copy)
					local LevelResultResult = LevelResult(Callback)
					local ScaledCallbackResult = (1 - (if LevelResultResult == "normal" then Callback(LimitedSlideResult) elseif LevelResultResult == "none" and p6 and Callback(p6.exiting) then 0 else 1)) * (8 + Callback(p5.inset))
					local NewFunction = TypesUDim2.new
					local v3 = 0
					local v4 = 0
					local v5 = nil
					
					if IsBottom then
						local LevelResultResult1 = LevelResult(Callback)
						v5 = 1 - (if LevelResultResult1 == "normal" then Callback(LimitedSlideResult) elseif LevelResultResult1 == "none" and p6 and Callback(p6.exiting) then 0 else 1)
					else
						v5 = 0
					end
					return NewFunction(v3, v4, v5, if IsBottom then ScaledCallbackResult else -ScaledCallbackResult)
				end,
				Host.UIListLayout({
					SortOrder = TypesEnum.SortOrder.LayoutOrder,
					HorizontalAlignment = TypesEnum.HorizontalAlignment.Center
				}),
				Snackbar
			}))
		})
		CellResult:set(true)
		p4.slot = Slot
		Compose.cleanup(function()
			-- upvalues: p4 (copy), Slot (copy)
			if p4.slot == Slot then
				p4.slot = nil
			end
		end)
		Slot:SetAttribute("FacetArrivalGroup", true)
		
		return Slot
	end
	
	local function actionRow(p7, p8, p9)
		-- upvalues: p1 (copy), ReadFunction1 (copy), TypesUDim2 (copy), TypesEnum (copy), Compose (copy), p3 (copy), Host (copy), p2 (copy), OverlayPartsModule (upval), ReadFunction (copy), TypesUDim (copy), TypesVector2 (copy), finish (copy), MotionModule (upval), limitedSlide (copy), Runtime (copy), VisualTargetModule (upval), self (copy), self1 (copy), ReservationsModule (upval), GuiService (copy), v1 (ref)
		local Spec = p7.spec
		local Layer = p8.layer
		local AbsolutePositionResult = p1.observe.AbsolutePosition(Layer)
		local IsCloseButton = Spec.closeButton ~= false
		local MessageMeasure = p1.text({
			Name = "MessageMeasure",
			TextWrapped = false,
			TextTransparency = 1,
			Visible = false,
			Text = function(p10)
				-- upvalues: ReadFunction1 (upval), Spec (copy)
				return ReadFunction1(Spec.message, p10) or ""
			end,
			Size = TypesUDim2.fromOffset(0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.None
		})
		local LayoutUnitResult = p1.layoutUnit(MessageMeasure)
		local LayoutSizeResult = p1.layoutSize(Layer, LayoutUnitResult)
		
		local function _(Callback): number
			-- upvalues: p1 (upval), LayoutSizeResult (copy)
			return (math.max(0, (math.min(p1.metric("controls.snackbar.maxWidth", Callback), Callback(LayoutSizeResult).X - 32))))
		end
		
		local LayoutBoundsResult = p1.layoutBounds(MessageMeasure, LayoutUnitResult)
		local CellResult = Compose.cell(0)
		
		local function chrome(p10): number
			-- upvalues: p1 (upval), Spec (copy), IsCloseButton (copy)
			local ReadResult = p1.read(p1.config.theme, p10)
			local Panel = if ReadResult and ReadResult.chrome then ReadResult.chrome.panel else nil
			local ContentInsets = if Panel then Panel.contentInsets else nil
			
			return math.max(8, ContentInsets and ContentInsets.left or 0) + math.max(8, ContentInsets and ContentInsets.right or 0) + (if Spec.icon then p1.controlSize(nil, "iconSize", p10) + 8 else 0) + (if IsCloseButton then 52 else 0)
		end
		
		local FormulaResult = Compose.formula(function(Callback): boolean
			-- upvalues: LayoutBoundsResult (copy), CellResult (copy), chrome (copy), p1 (upval), LayoutSizeResult (copy)
			return math.ceil(Callback(LayoutBoundsResult).X) + Callback(CellResult) + 8 + chrome(Callback) <= math.max(0, (math.min(p1.metric("controls.snackbar.maxWidth", Callback), Callback(LayoutSizeResult).X - 32)))
		end)
		local Message = p1.text({
			Name = "Message",
			TextWrapped = true,
			LayoutOrder = 1,
			Text = function(p10)
				-- upvalues: ReadFunction1 (upval), Spec (copy)
				return ReadFunction1(Spec.message, p10) or ""
			end,
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y
		})
		p3.attach(Message, {
			Host.UIFlexItem({
				FlexMode = function(Callback)
					-- upvalues: FormulaResult (copy), TypesEnum (upval)
					return if Callback(FormulaResult) then TypesEnum.UIFlexMode.Fill else TypesEnum.UIFlexMode.None
				end
			})
		})
		local v3 = assert(Spec.action)
		local v4 = p2.Button("Action")({
			LayoutOrder = 2,
			label = v3.label,
			onActivate = function()
				-- upvalues: p7 (copy), Spec (copy), v3 (copy), OverlayPartsModule (upval), ReadFunction (upval)
				if p7.state:peek() ~= "shown" then return end
				if Spec.isPresented == nil then
					OverlayPartsModule.call(v3.onActivate, function()
						-- upvalues: p7 (upval)
						local Stack = p7.stack
						local Id = p7.id
						
						if Stack and Id then
							Stack.schedule.dismiss(Id, "action")
						end
					end)
					
					return
				else
					p7.pending = "action"
					OverlayPartsModule.call(v3.onActivate, function()
						-- upvalues: p7 (copy), ReadFunction (upval)
						if p7.id ~= nil and (not p7.torn and (p7.spec.isPresented == nil or ReadFunction(p7.spec.isPresented) == true)) then
							p7.pending = nil
						end
					end)
				end
			end
		})
		local LayoutSizeResult1 = p1.layoutSize(v4, LayoutUnitResult)
		Compose.watch(function(Callback)
			-- upvalues: CellResult (copy), LayoutSizeResult1 (copy)
			CellResult:set(Callback(LayoutSizeResult1).X)
		end)
		local config = {
			Name = "Snack",
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			ZIndex = 60,
			AnchorPoint = TypesVector2.new(0.5, 1),
			AutomaticSize = TypesEnum.AutomaticSize.Y,
			Size = function(Callback)
				-- upvalues: TypesUDim2 (upval), p1 (upval), LayoutSizeResult (copy)
				return TypesUDim2.fromOffset(math.max(0, (math.min(p1.metric("controls.snackbar.maxWidth", Callback), Callback(LayoutSizeResult).X - 32))), 0)
			end,
			p1.padding(8, 8),
			p1.corner(),
			Host.UIListLayout({
				FillDirection = TypesEnum.FillDirection.Horizontal,
				VerticalAlignment = TypesEnum.VerticalAlignment.Center,
				SortOrder = TypesEnum.SortOrder.LayoutOrder,
				Padding = TypesUDim.new(0, 8)
			}),
			Host.Frame({
				Name = "Body",
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = TypesUDim2.new(0, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill }),
				Host.UIListLayout({
					FillDirection = function(Callback)
						-- upvalues: FormulaResult (copy), TypesEnum (upval)
						return if Callback(FormulaResult) then TypesEnum.FillDirection.Horizontal else TypesEnum.FillDirection.Vertical
					end,
					HorizontalAlignment = TypesEnum.HorizontalAlignment.Right,
					VerticalAlignment = TypesEnum.VerticalAlignment.Center,
					SortOrder = TypesEnum.SortOrder.LayoutOrder,
					Padding = TypesUDim.new(0, 8)
				}),
				Message,
				MessageMeasure,
				v4
			})
		}
		
		if Spec.icon then
			config[#config + 1] = p1.icon(Spec.icon, { Name = "Icon", LayoutOrder = 0 })
		end
		if IsCloseButton then
			config[#config + 1] = p2.Button("Close")({
				name = "Close",
				icon = "close",
				LayoutOrder = 3,
				Size = TypesUDim2.fromOffset(44, 44),
				AutomaticSize = TypesEnum.AutomaticSize.None,
				onActivate = function()
					-- upvalues: finish (upval), p7 (copy)
					finish(p7, "close")
				end
			})
		end
		local Snackbar = p1.styled(p1.fade(config), "snackbar")
		p1.styled(Snackbar, "panel")
		p1.styled(Snackbar, "floating")
		p3.skin(Snackbar, "panel")
		local LevelResult = MotionModule.level(p1)
		local CellResult1 = Compose.cell(false)
		local LimitedSlideResult, LimitedSlideResult2 = limitedSlide(p9, CellResult1, LevelResult)
		
		local function amount(Callback)
			-- upvalues: LevelResult (copy), p9 (copy), LimitedSlideResult (copy)
			local LevelResultResult = LevelResult(Callback)
			
			return if LevelResultResult == "normal" then Callback(LimitedSlideResult) elseif LevelResultResult == "none" and p9 and Callback(p9.exiting) then 0 else 1
		end
		
		p1.fadeTo(Snackbar, function(p10): number
			-- upvalues: LimitedSlideResult2 (copy), amount (copy)
			return 1 - LimitedSlideResult2(p10, amount)
		end)
		local AbsoluteSizeResult = p1.observe.AbsoluteSize(Snackbar)
		Runtime.decorate(Snackbar, {
			AnchorPoint = function(p10)
				-- upvalues: TypesVector2 (upval), amount (copy)
				return TypesVector2.new(0.5, amount(p10))
			end,
			Position = function(Callback)
				-- upvalues: LevelResult (copy), p9 (copy), LimitedSlideResult (copy), p8 (copy), TypesUDim2 (upval)
				local LevelResultResult = LevelResult(Callback)
				
				return TypesUDim2.new(0.5, 0, 1, -16 - Callback(p8.inset) + (1 - (if LevelResultResult == "normal" then Callback(LimitedSlideResult) elseif LevelResultResult == "none" and p9 and Callback(p9.exiting) then 0 else 1)) * (16 + Callback(p8.inset)))
			end,
			Interactable = function(Callback): boolean
				-- upvalues: p9 (copy)
				return not (p9 and Callback(p9.exiting))
			end
		})
		local GuiStateResult = p1.observe.GuiState(Snackbar)
		Compose.watch(function(Callback)
			-- upvalues: p7 (copy), GuiStateResult (copy), TypesEnum (upval)
			p7.hovered = Callback(GuiStateResult) == TypesEnum.GuiState.Hover
		end)
		p7.row = Snackbar
		VisualTargetModule.bind(Compose, p7.root, Snackbar)
		self[Snackbar] = true
		self1[Snackbar] = true
		local AbsolutePositionResult1 = p1.observe.AbsolutePosition(Snackbar)
		Compose.watch(function(Callback)
			-- upvalues: AbsoluteSizeResult (copy), AbsolutePositionResult (copy), LayoutSizeResult (copy), ReservationsModule (upval), Layer (copy), Snackbar (copy), AbsolutePositionResult1 (copy)
			local CallbackResult = Callback(AbsoluteSizeResult)
			local CallbackResult1 = Callback(AbsolutePositionResult)
			Callback(LayoutSizeResult)
			
			if CallbackResult.Y > 0 then
				ReservationsModule.set(Layer, Snackbar, "bottom", Callback(AbsolutePositionResult1).Y - CallbackResult1.Y, CallbackResult.Y)
			end
		end)
		Compose.cleanup(function()
			-- upvalues: GuiService (upval), p3 (upval), p1 (upval), Snackbar (copy), v1 (upval), ReservationsModule (upval), Layer (copy), self (upval), p7 (copy)
			if GuiService and p3.within(p1.selection.get(), Snackbar) then
				p1.selection.set(if v1 and v1.Parent then v1 else nil)
			end
			ReservationsModule.clear(Layer, Snackbar)
			self[Snackbar] = nil
			
			if p7.row == Snackbar then
				p7.row = nil
			end
		end)
		local ObserveResult = if GuiService and GuiService.GetPropertyChangedSignal then p1.selection.observe() else Compose.cell(nil)
		p1.action(Snackbar, "ToastCancel", { TypesEnum.KeyCode.ButtonB, TypesEnum.KeyCode.Escape }, function(Callback)
			-- upvalues: ObserveResult (copy), p3 (upval), Snackbar (copy)
			local CallbackResult = Callback(ObserveResult)
			
			return CallbackResult ~= nil and p3.within(CallbackResult, Snackbar)
		end, function()
			-- upvalues: v1 (upval), finish (upval), p7 (copy), GuiService (upval), p1 (upval)
			local v5 = v1
			finish(p7, "cancel")
			
			if GuiService and v5 and v5.Parent and p1.selection.get() ~= v5 then
				p1.selection.set(v5)
			end
		end, { priority = 2500 })
		local v5 = v1
		local FirstSelectableResult = p3.firstSelectable(Snackbar)
		
		if v5 and FirstSelectableResult and typeof(v5.NextSelectionDown) ~= "Instance" then
			v5.NextSelectionDown = FirstSelectableResult
			
			local function unlink()
				-- upvalues: v5 (copy), FirstSelectableResult (copy), Runtime (upval)
				if v5.NextSelectionDown == FirstSelectableResult then
					Runtime.host.render.setProperty(v5, "NextSelectionDown", nil)
				end
			end
			
			Compose.watch(function(Callback)
				-- upvalues: ObserveResult (copy), v5 (copy), p3 (upval), Snackbar (copy), FirstSelectableResult (copy), Runtime (upval)
				local CallbackResult = Callback(ObserveResult)
				
				if CallbackResult ~= nil and CallbackResult ~= v5 and not p3.within(CallbackResult, Snackbar) and v5.NextSelectionDown == FirstSelectableResult then
					Runtime.host.render.setProperty(v5, "NextSelectionDown", nil)
				end
			end)
			Compose.cleanup(unlink)
		end
		local ParentResult = p1.observe.Parent(Snackbar)
		Compose.watch(function(Callback)
			-- upvalues: ParentResult (copy), CellResult1 (copy)
			if Callback(ParentResult) then
				CellResult1:set(true)
			end
		end)
		
		return Snackbar
	end
	
	local _ = function()
		-- upvalues: GuiService (copy), p1 (copy), Compose (copy), self (copy), p3 (copy), v1 (ref)
		if GuiService and GuiService.GetPropertyChangedSignal then
			local ObserveResult = p1.selection.observe()
			Compose.watch(function(Callback)
				-- upvalues: ObserveResult (copy), self (upval), p3 (upval), v1 (upval)
				local CallbackResult = Callback(ObserveResult)
				
				if CallbackResult == nil then return end
				for i in self do
					if p3.within(CallbackResult, i) then return end
				end
				v1 = CallbackResult
			end)
		end
	end
	
	p2.Toast = p1.construct("Toast", function(Spec)
		-- upvalues: validate (copy), MotionModule (upval), p1 (copy), GuiService (copy), Compose (copy), self (copy), p3 (copy), v1 (ref), list (upval), TypesUDim2 (copy), Host (copy), VisualTargetModule (upval), status (copy), ReadFunction (copy), push (copy), stackFor (copy), Runtime (copy), t (copy), CoreModule (upval), actionRow (copy), passiveRow (copy)
		validate(Spec)
		local HasAction = Spec.action ~= nil
		local LevelResult = MotionModule.level(p1)
		
		if HasAction and GuiService and GuiService.GetPropertyChangedSignal then
			local ObserveResult = p1.selection.observe()
			Compose.watch(function(Callback)
				-- upvalues: ObserveResult (copy), self (upval), p3 (upval), v1 (upval)
				local CallbackResult = Callback(ObserveResult)
				
				if CallbackResult == nil then return end
				for i in self do
					if p3.within(CallbackResult, i) then return end
				end
				v1 = CallbackResult
			end)
		end
		local PropsResult = p1.props(Spec, list, {
			Name = "Toast",
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromOffset(0, 0)
		})
		local Visible = PropsResult.Visible
		PropsResult.Visible = false
		local FrameResult = Host.Frame(PropsResult)
		VisualTargetModule.create(Compose, FrameResult)
		FrameResult:SetAttribute("FacetOverlayPlaceholder", true)
		local config = {
			slot = nil,
			order = 0,
			stack = nil,
			id = nil,
			pending = nil,
			torn = false,
			hovered = false,
			row = nil,
			spec = Spec,
			state = Compose.cell(""),
			root = FrameResult
		}
		status(config, "idle")
		local NoIsPresented: boolean = not config.torn and (config.spec.isPresented == nil or ReadFunction(config.spec.isPresented) == true)
		local CellResult = Compose.cell(false)
		
		local function _()
			-- upvalues: NoIsPresented (ref), config (copy), push (upval)
			if NoIsPresented and config.stack and config.id == nil then
				NoIsPresented = false
				push(config)
			end
		end
		
		local function locate()
			-- upvalues: FrameResult (copy), p3 (upval), config (copy), stackFor (upval), HasAction (copy), Spec (copy), CellResult (copy), NoIsPresented (ref), push (upval)
			local ParentResult = if FrameResult:FindFirstAncestorWhichIsA("LayerCollector") then p3.parent(FrameResult) else nil
			
			if config.stack == nil and ParentResult then
				local StackForResult = stackFor(ParentResult, if HasAction then "action" else Spec.position or "top")
				config.stack = StackForResult
				StackForResult.users += 1
				CellResult:set(true)
				
				if NoIsPresented and config.stack and config.id == nil then
					NoIsPresented = false
					push(config)
				end
			end
		end
		
		Runtime.connect(FrameResult, "AncestryChanged", locate)
		locate()
		
		if Spec.isPresented ~= nil then
			local NoIsPresented1: boolean = NoIsPresented
			Compose.watch(function(p7)
				-- upvalues: ReadFunction (upval), Spec (copy), NoIsPresented1 (ref), NoIsPresented (ref), config (copy), push (upval)
				local IsReadResult = ReadFunction(Spec.isPresented, p7) == true
				
				if IsReadResult == NoIsPresented1 then return end
				NoIsPresented1 = IsReadResult
				NoIsPresented = IsReadResult
				
				if not IsReadResult then
					local Pending = config.pending or "cancel"
					local Stack = config.stack
					local Id = config.id
					
					if Stack and Id then
						Stack.schedule.dismiss(Id, Pending)
					end
				elseif NoIsPresented and config.stack and config.id == nil then
					NoIsPresented = false
					push(config)
					
					return
				end
			end)
		end
		Compose.cleanup(function()
			-- upvalues: config (copy), NoIsPresented (ref), Spec (copy), t (upval), CoreModule (upval)
			config.torn = true
			NoIsPresented = false
			local Manual: string = if Spec.isPresented == nil then "manual" else "cancel"
			local Stack = config.stack
			local Id = config.id
			
			if Stack and Id then
				Stack.schedule.dismiss(Id, Manual)
			end
			local Stack1 = config.stack
			
			if Stack1 then
				Stack1.users -= 1
				
				if Stack1.users == 0 and not Stack1.retained then
					local Entry = t[Stack1.layer]
					
					if Entry and Entry[Stack1.lane] == Stack1 then
						Entry[Stack1.lane] = nil
					end
					local Owner = Stack1.owner
					Stack1.owner = nil
					
					if Owner and not CoreModule.owner.isDisposed(Owner) then
						CoreModule.owner.dispose(Owner)
					end
				end
			end
		end)
		p3.attach(FrameResult, {
			Compose.show(CellResult, function()
				-- upvalues: p3 (upval), FrameResult (copy), config (copy), ReadFunction (upval), Visible (copy), HasAction (copy), actionRow (upval), passiveRow (upval), LevelResult (copy), Compose (upval), p1 (upval), Runtime (upval)
				return p3.overlay(FrameResult, function(Callback): boolean
					-- upvalues: config (upval), ReadFunction (upval), Visible (upval)
					return Callback(config.state) == "shown" and ReadFunction(Visible, Callback) ~= false
				end, function(p7)
					-- upvalues: config (upval), HasAction (upval), actionRow (upval), passiveRow (upval)
					local v3 = assert(config.stack)
					
					return if HasAction then actionRow(config, v3, p7) else passiveRow(config, v3, p7)
				end, {
					parent = function()
						-- upvalues: config (upval)
						return if config.stack then config.stack.container else nil
					end,
					presence = {
						exit = function()
							-- upvalues: LevelResult (upval), Compose (upval), p1 (upval), Runtime (upval)
							local LevelResultResult = LevelResult()
							
							return if LevelResultResult == "none" then { completed = Compose.cell(true) } else {
								completed = Runtime.timeline({
									duration = if LevelResultResult == "limited" then p1.metric("motion.reducedFade") else p1.metric("motion.toast.exit")
								}).completed
							}
						end
					}
				})
			end)
		})
		
		return FrameResult
	end)
end