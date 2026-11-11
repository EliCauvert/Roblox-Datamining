local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local ReactModule = require(CorePackages.Packages.React)
local WithTooltipFunction = require(CorePackages.Packages.UIBlox).App.Dialog.TooltipV2.withTooltip
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), CoreGui (copy), WithTooltipFunction (copy), ReactModule (copy)
	return WithTooltipFunction({
		useLargeDropShadow = false,
		bodyText = UseLocalizationFunction({
			TooltipText = "Feature.GameFollows.TooltipNotificationsButtonDescription"
		}).TooltipText,
		textAlignment = Enum.TextXAlignment.Left
	}, {
		DisplayOrder = 1,
		active = p1.isActive,
		guiTarget = CoreGui,
		preferredOrientation = p1.preferredOrientation
	}, function(Callback)
		-- upvalues: p1 (copy), ReactModule (upval)
		local function v3(p2)
			-- upvalues: p1 (upval), Callback (copy)
			if p1.onPositionChanged then
				p1.onPositionChanged(p2)
			end
			Callback(p2)
		end
		
		return ReactModule.createElement("Frame", {
			Visible = false,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			[ReactModule.Change.AbsolutePosition] = v3,
			[ReactModule.Change.AbsoluteSize] = v3
		})
	end)
end