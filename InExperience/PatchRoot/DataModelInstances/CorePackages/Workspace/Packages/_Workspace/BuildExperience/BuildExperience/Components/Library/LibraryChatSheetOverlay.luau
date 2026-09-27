local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local guiService = game:GetService("GuiService")
local useTokens = foundationModule.Hooks.useTokens

local function _(p1, p2)
	if #p1 ~= #p2 then
		return false
	end
	for i, v in p1 do
		if p2[i] ~= v then
			return false
		end
	end
	return true
end

local function useSheetBounds(p3, p4, p5, p6)
	-- upvalues: useTokens (ref), reactModule (ref)
	local var1 = useTokens()
	local onBoundsChanged = p3.onBoundsChanged
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), p5 (ref), p6 (ref), p4 (ref), onBoundsChanged (ref), var1 (ref)
		if not p3.isOpen or p5 == nil or (p6 == nil or p4 == nil) then
			onBoundsChanged(nil, nil)
			
			return nil
		end
		local function updateBounds()
			-- upvalues: p5 (copy), p4 (copy), onBoundsChanged (copy), p6 (copy), var1 (copy)
			if p5.AbsoluteSize.X < p4.AbsoluteSize.X then
				onBoundsChanged(nil, if p5.AbsoluteSize.X > 0 then p5.AbsolutePosition.X else nil)
				
				return
			end
			onBoundsChanged(if p6.AbsoluteSize.Y > 0 then p6.AbsolutePosition.Y - var1.Padding.Medium else nil, nil)
		end
		
		updateBounds()
		local t = {}
		
		for i, v in { p5, p6, p4 } do
			table.insert(t, v:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateBounds))
			table.insert(t, v:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateBounds))
		end
		return function()
			-- upvalues: t (ref), onBoundsChanged (copy)
			for i, v in t do
				v:Disconnect()
			end
			onBoundsChanged(nil, nil)
		end
	end, {
		p3.isOpen, p5, p6, p4, var1.Padding.Medium, onBoundsChanged
	})
end

return function(p7)
	-- upvalues: foundationModule (ref), reactModule (ref), guiService (ref), useSheetBounds (ref), reactRobloxModule (ref)
	local var2 = foundationModule.Hooks.useOverlay()
	local var3, var4 = reactModule.useState(nil)
	local var5, var6 = reactModule.useState(nil)
	local var7, var8 = reactModule.useState({})
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), var4 (ref), guiService (copy)
		if var2 == nil then
			return nil
		end
		local screenGui = var2:FindFirstAncestorWhichIsA("ScreenGui") or var2
		
		local function updateLayout()
			-- upvalues: var4 (copy), var2 (copy), screenGui (ref), guiService (copy)
			var4({
				originY = var2.AbsolutePosition.Y,
				screenHeight = screenGui.AbsoluteSize.Y,
				availableHeight = var2.AbsoluteSize.Y,
				isBottomSheet = guiService.ViewportDisplaySize == Enum.DisplaySize.Small and screenGui.AbsoluteSize.X <= screenGui.AbsoluteSize.Y
			})
		end
		
		updateLayout()
		local list = {
			var2:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateLayout),
			var2:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateLayout),
			screenGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateLayout),
			guiService:GetPropertyChangedSignal("ViewportDisplaySize"):Connect(updateLayout)
		}
		
		return function()
			-- upvalues: list (ref)
			for i, v in list do
				v:Disconnect()
			end
		end
	end, { var2 })
	local var9 = reactModule.useCallback(function(p8, p9)
		-- upvalues: var8 (ref)
		var8({ sheet = p8, content = p9 })
	end, {})
	useSheetBounds(p7, var2, var7.sheet, var7.content)
	local var10 = if p7.top == nil or var3 == nil then 0 else math.max(0, p7.top - var3.originY)
	local var11 = if var3 ~= nil then 0 else var3.screenHeight
	local var12 = if var3 ~= nil then 0 else var3.availableHeight
	local snapPoints = p7.snapPoints
	
	if var11 > 0 then
		snapPoints = {}
		
		for i, v in p7.snapPoints do
			table.insert(snapPoints, math.max(2, math.min(v * var11, var12 - var10)))
		end
	end
	local var13, i, v
	local var14 = reactModule.useRef(snapPoints)
	local current = var14.current
	
	if #current == #snapPoints then
		for i, v in current do
			if snapPoints[i] ~= v then
				var13 = false
			end
		end
		var13 = true
	else
		var13 = false
	end
	if not var13 then
		var14.current = snapPoints
	end
	local var15 = var3 ~= nil and var3.isBottomSheet
	local var16 = p7.renderSheet(var14.current, var9)
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local var17 = nil
	i = {}
	v = if var2 == nil or var15 then nil else reactRobloxModule.createPortal(reactModule.createElement(foundationModule.View, {
		testId = "Library.ChatOverlay",
		ref = var6,
		Position = UDim2.fromOffset(0, var10),
		Size = UDim2.new(1, 0, 1, -var10),
		backgroundStyle = { Transparency = 1 }
	}), var2)
	i.Inset = v
	i.Sheet = if var15 then var16 elseif var5 ~= nil then nil else reactModule.createElement(foundationModule.OverlayProvider, { gui = var5 }, var16)
	
	return createElement(fragment, var17, i)
end