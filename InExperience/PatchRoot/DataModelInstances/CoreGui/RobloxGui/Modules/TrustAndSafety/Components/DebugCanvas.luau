local corePackagesService = game:GetService("CorePackages")
local _ = require(corePackagesService.Workspace.Packages.AppCommonLib).Logging
local reactModule = require(corePackagesService.Packages.React)
local _ = require(corePackagesService.Packages.RoactRodux)
local _ = require(corePackagesService.Packages.t)
local _ = require(corePackagesService.Packages.UIBlox).App.Button.TextButton
local parent = script.Parent.Parent
local _ = require(parent.Actions.EndReportFlow)
local _ = require(parent.Resources.Constants)
local getFFlagReportAnythingDebugCanvasModule = require(parent.Flags.GetFFlagReportAnythingDebugCanvas)
local debugCanvas = reactModule.PureComponent:extend("DebugCanvas")

function debugCanvas.render(p0)
	-- upvalues: getFFlagReportAnythingDebugCanvasModule (ref), reactModule (ref)
	if not getFFlagReportAnythingDebugCanvasModule() or not p0.props.identifiedAvatars then
		return reactModule.createElement("Frame", { Size = UDim2.fromScale(0, 0) })
	end
	local t = {}
	
	for i, v in pairs(p0.props.identifiedAvatars) do
		local boundingBox = v.boundingBox
		t[#t + 1] = reactModule.createElement("Frame", {
			BackgroundTransparency = 0.8,
			Position = UDim2.fromScale(boundingBox.min.X, boundingBox.min.Y),
			Size = UDim2.fromScale(boundingBox.max.X - boundingBox.min.X, boundingBox.max.Y - boundingBox.min.Y),
			BackgroundColor3 = Color3.fromRGB(20, 0, 255 * v.hitRate)
		})
		local convexHullCount = #v.convexHull
		
		for i_2, v_1 in v.convexHull do
			t[#t + 1] = reactModule.createElement("Frame", {
				BackgroundTransparency = 0.2,
				Position = UDim2.new(v_1.X, -2, v_1.Y, -2),
				Size = UDim2.fromOffset(4, 4),
				BackgroundColor3 = Color3.fromHSV(i_2 / convexHullCount, 1, 0.65)
			})
		end
	end
	for i, v_1 in pairs(p0.props.identifiedAds) do
		local boundingBox = v_1.boundingBox
		t[#t + 1] = reactModule.createElement("Frame", {
			BackgroundTransparency = 0.8,
			Position = UDim2.fromScale(boundingBox.min.X, boundingBox.min.Y),
			Size = UDim2.fromScale(boundingBox.max.X - boundingBox.min.X, boundingBox.max.Y - boundingBox.min.Y),
			BackgroundColor3 = Color3.fromRGB(20, 0, 255)
		})
		
		for i_2, v_2 in v_1.visibleRegions do
			local convexHullCount = #v_2.convexHull
			
			for i_3, v_3 in v_2.convexHull do
				t[#t + 1] = reactModule.createElement("Frame", {
					BackgroundTransparency = 0.2,
					Position = UDim2.new(v_3.X, -2, v_3.Y, -2),
					Size = UDim2.fromOffset(4, 4),
					BackgroundColor3 = Color3.fromHSV(i_3 / convexHullCount, 1, 0.65)
				})
			end
		end
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 0.9,
		Size = UDim2.fromScale(1, 1),
		ZIndex = p0.props.ZIndex
	}, t)
end

return debugCanvas