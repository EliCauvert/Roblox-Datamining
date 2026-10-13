local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local visibilityControlModule = require(parent.VisibilityControl)
local getScrollAwayEnabledModule = require(parent.getScrollAwayEnabled)
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(function(value)
	-- upvalues: useTokens (ref), reactModule (ref), getScrollAwayEnabledModule (ref), visibilityControlModule (ref)
	local var1 = useTokens()
	local color3 = var1.Color.Common.NavigationBar.Color3
	local transparency = var1.Color.Common.NavigationBar.Transparency
	local color3_1 = var1.Color.Surface.Surface_0.Color3
	local transparency_1 = var1.Color.Surface.Surface_0.Transparency
	local var2, var3 = reactModule.useBinding(color3)
	local var4, var5 = reactModule.useBinding(transparency)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), color3 (ref), color3_1 (ref), var5 (ref), transparency (ref), transparency_1 (ref), getScrollAwayEnabledModule (copy), value (ref), visibilityControlModule (copy), reactModule (copy)
		local function update(p1)
			-- upvalues: var3 (copy), color3 (copy), color3_1 (copy), var5 (copy), transparency (copy), transparency_1 (copy)
			local var6 = 1 - p1
			var3(color3:Lerp(color3_1, var6))
			var5(transparency + (transparency_1 - transparency) * var6)
		end
		
		if getScrollAwayEnabledModule() then
			local footerBinding = visibilityControlModule.getFooterBinding()
			local var6 = reactModule.__subscribeToBinding(footerBinding, update)
			local var7 = 1 - footerBinding:getValue()
			var3(color3:Lerp(color3_1, var7))
			var5(transparency + (transparency_1 - transparency) * var7)
			
			return var6
		end
		local var8 = 1 - (if value.isVisible then 1 else 0)
		var3(color3:Lerp(color3_1, var8))
		var5(transparency + (transparency_1 - transparency) * var8)
		
		return nil
	end, {
		value.isVisible,
		color3,
		transparency,
		color3_1,
		transparency_1
	})
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Active = true,
		ZIndex = 0,
		AnchorPoint = value.AnchorPoint,
		Position = value.Position,
		Size = value.Size,
		BackgroundColor3 = var2,
		BackgroundTransparency = var4
	})
end)