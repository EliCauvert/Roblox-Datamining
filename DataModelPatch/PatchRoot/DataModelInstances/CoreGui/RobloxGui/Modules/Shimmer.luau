local CorePackages = game:GetService("CorePackages")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local TweenService = game:GetService("TweenService")
local Constants = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Constants
local _TweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false, 0)
local ShimmerModule = {}
ShimmerModule.__index = ShimmerModule
local config = {
	PrimaryButton = function(Parent)
		-- upvalues: CreateFunction (copy), Constants (copy)
		return CreateFunction("ImageLabel")({
			Name = "ShimmerFrame",
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 0.7,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, 0),
			BorderSizePixel = 0,
			Visible = false,
			Parent = Parent,
			ZIndex = 8,
			CreateFunction("ImageLabel")({
				Name = "Shimmer",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 8,
				Size = UDim2.new(1, 0, 2, 0),
				Position = UDim2.new(-1, 0, 0, 0),
				Image = Constants.SHIMMER_TEXTURE
			}),
			CreateFunction("ImageLabel")({
				Name = "ShimmerOverlay",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 9,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 9, 9),
				ImageColor3 = Constants.COLORS.FLINT,
				Image = Constants.OVERLAY_TEXTURE,
				Size = UDim2.new(1, 0, 1, 0)
			})
		})
	end
}

function ShimmerModule.new(p1, p2)
	-- upvalues: config (copy), ShimmerModule (copy), TweenService (copy), _TweenInfo (copy)
	if not p2 or not config[p2] then return end
	local self = setmetatable({}, ShimmerModule)
	self._shimmer = config[p2](p1)
	self._shimmerAnimation = TweenService:Create(self._shimmer.Shimmer, _TweenInfo, { Position = UDim2.new(1, 0, 0, 0) })
	
	return self
end

function ShimmerModule:play()
	self._shimmer.Visible = true
	self._shimmerAnimation:Play()
end

function ShimmerModule:stop()
	self._shimmerAnimation:Cancel()
	self._shimmer.Visible = false
end

return ShimmerModule