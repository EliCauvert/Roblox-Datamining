local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseScreenSizeFunction = require(Parent.EconomyCommonCoreScriptHooks).useScreenSize
local ConstantsModule = require(BulkPurchaseApp.constants)

return function(Frame)
	-- upvalues: ReactModule (copy), UseScreenSizeFunction (copy), UseDesignTokensFunction (copy), ConstantsModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new(0, 0))
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Size300 = UseDesignTokensResult.Size.Size_300
	local IsXBelow: boolean = UseScreenSizeResult.X < ConstantsModule.MOBILE_BREAKPOINT and UseScreenSizeResult.X < UseScreenSizeResult.Y
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = Frame.size,
		LayoutOrder = Frame.LayoutOrder
	}, {
		StartSlot = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UseBindingResult:map(function(p1): UDim2
				-- upvalues: IsXBelow (copy), UseDesignTokensResult (copy), Size300 (copy)
				return if IsXBelow then UDim2.new(1, 0, 1, -(p1.Y + UseDesignTokensResult.Size.Size_600)) else UDim2.new(0.5, -Size300, 1, 0)
			end)
		}, Frame.startSlot),
		EndSlot = ReactModule.createElement("Frame", {
			Size = if IsXBelow then UDim2.new(1, 0, 0, 0) else UDim2.new(0.5, -Size300, 0, 0),
			Position = if IsXBelow then UDim2.new(0, 0, 1, 0) else UDim2.new(0.5, Size300, 0, 0),
			AnchorPoint = if IsXBelow then Vector2.new(0, 1) else Vector2.new(0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			[ReactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: UseBindingResult2 (copy)
				UseBindingResult2(Frame.AbsoluteSize)
			end
		}, Frame.endSlot)
	})
end