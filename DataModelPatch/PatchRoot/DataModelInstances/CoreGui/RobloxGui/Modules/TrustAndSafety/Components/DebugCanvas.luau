local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Packages.RoactRodux)
local _ = require(CorePackages.Packages.t)
local _ = require(CorePackages.Packages.UIBlox).App.Button.TextButton
local Parent = script.Parent.Parent
local _ = require(Parent.Actions.EndReportFlow)
local _ = require(Parent.Resources.Constants)
local GetFFlagReportAnythingDebugCanvasModule = require(Parent.Flags.GetFFlagReportAnythingDebugCanvas)
local DebugCanvas = ReactModule.PureComponent:extend("DebugCanvas")

function DebugCanvas.render(p1)
	-- upvalues: GetFFlagReportAnythingDebugCanvasModule (copy), ReactModule (copy)
	if not GetFFlagReportAnythingDebugCanvasModule() or not p1.props.identifiedAvatars then
		return ReactModule.createElement("Frame", { Size = UDim2.fromScale(0, 0) })
	end
	local Frames = {}
	
	for _, identifiedAvatar in pairs(p1.props.identifiedAvatars) do
		local BoundingBox = identifiedAvatar.boundingBox
		Frames[#Frames + 1] = ReactModule.createElement("Frame", {
			BackgroundTransparency = 0.8,
			Position = UDim2.fromScale(BoundingBox.min.X, BoundingBox.min.Y),
			Size = UDim2.fromScale(BoundingBox.max.X - BoundingBox.min.X, BoundingBox.max.Y - BoundingBox.min.Y),
			BackgroundColor3 = Color3.fromRGB(20, 0, 255 * identifiedAvatar.hitRate)
		})
		local CountConvexHull = #identifiedAvatar.convexHull
		
		for i, value in identifiedAvatar.convexHull do
			Frames[#Frames + 1] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 0.2,
				Position = UDim2.new(value.X, -2, value.Y, -2),
				Size = UDim2.fromOffset(4, 4),
				BackgroundColor3 = Color3.fromHSV(i / CountConvexHull, 1, 0.65)
			})
		end
	end
	for _, identifiedAd in pairs(p1.props.identifiedAds) do
		local BoundingBox = identifiedAd.boundingBox
		Frames[#Frames + 1] = ReactModule.createElement("Frame", {
			BackgroundTransparency = 0.8,
			Position = UDim2.fromScale(BoundingBox.min.X, BoundingBox.min.Y),
			Size = UDim2.fromScale(BoundingBox.max.X - BoundingBox.min.X, BoundingBox.max.Y - BoundingBox.min.Y),
			BackgroundColor3 = Color3.fromRGB(20, 0, 255)
		})
		
		for _, visibleRegion in identifiedAd.visibleRegions do
			local CountConvexHull = #visibleRegion.convexHull
			
			for i1, value1 in visibleRegion.convexHull do
				Frames[#Frames + 1] = ReactModule.createElement("Frame", {
					BackgroundTransparency = 0.2,
					Position = UDim2.new(value1.X, -2, value1.Y, -2),
					Size = UDim2.fromOffset(4, 4),
					BackgroundColor3 = Color3.fromHSV(i1 / CountConvexHull, 1, 0.65)
				})
			end
		end
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 0.9,
		Size = UDim2.fromScale(1, 1),
		ZIndex = p1.props.ZIndex
	}, Frames)
end

return DebugCanvas