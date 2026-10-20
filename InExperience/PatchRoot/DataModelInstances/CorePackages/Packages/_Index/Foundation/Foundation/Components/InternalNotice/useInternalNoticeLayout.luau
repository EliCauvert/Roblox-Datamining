local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)
local UseAbsoluteSizeModule = require(Foundation.Utility.useAbsoluteSize)
local Width = require(Foundation.Utility.Responsive.BreakpointConfig).widths[require(Foundation.Enums.Breakpoint).XSmall]

return function(p1)
	-- upvalues: UseAbsoluteSizeModule (copy), ReactModule (copy), Width (copy)
	local UseAbsoluteSizeModuleResult, UseAbsoluteSizeModuleResult2 = UseAbsoluteSizeModule(p1)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize.X)
	end, {})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local ScaledX = UseAbsoluteSizeModuleResult.X * 0.30000000000000004
	local IsXBelow: boolean = UseAbsoluteSizeModuleResult.X > 0 and UseAbsoluteSizeModuleResult.X <= Width or ScaledX > 0 and ScaledX < UseStateResult
	
	return {
		isStacked = IsXBelow,
		onNoticeAbsoluteSizeChanged = UseAbsoluteSizeModuleResult2,
		onStackedColumnAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(Frame.AbsoluteSize.X)
		end, {}),
		measureInlineLink = if IsXBelow then nil else UseResult,
		stackedLinkConstraint = if IsXBelow and UseStateResult1 > 0 then { MaxSize = Vector2.new(UseStateResult1, 1e999) } else nil
	}
end