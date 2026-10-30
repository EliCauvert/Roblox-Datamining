local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local Parent = SduiSharedContent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Divider = FoundationModule.Divider
local Orientation = FoundationModule.Enums.Orientation
local _ = require(Parent.SduiCompat)
local _ = require(Parent.SduiCoreSystem)
local UseScrollAwayHeaderPositionFunction = require(Parent.SduiSharedUtilities).useScrollAwayHeaderPosition
local BuildSduiFeedChildrenModule = require(SduiSharedContent.Components.buildSduiFeedChildren)

local function buildWrappedItems(p1)
	-- upvalues: BuildSduiFeedChildrenModule (copy)
	return BuildSduiFeedChildrenModule({
		componentType = "StickyHeader",
		negateImpressionIndex = true,
		configs = p1.stickyItems,
		sduiContext = p1.sduiContext,
		debugName = p1.debugName or "StickyHeader",
		extraLocalProps = p1.extraLocalProps,
		impressionsTag = p1.impressionsTag,
		selectionBehaviorLeft = p1.selectionBehaviorLeft,
		selectionBehaviorRight = p1.selectionBehaviorRight
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: buildWrappedItems (copy), ReactModule (copy), UseScrollAwayHeaderPositionFunction (copy), View (copy), Divider (copy), Orientation (copy)
	local WrappedItems = buildWrappedItems(p1)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.new(1, 0, 0, 0))
	local ScrollAway = p1.sduiContext.scrollAway
	local ScrollAwayHeight = if ScrollAway then ScrollAway.scrollAwayHeight else nil
	local UseScrollAwayHeaderPositionResult = UseScrollAwayHeaderPositionFunction({
		enabled = ScrollAway ~= nil,
		scrollAwayHeight = ScrollAwayHeight,
		headerHeightBinding = if ScrollAway then ScrollAway.headerHeightBinding else nil
	})
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(UDim2.new(1, 0, 0, Frame.AbsoluteSize.Y))
	end, {})
	local Largest: number = if ScrollAwayHeight then math.max(0, ScrollAwayHeight) else 0
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseBindingResult (copy), Largest (copy)
		return UseBindingResult:map(function(p2): UDim2
			-- upvalues: Largest (upval)
			return UDim2.new(1, 0, 0, p2.Y.Offset + Largest)
		end)
	end, { UseBindingResult, Largest })
	
	if next(WrappedItems) == nil then
		return nil
	else
		local BackgroundStyle = p1.backgroundStyle
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Size = UseBindingResult,
			LayoutOrder = p1.layoutOrder or 1,
			ZIndex = p1.zIndex or 1
		}, {
			Translation = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClipsDescendants = false,
				Size = UseBindingResult,
				Position = UseScrollAwayHeaderPositionResult
			}, {
				Background = ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 0,
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.new(0, 0, 1, 0),
					Size = UseMemoResult,
					BackgroundColor3 = if BackgroundStyle then BackgroundStyle.Color3 else nil,
					BackgroundTransparency = if BackgroundStyle and BackgroundStyle.Transparency ~= nil then BackgroundStyle.Transparency else 0
				}),
				Content = ReactModule.createElement(View, {
					tag = p1.contentTag,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					onAbsoluteSizeChanged = UseResult,
					layout = {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder
					}
				}, {
					TopSpacer = if p1.paddingTop and p1.paddingTop > 0 then ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, p1.paddingTop)
					}) else nil,
					StickyContent = ReactModule.createElement(View, {
						tag = "size-full-0 auto-y",
						LayoutOrder = 2,
						layout = {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, p1.gapBetweenItems)
						}
					}, WrappedItems),
					BottomSpacer = if p1.paddingBottom and p1.paddingBottom > 0 then ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, p1.paddingBottom)
					}) else nil,
					StickyDivider = ReactModule.createElement(Divider, { LayoutOrder = 4, orientation = Orientation.Horizontal })
				})
			})
		})
	end
end)