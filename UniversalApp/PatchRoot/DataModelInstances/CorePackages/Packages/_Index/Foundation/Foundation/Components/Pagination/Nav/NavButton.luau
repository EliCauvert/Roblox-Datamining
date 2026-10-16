local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ButtonVariantModule = require(Foundation.Enums.ButtonVariant)
local IconButtonModule = require(Foundation.Components.IconButton)
local InputSizeModule = require(Foundation.Enums.InputSize)
local PaginationDirectionModule = require(Foundation.Enums.PaginationDirection)
local _ = require(Foundation.Components.Types)
local PaginationSizeModule = require(Foundation.Enums.PaginationSize)
local Icon = require(Parent.BuilderIcons).Icon
local config = {
	[PaginationDirectionModule.First] = {
		testIdSuffix = "first",
		icon = Icon.ChevronSmallLeftToLine
	},
	[PaginationDirectionModule.Backward] = { testIdSuffix = "back", icon = Icon.ChevronSmallLeft },
	[PaginationDirectionModule.Forward] = { testIdSuffix = "forward", icon = Icon.ChevronSmallRight },
	[PaginationDirectionModule.Last] = {
		testIdSuffix = "last",
		icon = Icon.ChevronSmallRightToLine
	}
}

local function _(Small) --[[ Line: 43 | Named "getInputSize" ]]
	-- upvalues: PaginationSizeModule (copy), InputSizeModule (copy)
	return if Small == PaginationSizeModule.Small then InputSizeModule.XSmall else InputSizeModule.Small
end

return ReactModule.memo(ReactModule.forwardRef(function(Frame, Ref) --[[ Line: 60 | Named "NavButton" ]]
	-- upvalues: config (copy), ReactModule (copy), IconButtonModule (copy), PaginationSizeModule (copy), InputSizeModule (copy), ButtonVariantModule (copy)
	local Entry = config[Frame.direction]
	
	return ReactModule.createElement(IconButtonModule, {
		isCircular = true,
		LayoutOrder = Frame.LayoutOrder,
		testId = `{Frame.baseTestId}--{Entry.testIdSuffix}`,
		ref = Ref,
		icon = Entry.icon,
		size = if Frame.slotSize == PaginationSizeModule.Small then InputSizeModule.XSmall else InputSizeModule.Small,
		variant = ButtonVariantModule.Utility,
		isDisabled = Frame.isDisabled,
		onActivated = ReactModule.useCallback(function() --[[ Line: 64 ]]
			-- upvalues: Frame (copy)
			Frame.onDirectionActivated(Frame.direction)
		end, { Frame.onDirectionActivated, Frame.direction }),
		Selectable = Frame.Selectable,
		NextSelectionLeft = Frame.NextSelectionLeft,
		NextSelectionRight = Frame.NextSelectionRight,
		NextSelectionUp = Frame.NextSelectionUp,
		NextSelectionDown = Frame.NextSelectionDown
	})
end))