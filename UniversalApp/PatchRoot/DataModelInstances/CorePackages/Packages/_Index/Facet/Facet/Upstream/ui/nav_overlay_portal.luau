local _ = require("./types")
local _ = require("./navigation_types")
local CoreModule = require("../vendor/compose/core")
local _ = require("./nav_overlay_presence")
local RegionPresenceModule = require("./region_presence")
local FontReadinessModule = require("./font_readiness")
local TextMeasureModule = require("./text_measure")
local GeometrySignatureModule = require("./geometry_signature")
local OverlayArrivalModule = require("./overlay_arrival")
local TransitionModule = require("./transition")

local function _(Parent)
	local Parent1 = Parent
	local StyleLink = nil
	while Parent1 do
		StyleLink = Parent1:FindFirstChildWhichIsA("StyleLink")
		
		if StyleLink then
			return StyleLink
		end
		Parent1 = Parent1.Parent
	end
	return nil
end

return function(Connection, p1)
	-- upvalues: CoreModule (copy), RegionPresenceModule (copy), FontReadinessModule (copy), GeometrySignatureModule (copy), OverlayArrivalModule (copy), TextMeasureModule (copy), TransitionModule (copy)
	local Compose = Connection.Compose
	local Host = Connection.Host
	local Runtime = Connection.runtime
	local DepartureFunction = p1.departure
	
	local function available(Parent, Callback: () -> ())
		-- upvalues: Compose (copy), CoreModule (upval), RegionPresenceModule (upval), Connection (copy), Runtime (copy)
		local v1 = assert(Compose.currentOwner())
		local CellResult = Compose.cell(false)
		local v2 = nil
		
		local function locate()
			-- upvalues: CoreModule (upval), v1 (copy), v2 (ref), Parent (copy), CellResult (copy), Compose (upval), RegionPresenceModule (upval), Connection (upval)
			if CoreModule.owner.isDisposed(v1) then return end
			if v2 then
				CoreModule.owner.dispose(v2)
				v2 = nil
			end
			local Parent1 = Parent
			while Parent1 and not Parent1:IsA("LayerCollector") do
				Parent1 = Parent1.Parent
			end
			if Parent1 == nil then
				CellResult:set(false)
				
				return
			else
				local Child = CoreModule.owner.createChild(v1)
				v2 = Child
				Compose.withOwner(Child, function()
					-- upvalues: Parent (upval), RegionPresenceModule (upval), Connection (upval), Compose (upval), CellResult (upval)
					local List = {}
					local Parent1 = Parent
					local Flag = false
					while Parent1 do
						if Parent1:IsA("GuiObject") then
							if Parent1 ~= Parent or Parent:GetAttribute("FacetOverlayPlaceholder") ~= true then
								table.insert(List, RegionPresenceModule[Parent1] or Connection.observe.Visible(Parent1))
							end
							table.insert(List, Connection.observe.Interactable(Parent1))
						end
						if not Parent1:IsA("LayerCollector") then
							Parent1 = Parent1.Parent
							continue
						end
						Flag = true
						table.insert(List, Connection.observe.Enabled(Parent1))
						break
					end
					Compose.watch(function(Callback)
						-- upvalues: Flag (ref), List (copy), CellResult (upval)
						local Flag1: boolean = Flag
						
						for _, value in List do
							if not Callback(value) then
								Flag1 = false
							end
						end
						CellResult:set(Flag1)
					end)
				end)
			end
		end
		
		Runtime.connect(Parent, "AncestryChanged", function()
			-- upvalues: locate (copy), Callback (copy)
			locate()
			
			if Callback then
				Callback()
			end
		end)
		locate()
		
		if Callback then
			Callback()
		end
		return CellResult
	end
	
	local function arrive(Callback, Interactable, p2, Parent)
		-- upvalues: Connection (copy), Compose (copy), FontReadinessModule (upval), GeometrySignatureModule (upval), OverlayArrivalModule (upval), TextMeasureModule (upval), Runtime (copy)
		local RunService = Connection.config.services and Connection.config.services.RunService
		local v3 = nil
		local OverlayArrival = nil
		
		if RunService and RunService.PreRender then
			OverlayArrival = Connection.fade({
				Name = "OverlayArrival",
				BackgroundTransparency = 1,
				Size = Connection.types.UDim2.fromScale(1, 1),
				GroupTransparency = function(Callback): number
					-- upvalues: Interactable (copy)
					return if Callback(Interactable) then 0 else 1
				end,
				Interactable = Interactable,
				Compose.fragment(function()
					-- upvalues: Callback (copy), v3 (ref)
					local CallbackResult = Callback()
					v3 = CallbackResult
					
					return { CallbackResult }
				end)
			}, false, false)
		else
			v3 = Callback()
		end
		local Gui = assert(v3)
		
		if RunService == nil then
			Interactable:set(true)
			
			return Gui
		end
		local Guis = {}
		local List = if Gui:IsA("GuiObject") then { Gui } else Gui:GetChildren()
		for _, Gui1 in List do
			if Gui1:IsA("GuiObject") and Gui1.Visible then
				table.insert(Guis, Gui1)
			end
		end
		if #Guis == 0 then
			Interactable:set(true)
			
			return Gui
		end
		if RunService.PreRender == nil then
			Interactable:set(true)
			
			for _, gui in Guis do
				gui.Visible = false
			end
			local Connection4 = nil
			Connection4 = RunService.Heartbeat:Connect(function()
				-- upvalues: Connection4 (ref), Guis (copy)
				if Connection4 then
					Connection4:Disconnect()
					Connection4 = nil
				end
				for _, gui in Guis do
					gui.Visible = true
				end
			end)
			Compose.cleanup(function()
				-- upvalues: Connection4 (ref)
				if Connection4 then
					Connection4:Disconnect()
				end
			end)
			
			return Gui
		else
			local Connection4 = Connection
			local FontReadinessModuleResult = FontReadinessModule(Connection4, Guis)
			Connection4 = GeometrySignatureModule
			Connection4 = Connection4()
			local Connection2 = Connection4
			Connection4 = 0
			local v4 = false
			local Enabled = nil
			local PreparedResult = OverlayArrivalModule.prepared(p2) or Connection.runtime.settled({
				sample = function()
					-- upvalues: Connection4 (ref)
					return Connection4
				end,
				ready = function(): boolean
					-- upvalues: Guis (copy), TextMeasureModule (upval), Connection2 (copy), Connection4 (ref), v4 (ref), Enabled (ref), FontReadinessModuleResult (copy)
					local v5 = false
					local v6 = true
					
					for _, gui in Guis do
						local Descendants = gui:GetDescendants()
						table.insert(Descendants, gui)
						v5 = v5 or gui.AbsoluteSize.X > 0 and gui.AbsoluteSize.Y > 0
						
						for _, descendant in Descendants do
							v6 = v6 and not TextMeasureModule.pending(descendant)
							
							if descendant:IsA("GuiObject") then
								v5 = v5 or descendant.Visible and (descendant.AbsoluteSize.X > 0 and descendant.AbsoluteSize.Y > 0)
								Connection2.push(descendant.AbsolutePosition)
								Connection2.push(descendant.AbsoluteSize)
								Connection2.push(descendant.Visible)
								
								if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
									Connection2.push(descendant.TextBounds)
								end
							end
						end
					end
					local FinishResult = Connection2.finish()
					local V50: boolean = FontReadinessModuleResult() and v6
					Connection4 = FinishResult
					v4 = v5
					Enabled = V50
					
					return Enabled ~= false
				end,
				equals = function(p3, p4): boolean
					-- upvalues: v4 (ref)
					return v4 and p3 == p4
				end
			})
			Compose.watch(function(Callback)
				-- upvalues: PreparedResult (copy), Interactable (copy)
				if Callback(PreparedResult) then
					Interactable:set(true)
				end
			end)
			
			if Gui:GetAttribute("FacetArrivalGroup") == true then
				return Gui
			end
			local List1 = {}
			
			for _, gui1 in Guis do
				local CellResult = Compose.cell(gui1.ZIndex)
				Compose.cleanup(assert(Runtime.host.observation).observeProperty(gui1, "ZIndex", function()
					-- upvalues: CellResult (copy), gui1 (copy)
					CellResult:set(gui1.ZIndex)
				end))
				table.insert(List1, CellResult)
			end
			local OverlayArrival1 = Parent:FindFirstAncestor("OverlayArrival")
			
			if OverlayArrival1 and OverlayArrival1:IsA("GuiObject") then
				local CellResult1 = Compose.cell(OverlayArrival1.ZIndex)
				Compose.cleanup(assert(Runtime.host.observation).observeProperty(OverlayArrival1, "ZIndex", function()
					-- upvalues: CellResult1 (copy), OverlayArrival1 (copy)
					CellResult1:set(OverlayArrival1.ZIndex)
				end))
				table.insert(List1, Compose.formula(function(Callback): number
					-- upvalues: CellResult1 (copy)
					return Callback(CellResult1) + 1
				end))
			end
			local v7 = assert(OverlayArrival)
			Runtime.decorate(v7, {
				ZIndex = function(Callback): number
					-- upvalues: List1 (copy)
					local Largest = 1
					
					for _, value in List1 do
						Largest = math.max(Largest, Callback(value))
					end
					return Largest
				end
			})
			
			return v7
		end
	end
	
	local function parent(Parent)
		-- upvalues: Connection (copy)
		local OverlayParent = Connection.config.overlayParent or Parent:FindFirstAncestorWhichIsA("LayerCollector")
		local OverlayHost = if OverlayParent then Connection.overlayHosts[OverlayParent] else nil
		
		if OverlayHost and OverlayHost:IsA("LayerCollector") then
			OverlayParent = OverlayHost
		end
		if OverlayParent and OverlayParent:IsA("SurfaceGui") and not OverlayParent.ClipsDescendants then
			OverlayParent.ClipsDescendants = true
		end
		return OverlayParent
	end
	
	return {
		available = function(Parent)
			-- upvalues: available (copy)
			return (available(Parent, nil))
		end,
		parent = parent,
		overlay = function(Parent, p3, Callback, p4)
			-- upvalues: Compose (copy), Connection (copy), CoreModule (upval), parent (copy), available (copy), Runtime (copy), OverlayArrivalModule (upval), arrive (copy), Host (copy), DepartureFunction (copy), TransitionModule (upval)
			local v8 = assert(Compose.currentOwner())
			local CellResult = Compose.cell(nil)
			CellResult:set(if p4 and p4.parent then p4.parent() else Connection.config.overlayParent)
			local AvailableResult = available(Parent, function()
				-- upvalues: CoreModule (upval), v8 (copy), p4 (copy), CellResult (copy), parent (upval), Parent (copy), Connection (upval)
				if CoreModule.owner.isDisposed(v8) then return end
				if p4 and p4.parent then
					CellResult:set(p4.parent() or parent(Parent))
					
					return
				end
				if not Connection.config.overlayParent then
					CellResult:set((parent(Parent)))
					
					return
				end
			end)
			
			local function v60(Callback)
				-- upvalues: AvailableResult (copy), Connection (upval), p3 (copy)
				return Callback(AvailableResult) and Connection.read(p3, Callback)
			end
			
			return Compose.switch(CellResult, {}, function()
				-- upvalues: CellResult (copy), Compose (upval), p4 (copy), Runtime (upval), Connection (upval), OverlayArrivalModule (upval), arrive (upval), Callback (copy), Parent (copy), Host (upval), DepartureFunction (upval), TransitionModule (upval), v60 (copy)
				local PeekResult = CellResult:peek()
				
				if PeekResult == nil then
					return Compose.fragment(function()
						return {}
					end)
				end
				local Elapsed = nil
				local v9 = nil
				
				local function render(p5)
					-- upvalues: p4 (upval), Elapsed (ref), Runtime (upval), Connection (upval), Compose (upval), v9 (ref), OverlayArrivalModule (upval), arrive (upval), Callback (upval), Parent (upval), PeekResult (copy), Host (upval)
					if p5 and p4 and p4.motion then
						Elapsed = Runtime.timeline({ duration = 0.001 }).elapsed
					end
					local function themed()
						-- upvalues: Connection (upval), Compose (upval), p5 (copy), v9 (upval), OverlayArrivalModule (upval), arrive (upval), Callback (upval), Parent (upval), PeekResult (upval), Runtime (upval), Host (upval)
						local RunService = Connection.config.services.RunService
						local CellResult = Compose.cell(RunService == nil or RunService.PreRender == nil)
						local P13 = p5 or { exiting = Compose.cell(false) }
						v9 = P13
						OverlayArrivalModule.bind(P13, CellResult)
						
						return (arrive(function()
							-- upvalues: Callback (upval), P13 (copy), Parent (upval), PeekResult (upval), Runtime (upval), Host (upval)
							local CallbackResult = Callback(P13)
							local Parent1 = Parent
							local StyleLink = nil
							while Parent1 and Parent1 ~= PeekResult do
								StyleLink = Parent1:FindFirstChildWhichIsA("StyleLink")
								
								if StyleLink then
									local Parent2 = PeekResult
									local StyleLink1 = nil
									local StyleLink2 = nil
									while Parent2 do
										StyleLink1 = Parent2:FindFirstChildWhichIsA("StyleLink")
										
										if not StyleLink1 then
											Parent2 = Parent2.Parent
											continue
										end
										StyleLink2 = StyleLink1
										if StyleLink2 == StyleLink then break end
									end
									StyleLink2 = nil
								end
								if not StyleLink then
									Parent1 = Parent1.Parent
									continue
								elseif StyleLink:IsA("StyleLink") then
									local StyleSheet = Runtime.observe(StyleLink, "StyleSheet")
									Runtime.mountFragment(function()
										-- upvalues: Host (upval), StyleSheet (copy)
										return {
											Host.StyleLink({
												StyleSheet = function(Callback)
													-- upvalues: StyleSheet (upval)
													local CallbackResult = Callback(StyleSheet)
													
													return if typeof(CallbackResult) == "Instance" and CallbackResult:IsA("StyleSheet") then CallbackResult else nil
												end
											})
										}
									end, CallbackResult)
									
									return CallbackResult
								else
									break
								end
							end
							return CallbackResult
						end, CellResult, P13, Parent))
					end
					
					local Failure = p4 and p4.failure
					
					return if Failure then Host.Folder({
						Compose.boundary(function()
							-- upvalues: themed (copy)
							return (themed())
						end, function(p6, _)
							-- upvalues: Failure (copy)
							return Failure(p6)
						end)
					}) else themed()
				end
				
				local Presence = if p4 and p4.presence then p4.presence elseif p4 and p4.motion then DepartureFunction(p4.motion, Parent, function(): boolean
					-- upvalues: Elapsed (ref)
					local Elapsed1 = Elapsed
					
					return Elapsed1 ~= nil and Elapsed1:peek() > 0
				end) else nil
				
				if Presence then
					local ExitFunction = Presence.exit
					Presence = {
						exit = function(p6)
							-- upvalues: v9 (ref), TransitionModule (upval), ExitFunction (copy)
							local v10 = v9
							local Completion = if v10 then TransitionModule.completions[v10] else nil
							
							return if Completion then { completed = Completion } else ExitFunction(p6)
						end
					}
				end
				local function presentation()
					-- upvalues: Presence (ref), Compose (upval), v60 (upval), render (copy)
					return if Presence then Compose.presence(v60, render, Presence) else Compose.show(v60, function()
						-- upvalues: render (upval)
						return render(nil)
					end)
				end
				
				local Identity = p4 and p4.identity
				Runtime.mountFragment(function()
					-- upvalues: Identity (copy), Compose (upval), presentation (copy), Presence (ref), v60 (upval), render (copy)
					return {
						if Identity then Compose.switch(Identity, {}, presentation) elseif Presence then Compose.presence(v60, render, Presence) else Compose.show(v60, function()
							-- upvalues: render (upval)
							return render(nil)
						end)
					}
				end, PeekResult)
				
				return Compose.fragment(function()
					return {}
				end)
			end)
		end
	}
end