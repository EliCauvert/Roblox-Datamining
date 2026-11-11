local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local BackgroundLayers = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).BackgroundLayersComponents.BackgroundLayers
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local HeroUnitHeaderModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.Widgets.HeroUnitHeader)

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), BackgroundLayers (copy), HeroUnitHeaderModule (copy)
	local _UDim = UDim.new(0, UseTokensFunction().Radius.Large)
	local BackgroundLayers1 = p1.backgroundLayers
	
	return ReactModule.createElement(View, { tag = "size-full-0 auto-y radius-medium clip" }, {
		Backgrounds = if BackgroundLayers1 == nil or #BackgroundLayers1 <= 0 then nil else ReactModule.createElement(BackgroundLayers, {
			ZIndex = 0,
			backgroundLayers = BackgroundLayers1,
			cornerRadius = _UDim,
			imageScaleType = Enum.ScaleType.Crop
		}),
		Content = ReactModule.createElement(View, {
			ZIndex = 2,
			tag = if p1.direction == "col" then "col size-full-0 auto-y" else "row items-stretch size-full-0 auto-y"
		}, {
			HeaderSection = ReactModule.createElement(View, {
				LayoutOrder = 1,
				Size = p1.header.size,
				tag = p1.header.tag
			}, {
				HeaderPadding = ReactModule.createElement(View, { tag = p1.header.paddingTag }, {
					Header = ReactModule.createElement(HeroUnitHeaderModule, p1.header.props)
				})
			}),
			ItemsClipFrame = ReactModule.createElement(View, {
				LayoutOrder = 2,
				Size = p1.itemsClipSize,
				tag = p1.itemsClipTag
			}, {
				ItemsContent = ReactModule.createElement(View, {
					ZIndex = 1,
					Size = p1.itemsContentSize,
					AutomaticSize = p1.itemsContentAutomaticSize,
					tag = p1.itemsContentTag
				}, p1.children)
			})
		})
	})
end