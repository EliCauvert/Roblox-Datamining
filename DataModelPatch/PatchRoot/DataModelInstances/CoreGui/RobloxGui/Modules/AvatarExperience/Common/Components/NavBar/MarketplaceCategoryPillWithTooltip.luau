local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseCategoryButtonTooltipModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.NavBar.useCategoryButtonTooltip)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local CategoryPill = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.CategoryPill
local AXTooltip = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.AXTooltip
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXCategoryPillPositionAnimation = AvatarExperienceFlagsModule.FFlagAXCategoryPillPositionAnimation
local FFlagAXRemoveCatalogCategoryNavKey = AvatarExperienceFlagsModule.FFlagAXRemoveCatalogCategoryNavKey
local FFlagAXCatalogCategoryTooltip = AvatarExperienceFlagsModule.FFlagAXCatalogCategoryTooltip
local FFlagAXMigrateCategoryTooltip = AvatarExperienceFlagsModule.FFlagAXMigrateCategoryTooltip
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI

return function(p1)
	-- upvalues: FFlagAXMigrateCategoryTooltip (copy), UseCategoryButtonTooltipModule (copy), FFlagAXRemoveCatalogCategoryNavKey (copy), FFlagAXCatalogCategoryTooltip (copy), ReactModule (copy), FFlagAXCategoryPillPositionAnimation (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), CategoryPill (copy), FFlagAXCatalogCategoriesSDUI (copy), AXTooltip (copy), FoundationModule (copy)
	local v1 = nil
	local Callback = nil
	local TooltipTitle = nil
	
	if not FFlagAXMigrateCategoryTooltip then
		v1, Callback, TooltipTitle = UseCategoryButtonTooltipModule(if FFlagAXRemoveCatalogCategoryNavKey then p1.id else p1.navigationKey, p1.avatarScreenOfOrigin, if FFlagAXCatalogCategoryTooltip then p1.categoryTooltipKey else nil)
	end
	local Ref = nil
	local ShowTooltip = nil
	
	if FFlagAXMigrateCategoryTooltip then
		Ref = ReactModule.createRef()
		ShowTooltip = p1.categoryTooltipKey ~= nil and (p1.categoryTooltipLocalizationKey ~= nil and (not FFlagAXCategoryPillPositionAnimation or p1.isSelectable))
	end
	local UseTokensResult = UseTokensFunction()
	local FrameRef = p1.frameRef
	local UseLocalizationResult = UseLocalizationFunction({ tooltipTitle = TooltipTitle })
	local UseResult = if FFlagAXCategoryPillPositionAnimation then ReactModule.useCallback(function()
		-- upvalues: p1 (copy), FFlagAXMigrateCategoryTooltip (upval), Ref (ref), Callback (ref)
		p1.onActivated()
		
		if not FFlagAXMigrateCategoryTooltip then
			Callback()
		elseif Ref.current then
			Ref.current()
			
			return
		end
	end, { p1.onActivated, Callback }) else nil
	local UseRefResult = ReactModule.useRef(nil)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(0, 0, 0, UseTokensResult.Size.Size_800),
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		ref = FrameRef,
		LayoutOrder = p1.layoutOrder
	}, {
		Pill = ReactModule.createElement(CategoryPill, {
			id = p1.id,
			title = p1.title,
			localizedTitle = if FFlagAXCatalogCategoriesSDUI then p1.localizedTitle else nil,
			isChecked = p1.isChecked,
			onActivated = if FFlagAXCategoryPillPositionAnimation then UseResult else function()
				-- upvalues: p1 (copy), FFlagAXMigrateCategoryTooltip (upval), Ref (ref), Callback (ref)
				p1.onActivated()
				
				if not FFlagAXMigrateCategoryTooltip then
					Callback()
				elseif Ref.current then
					Ref.current()
					
					return
				end
			end,
			pillIndex = p1.pillIndex,
			isSubcategory = p1.isSubcategory,
			categoryButtonRefs = p1.categoryButtonRefs,
			navButtonRefs = p1.navButtonRefs,
			categories = p1.categories,
			isSelectable = if FFlagAXCategoryPillPositionAnimation then p1.isSelectable else nil,
			pillRef = UseRefResult
		}),
		AXTooltip = FFlagAXMigrateCategoryTooltip and ReactModule.createElement(AXTooltip, {
			popoverSide = "Top",
			tooltipLocalizationKey = p1.categoryTooltipLocalizationKey,
			tooltipStorageKey = p1.categoryTooltipKey or "",
			dismissTooltipRef = Ref,
			showTooltip = ShowTooltip,
			localizedText = if FFlagAXCatalogCategoriesSDUI then p1.categoryLocalizedTooltipBody else nil
		}),
		ActionButtonPopover = not FFlagAXMigrateCategoryTooltip and ReactModule.createElement(FoundationModule.Popover.Root, { isOpen = v1 and p1.isSelectable }, {
			Anchor = ReactModule.createElement(FoundationModule.Popover.Anchor, { anchorRef = UseRefResult }),
			Content = ReactModule.createElement(FoundationModule.Popover.Content, {
				align = FoundationModule.Enums.PopoverAlign.Center,
				side = FoundationModule.Enums.PopoverSide.Top,
				radius = FoundationModule.Enums.Radius.Medium,
				backgroundStyle = UseTokensResult.Color.System.Contrast
			}, {
				ReactModule.createElement(FoundationModule.View, {
					tag = "col gap-xsmall padding-y-small padding-x-medium auto-xy"
				}, {
					CategoryButtonTooltipTitle = ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy text-title-medium content-inverse-emphasis",
						Text = UseLocalizationResult.tooltipTitle
					}, {
						TooltipOverlayButton = ReactModule.createElement("TextButton", {
							Transparency = 1,
							[ReactModule.Event.Activated] = p1.tooltipActivated,
							Size = UDim2.fromScale(1, 1)
						})
					})
				})
			})
		})
	})
end