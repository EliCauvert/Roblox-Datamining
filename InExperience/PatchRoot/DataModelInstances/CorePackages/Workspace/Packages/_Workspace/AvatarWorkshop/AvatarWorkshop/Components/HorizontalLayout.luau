local Parent = script:FindFirstAncestor("AvatarWorkshop").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local DividerOrientation = FoundationModule.Enums.DividerOrientation
local FFlagAlignSideSheetWindowCloseRight = require(Parent.SharedFlags).FFlagAlignSideSheetWindowCloseRight

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), DividerOrientation (copy), FFlagAlignSideSheetWindowCloseRight (copy)
	return (ReactModule.createElement(FoundationModule.View, { tag = "size-full-full" }, {
		LeftPanel = ReactModule.createElement(FoundationModule.View, { tag = "col", Size = UDim2.fromScale(0.67, 1) }, {
			Header = ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-0 auto-y padding-bottom-small",
				LayoutOrder = 1
			}, { HeaderSlot = p1.headerSlot }),
			LeftItemContainer = ReactModule.createElement(FoundationModule.View, { tag = "fill size-full-0", LayoutOrder = 2 }, { LeftItem = p1.leftItemSlot })
		}),
		RightPanel = ReactModule.createElement(FoundationModule.View, {
			tag = "position-top-right anchor-top-right",
			Size = UDim2.fromScale(0.32999999999999996, 1)
		}, { RightItem = p1.rightItemSlot }),
		Divider = ReactModule.createElement(FoundationModule.Divider, {
			ZIndex = 2,
			Position = UDim2.fromScale(0.67, 0),
			orientation = DividerOrientation.Vertical
		}),
		CloseButtonContainer = if FFlagAlignSideSheetWindowCloseRight and p1.onClose then ReactModule.createElement(FoundationModule.View, {
			tag = "row align-y-center position-top-right anchor-top-right size-0-1200 auto-x padding-x-medium",
			ZIndex = 3
		}, {
			CloseButton = ReactModule.createElement(FoundationModule.Image, {
				tag = "size-600 radius-small",
				Image = "icons/navigation/close",
				testId = "avatar-workshop-close-button",
				onActivated = p1.onClose
			})
		}) else nil
	}))
end