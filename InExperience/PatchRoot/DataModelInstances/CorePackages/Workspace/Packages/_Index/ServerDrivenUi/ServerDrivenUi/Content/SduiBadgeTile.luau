local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local cryoModule = require(parent.Cryo)
local sduiTileModule = require(serverDrivenUi.Content.SduiTile)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), cryoModule (ref), reactModule (ref), sduiTileModule (ref)
	return reactModule.createElement(sduiTileModule, cryoModule.Dictionary.join(p1, {
		testId = "--sdui-badge-tile",
		imagePadding = p1.imagePadding or useTokens().Padding.Medium,
		imageCornerRadius = p1.imageCornerRadius or 1000,
		isContained = p1.isContained ~= nil or p1.isContained
	}))
end)