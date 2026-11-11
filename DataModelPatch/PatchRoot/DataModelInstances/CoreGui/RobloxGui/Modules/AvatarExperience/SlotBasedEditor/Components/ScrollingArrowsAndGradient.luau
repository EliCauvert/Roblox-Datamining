local CorePackages = game:GetService("CorePackages")
local OtterModule = require(CorePackages.Packages.Otter)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local ReactModule = require(CorePackages.Packages.React)
local UseEffectFunction = ReactModule.useEffect
local UseCallbackFunction = ReactModule.useCallback
local UseRefFunction = ReactModule.useRef
local UseMotorFunction = require(CorePackages.Packages.ReactOtter).useMotor
local ScrollingListWithArrowsAndGradientModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.ScrollingListWithArrowsAndGradient)
local _ = require(CorePackages.Workspace.Packages.AppCommonLib)
local FFlagAXSlotsFixLeftScroll = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsFixLeftScroll
local config = {
	frequency = 2,
	dampingRatio = 0.9,
	restingPositionLimit = 0.5,
	restingVelocityLimit = 0.1
}

local function getScrollToLocation(ButtonPadding, ScrollingFrameRef, Frame: Frame): number?
	-- upvalues: FFlagAXSlotsFixLeftScroll (copy)
	if typeof(ScrollingFrameRef) == "table" and ScrollingFrameRef.current ~= nil and Frame ~= nil then
		local X: number = ScrollingFrameRef.current.AbsolutePosition.X
		local X1: number = ScrollingFrameRef.current.AbsoluteWindowSize.X
		local X2 = ScrollingFrameRef.current.CanvasPosition.X
		local X3: number = Frame.AbsolutePosition.X
		local NewX = Frame.AbsoluteSize.X + (ButtonPadding or 0)
		local FlooredDelta = math.floor(X1 / 2) - math.floor(NewX / 2)
		local IsNewXAbove = NewX > X1 - (X3 - X)
		
		if if FFlagAXSlotsFixLeftScroll then X3 < X else X3 < X and NewX < X - math.abs(X3) then
			return (math.max(X2 - (X - X3) - FlooredDelta, 0))
		elseif IsNewXAbove then
			return X2 + (NewX - (X1 - (X3 - X))) + FlooredDelta
		end
	end
	return nil
end

return ReactModule.memo(function(Frame: Frame)
	-- upvalues: RoactGamepadModule (copy), UseRefFunction (copy), ReactModule (copy), UseMotorFunction (copy), UseCallbackFunction (copy), getScrollToLocation (copy), OtterModule (copy), config (copy), UseEffectFunction (copy), ScrollingListWithArrowsAndGradientModule (copy)
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseRefResult = UseRefFunction(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseMotorResult = UseMotorFunction(if UseRefResult.current then UseRefResult.current.CanvasPosition.X else 0, (ReactModule.useCallback(function(X)
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current.CanvasPosition = Vector2.new(X, 0)
		end
	end, {})))
	local UseCallbackResult = UseCallbackFunction(function(p1)
		-- upvalues: Frame (copy), UseRefCacheResult (copy), UseStateResult2 (copy), getScrollToLocation (upval), UseRefResult (copy), UseMotorResult (copy), OtterModule (upval), config (upval)
		if Frame.selectedItemKey then
			local UseRefCacheResultEntry = UseRefCacheResult[Frame.selectedItemKey]
			
			if UseRefCacheResultEntry then
				UseStateResult2(UseRefCacheResultEntry.current)
				
				if Frame.enableSnapToSelectedItem or p1 then
					local ScrollToLocation = getScrollToLocation(Frame.buttonPadding, UseRefResult, UseRefCacheResultEntry.current)
					
					if ScrollToLocation then
						UseMotorResult(OtterModule.spring(ScrollToLocation, config))
					end
				end
			end
		end
	end, {
		Frame.selectedItemKey,
		Frame.enableSnapToSelectedItem,
		Frame.buttonPadding
	})
	UseEffectFunction(function()
		-- upvalues: UseCallbackResult (copy)
		UseCallbackResult()
	end, {
		UseCallbackResult,
		Frame.selectedItemKey,
		Frame.enableSnapToSelectedItem,
		Frame.buttonPadding
	})
	local ResetPositionSignal = Frame.resetPositionSignal
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: UseCallbackResult (copy)
		UseCallbackResult(true)
	end, {
		UseCallbackResult,
		Frame.buttonPadding,
		Frame.selectedItemKey
	})
	UseEffectFunction(function()
		-- upvalues: ResetPositionSignal (copy), UseCallbackResult1 (copy)
		local Connection = if ResetPositionSignal then ResetPositionSignal:connect(UseCallbackResult1) else nil
		
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:disconnect()
			end
		end
	end, { nil, ResetPositionSignal, Frame.selectedItemKey })
	local UseCallbackResult2 = UseCallbackFunction(function(p1)
		-- upvalues: UseRefCacheResult (copy)
		return UseRefCacheResult[p1]
	end, {})
	local UseCallbackResult3 = UseCallbackFunction(function(Frame)
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current.CanvasSize = UDim2.new(0, Frame.AbsoluteSize.X, 1, 0)
		end
	end, {})
	local UseCallbackResult4 = UseCallbackFunction(function()
		-- upvalues: UseRefResult (copy)
		return UseRefResult
	end, {})
	
	return ReactModule.createElement("Frame", {
		ClipsDescendants = true,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = Frame.LayoutOrder,
		AutomaticSize = if Frame.AutomaticSize then Frame.AutomaticSize else nil,
		Size = if Frame.navHeight then UDim2.new(1, 0, 0, Frame.navHeight) else UDim2.new(1, 0, 1, 0),
		ZIndex = Frame.ZIndex
	}, {
		ScrollingList = ReactModule.createElement(ScrollingListWithArrowsAndGradientModule, {
			getScollingListContent = UseCallbackFunction(function()
				-- upvalues: Frame (copy), UseCallbackResult2 (copy), UseCallbackResult4 (copy), UseCallbackResult3 (copy), UseStateResult (copy)
				return Frame.renderScrollingListContent({
					getScrollingFrameItemRef = UseCallbackResult2,
					getScrollingFrameRef = UseCallbackResult4,
					onNavFrameSizeChanged = UseCallbackResult3,
					selectedItemInstance = UseStateResult
				})
			end, {
				Frame.renderScrollingListContent,
				UseCallbackResult2,
				UseCallbackResult4,
				UseCallbackResult3,
				UseStateResult
			}),
			scrollingFrameRef = UseRefResult,
			buttonRefs = UseRefCacheResult,
			buttonPadding = Frame.buttonPadding or 0,
			childWidgetIndex = if Frame.enableIntroScroll then tostring(Frame.index) else nil,
			useIntroScroll = Frame.enableIntroScroll or false
		})
	})
end)