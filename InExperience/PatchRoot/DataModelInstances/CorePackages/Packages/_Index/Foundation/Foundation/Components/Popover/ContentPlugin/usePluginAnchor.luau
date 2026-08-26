local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local overlayContextModule = require(foundation.Providers.Overlay.OverlayContext)
local _ = require(foundation.Utility.Plugin.StudioUri)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useUniqueWidgetModule = require(foundation.Providers.StudioWidgets.useUniqueWidget)

return function(p1, p2)
	-- upvalues: reactModule (ref), overlayContextModule (ref), useUniqueWidgetModule (ref), viewModule (ref), reactRobloxModule (ref)
	local var1 = reactModule.useContext(overlayContextModule)
	local var2 = p1 ~= nil and typeof(p1) ~= "Instance"
	local var3 = reactModule.useRef(nil)
	
	if not var2 and typeof(p1) == "Instance" then
		var3.current = p1
	end
	local var4, var5 = reactModule.useState(nil)
	local var6 = reactModule.useRef(nil)
	var6.current = var4
	local var7 = reactModule.useCallback(function(p3)
		-- upvalues: var5 (ref)
		var5(p3)
	end, { var5 })
	local var8 = useUniqueWidgetModule({ forwardRef = if var2 then var6 else var3 })
	local var9, var10 = reactModule.useState(Vector2.zero)
	local var11, var12 = reactModule.useState(Vector2.one)
	local var13, var14 = reactModule.useState(Vector2.zero)
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), p1 (ref), var10 (ref), var12 (ref)
		if var2 and p1 ~= nil then
			local function updateFromAnchor()
				-- upvalues: var10 (copy), p1 (ref), var12 (copy)
				var10(p1.AbsolutePosition)
				var12(p1.AbsoluteSize)
			end
			
			var10(p1.AbsolutePosition)
			var12(p1.AbsoluteSize)
			local var15 = p1:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateFromAnchor)
			local var16 = p1:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateFromAnchor)
			
			return function()
				-- upvalues: var15 (ref), var16 (ref)
				var15:Disconnect()
				var16:Disconnect()
			end
		end
	end, { p1, var2 })
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), var1 (ref)
		if var2 then
			var1.requestOverlay()
		end
	end, { var1.requestOverlay, var2 })
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), var1 (ref), var14 (ref)
		if not var2 then return end
		local instance = var1.instance
		
		if instance == nil or not instance:IsA("GuiObject") then
			var14(Vector2.zero)
			
			return
		end
		local function updateOffset()
			-- upvalues: var14 (copy), instance (ref)
			var14(instance.AbsolutePosition)
		end
		
		var14(instance.AbsolutePosition)
		local var15 = instance:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateOffset)
		
		return function()
			-- upvalues: var15 (ref)
			var15:Disconnect()
		end
	end, { var1.instance, var2 })
	
	return {
		uri = if p2 ~= nil then var8.uri else p2,
		element = if var2 and var1.instance then reactRobloxModule.createPortal(reactModule.createElement(viewModule, {
			Visible = true,
			Position = UDim2.fromOffset(var9.X - var13.X, var9.Y - var13.Y),
			Size = UDim2.fromOffset(var11.X, var11.Y),
			ref = var7
		}), var1.instance) else nil,
		isVirtual = var2,
		isReady = if p2 ~= nil then p1 ~= nil and (not var2 or var1.instance ~= nil) else true
	}
end