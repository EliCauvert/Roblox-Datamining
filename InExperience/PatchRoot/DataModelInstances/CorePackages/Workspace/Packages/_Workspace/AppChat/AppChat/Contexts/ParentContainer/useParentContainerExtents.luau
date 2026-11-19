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
local ToScreenGuiPositionModule = require(AppChat.Contexts.ParentContainer.toScreenGuiPosition)
local FFlagKeepSideSheetOpenBesideMenu = require(Parent.SharedFlags).FFlagKeepSideSheetOpenBesideMenu

return function()
	-- upvalues: UseContextFunction (copy), ParentContainerContextModule (copy), UseLayerCollectorFunction (copy), GetFFlagAppChatInExperienceTabBarAdjustmentModule (copy), UseOrientationFunction (copy), UseBindingFunction (copy), ResponsiveModule (copy), UseEffectFunction (copy), FFlagKeepSideSheetOpenBesideMenu (copy), GuiService (copy), ToScreenGuiPositionModule (copy)
	local ParentContainer = UseContextFunction(ParentContainerContextModule).getParentContainer()
	local UseLayerCollectorResult = UseLayerCollectorFunction()
	local UseOrientationResult = if GetFFlagAppChatInExperienceTabBarAdjustmentModule() then nil else UseOrientationFunction()
	local UseBindingResult, UseBindingResult2 = UseBindingFunction(if ParentContainer then ParentContainer.AbsoluteSize else Vector2.zero)
	local UseBindingResult1, UseBindingResult2_1 = UseBindingFunction(if ParentContainer then ParentContainer.AbsolutePosition else Vector2.zero)
	local IsUseOrientationResultMatch = if GetFFlagAppChatInExperienceTabBarAdjustmentModule() then nil else UseOrientationResult == ResponsiveModule.Keys.Landscape
	UseEffectFunction(function()
		-- upvalues: ParentContainer (copy), UseLayerCollectorResult (copy), FFlagKeepSideSheetOpenBesideMenu (upval), GuiService (upval), ToScreenGuiPositionModule (upval), GetFFlagAppChatInExperienceTabBarAdjustmentModule (upval), IsUseOrientationResultMatch (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy)
		if not ParentContainer then
			local function Connection2() end
			
			return Connection2
		end
		local Connection2 = nil
		local Connection3 = nil
		local Connection = nil
		local Connection1 = nil
		
		local function _(Vector, Vector1, Vector3): Vector2
			return Vector2.new(math.clamp(Vector.X, Vector1.X, Vector3.X), (math.clamp(Vector.Y, Vector1.Y, Vector3.Y)))
		end
		
		local function Callback()
			-- upvalues: ParentContainer (upval), UseLayerCollectorResult (upval), FFlagKeepSideSheetOpenBesideMenu (upval), GuiService (upval), ToScreenGuiPositionModule (upval), GetFFlagAppChatInExperienceTabBarAdjustmentModule (upval), IsUseOrientationResultMatch (upval), UseBindingResult2 (upval), UseBindingResult2_1 (upval)
			local AbsoluteSize = ParentContainer.AbsoluteSize
			local AbsolutePosition = ParentContainer.AbsolutePosition
			local AbsoluteSize1 = UseLayerCollectorResult.absoluteSize
			local ZeroVector = Vector2.zero
			
			if FFlagKeepSideSheetOpenBesideMenu then
				local ScreenGui = ParentContainer:FindFirstAncestorWhichIsA("ScreenGui")
				
				if ScreenGui and ScreenGui.IgnoreGuiInset then
					AbsolutePosition = ToScreenGuiPositionModule(AbsolutePosition, (GuiService:GetGuiInset()))
				end
			end
			if not GetFFlagAppChatInExperienceTabBarAdjustmentModule() and IsUseOrientationResultMatch then
				ZeroVector = Vector2.new(0, GuiService:GetSafeZoneOffsets().bottom)
			end
			local AbsoluteSizeDelta: Vector2 = AbsoluteSize1 - ZeroVector
			local ZeroVector1 = Vector2.zero
			local _Vector2 = Vector2.new(math.clamp(AbsolutePosition.X, ZeroVector1.X, AbsoluteSizeDelta.X), (math.clamp(AbsolutePosition.Y, ZeroVector1.Y, AbsoluteSizeDelta.Y)))
			local ZeroVector2 = Vector2.zero
			local AbsoluteSizeDeltaDelta: Vector2 = AbsoluteSizeDelta - _Vector2
			UseBindingResult2((Vector2.new(math.clamp(AbsoluteSize.X, ZeroVector2.X, AbsoluteSizeDeltaDelta.X), (math.clamp(AbsoluteSize.Y, ZeroVector2.Y, AbsoluteSizeDeltaDelta.Y)))))
			UseBindingResult2_1(_Vector2)
		end
		
		Connection2 = ParentContainer:GetPropertyChangedSignal("AbsoluteSize"):Connect(Callback)
		Connection3 = ParentContainer:GetPropertyChangedSignal("AbsolutePosition"):Connect(Callback)
		
		if FFlagKeepSideSheetOpenBesideMenu then
			local ScreenGui = ParentContainer:FindFirstAncestorWhichIsA("ScreenGui")
			
			if ScreenGui then
				Connection1 = ScreenGui:GetPropertyChangedSignal("IgnoreGuiInset"):Connect(Callback)
			end
		end
		if not GetFFlagAppChatInExperienceTabBarAdjustmentModule() then
			Connection = GuiService.SafeZoneOffsetsChanged:Connect(Callback)
		end
		Callback()
		
		return function()
			-- upvalues: Connection2 (ref), Connection3 (ref), FFlagKeepSideSheetOpenBesideMenu (upval), Connection1 (ref), GetFFlagAppChatInExperienceTabBarAdjustmentModule (upval), Connection (ref)
			if Connection2 and Connection2.Connected then
				Connection2:Disconnect()
			end
			if Connection3 and Connection3.Connected then
				Connection3:Disconnect()
			end
			if FFlagKeepSideSheetOpenBesideMenu and Connection1 and Connection1.Connected then
				Connection1:Disconnect()
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