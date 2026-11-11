local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Grid = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).GridComponents.Grid
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Photobooth.Components.Scenes.usePhotoboothScenesProps)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy), Grid (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col gap-small",
		backgroundTransparency = 1,
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = p1.position,
		onAbsoluteSizeChanged = p1.onContainerSizeChanged
	}, {
		Heading = ReactModule.createElement(FoundationModule.Text, {
			tag = "text-color-primary text-heading-medium text-align-x-left text-align-y-top auto-xy",
			LayoutOrder = 1,
			Text = UseLocalizationFunction({ Scenes = "Feature.Avatar.Label.Scenes" }).Scenes
		}),
		ScrollViewContainer = ReactModule.createElement(FoundationModule.View, { tag = "grow-1 size-full-0", LayoutOrder = 2 }, {
			ScenesScrollContainer = ReactModule.createElement("ScrollingFrame", {
				ScrollBarThickness = 0,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				VerticalScrollBarInset = Enum.ScrollBarInset.None
			}, {
				ScenesGrid = ReactModule.createElement(Grid, {
					Size = UDim2.new(1, 0, 1, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					items = ReactModule.useMemo(function()
						-- upvalues: p1 (copy)
						local List = {}
						
						for _, scene in p1.scenes do
							table.insert(List, scene)
						end
						table.sort(List, function(A, B): boolean
							return A.order < B.order
						end)
						
						return List
					end, { p1.scenes }),
					itemsPerRow = p1.itemsPerRow,
					renderItem = p1.renderSceneItem,
					getItemId = p1.getSceneId,
					gapVertical = p1.tokens.Gap.Medium,
					gapHorizontal = p1.tokens.Gap.Medium
				})
			})
		})
	})
end