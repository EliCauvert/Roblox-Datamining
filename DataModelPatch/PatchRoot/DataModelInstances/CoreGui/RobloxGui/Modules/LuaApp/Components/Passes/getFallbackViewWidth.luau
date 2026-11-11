local GetSafeAreaSizeFunction = require(game:GetService("CorePackages").Workspace.Packages.InputUi).getSafeAreaSize

return function(p1, p2): number
	-- upvalues: GetSafeAreaSizeFunction (copy)
	return (math.min(GetSafeAreaSizeFunction(p1, p2).X.Offset, 640))
end