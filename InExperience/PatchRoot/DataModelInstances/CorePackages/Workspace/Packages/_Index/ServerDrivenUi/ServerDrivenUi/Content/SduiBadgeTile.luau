local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local CryoModule = require(Parent.Cryo)
local SduiTileModule = require(ServerDrivenUi.Content.SduiTile)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), CryoModule (copy), ReactModule (copy), SduiTileModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(SduiTileModule, (CryoModule.Dictionary.join(p1, {
		testId = "--sdui-badge-tile",
		imagePadding = p1.imagePadding or UseTokensResult.Padding.Medium,
		imageCornerRadius = p1.imageCornerRadius or 1000,
		isContained = p1.isContained == nil or p1.isContained
	})))
end)