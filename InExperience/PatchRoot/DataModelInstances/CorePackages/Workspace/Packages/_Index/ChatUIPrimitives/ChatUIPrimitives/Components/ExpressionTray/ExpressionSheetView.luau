local guiService = game:GetService("GuiService")
local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local reactUtilsModule = require(parent.ReactUtils)
local otterModule = require(parent.Otter)
local useDismissOnEscapeOrMenuModule = require(chatUIPrimitives.Hooks.useDismissOnEscapeOrMenu)
local fFlagExpChatExpressionTrayReducedMotionModule = require(chatUIPrimitives.Flags.FFlagExpChatExpressionTrayReducedMotion)
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
	-- upvalues: foundationModule (ref), fFlagExpChatExpressionTrayReducedMotionModule (ref), reactModule (ref), getSafeInsets (ref), useEventConnection (ref), otterModule (ref), t (ref), useDismissOnEscapeOrMenuModule (ref), reactRobloxModule (ref)
	local var1 = foundationModule.Hooks.useOverlay()
	local var2 = if fFlagExpChatExpressionTrayReducedMotionModule then foundationModule.Hooks.usePreferences().reducedMotion else false
	local isOpen = p1.isOpen
	local height = p1.height or 240
	local var3, var4 = reactModule.useState(false)
	local var5, var6 = reactModule.useBinding(1)
	local var7 = reactModule.useRef(nil)
	local var8, var9 = reactModule.useState(getSafeInsets)
	useEventConnection(if var1 ~= nil then nil else var1:GetPropertyChangedSignal("AbsoluteSize"), reactModule.useCallback(function()
		-- upvalues: var9 (ref), getSafeInsets (copy)
		var9(function(p2)
			-- upvalues: getSafeInsets (copy)
			local var10 = getSafeInsets()
			
			return if p2.left == var10.left and (p2.right == var10.right and p2.bottom == var10.bottom) then p2 else var10
		end)
	end, {}))
	local var10 = height + var8.bottom
	reactModule.useEffect(function()
		-- upvalues: var2 (write), var7 (ref), var6 (ref), isOpen (ref), var4 (ref), otterModule (copy), var5 (ref), t (copy)
		if var2 then
			if var7.current then
				var7.current:destroy()
				var7.current = nil
			end
			var6(if isOpen then 0 else 1)
			var4(isOpen)
			
			return
		elseif isOpen then
			var4(true)
			
			if var7.current then
				var7.current:destroy()
			end
			local var11 = otterModule.createSingleMotor(var5:getValue())
			var7.current = var11
			var11:onStep(var6)
			var11:setGoal(otterModule.spring(0, t))
			
			return
		elseif var7.current then
			var7.current:setGoal(otterModule.spring(1, t))
			var7.current:onComplete(function()
				-- upvalues: var4 (copy)
				var4(false)
			end)
		end
	end, { isOpen, var2 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref)
		return function()
			-- upvalues: var7 (copy)
			if var7.current then
				var7.current:destroy()
				var7.current = nil
			end
		end
	end, {})
	useDismissOnEscapeOrMenuModule(isOpen, p1.onPressedOutside)
	
	return if var3 and var1 ~= nil then reactRobloxModule.createPortal(reactModule.createElement(foundationModule.View, { tag = "size-full" }, {
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
			Position = var5:map(function(p2)
				-- upvalues: var10 (ref)
				return UDim2.new(0.5, 0, 1, math.round(p2 * var10))
			end),
			Size = UDim2.new(1, 0, 0, var10),
			padding = {
				bottom = UDim.new(0, var8.bottom),
				left = UDim.new(0, var8.left),
				right = UDim.new(0, var8.right)
			},
			onActivated = function() end,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}, { Container = p1.content })
	}), var1) else nil
end)