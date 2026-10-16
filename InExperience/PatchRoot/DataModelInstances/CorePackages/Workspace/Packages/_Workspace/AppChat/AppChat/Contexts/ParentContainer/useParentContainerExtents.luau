local GuiService = game:GetService("GuiService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UseBindingFunction = ReactModule.useBinding
local UseContextFunction = ReactModule.useContext
local UseEffectFunction = ReactModule.useEffect
local UseLayerCollectorFunction = require(Parent.UIBlox).Core.Layout.LayerCollector.useLayerCollector
local ResponsiveModule = require(Parent.Responsive)
local UseOrientationFunction = ResponsiveModule.useOrientation
local ParentContainerContextModule = require(AppChat.Contexts.ParentContainer.ParentContainerContext)
local GetFFlagAppChatInExperienceTabBarAdjustmentModule = require(AppChat.Flags.getFFlagAppChatInExperienceTabBarAdjustment)

return function() --[[ Line: 22 | Named "useParentContainerExtents" ]]
	-- upvalues: UseContextFunction (copy), ParentContainerContextModule (copy), UseLayerCollectorFunction (copy), GetFFlagAppChatInExperienceTabBarAdjustmentModule (copy), UseOrientationFunction (copy), UseBindingFunction (copy), ResponsiveModule (copy), UseEffectFunction (copy), GuiService (copy)
	local ParentContainer = UseContextFunction(ParentContainerContextModule).getParentContainer()
	local UseLayerCollectorResult = UseLayerCollectorFunction()
	local UseOrientationResult = if GetFFlagAppChatInExperienceTabBarAdjustmentModule() then nil else UseOrientationFunction()
	local UseBindingResult, UseBindingResult2 = UseBindingFunction(if ParentContainer then ParentContainer.AbsoluteSize else Vector2.zero)
	local UseBindingResult1, UseBindingResult2_1 = UseBindingFunction(if ParentContainer then ParentContainer.AbsolutePosition else Vector2.zero)
	local IsUseOrientationResultMatch = if GetFFlagAppChatInExperienceTabBarAdjustmentModule() then nil else UseOrientationResult == ResponsiveModule.Keys.Landscape
	UseEffectFunction(function() --[[ Line: 37 ]]
		-- upvalues: ParentContainer (copy), UseLayerCollectorResult (copy), GetFFlagAppChatInExperienceTabBarAdjustmentModule (upval), IsUseOrientationResultMatch (copy), GuiService (upval), UseBindingResult2 (copy), UseBindingResult2_1 (copy)
		if not ParentContainer then
			local function Connection1() --[[ Line: 100 ]] end
			
			return Connection1
		end
		local Connection1 = nil
		local Connection2 = nil
		local Connection = nil
		
		local function _(Vector, Vector1, Vector3): Vector2 --[[ Line: 41 ]]
			return Vector2.new(math.clamp(Vector.X, Vector1.X, Vector3.X), (math.clamp(Vector.Y, Vector1.Y, Vector3.Y)))
		end
		
		local function Callback() --[[ Line: 45 ]]
			-- upvalues: ParentContainer (upval), UseLayerCollectorResult (upval), GetFFlagAppChatInExperienceTabBarAdjustmentModule (upval), IsUseOrientationResultMatch (upval), GuiService (upval), UseBindingResult2 (upval), UseBindingResult2_1 (upval)
			local AbsoluteSize = ParentContainer.AbsoluteSize
			local AbsolutePosition = ParentContainer.AbsolutePosition
			local AbsoluteSizeDelta = UseLayerCollectorResult.absoluteSize - (if GetFFlagAppChatInExperienceTabBarAdjustmentModule() or not IsUseOrientationResultMatch then Vector2.zero else Vector2.new(0, GuiService:GetSafeZoneOffsets().bottom))
			local ZeroVector = Vector2.zero
			local _Vector2 = Vector2.new(math.clamp(AbsolutePosition.X, ZeroVector.X, AbsoluteSizeDelta.X), (math.clamp(AbsolutePosition.Y, ZeroVector.Y, AbsoluteSizeDelta.Y)))
			local ZeroVector1 = Vector2.zero
			local AbsoluteSizeDeltaDelta: Vector2 = AbsoluteSizeDelta - _Vector2
			UseBindingResult2((Vector2.new(math.clamp(AbsoluteSize.X, ZeroVector1.X, AbsoluteSizeDeltaDelta.X), (math.clamp(AbsoluteSize.Y, ZeroVector1.Y, AbsoluteSizeDeltaDelta.Y)))))
			UseBindingResult2_1(_Vector2)
		end
		
		Connection1 = ParentContainer:GetPropertyChangedSignal("AbsoluteSize"):Connect(Callback)
		Connection2 = ParentContainer:GetPropertyChangedSignal("AbsolutePosition"):Connect(Callback)
		
		if not GetFFlagAppChatInExperienceTabBarAdjustmentModule() then
			Connection = GuiService.SafeZoneOffsetsChanged:Connect(Callback)
		end
		Callback()
		
		return function() --[[ Line: 85 ]]
			-- upvalues: Connection1 (ref), Connection2 (ref), GetFFlagAppChatInExperienceTabBarAdjustmentModule (upval), Connection (ref)
			if Connection1 and Connection1.Connected then
				Connection1:Disconnect()
			end
			if Connection2 and Connection2.Connected then
				Connection2:Disconnect()
			end
			if not GetFFlagAppChatInExperienceTabBarAdjustmentModule() and Connection and Connection.Connected then
				Connection:Disconnect()
			end
		end
	end, {
		ParentContainer,
		UseBindingResult2,
		UseBindingResult2_1,
		UseLayerCollectorResult.absoluteSize,
		IsUseOrientationResultMatch
	})
	
	return UseBindingResult, UseBindingResult1
end