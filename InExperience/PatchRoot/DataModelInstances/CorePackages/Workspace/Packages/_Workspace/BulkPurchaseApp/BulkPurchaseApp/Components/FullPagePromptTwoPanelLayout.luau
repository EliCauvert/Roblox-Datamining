local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local useScreenSize = require(parent.EconomyCommonCoreScriptHooks).useScreenSize
local constantsModule = require(bulkPurchaseApp.constants)

return function(p1)
	-- upvalues: reactModule (ref), useScreenSize (ref), useDesignTokens (ref), constantsModule (ref)
	local var1, var2 = reactModule.useBinding(Vector2.new(0, 0))
	local var3 = useScreenSize()
	local var4 = useDesignTokens()
	local size300 = var4.Size.Size_300
	local var5 = var3.X < constantsModule.MOBILE_BREAKPOINT and var3.X < var3.Y
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p1.size,
		LayoutOrder = p1.LayoutOrder
	}, {
		StartSlot = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = var1:map(function(p2)
				-- upvalues: var5 (ref), var4 (ref), size300 (ref)
				return if var5 then UDim2.new(1, 0, 1, -(p2.Y + var4.Size.Size_600)) else UDim2.new(0.5, -size300, 1, 0)
			end)
		}, p1.startSlot),
		EndSlot = reactModule.createElement("Frame", {
			Size = if var5 then UDim2.new(1, 0, 0, 0) else UDim2.new(0.5, -size300, 0, 0),
			Position = if var5 then UDim2.new(0, 0, 1, 0) else UDim2.new(0.5, size300, 0, 0),
			AnchorPoint = if var5 then Vector2.new(0, 1) else Vector2.new(0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			[reactModule.Change.AbsoluteSize] = function(p2)
				-- upvalues: var2 (ref)
				var2(p2.AbsoluteSize)
			end
		}, p1.endSlot)
	})
end