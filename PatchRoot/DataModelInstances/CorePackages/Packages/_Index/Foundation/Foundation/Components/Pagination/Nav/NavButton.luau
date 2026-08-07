-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:06 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local buttonVariantModule = require(foundation.Enums.ButtonVariant)
local iconButtonModule = require(foundation.Components.IconButton)
local inputSizeModule = require(foundation.Enums.InputSize)
local paginationDirectionModule = require(foundation.Enums.PaginationDirection)
local _ = require(foundation.Components.Types)
local paginationSizeModule = require(foundation.Enums.PaginationSize)
local icon = builderIconsModule.Icon
local t = {
	[paginationDirectionModule.First] = {
		testIdSuffix = "first",
		icon = icon.ChevronSmallLeftToLine
	},
	[paginationDirectionModule.Backward] = { testIdSuffix = "back", icon = icon.ChevronSmallLeft },
	[paginationDirectionModule.Forward] = { testIdSuffix = "forward", icon = icon.ChevronSmallRight },
	[paginationDirectionModule.Last] = {
		testIdSuffix = "last",
		icon = icon.ChevronSmallRightToLine
	}
}

local function _(p0) --[[ line: 43 | named "getInputSize" ]]
	-- upvalues: paginationSizeModule (ref), inputSizeModule (ref)
	return if p0 == paginationSizeModule.Small then inputSizeModule.XSmall else inputSizeModule.Small
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2) --[[ line: 60 | named "NavButton" ]]
	-- upvalues: t (ref), reactModule (ref), iconButtonModule (ref), paginationSizeModule (ref), inputSizeModule (ref), buttonVariantModule (ref)
	local direction = t[p1.direction]
	
	return reactModule.createElement(iconButtonModule, {
		isCircular = true,
		LayoutOrder = p1.layoutOrder,
		testId = `{p1.baseTestId}--{direction.testIdSuffix}`,
		ref = p2,
		icon = direction.icon,
		size = if p1.slotSize == paginationSizeModule.Small then inputSizeModule.XSmall else inputSizeModule.Small,
		variant = buttonVariantModule.Utility,
		isDisabled = p1.isDisabled,
		onActivated = reactModule.useCallback(function() --[[ line: 64 ]]
			-- upvalues: p1 (ref)
			p1.onDirectionActivated(p1.direction)
		end, { p1.onDirectionActivated, p1.direction }),
		Selectable = p1.Selectable,
		NextSelectionLeft = p1.NextSelectionLeft,
		NextSelectionRight = p1.NextSelectionRight,
		NextSelectionUp = p1.NextSelectionUp,
		NextSelectionDown = p1.NextSelectionDown
	})
end))