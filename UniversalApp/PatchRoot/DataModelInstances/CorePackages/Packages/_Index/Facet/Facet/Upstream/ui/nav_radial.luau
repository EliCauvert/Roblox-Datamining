local LayoutKitModule = require("./layout_kit")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("./control_types")
local _ = require("./radial_props")
local _ = require("./radial_types")
local CoreModule = require("../vendor/compose/core")
local NavRadialMenuModule = require("./nav_radial_menu")
local NavRadialLayoutModule = require("./nav_radial_layout")
local _ = require("./nav_radial_layout")
local NavRadialSectorsModule = require("./nav_radial_sectors")
local NavRadialCenterModule = require("./nav_radial_center")
local NavRadialGesturesModule = require("./nav_radial_gestures")
local NavOverlayPresenceModule = require("./nav_overlay_presence")

return function(p1, p2, p3)
	-- upvalues: LayoutKitModule (copy), NavRadialMenuModule (copy), CoreModule (copy), NavOverlayPresenceModule (copy), NavRadialLayoutModule (copy), NavRadialSectorsModule (copy), NavRadialCenterModule (copy), NavRadialGesturesModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local ReadFunction1 = p1.read
	local TypeNameOf = Runtime.host.typeNameOf or typeof
	local OfResult = LayoutKitModule.of(p1)
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	p2.RadialMenu = p1.construct("RadialMenu", function(p4)
		-- upvalues: NavRadialMenuModule (upval), p1 (copy), p3 (copy), ReadFunction (copy), Host (copy), TypesUDim2 (copy), TypesEnum (copy), Compose (copy), CoreModule (upval), NavOverlayPresenceModule (upval), p2 (copy), TypesVector2 (copy), NavRadialLayoutModule (upval), NavRadialSectorsModule (upval), OfResult (copy), NavRadialCenterModule (upval), NavRadialGesturesModule (upval), Runtime (copy), ReadFunction1 (copy), TypeNameOf (copy)
		assert(p4.items, "RadialMenu requires items")
		local NavRadialMenuModuleResult = NavRadialMenuModule(p1, p3, p4)
		local Session = NavRadialMenuModuleResult.session
		local Opened = NavRadialMenuModuleResult.opened
		local Scrim = NavRadialMenuModuleResult.scrim
		local SkinFunction: (any, any) -> () = NavRadialMenuModuleResult.skin
		local CancelFunction = NavRadialMenuModuleResult.cancel
		local CloseFunction = NavRadialMenuModuleResult.close
		local OpenFunction = NavRadialMenuModuleResult.open
		local BackFunction = NavRadialMenuModuleResult.back
		local IsPointerFunction = NavRadialMenuModuleResult.isPointer
		local ReadResult = ReadFunction(p4.anchor)
		local ReadResult1 = if typeof(ReadResult) == "Instance" and ReadResult:IsA("GuiObject") then ReadResult else nil
		local FrameResult = Host.Frame(p1.props(p4, {
			"items", "label", "launcher", "icon", "preset", "appearance", "buttonSurface",
			"captions", "captionPlacement", "distribution", "navigation", "expansion",
			"center", "centerLabel", "centerContent", "centerPassThrough", "completion",
			"anchor", "follow", "clearance", "ringWidth", "iconSize", "contentFit",
			"gestureSelection", "enabled", "holdAction", "skin", "onOpen", "onClose",
			"isPresented", "transition", "scrim"
		}, {
			Name = "RadialMenu",
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromOffset(0, 0),
			AutomaticSize = if ReadResult1 then TypesEnum.AutomaticSize.None else TypesEnum.AutomaticSize.XY
		}))
		local LayoutUnitResult = p1.layoutUnit(FrameResult)
		local v1 = assert(Compose.currentOwner())
		local Child = CoreModule.owner.createChild(v1)
		local v2 = nil
		local v3 = nil
		local v4 = nil
		local v5 = nil
		local v6 = nil
		local Parent = nil
		local v7 = nil
		local Radial = p1.motionTiming("radial")
		local DepartureResult = NavOverlayPresenceModule(p1).departure(Radial, FrameResult, function(): boolean
			-- upvalues: NavRadialMenuModuleResult (copy), p4 (copy)
			return not NavRadialMenuModuleResult.reduced() and p4.transition ~= false
		end)
		local ExitFunction = DepartureResult.exit
		
		function DepartureResult.exit(p5)
			-- upvalues: Radial (copy), p1 (upval), ExitFunction (copy)
			Radial.exit = p1.metric("motion.radial.exit")
			
			return ExitFunction(p5)
		end
		
		if p4.launcher ~= false then
			local Position: ((any) -> any)? = nil
			
			if ReadResult1 then
				local AbsolutePositionResult = p1.observe.AbsolutePosition(ReadResult1)
				local AbsoluteSizeResult = p1.observe.AbsoluteSize(ReadResult1)
				local AbsolutePositionResult1 = p1.observe.AbsolutePosition(FrameResult)
				
				Position = function(Callback)
					-- upvalues: AbsolutePositionResult (copy), AbsoluteSizeResult (copy), AbsolutePositionResult1 (copy), TypesUDim2 (upval)
					local CallbackResultDelta = Callback(AbsolutePositionResult) + Callback(AbsoluteSizeResult) / 2 - Callback(AbsolutePositionResult1)
					
					return TypesUDim2.fromOffset(CallbackResultDelta.X, CallbackResultDelta.Y)
				end
			end
			p3.attach(FrameResult, {
				p2.Button("Launcher")({
					AnchorPoint = if Position then TypesVector2.new(0.5, 0.5) else nil,
					Position = Position,
					label = p4.label or "Quick actions",
					name = p4.label or "Quick actions",
					icon = p4.icon or (if p4.label == nil then "more" else nil),
					shape = if p4.label == nil then "circle" else nil,
					enabled = p4.enabled,
					InputBegan = function(p5)
						-- upvalues: Opened (copy), IsPointerFunction (copy), OpenFunction (copy), Session (copy), NavRadialMenuModuleResult (copy)
						if not Opened:peek() and IsPointerFunction(p5) then
							OpenFunction()
							Session.openedByLauncher = Opened:peek()
							NavRadialMenuModuleResult.beginPointer(p5, false, true)
						end
					end,
					onActivate = function(p5)
						-- upvalues: Session (copy), IsPointerFunction (copy), Opened (copy), CloseFunction (copy), OpenFunction (copy)
						Session.openedByLauncher = false
						
						if Session.openedByLauncher and (p5 ~= nil and IsPointerFunction(p5)) then return end
						if Opened:peek() then
							CloseFunction()
							
							return
						else
							OpenFunction()
						end
					end
				})
			})
		end
		p3.attach(FrameResult, {
			p3.overlay(FrameResult, Opened, function(p5)
				-- upvalues: NavRadialLayoutModule (upval), p3 (upval), FrameResult (copy), p1 (upval), v2 (ref), v6 (ref), Parent (ref), v7 (ref), v5 (ref), CoreModule (upval), Child (ref), v1 (copy), v3 (ref), v4 (ref), Compose (upval), NavRadialMenuModuleResult (copy), NavRadialSectorsModule (upval), p2 (upval), OfResult (upval), LayoutUnitResult (copy), NavRadialCenterModule (upval), NavRadialGesturesModule (upval), BackFunction (copy), Scrim (copy), Runtime (upval), TypesUDim2 (upval), p4 (copy), SkinFunction (copy), CancelFunction (copy), ReadResult1 (copy), Host (upval), Opened (copy)
				local ParentResult = p3.parent(FrameResult)
				local ReadResult = p1.read(p1.config.theme)
				local Parent1 = FrameResult.Parent
				
				if v2 and (v6 ~= ParentResult or Parent ~= Parent1 or v7 ~= ReadResult or v5 ~= p5) then
					CoreModule.owner.dispose(Child)
					Child = CoreModule.owner.createChild(v1)
					v2 = nil
					v3 = nil
					v4 = nil
				end
				if v2 == nil then
					v2, v3, v34 = Compose.withOwner(Child, function()
						-- upvalues: NavRadialLayoutModule (copy), p1 (upval), NavRadialMenuModuleResult (upval), FrameResult (upval), NavRadialSectorsModule (upval), p2 (upval), p3 (upval), OfResult (upval), LayoutUnitResult (upval), p5 (copy), NavRadialCenterModule (upval)
						local NavRadialLayoutModuleResult = NavRadialLayoutModule(p1, NavRadialMenuModuleResult, FrameResult)
						local NavRadialSectorsModuleResult = NavRadialSectorsModule(p1, p2, p3, OfResult, NavRadialMenuModuleResult, NavRadialLayoutModuleResult, LayoutUnitResult, p5)
						local NavRadialCenterModuleResult = NavRadialCenterModule(p1, p2, p3, NavRadialMenuModuleResult, NavRadialLayoutModuleResult, NavRadialSectorsModuleResult, FrameResult, LayoutUnitResult, p5)
						p3.attach(NavRadialSectorsModuleResult.listHeader, {
							NavRadialCenterModuleResult.centerHit,
							NavRadialCenterModuleResult.centerNode,
							NavRadialCenterModuleResult.preview
						})
						p3.attach(NavRadialSectorsModuleResult.panel, { NavRadialCenterModuleResult.previewPlate })
						
						return NavRadialLayoutModuleResult, NavRadialSectorsModuleResult, NavRadialCenterModuleResult
					end)
					v6 = ParentResult
					Parent = Parent1
					v7 = ReadResult
					v5 = p5
				else
					assert(v3).enter()
				end
				local v8 = assert(v2)
				local v9 = assert(v3)
				local v10 = assert(v4)
				v8.following:set(false)
				NavRadialGesturesModule(p1, p3, NavRadialMenuModuleResult, v8, v9, v10)
				local Viewport = v8.viewport
				local Origin = v8.origin
				local Center = v8.center
				local Layout = v8.layout
				local Fallback = v8.fallback
				local HideLauncherFunction: () -> () = v10.hideLauncher
				local ModalResult = p3.modal(function()
					-- upvalues: v9 (copy)
					return v9.panel
				end, function(_)
					-- upvalues: BackFunction (upval)
					BackFunction()
				end, {
					keepsGameplay = true,
					entry = function()
						-- upvalues: v9 (copy)
						local PeekResult = v9.focus.current:peek()
						
						return if PeekResult then v9.buttons[PeekResult] else nil
					end,
					appearance = function(p6): number
						-- upvalues: v9 (copy)
						return 1 - (if p6 then v9.transparency(p6) else 0)
					end
				})
				ModalResult:SetAttribute("FacetArrivalGroup", true)
				
				if HideLauncherFunction then
					HideLauncherFunction()
				end
				local Scrim1 = ModalResult:FindFirstChild("Scrim")
				
				if Scrim1 then
					if Scrim == "dark" then
						Scrim1:AddTag("facet-radial-scrim")
					elseif Scrim == "none" then
						assert(Scrim1:IsA("GuiObject"))
						Scrim1:RemoveTag("facet-scrim")
						Scrim1.BackgroundTransparency = 1
					end
					Runtime.decorate(Scrim1, {
						Position = function(Callback)
							-- upvalues: Viewport (copy), TypesUDim2 (upval)
							local CallbackResult = Callback(Viewport)
							
							return TypesUDim2.fromOffset(-CallbackResult.X, -CallbackResult.Y)
						end,
						Size = function(Callback)
							-- upvalues: Viewport (copy), TypesUDim2 (upval)
							local CallbackResult = Callback(Viewport)
							
							return TypesUDim2.new(1, 2 * CallbackResult.X, 1, 2 * CallbackResult.Y)
						end
					})
				end
				if p4.skin and p4.skin.background then
					SkinFunction(ModalResult, p4.skin.background)
				end
				local AbsoluteSizeResult = p1.observe.AbsoluteSize(ModalResult)
				local AbsolutePositionResult = p1.observe.AbsolutePosition(ModalResult)
				Compose.watch(function(Callback)
					-- upvalues: AbsolutePositionResult (copy), AbsoluteSizeResult (copy), Origin (copy), Viewport (copy), CancelFunction (upval)
					local CallbackResult = Callback(AbsolutePositionResult)
					local CallbackResult1 = Callback(AbsoluteSizeResult)
					
					if CallbackResult1.X > 0 and CallbackResult1.Y > 0 then
						Origin:set(CallbackResult)
						
						if Viewport:peek() ~= CallbackResult1 then
							CancelFunction()
						end
						Viewport:set(CallbackResult1)
					end
				end)
				
				if p4.centerPassThrough and (p4.center == "empty" or p4.center == "content") then
					Runtime.decorate(ModalResult, { Active = Fallback })
					
					if Scrim1 then
						Runtime.decorate(Scrim1, { Active = Fallback, ScrollingEnabled = Fallback })
					end
					if ReadResult1 then
						p3.attach(ModalResult, {
							Compose.show(function(Callback): boolean
								-- upvalues: Fallback (copy)
								return not Callback(Fallback)
							end, function()
								-- upvalues: p1 (upval), ReadResult1 (copy), ModalResult (copy), Compose (upval)
								p1.modalPortal(ReadResult1, ModalResult)
								
								return Compose.fragment(function()
									return {}
								end)
							end)
						})
					end
					local DismissTarget = ModalResult:FindFirstChild("DismissTarget")
					
					if DismissTarget then
						Runtime.decorate(DismissTarget, { Visible = Fallback })
					end
					for _, value in { "Top", "Bottom", "Left", "Right" } do
						local FormulaResult = Compose.formula(function(Callback)
							-- upvalues: Viewport (copy), Center (copy), Layout (copy), value (copy)
							local CallbackResult = Callback(Viewport)
							local CallbackResult1 = Callback(Center)
							local Inner = Callback(Layout).inner
							local ClampedValue = math.clamp(CallbackResult1.X - Inner, 0, CallbackResult.X)
							local ClampedValue1 = math.clamp(CallbackResult1.X + Inner, 0, CallbackResult.X)
							local ClampedValue2 = math.clamp(CallbackResult1.Y - Inner, 0, CallbackResult.Y)
							local ClampedValue3 = math.clamp(CallbackResult1.Y + Inner, 0, CallbackResult.Y)
							
							return if value == "Top" then { 0, 0, CallbackResult.X, ClampedValue2 } elseif value == "Bottom" then {
								0,
								ClampedValue3,
								CallbackResult.X,
								CallbackResult.Y - ClampedValue3
							} elseif value == "Left" then {
								0,
								ClampedValue2,
								ClampedValue,
								ClampedValue3 - ClampedValue2
							} else {
								ClampedValue1,
								ClampedValue2,
								CallbackResult.X - ClampedValue1,
								ClampedValue3 - ClampedValue2
							}
						end)
						p3.attach(ModalResult, {
							Host.ScrollingFrame({
								Name = "Shield" .. value,
								BackgroundTransparency = 1,
								BorderSizePixel = 0,
								Active = true,
								CanvasSize = TypesUDim2.new(),
								ScrollBarThickness = 0,
								Selectable = false,
								ZIndex = 100,
								Visible = function(Callback)
									-- upvalues: Fallback (copy), Opened (upval)
									return not Callback(Fallback) and Callback(Opened)
								end,
								Position = function(Callback)
									-- upvalues: FormulaResult (copy), TypesUDim2 (upval)
									local CallbackResult = Callback(FormulaResult)
									
									return TypesUDim2.fromOffset(CallbackResult[1], CallbackResult[2])
								end,
								Size = function(Callback)
									-- upvalues: FormulaResult (copy), TypesUDim2 (upval)
									local CallbackResult = Callback(FormulaResult)
									
									return TypesUDim2.fromOffset(CallbackResult[3], CallbackResult[4])
								end,
								Host.TextButton({
									Text = "",
									BackgroundTransparency = 1,
									BorderSizePixel = 0,
									Selectable = false,
									Name = "Dismiss" .. value,
									Size = TypesUDim2.fromScale(1, 1),
									Activated = function(_, _)
										-- upvalues: BackFunction (upval)
										BackFunction()
									end
								})
							})
						})
					end
				end
				Compose.cleanup(function()
					-- upvalues: v9 (copy)
					if v9.panel.Parent then
						v9.panel.Parent = nil
					end
				end)
				
				return ModalResult
			end, { presence = DepartureResult })
		})
		Compose.watch(function(Callback)
			-- upvalues: ReadFunction (upval), p4 (copy), Opened (copy), Session (copy), CancelFunction (copy), ReadFunction1 (upval), TypeNameOf (upval), CloseFunction (copy)
			local ReadResult = ReadFunction(p4.anchor, Callback)
			
			if not Callback(Opened) then
				Session.branchOrigin = nil
				CancelFunction()
			end
			if ReadFunction1(p4.enabled, Callback) == false or TypeNameOf(ReadResult) ~= "Instance" and type(ReadResult) == "table" and ReadResult.visible == false then
				CloseFunction()
			end
		end)
		
		if p4.holdAction then
			Runtime.connect(p4.holdAction, "Pressed", function()
				-- upvalues: Session (copy), OpenFunction (copy)
				Session.held = true
				OpenFunction()
			end)
			Runtime.connect(p4.holdAction, "Released", function()
				-- upvalues: Session (copy), NavRadialMenuModuleResult (copy), CancelFunction (copy)
				if not Session.held then return end
				Session.held = false
				local v11 = if Session.analog and Session.candidateSector then assert(Session.candidateSector)() else nil
				
				if v11 then
					NavRadialMenuModuleResult.nativeActivate(v11, nil, "hold")
					
					return
				else
					CancelFunction()
				end
			end)
		end
		local Launcher = FrameResult:FindFirstChild("Launcher")
		
		if Launcher and Launcher:IsA("GuiObject") then
			SkinFunction(Launcher, p4.skin and p4.skin.launcher)
		end
		return FrameResult
	end)
end