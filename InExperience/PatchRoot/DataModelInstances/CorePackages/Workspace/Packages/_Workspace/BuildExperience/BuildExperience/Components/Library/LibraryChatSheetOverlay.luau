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

local function useSheetBounds(p3, p4, p5, p6, p7, p8)
	-- upvalues: useTokens (ref), reactModule (ref)
	local var1 = useTokens()
	local onBoundsChanged = p3.onBoundsChanged
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), p5 (ref), p6 (ref), p4 (ref), onBoundsChanged (ref), p8 (ref), var1 (ref), p7 (ref)
		if not p3.isOpen or p5 == nil or (p6 == nil or p4 == nil) then
			onBoundsChanged(nil, nil)
			p8(nil)
			
			return nil
		end
		local function updateBounds()
			-- upvalues: p4 (copy), p5 (copy), onBoundsChanged (copy), p8 (copy), p6 (copy), var1 (copy), p7 (copy)
			local absolutePosition = p4.AbsolutePosition
			
			if p5.AbsoluteSize.X < p4.AbsoluteSize.X - 1 then
				onBoundsChanged(nil, if p5.AbsoluteSize.X > 0 then p5.AbsolutePosition.X else nil)
				local var2 = p5.AbsolutePosition - absolutePosition
				p8({
					rect = Rect.new(var2, var2 + p5.AbsoluteSize),
					areaSize = p4.AbsoluteSize
				})
				
				return
			end
			local var3 = p6.AbsoluteSize.Y > 0
			onBoundsChanged(if var3 then p6.AbsolutePosition.Y - var1.Padding.Medium else nil, nil)
			p8(if var3 then {
				rect = Rect.new(Vector2.new(0, math.max(0, p4.AbsoluteSize.Y - p7 - var1.Size.Size_800)), p4.AbsoluteSize),
				areaSize = p4.AbsoluteSize
			} else nil)
		end
		
		updateBounds()
		local t = {}
		
		for i, v in { p5, p6, p4 } do
			table.insert(t, v:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateBounds))
			table.insert(t, v:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateBounds))
		end
		return function()
			-- upvalues: t (ref), onBoundsChanged (copy), p8 (copy)
			for i, v in t do
				v:Disconnect()
			end
			onBoundsChanged(nil, nil)
			p8(nil)
		end
	end, {
		p3.isOpen, p5, p6, p4, p7, var1, onBoundsChanged, p8
	})
end

return function(p9)
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
	local var9, var10 = reactModule.useState(nil)
	local var11, var12 = reactModule.useBinding(nil)
	local var13 = reactModule.useCallback(function(p10, p11)
		-- upvalues: var8 (ref)
		var8({ sheet = p10, content = p11 })
	end, {})
	local var14, var15 = reactModule.useState(nil)
	local var16 = if p9.top == nil or var3 == nil then 0 else math.max(0, p9.top - var3.originY)
	local var17 = if var3 ~= nil then 0 else var3.screenHeight
	local var18 = if var3 ~= nil then 0 else var3.availableHeight
	local snapPoints = p9.snapPoints
	
	if var17 > 0 then
		snapPoints = {}
		
		for i, v in p9.snapPoints do
			table.insert(snapPoints, math.max(2, math.min(v * var17, var18 - var16)))
		end
	end
	local var19
	local var20 = reactModule.useRef(snapPoints)
	local current = var20.current
	
	if #current == #snapPoints then
		for i, v in current do
			if snapPoints[i] ~= v then
				var19 = false
			end
		end
		var19 = true
	else
		var19 = false
	end
	if not var19 then
		var20.current = snapPoints
	end
	local current_1 = var20.current
	useSheetBounds(p9, var9, var7.sheet, var7.content, var14 or current_1[1], var12)
	local var21 = if var3 ~= nil and var3.isBottomSheet then 0 else var16
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Inset = if var2 ~= nil then nil else reactRobloxModule.createPortal(reactModule.createElement(foundationModule.View, {
			ref = var10,
			Position = UDim2.fromOffset(0, var21),
			Size = UDim2.new(1, 0, 1, -var21),
			backgroundStyle = { Transparency = 1 }
		}, {
			Window = reactModule.createElement(foundationModule.View, {
				tag = "clip",
				Position = var11:map(function(p10)
					return if p10 then UDim2.fromOffset(p10.rect.Min.X, p10.rect.Min.Y) else UDim2.new()
				end),
				Size = var11:map(function(p10)
					return if p10 then UDim2.fromOffset(p10.rect.Width, p10.rect.Height) else UDim2.fromScale(1, 1)
				end),
				backgroundStyle = { Transparency = 1 }
			}, {
				Host = reactModule.createElement(foundationModule.View, {
					testId = "Library.ChatOverlay",
					ref = var6,
					Position = var11:map(function(p10)
						return if p10 then UDim2.fromOffset(-p10.rect.Min.X, -p10.rect.Min.Y) else UDim2.new()
					end),
					Size = var11:map(function(p10)
						return if p10 then UDim2.fromOffset(p10.areaSize.X, p10.areaSize.Y) else UDim2.fromScale(1, 1)
					end),
					backgroundStyle = { Transparency = 1 }
				})
			})
		}), var2),
		Sheet = if var5 ~= nil then nil else reactModule.createElement(foundationModule.OverlayProvider, { gui = var5 }, p9.renderSheet(current_1, var13, var15))
	})
end