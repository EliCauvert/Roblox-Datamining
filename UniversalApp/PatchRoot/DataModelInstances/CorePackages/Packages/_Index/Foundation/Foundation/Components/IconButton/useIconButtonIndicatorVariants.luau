local Foundation = script:FindFirstAncestor("Foundation")
local DashModule = require(Foundation.Parent.Dash)
local IconButtonIndicatorTypeModule = require(Foundation.Enums.IconButtonIndicatorType)
local InputSizeModule = require(Foundation.Enums.InputSize)
local StatusIndicatorSizeModule = require(Foundation.Enums.StatusIndicatorSize)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local _ = require(Foundation.Providers.Style.Tokens)

local function v7(p1)
	-- upvalues: InputSizeModule (copy), IconButtonIndicatorTypeModule (copy), StatusIndicatorSizeModule (copy)
	local function _(p2)
		-- upvalues: p1 (copy)
		return { offset = p2 * p1.Config.UI.Scale }
	end
	
	local function buildOffsets(p2, p3, p4, p5)
		-- upvalues: InputSizeModule (upval), p1 (copy)
		return {
			[InputSizeModule.XSmall] = { offset = p2 * p1.Config.UI.Scale },
			[InputSizeModule.Small] = { offset = p3 * p1.Config.UI.Scale },
			[InputSizeModule.Medium] = { offset = p4 * p1.Config.UI.Scale },
			[InputSizeModule.Large] = { offset = p5 * p1.Config.UI.Scale }
		}
	end
	
	local _ = function(p2, p3)
		-- upvalues: InputSizeModule (upval), p1 (copy)
		return {
			[InputSizeModule.Medium] = { offset = p2 * p1.Config.UI.Scale },
			[InputSizeModule.Large] = { offset = p3 * p1.Config.UI.Scale }
		}
	end
	
	local _ = function(p2, p3)
		-- upvalues: IconButtonIndicatorTypeModule (upval)
		return {
			[IconButtonIndicatorTypeModule.Activity] = p2,
			[IconButtonIndicatorTypeModule.Status] = p3
		}
	end
	
	local config = { size = StatusIndicatorSizeModule.Small }
	local config1 = { size = StatusIndicatorSizeModule.XXSmall }
	
	return {
		types = {
			[IconButtonIndicatorTypeModule.Activity] = { verticalDirection = -1 },
			[IconButtonIndicatorTypeModule.Status] = { verticalDirection = 1 }
		},
		sizes = {
			[IconButtonIndicatorTypeModule.Activity] = {
				[InputSizeModule.XSmall] = { size = StatusIndicatorSizeModule.XSmall },
				[InputSizeModule.Small] = config,
				[InputSizeModule.Medium] = config,
				[InputSizeModule.Large] = config
			},
			[IconButtonIndicatorTypeModule.Status] = {
				[InputSizeModule.XSmall] = config1,
				[InputSizeModule.Small] = config1,
				[InputSizeModule.Medium] = config1,
				[InputSizeModule.Large] = { size = StatusIndicatorSizeModule.XSmall }
			}
		},
		utility = {
			offsets = {
				dots = {
					[IconButtonIndicatorTypeModule.Activity] = buildOffsets(7, 9, 10, 11),
					[IconButtonIndicatorTypeModule.Status] = buildOffsets(6, 8, 10, 11)
				},
				count = {
					[InputSizeModule.Medium] = { offset = 12 * p1.Config.UI.Scale },
					[InputSizeModule.Large] = { offset = 16 * p1.Config.UI.Scale }
				}
			},
			overMediaOffsets = {
				count = {
					[InputSizeModule.Medium] = { offset = 12 * p1.Config.UI.Scale },
					[InputSizeModule.Large] = { offset = 12 * p1.Config.UI.Scale }
				}
			}
		},
		rounded = {
			offsets = {
				dots = {
					[IconButtonIndicatorTypeModule.Activity] = buildOffsets(10, 13, 17, 21),
					[IconButtonIndicatorTypeModule.Status] = buildOffsets(10, 14, 18, 21)
				},
				count = {
					[InputSizeModule.Medium] = { offset = 16 * p1.Config.UI.Scale },
					[InputSizeModule.Large] = { offset = 20 * p1.Config.UI.Scale }
				}
			},
			overMediaOffsets = {
				dots = {
					[IconButtonIndicatorTypeModule.Activity] = buildOffsets(6, 8, 11, 14),
					[IconButtonIndicatorTypeModule.Status] = buildOffsets(7, 10, 13, 15)
				}
			}
		},
		circular = {
			offsets = {
				dots = {
					[IconButtonIndicatorTypeModule.Activity] = buildOffsets(9, 12, 15, 17),
					[IconButtonIndicatorTypeModule.Status] = buildOffsets(8, 11, 14, 16)
				},
				count = {
					[InputSizeModule.Medium] = { offset = 15 * p1.Config.UI.Scale },
					[InputSizeModule.Large] = { offset = 18 * p1.Config.UI.Scale }
				}
			},
			overMediaOffsets = {}
		}
	}
end

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: VariantsContextModule (copy), v7 (copy), DashModule (copy)
	local IconButtonIndicator = VariantsContextModule.useVariants("IconButtonIndicator", v7, p1)
	local Circular = if p3 then if p4 then IconButtonIndicator.circular else IconButtonIndicator.rounded else IconButtonIndicator.utility
	
	local function _(p8)
		-- upvalues: p6 (copy), p5 (copy), p2 (copy)
		local Count = if p6 then p8.count elseif p8.dots then p8.dots[p5] else nil
		
		return if Count then Count[p2] else {}
	end
	
	local JoinFunction = DashModule.join
	local Type = IconButtonIndicator.types[p5]
	local SizeEntry = IconButtonIndicator.sizes[p5][p2]
	local Offsets = Circular.offsets
	local Count = if p6 then Offsets.count elseif Offsets.dots then Offsets.dots[p5] else nil
	local CountEntry = if Count then Count[p2] else {}
	local CountEntry1 = nil
	
	if p7 then
		local OverMediaOffsets = Circular.overMediaOffsets
		local Count1 = if p6 then OverMediaOffsets.count elseif OverMediaOffsets.dots then OverMediaOffsets.dots[p5] else nil
		CountEntry1 = if Count1 then Count1[p2] else {}
	else
		CountEntry1 = {}
	end
	return JoinFunction(Type, SizeEntry, CountEntry, CountEntry1)
end