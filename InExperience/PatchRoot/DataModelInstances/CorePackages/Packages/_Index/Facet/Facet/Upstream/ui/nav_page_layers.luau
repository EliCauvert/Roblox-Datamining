local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")
local TransitionModule = require("./transition")
local PresentationReadinessModule = require("./presentation_readiness")
local PreparationModule = require("./preparation")

return function(p1)
	-- upvalues: TransitionModule (copy), PresentationReadinessModule (copy), PreparationModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	
	local function plate(FadeResult, Scale)
		-- upvalues: Compose (copy), Runtime (copy), Host (copy), p1 (copy)
		local CellResult = Compose.cell(0)
		Runtime.connect(FadeResult, "AncestryChanged", function()
			-- upvalues: CellResult (copy)
			CellResult:set(CellResult:peek() + 1)
		end)
		local FormulaResult = Compose.formula(function(Callback): boolean
			-- upvalues: Scale (copy)
			return Callback(Scale) ~= 1
		end)
		local FormulaResult1 = Compose.formula(function(Callback)
			-- upvalues: FormulaResult (copy), CellResult (copy), FadeResult (copy)
			if not Callback(FormulaResult) then
				return nil
			end
			Callback(CellResult)
			local Parent = FadeResult.Parent
			while Parent do
				if Parent:IsA("GuiObject") and Parent:GetStyled("BackgroundTransparency") < 1 then
					return Parent:GetStyled("BackgroundColor3")
				end
				Parent = Parent.Parent
			end
			return nil
		end)
		Runtime.mountFragment(function()
			-- upvalues: Compose (upval), FormulaResult1 (copy), Host (upval), p1 (upval), Scale (copy)
			return {
				Compose.show(function(Callback): boolean
					-- upvalues: FormulaResult1 (upval)
					return Callback(FormulaResult1) ~= nil
				end, function()
					-- upvalues: FormulaResult1 (upval), Host (upval), p1 (upval), Scale (upval)
					local v1 = assert(FormulaResult1:peek())
					
					return Host.Frame("TransitionPlate")({
						AnchorPoint = p1.types.Vector2.new(0.5, 0.5),
						Position = p1.types.UDim2.fromScale(0.5, 0.5),
						Size = p1.types.UDim2.fromScale(1, 1),
						BorderSizePixel = 0,
						ZIndex = 0,
						Interactable = false,
						BackgroundColor3 = function(Callback)
							-- upvalues: v1 (ref), FormulaResult1 (upval)
							v1 = Callback(FormulaResult1) or v1
							
							return v1
						end,
						Host.UIScale("TransitionScale")({ Scale = Scale })
					})
				end)
			}
		end, FadeResult)
	end
	
	return {
		content = function(Callback, p2)
			return if type(Callback) == "function" then Callback(p2) else Callback
		end,
		checkTransition = TransitionModule.check,
		layer = function(Entry, p2, Enabled, Callback, p3, p4, p5, p6)
			-- upvalues: Host (copy), Compose (copy), p1 (copy), Runtime (copy), TransitionModule (upval), plate (copy), PresentationReadinessModule (upval), PreparationModule (upval)
			if Enabled == nil or Enabled == false then
				local FrameResult = Host.Frame(Entry)
				
				if Callback then
					Compose.watch(function(Callback1)
						-- upvalues: p2 (copy), Callback (copy)
						if not Callback1(p2).top then
							Callback()
						end
					end)
				end
				return FrameResult
			else
				local FormulaResult = Compose.formula(function(Callback)
					-- upvalues: p2 (copy)
					return Callback(p2).top
				end)
				local FormulaResult1 = FormulaResult
				
				if p5 then
					local CellResult = Compose.cell(FormulaResult:peek())
					Compose.watch(function(Callback)
						-- upvalues: p5 (copy), CellResult (copy), FormulaResult (copy)
						if Callback(p5) then
							CellResult:set(Callback(FormulaResult))
						end
					end)
					FormulaResult1 = CellResult
				end
				local RunService = p1.config.services.RunService
				local P6 = p4 or Compose.cell(false)
				P6:set(RunService == nil or (RunService.PreRender == nil or Runtime.host.frames == nil))
				local NewTransition = TransitionModule.create(p1, Enabled, FormulaResult, p3, if p3 then nil else P6, nil, FormulaResult1, p6)
				local TransitionContent = nil
				local Zoom = if Enabled.zoom == nil then nil else NewTransition.zoom
				
				if Enabled.apply or Zoom then
					TransitionContent = Host.Frame({
						Name = "TransitionContent",
						BackgroundTransparency = 1,
						AnchorPoint = if Zoom then p1.types.Vector2.new(0.5, 0.5) else nil,
						Position = if Zoom then p1.types.UDim2.fromScale(0.5, 0.5) else nil,
						Size = p1.types.UDim2.fromScale(1, 1),
						if Zoom then Host.UIScale("TransitionZoom")({ Scale = Zoom }) else nil
					})
					local t = {}
					
					for i, _ in Entry do
						if type(i) == "number" then
							t[i] = Entry[i]
						end
					end
					for i1 in Entry do
						if type(i1) == "number" then
							Entry[i1] = nil
						end
					end
					Runtime.mountFragment(function()
						-- upvalues: t (copy)
						return t
					end, TransitionContent)
					Entry[1] = TransitionContent
				end
				function Entry.GroupTransparency(Callback)
					-- upvalues: P6 (copy), NewTransition (copy)
					return if Callback(P6) then Callback(NewTransition.transparency) else 1
				end
				
				Entry.Visible = NewTransition.visible
				
				function Entry.Interactable(Callback): boolean
					-- upvalues: P6 (copy), p2 (copy), NewTransition (copy), Enabled (copy)
					return Callback(P6) and (Callback(p2).top and (not Callback(NewTransition.interacting) and (Enabled.apply == nil and Enabled.progress == nil and Enabled.scale == nil and Enabled.zoom == nil or Callback(NewTransition.opacity) == 1)))
				end
				
				local FadeResult = p1.fade(Entry, nil, Entry.BackgroundTransparency ~= 1 and nil)
				NewTransition.apply(TransitionContent or FadeResult, FadeResult)
				local Scale = NewTransition.scale
				
				if Scale then
					plate(FadeResult, Scale)
				end
				local Zoom1 = NewTransition.zoom
				
				if Zoom1 then
					Compose.watch(function(Callback)
						-- upvalues: FadeResult (copy), Zoom1 (copy)
						FadeResult:SetAttribute("FacetTransitionZoom", Callback(Zoom1))
					end)
				end
				if not P6:peek() and Runtime.host.frames then
					local PresentationReadinessModuleResult = PresentationReadinessModule(p1, { FadeResult })
					PreparationModule.begin(p1, FadeResult)
					Compose.watch(function(Callback)
						-- upvalues: PresentationReadinessModuleResult (copy), P6 (copy), PreparationModule (upval), p1 (upval), FadeResult (copy)
						if Callback(PresentationReadinessModuleResult) then
							P6:set(true)
							PreparationModule.finish(p1, FadeResult)
						end
					end)
				end
				if Callback then
					Compose.watch(function(Callback1)
						-- upvalues: NewTransition (copy), Callback (copy)
						if Callback1(NewTransition.completed) then
							Callback()
						end
					end)
				end
				return FadeResult
			end
		end,
		checkedSelection = function(p7, List, Text)
			assert(p7 and p7.set, Text .. ".selection requires a writable Compose cell")
			assert(type(List) == "table" and #List > 0, Text .. " requires entries")
			local t = {}
			
			for _, value in List do
				assert(type(value.id) == "string" and t[value.id] == nil, Text .. " entries require unique string ids")
				t[value.id] = value
			end
			assert(t[p7:peek()], Text .. ".selection must name an entry")
			
			return t
		end
	}
end