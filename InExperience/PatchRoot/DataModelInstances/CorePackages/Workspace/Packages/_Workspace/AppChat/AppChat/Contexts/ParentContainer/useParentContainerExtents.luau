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

return function() --[[ line: 22 | named "useParentContainerExtents" ]]
	-- upvalues: useContext (ref), parentContainerContextModule (ref), useLayerCollector (ref), getFFlagAppChatInExperienceTabBarAdjustmentModule (ref), useOrientation (ref), useBinding (ref), responsiveModule (ref), useEffect (ref), guiService (ref)
	local var13
	local parentContainer = useContext(parentContainerContextModule).getParentContainer()
	local var7 = useLayerCollector()
	local var8 = if not getFFlagAppChatInExperienceTabBarAdjustmentModule() then useOrientation() else nil
	local var9, var10 = useBinding(if parentContainer then parentContainer.AbsoluteSize else Vector2.zero)
	local var11, var12 = useBinding(if parentContainer then parentContainer.AbsolutePosition else Vector2.zero)
	
	if getFFlagAppChatInExperienceTabBarAdjustmentModule() then
		var13 = nil
	else
		var13 = var8 == responsiveModule.Keys.Landscape
		var13 = nil
	end
	useEffect(function() --[[ line: 37 ]]
		-- upvalues: parentContainer (ref), var7 (ref), getFFlagAppChatInExperienceTabBarAdjustmentModule (copy), var13 (ref), guiService (copy), var10 (ref), var12 (ref)
		if not parentContainer then
			return function() --[[ line: 100 ]] end
		end
		local _ = nil
		local _ = nil
		local safeZoneOffsetsChangedConnection = nil
		
		local _ = function(p0, p1, p2) --[[ line: 41 ]]
			return Vector2.new(math.clamp(p0.X, p1.X, p2.X), math.clamp(p0.Y, p1.Y, p2.Y))
		end
		
		local var15 = function() --[[ line: 45 ]]
			-- upvalues: parentContainer (copy), var7 (copy), getFFlagAppChatInExperienceTabBarAdjustmentModule (copy), var13 (copy), guiService (copy), var10 (copy), var12 (copy)
			local absoluteSize = parentContainer.AbsoluteSize
			local absolutePosition = parentContainer.AbsolutePosition
			local absoluteSize_1 = var7.absoluteSize
			absoluteSize_1 -= if not (getFFlagAppChatInExperienceTabBarAdjustmentModule() or not var13) then Vector2.new(0, guiService:GetSafeZoneOffsets().bottom) else Vector2.zero
			local zero = Vector2.zero
			local vector2 = Vector2.new(math.clamp(absolutePosition.X, zero.X, absoluteSize_1.X), math.clamp(absolutePosition.Y, zero.Y, absoluteSize_1.Y))
			local zero_1 = Vector2.zero
			local var21 = absoluteSize_1 - vector2
			var10(Vector2.new(math.clamp(absoluteSize.X, zero_1.X, var21.X), math.clamp(absoluteSize.Y, zero_1.Y, var21.Y)))
			var12(vector2)
		end
		
		local var16 = parentContainer:GetPropertyChangedSignal("AbsoluteSize"):Connect(var15)
		local var17 = parentContainer:GetPropertyChangedSignal("AbsolutePosition"):Connect(var15)
		
		if not getFFlagAppChatInExperienceTabBarAdjustmentModule() then
			safeZoneOffsetsChangedConnection = guiService.SafeZoneOffsetsChanged:Connect(var15)
		end
		var15()
		
		return function() --[[ line: 85 ]]
			-- upvalues: var16 (write), var17 (write), getFFlagAppChatInExperienceTabBarAdjustmentModule (copy), safeZoneOffsetsChangedConnection (write)
			if var16 and var16.Connected then
				var16:Disconnect()
			end
			if var17 and var17.Connected then
				var17:Disconnect()
			end
			if not getFFlagAppChatInExperienceTabBarAdjustmentModule() and safeZoneOffsetsChangedConnection and safeZoneOffsetsChangedConnection.Connected then
				safeZoneOffsetsChangedConnection:Disconnect()
			end
		end
	end, {
		parentContainer,
		var10,
		var12,
		var7.absoluteSize,
		var13
	})
	
	return var9, var11
end