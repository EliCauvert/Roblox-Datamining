local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local DividerModule = require(Foundation.Components.Divider)
local SectionHeaderFadeModule = require(script.Parent.SectionHeaderFade)
local TextModule = require(Foundation.Components.Text)
local ViewModule = require(Foundation.Components.View)
local UseSectionHeaderLayoutModule = require(script.Parent.useSectionHeaderLayout)

local function _(p1, p2, p3)
	if p3 and p2 ~= nil then
		return true, nil
	else
		return p1, p2
	end
end

local function SectionTitle(p1)
	-- upvalues: ReactModule (copy), ViewModule (copy), TextModule (copy)
	local HasAnimatedTitleRowSize = p1.animatedTitleRowSize ~= nil
	
	return ReactModule.createElement(ViewModule, {
		LayoutOrder = 2,
		Size = if HasAnimatedTitleRowSize then p1.animatedTitleRowSize elseif p1.isHeld and p1.heldWidth ~= nil then UDim2.fromOffset(p1.heldWidth, 0) else UDim2.fromScale(1, 0),
		sizeConstraint = if p1.titleMinHeight == nil or HasAnimatedTitleRowSize then nil else { MinSize = Vector2.new(0, p1.titleMinHeight) },
		tag = if HasAnimatedTitleRowSize then "row align-y-center padding-left-medium padding-right-small clip" else "row align-y-center auto-y padding-left-medium padding-right-small",
		testId = `{p1.testId}--section-title-row`
	}, {
		Text = ReactModule.createElement(TextModule, {
			tag = "size-full-0 auto-y text-caption-medium text-align-x-left text-truncate-end content-muted",
			testId = `{p1.testId}--section-title`,
			Text = p1.sectionTitle,
			textStyle = if p1.textTransparency == nil then nil else p1.textTransparency:map(function(Transparency)
				return { Transparency = Transparency }
			end)
		})
	})
end

local function PaddedDivider(p1)
	-- upvalues: ReactModule (copy), SectionHeaderFadeModule (copy), ViewModule (copy)
	local Element = if p1.transparency == nil then ReactModule.createElement(ViewModule, {
		tag = "size-full-0 auto-y padding-y-small",
		LayoutOrder = if p1.dividerRevealSize == nil then 1 else nil,
		testId = `{p1.testId}--divider-padding`
	}, { Line = p1.divider }) else ReactModule.createElement(SectionHeaderFadeModule, {
		tag = "size-full-0 auto-y padding-y-small",
		contentSize = Enum.AutomaticSize.Y,
		isFading = p1.isFading,
		LayoutOrder = if p1.dividerRevealSize == nil then 1 else nil,
		testId = `{p1.testId}--divider-padding`,
		transparency = p1.transparency
	}, p1.divider)
	
	return if p1.dividerRevealSize == nil then Element else ReactModule.createElement(ViewModule, {
		LayoutOrder = 1,
		tag = "clip",
		Size = p1.dividerRevealSize,
		testId = `{p1.testId}--divider-clip`
	}, { Padded = Element })
end

return function(p1)
	-- upvalues: UseSectionHeaderLayoutModule (copy), ReactModule (copy), DividerModule (copy), PaddedDivider (copy), SectionHeaderFadeModule (copy), ViewModule (copy), SectionTitle (copy)
	local IsHeld = p1.isHeld
	local HeldWidth = p1.heldWidth
	local HasSectionPadding = p1.hasSectionPadding
	local UseSectionHeaderLayoutModuleResult, UseSectionHeaderLayoutModuleResult2, UseSectionHeaderLayoutModuleResult3, UseSectionHeaderLayoutModuleResult4 = UseSectionHeaderLayoutModule(HasSectionPadding, p1.collapseProgress, p1.railWidth, IsHeld, HeldWidth)
	local HasDivider = p1.hasDivider
	local SectionTitle1 = p1.sectionTitle
	local SectionTitle2 = nil
	local Flag = nil
	
	if p1.isCompact and SectionTitle1 ~= nil then
		Flag = true
		SectionTitle2 = nil
	else
		Flag = HasDivider
		SectionTitle2 = SectionTitle1
	end
	local NoHasDivider: boolean = p1.sectionTitle ~= nil and not p1.hasDivider
	local Flag1: boolean = Flag or NoHasDivider and (p1.isTargetCollapsed == true or p1.isResizing == true)
	
	if not Flag1 and SectionTitle2 == nil then
		return nil
	end
	local Element = if Flag1 then ReactModule.createElement(DividerModule, {
		LayoutOrder = 1,
		testId = if p1.hasDivider then `{p1.testId}--divider` else `{p6.testId}--section-divider`
	}) else nil
	
	if Element == nil or not HasSectionPadding then
		if Element ~= nil and NoHasDivider and UseSectionHeaderLayoutModuleResult ~= nil then
			Element = ReactModule.createElement(SectionHeaderFadeModule, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 1,
				isFading = p1.isResizing == true,
				transparency = UseSectionHeaderLayoutModuleResult,
				contentSize = Enum.AutomaticSize.Y
			}, Element)
		end
	else
		Element = ReactModule.createElement(PaddedDivider, {
			divider = Element,
			dividerRevealSize = if NoHasDivider then UseSectionHeaderLayoutModuleResult3 else nil,
			isFading = p1.isResizing == true,
			testId = p1.testId,
			transparency = if NoHasDivider then UseSectionHeaderLayoutModuleResult else nil
		})
	end
	return ReactModule.createElement(ViewModule, {
		tag = "col size-full-0 auto-y padding-bottom-xxsmall clip",
		LayoutOrder = 1,
		testId = if p1.sectionTitle == nil then nil else `{p1.testId}--section`
	}, {
		Divider = Element,
		Title = if SectionTitle2 == nil then nil else ReactModule.createElement(SectionTitle, {
			animatedTitleRowSize = UseSectionHeaderLayoutModuleResult2,
			heldWidth = HeldWidth,
			isHeld = IsHeld,
			sectionTitle = SectionTitle2,
			testId = p1.testId,
			textTransparency = p1.collapseProgress,
			titleMinHeight = UseSectionHeaderLayoutModuleResult4
		})
	})
end