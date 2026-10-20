local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Roact = require(PurchasePrompt.Parent.PurchasePromptDeps).Roact
local LayoutValuesModule = require(PurchasePrompt.Services.LayoutValues)
local LayoutValuesContextModule = require(script.Parent.LayoutValuesContext)

return function(p1)
	-- upvalues: LayoutValuesModule (copy), Roact (copy), LayoutValuesContextModule (copy)
	return Roact.createElement(LayoutValuesContextModule.Provider, {
		value = LayoutValuesModule.new(p1.isTenFootInterface).layout
	}, Roact.oneChild(p1[Roact.Children]))
end