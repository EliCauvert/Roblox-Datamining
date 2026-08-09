local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local useDesignTokens = require(parent.Style).useDesignTokens
local useScreenSize = require(parent.EconomyCommonCoreScriptHooks).useScreenSize
local constantsModule = require(bulkPurchaseApp.constants)

return function(p0) --[[ line: 18 | named "FullPagePromptTwoPanelLayout" ]]
	-- upvalues: reactModule (ref), useScreenSize (ref), useDesignTokens (ref), fFlagRenameDeprecatedUIBloxTokens (ref), constantsModule (ref)
	local var3, var4 = reactModule.useBinding(Vector2.new(0, 0))
	local var5 = useScreenSize()
	local var6 = useDesignTokens()
	local var7 = if fFlagRenameDeprecatedUIBloxTokens then var6.Size.Size_300 else var6.Global.Space_150
	local var8 = var5.X < constantsModule.MOBILE_BREAKPOINT and var5.X < var5.Y
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p0.size,
		LayoutOrder = p0.LayoutOrder
	}, {
		StartSlot = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = var3:map(function(p1) --[[ line: 34 ]]
				-- upvalues: var8 (ref), fFlagRenameDeprecatedUIBloxTokens (copy), var6 (ref), var7 (ref)
				return if var8 then UDim2.new(1, 0, 1, -(p1.Y + (if fFlagRenameDeprecatedUIBloxTokens then var6.Size.Size_600 else var6.Global.Space_300))) else UDim2.new(0.5, -var7, 1, 0)
			end)
		}, p0.startSlot),
		EndSlot = reactModule.createElement("Frame", {
			Size = if var8 then UDim2.new(1, 0, 0, 0) else UDim2.new(0.5, -var7, 0, 0),
			Position = if var8 then UDim2.new(0, 0, 1, 0) else UDim2.new(0.5, var7, 0, 0),
			AnchorPoint = if var8 then Vector2.new(0, 1) else Vector2.new(0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			[reactModule.Change.AbsoluteSize] = function(p2) --[[ line: 61 ]]
				-- upvalues: var4 (ref)
				var4(p2.AbsoluteSize)
			end
		}, p0.endSlot)
	})
end