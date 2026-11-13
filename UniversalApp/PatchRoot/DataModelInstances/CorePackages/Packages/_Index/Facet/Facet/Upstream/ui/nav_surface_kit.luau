local _ = require("./theme_types")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")

return function(p1, Callback)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local Services = p1.config.services or {}
	local GuiService = Services.GuiService or (if game then game:GetService("GuiService") else nil)
	local UserInputService = Services.UserInputService or (if game then game:GetService("UserInputService") else nil)
	
	local function firstSelectable(Object, Name, Callback)
		-- upvalues: firstSelectable (copy)
		if Callback and Callback(Object) then
			return nil
		end
		local v1 = nil
		
		if Object:IsA("GuiObject") then
			if not Object.Visible or not Object.Interactable then
				return nil
			end
			if (Name == nil or Object.Name == Name) and Object.Selectable then
				if not Object:IsA("ScrollingFrame") or Object:GetAttribute("FacetSelectionOwner") == true then
					return Object
				end
				v1 = Object
			end
		end
		local FirstSelectableResult = nil
		for _, child in Object:GetChildren() do
			FirstSelectableResult = firstSelectable(child, Name, Callback)
			
			if FirstSelectableResult then
				return FirstSelectableResult
			end
		end
		return v1
	end
	
	local function inset(SpaceM: number, p2, p3, p4): number
		-- upvalues: p1 (copy)
		local ReadResult = p1.read(p1.config.theme, p4)
		local ChromeEntry = if ReadResult and ReadResult.chrome then ReadResult.chrome[p3 or "panel"] else nil
		local ContentInsets = if ChromeEntry then ChromeEntry.contentInsets else nil
		
		return if ContentInsets == nil then SpaceM else math.max(SpaceM, (if p2 == "top" then ContentInsets.top elseif p2 == "bottom" then ContentInsets.bottom elseif p2 == "left" then ContentInsets.left else ContentInsets.right) or 0)
	end
	
	return {
		gui = GuiService,
		input = UserInputService,
		service = function(p2)
			-- upvalues: Services (copy)
			if p2 == "GuiService" then
				local GuiService = Services.GuiService
				
				if not GuiService then
					if game then
						return (game:GetService("GuiService"))
					end
					GuiService = nil
				end
				return GuiService
			else
				local UserInputService = Services.UserInputService
				
				if not UserInputService then
					if game then
						return (game:GetService("UserInputService"))
					end
					UserInputService = nil
				end
				return UserInputService
			end
		end,
		selecting = function()
			-- upvalues: GuiService (copy), p1 (copy), UserInputService (copy), Compose (copy), Runtime (copy), TypesEnum (copy)
			local HasGetResult: boolean = GuiService ~= nil and p1.selection.get() ~= nil
			local v2 = nil
			
			if UserInputService and UserInputService.GetLastInputType then
				local CellResult = Compose.cell(UserInputService:GetLastInputType())
				v2 = CellResult
				Runtime.connect(UserInputService, "LastInputTypeChanged", function(p2)
					-- upvalues: CellResult (copy)
					CellResult:set(p2)
				end)
			end
			local PreferredInputResult = if UserInputService and UserInputService.GetPropertyChangedSignal then p1.observe.PreferredInput(UserInputService) else nil
			
			return function(Callback): boolean
				-- upvalues: PreferredInputResult (copy), TypesEnum (upval), v2 (ref), HasGetResult (copy)
				local CallbackResult = if PreferredInputResult then Callback(PreferredInputResult) else nil
				
				if CallbackResult == TypesEnum.PreferredInput.Touch then
					return false
				elseif CallbackResult == TypesEnum.PreferredInput.Gamepad then
					return true
				else
					local CallbackResult1 = if v2 then Callback(v2) else nil
					
					return HasGetResult and (CallbackResult1 == nil or (CallbackResult1 == TypesEnum.UserInputType.Keyboard or string.find(CallbackResult1.Name, "^Gamepad") ~= nil))
				end
			end
		end,
		preference = function()
			-- upvalues: GuiService (copy), p1 (copy)
			local PreferredTransparencyResult = if GuiService and GuiService.GetPropertyChangedSignal then p1.observe.PreferredTransparency(GuiService) else nil
			
			return function(Callback): number
				-- upvalues: PreferredTransparencyResult (copy)
				local CallbackResult = if PreferredTransparencyResult then Callback(PreferredTransparencyResult) else 1
				
				return if type(CallbackResult) == "number" and CallbackResult == CallbackResult then math.clamp(CallbackResult, 0, 1) else 1
			end
		end,
		keep = function(...)
			-- upvalues: Runtime (copy), Compose (copy)
			for i = 1, select("#", ...) do
				local Selected = select(i, ...)
				
				if Selected and type(Selected) ~= "function" then
					local Parent = Selected.Parent
					
					if Parent then
						Runtime.mount(function()
							-- upvalues: Runtime (upval), Selected (copy)
							return Runtime.borrow(Selected)
						end, Parent)
					end
					Compose.cleanup(function()
						-- upvalues: Selected (copy)
						if Selected.Parent ~= nil then
							Selected.Parent = nil
						end
					end)
				end
			end
		end,
		within = function(Ancestor, Ancestor1)
			return Ancestor ~= nil and (Ancestor == Ancestor1 or Ancestor:IsDescendantOf(Ancestor1))
		end,
		displayed = function(Gui): boolean
			local Gui1 = Gui
			while Gui1 and not Gui1:IsA("LayerCollector") do
				if Gui1:IsA("GuiObject") and not Gui1.Visible then
					return false
				end
				Gui1 = Gui1.Parent
			end
			return Gui1 ~= nil
		end,
		firstSelectable = firstSelectable,
		attach = Callback,
		inset = inset,
		skin = function(Object, p2, p3)
			-- upvalues: p1 (copy), inset (copy), Runtime (copy)
			local P14 = p3 or {}
			local ReserveFunction = P14.reserve
			p1.skin(Object, p2 or "panel", {
				ZIndex = -1,
				label = P14.title,
				onCaption = P14.onCaption,
				fullPanelArtFade = P14.fullPanelArtFade
			})
			local Padding = if P14.padding == false then nil else P14.padding or Object:FindFirstChildWhichIsA("UIPadding")
			
			if Padding and (p1.config.theme ~= nil or ReserveFunction) then
				local function _(p4, p5)
					-- upvalues: p1 (upval), inset (upval), ReserveFunction (copy), p2 (copy)
					return function(p6)
						-- upvalues: p1 (upval), inset (upval), p5 (copy), ReserveFunction (upval), p2 (upval), p4 (copy)
						return p1.types.UDim.new(0, inset(if p5.Scale == 0 and p5.Offset == 0 and ReserveFunction == nil and (p2 == nil or p2 == "panel") then p1.metric("space.m", p6) else p5.Offset, p4, p2, p6) + (if ReserveFunction then ReserveFunction(p4, p6) else 0))
					end
				end
				
				local PaddingTop = Padding.PaddingTop
				local v2 = "top"
				
				local function PaddingTop1(p4)
					-- upvalues: p1 (upval), inset (upval), PaddingTop (copy), ReserveFunction (copy), p2 (copy), v2 (copy)
					return p1.types.UDim.new(0, inset(if PaddingTop.Scale == 0 and PaddingTop.Offset == 0 and ReserveFunction == nil and (p2 == nil or p2 == "panel") then p1.metric("space.m", p4) else PaddingTop.Offset, v2, p2, p4) + (if ReserveFunction then ReserveFunction(v2, p4) else 0))
				end
				
				local PaddingBottom = Padding.PaddingBottom
				local v3 = "bottom"
				
				local function PaddingBottom1(p4)
					-- upvalues: p1 (upval), inset (upval), PaddingBottom (copy), ReserveFunction (copy), p2 (copy), v3 (copy)
					return p1.types.UDim.new(0, inset(if PaddingBottom.Scale == 0 and PaddingBottom.Offset == 0 and ReserveFunction == nil and (p2 == nil or p2 == "panel") then p1.metric("space.m", p4) else PaddingBottom.Offset, v3, p2, p4) + (if ReserveFunction then ReserveFunction(v3, p4) else 0))
				end
				
				local PaddingLeft = Padding.PaddingLeft
				local v4 = "left"
				
				local function PaddingLeft1(p4)
					-- upvalues: p1 (upval), inset (upval), PaddingLeft (copy), ReserveFunction (copy), p2 (copy), v4 (copy)
					return p1.types.UDim.new(0, inset(if PaddingLeft.Scale == 0 and PaddingLeft.Offset == 0 and ReserveFunction == nil and (p2 == nil or p2 == "panel") then p1.metric("space.m", p4) else PaddingLeft.Offset, v4, p2, p4) + (if ReserveFunction then ReserveFunction(v4, p4) else 0))
				end
				
				local PaddingRight = Padding.PaddingRight
				local v5 = "right"
				Runtime.decorate(Padding, {
					PaddingTop = PaddingTop1,
					PaddingBottom = PaddingBottom1,
					PaddingLeft = PaddingLeft1,
					PaddingRight = function(p4)
						-- upvalues: p1 (upval), inset (upval), PaddingRight (copy), ReserveFunction (copy), p2 (copy), v5 (copy)
						return p1.types.UDim.new(0, inset(if PaddingRight.Scale == 0 and PaddingRight.Offset == 0 and ReserveFunction == nil and (p2 == nil or p2 == "panel") then p1.metric("space.m", p4) else PaddingRight.Offset, v5, p2, p4) + (if ReserveFunction then ReserveFunction(v5, p4) else 0))
					end
				})
			end
			return Object
		end,
		centered = function(p2, p3)
			-- upvalues: Runtime (copy), TypesVector2 (copy), TypesUDim2 (copy), TypesEnum (copy), Callback (copy), Host (copy)
			Runtime.decorate(p2, {
				AnchorPoint = TypesVector2.new(0.5, 0.5),
				Position = TypesUDim2.fromScale(0.5, 0.5),
				Size = TypesUDim2.new(1, -32, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y
			})
			Callback(p2, {
				Host.UISizeConstraint({ MaxSize = TypesVector2.new(p3 or 440, 1e999) })
			})
			
			return p2
		end
	}
end