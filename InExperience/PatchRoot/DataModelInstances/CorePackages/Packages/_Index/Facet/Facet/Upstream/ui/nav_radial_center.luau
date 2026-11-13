local NavRadialGeometryModule = require("./nav_radial_geometry")
local OverlayPlacementModule = require("./overlay_placement")
local _ = require("./types")
local _ = require("./radial_types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")
local _ = require("./nav_radial_menu")
local _ = require("./nav_radial_layout")
local _ = require("./nav_radial_sectors")

return function(p1, p2, p3, p4, p5, p6, Frame: Frame, p7, p8)
	-- upvalues: OverlayPlacementModule (copy), NavRadialGeometryModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local Spec = p4.spec
	local Corner = p4.corner
	local PaintedFunction = p4.painted
	local Path = p4.path
	local Candidate = p4.candidate
	local Naming = p4.naming
	local TouchPoint = p4.touchPoint
	local Preferred = p4.preferred
	local Viewport = p5.viewport
	local Origin = p5.origin
	local Launcher = p5.launcher
	local AnchorSize = p5.anchorSize
	local Center = p5.center
	local Layout = p5.layout
	local Sectors = p5.sectors
	local Fallback = p5.fallback
	local TransparencyFunction = p6.transparency
	local Panel = p6.panel
	local IsEmpty: boolean = Spec.center == "empty" or Spec.center == "content"
	
	local function showCenter(Callback): boolean
		-- upvalues: Corner (copy), Spec (copy), Fallback (copy), IsEmpty (copy), Sectors (copy)
		if Corner and Spec.center == "empty" and Spec.centerPassThrough and not Callback(Fallback) then
			return false
		end
		if Corner or Callback(Fallback) or not IsEmpty then
			return true
		end
		for _, value in Callback(Sectors) do
			if value.id == "$navigation" then
				return false
			end
		end
		return true
	end
	
	local function _(Callback)
		-- upvalues: Corner (copy), IsEmpty (copy), Fallback (copy)
		local PeekResult = Corner
		
		if not PeekResult then
			PeekResult = IsEmpty
			
			if not PeekResult then
				if Callback then
					return (Callback(Fallback))
				end
				PeekResult = Fallback:peek()
			end
		end
		return PeekResult
	end
	
	local function centerAction()
		-- upvalues: Corner (copy), IsEmpty (copy), Fallback (copy), Spec (copy), p4 (copy)
		if Corner or (IsEmpty or Fallback:peek()) or Spec.center == nil or Spec.center == "back" then
			p4.back()
			
			return
		end
		if Spec.center == "root" then
			p4.jump({})
			
			return
		else
			p4.close()
		end
	end
	
	local _ = function(Callback): number
		-- upvalues: showCenter (copy), PaintedFunction (copy), Layout (copy)
		return if showCenter(Callback) then math.min(PaintedFunction(Callback), 2 * Callback(Layout).inner - 4) else 0
	end
	
	local function centerName(Callback)
		-- upvalues: Path (copy), Corner (copy), IsEmpty (copy), Fallback (copy), Spec (copy), ReadFunction (copy)
		local Count = #Callback(Path)
		
		if Corner or (IsEmpty or (if Callback then Callback(Fallback) else Fallback:peek())) or Spec.center == nil or Spec.center == "back" then
			local Corner1 = Corner or (IsEmpty or (if Callback then Callback(Fallback) else Fallback:peek()))
			local ReadResult = if Corner1 then nil else ReadFunction(Spec.centerLabel, Callback)
			
			if not ReadResult then
				if Count == 0 then
					return "Close"
				end
				ReadResult = "Back"
			end
			return ReadResult
		else
			local ReadResult1 = ReadFunction(Spec.centerLabel, Callback)
			
			if not ReadResult1 then
				if Spec.center == "root" then
					return "Home"
				end
				ReadResult1 = "Close"
			end
			return ReadResult1
		end
	end
	
	local function morph(p9): number
		-- upvalues: TransparencyFunction (copy)
		return 1 - TransparencyFunction(p9)
	end
	
	local function diameter(Callback)
		-- upvalues: Fallback (copy), PaintedFunction (copy), Corner (copy), Launcher (copy), AnchorSize (copy), TransparencyFunction (copy), showCenter (copy), Layout (copy)
		if Callback(Fallback) then
			return PaintedFunction(Callback)
		elseif Corner and Launcher and AnchorSize then
			local CallbackResult = Callback(AnchorSize)
			
			return (math.floor(PaintedFunction(Callback) + (math.max(PaintedFunction(Callback), (math.min(CallbackResult.X, CallbackResult.Y))) - PaintedFunction(Callback)) * (1 - (1 - TransparencyFunction(Callback))) + 0.5))
		else
			return if showCenter(Callback) then math.min(PaintedFunction(Callback), 2 * Callback(Layout).inner - 4) else 0
		end
	end
	
	local function centerAt(Callback)
		-- upvalues: Fallback (copy), PaintedFunction (copy), p1 (copy), TypesUDim2 (copy), p6 (copy), Center (copy)
		if Callback(Fallback) then
			return TypesUDim2.new(1, -math.max(8 + PaintedFunction(Callback) / 2, math.max(PaintedFunction(Callback), p1.metric("targetSizes.minimum", Callback)) / 2), 0, p6.headerHeight(Callback) / 2)
		else
			local CallbackResult = Callback(Center)
			
			return TypesUDim2.fromOffset(CallbackResult.X, CallbackResult.Y)
		end
	end
	
	local HideLauncher: (() -> ())? = nil
	local CenterNode = p2.Button("Center")({
		corners = "pill",
		appearance = "utility",
		ZIndex = 105,
		name = centerName,
		icon = function(Callback): string
			-- upvalues: Spec (copy), Corner (copy), IsEmpty (copy), Fallback (copy), centerName (copy)
			if Spec.center == "root" and (not Corner and (not IsEmpty and not (if Callback then Callback(Fallback) else Fallback:peek()))) then
				return "chevron.up"
			else
				return if centerName(Callback) == "Back" then "chevron.leading" else "close"
			end
		end,
		Visible = showCenter,
		Position = centerAt,
		AnchorPoint = TypesVector2.new(0.5, 0.5),
		Size = function(p9)
			-- upvalues: diameter (copy), TypesUDim2 (copy)
			local DiameterResult = diameter(p9)
			
			return TypesUDim2.fromOffset(DiameterResult, DiameterResult)
		end,
		AutomaticSize = TypesEnum.AutomaticSize.None,
		onActivate = centerAction
	})
	local CenterHit = Host.TextButton("CenterHit")({
		Text = "",
		BackgroundTransparency = 1,
		Selectable = false,
		ZIndex = 104,
		Visible = showCenter,
		Position = centerAt,
		AnchorPoint = TypesVector2.new(0.5, 0.5),
		Size = function(p9)
			-- upvalues: diameter (copy), p1 (copy), TypesUDim2 (copy)
			local Largest = math.max(diameter(p9), (p1.metric("targetSizes.minimum", p9)))
			
			return TypesUDim2.fromOffset(Largest, Largest)
		end,
		Activated = centerAction
	})
	
	if Launcher and Launcher:IsA("GuiObject") then
		HideLauncher = function()
			-- upvalues: Frame (copy), TypesEnum (copy), p7 (copy), Launcher (copy), TypesUDim2 (copy), p8 (copy), Corner (copy), Compose (copy)
			local AutomaticSize = Frame.AutomaticSize
			local Size = Frame.Size
			local IsNotAutomaticSizeMatch = AutomaticSize ~= TypesEnum.AutomaticSize.None
			local AbsoluteSizeRatio = Frame.AbsoluteSize / p7:peek()
			
			local function show()
				-- upvalues: Launcher (upval), IsNotAutomaticSizeMatch (copy), Frame (upval), AutomaticSize (copy), Size (copy)
				Launcher.Visible = true
				
				if IsNotAutomaticSizeMatch then
					Frame.AutomaticSize = AutomaticSize
					Frame.Size = Size
				end
			end
			
			if IsNotAutomaticSizeMatch then
				local FromOffsetResult = TypesUDim2.fromOffset(AbsoluteSizeRatio.X, AbsoluteSizeRatio.Y)
				Frame.AutomaticSize = TypesEnum.AutomaticSize.None
				Frame.Size = FromOffsetResult
			end
			Launcher.Visible = false
			local Exiting = if p8 and Corner then p8.exiting else nil
			
			if Exiting then
				Compose.watch(function(Callback)
					-- upvalues: Exiting (copy), Launcher (upval), IsNotAutomaticSizeMatch (copy), Frame (upval), AutomaticSize (copy), Size (copy)
					if Callback(Exiting) then
						Launcher.Visible = true
						
						if IsNotAutomaticSizeMatch then
							Frame.AutomaticSize = AutomaticSize
							Frame.Size = Size
						end
					end
				end)
			end
			Compose.cleanup(show)
		end
	end
	if Corner and Launcher and Launcher:IsA("GuiObject") then
		local LeadingIcon = CenterNode:FindFirstChild("LeadingIcon", true)
		
		if LeadingIcon then
			Runtime.decorate(LeadingIcon, {
				ImageTransparency = function(p9): number
					-- upvalues: TransparencyFunction (copy)
					return 1 - (1 - TransparencyFunction(p9))
				end
			})
		end
		p3.attach(CenterNode, {
			p1.icon(Spec.icon or "more", {
				Name = "LauncherIcon",
				AnchorPoint = TypesVector2.new(0.5, 0.5),
				Position = TypesUDim2.fromScale(0.5, 0.5),
				ImageTransparency = morph
			})
		})
	end
	if not Corner then
		local LeadingIcon = CenterNode:FindFirstChild("LeadingIcon", true)
		
		if LeadingIcon then
			Runtime.decorate(LeadingIcon, { ImageTransparency = TransparencyFunction })
		end
	end
	if Spec.center == "content" and Spec.centerContent and not Corner then
		local CenterContentResult = if type(Spec.centerContent) == "function" then Spec.centerContent() else Spec.centerContent
		Runtime.decorate(CenterContentResult, {
			ZIndex = 105,
			Position = function(Callback)
				-- upvalues: Center (copy), TypesUDim2 (copy)
				local CallbackResult = Callback(Center)
				
				return TypesUDim2.fromOffset(CallbackResult.X, CallbackResult.Y)
			end,
			AnchorPoint = TypesVector2.new(0.5, 0.5)
		})
		p3.attach(Panel, { CenterContentResult })
	end
	p4.skin(CenterNode, Spec.skin and Spec.skin.center)
	
	local function reachOf(p9)
		local Inner = p9.inner
		
		for _, sector in p9.sectors do
			Inner = math.max(Inner, sector.outer)
		end
		return Inner
	end
	
	local CellResult = Compose.cell(TypesVector2.zero)
	
	local function previewSize(Callback)
		-- upvalues: CellResult (copy), TypesVector2 (copy), Viewport (copy), p1 (copy)
		local CallbackResult = Callback(CellResult)
		
		return TypesVector2.new(math.min(240, math.max(0, Callback(Viewport).X - 16), if CallbackResult.X > 0 then math.ceil(CallbackResult.X) else 240), (math.max(p1.metric("typography.caption.size", Callback) + 12, (math.ceil(CallbackResult.Y)))))
	end
	
	local function previewPlace(Callback)
		-- upvalues: Layout (copy), TypesUDim2 (copy), p6 (copy), previewSize (copy), TypesVector2 (copy), Center (copy), Candidate (copy), TouchPoint (copy), Preferred (copy), TypesEnum (copy), Viewport (copy), Origin (copy), OverlayPlacementModule (upval), p1 (copy), NavRadialGeometryModule (upval), Spec (copy)
		local CallbackResult = Callback(Layout)
		
		if CallbackResult.list then
			return TypesUDim2.fromOffset(0, (math.max(0, (p6.headerHeight(Callback) - previewSize(Callback).Y) / 2))), TypesVector2.zero
		end
		local CallbackResult1 = Callback(Center)
		local CallbackResult2 = Callback(Candidate)
		local Vector = nil
		
		for _, sector in CallbackResult.sectors do
			if sector.key == CallbackResult2 then
				Vector = sector
			end
		end
		local CallbackResult3 = Callback(TouchPoint)
		
		if Vector and (CallbackResult3 or Preferred and Callback(Preferred) == TypesEnum.PreferredInput.Touch) then
			local CallbackResult4 = Callback(Viewport)
			local NewTypesVectorDelta = if CallbackResult3 then TypesVector2.new(CallbackResult3.X, CallbackResult3.Y) - Callback(Origin) else CallbackResult1 + TypesVector2.new(Vector.x, Vector.y)
			local PreviewSizeResult = previewSize(Callback)
			local Uch = OverlayPlacementModule.touch({ x = NewTypesVectorDelta.X, y = NewTypesVectorDelta.Y }, { w = PreviewSizeResult.X, h = PreviewSizeResult.Y }, {
				x = 8,
				y = 8,
				w = math.max(0, CallbackResult4.X - 16),
				h = math.max(0, CallbackResult4.Y - 16)
			}, p1.metric("targetSizes.minimum", Callback) + p1.metric("space.s", Callback))
			
			return TypesUDim2.fromOffset(Uch.x + Uch.w / 2, Uch.y + Uch.h), TypesVector2.new(0.5, 1)
		end
		local Radians = math.rad(if Vector then Vector.angle else NavRadialGeometryModule.arc(Spec.preset or "donut") + 45)
		local Sine = math.sin(Radians)
		local Negated = -math.cos(Radians)
		local NewSpaceS = nil
		
		if Vector then
			NewSpaceS = math.sqrt(Vector.x * Vector.x + Vector.y * Vector.y) + math.max(44, Vector.size) / 2 + p1.metric("space.xs", Callback)
		else
			local Largest = CallbackResult.inner
			
			for _, sector1 in CallbackResult.sectors do
				Largest = math.max(Largest, sector1.outer)
			end
			NewSpaceS = Largest + p1.metric("space.s", Callback)
		end
		local function _(p10: number): number
			return if p10 > 0.3 then 0 elseif p10 < -0.3 then 1 else 0.5
		end
		
		return TypesUDim2.fromOffset(CallbackResult1.X + Sine * NewSpaceS, CallbackResult1.Y + Negated * NewSpaceS), TypesVector2.new(if Sine > 0.3 then 0 elseif Sine < -0.3 then 1 else 0.5, if Negated > 0.3 then 0 elseif Negated < -0.3 then 1 else 0.5)
	end
	
	local function previewWidth(Callback): number
		-- upvalues: TouchPoint (copy), Preferred (copy), TypesEnum (copy), Viewport (copy), previewPlace (copy)
		if Callback(TouchPoint) or Preferred and Callback(Preferred) == TypesEnum.PreferredInput.Touch then
			return (math.min(240, (math.max(0, Callback(Viewport).X - 16))))
		else
			local PreviewPlaceResult, PreviewPlaceResult2 = previewPlace(Callback)
			local Offset: number = PreviewPlaceResult.X.Offset
			local X: number = Callback(Viewport).X
			
			return (math.max(0, (math.min(240, if PreviewPlaceResult2.X == 0 then X - 8 - Offset elseif PreviewPlaceResult2.X == 1 then Offset - 8 else math.min(Offset - 8, X - 8 - Offset) * 2))))
		end
	end
	
	local SelectionPreview = p1.text({
		Name = "SelectionPreview",
		Size = function(Callback)
			-- upvalues: Layout (copy), TypesUDim2 (copy), PaintedFunction (copy), p1 (copy)
			return if Callback(Layout).list then TypesUDim2.new(1, -math.max(PaintedFunction(Callback), p1.metric("targetSizes.minimum", Callback)) - 8, 0, 0) else TypesUDim2.fromOffset(0, 0)
		end,
		AutomaticSize = function(Callback)
			-- upvalues: Layout (copy), TypesEnum (copy)
			return if Callback(Layout).list then TypesEnum.AutomaticSize.Y else TypesEnum.AutomaticSize.XY
		end,
		Position = function(p10)
			-- upvalues: previewPlace (copy)
			return (previewPlace(p10))
		end,
		AnchorPoint = function(p10)
			-- upvalues: previewPlace (copy)
			local _, PreviewPlaceResult2 = previewPlace(p10)
			
			return PreviewPlaceResult2
		end,
		TextXAlignment = function(p10)
			-- upvalues: previewPlace (copy), TypesEnum (copy)
			local _, PreviewPlaceResult2 = previewPlace(p10)
			
			return if PreviewPlaceResult2.X == 0.5 then TypesEnum.TextXAlignment.Center elseif PreviewPlaceResult2.X == 0 then TypesEnum.TextXAlignment.Left else TypesEnum.TextXAlignment.Right
		end,
		TextWrapped = true,
		Text = function(Callback)
			-- upvalues: Layout (copy), Naming (copy), Candidate (copy), Sectors (copy), p6 (copy), ReadFunction (copy), ReadFunction (copy), Spec (copy), Path (copy)
			if Callback(Layout).list then
				local List = {}
				local ReadResult = ReadFunction(Spec.items, Callback)
				
				for _, value in Callback(Path) do
					local v1 = nil
					local ReadResult3 = ReadResult or {}
					for i1 = 1, #ReadResult3 do
						local ReadResultEntry = ReadResult3[i1]
						
						if ReadResultEntry.id == value then
							v1 = ReadResultEntry
						end
					end
					if v1 == nil then break end
					table.insert(List, (tostring(ReadFunction(v1.label, Callback) or value)))
					ReadResult = ReadFunction(v1.children, Callback)
				end
				return if #List > 0 then table.concat(List, " › ") else ReadFunction(Spec.label, Callback) or "Quick actions"
			else
				local CallbackResult = if Callback(Naming) then Callback(Candidate) else nil
				local CallbackResult1 = Callback(Sectors)
				local CallbackResultEntry = nil
				
				for i = 1, #CallbackResult1 do
					CallbackResultEntry = CallbackResult1[i]
					
					if CallbackResultEntry.key == CallbackResult and p6.iconic(Callback, CallbackResultEntry) then
						local ReadResult1 = ReadFunction(CallbackResultEntry.item.label, Callback) or ""
						local ReadResult2 = ReadFunction(CallbackResultEntry.item.description, Callback)
						
						return ReadResult1 .. (if ReadResult2 then " · " .. ReadResult2 else "")
					end
				end
				return ""
			end
		end,
		ZIndex = 106,
		p1.padding(8, 6)
	})
	p1.textRole(SelectionPreview, "caption")
	p3.attach(SelectionPreview, {
		Host.UISizeConstraint({
			MaxSize = function(Callback)
				-- upvalues: TypesVector2 (copy), Layout (copy), previewWidth (copy)
				return TypesVector2.new(if Callback(Layout).list then 1e999 else previewWidth(Callback), 1e999)
			end
		})
	})
	local LayoutSizeResult = p1.layoutSize(SelectionPreview, p7)
	Compose.watch(function(Callback)
		-- upvalues: LayoutSizeResult (copy), CellResult (copy), p6 (copy)
		local CallbackResult = Callback(LayoutSizeResult)
		CellResult:set(CallbackResult)
		p6.listHeaderHeight:set(CallbackResult.Y)
	end)
	local TextResult = p1.observe.Text(SelectionPreview)
	Runtime.decorate(SelectionPreview, {
		Visible = function(Callback)
			-- upvalues: Layout (copy), Naming (copy), Candidate (copy), TextResult (copy)
			return Callback(Layout).list or Callback(Naming) and (Callback(Candidate) ~= nil and Callback(TextResult) ~= "")
		end
	})
	
	return {
		showCenter = showCenter,
		centerNode = CenterNode,
		centerHit = CenterHit,
		hideLauncher = HideLauncher,
		reachOf = reachOf,
		preview = SelectionPreview,
		previewPlate = p1.styled(Host.Frame("SelectionPlate")({
			ZIndex = 105,
			Position = function(p10)
				-- upvalues: previewPlace (copy)
				return (previewPlace(p10))
			end,
			AnchorPoint = function(p10)
				-- upvalues: previewPlace (copy)
				return select(2, previewPlace(p10))
			end,
			Size = function(p10)
				-- upvalues: TypesUDim2 (copy), previewSize (copy)
				return TypesUDim2.fromOffset(previewSize(p10).X, previewSize(p10).Y)
			end,
			Visible = function(Callback)
				-- upvalues: Layout (copy), Naming (copy), Candidate (copy), TextResult (copy)
				return not Callback(Layout).list and (Callback(Layout).list or Callback(Naming) and (Callback(Candidate) ~= nil and Callback(TextResult) ~= ""))
			end
		}), "tooltip")
	}
end