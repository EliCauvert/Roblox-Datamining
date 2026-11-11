local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local Skeleton = require(CorePackages.Packages.Foundation).Skeleton
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens

return function()
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), Skeleton (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local config = {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_800),
			PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_600)
		})
	}
	
	for i = 1, 6 do
		config[#config + 1] = ReactModule.createElement(Skeleton, {
			Size = UDim2.new(1, 0, 0, 30),
			Position = UDim2.new(0, 0, 0, (i - 1) * 45)
		})
	end
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, config)
end