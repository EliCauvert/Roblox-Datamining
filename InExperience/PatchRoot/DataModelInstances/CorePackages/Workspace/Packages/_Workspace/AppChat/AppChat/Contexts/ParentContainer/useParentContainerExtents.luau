local guiService = game:GetService("GuiService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local useBinding = reactModule.useBinding
local useContext = reactModule.useContext
local useEffect = reactModule.useEffect
local useLayerCollector = require(parent.UIBlox).Core.Layout.LayerCollector.useLayerCollector
local responsiveModule = require(parent.Responsive)
local useOrientation = responsiveModule.useOrientation
local parentContainerContextModule = require(appChat.Contexts.ParentContainer.ParentContainerContext)
local getFFlagAppChatInExperienceTabBarAdjustmentModule = require(appChat.Flags.getFFlagAppChatInExperienceTabBarAdjustment)

return function()
	-- upvalues: useContext (ref), parentContainerContextModule (ref), useLayerCollector (ref), getFFlagAppChatInExperienceTabBarAdjustmentModule (ref), useOrientation (ref), useBinding (ref), responsiveModule (ref), useEffect (ref), guiService (ref)
	local var1
	local parentContainer = useContext(parentContainerContextModule).getParentContainer()
	local var2 = useLayerCollector()
	local var3 = if not getFFlagAppChatInExperienceTabBarAdjustmentModule() then useOrientation() else nil
	local var4, var5 = useBinding(if parentContainer then parentContainer.AbsoluteSize else Vector2.zero)
	local var6, var7 = useBinding(if parentContainer then parentContainer.AbsolutePosition else Vector2.zero)
	
	if getFFlagAppChatInExperienceTabBarAdjustmentModule() then
		var1 = nil
	else
		var1 = var3 == responsiveModule.Keys.Landscape
		var1 = nil
	end
	useEffect(function()
		-- upvalues: parentContainer (ref), var2 (ref), getFFlagAppChatInExperienceTabBarAdjustmentModule (copy), var1 (ref), guiService (copy), var5 (ref), var7 (ref)
		if not parentContainer then
			return function() end
		end
		local _ = nil
		local _ = nil
		local safeZoneOffsetsChangedConnection = nil
		
		local _ = function(p1, p2, p3)
			return Vector2.new(math.clamp(p1.X, p2.X, p3.X), math.clamp(p1.Y, p2.Y, p3.Y))
		end
		
		local var8 = function()
			-- upvalues: parentContainer (copy), var2 (copy), getFFlagAppChatInExperienceTabBarAdjustmentModule (copy), var1 (copy), guiService (copy), var5 (copy), var7 (copy)
			local absoluteSize = parentContainer.AbsoluteSize
			local absolutePosition = parentContainer.AbsolutePosition
			local absoluteSize_1 = var2.absoluteSize
			absoluteSize_1 -= if not (getFFlagAppChatInExperienceTabBarAdjustmentModule() or not var1) then Vector2.new(0, guiService:GetSafeZoneOffsets().bottom) else Vector2.zero
			local zero = Vector2.zero
			local vector2 = Vector2.new(math.clamp(absolutePosition.X, zero.X, absoluteSize_1.X), math.clamp(absolutePosition.Y, zero.Y, absoluteSize_1.Y))
			local zero_1 = Vector2.zero
			local var9 = absoluteSize_1 - vector2
			var5(Vector2.new(math.clamp(absoluteSize.X, zero_1.X, var9.X), math.clamp(absoluteSize.Y, zero_1.Y, var9.Y)))
			var7(vector2)
		end
		
		local var9 = parentContainer:GetPropertyChangedSignal("AbsoluteSize"):Connect(var8)
		local var10 = parentContainer:GetPropertyChangedSignal("AbsolutePosition"):Connect(var8)
		
		if not getFFlagAppChatInExperienceTabBarAdjustmentModule() then
			safeZoneOffsetsChangedConnection = guiService.SafeZoneOffsetsChanged:Connect(var8)
		end
		var8()
		
		return function()
			-- upvalues: var9 (write), var10 (write), getFFlagAppChatInExperienceTabBarAdjustmentModule (copy), safeZoneOffsetsChangedConnection (write)
			if var9 and var9.Connected then
				var9:Disconnect()
			end
			if var10 and var10.Connected then
				var10:Disconnect()
			end
			if not getFFlagAppChatInExperienceTabBarAdjustmentModule() and safeZoneOffsetsChangedConnection and safeZoneOffsetsChangedConnection.Connected then
				safeZoneOffsetsChangedConnection:Disconnect()
			end
		end
	end, {
		parentContainer,
		var5,
		var7,
		var2.absoluteSize,
		var1
	})
	
	return var4, var6
end