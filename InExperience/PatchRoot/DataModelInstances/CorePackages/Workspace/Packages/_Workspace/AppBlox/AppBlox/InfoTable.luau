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

local function buildColumnMajorChildren(p1, p2, p3)
	-- upvalues: reactModule (ref), foundationModule (ref)
	local p0Count = #p1
	local ceiled = math.ceil(p0Count / p2)
	local t = {}
	local var1 = 0
	
	for i_1 = 1, ceiled do
		for i = 1, p2 do
			var1 += 1
			local var2 = (i - 1) * ceiled + i_1
			t[`Cell_{var1}`] = reactModule.createElement(foundationModule.Grid.Cell, {
				tag = "size-full-0 auto-y",
				size = p3,
				LayoutOrder = var1
			}, if var2 <= p0Count then p1[var2] else reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y", BackgroundTransparency = 1 }))
		end
	end
	return t
end

return reactModule.memo(function(p4)
	-- upvalues: luaAppInfoTableResponsiveProviderOverride_1 (ref), reactModule (ref), fFlagSduiExperienceDetailsSupport (ref), buildColumnMajorChildren (ref), foundationModule (ref), luaAppInfoTableResponsiveProviderOverride (ref), useResponsive (ref), cryoModule (ref), breakpoint (ref), useBreakpoint (ref), responsiveProvider (ref)
	local var3 = if p4.numColumns and p4.numColumns > 0 then p4.numColumns else 1
	local var4 = nil
	local var5 = nil
	local var6 = nil
	local var7 = nil
	
	if luaAppInfoTableResponsiveProviderOverride_1 then
		local var8, var9 = reactModule.useState(false)
		var4 = var8
		var5 = var9
		local var10, var11 = reactModule.useState(nil)
		var6 = var10
		var7 = var11
	end
	local t = {}
	local var12 = 12 / var3
	
	if not luaAppInfoTableResponsiveProviderOverride_1 or var4 then
		if fFlagSduiExperienceDetailsSupport and var3 > 1 then
			t = buildColumnMajorChildren(p4.items, var3, var12)
		else
			for i, v in p4.items do
				t[`Cell_{i}`] = reactModule.createElement(foundationModule.Grid.Cell, {
					tag = "size-full-0 auto-y",
					size = var12,
					LayoutOrder = i
				}, v)
			end
		end
	end
	local var13 = nil
	
	if luaAppInfoTableResponsiveProviderOverride then
		local var14 = useResponsive()
		var13 = cryoModule.Dictionary.join(var14.config, {
			grid = cryoModule.Dictionary.join(var14.config.grid, {
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
		local _, var15 = useBreakpoint(var6)
		reactModule.useEffect(function()
			-- upvalues: var15 (ref), var5 (write)
			if var15.X > 0 then
				task.defer(function()
					-- upvalues: var5 (copy)
					var5(true)
				end)
			end
		end, { var15.X })
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p4.LayoutOrder,
			ref = var7
		}, {
			ContentFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = p4.LayoutOrder
			}, {
				Grid = reactModule.createElement(responsiveProvider, { config = var13 }, reactModule.createElement(foundationModule.Grid.Root, { tag = p4.gridTag, testId = p4.testId }, t))
			})
		})
	end
	return if luaAppInfoTableResponsiveProviderOverride then reactModule.createElement(responsiveProvider, { config = var13 }, reactModule.createElement(foundationModule.Grid.Root, {
		tag = p4.gridTag,
		LayoutOrder = p4.LayoutOrder,
		testId = p4.testId
	}, t)) else reactModule.createElement(foundationModule.Grid.Root, {
		tag = p4.gridTag,
		LayoutOrder = p4.LayoutOrder,
		testId = p4.testId
	}, t)
end)