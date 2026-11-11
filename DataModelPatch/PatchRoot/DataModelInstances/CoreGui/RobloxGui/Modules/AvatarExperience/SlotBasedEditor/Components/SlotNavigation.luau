local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseCallbackFunction = ReactModule.useCallback
local FitFrameHorizontal = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameHorizontal
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local NavHighlightModule = require(Modules.AvatarExperience.Common.Components.NavBar.NavHighlight)
local DEPRECATEDCategoryButtonModule = require(Modules.AvatarExperience.Common.Components.NavBar.DEPRECATED_CategoryButton)
local ScrollingArrowsAndGradientModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.ScrollingArrowsAndGradient)
local FFlagAXSlotsDesktopCrashFix = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDesktopCrashFix

return function(Frame)
	-- upvalues: FFlagAXSlotsDesktopCrashFix (copy), ReactModule (copy), UseCallbackFunction (copy), DEPRECATEDCategoryButtonModule (copy), FitFrameHorizontal (copy), NavHighlightModule (copy), ScrollingArrowsAndGradientModule (copy)
	local Categories = Frame.categories
	local SlotCategory = Frame.slotCategory
	
	if FFlagAXSlotsDesktopCrashFix then
		ReactModule.useEffect(function()
			-- upvalues: Categories (copy), SlotCategory (copy), Frame (copy)
			if Categories[SlotCategory].hide and Frame.onSlotCategorySelected then
				for i, category in Categories do
					if not category.hide then
						Frame.onSlotCategorySelected(i, category)
						break
					end
				end
			end
		end, { SlotCategory, Categories, Frame.onSlotCategorySelected })
	end
	return ReactModule.createElement(ScrollingArrowsAndGradientModule, {
		LayoutOrder = Frame.LayoutOrder,
		ZIndex = Frame.ZIndex,
		navHeight = Frame.navHeight,
		selectedItemKey = SlotCategory,
		enableSnapToSelectedItem = Frame.enableSnapToSelectedItem,
		renderScrollingListContent = UseCallbackFunction(function(p1)
			-- upvalues: Categories (copy), SlotCategory (copy), ReactModule (upval), DEPRECATEDCategoryButtonModule (upval), Frame (copy), FitFrameHorizontal (upval), NavHighlightModule (upval)
			local Elements = {}
			local GetScrollingFrameItemRefFunction = p1.getScrollingFrameItemRef
			
			for i, category in Categories do
				if not category.hide then
					Elements[`Category{i}`] = ReactModule.createElement(DEPRECATEDCategoryButtonModule, {
						categoryIndex = category.index,
						categoryTitle = category.nameTranslationKey,
						layoutOrder = category.index,
						isSelected = SlotCategory == i,
						frameRef = GetScrollingFrameItemRefFunction(i),
						onActivate = function()
							-- upvalues: Frame (upval), i (copy), category (copy)
							if Frame.onSlotCategorySelected then
								Frame.onSlotCategorySelected(i, category)
							end
						end,
						ref = GetScrollingFrameItemRefFunction(i)
					})
				end
			end
			return ReactModule.createElement(ReactModule.Fragment, {}, {
				SlotNavFrame = ReactModule.createElement(FitFrameHorizontal, {
					height = UDim.new(1, 0),
					FillDirection = Enum.FillDirection.Horizontal,
					BackgroundTransparency = 1,
					[ReactModule.Change.AbsoluteSize] = p1.onNavFrameSizeChanged
				}, Elements),
				Highlight = ReactModule.createElement(NavHighlightModule, {
					scrollingFrameRef = p1.getScrollingFrameRef(),
					selectedCategoryButtonInstance = p1.selectedItemInstance
				})
			})
		end, { Categories, SlotCategory, Frame.onSlotCategorySelected })
	})
end