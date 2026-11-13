local CoreModule = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./layout_types")
local _ = require("./overlay_types")
local LayoutKitModule = require("./layout_kit")
local ReducedFunction = require("./motion").reduced
local CompositionResolveModule = require("./composition_resolve")
local _ = require("./control_types")
local _ = require("./layout_props")
local PresentationReadinessModule = require("./presentation_readiness")
local RegionPresenceModule = require("./region_presence")
local ExtentMatchModule = require("./extent_match")
local ReservationsModule = require("./reservations")
local PreparationModule = require("./preparation")

local function regionsKey(List): string
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, `{value.zone}:{value.rank}:{value.mayDrop}:{value.leading == true}:{value.trailing == true}`)
		
		for _, size in value.sizes do
			table.insert(List1, `{size.x}x{size.y}`)
		end
		local Hangs = value.hangs
		
		if Hangs then
			table.insert(List1, "h")
			
			for _, hang in Hangs do
				table.insert(List1, (tostring(hang)))
			end
		end
		table.insert(List1, "/")
	end
	return table.concat(List1, ",")
end

local list = { "trailing", "bottom", "leading" }
local Vectors = { { X = 358, Y = 812 }, { X = 812, Y = 358 } }

local function _(p1, p2, p3)
	return if p3 == 3 then -p1.hang - (if p2 == 2 then p1.bottom else 0) elseif p3 == 1 and p2 == 2 then p1.top else 0
end

local _ = function(p1, p2, p3)
	return if p2 == 2 then if p3 == 1 then p1.leanTop elseif p3 == 3 then p1.leanBottom else 0 else 0
end

return function(p1, p2)
	-- upvalues: LayoutKitModule (copy), CoreModule (copy), CompositionResolveModule (copy), ReducedFunction (copy), list (copy), RegionPresenceModule (copy), PreparationModule (copy), PresentationReadinessModule (copy), ExtentMatchModule (copy), regionsKey (copy), Vectors (copy), ReservationsModule (copy)
	local Host = p1.Host
	local ReadFunction = p1.read
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local OfResult = LayoutKitModule.of(p1)
	local TypesEnum = p1.types.Enum
	local TypesUDim = p1.types.UDim
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local self = setmetatable({}, { __mode = "k" })
	local LayoutSizeFunction = p1.layoutSize
	
	local function overhang(Frame: Frame, LayoutUnitResult)
		-- upvalues: Compose (copy), CoreModule (upval), OfResult (copy), p1 (copy), Runtime (copy)
		local CellResult = Compose.cell(0)
		local v1 = assert(Compose.currentOwner())
		local Frames = {}
		local v2 = nil
		local NextFrameResult = nil
		
		local function measure()
			-- upvalues: NextFrameResult (ref), CoreModule (upval), v1 (copy), Frame (copy), Frames (copy), CellResult (copy), LayoutUnitResult (copy)
			NextFrameResult = nil
			
			if CoreModule.owner.isDisposed(v1) then return end
			local NewY = Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y
			local Largest = 0
			
			for frame in Frames do
				local IsYAbove = frame.AbsoluteSize.Y > 0
				local Frame1 = frame
				while IsYAbove and (Frame1 and Frame1 ~= Frame) do
					if Frame1:IsA("GuiObject") and not Frame1.Visible then
						IsYAbove = false
					end
					Frame1 = Frame1.Parent
				end
				if IsYAbove then
					Largest = math.max(Largest, frame.AbsolutePosition.Y + frame.AbsoluteSize.Y - NewY)
				end
			end
			CellResult:set(Largest / LayoutUnitResult:peek())
		end
		
		local function _()
			-- upvalues: OfResult (upval), measure (copy), NextFrameResult (ref)
			if OfResult.frameless() then
				measure()
				
				return
			end
			if NextFrameResult == nil then
				NextFrameResult = OfResult.nextFrame(measure)
			end
		end
		
		local function track()
			-- upvalues: CoreModule (upval), v1 (copy), v2 (ref), Frames (copy), CellResult (copy), Compose (upval), p1 (upval), Frame (copy), Runtime (upval), track (copy), LayoutUnitResult (copy), OfResult (upval), measure (copy), NextFrameResult (ref)
			if CoreModule.owner.isDisposed(v1) then return end
			if v2 then
				CoreModule.owner.dispose(v2)
				v2 = nil
			end
			if next(Frames) == nil then
				CellResult:set(0)
				
				return
			else
				local Child = CoreModule.owner.createChild(v1)
				v2 = Child
				Compose.withOwner(Child, function()
					-- upvalues: p1 (upval), Frame (upval), Frames (upval), Runtime (upval), track (upval), Compose (upval), LayoutUnitResult (upval), OfResult (upval), measure (upval), NextFrameResult (upval)
					local List = {}
					local List1 = {}
					
					local function _(p3)
						-- upvalues: List (copy), p1 (upval)
						table.insert(List, p1.observe.AbsolutePosition(p3))
						table.insert(List, p1.observe.AbsoluteSize(p3))
					end
					
					table.insert(List, p1.observe.AbsolutePosition(Frame))
					table.insert(List, p1.observe.AbsoluteSize(Frame))
					
					for frame in Frames do
						table.insert(List, p1.observe.AbsolutePosition(frame))
						table.insert(List, p1.observe.AbsoluteSize(frame))
						local Gui = frame
						while Gui and Gui ~= Frame do
							if Gui:IsA("GuiObject") then
								table.insert(List1, p1.observe.Visible(Gui))
							end
							Gui = Gui.Parent
						end
						Runtime.connect(frame, "AncestryChanged", function(Object)
							-- upvalues: Frame (upval), track (upval)
							if Object:IsDescendantOf(Frame) then
								track()
							end
						end)
					end
					Compose.watch(function(Callback: (any) -> ())
						-- upvalues: LayoutUnitResult (upval), List (copy), List1 (copy), OfResult (upval), measure (upval), NextFrameResult (upval)
						Callback(LayoutUnitResult)
						
						for _, value in List do
							Callback(value)
						end
						for _, value1 in List1 do
							Callback(value1)
						end
						if OfResult.frameless() then
							measure()
							
							return
						end
						if NextFrameResult == nil then
							NextFrameResult = OfResult.nextFrame(measure)
						end
					end)
				end)
			end
		end
		
		for _, Gui in Frame:GetDescendants() do
			if Gui:IsA("GuiObject") and Gui:HasTag("facet-button-outside") then
				Frames[Gui] = true
			end
		end
		Runtime.connect(Frame, "DescendantAdded", function(Gui)
			-- upvalues: Frames (copy), track (copy)
			if not Frames[Gui] and Gui:IsA("GuiObject") and Gui:HasTag("facet-button-outside") then
				Frames[Gui] = true
				track()
			end
		end)
		Runtime.connect(Frame, "DescendantRemoving", function(Key)
			-- upvalues: Frames (copy), track (copy)
			if Frames[Key] then
				Frames[Key] = nil
				track()
			end
		end)
		Compose.cleanup(function()
			-- upvalues: NextFrameResult (ref)
			if NextFrameResult then
				NextFrameResult()
				NextFrameResult = nil
			end
		end)
		track()
		
		return CellResult
	end
	
	local function mark(p3, Label, Icon, Name)
		-- upvalues: p2 (copy)
		return p2.Badge(p3)({ label = Label, icon = Icon, name = Label or Name })
	end
	
	p2.Region = p1.construct("Region", function(Frame)
		-- upvalues: CompositionResolveModule (upval), Compose (copy), p1 (copy), ReducedFunction (upval), Host (copy), Runtime (copy), TypesUDim2 (copy), TypesEnum (copy), p2 (copy), TypesVector2 (copy), OfResult (copy), LayoutSizeFunction (copy), overhang (copy), CoreModule (upval), list (upval), RegionPresenceModule (upval), ReadFunction (copy), self (copy)
		local Zone = Frame.zone
		local Rank: number = Frame.rank
		assert(type(Zone) == "string" and (Zone == "action" or CompositionResolveModule.CELLS[Zone] ~= nil), "Facet Region zone must be topLeft, top, topRight, left, center, right, bottomLeft, bottom, bottomRight, topbar or action")
		assert(type(Rank) == "number" and Rank >= 1 and Rank % 1 == 0, "Facet Region rank must be a whole number, 1 or more")
		assert(Frame.mayDrop == nil or type(Frame.mayDrop) == "boolean", "Facet Region mayDrop must be a boolean")
		assert(Frame.form == nil or Compose.isValue(Frame.form) and type(Frame.form.set) == "function", "Facet Region form must be a writable cell")
		assert(Frame.expand == nil or type(Frame.expand) == "function", "Facet Region expand must be a function that returns the richest content")
		assert(Frame.reveal == nil or type(Frame.reveal) == "boolean", "Facet Region reveal must be a boolean")
		assert(Frame.label == nil or type(Frame.label) == "string", "Facet Region label must be a string")
		assert(Frame.icon == nil or type(Frame.icon) == "string", "Facet Region icon must be an icon name")
		local Label = if Frame.label == "" then nil else Frame.label
		local Icon = if Frame.icon and p1.iconShows(Frame.icon) then Frame.icon else nil
		assert(Frame.leading == nil or type(Frame.leading) == "boolean" and (Frame.leading == false or Zone == "topbar"), "Facet Region leading must be a boolean, and only a topbar region can lead")
		assert(Frame.trailing == nil or type(Frame.trailing) == "boolean" and (Frame.trailing == false or Zone == "topbar"), "Facet Region trailing must be a boolean, and only a topbar region can trail")
		assert(not (Frame.leading and Frame.trailing), "Facet Region cannot both lead and trail")
		local Form = Frame.form or Compose.cell(1)
		Form:set(1)
		local v3 = Compose.selector(Form)(0)
		local ReducedResult = ReducedFunction(p1)
		local Flag = false
		local List = {}
		local Object = Host.UIScale("Pop")({})
		Object:AddTag("facet-region-pop")
		local SchedulerResult = if Runtime.host.frames then Runtime.scheduler() else nil
		
		local function popIn()
			-- upvalues: SchedulerResult (copy), Flag (ref), Object (copy), p1 (upval), List (copy)
			if SchedulerResult ~= nil then
				Flag = true
				Object.Name = "Rest"
				SchedulerResult.replace("rest", 0, function()
					-- upvalues: Object (upval)
					Object.Name = "Pop"
				end)
				SchedulerResult.replace("settle", p1.metric("motion.durations.regionPop"), function()
					-- upvalues: Flag (upval), List (upval)
					Flag = false
					
					for _, value in List do
						value()
					end
				end)
				
				return
			end
		end
		
		local CellResult = Compose.cell(false)
		local CellResult1 = Compose.cell(0)
		local PropsResult = p1.props(Frame, {
			"zone", "rank", "mayDrop", "form", "expand", "reveal", "label", "icon",
			"leading", "trailing"
		}, {
			BorderSizePixel = 0,
			Size = TypesUDim2.new(),
			AutomaticSize = TypesEnum.AutomaticSize.XY,
			Visible = function(Callback): boolean
				-- upvalues: v3 (copy), CellResult (copy)
				return not Callback(v3) and not Callback(CellResult)
			end
		})
		local CellResult2 = Compose.cell(false)
		local CellResult3 = Compose.cell(false)
		local v4 = nil
		local Object1 = nil
		
		if Frame.mayDrop == true and Frame.reveal ~= false then
			if Label or Icon then
				local Name = if type(Frame.Name) == "string" then Frame.Name else "Region"
				PropsResult[#PropsResult + 1] = p2.Badge("Reveal")({ label = Label, icon = Icon, name = Label or Name })
			else
				local Badge = p1.styled(Host.Frame("Reveal")({
					Size = TypesUDim2.fromOffset(28, 20),
					Host.UICorner({ CornerRadius = p1.round }),
					p1.icon("more", {
						AnchorPoint = TypesVector2.new(0.5, 0.5),
						Position = TypesUDim2.fromScale(0.5, 0.5),
						Size = TypesUDim2.fromOffset(16, 16)
					})
				}), "badge")
				Object1 = Badge
				PropsResult[#PropsResult + 1] = Badge
			end
		end
		local Sizes = {}
		local Hangs = {}
		local Floors = {}
		local Contents = {}
		local t = {}
		local IsAction: boolean = Zone == "action" or CompositionResolveModule.CELLS[Zone][2] == 3
		for i = 1, #PropsResult do
			local PropsResultEntry = PropsResult[i]
			assert(if type(PropsResultEntry) == "table" then type(PropsResultEntry.IsA) == "function" and PropsResultEntry:IsA("GuiObject") else typeof(PropsResultEntry) == "Instance" and (type(PropsResultEntry.IsA) == "function" and PropsResultEntry:IsA("GuiObject")), "Facet Region forms must be GuiObjects, richest first. Put reactive children inside a stable form.")
			Contents[i] = PropsResultEntry
			
			if i == 1 then
				v4 = PropsResultEntry
			end
			Floors[i] = OfResult.follow(PropsResultEntry, "y", function(Callback)
				-- upvalues: CellResult1 (copy), CellResult3 (copy), i (copy)
				local CallbackResult = if Callback then Callback(CellResult1) else CellResult1:peek()
				
				return if (if Callback then Callback(CellResult3) else CellResult3:peek()) and i == 1 then 0 else CallbackResult
			end)
			local LayoutUnitResult = p1.layoutUnit(PropsResultEntry)
			local LayoutSizeResult = LayoutSizeFunction(PropsResultEntry, LayoutUnitResult)
			local CellResult4 = Compose.cell(TypesVector2.zero)
			Sizes[i] = CellResult4
			local CellResult5 = Compose.cell(0)
			local OverhangResult = if IsAction then overhang(PropsResultEntry, LayoutUnitResult) else nil
			
			local function settle(Callback)
				-- upvalues: LayoutSizeResult (copy), OverhangResult (copy), i (copy), CellResult3 (copy), Flag (ref), CellResult4 (copy), CellResult5 (copy)
				local CallbackResult = if Callback then Callback(LayoutSizeResult) else LayoutSizeResult:peek()
				local CallbackResult1 = if OverhangResult then if Callback then Callback(OverhangResult) else OverhangResult:peek() else 0
				local CallbackResult2 = i == 1 and (if Callback then Callback(CellResult3) else CellResult3:peek())
				
				if not Flag and not CallbackResult2 then
					CellResult4:set(CallbackResult)
					CellResult5:set(CallbackResult1)
				end
			end
			
			table.insert(List, settle)
			Compose.watch(settle)
			Hangs[i] = CellResult5
			local v5 = Host.Frame("Form" .. i)({
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = TypesUDim2.new(),
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				Visible = Form:peek() == i,
				PropsResultEntry
			})
			PropsResult[i] = v5
			t[i] = v5
		end
		assert(#Sizes > 0, "Facet Region needs at least one form")
		local HitFloorResult = p1.hitFloor()
		PropsResult[#PropsResult + 1] = Object
		local v6 = assert(Compose.currentOwner())
		local Parent = t[1]
		
		local function returnHome()
			-- upvalues: CoreModule (upval), v6 (copy), v4 (ref), Parent (copy), CellResult3 (copy)
			if CoreModule.owner.isDisposed(v6) then return end
			local v7 = assert(v4)
			
			if v7.Parent ~= Parent then
				v7.Parent = Parent
			end
			CellResult3:set(false)
		end
		
		local function hostInto(Parent)
			-- upvalues: Frame (copy), CellResult3 (copy), v4 (ref)
			if Frame.expand then
				Frame.expand().Parent = Parent
				
				return
			else
				CellResult3:set(true)
				assert(v4).Parent = Parent
			end
		end
		
		if Frame.reveal ~= false and (#Sizes > 1 or Frame.expand) then
			local Expand = Frame.expand or function()
				-- upvalues: Host (upval), TypesUDim2 (upval), TypesEnum (upval), Frame (copy), CellResult3 (copy), v4 (ref), Compose (upval), returnHome (copy)
				local Parent = Host.Frame("Hosted")({
					BackgroundTransparency = 1,
					Size = TypesUDim2.new(),
					AutomaticSize = TypesEnum.AutomaticSize.XY
				})
				
				if Frame.expand then
					Frame.expand().Parent = Parent
				else
					CellResult3:set(true)
					assert(v4).Parent = Parent
				end
				Compose.cleanup(returnHome)
				
				return Parent
			end
			local CELL = CompositionResolveModule.CELLS[if Zone == "action" then "bottom" else Zone]
			local Top = if CELL[1] == 2 and CELL[2] == 3 then "top" else list[CELL[1]]
			Compose.watch(function(Callback)
				-- upvalues: Form (copy), CellResult2 (copy)
				if Callback(Form) <= 1 and CellResult2:peek() then
					CellResult2:set(false)
				end
			end)
			PropsResult[#PropsResult + 1] = p2.Popover("Expand")({
				compact = "popover",
				isPresented = CellResult2,
				onPresentedChange = function(p3)
					-- upvalues: CellResult2 (copy), Form (copy)
					CellResult2:set(p3 and Form:peek() > 1)
				end,
				edge = Top,
				content = Expand,
				trigger = Host.TextButton("Expand")({
					Text = "",
					BackgroundTransparency = 1,
					ZIndex = -1,
					AnchorPoint = TypesVector2.new(0.5, 0.5),
					Position = TypesUDim2.fromScale(0.5, 0.5),
					Size = TypesUDim2.fromScale(1, 1),
					Visible = function(Callback): boolean
						-- upvalues: Form (copy)
						return Callback(Form) > 1
					end
				})
			})
		end
		if Frame.Size == nil and Frame.AutomaticSize == nil and Frame.reveal ~= false then
			PropsResult.AutomaticSize = TypesEnum.AutomaticSize.None
			
			function PropsResult.Size(Callback)
				-- upvalues: Form (copy), Sizes (copy), TypesVector2 (upval), Frame (copy), HitFloorResult (copy), TypesUDim2 (upval)
				local CallbackResult: number = Callback(Form)
				local Size = Sizes[CallbackResult]
				local CallbackResult1 = if Size then Callback(Size) else TypesVector2.zero
				local HitFloorResultResult = if CallbackResult > 1 and (#Sizes > 1 or Frame.expand) then HitFloorResult(Callback) else 0
				
				return TypesUDim2.fromOffset(math.max(CallbackResult1.X, HitFloorResultResult), (math.max(CallbackResult1.Y, HitFloorResultResult)))
			end
		end
		local PlainResult = OfResult.plain(Host.Frame(PropsResult), Frame)
		
		if Object1 then
			Object1:SetAttribute("FacetReveal", PlainResult.Name)
		end
		local Visible = Frame.Visible
		RegionPresenceModule[PlainResult] = Compose.formula(function(Callback): boolean
			-- upvalues: v3 (copy), ReadFunction (upval), Visible (copy)
			return not Callback(v3) and ReadFunction(Visible, Callback) ~= false
		end)
		local v7 = nil
		Compose.watch(function(Callback)
			-- upvalues: Form (copy), v7 (ref), t (copy), PlainResult (copy), self (upval), ReducedResult (copy), popIn (copy)
			local CallbackResult: number = Callback(Form)
			
			if v7 and t[v7] then
				t[v7].Visible = false
			end
			if t[CallbackResult] then
				t[CallbackResult].Visible = true
			end
			PlainResult:SetAttribute("FacetForm", CallbackResult)
			
			if v7 ~= nil and CallbackResult > 0 and CallbackResult ~= v7 and self[PlainResult].animate and not ReducedResult() then
				popIn()
			end
			v7 = CallbackResult
		end)
		self[PlainResult] = {
			animate = false,
			zone = Zone,
			rank = Rank,
			mayDrop = Frame.mayDrop == true,
			sizes = Sizes,
			form = Form,
			yielding = CellResult,
			lift = CellResult1,
			hangs = Hangs,
			authored = Visible,
			floors = Floors,
			contents = Contents,
			leading = Frame.leading == true,
			trailing = Frame.trailing == true,
			reveal = if Frame.reveal == false or Frame.mayDrop ~= true then nil else { host = hostInto, back = returnHome },
			label = Label,
			icon = Icon
		}
		
		return PlainResult
	end)
	
	local function zoneFrame(p3, p4: number, p5: number, S, List, CellResult, CellResult1)
		-- upvalues: TypesVector2 (copy), TypesUDim2 (copy), TypesEnum (copy), Host (copy), TypesUDim (copy), OfResult (copy)
		local Wraps: boolean = p4 == 2 and p5 ~= 2
		local v8: boolean = Wraps and (#List ~= 1 or p5 == 3)
		local config = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = TypesVector2.new((p4 - 1) / 2, (p5 - 1) / 2),
			ZIndex = if p4 == 2 then 2 else 1,
			Position = function(Callback)
				-- upvalues: CellResult (copy), TypesUDim2 (upval), p4 (copy), p5 (copy)
				local CallbackResult = Callback(CellResult)
				
				return TypesUDim2.new((p4 - 1) / 2, if p4 == 2 then if p5 == 1 then CallbackResult.leanTop elseif p5 == 3 then CallbackResult.leanBottom else 0 else 0, (p5 - 1) / 2, if p5 == 3 then -CallbackResult.hang - (if p4 == 2 then CallbackResult.bottom else 0) elseif p5 == 1 and p4 == 2 then CallbackResult.top else 0)
			end,
			Size = function(Callback)
				-- upvalues: v8 (copy), p5 (copy), CellResult1 (copy), TypesUDim2 (upval)
				local Top = if v8 then if p5 == 1 then Callback(CellResult1).top else Callback(CellResult1).bottom else 0
				
				return if Top > 0 then TypesUDim2.fromOffset(math.ceil(Top), 0) else TypesUDim2.new()
			end,
			AutomaticSize = function(Callback)
				-- upvalues: v8 (copy), p5 (copy), CellResult1 (copy), TypesEnum (upval)
				local Top = if v8 then if p5 == 1 then Callback(CellResult1).top else Callback(CellResult1).bottom else 0
				
				return if Top > 0 then TypesEnum.AutomaticSize.Y else TypesEnum.AutomaticSize.XY
			end,
			Host.UIListLayout({
				SortOrder = TypesEnum.SortOrder.LayoutOrder,
				FillDirection = if Wraps then TypesEnum.FillDirection.Horizontal else TypesEnum.FillDirection.Vertical,
				Wraps = Wraps,
				ItemLineAlignment = if Wraps then if p5 == 1 then TypesEnum.ItemLineAlignment.Start else TypesEnum.ItemLineAlignment.End else TypesEnum.ItemLineAlignment.Automatic,
				VerticalAlignment = if Wraps and p5 == 3 then TypesEnum.VerticalAlignment.Bottom else TypesEnum.VerticalAlignment.Top,
				HorizontalAlignment = if p4 == 1 then TypesEnum.HorizontalAlignment.Left elseif p4 == 2 then TypesEnum.HorizontalAlignment.Center else TypesEnum.HorizontalAlignment.Right,
				Padding = function(p6)
					-- upvalues: TypesUDim (upval), OfResult (upval), S (copy)
					return TypesUDim.new(0, OfResult.spacing(S, p6))
				end
			})
		}
		
		for _, value in List do
			config[#config + 1] = value
		end
		return Host.Frame(config, p3)
	end
	
	p2.Composition = p1.construct("Composition", function(p6)
		-- upvalues: p1 (copy), self (copy), Compose (copy), TypesUDim2 (copy), OfResult (copy), ReadFunction (copy), ReadFunction (copy), TypesUDim (copy), Host (copy), TypesEnum (copy), CompositionResolveModule (upval), zoneFrame (copy), Runtime (copy), PreparationModule (upval), PresentationReadinessModule (upval), CoreModule (upval), ReadFunction (copy), TypesVector2 (copy), mark (copy), p2 (copy), list (upval), LayoutSizeFunction (copy), ExtentMatchModule (upval), regionsKey (upval), Vectors (upval), ReservationsModule (upval)
		local PropsResult = p1.props(p6, {
			"gap",
			"padding",
			"topbar",
			"rows",
			"passive"
		})
		local List = {}
		local List1 = {}
		
		for i = 1, #PropsResult do
			local PropsResultEntry = PropsResult[i]
			
			if self[PropsResultEntry] then
				table.insert(List, PropsResultEntry)
			else
				assert(type(PropsResultEntry) == "table" or typeof(PropsResultEntry) == "Instance", "Facet Composition children must be UI.Region nodes. Put Compose.show inside a stable Region form, not around the Region.")
				assert(type(PropsResultEntry.IsA) == "function" and PropsResultEntry:IsA("UIFlexItem"), "Facet Composition children must be UI.Region nodes or a UIFlexItem. Put Compose.show inside a stable Region form, not around the Region.")
				table.insert(List1, PropsResultEntry)
			end
			PropsResult[i] = nil
		end
		for _, value in List1 do
			PropsResult[#PropsResult + 1] = value
		end
		local S = if p6.gap == nil then "s" else p6.gap
		local S1 = if p6.padding == nil then "s" else p6.padding
		local CellResult = Compose.cell(0)
		local CellResult1 = Compose.cell(0)
		local CellResult2 = Compose.cell(false)
		local TenFootResult = p1.tenFoot()
		local OverscanInsets = p1.config.environment and p1.config.environment.overscanInsets
		local config = {
			top = 0.05555555555555555,
			bottom = 0.05555555555555555,
			left = 0.046875,
			right = 0.046875
		}
		PropsResult.BorderSizePixel = 0
		PropsResult.Size = if PropsResult.Size == nil then TypesUDim2.fromScale(1, 1) else PropsResult.Size
		PropsResult[#PropsResult + 1] = OfResult.insets(function(Callback)
			-- upvalues: ReadFunction (upval), S1 (copy), ReadFunction (upval), OverscanInsets (copy), CellResult2 (copy), TypesUDim (upval), TenFootResult (copy), config (copy), OfResult (upval), CellResult (copy), CellResult1 (copy)
			local ReadResult = ReadFunction(S1, Callback)
			local ReadResult1 = if type(ReadResult) == "table" then ReadResult else {
				top = ReadResult,
				right = ReadResult,
				bottom = ReadResult,
				left = ReadResult
			}
			local ReadResult2 = ReadFunction(OverscanInsets, Callback)
			local CallbackResult = Callback(CellResult2)
			
			local function side(p7, SpacingResult)
				-- upvalues: CallbackResult (copy), ReadResult2 (copy), TypesUDim (upval), TenFootResult (upval), Callback (copy), config (upval)
				return if CallbackResult and type(ReadResult2) == "table" then TypesUDim.new(0, SpacingResult + (if p7 == "top" then ReadResult2.top elseif p7 == "right" then ReadResult2.right elseif p7 == "bottom" then ReadResult2.bottom else ReadResult2.left)) else TypesUDim.new(if CallbackResult and ReadResult2 == nil and TenFootResult(Callback) then config[p7] else 0, SpacingResult)
			end
			
			return {
				top = side("top", OfResult.spacing(ReadResult1.top, Callback) + Callback(CellResult)),
				right = side("right", OfResult.spacing(ReadResult1.right, Callback)),
				bottom = side("bottom", OfResult.spacing(ReadResult1.bottom, Callback) + Callback(CellResult1)),
				left = side("left", OfResult.spacing(ReadResult1.left, Callback))
			}
		end)
		local t = {}
		local List2 = {}
		local List3 = {}
		
		for LayoutOrder, value1 in List do
			local Zone = self[value1].zone
			value1.LayoutOrder = LayoutOrder
			local Top = if Zone == "topbar" then "top" else Zone
			
			if Zone == "action" then
				table.insert(List3, value1)
				t.bottom = t.bottom or {}
				t.bottomRight = t.bottomRight or {}
			else
				t[Top] = t[Top] or {}
			end
			if Zone == "topbar" then
				table.insert(List2, value1)
			elseif Zone ~= "action" then
				table.insert(t[Top], value1)
			end
		end
		local Visible = false
		local Visible1 = false
		
		for _, value2 in List2 do
			Visible = Visible or self[value2].leading
			Visible1 = Visible1 or self[value2].trailing
		end
		local Lanes = (if Visible then 1 else 0) + 1 + (if Visible1 then 1 else 0)
		
		local function _(p7): number
			-- upvalues: ReadFunction (upval), S1 (copy), OfResult (upval), S (copy)
			local ReadResult = ReadFunction(S1, p7)
			
			return (math.max(OfResult.spacing(S, p7), OfResult.spacing(if type(ReadResult) == "table" then ReadResult.right else ReadResult, p7)))
		end
		
		local function landingFrame(p7, HorizontalAlignment)
			-- upvalues: Host (upval), TypesUDim2 (upval), TypesEnum (upval), TypesUDim (upval), OfResult (upval), S (copy)
			return Host.Frame(p7)({
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 0,
				Size = TypesUDim2.new(),
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				Host.UIListLayout({
					SortOrder = TypesEnum.SortOrder.LayoutOrder,
					HorizontalAlignment = HorizontalAlignment,
					Padding = function(p8)
						-- upvalues: TypesUDim (upval), OfResult (upval), S (upval)
						return TypesUDim.new(0, OfResult.spacing(S, p8))
					end
				})
			})
		end
		
		local Landed = nil
		local LandedTrailing = nil
		local LandedLeading = nil
		
		if #List2 > 0 then
			Landed = landingFrame("Landed", TypesEnum.HorizontalAlignment.Center)
			
			for _, value3 in List2 do
				if self[value3].trailing and LandedTrailing == nil then
					LandedTrailing = landingFrame("LandedTrailing", TypesEnum.HorizontalAlignment.Right)
					t.topRight = t.topRight or {}
				end
				if self[value3].leading and LandedLeading == nil then
					LandedLeading = landingFrame("LandedLeading", TypesEnum.HorizontalAlignment.Left)
					t.topLeft = t.topLeft or {}
				end
			end
		end
		local t1 = {}
		local List4 = {}
		local CellResult3 = Compose.cell({
			top = 0,
			bottom = 0,
			hang = 0,
			leanTop = 0,
			leanBottom = 0
		})
		local CellResult4 = Compose.cell({ top = 0, bottom = 0 })
		
		for Text, value4 in t do
			local CELL = CompositionResolveModule.CELLS[Text]
			local ZoneFrameResult = zoneFrame(string.upper((string.sub(Text, 1, 1))) .. string.sub(Text, 2), CELL[1], CELL[2], S, if Text == "top" and Landed then { Landed, table.unpack(value4) } elseif Text == "topRight" and LandedTrailing then { LandedTrailing, table.unpack(value4) } elseif Text == "topLeft" and LandedLeading then { LandedLeading, table.unpack(value4) } else value4, CellResult3, CellResult4)
			t1[Text] = ZoneFrameResult
			table.insert(List4, ZoneFrameResult)
		end
		local v9 = Host.Frame("Zones")({
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = TypesUDim2.fromScale(1, 1),
			table.unpack(List4)
		})
		PropsResult[#PropsResult + 1] = v9
		local FacetUnfitDetails = Host.StringValue({ Name = "FacetUnfitDetails", Value = "" })
		PropsResult[#PropsResult + 1] = FacetUnfitDetails
		local RunService = p1.config.services.RunService
		local HasFrames: boolean = RunService ~= nil and (RunService.PreRender ~= nil and Runtime.host.frames ~= nil)
		local PlainResult = OfResult.plain(if HasFrames then p1.fade(PropsResult, false, false) else Host.Frame(PropsResult), p6)
		
		local function placed()
			-- upvalues: PlainResult (copy), CellResult2 (copy)
			local Parent = PlainResult.Parent
			CellResult2:set(if Parent then Parent:IsA("LayerCollector") else false)
		end
		
		local Parent1 = PlainResult.Parent
		CellResult2:set(if Parent1 then Parent1:IsA("LayerCollector") else false)
		Runtime.connect(PlainResult, "AncestryChanged", placed)
		
		if HasFrames then
			p1.fadeTo(PlainResult, 1)
			PreparationModule.begin(p1, PlainResult)
			local List5 = {}
			
			for _, value5 in List do
				table.insert(List5, value5)
			end
			local PresentationReadinessModuleResult = PresentationReadinessModule(p1, List5)
			Compose.watch(function(Callback)
				-- upvalues: PresentationReadinessModuleResult (copy), p1 (upval), PlainResult (copy), PreparationModule (upval)
				if Callback(PresentationReadinessModuleResult) then
					p1.fadeTo(PlainResult, 0)
					PreparationModule.finish(p1, PlainResult)
				end
			end)
		end
		OfResult.underTopbar(PlainResult, CellResult)
		OfResult.touchClearance(PlainResult, CellResult1)
		
		local function v157(): boolean
			return false
		end
		
		local CellResult5 = Compose.cell({})
		local v10 = nil
		local PbarInset = if #List2 > 0 and p1.config.guiService then p1.observe.TopbarInset(p1.config.guiService) else nil
		
		if #List2 > 0 then
			local CellResult6 = Compose.cell(nil)
			local CellResult7 = Compose.cell(nil)
			local CellResult8 = Compose.cell(true)
			local v11 = assert(Compose.currentOwner())
			local v12 = nil
			
			local function locate()
				-- upvalues: CoreModule (upval), v11 (copy), PlainResult (copy), p1 (upval), v12 (ref), Compose (upval), CellResult8 (copy), CellResult6 (copy), CellResult7 (copy)
				if CoreModule.owner.isDisposed(v11) then return end
				local ScreenGui = PlainResult:FindFirstAncestorWhichIsA("ScreenGui")
				
				if not ScreenGui then
					local SurfaceGui = PlainResult:FindFirstAncestorWhichIsA("SurfaceGui")
					local OverlayHost = if SurfaceGui then p1.overlayHosts[SurfaceGui] else nil
					
					if OverlayHost and OverlayHost:IsA("ScreenGui") then
						ScreenGui = OverlayHost
					end
				end
				if v12 then
					CoreModule.owner.dispose(v12)
				end
				local Child = CoreModule.owner.createChild(v11)
				v12 = Child
				Compose.withOwner(Child, function()
					-- upvalues: PlainResult (upval), p1 (upval), ScreenGui (ref), Compose (upval), CellResult8 (upval)
					local List = {}
					local Gui = PlainResult
					while Gui and not Gui:IsA("LayerCollector") do
						if Gui:IsA("GuiObject") then
							table.insert(List, p1.observe.Visible(Gui))
						end
						Gui = Gui.Parent
					end
					if ScreenGui then
						table.insert(List, p1.observe.Enabled(ScreenGui))
					end
					Compose.watch(function(Callback)
						-- upvalues: List (copy), CellResult8 (upval)
						local Flag = true
						
						for _, value in List do
							if Callback(value) == false then
								Flag = false
							end
						end
						CellResult8:set(Flag)
					end)
				end)
				CellResult6:set(ScreenGui)
				CellResult7:set(if ScreenGui then ScreenGui.Parent else nil)
			end
			
			Runtime.connect(PlainResult, "AncestryChanged", locate)
			locate()
			
			v157 = function(Callback): boolean
				-- upvalues: PbarInset (copy), ReadFunction (upval), p6 (copy), CellResult7 (copy)
				local CallbackResult = if PbarInset then Callback(PbarInset) else nil
				
				return ReadFunction(p6.topbar, Callback) ~= false and (Callback(CellResult7) ~= nil and (CallbackResult ~= nil and CallbackResult.Width > 0))
			end
			
			local function row(p7, Left, UIListLayoutResults)
				-- upvalues: Host (upval), TypesEnum (upval), TypesUDim (upval), OfResult (upval), S (copy)
				UIListLayoutResults.BackgroundTransparency = 1
				UIListLayoutResults.BorderSizePixel = 0
				UIListLayoutResults[#UIListLayoutResults + 1] = Host.UIListLayout({
					FillDirection = TypesEnum.FillDirection.Horizontal,
					SortOrder = TypesEnum.SortOrder.LayoutOrder,
					HorizontalAlignment = Left,
					VerticalAlignment = TypesEnum.VerticalAlignment.Center,
					Padding = function(p8)
						-- upvalues: TypesUDim (upval), OfResult (upval), S (upval)
						return TypesUDim.new(0, OfResult.spacing(S, p8))
					end
				})
				
				return Host.Frame(UIListLayoutResults, p7)
			end
			
			local Leading = row("Leading", TypesEnum.HorizontalAlignment.Left, {
				LayoutOrder = 1,
				Size = TypesUDim2.new(),
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				Visible = Visible
			})
			local Middle = row("Middle", TypesEnum.HorizontalAlignment.Center, {
				LayoutOrder = 2,
				Size = TypesUDim2.fromScale(0, 1),
				Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
			})
			local Trailing = row("Trailing", TypesEnum.HorizontalAlignment.Right, {
				LayoutOrder = 3,
				Size = TypesUDim2.new(),
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				Visible = Visible1
			})
			local Topbar = row("Topbar", TypesEnum.HorizontalAlignment.Left, {
				Size = TypesUDim2.fromScale(1, 1),
				Host.UIPadding({
					PaddingTop = function(Callback)
						-- upvalues: PbarInset (copy), TypesUDim (upval)
						local CallbackResult = if PbarInset then Callback(PbarInset) else nil
						
						return TypesUDim.new(0, (math.max(0, (if CallbackResult then CallbackResult.Height else 0) - 44 - 2)))
					end,
					PaddingBottom = TypesUDim.new(0, 2),
					PaddingLeft = function(p7)
						-- upvalues: TypesUDim (upval), OfResult (upval), S (copy)
						return TypesUDim.new(0, OfResult.spacing(S, p7))
					end,
					PaddingRight = function(p7)
						-- upvalues: TypesUDim (upval), ReadFunction (upval), S1 (copy), OfResult (upval), S (copy)
						local NewFunction = TypesUDim.new
						local ReadResult = ReadFunction(S1, p7)
						
						return NewFunction(0, (math.max(OfResult.spacing(S, p7), OfResult.spacing(if type(ReadResult) == "table" then ReadResult.right else ReadResult, p7))))
					end
				}),
				Leading,
				Middle,
				Trailing
			})
			
			for _, value6 in List2 do
				local Leading1 = if self[value6].leading then Leading elseif self[value6].trailing then Trailing else Middle
				local v13 = if self[value6].trailing then assert(LandedTrailing) elseif self[value6].leading then assert(LandedLeading) else assert(Landed)
				local v14 = assert(table.find(List, value6))
				Runtime.decorate(value6, {
					Parent = function(Callback)
						-- upvalues: v157 (ref), CellResult5 (copy), v14 (copy), Leading1 (copy), v13 (copy)
						return if v157(Callback) and not Callback(CellResult5)[v14] then Leading1 else v13
					end
				})
			end
			local v15 = Host.ScreenGui("CompositionTopbar")({
				ResetOnSpawn = false,
				ZIndexBehavior = TypesEnum.ZIndexBehavior.Sibling,
				ScreenInsets = TypesEnum.ScreenInsets.TopbarSafeInsets,
				DisplayOrder = function(Callback)
					-- upvalues: CellResult6 (copy)
					local CallbackResult = Callback(CellResult6)
					
					return if CallbackResult then CallbackResult.DisplayOrder else 0
				end,
				Enabled = CellResult8,
				Host.StyleLink({
					StyleSheet = function(Callback)
						-- upvalues: CellResult6 (copy)
						local CallbackResult = Callback(CellResult6)
						local StyleLink = CallbackResult and CallbackResult:FindFirstChildWhichIsA("StyleLink")
						
						return if StyleLink then StyleLink.StyleSheet else nil
					end
				}),
				Topbar
			})
			v10 = v15
			Compose.watch(function(Callback)
				-- upvalues: CellResult6 (copy), p1 (upval), v15 (copy)
				local CallbackResult = Callback(CellResult6)
				
				if CallbackResult then
					p1.overlayHosts[v15] = CallbackResult
				end
			end)
			Runtime.decorate(v15, {
				Parent = function(Callback)
					-- upvalues: v157 (ref), CellResult7 (copy)
					return if v157(Callback) then Callback(CellResult7) else nil
				end
			})
		end
		local LayoutUnitResult = p1.layoutUnit(v9)
		local HitFloorResult = p1.hitFloor()
		local AbsoluteSizeResult = p1.observe.AbsoluteSize(v9)
		local FormulaResult = Compose.formula(function(Callback): string
			-- upvalues: AbsoluteSizeResult (copy), LayoutUnitResult (copy)
			local CallbackResultRatio = Callback(AbsoluteSizeResult) / Callback(LayoutUnitResult)
			
			return if CallbackResultRatio.X < CallbackResultRatio.Y then "bottom" else "bottomRight"
		end)
		
		for _, value7 in List3 do
			Runtime.decorate(value7, {
				Parent = function(Callback)
					-- upvalues: t1 (copy), FormulaResult (copy)
					return t1[Callback(FormulaResult)]
				end
			})
		end
		for i1, value8 in t do
			local Copy = table.clone(value8)
			
			if i1 == "bottom" or i1 == "bottomRight" then
				table.move(List3, 1, #List3, #Copy + 1, Copy)
			end
			local Flag1 = false
			
			for _, value9 in Copy do
				Flag1 = Flag1 or self[value9].reveal ~= nil
			end
			if Flag1 then
				local CELL = CompositionResolveModule.CELLS[i1]
				local CELLEntry: number = CELL[1]
				local CELLEntry1: number = CELL[2]
				local Entry = t1[i1]
				local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(Entry)
				local NewTypesVector = TypesVector2.new((CELLEntry - 1) / 2, (CELLEntry1 - 1) / 2)
				local FormulaResult1 = Compose.formula(function(Callback)
					-- upvalues: Copy (copy), self (upval), FormulaResult (copy), i1 (copy)
					local List = {}
					
					for _, value in Copy do
						local SelfEntry = self[value]
						
						if SelfEntry.reveal and Callback(SelfEntry.form) == 0 and (SelfEntry.zone ~= "action" or Callback(FormulaResult) == i1) then
							table.insert(List, value)
						end
					end
					return List
				end)
				local FormulaResult2 = Compose.formula(function(Callback)
					-- upvalues: FormulaResult1 (copy), self (upval)
					local CallbackResult = Callback(FormulaResult1)
					local CallbackResultEntry = CallbackResult[1]
					local SelfEntry = if #CallbackResult == 1 and CallbackResultEntry then self[CallbackResultEntry] else nil
					
					return if SelfEntry and (SelfEntry.label or SelfEntry.icon) then CallbackResultEntry else nil
				end)
				local CellResult9 = Compose.cell(false)
				local List6 = {}
				
				local function release()
					-- upvalues: List6 (ref), self (upval)
					for _, value in List6 do
						assert(self[value].reveal).back()
					end
					List6 = {}
				end
				
				local PeekResult = FormulaResult1:peek()
				Compose.watch(function(Callback)
					-- upvalues: FormulaResult1 (copy), PeekResult (ref), CellResult9 (copy)
					local CallbackResult = Callback(FormulaResult1)
					local v16 = #CallbackResult == #PeekResult
					for i, value in CallbackResult do
						v16 = v16 and PeekResult[i] == value
					end
					PeekResult = CallbackResult
					
					if not v16 and CellResult9:peek() then
						CellResult9:set(false)
					end
				end)
				
				local function place(Callback)
					-- upvalues: LayoutUnitResult (copy), OfResult (upval), S (copy), AbsoluteSizeResult1 (copy), CellResult3 (copy), AbsoluteSizeResult (copy), NewTypesVector (copy), TypesVector2 (upval), CELLEntry (copy), CELLEntry1 (copy), TypesUDim2 (upval)
					local CallbackResult = Callback(LayoutUnitResult)
					local SpacingResult = OfResult.spacing(S, Callback)
					local CallbackResultRatio = Callback(AbsoluteSizeResult1) / CallbackResult
					local CallbackResult1 = Callback(CellResult3)
					local NewCallbackResult = (Callback(AbsoluteSizeResult) / CallbackResult - CallbackResultRatio) * NewTypesVector + TypesVector2.new(if CELLEntry == 2 then if CELLEntry1 == 1 then CallbackResult1.leanTop elseif CELLEntry1 == 3 then CallbackResult1.leanBottom else 0 else 0, if CELLEntry1 == 3 then -CallbackResult1.hang - (if CELLEntry == 2 then CallbackResult1.bottom else 0) elseif CELLEntry1 == 1 and CELLEntry == 2 then CallbackResult1.top else 0)
					
					if CELLEntry == 2 then
						return if CELLEntry1 == 3 then TypesUDim2.fromOffset(NewCallbackResult.X + CallbackResultRatio.X / 2, NewCallbackResult.Y - SpacingResult) else TypesUDim2.fromOffset(NewCallbackResult.X + CallbackResultRatio.X / 2, NewCallbackResult.Y + CallbackResultRatio.Y + SpacingResult), TypesVector2.new(0.5, if CELLEntry1 == 3 then 1 else 0)
					else
						return TypesUDim2.fromOffset(if CELLEntry == 1 then NewCallbackResult.X + CallbackResultRatio.X + SpacingResult else NewCallbackResult.X - SpacingResult, NewCallbackResult.Y + CallbackResultRatio.Y * (CELLEntry1 - 1) / 2), TypesVector2.new(if CELLEntry == 1 then 0 else 1, (CELLEntry1 - 1) / 2)
					end
				end
				
				Runtime.mount(function()
					-- upvalues: place (copy), FormulaResult1 (copy), p1 (upval), Host (upval), TypesVector2 (upval), TypesUDim2 (upval), FormulaResult2 (copy), Copy (copy), self (upval), TypesEnum (upval), mark (upval), HitFloorResult (copy), LayoutUnitResult (copy), Entry (copy), Compose (upval), p2 (upval), CellResult9 (copy), CELLEntry (copy), CELLEntry1 (copy), list (upval), release (copy), TypesUDim (upval), OfResult (upval), S (copy), List6 (ref)
					local List = {}
					local config = {
						Text = "",
						BackgroundTransparency = 1,
						ZIndex = 5,
						Position = function(p7)
							-- upvalues: place (upval)
							return (place(p7))
						end,
						AnchorPoint = function(p7)
							-- upvalues: place (upval)
							local _, PlaceResult2 = place(p7)
							
							return PlaceResult2
						end,
						Visible = function(Callback): boolean
							-- upvalues: FormulaResult1 (upval)
							return #Callback(FormulaResult1) > 0
						end,
						p1.styled(Host.Frame("Badge")({
							AnchorPoint = TypesVector2.new(0.5, 0.5),
							Position = TypesUDim2.fromScale(0.5, 0.5),
							Size = TypesUDim2.fromOffset(28, 20),
							Visible = function(Callback): boolean
								-- upvalues: FormulaResult2 (upval)
								return Callback(FormulaResult2) == nil
							end,
							Host.UICorner({ CornerRadius = p1.round }),
							p1.icon("more", {
								AnchorPoint = TypesVector2.new(0.5, 0.5),
								Position = TypesUDim2.fromScale(0.5, 0.5),
								Size = TypesUDim2.fromOffset(16, 16)
							})
						}), "badge")
					}
					
					for _, Region in Copy do
						local SelfEntry = self[Region]
						
						if SelfEntry.reveal and (SelfEntry.label or SelfEntry.icon) then
							local v17 = Host.Frame("Mark" .. Region.Name)({
								BackgroundTransparency = 1,
								AnchorPoint = TypesVector2.new(0.5, 0.5),
								Position = TypesUDim2.fromScale(0.5, 0.5),
								Size = TypesUDim2.new(),
								AutomaticSize = TypesEnum.AutomaticSize.XY,
								Visible = function(Callback): boolean
									-- upvalues: FormulaResult2 (upval), Region (copy)
									return Callback(FormulaResult2) == Region
								end,
								mark("Mark", SelfEntry.label, SelfEntry.icon, Region.Name)
							})
							config[#config + 1] = v17
							table.insert(List, { region = Region, size = p1.observe.AbsoluteSize(v17) })
						end
					end
					function config.Size(Callback)
						-- upvalues: HitFloorResult (upval), FormulaResult2 (upval), List (copy), LayoutUnitResult (upval), TypesUDim2 (upval)
						local HitFloorResultResult = HitFloorResult(Callback)
						local Largest: number = HitFloorResultResult
						local CallbackResult = Callback(FormulaResult2)
						
						for _, value in List do
							if value.region == CallbackResult then
								Largest = math.max(Largest, Callback(value.size).X / Callback(LayoutUnitResult))
							end
						end
						return TypesUDim2.fromOffset(Largest, HitFloorResultResult)
					end
					
					local Trigger = Host.TextButton("ZoneReveal" .. Entry.Name)(config)
					Compose.watch(function(Callback)
						-- upvalues: FormulaResult2 (upval), FormulaResult1 (upval), self (upval), Trigger (copy)
						local List = {}
						
						if Callback(FormulaResult2) == nil then
							for _, value in Callback(FormulaResult1) do
								local SelfEntry = self[value]
								
								if not SelfEntry.label and not SelfEntry.icon then
									table.insert(List, value.Name)
								end
							end
						end
						Trigger:SetAttribute("FacetReveal", if #List > 0 then table.concat(List, ", ") else nil)
					end)
					
					return p2.Popover("Hidden" .. Entry.Name)({
						compact = "popover",
						isPresented = CellResult9,
						onPresentedChange = function(p7)
							-- upvalues: CellResult9 (upval), FormulaResult1 (upval)
							CellResult9:set(p7 and #FormulaResult1:peek() > 0)
						end,
						edge = if CELLEntry == 2 and CELLEntry1 == 3 then "top" else list[CELLEntry],
						content = function()
							-- upvalues: release (upval), TypesUDim2 (upval), TypesEnum (upval), Host (upval), TypesUDim (upval), OfResult (upval), S (upval), FormulaResult1 (upval), self (upval), p2 (upval), List6 (upval), Compose (upval)
							release()
							local config = {
								Name = "ZoneHidden",
								BackgroundTransparency = 1,
								Size = TypesUDim2.new(),
								AutomaticSize = TypesEnum.AutomaticSize.XY,
								Host.UIListLayout({
									SortOrder = TypesEnum.SortOrder.LayoutOrder,
									Padding = function(p7)
										-- upvalues: TypesUDim (upval), OfResult (upval), S (upval)
										return TypesUDim.new(0, OfResult.spacing(S, p7))
									end
								})
							}
							local t = {}
							
							for LayoutOrder, value in FormulaResult1:peek() do
								local Label = self[value].label
								local v18 = Host.Frame("Hidden" .. value.Name)({
									LayoutOrder = LayoutOrder,
									BackgroundTransparency = 1,
									Size = TypesUDim2.new(),
									AutomaticSize = TypesEnum.AutomaticSize.XY,
									if Label then Host.UIListLayout({ SortOrder = TypesEnum.SortOrder.LayoutOrder }) else nil,
									if Label then p2.Text("Label")({ textRole = "caption", LayoutOrder = -1, text = Label }) else nil
								})
								config[#config + 1] = v18
								t[value] = v18
							end
							local FrameResult = Host.Frame(config)
							
							for i, value1 in t do
								assert(self[i].reveal).host(value1)
								table.insert(List6, i)
							end
							Compose.cleanup(release)
							
							return FrameResult
						end,
						trigger = Trigger
					})
				end, v9)
			end
		end
		local Tbl = {}
		local Count = 0
		
		local function resolved(X, Y, SpacingResult, p7, p8, Vector)
			-- upvalues: Tbl (copy), CompositionResolveModule (upval), Count (ref)
			local Text: string = `{X},{Y},{SpacingResult},{if Vector then `{Vector.x},{Vector.y},{Vector.lanes}` else "-"}|{p8}`
			local Entry = Tbl[Text]
			
			if Entry then
				return Entry
			end
			local ResolveResult, ResolveResult2, ResolveResult3, ResolveResult4, ResolveResult5 = CompositionResolveModule.resolve(X, Y, SpacingResult, p7, Vector)
			local config = {
				chosen = ResolveResult,
				down = ResolveResult2,
				moved = ResolveResult3,
				overflow = ResolveResult4,
				packed = ResolveResult5
			}
			
			if Count >= 16 then
				table.clear(Tbl)
				Count = 0
			end
			Tbl[Text] = config
			Count += 1
			
			return config
		end
		
		local t2 = {}
		local t3 = {}
		local t4 = {}
		local SchedulerResult = Runtime.scheduler()
		local Vector = nil
		local CellResult10 = Compose.cell({}, function(List, p9): boolean
			local v18 = #List == #p9
			for i, value in List do
				v18 = v18 and value == p9[i]
			end
			return v18
		end)
		local LayoutUnitResult1 = if v10 then p1.layoutUnit(v10) else nil
		local LayoutSizeResult = if v10 then LayoutSizeFunction(v10, LayoutUnitResult1) else nil
		local NewExtentMatch = ExtentMatchModule.new()
		local CellResult11 = Compose.cell(0)
		local Count1 = 0
		local v19 = -1
		local NextFrameResult = nil
		local t5 = {}
		local IntrinsicResults = {}
		Compose.cleanup(function()
			-- upvalues: NextFrameResult (ref)
			if NextFrameResult then
				NextFrameResult()
				NextFrameResult = nil
			end
		end)
		Compose.watch(function(Callback)
			-- upvalues: CellResult11 (copy), v19 (ref), OfResult (upval), AbsoluteSizeResult (copy), LayoutUnitResult (copy), v157 (ref), List (copy), self (upval), FormulaResult (copy), ReadFunction (upval), LayoutSizeResult (copy), PbarInset (copy), LayoutUnitResult1 (copy), TypesVector2 (upval), S (copy), ReadFunction (upval), S1 (copy), Lanes (copy), regionsKey (upval), resolved (copy), Vectors (upval), FacetUnfitDetails (copy), PlainResult (copy), CellResult5 (copy), CellResult3 (copy), CellResult4 (copy), t3 (ref), t2 (copy), t4 (copy), SchedulerResult (copy), Vector (ref), p6 (copy), IntrinsicResults (copy), Count1 (ref), ExtentMatchModule (upval), NewExtentMatch (copy), t5 (copy), NextFrameResult (ref), CellResult10 (copy)
			local CallbackResult = Callback(CellResult11)
			local IsNotCallbackResultMatch = CallbackResult ~= v19 or OfResult.frameless()
			v19 = CallbackResult
			local v20 = false
			local CallbackResultRatio = Callback(AbsoluteSizeResult) / Callback(LayoutUnitResult)
			local v21 = v157(Callback)
			local t6 = {}
			
			for i, value in List do
				local SelfEntry = self[value]
				local Sizes = {}
				local t7 = {}
				local v22 = false
				
				for i1, size in SelfEntry.sizes do
					local CallbackResult1 = Callback(size)
					Sizes[i1] = { x = CallbackResult1.X, y = CallbackResult1.Y }
					t7[i1] = Callback(SelfEntry.hangs[i1])
					v22 = v22 or t7[i1] > 0
				end
				t6[i] = {
					zone = if SelfEntry.zone == "action" then Callback(FormulaResult) else SelfEntry.zone,
					rank = SelfEntry.rank,
					mayDrop = SelfEntry.mayDrop,
					sizes = Sizes,
					hangs = if v22 and ReadFunction(SelfEntry.authored, Callback) ~= false then t7 else nil,
					leading = SelfEntry.leading,
					trailing = SelfEntry.trailing
				}
			end
			local CallbackResult2 = if LayoutSizeResult and v21 then Callback(LayoutSizeResult) else nil
			
			if CallbackResult2 and (CallbackResult2.X <= 0 or CallbackResult2.Y <= 0) and (PbarInset and LayoutUnitResult1) then
				local CallbackResult1 = Callback(PbarInset)
				CallbackResult2 = TypesVector2.new(CallbackResult1.Width, CallbackResult1.Height) / Callback(LayoutUnitResult1)
			end
			local config = nil
			if CallbackResult2 then
				local XDelta = CallbackResult2.X - OfResult.spacing(S, Callback)
				local ReadResult = ReadFunction(S1, Callback)
				config = {
					x = XDelta - math.max(OfResult.spacing(S, Callback), OfResult.spacing(if type(ReadResult) == "table" then ReadResult.right else ReadResult, Callback)),
					y = math.min(CallbackResult2.Y - 2, 44),
					lanes = Lanes
				}
			else
				config = nil
			end
			local SpacingResult = OfResult.spacing(S, Callback)
			local RegionsKeyResult = regionsKey(t6)
			local ResolvedResult = resolved(CallbackResultRatio.X, CallbackResultRatio.Y, SpacingResult, t6, RegionsKeyResult, if config and CallbackResult2 and CallbackResult2.X > 0 then config else nil)
			local Chosen = ResolvedResult.chosen
			local Down = ResolvedResult.down
			local Moved = ResolvedResult.moved
			local Overflow = ResolvedResult.overflow
			local Packed = ResolvedResult.packed
			local List1 = {}
			
			for _, _vector in Vectors do
				if _vector.X < CallbackResultRatio.X or _vector.Y < CallbackResultRatio.Y then
					local Overflow1 = resolved(_vector.X, _vector.Y, SpacingResult, t6, RegionsKeyResult, nil).overflow
					
					if #Overflow1 > 0 then
						local List2 = {}
						
						for _, value3 in Overflow1 do
							table.insert(List2, List[value3].Name)
						end
						table.insert(List1, `{math.floor(_vector.X)} by {math.floor(_vector.Y)}: {table.concat(List2, ", ")}`)
					end
				end
			end
			local Joined = if #List1 > 0 then table.concat(List1, "; ") else nil
			FacetUnfitDetails.Value = Joined or ""
			local HasJoined = Joined ~= nil or nil
			
			if PlainResult:GetAttribute("FacetUnfit") ~= HasJoined then
				PlainResult:SetAttribute("FacetUnfit", HasJoined)
			end
			local PeekResult = CellResult5:peek()
			local v23 = #PeekResult == #Down
			for i4, value4 in Down do
				v23 = v23 and PeekResult[i4] == value4
			end
			if not v23 then
				CellResult5:set(Down)
			end
			local PeekResult1 = CellResult3:peek()
			
			if PeekResult1.top ~= Moved.top or PeekResult1.bottom ~= Moved.bottom or PeekResult1.hang ~= Moved.hang or PeekResult1.leanTop ~= Moved.leanTop or PeekResult1.leanBottom ~= Moved.leanBottom then
				CellResult3:set(Moved)
			end
			local PeekResult2 = CellResult4:peek()
			
			if PeekResult2.top ~= Packed.top or PeekResult2.bottom ~= Packed.bottom then
				CellResult4:set(Packed)
			end
			local t8 = {}
			
			for _, value5 in Overflow do
				local Entry = List[value5]
				t8[Entry] = true
				
				if not t3[Entry] and not t2[Entry] then
					local v24 = (t4[Entry] or 0) + 1
					t4[Entry] = v24
					SchedulerResult.after(2, function()
						-- upvalues: t3 (upval), Entry (copy), t4 (upval), v24 (copy), t2 (upval), AbsoluteSizeResult (upval), LayoutUnitResult (upval)
						if t3[Entry] and t4[Entry] == v24 and not t2[Entry] then
							t2[Entry] = true
							local PeekResultRatio = AbsoluteSizeResult:peek() / LayoutUnitResult:peek()
							warn(`Facet Composition: Region '{Entry.Name}' does not fit {math.floor(PeekResultRatio.X)} by {math.floor(PeekResultRatio.Y)} even at its last form and nothing else can give way. Give it a smaller form, mayDrop = true or a higher rank number`)
						end
					end)
				end
			end
			t3 = t8
			local IsNotVectorMatch: boolean = Vector ~= nil and (Vector.X > 0 and Vector ~= CallbackResultRatio)
			Vector = CallbackResultRatio
			local IsXAbove: boolean = config ~= nil and (CallbackResult2 ~= nil and CallbackResult2.X > 0)
			
			local function _(p10)
				-- upvalues: t6 (copy), Down (copy), IsXAbove (copy)
				local Zone = t6[p10].zone
				
				return if Zone == "topbar" and (Down[p10] or not IsXAbove) then if t6[p10].trailing then "topRight" else "top" else Zone
			end
			
			local t9 = {}
			local t10 = {}
			local TopRights = {}
			
			for i5, value6 in t6 do
				local Size1 = if Chosen[i5] > 0 then value6.sizes[Chosen[i5]] else nil
				TopRights[i5] = ""
				
				if Size1 and (Size1.x <= 0 or Size1.y <= 0) then
					t10[i5] = true
				elseif Size1 then
					local Zone = t6[i5].zone
					local TopRight = if Zone == "topbar" and (Down[i5] or not IsXAbove) then if t6[i5].trailing then "topRight" else "top" else Zone
					t9[TopRight] = true
					
					if CallbackResultRatio.X > 0 and CallbackResultRatio.Y > 0 and (value6.zone ~= "topbar" or not v21 or Down[i5]) then
						TopRights[i5] = TopRight
					end
				end
			end
			for i6, value7 in List do
				self[value7].animate = IsNotVectorMatch
				self[value7].form:set(Chosen[i6])
				local Yielding = self[value7].yielding
				local v25 = false
				
				if t10[i6] == true then
					local Zone = t6[i6].zone
					v25 = t9[if Zone == "topbar" and (Down[i6] or not IsXAbove) then if t6[i6].trailing then "topRight" else "top" else Zone] == true
				end
				Yielding:set(v25)
			end
			local t11 = {}
			
			if ReadFunction(p6.rows, Callback) ~= "fit" then
				local SpacingResult1: number = OfResult.spacing(S, Callback)
				
				for _, value8 in { "top", "bottom" } do
					local Top = if value8 == "top" then Packed.top else Packed.bottom
					local Largest = -1
					
					if value8 == "top" then
						for i3, value2 in t6 do
							local Size2 = if Chosen[i3] > 0 then value2.sizes[Chosen[i3]] else nil
							
							if value2.zone == "topbar" then
								local Zone = t6[i3].zone
								
								if (if Zone == "topbar" and (Down[i3] or not IsXAbove) then if t6[i3].trailing then "topRight" else "top" else Zone) == "top" and (Size2 and not t10[i3]) then
									Largest = math.max(Largest, Size2.x)
								end
							end
						end
					end
					local Tbl = {}
					
					local function close()
						-- upvalues: Tbl (copy), List (upval), t6 (copy), Chosen (copy), self (upval), OfResult (upval), IntrinsicResults (upval), Count1 (upval), IsNotCallbackResultMatch (copy), ExtentMatchModule (upval), NewExtentMatch (upval), t5 (upval), v20 (ref), t11 (copy)
						if #Tbl < 2 then
							table.clear(Tbl)
							
							return
						end
						local List1 = {}
						local t = {}
						local IntrinsicResults1 = {}
						
						for _, value in Tbl do
							local Entry = List[value]
							local Y: number = t6[value].sizes[Chosen[value]].y
							local Content = self[Entry].contents[Chosen[value]]
							local YRatio = if Y > 0 then Content.AbsoluteSize.Y / Y else 1
							table.insert(List1, Entry)
							t[Entry] = Y
							local IntrinsicResult = OfResult.intrinsic(Content, false, if YRatio > 0 then YRatio else 1)
							IntrinsicResults1[Entry] = IntrinsicResult
							local IntrinsicResult1 = IntrinsicResults[Entry]
							
							if IntrinsicResult1 == nil or math.abs(IntrinsicResult1 - IntrinsicResult) >= 0.5 then
								Count1 = 0
							end
							IntrinsicResults[Entry] = IntrinsicResult
						end
						table.sort(List1, function(A, B): boolean
							-- upvalues: IntrinsicResults1 (copy)
							return IntrinsicResults1[B] < IntrinsicResults1[A]
						end)
						local t12 = {}
						local IsCountAbove = Count1 >= 30
						local NoIsCountAbove: boolean = IsNotCallbackResultMatch and not IsCountAbove
						
						if NoIsCountAbove then
							IsCountAbove = true
						end
						local Count = 1
						while Count <= #List1 do
							local IntrinsicResult = IntrinsicResults1[List1[Count]]
							local List2 = {}
							while Count <= #List1 and IntrinsicResult * 0.5 <= IntrinsicResults1[List1[Count]] do
								table.insert(List2, List1[Count])
								Count += 1
							end
							if #List2 < 2 then continue end
							for _, value1 in List2 do
								t12[value1] = true
							end
							if not NoIsCountAbove then continue end
							local StepResult, StepResult2 = ExtentMatchModule.step(NewExtentMatch, List2, t, IntrinsicResults1, if OfResult.frameless() then 0 else nil)
							
							for _, value2 in List2 do
								t5[value2] = StepResult[value2]
							end
							IsCountAbove = IsCountAbove and StepResult2
						end
						v20 = v20 or not IsCountAbove
						
						for _, value3 in Tbl do
							local Entry = List[value3]
							
							if not t12[Entry] then
								ExtentMatchModule.forget(NewExtentMatch, Entry)
								t5[Entry] = nil
								t11[value3] = 0
								continue
							end
							local Floor = self[Entry].floors[Chosen[value3]]
							
							if Floor and not Floor() and self[Entry].lift:peek() > 0 then
								ExtentMatchModule.forget(NewExtentMatch, Entry)
							end
							t11[value3] = t5[Entry] or 0
						end
						table.clear(Tbl)
					end
					
					for i2, value1 in t6 do
						local Size = if Chosen[i2] > 0 then value1.sizes[Chosen[i2]] else nil
						
						if value1.zone == value8 and Size and not t10[i2] then
							if Largest >= 0 and Top + 0.5 < Largest + SpacingResult1 + Size.x then
								close()
								Largest = -1
							end
							if Largest < 0 then
								Largest = Size.x
							else
								Largest = Largest + SpacingResult1 + Size.x
							end
							table.insert(Tbl, i2)
						end
					end
					close()
				end
			end
			for i7, value9 in List do
				local Entry1 = t11[i7]
				
				if Entry1 == nil then
					ExtentMatchModule.forget(NewExtentMatch, value9)
					t5[value9] = nil
					IntrinsicResults[value9] = nil
				end
				if self[value9].lift:peek() ~= (Entry1 or 0) then
					self[value9].lift:set(Entry1 or 0)
				end
			end
			if IsNotCallbackResultMatch then
				Count1 += 1
			end
			if v20 and NextFrameResult == nil and Count1 < 30 and not OfResult.frameless() then
				NextFrameResult = OfResult.nextFrame(function()
					-- upvalues: NextFrameResult (upval), CellResult11 (upval)
					NextFrameResult = nil
					CellResult11:set(CellResult11:peek() + 1)
				end)
			end
			CellResult10:set(TopRights)
		end)
		local CellResult12 = Compose.cell(0)
		
		local function moved()
			-- upvalues: CellResult12 (copy)
			CellResult12:set(CellResult12:peek() + 1)
		end
		
		Runtime.connect(PlainResult, "AncestryChanged", moved)
		local VisibleResult = p1.observe.Visible(PlainResult)
		local VisibleResults = {}
		
		for i2, value10 in List do
			VisibleResults[i2] = p1.observe.Visible(value10)
		end
		local LayerCollector = nil
		local Parent = nil
		local Connection = nil
		local Flag = false
		
		local function report()
			-- upvalues: Flag (ref), LayerCollector (ref), ReservationsModule (upval), PlainResult (copy)
			Flag = false
			local LayerCollector1 = LayerCollector
			
			if LayerCollector1 == nil then return end
			for _, value in ReservationsModule.contests(LayerCollector1, PlainResult) do
				ReservationsModule.note(PlainResult, value.token, value.zone)
				warn(`Facet Composition: Compositions '{PlainResult.Name}' and '{value.token.Name}' both place regions in the {value.zone} zone of one screen. Each Composition lays out only its own regions, so the regions can overlap. Keep the HUD of a screen in one Composition`)
			end
		end
		
		Compose.watch(function(Callback)
			-- upvalues: CellResult12 (copy), PlainResult (copy), LayerCollector (ref), Connection (ref), ReservationsModule (upval), moved (copy), CellResult10 (copy), VisibleResult (copy), VisibleResults (copy), p1 (upval), Parent (ref), Flag (ref), SchedulerResult (copy), report (copy)
			Callback(CellResult12)
			local LayerCollector1 = PlainResult:FindFirstAncestorWhichIsA("LayerCollector")
			
			if LayerCollector1 ~= LayerCollector then
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
				if LayerCollector then
					ReservationsModule.clearZones(LayerCollector, PlainResult)
				end
				LayerCollector = LayerCollector1
				
				if LayerCollector1 then
					Connection = LayerCollector1:GetPropertyChangedSignal("Enabled"):Connect(moved)
				end
			end
			local CallbackResult = Callback(CellResult10)
			
			if LayerCollector1 == nil then return end
			local t = {}
			
			if LayerCollector1.Enabled and Callback(VisibleResult) ~= false then
				for i, value in CallbackResult do
					if value ~= "" and Callback(VisibleResults[i]) ~= false then
						t[value] = true
					end
				end
			end
			local SetZonesResult = ReservationsModule.setZones(LayerCollector1, PlainResult, t, p1.config.compositionScope) or LayerCollector1.Parent ~= Parent
			Parent = LayerCollector1.Parent
			
			if SetZonesResult and not Flag and #ReservationsModule.contests(LayerCollector1, PlainResult) > 0 then
				Flag = true
				SchedulerResult.after(2, report)
			end
		end)
		Compose.cleanup(function()
			-- upvalues: Connection (ref), LayerCollector (ref), ReservationsModule (upval), PlainResult (copy)
			if Connection then
				Connection:Disconnect()
			end
			if LayerCollector then
				ReservationsModule.clearZones(LayerCollector, PlainResult)
			end
		end)
		assert(p6.passive == nil or type(p6.passive) == "boolean", "Facet Composition passive must be a boolean")
		
		if p6.passive ~= false then
			local config1 = {
				passive = true,
				gameplayGuard = false,
				engageOnPress = false,
				resignOnActivate = true
			}
			p1.responder(PlainResult, config1)
			
			if v10 then
				p1.responder(v10, config1)
			end
		end
		return PlainResult
	end)
end