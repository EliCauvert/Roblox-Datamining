local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local tweenService = game:GetService("TweenService")
local constants = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Constants
local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false, 0)
local t = {}
t.__index = t
local t_1 = {
	PrimaryButton = function(p0) --[[ line: 16 ]]
		-- upvalues: create (ref), constants (ref)
		return create("ImageLabel")({
			Name = "ShimmerFrame",
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 0.7,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, 0),
			BorderSizePixel = 0,
			Visible = false,
			Parent = p0,
			ZIndex = 8,
			create("ImageLabel")({
				Name = "Shimmer",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 8,
				Size = UDim2.new(1, 0, 2, 0),
				Position = UDim2.new(-1, 0, 0, 0),
				Image = constants.SHIMMER_TEXTURE
			}),
			create("ImageLabel")({
				Name = "ShimmerOverlay",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 9,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 9, 9),
				ImageColor3 = constants.COLORS.FLINT,
				Image = constants.OVERLAY_TEXTURE,
				Size = UDim2.new(1, 0, 1, 0)
			})
		})
	end
}

function t.new(p1, p2) --[[ line: 51 ]]
	-- upvalues: t_1 (ref), t (ref), tweenService (ref), tweenInfo (ref)
	if p2 and t_1[p2] then
		local tbl = setmetatable({}, t)
		tbl._shimmer = t_1[p2](p1)
		tbl._shimmerAnimation = tweenService:Create(tbl._shimmer.Shimmer, tweenInfo, { Position = UDim2.new(1, 0, 0, 0) })
		
		return tbl
	end
end

function t:play() --[[ line: 61 ]]
	self._shimmer.Visible = true
	self._shimmerAnimation:Play()
end

function t:stop() --[[ line: 66 ]]
	self._shimmerAnimation:Cancel()
	self._shimmer.Visible = false
end

return t