local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local SlotNavigationModule = require(script.Parent.Parent.SlotNavigation)
local SlotSubNavigationModule = require(script.Parent.Parent.SlotSubNavigation)
local FilterButtonLayoutModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Components.Filters.FilterButtonLayout)
local FFlagAXSlotsDesktopRedesign = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDesktopRedesign
local FFlagAXMoveCatalogFilterToL1Navigation = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMoveCatalogFilterToL1Navigation
local FFlagAXSlotsDisableScrollAwayOnLandscape = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDisableScrollAwayOnLandscape

return (ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseTokensFunction (copy), ResponsiveModule (copy), FFlagAXSlotsDesktopRedesign (copy), FFlagAXSlotsDisableScrollAwayOnLandscape (copy), ReactModule (copy), FilterButtonLayoutModule (copy), FFlagAXMoveCatalogFilterToL1Navigation (copy), SlotNavigationModule (copy), SlotSubNavigationModule (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseOrientationResult = ResponsiveModule.useOrientation()
	local IsUseOrientationResultMatch = if FFlagAXSlotsDesktopRedesign then nil else UseOrientationResult == ResponsiveModule.BreakpointConfig.Enum.Portrait
	local UseMemoResult = if FFlagAXSlotsDisableScrollAwayOnLandscape then ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		return if p1.disableScrollAway then 1 else p1.slotSubNavigationFill
	end, { p1.disableScrollAway, p1.slotSubNavigationFill }) else nil
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), FFlagAXSlotsDisableScrollAwayOnLandscape (upval), UseMemoResult (copy)
		if p1.absoluteSizeChanged then
			p1.absoluteSizeChanged(Vector2.new(0, if FFlagAXSlotsDisableScrollAwayOnLandscape then p1.navigationFrameHeight - (1 - UseMemoResult) * p1.slotCardTotalHeight else p1.navigationFrameHeight - (1 - p1.slotSubNavigationFill) * p1.slotCardTotalHeight))
		end
	end, {
		p1.absoluteSizeChanged,
		p1.navigationFrameHeight,
		p1.slotSubNavigationFill,
		p1.slotCardTotalHeight,
		if FFlagAXSlotsDisableScrollAwayOnLandscape then UseMemoResult else nil
	})
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = UseTokensResult.Color.Surface.Surface_0.Color3,
		ref = Ref
	}, {
		Corner = ReactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
		}),
		NavigationFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			SlotNavigationFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				ZIndex = 3,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0),
				ref = Ref
			}, {
				Padding = if FFlagAXSlotsDesktopRedesign or IsUseOrientationResultMatch then nil else ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, UseTokensResult.Size.Size_200),
					PaddingBottom = UDim.new(0, UseTokensResult.Size.Size_500),
					PaddingLeft = UDim.new(0, UseTokensResult.Size.Size_100)
				}),
				SlotNavigation = if FFlagAXSlotsDesktopRedesign or IsUseOrientationResultMatch then ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					ReactModule.createElement(FilterButtonLayoutModule, {
						layoutOrder = 0,
						height = p1.navHeight,
						showFilterButton = not p1.hideFilter,
						showFilterRight = if FFlagAXSlotsDesktopRedesign or FFlagAXMoveCatalogFilterToL1Navigation then true else nil
					}, {
						ReactModule.createElement(SlotNavigationModule, p1.slotNavigationProps)
					})
				}) else ReactModule.createElement(SlotNavigationModule, p1.slotNavigationProps),
				SlotSubNavigation = if FFlagAXSlotsDesktopRedesign or IsUseOrientationResultMatch then if #p1.slotSubNavigationProps.slots > 0 then ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 0,
					ClipsDescendants = true,
					Size = UDim2.new(1, 0, 0, if FFlagAXSlotsDisableScrollAwayOnLandscape then p1.slotCardTotalHeight * UseMemoResult else p1.slotCardTotalHeight * p1.slotSubNavigationFill),
					Position = UDim2.new(0, 0, 0, p1.navigationFrameHeight - p1.slotCardTotalHeight)
				}, {
					Padding = ReactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, if FFlagAXSlotsDisableScrollAwayOnLandscape then p1.slotCardTotalHeight * UseMemoResult else p1.slotCardTotalHeight * p1.slotSubNavigationFill)
					}),
					BackgroundFrame = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, 0, 1, 0),
						Position = UDim2.new(0, 0, 0, -p1.slotCardTotalHeight)
					}, {
						SlotsFrame = ReactModule.createElement("Frame", {
							BackgroundTransparency = 0,
							AutomaticSize = Enum.AutomaticSize.Y,
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundColor3 = UseTokensResult.Color.Surface.Surface_100.Color3
						}, {
							Slots = ReactModule.createElement(SlotSubNavigationModule, p1.slotSubNavigationProps)
						})
					})
				}) else nil else ReactModule.createElement(FoundationModule.View, {
					tag = "size-full-0 auto-y",
					Position = UDim2.new(0, 0, 0, p1.navigationFrameHeight - p1.slotCardTotalHeight)
				}, {
					Padding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, UseTokensResult.Size.Size_200) }),
					ReactModule.createElement(SlotSubNavigationModule, p1.slotSubNavigationProps)
				})
			})
		})
	})
end))