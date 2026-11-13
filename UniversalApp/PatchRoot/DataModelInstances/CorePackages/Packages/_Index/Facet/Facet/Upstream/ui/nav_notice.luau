local _ = require("./control_types")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("./overlay_types")
local CoreModule = require("../vendor/compose/core")
local _ = require("./theme_types")
local OverlayPartsModule = require("./overlay_parts")
local ReservationsModule = require("./reservations")
local MotionModule = require("./motion")
local PresentationReadinessModule = require("./presentation_readiness")
local FreezeModule = require("./freeze")
local _ = require("./overlay_props")
local PreparationModule = require("./preparation")
local list = {
	"message", "title", "severity", "appearance", "placement", "icon", "link",
	"actions", "onDismiss", "controlSize"
}
local list1 = {
	"onBack", "backLabel", "title", "titleSize", "leading", "center", "trailing",
	"gap", "padding", "surface"
}
local FreezeModuleResult = FreezeModule({
	info = "status.info",
	success = "status.success",
	warning = "status.warning",
	error = "status.error"
})
local FreezeModuleResult1 = FreezeModule({
	info = "facet-icon-info",
	success = "facet-icon-success",
	warning = "facet-icon-warning",
	error = "facet-icon-error"
})

return function(p1, p2, p3)
	-- upvalues: OverlayPartsModule (copy), FreezeModuleResult (copy), MotionModule (copy), FreezeModuleResult1 (copy), CoreModule (copy), list (copy), PreparationModule (copy), PresentationReadinessModule (copy), ReservationsModule (copy), list1 (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesUDim = p1.types.UDim
	
	local function space(Gap, p4, p5)
		-- upvalues: p1 (copy)
		return if type(Gap) == "number" then Gap else p1.metric("space." .. (Gap or p4), p5)
	end
	
	p2.Notice = p1.construct("Notice", function(p4)
		-- upvalues: OverlayPartsModule (upval), p1 (copy), FreezeModuleResult (upval), Runtime (copy), Compose (copy), MotionModule (upval), ReadFunction (copy), TypesUDim2 (copy), TypesEnum (copy), Host (copy), p2 (copy), TypesUDim (copy), FreezeModuleResult1 (upval), p3 (copy), CoreModule (upval), list (upval), PreparationModule (upval), PresentationReadinessModule (upval), ReservationsModule (upval)
		if not OverlayPartsModule.bound(p1, p4.message, "string") then
			error("Facet UI.Notice: message is required; it is a string or a bound string", 0)
		end
		if p4.title ~= nil and not OverlayPartsModule.bound(p1, p4.title, "string") then
			error("Facet UI.Notice: title must be a string or a bound string", 0)
		end
		local Severity = p4.severity or "info"
		
		if FreezeModuleResult[Severity] == nil then
			error("Facet UI.Notice: severity must be info, success, warning or error", 0)
		end
		local Appearance = p4.appearance or "standard"
		
		if Appearance ~= "standard" and Appearance ~= "emphasis" then
			error("Facet UI.Notice: appearance must be standard or emphasis", 0)
		end
		local Placement = p4.placement or "inline"
		
		if Placement ~= "inline" and Placement ~= "affixed" then
			error("Facet UI.Notice: placement must be inline or affixed", 0)
		end
		if p4.icon ~= nil and type(p4.icon) ~= "boolean" and (type(p4.icon) ~= "string" or p4.icon == "") then
			error("Facet UI.Notice: icon must be true, false, or an icon name or image source", 0)
		end
		local Link = p4.link
		
		if Link ~= nil then
			if type(Link) ~= "table" then
				error("Facet UI.Notice: link must be { label, onActivate }", 0)
			end
			OverlayPartsModule.known("UI.Notice", Link, { "label", "onActivate" }, "link")
			
			if not OverlayPartsModule.bound(p1, Link.label, "string") or type(Link.onActivate) ~= "function" then
				error("Facet UI.Notice: link needs a label and an onActivate function", 0)
			end
		end
		if p4.onDismiss ~= nil and type(p4.onDismiss) ~= "function" then
			error("Facet UI.Notice: onDismiss must be a function", 0)
		end
		local ReadResult = p1.read(p4.controlSize)
		
		if ReadResult ~= nil and ReadResult ~= "xsmall" and ReadResult ~= "compact" and ReadResult ~= "regular" and ReadResult ~= "large" then
			error("Facet UI.Notice: controlSize must be xsmall, compact, regular or large", 0)
		end
		local Actions = p4.actions or {}
		OverlayPartsModule.checkActions(p1, "UI.Notice", p4.actions, 2, { "Link", "Close" })
		local Frames = Runtime.host.frames
		local RunService = p1.config.services.RunService
		local HasPreRender: boolean = Frames ~= nil and (RunService ~= nil and RunService.PreRender ~= nil)
		local CellResult = Compose.cell(HasPreRender)
		local LevelResult = MotionModule.level(p1)
		local Reveal = p1.motionTiming("reveal")
		local CellResult1 = Compose.cell(false)
		local CellResult2 = Compose.cell(false)
		local TweenResult = Runtime.tween(function(Callback): number
			-- upvalues: CellResult1 (copy)
			return if Callback(CellResult1) then 1 else 0
		end, {
			seconds = function(_)
				-- upvalues: CellResult1 (copy), Reveal (copy)
				return if CellResult1:peek() then Reveal.enter else Reveal.exit
			end,
			ease = p1.motionEase("present")
		})
		local TweenResult1 = Runtime.tween(function(Callback): number
			-- upvalues: CellResult1 (copy)
			return if Callback(CellResult1) then 1 else 0
		end, {
			seconds = p1.metric("motion.reducedFade"),
			ease = p1.motionEase("fade")
		})
		
		local function _(p5)
			-- upvalues: ReadFunction (upval), CellResult (copy), LevelResult (copy), CellResult1 (copy), p1 (upval), TweenResult (copy)
			if ReadFunction(CellResult, p5) then
				return 0
			else
				local LevelResultResult = LevelResult(p5)
				
				return if LevelResultResult == "limited" then 1 elseif LevelResultResult == "none" then if ReadFunction(CellResult1, p5) then 1 else 0 else p1.readSource(TweenResult, p5)
			end
		end
		
		local IsEmphasis = Appearance == "emphasis"
		local Text = "facet-status-" .. Severity
		local CellResult3 = Compose.cell(0)
		local CellResult4 = Compose.cell(0)
		local CellResult5 = Compose.cell(0)
		
		local function panelCarve(p5)
			-- upvalues: IsEmphasis (copy), ReadFunction (upval), p1 (upval)
			local ReadResult = if IsEmphasis then nil else ReadFunction(p1.config.theme, p5)
			local Panel = (if ReadResult then ReadResult.chrome or {} else {}).panel
			local ContentInsets = if Panel then Panel.contentInsets or {} else {}
			
			return {
				left = math.max(8, ContentInsets.left or 0),
				right = math.max(8, ContentInsets.right or 0),
				top = math.max(8, ContentInsets.top or 0),
				bottom = math.max(8, ContentInsets.bottom or 0)
			}
		end
		
		local FormulaResult = Compose.formula(function(Callback): boolean
			-- upvalues: Link (copy), Actions (copy), panelCarve (copy), p1 (upval), CellResult4 (copy), CellResult5 (copy), CellResult3 (copy)
			if Link == nil and #Actions == 0 then
				return true
			else
				local PanelCarveResult = panelCarve(Callback)
				
				return Callback(CellResult4) + Callback(CellResult5) + (p1.metric("targetSizes.minimum", Callback) * 2 + 32 + PanelCarveResult.left + PanelCarveResult.right - 16) <= Callback(CellResult3)
			end
		end)
		
		local _ = function(Object)
			-- upvalues: IsEmphasis (copy), Text (copy)
			if IsEmphasis then
				Object:AddTag(Text)
			end
			return Object
		end
		
		local List1 = {}
		
		if p4.title ~= nil then
			local Title = p4.title
			local Title1 = p1.text({
				Name = "Title",
				TextWrapped = true,
				Text = function(p5)
					-- upvalues: ReadFunction (upval), Title (copy)
					return ReadFunction(Title, p5) or ""
				end,
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y
			})
			
			if IsEmphasis then
				Title1:AddTag(Text)
			end
			p1.textRole(Title1, "label")
			Title1:AddTag("facet-strong")
			table.insert(List1, Title1)
		end
		local Message = p1.text({
			Name = "Message",
			TextWrapped = true,
			Text = function(p5)
				-- upvalues: ReadFunction (upval), p4 (copy)
				return ReadFunction(p4.message, p5) or ""
			end,
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y
		})
		
		if IsEmphasis then
			Message:AddTag(Text)
		end
		table.insert(List1, Message)
		local MessageMeasure = p1.text({
			Name = "MessageMeasure",
			TextWrapped = false,
			TextTransparency = 1,
			Visible = false,
			Text = function(p5)
				-- upvalues: ReadFunction (upval), p4 (copy)
				return ReadFunction(p4.message, p5) or ""
			end,
			Size = TypesUDim2.fromOffset(0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.None
		})
		local TextBoundsResult = p1.observe.TextBounds(MessageMeasure)
		Compose.watch(function(Callback)
			-- upvalues: CellResult4 (copy), TextBoundsResult (copy)
			CellResult4:set((math.ceil(Callback(TextBoundsResult).X)))
		end)
		table.insert(List1, MessageMeasure)
		local List2 = {
			(p1.column(List1, {
				Name = "Copy",
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				Host.UIFlexItem({
					FlexMode = function(Callback)
						-- upvalues: FormulaResult (copy), TypesEnum (upval)
						return if Callback(FormulaResult) then TypesEnum.UIFlexMode.Fill else TypesEnum.UIFlexMode.None
					end
				})
			}))
		}
		
		if Link ~= nil or #Actions > 0 then
			local List3 = {}
			
			if Link then
				local OnActivateFunction = Link.onActivate
				table.insert(List3, p2.Button("Link")({
					label = Link.label,
					appearance = if IsEmphasis then nil else "link",
					controlSize = p4.controlSize,
					onActivate = function(_, _)
						-- upvalues: OnActivateFunction (copy)
						OnActivateFunction()
					end
				}))
			end
			for _, action in Actions do
				table.insert(List3, p2.Button({
					Name = action.id,
					label = action.label,
					enabled = action.enabled,
					busy = action.busy,
					role = if action.role == "destructive" then "destructive" else nil,
					appearance = if action.role == "default" and not IsEmphasis then "emphasis" else nil,
					controlSize = p4.controlSize,
					onActivate = function(_, _)
						-- upvalues: action (copy)
						action.onActivate()
					end
				}))
			end
			local RowResult = p1.row(List3, { Name = "Accessories" })
			local UIListLayout = RowResult:FindFirstChildWhichIsA("UIListLayout")
			
			if UIListLayout then
				UIListLayout.Wraps = true
				UIListLayout.VerticalAlignment = TypesEnum.VerticalAlignment.Center
			end
			local AbsoluteSizeResult = p1.observe.AbsoluteSize(RowResult)
			Compose.watch(function(Callback)
				-- upvalues: CellResult5 (copy), AbsoluteSizeResult (copy)
				CellResult5:set(Callback(AbsoluteSizeResult).X)
			end)
			table.insert(List2, RowResult)
		end
		local config = {
			Name = "Body",
			BackgroundTransparency = 1,
			GroupTransparency = function(Callback): number
				-- upvalues: LevelResult (copy), TweenResult1 (copy)
				return if LevelResult(Callback) == "limited" then 1 - Callback(TweenResult1) else 0
			end,
			Size = TypesUDim2.new(0, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y
		}
		config[#config + 1] = Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
		config[#config + 1] = Host.UIListLayout({
			FillDirection = function(Callback)
				-- upvalues: FormulaResult (copy), TypesEnum (upval)
				return if Callback(FormulaResult) then TypesEnum.FillDirection.Horizontal else TypesEnum.FillDirection.Vertical
			end,
			VerticalAlignment = TypesEnum.VerticalAlignment.Center,
			SortOrder = TypesEnum.SortOrder.LayoutOrder,
			Padding = TypesUDim.new(0, 8)
		})
		
		for LayoutOrder, value in List2 do
			Runtime.decorate(value, { LayoutOrder = LayoutOrder })
			config[#config + 1] = value
		end
		local List = {}
		
		if p4.icon ~= false then
			local IconResult = p1.icon(if type(p4.icon) == "string" then p4.icon else FreezeModuleResult[Severity], { Name = "Icon", LayoutOrder = 1 })
			
			if not IsEmphasis then
				IconResult:AddTag(FreezeModuleResult1[Severity])
			end
			table.insert(List, IconResult)
		end
		local FadeResult = p1.fade(config)
		table.insert(List, FadeResult)
		local GuiService = p3.service("GuiService")
		local v1 = assert(Compose.currentOwner())
		local Frame = nil
		local OnFrameResult = nil
		Compose.cleanup(function()
			-- upvalues: OnFrameResult (ref)
			local Callback: () -> () = OnFrameResult
			OnFrameResult = nil
			
			if Callback then
				Callback()
			end
		end)
		
		local function collapse(Callback: () -> ())
			-- upvalues: CellResult2 (copy), CoreModule (upval), v1 (copy), CellResult1 (copy), Frames (copy), LevelResult (copy), ReadFunction (upval), CellResult (copy), p1 (upval), TweenResult (copy), GuiService (copy), p3 (upval), Frame (ref), OnFrameResult (ref), TweenResult1 (copy)
			if CellResult2:peek() then return end
			local function _()
				-- upvalues: CellResult2 (upval), Callback (copy), CoreModule (upval), v1 (upval), CellResult1 (upval)
				CellResult2:set(false)
				Callback()
				
				if not CoreModule.owner.isDisposed(v1) then
					CellResult1:set(true)
				end
			end
			
			if Frames ~= nil and LevelResult() ~= "none" then
				local Source = nil
				if ReadFunction(CellResult, nil) then
					Source = 0
				else
					local LevelResultResult = LevelResult(nil)
					Source = if LevelResultResult == "limited" then 1 elseif LevelResultResult == "none" then if ReadFunction(CellResult1, nil) then 1 else 0 else p1.readSource(TweenResult, nil)
				end
				if Source > 0 then
					CellResult2:set(true)
					
					if GuiService and p3.within(p1.selection.get(), Frame) then
						p1.selection.set(nil)
					end
					CellResult1:set(false)
					OnFrameResult = Frames.onFrame(function()
						-- upvalues: LevelResult (upval), ReadFunction (upval), CellResult (upval), CellResult1 (upval), p1 (upval), TweenResult (upval), TweenResult1 (upval), OnFrameResult (upval), CellResult2 (upval), Callback (copy), CoreModule (upval), v1 (upval)
						local LevelResultResult = LevelResult()
						
						if LevelResultResult == "normal" then
							local Source = nil
							if ReadFunction(CellResult, nil) then
								Source = 0
							else
								local LevelResultResult1 = LevelResult(nil)
								Source = if LevelResultResult1 == "limited" then 1 elseif LevelResultResult1 == "none" then if ReadFunction(CellResult1, nil) then 1 else 0 else p1.readSource(TweenResult, nil)
							end
							if Source > 0 then return end
						end
						if LevelResultResult ~= "limited" or TweenResult1:peek() <= 0 then
							local Callback1: () -> () = OnFrameResult
							OnFrameResult = nil
							
							if Callback1 then
								Callback1()
							end
							CellResult2:set(false)
							Callback()
							
							if not CoreModule.owner.isDisposed(v1) then
								CellResult1:set(true)
							end
							return
						end
					end)
					
					return
				end
			end
			CellResult2:set(false)
			Callback()
			
			if not CoreModule.owner.isDisposed(v1) then
				CellResult1:set(true)
			end
		end
		
		if p4.onDismiss then
			local OnDismiss = p4.onDismiss
			table.insert(List, p2.Button("Close")({
				name = "Close",
				icon = "close",
				LayoutOrder = 3,
				controlSize = p4.controlSize,
				Size = OverlayPartsModule.closeTarget(p1),
				AutomaticSize = TypesEnum.AutomaticSize.None,
				onActivate = function()
					-- upvalues: collapse (copy), OnDismiss (copy)
					collapse(OnDismiss)
				end
			}))
		end
		local PropsResult = p1.props(p4, list, {
			Name = "Notice",
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y,
			ZIndex = if Placement == "affixed" then 50 else nil
		})
		local Visible = PropsResult.Visible
		
		function PropsResult.Visible(p5): boolean
			-- upvalues: ReadFunction (upval), Visible (copy)
			return ReadFunction(Visible, p5) ~= false
		end
		
		local Size = PropsResult.Size or TypesUDim2.new(1, 0, 0, 0)
		local AutomaticSize = PropsResult.AutomaticSize or TypesEnum.AutomaticSize.Y
		local ClipsDescendants = PropsResult.ClipsDescendants
		local Interactable = PropsResult.Interactable
		local UIPaddingResult = Host.UIPadding({
			PaddingLeft = function(p5)
				-- upvalues: TypesUDim (upval), panelCarve (copy)
				return TypesUDim.new(0, panelCarve(p5).left)
			end,
			PaddingRight = function(p5)
				-- upvalues: TypesUDim (upval), panelCarve (copy)
				return TypesUDim.new(0, panelCarve(p5).right)
			end,
			PaddingTop = function(p5)
				-- upvalues: TypesUDim (upval), panelCarve (copy)
				return TypesUDim.new(0, panelCarve(p5).top)
			end,
			PaddingBottom = function(p5)
				-- upvalues: TypesUDim (upval), panelCarve (copy)
				return TypesUDim.new(0, panelCarve(p5).bottom)
			end
		})
		local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(FadeResult)
		
		local _ = function(p5): boolean
			-- upvalues: ReadFunction (upval), CellResult (copy), LevelResult (copy), CellResult1 (copy), p1 (upval), TweenResult (copy)
			local Source = nil
			if ReadFunction(CellResult, p5) then
				Source = 0
			else
				local LevelResultResult = LevelResult(p5)
				Source = if LevelResultResult == "limited" then 1 elseif LevelResultResult == "none" then if ReadFunction(CellResult1, p5) then 1 else 0 else p1.readSource(TweenResult, p5)
			end
			return Source >= 1
		end
		
		function PropsResult.AutomaticSize(p5)
			-- upvalues: ReadFunction (upval), CellResult (copy), LevelResult (copy), CellResult1 (copy), p1 (upval), TweenResult (copy), AutomaticSize (copy), TypesEnum (upval)
			local Source = nil
			if ReadFunction(CellResult, p5) then
				Source = 0
			else
				local LevelResultResult = LevelResult(p5)
				Source = if LevelResultResult == "limited" then 1 elseif LevelResultResult == "none" then if ReadFunction(CellResult1, p5) then 1 else 0 else p1.readSource(TweenResult, p5)
			end
			return if Source >= 1 then ReadFunction(AutomaticSize, p5) else TypesEnum.AutomaticSize.None
		end
		
		function PropsResult.Size(Callback)
			-- upvalues: ReadFunction (upval), Size (copy), CellResult (copy), LevelResult (copy), CellResult1 (copy), p1 (upval), TweenResult (copy), TypesUDim (upval), AbsoluteSizeResult1 (copy), List (copy), FadeResult (copy), UIPaddingResult (copy), TypesUDim2 (upval)
			local ReadResult = ReadFunction(Size, Callback)
			local Source = nil
			
			if ReadFunction(CellResult, Callback) then
				Source = 0
			else
				local LevelResultResult = LevelResult(Callback)
				Source = if LevelResultResult == "limited" then 1 elseif LevelResultResult == "none" then if ReadFunction(CellResult1, Callback) then 1 else 0 else p1.readSource(TweenResult, Callback)
			end
			if Source >= 1 then
				return ReadResult
			end
			local X = if typeof(ReadResult) == "UDim2" then ReadResult.X else TypesUDim.new(1, 0)
			local Y = Callback(AbsoluteSizeResult1).Y
			
			for _, Gui in List do
				if typeof(Gui) == "Instance" and Gui ~= FadeResult and Gui:IsA("GuiObject") then
					Y = math.max(Y, Gui.Size.Y.Offset)
				end
			end
			local NewY = Y + UIPaddingResult.PaddingTop.Offset + UIPaddingResult.PaddingBottom.Offset
			local NewFunction = TypesUDim2.new
			local Scale = X.Scale
			local Offset = X.Offset
			local v2 = 0
			local Source1 = nil
			
			if ReadFunction(CellResult, Callback) then
				Source1 = 0
			else
				local LevelResultResult = LevelResult(Callback)
				Source1 = if LevelResultResult == "limited" then 1 elseif LevelResultResult == "none" then if ReadFunction(CellResult1, Callback) then 1 else 0 else p1.readSource(TweenResult, Callback)
			end
			return NewFunction(Scale, Offset, v2, (math.floor(NewY * Source1 + 0.5)))
		end
		
		function PropsResult.ClipsDescendants(p5): boolean
			-- upvalues: ReadFunction (upval), CellResult (copy), LevelResult (copy), CellResult1 (copy), p1 (upval), TweenResult (copy), ClipsDescendants (copy)
			local Source = nil
			if ReadFunction(CellResult, p5) then
				Source = 0
			else
				local LevelResultResult = LevelResult(p5)
				Source = if LevelResultResult == "limited" then 1 elseif LevelResultResult == "none" then if ReadFunction(CellResult1, p5) then 1 else 0 else p1.readSource(TweenResult, p5)
			end
			return Source < 1 or ReadFunction(ClipsDescendants, p5) == true
		end
		
		function PropsResult.Interactable(Callback): boolean
			-- upvalues: CellResult2 (copy), CellResult (copy), ReadFunction (upval), Interactable (copy)
			return not Callback(CellResult2) and (not Callback(CellResult) and ReadFunction(Interactable, Callback) ~= false)
		end
		
		Frame = Host.Frame(PropsResult)
		
		if not HasPreRender then
			CellResult1:set(true)
		end
		p3.attach(Frame, {
			UIPaddingResult,
			p1.corner(),
			Host.UIListLayout({
				FillDirection = TypesEnum.FillDirection.Horizontal,
				VerticalAlignment = TypesEnum.VerticalAlignment.Top,
				SortOrder = TypesEnum.SortOrder.LayoutOrder,
				Padding = TypesUDim.new(0, 8)
			})
		})
		p3.attach(Frame, List)
		p1.styled(Frame, "notice")
		p1.styled(Frame, if IsEmphasis then "status-" .. Severity else "panel")
		
		if not IsEmphasis then
			p1.skin(Frame, "panel")
		end
		Frame:SetAttribute("NoticeSeverity", Severity)
		local AbsoluteSizeResult2 = p1.observe.AbsoluteSize(Frame)
		Compose.watch(function(Callback)
			-- upvalues: CellResult3 (copy), AbsoluteSizeResult2 (copy)
			CellResult3:set(Callback(AbsoluteSizeResult2).X)
		end)
		Compose.watch(function(Callback)
			-- upvalues: Frame (ref), FormulaResult (copy)
			Frame:SetAttribute("NoticeAccessories", if Callback(FormulaResult) then "beside" else "below")
		end)
		
		if HasPreRender then
			PreparationModule.begin(p1, Frame)
			local PresentationReadinessModuleResult = PresentationReadinessModule(p1, { FadeResult })
			Compose.watch(function(Callback)
				-- upvalues: PresentationReadinessModuleResult (copy), CellResult (copy), CellResult1 (copy), PreparationModule (upval), p1 (upval), Frame (ref)
				if Callback(PresentationReadinessModuleResult) and CellResult:peek() then
					CellResult:set(false)
					CellResult1:set(true)
					PreparationModule.finish(p1, Frame)
				end
			end)
		end
		if Placement == "affixed" then
			local v3 = assert(Compose.currentOwner())
			local t = {}
			local AbsolutePositionResult = p1.observe.AbsolutePosition(Frame)
			local v4 = nil
			local v5 = nil
			
			local function locate()
				-- upvalues: CoreModule (upval), v3 (copy), v4 (ref), v5 (ref), ReservationsModule (upval), t (copy), Compose (upval), Frame (ref), p1 (upval), AbsolutePositionResult (copy), AbsoluteSizeResult2 (copy), Runtime (upval)
				if CoreModule.owner.isDisposed(v3) then return end
				if v4 then
					CoreModule.owner.dispose(v4)
				end
				if v5 then
					ReservationsModule.clear(v5, t)
					v5 = nil
				end
				local Child = CoreModule.owner.createChild(v3)
				v4 = Child
				Compose.withOwner(Child, function()
					-- upvalues: Frame (upval), v5 (upval), p1 (upval), ReservationsModule (upval), t (upval), Compose (upval), AbsolutePositionResult (upval), AbsoluteSizeResult2 (upval), Runtime (upval)
					local LayerCollector = Frame:FindFirstAncestorWhichIsA("LayerCollector")
					
					if LayerCollector ~= nil then
						v5 = LayerCollector
						local VisibleResult = p1.observe.Visible(Frame)
						local AbsolutePositionResult1 = p1.observe.AbsolutePosition(LayerCollector)
						local AbsoluteSizeResult = p1.observe.AbsoluteSize(LayerCollector)
						
						local function _()
							-- upvalues: Frame (upval), LayerCollector (copy), ReservationsModule (upval), t (upval)
							local AbsoluteSize = Frame.AbsoluteSize
							local Visible = AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 and Frame.Visible
							local YDelta = Frame.AbsolutePosition.Y - LayerCollector.AbsolutePosition.Y
							ReservationsModule.set(LayerCollector, t, "top", if Visible then YDelta else nil, if Visible then AbsoluteSize.Y else nil)
						end
						
						local Services = p1.config.services
						local RunService = Services and Services.RunService
						Compose.watch(function(Callback: (any) -> ())
							-- upvalues: AbsoluteSizeResult (copy), AbsolutePositionResult (upval), AbsolutePositionResult1 (copy), AbsoluteSizeResult2 (upval), VisibleResult (copy), Frame (upval), LayerCollector (copy), ReservationsModule (upval), t (upval), RunService (copy), Runtime (upval)
							Callback(AbsoluteSizeResult)
							Callback(AbsolutePositionResult)
							Callback(AbsolutePositionResult1)
							Callback(AbsoluteSizeResult2)
							Callback(VisibleResult)
							local AbsoluteSize = Frame.AbsoluteSize
							local Visible = AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 and Frame.Visible
							local YDelta = Frame.AbsolutePosition.Y - LayerCollector.AbsolutePosition.Y
							ReservationsModule.set(LayerCollector, t, "top", if Visible then YDelta else nil, if Visible then AbsoluteSize.Y else nil)
							
							if RunService then
								local Callback1 = nil
								Callback1 = Runtime.connect(RunService, "Heartbeat", function()
									-- upvalues: Callback1 (ref), Frame (upval), LayerCollector (upval), ReservationsModule (upval), t (upval)
									if Callback1 then
										Callback1()
										Callback1 = nil
									end
									local AbsoluteSize = Frame.AbsoluteSize
									local Visible = AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 and Frame.Visible
									local YDelta = Frame.AbsolutePosition.Y - LayerCollector.AbsolutePosition.Y
									ReservationsModule.set(LayerCollector, t, "top", if Visible then YDelta else nil, if Visible then AbsoluteSize.Y else nil)
								end)
							end
						end)
						
						return
					end
				end)
			end
			
			Runtime.connect(Frame, "AncestryChanged", locate)
			locate()
			Compose.cleanup(function()
				-- upvalues: v5 (ref), ReservationsModule (upval), t (copy)
				if v5 then
					ReservationsModule.clear(v5, t)
				end
			end)
		end
		return Frame
	end)
	p2.NavBar = p1.construct("NavBar", function(p5)
		-- upvalues: Compose (copy), OverlayPartsModule (upval), p1 (copy), space (copy), p2 (copy), Host (copy), TypesUDim2 (copy), ReadFunction (copy), TypesEnum (copy), list1 (upval), Runtime (copy), TypesUDim (copy), p3 (copy)
		local OnBackFunction = p5.onBack
		
		if OnBackFunction ~= nil and type(OnBackFunction) ~= "function" and not Compose.isValue(OnBackFunction) then
			error("Facet UI.NavBar: onBack must be a function or a writable boolean cell", 0)
		end
		local TrailingResult = if type(p5.trailing) == "function" then p5.trailing() else p5.trailing
		
		if TrailingResult ~= nil and (not OverlayPartsModule.instance(TrailingResult) or not TrailingResult:IsA("GuiObject")) then
			error("Facet UI.NavBar: trailing is one GuiObject or a factory that returns one; put a cluster in a frame", 0)
		end
		if p5.trailing ~= nil and TrailingResult == nil then
			error("Facet UI.NavBar: trailing factory must return one GuiObject", 0)
		end
		for _, value in { "leading", "center" } do
			local v2 = p5[value]
			
			if v2 ~= nil and not OverlayPartsModule.instance(v2) then
				error(`Facet UI.NavBar: {value} must be a GuiObject`, 0)
			end
		end
		if p5.title ~= nil and not OverlayPartsModule.bound(p1, p5.title, "string") then
			error("Facet UI.NavBar: title must be a string or a bound string", 0)
		end
		local Entry = ({
			surface = "facet-surface",
			panel = "facet-panel",
			pane = "facet-pane"
		})[p5.surface or ""]
		
		if p5.surface ~= nil and Entry == nil then
			error("Facet UI.NavBar: surface must be surface, panel or pane", 0)
		end
		local function v135(p6)
			-- upvalues: space (upval), p5 (copy)
			return space(p5.gap, "s", p6)
		end
		
		local List = {}
		
		if OnBackFunction then
			local Visible = true
			
			if type(OnBackFunction) == "function" then
				local OnBack: () -> () = OnBackFunction
			else
				if type(OnBackFunction.set) ~= "function" then
					error("Facet UI.NavBar: onBack must be a function or a writable boolean cell", 0)
				end
				Visible = OnBackFunction
				
				local function OnBack()
					-- upvalues: OnBackFunction (copy)
					OnBackFunction:set(false)
				end
			end
			table.insert(List, OverlayPartsModule.back(p1, p2, p5.backLabel, OnBack, { Visible = Visible }))
			table.insert(List, Host.Frame("BackGap")({
				BackgroundTransparency = 1,
				Visible = Visible,
				Size = function(p6)
					-- upvalues: TypesUDim2 (upval), p1 (upval)
					return TypesUDim2.fromOffset(p1.metric("space.s", p6), 0)
				end
			}))
		end
		if p5.leading then
			table.insert(List, p1.row({ p5.leading }, { Name = "Leading" }))
		end
		local Center = p5.center
		local v3 = nil
		
		if Center == nil and p5.title ~= nil then
			local Title = p5.title
			local Title1 = p1.text({
				Name = "Title",
				TextWrapped = false,
				Text = function(p6)
					-- upvalues: ReadFunction (upval), Title (copy)
					return ReadFunction(Title, p6) or ""
				end,
				TextTruncate = TypesEnum.TextTruncate.AtEnd,
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y
			})
			p1.textRole(Title1, p5.titleSize or "title")
			Center = Title1
			local TitleMeasure = p1.text({
				Name = "TitleMeasure",
				Visible = false,
				TextWrapped = false,
				Text = function(p6)
					-- upvalues: ReadFunction (upval), Title (copy)
					return ReadFunction(Title, p6) or ""
				end,
				Size = TypesUDim2.fromOffset(0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.XY
			})
			p1.textRole(TitleMeasure, p5.titleSize or "title")
			v3 = TitleMeasure
		end
		local config = {
			Name = "Center",
			BackgroundTransparency = 1,
			Size = TypesUDim2.new(0, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y
		}
		config[#config + 1] = Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
		config[#config + 1] = Host.UIListLayout({
			FillDirection = TypesEnum.FillDirection.Horizontal,
			VerticalAlignment = TypesEnum.VerticalAlignment.Center,
			SortOrder = TypesEnum.SortOrder.LayoutOrder
		})
		
		if Center then
			config[#config + 1] = Center
		end
		if v3 then
			config[#config + 1] = v3
		end
		local FrameResult = Host.Frame(config)
		table.insert(List, FrameResult)
		local RowResult = p1.row(List, {
			Name = "Primary",
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y
		})
		local CellResult = Compose.cell(false)
		local List1 = { RowResult }
		local Object = nil
		
		if TrailingResult then
			local v4 = Host.ScrollingFrame("Trailing")({
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = TypesUDim2.fromOffset(0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				AutomaticCanvasSize = TypesEnum.AutomaticSize.X,
				CanvasSize = TypesUDim2.fromOffset(0, 0),
				CanvasPosition = p1.types.Vector2.zero,
				ScrollingDirection = TypesEnum.ScrollingDirection.X,
				ScrollBarThickness = 0,
				ClipsDescendants = true,
				Host.UIListLayout({
					FillDirection = TypesEnum.FillDirection.Horizontal,
					HorizontalAlignment = TypesEnum.HorizontalAlignment.Left,
					SortOrder = TypesEnum.SortOrder.LayoutOrder
				}),
				TrailingResult
			})
			Object = v4
			table.insert(List1, v4)
		end
		local RowResult1 = p1.row(List1, p1.props(p5, list1, {
			Name = "NavBar",
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y
		}))
		
		if Entry then
			RowResult1:AddTag(Entry)
		end
		RowResult1:SetAttribute("FacetNavBar", true)
		local UIListLayout = RowResult1:FindFirstChildWhichIsA("UIListLayout")
		
		if UIListLayout then
			Runtime.decorate(UIListLayout, {
				FillDirection = function(Callback)
					-- upvalues: CellResult (copy), TypesEnum (upval)
					return if Callback(CellResult) then TypesEnum.FillDirection.Vertical else TypesEnum.FillDirection.Horizontal
				end,
				HorizontalAlignment = TypesEnum.HorizontalAlignment.Right,
				VerticalAlignment = TypesEnum.VerticalAlignment.Center,
				Padding = function(p6)
					-- upvalues: TypesUDim (upval), v135 (copy)
					return TypesUDim.new(0, v135(p6))
				end
			})
		end
		local List2 = { RowResult }
		
		if Object then
			table.insert(List2, Object)
		end
		for _, value1 in List2 do
			local UIListLayout1 = value1:FindFirstChildWhichIsA("UIListLayout")
			
			if UIListLayout1 then
				Runtime.decorate(UIListLayout1, {
					VerticalAlignment = TypesEnum.VerticalAlignment.Center,
					Padding = function(p6)
						-- upvalues: TypesUDim (upval), v135 (copy)
						return TypesUDim.new(0, v135(p6))
					end
				})
			end
		end
		p3.attach(RowResult, {
			(Host.UIFlexItem({
				FlexMode = function(Callback)
					-- upvalues: CellResult (copy), TypesEnum (upval)
					return if Callback(CellResult) then TypesEnum.UIFlexMode.None else TypesEnum.UIFlexMode.Fill
				end
			}))
		})
		Runtime.decorate(RowResult, {
			Size = function(Callback)
				-- upvalues: CellResult (copy), TypesUDim2 (upval)
				return if Callback(CellResult) then TypesUDim2.new(1, 0, 0, 0) else TypesUDim2.new(0, 0, 0, 0)
			end
		})
		
		if p5.padding ~= nil then
			local Padding = p5.padding
			p3.attach(RowResult1, {
				p1.padding(if type(Padding) == "number" then Padding else p1.metric("space." .. (Padding or "s"), nil), space(p5.padding, "s"))
			})
		end
		if Object then
			local LayoutSizeResult = p1.layoutSize(RowResult1)
			local LayoutUnitResult = p1.layoutUnit(RowResult1)
			local AbsoluteContentSizeResult = p1.observe.AbsoluteContentSize((assert(Object:FindFirstChildWhichIsA("UIListLayout"))))
			local ScrollBarThicknessResult = p1.observeStyled.ScrollBarThickness(Object)
			
			local function _(Callback): number
				-- upvalues: LayoutSizeResult (copy), p5 (copy), p1 (upval)
				local X: number = Callback(LayoutSizeResult).X
				
				if X <= 0 then
					return 1e999
				end
				local v5 = 0
				local v6 = nil
				
				if p5.padding == nil then
					v6 = 0
				else
					local Padding = p5.padding
					v6 = (if type(Padding) == "number" then Padding else p1.metric("space." .. (Padding or "s"), Callback)) * 2
				end
				return (math.max(v5, X - v6))
			end
			
			Runtime.decorate(Object, {
				AutomaticSize = TypesEnum.AutomaticSize.None,
				Size = function(Callback)
					-- upvalues: AbsoluteContentSizeResult (copy), LayoutUnitResult (copy), TypesUDim2 (upval), LayoutSizeResult (copy), p5 (copy), p1 (upval), ScrollBarThicknessResult (copy)
					local CallbackResultRatio = Callback(AbsoluteContentSizeResult) / Callback(LayoutUnitResult)
					local FromOffsetFunction = TypesUDim2.fromOffset
					local X = CallbackResultRatio.X
					local Y = CallbackResultRatio.Y
					local X1 = CallbackResultRatio.X
					local X2: number = Callback(LayoutSizeResult).X
					local Largest = nil
					
					if X2 > 0 then
						local v5 = 0
						local v6 = nil
						
						if p5.padding == nil then
							v6 = 0
						else
							local Padding = p5.padding
							v6 = (if type(Padding) == "number" then Padding else p1.metric("space." .. (Padding or "s"), Callback)) * 2
						end
						Largest = math.max(v5, X2 - v6)
					else
						Largest = 1e999
					end
					return FromOffsetFunction(X, Y + (if Largest < X1 then Callback(ScrollBarThicknessResult) else 0))
				end
			})
			Runtime.mount(function()
				-- upvalues: Host (upval), p1 (upval), LayoutSizeResult (copy), p5 (copy)
				return Host.UISizeConstraint("ViewportBounds")({
					MaxSize = function(Callback)
						-- upvalues: p1 (upval), LayoutSizeResult (upval), p5 (upval)
						local NewFunction = p1.types.Vector2.new
						local X: number = Callback(LayoutSizeResult).X
						local Largest = nil
						
						if X > 0 then
							local v5 = 0
							local v6 = nil
							
							if p5.padding == nil then
								v6 = 0
							else
								local Padding = p5.padding
								v6 = (if type(Padding) == "number" then Padding else p1.metric("space." .. (Padding or "s"), Callback)) * 2
							end
							Largest = math.max(v5, X - v6)
						else
							Largest = 1e999
						end
						return NewFunction(Largest, 1e999)
					end
				})
			end, Object)
			local AbsoluteSizeResult = p1.observe.AbsoluteSize(RowResult1)
			local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(Object)
			local List11 = {}
			
			for _, Gui in RowResult:GetChildren() do
				if Gui:IsA("GuiObject") and Gui ~= FrameResult then
					table.insert(List11, {
						size = p1.observe.AbsoluteSize(Gui),
						shown = p1.observe.Visible(Gui)
					})
				end
			end
			local TextBoundsResult = if v3 then p1.observe.TextBounds(v3) else nil
			local Flag = false
			Compose.watch(function(Callback)
				-- upvalues: LayoutUnitResult (copy), AbsoluteSizeResult (copy), AbsoluteSizeResult1 (copy), RowResult1 (copy), Flag (ref), List11 (copy), p5 (copy), p1 (upval), TextBoundsResult (copy), CellResult (copy)
				local CallbackResult = Callback(LayoutUnitResult)
				local XRatio = Callback(AbsoluteSizeResult).X / CallbackResult
				
				if XRatio <= 0 or Callback(AbsoluteSizeResult1).X <= 0 then return end
				local Parent = RowResult1
				while Flag and Parent do
					local FacetTransitionZoomAttribute = Parent:GetAttribute("FacetTransitionZoom")
					
					if type(FacetTransitionZoomAttribute) == "number" and FacetTransitionZoomAttribute ~= 1 then return end
					Parent = Parent.Parent
				end
				Flag = true
				local NewX = 0
				
				for _, value in List11 do
					if Callback(value.shown) then
						local Gap = p5.gap
						NewX += Callback(value.size).X / CallbackResult + (if type(Gap) == "number" then Gap else p1.metric("space." .. (Gap or "s"), Callback))
					end
				end
				local Gap = p5.gap
				local IsSmallestAbove = math.min(if TextBoundsResult then Callback(TextBoundsResult).X / CallbackResult else p1.metric("controls.popup.panelWidth", Callback), XRatio - NewX) > XRatio - NewX - Callback(AbsoluteSizeResult1).X / CallbackResult - (if type(Gap) == "number" then Gap else p1.metric("space." .. (Gap or "s"), Callback))
				
				if IsSmallestAbove ~= CellResult:peek() then
					CellResult:set(IsSmallestAbove)
				end
			end)
		end
		return RowResult1
	end)
end