local GuiService = game:GetService("GuiService")
local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local OtterModule = require(Parent.Otter)
local UseDismissOnEscapeOrMenuModule = require(ChatUIPrimitives.Hooks.useDismissOnEscapeOrMenu)
local FFlagExpChatExpressionTrayReducedMotionModule = require(ChatUIPrimitives.Flags.FFlagExpChatExpressionTrayReducedMotion)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection
local config = { dampingRatio = 1, frequency = 3.5 }

local function getSafeInsets()
	-- upvalues: GuiService (copy)
	local InsetArea = GuiService:GetInsetArea(Enum.ScreenInsets.DeviceSafeInsets)
	local InsetArea1 = GuiService:GetInsetArea(Enum.ScreenInsets.None)
	
	return {
		left = math.max(0, InsetArea.Min.X - InsetArea1.Min.X),
		right = math.max(0, InsetArea1.Max.X - InsetArea.Max.X),
		bottom = math.max(0, InsetArea1.Max.Y - InsetArea.Max.Y)
	}
end

local function _(SafeInsets, SafeInsets1): boolean
	return SafeInsets.left == SafeInsets1.left and SafeInsets.right == SafeInsets1.right and SafeInsets.bottom == SafeInsets1.bottom
end

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), FFlagExpChatExpressionTrayReducedMotionModule (copy), ReactModule (copy), getSafeInsets (copy), UseEventConnectionFunction (copy), OtterModule (copy), config (copy), UseDismissOnEscapeOrMenuModule (copy), ReactRobloxModule (copy)
	local UseOverlayResult = FoundationModule.Hooks.useOverlay()
	local ReducedMotion = if FFlagExpChatExpressionTrayReducedMotionModule then FoundationModule.Hooks.usePreferences().reducedMotion else false
	local IsOpen = p1.isOpen
	local Height = p1.height or 240
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(1)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(getSafeInsets)
	UseEventConnectionFunction(if UseOverlayResult == nil then nil else UseOverlayResult:GetPropertyChangedSignal("AbsoluteSize"), (ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), getSafeInsets (upval)
		UseStateResult2_1(function(SafeInsets)
			-- upvalues: getSafeInsets (upval)
			local SafeInsets1 = getSafeInsets()
			local IsBottomMatch: boolean = SafeInsets.left == SafeInsets1.left and SafeInsets.right == SafeInsets1.right and SafeInsets.bottom == SafeInsets1.bottom
			
			return if IsBottomMatch then SafeInsets else SafeInsets1
		end)
	end, {})))
	local NewHeight = Height + UseStateResult1.bottom
	ReactModule.useEffect(function()
		-- upvalues: ReducedMotion (ref), UseRefResult (copy), UseBindingResult2 (copy), IsOpen (copy), UseStateResult2 (copy), OtterModule (upval), UseBindingResult (copy), config (upval)
		if ReducedMotion then
			if UseRefResult.current then
				UseRefResult.current:destroy()
				UseRefResult.current = nil
			end
			UseBindingResult2(if IsOpen then 0 else 1)
			UseStateResult2(IsOpen)
			
			return
		else
			if IsOpen then
				UseStateResult2(true)
				
				if UseRefResult.current then
					UseRefResult.current:destroy()
				end
				local SingleMotor = OtterModule.createSingleMotor(UseBindingResult:getValue())
				UseRefResult.current = SingleMotor
				SingleMotor:onStep(UseBindingResult2)
				SingleMotor:setGoal(OtterModule.spring(0, config))
				
				return
			elseif UseRefResult.current then
				UseRefResult.current:setGoal(OtterModule.spring(1, config))
				UseRefResult.current:onComplete(function()
					-- upvalues: UseStateResult2 (upval)
					UseStateResult2(false)
				end)
			end
		end
	end, { IsOpen, ReducedMotion })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				UseRefResult.current:destroy()
				UseRefResult.current = nil
			end
		end
	end, {})
	UseDismissOnEscapeOrMenuModule(IsOpen, p1.onPressedOutside)
	
	return if UseStateResult and UseOverlayResult ~= nil then ReactRobloxModule.createPortal(ReactModule.createElement(FoundationModule.View, { tag = "size-full" }, {
		Backdrop = if IsOpen then ReactModule.createElement("TextButton", {
			Text = "",
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ZIndex = 1,
			[ReactModule.Event.Activated] = p1.onPressedOutside
		}) else nil,
		Tray = ReactModule.createElement(FoundationModule.View, {
			ZIndex = 2,
			tag = "anchor-bottom-center stroke-standard stroke-default clip bg-surface-200",
			Position = UseBindingResult:map(function(p2): UDim2
				-- upvalues: NewHeight (copy)
				return UDim2.new(0.5, 0, 1, (math.round(p2 * NewHeight)))
			end),
			Size = UDim2.new(1, 0, 0, NewHeight),
			padding = {
				bottom = UDim.new(0, UseStateResult1.bottom),
				left = UDim.new(0, UseStateResult1.left),
				right = UDim.new(0, UseStateResult1.right)
			},
			onActivated = function() end,
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			}
		}, { Container = p1.content })
	}), UseOverlayResult) else nil
end)