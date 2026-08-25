local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local useScreenSize = require(parent.EconomyCommonCoreScriptHooks).useScreenSize
local constantsModule = require(bulkPurchaseApp.constants)

return function(p0)
	-- upvalues: reactModule (ref), useScreenSize (ref), useDesignTokens (ref), constantsModule (ref)
	local var3, var4 = reactModule.useBinding(Vector2.new(0, 0))
	local var5 = useScreenSize()
	local var6 = useDesignTokens()
	local size300 = var6.Size.Size_300
	local var7 = var5.X < constantsModule.MOBILE_BREAKPOINT and var5.X < var5.Y
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p0.size,
		LayoutOrder = p0.LayoutOrder
	}, {
		StartSlot = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = var3:map(function(p1)
				-- upvalues: var7 (ref), var6 (ref), size300 (ref)
				return if var7 then UDim2.new(1, 0, 1, -(p1.Y + var6.Size.Size_600)) else UDim2.new(0.5, -size300, 1, 0)
			end)
		}, p0.startSlot),
		EndSlot = reactModule.createElement("Frame", {
			Size = if var7 then UDim2.new(1, 0, 0, 0) else UDim2.new(0.5, -size300, 0, 0),
			Position = if var7 then UDim2.new(0, 0, 1, 0) else UDim2.new(0.5, size300, 0, 0),
			AnchorPoint = if var7 then Vector2.new(0, 1) else Vector2.new(0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			[reactModule.Change.AbsoluteSize] = function(p2)
				-- upvalues: var4 (ref)
				var4(p2.AbsoluteSize)
			end
		}, p0.endSlot)
	})
end