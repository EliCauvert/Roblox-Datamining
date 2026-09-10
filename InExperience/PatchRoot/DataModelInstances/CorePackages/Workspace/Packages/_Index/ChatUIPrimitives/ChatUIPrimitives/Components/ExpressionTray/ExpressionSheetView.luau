local guiService = game:GetService("GuiService")
local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local reactUtilsModule = require(parent.ReactUtils)
local otterModule = require(parent.Otter)
local useDismissOnEscapeOrMenuModule = require(chatUIPrimitives.Hooks.useDismissOnEscapeOrMenu)
local useEventConnection = reactUtilsModule.useEventConnection
local t = { dampingRatio = 1, frequency = 3.5 }

local function getSafeInsets()
	-- upvalues: guiService (ref)
	local deviceSafeInsetsInsetArea = guiService:GetInsetArea(Enum.ScreenInsets.DeviceSafeInsets)
	local noneInsetArea = guiService:GetInsetArea(Enum.ScreenInsets.None)
	
	return {
		left = math.max(0, deviceSafeInsetsInsetArea.Min.X - noneInsetArea.Min.X),
		right = math.max(0, noneInsetArea.Max.X - deviceSafeInsetsInsetArea.Max.X),
		bottom = math.max(0, noneInsetArea.Max.Y - deviceSafeInsetsInsetArea.Max.Y)
	}
end

local function _(value, p1)
	return value.left == p1.left and (value.right == p1.right and value.bottom == p1.bottom)
end

return reactModule.memo(function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), getSafeInsets (ref), useEventConnection (ref), otterModule (ref), t (ref), useDismissOnEscapeOrMenuModule (ref), reactRobloxModule (ref)
	local var1 = foundationModule.Hooks.useOverlay()
	local isOpen = p1.isOpen
	local height = p1.height or 240
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactModule.useBinding(1)
	local var6 = reactModule.useRef(nil)
	local var7, var8 = reactModule.useState(getSafeInsets)
	useEventConnection(if var1 ~= nil then nil else var1:GetPropertyChangedSignal("AbsoluteSize"), reactModule.useCallback(function()
		-- upvalues: var8 (ref), getSafeInsets (copy)
		var8(function(p2)
			-- upvalues: getSafeInsets (copy)
			local var9 = getSafeInsets()
			
			return if p2.left == var9.left and (p2.right == var9.right and p2.bottom == var9.bottom) then p2 else var9
		end)
	end, {}))
	local var9 = height + var7.bottom
	reactModule.useEffect(function()
		-- upvalues: isOpen (ref), var3 (ref), var6 (ref), otterModule (copy), var4 (ref), var5 (ref), t (copy)
		if isOpen then
			var3(true)
			
			if var6.current then
				var6.current:destroy()
			end
			local var10 = otterModule.createSingleMotor(var4:getValue())
			var6.current = var10
			var10:onStep(var5)
			var10:setGoal(otterModule.spring(0, t))
			
			return
		elseif var6.current then
			var6.current:setGoal(otterModule.spring(1, t))
			var6.current:onComplete(function()
				-- upvalues: var3 (copy)
				var3(false)
			end)
		end
	end, { isOpen })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref)
		return function()
			-- upvalues: var6 (copy)
			if var6.current then
				var6.current:destroy()
				var6.current = nil
			end
		end
	end, {})
	useDismissOnEscapeOrMenuModule(isOpen, p1.onPressedOutside)
	
	return if var2 and var1 ~= nil then reactRobloxModule.createPortal(reactModule.createElement(foundationModule.View, { tag = "size-full" }, {
		Backdrop = if isOpen then reactModule.createElement("TextButton", {
			Text = "",
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ZIndex = 1,
			[reactModule.Event.Activated] = p1.onPressedOutside
		}) else nil,
		Tray = reactModule.createElement(foundationModule.View, {
			ZIndex = 2,
			tag = "anchor-bottom-center stroke-standard stroke-default clip bg-surface-200",
			Position = var4:map(function(p2)
				-- upvalues: var9 (ref)
				return UDim2.new(0.5, 0, 1, math.round(p2 * var9))
			end),
			Size = UDim2.new(1, 0, 0, var9),
			padding = {
				bottom = UDim.new(0, var7.bottom),
				left = UDim.new(0, var7.left),
				right = UDim.new(0, var7.right)
			},
			onActivated = function() end,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}, { Container = p1.content })
	}), var1) else nil
end)