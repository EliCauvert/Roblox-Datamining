local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local overlayContextModule = require(foundation.Providers.Overlay.OverlayContext)
local _ = require(foundation.Utility.Plugin.StudioUri)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useUniqueWidgetModule = require(foundation.Providers.StudioWidgets.useUniqueWidget)

return function(p0, p1) --[[ line: 19 | named "usePluginAnchor" ]]
	-- upvalues: reactModule (ref), overlayContextModule (ref), useUniqueWidgetModule (ref), viewModule (ref), reactRobloxModule (ref)
	local var6 = reactModule.useContext(overlayContextModule)
	local var7 = p0 ~= nil and typeof(p0) ~= "Instance"
	local var8 = reactModule.useRef(nil)
	
	if not var7 and typeof(p0) == "Instance" then
		var8.current = p0
	end
	local var9, var10 = reactModule.useState(nil)
	local var11 = reactModule.useRef(nil)
	var11.current = var9
	local var12 = reactModule.useCallback(function(p2) --[[ line: 38 ]]
		-- upvalues: var10 (ref)
		var10(p2)
	end, { var10 })
	local var13 = useUniqueWidgetModule({ forwardRef = if var7 then var11 else var8 })
	local var14, var15 = reactModule.useState(Vector2.zero)
	local var16, var17 = reactModule.useState(Vector2.one)
	local var18, var19 = reactModule.useState(Vector2.zero)
	reactModule.useLayoutEffect(function() --[[ line: 50 ]]
		-- upvalues: var7 (ref), p0 (ref), var15 (ref), var17 (ref)
		if var7 and p0 ~= nil then
			local function updateFromAnchor() --[[ line: 56 ]]
				-- upvalues: var15 (copy), p0 (ref), var17 (copy)
				var15(p0.AbsolutePosition)
				var17(p0.AbsoluteSize)
			end
			
			var15(p0.AbsolutePosition)
			var17(p0.AbsoluteSize)
			local var21 = p0:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateFromAnchor)
			local var22 = p0:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateFromAnchor)
			
			return function() --[[ line: 66 ]]
				-- upvalues: var21 (ref), var22 (ref)
				var21:Disconnect()
				var22:Disconnect()
			end
		end
	end, { p0, var7 })
	reactModule.useLayoutEffect(function() --[[ line: 72 ]]
		-- upvalues: var7 (ref), var6 (ref)
		if var7 then
			var6.requestOverlay()
		end
	end, { var6.requestOverlay, var7 })
	reactModule.useLayoutEffect(function() --[[ line: 78 ]]
		-- upvalues: var7 (ref), var6 (ref), var19 (ref)
		if not var7 then return end
		local instance = var6.instance
		
		if instance == nil or not instance:IsA("GuiObject") then
			var19(Vector2.zero)
			
			return
		end
		local function updateOffset() --[[ line: 89 ]]
			-- upvalues: var19 (copy), instance (ref)
			var19(instance.AbsolutePosition)
		end
		
		var19(instance.AbsolutePosition)
		local var24 = instance:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateOffset)
		
		return function() --[[ line: 95 ]]
			-- upvalues: var24 (ref)
			var24:Disconnect()
		end
	end, { var6.instance, var7 })
	
	return {
		uri = if p1 ~= nil then var13.uri else p1,
		element = if var7 and var6.instance then reactRobloxModule.createPortal(reactModule.createElement(viewModule, {
			Visible = true,
			Position = UDim2.fromOffset(var14.X - var18.X, var14.Y - var18.Y),
			Size = UDim2.fromOffset(var16.X, var16.Y),
			ref = var12
		}), var6.instance) else nil,
		isVirtual = var7,
		isReady = if p1 ~= nil then p0 ~= nil and (not var7 or var6.instance ~= nil) else true
	}
end