local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useBreakpoint = require(parent.Foundation).Hooks.useBreakpoint
local useResponsive = require(parent.Foundation).Hooks.useResponsive
local responsiveProvider = require(parent.Foundation).ResponsiveProvider
local cryoModule = require(parent.Cryo)
local luaAppInfoTableResponsiveProviderOverride = game:DefineFastFlag("LuaAppInfoTableResponsiveProviderOverride", false)
local luaAppInfoTableResponsiveProviderOverride_1 = game:DefineFastFlag("LuaAppInfoTableWorkaroundGridJank2", false) and luaAppInfoTableResponsiveProviderOverride
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local breakpoint = foundationModule.Enums.Breakpoint

local function buildColumnMajorChildren(p0, p1, p2) --[[ line: 27 ]]
	-- upvalues: reactModule (ref), foundationModule (ref)
	local p0Count = #p0
	local ceiled = math.ceil(p0Count / p1)
	local t = {}
	local var9 = 0
	
	for i_1 = 1, ceiled do
		for i = 1, p1 do
			var9 += 1
			local var10 = (i - 1) * ceiled + i_1
			t[`Cell_{var9}`] = reactModule.createElement(foundationModule.Grid.Cell, {
				tag = "size-full-0 auto-y",
				size = p2,
				LayoutOrder = var9
			}, if var10 <= p0Count then p0[var10] else reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y", BackgroundTransparency = 1 }))
		end
	end
	return t
end

return reactModule.memo(function(p3) --[[ line: 75 | named "InfoTable" ]]
	-- upvalues: luaAppInfoTableResponsiveProviderOverride_1 (ref), reactModule (ref), fFlagSduiExperienceDetailsSupport (ref), buildColumnMajorChildren (ref), foundationModule (ref), luaAppInfoTableResponsiveProviderOverride (ref), useResponsive (ref), cryoModule (ref), breakpoint (ref), useBreakpoint (ref), responsiveProvider (ref)
	local var11 = if p3.numColumns and p3.numColumns > 0 then p3.numColumns else 1
	local var12 = nil
	local var13 = nil
	local var14 = nil
	local var15 = nil
	
	if luaAppInfoTableResponsiveProviderOverride_1 then
		local var16, var17 = reactModule.useState(false)
		var12 = var16
		var13 = var17
		local var18, var19 = reactModule.useState(nil)
		var14 = var18
		var15 = var19
	end
	local t = {}
	local var21 = 12 / var11
	
	if not luaAppInfoTableResponsiveProviderOverride_1 or var12 then
		if fFlagSduiExperienceDetailsSupport and var11 > 1 then
			t = buildColumnMajorChildren(p3.items, var11, var21)
		else
			for i, v in p3.items do
				t[`Cell_{i}`] = reactModule.createElement(foundationModule.Grid.Cell, {
					tag = "size-full-0 auto-y",
					size = var21,
					LayoutOrder = i
				}, v)
			end
		end
	end
	local var22 = nil
	
	if luaAppInfoTableResponsiveProviderOverride then
		local var23 = useResponsive()
		var22 = cryoModule.Dictionary.join(var23.config, {
			grid = cryoModule.Dictionary.join(var23.config.grid, {
				margins = {
					[breakpoint.XSmall] = 0,
					[breakpoint.Small] = 0,
					[breakpoint.Medium] = 0,
					[breakpoint.Large] = 0,
					[breakpoint.XLarge] = 0,
					[breakpoint.XXLarge] = 0
				}
			})
		})
	end
	if luaAppInfoTableResponsiveProviderOverride_1 then
		local _, var24 = useBreakpoint(var14)
		reactModule.useEffect(function() --[[ line: 120 ]]
			-- upvalues: var24 (ref), var13 (write)
			if var24.X > 0 then
				task.defer(function() --[[ line: 122 ]]
					-- upvalues: var13 (copy)
					var13(true)
				end)
			end
		end, { var24.X })
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p3.LayoutOrder,
			ref = var15
		}, {
			ContentFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = p3.LayoutOrder
			}, {
				Grid = reactModule.createElement(responsiveProvider, { config = var22 }, reactModule.createElement(foundationModule.Grid.Root, { tag = p3.gridTag, testId = p3.testId }, t))
			})
		})
	end
	return if luaAppInfoTableResponsiveProviderOverride then reactModule.createElement(responsiveProvider, { config = var22 }, reactModule.createElement(foundationModule.Grid.Root, {
		tag = p3.gridTag,
		LayoutOrder = p3.LayoutOrder,
		testId = p3.testId
	}, t)) else reactModule.createElement(foundationModule.Grid.Root, {
		tag = p3.gridTag,
		LayoutOrder = p3.LayoutOrder,
		testId = p3.testId
	}, t)
end)