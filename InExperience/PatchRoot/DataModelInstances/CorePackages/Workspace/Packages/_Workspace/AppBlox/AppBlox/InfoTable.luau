local Parent = script:FindFirstAncestor("AppBlox").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseBreakpointFunction = require(Parent.Foundation).Hooks.useBreakpoint
local UseResponsiveFunction = require(Parent.Foundation).Hooks.useResponsive
local ResponsiveProvider = require(Parent.Foundation).ResponsiveProvider
local CryoModule = require(Parent.Cryo)
local LuaAppInfoTableResponsiveProviderOverride = game:DefineFastFlag("LuaAppInfoTableResponsiveProviderOverride", false)
local FFlagInfoTableStableItemKeys = require(Parent.SharedFlags).FFlagInfoTableStableItemKeys
local Breakpoint = FoundationModule.Enums.Breakpoint

local function buildColumnMajorChildren(Items, NumColumns, Size)
	-- upvalues: ReactModule (copy), FoundationModule (copy), FFlagInfoTableStableItemKeys (copy)
	local CountItems = #Items
	local Ceiled = math.ceil(CountItems / NumColumns)
	local Elements = {}
	local LayoutOrder = 0
	
	for i = 1, Ceiled do
		for i1 = 1, NumColumns do
			LayoutOrder += 1
			local NewI = (i1 - 1) * Ceiled + i
			Elements[if FFlagInfoTableStableItemKeys then if NewI <= CountItems then `Cell_{NewI}` else `Placeholder_{LayoutOrder}` else `Cell_{LayoutOrder}`] = ReactModule.createElement(FoundationModule.Grid.Cell, {
				tag = "size-full-0 auto-y",
				size = Size,
				LayoutOrder = LayoutOrder
			}, if NewI <= CountItems then Items[NewI] else ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y", BackgroundTransparency = 1 }))
		end
	end
	return Elements
end

return ReactModule.memo(function(Frame: Frame)
	-- upvalues: LuaAppInfoTableResponsiveProviderOverride (copy), ReactModule (copy), buildColumnMajorChildren (copy), FoundationModule (copy), LuaAppInfoTableResponsiveProviderOverride (copy), UseResponsiveFunction (copy), CryoModule (copy), Breakpoint (copy), UseBreakpointFunction (copy), ResponsiveProvider (copy)
	local NumColumns = if Frame.numColumns and Frame.numColumns > 0 then Frame.numColumns else 1
	local v1 = nil
	local Callback = nil
	local v2 = nil
	local Ref = nil
	
	if LuaAppInfoTableResponsiveProviderOverride then
		v1, Callback = ReactModule.useState(false)
		v2, Ref = ReactModule.useState(nil)
	end
	local Elements = {}
	local Size = 12 / NumColumns
	
	if not LuaAppInfoTableResponsiveProviderOverride or v1 then
		if NumColumns > 1 then
			Elements = buildColumnMajorChildren(Frame.items, NumColumns, Size)
		else
			for LayoutOrder, item in Frame.items do
				Elements[`Cell_{LayoutOrder}`] = ReactModule.createElement(FoundationModule.Grid.Cell, {
					tag = "size-full-0 auto-y",
					size = Size,
					LayoutOrder = LayoutOrder
				}, item)
			end
		end
	end
	local Config = nil
	
	if LuaAppInfoTableResponsiveProviderOverride then
		local UseResponsiveResult = UseResponsiveFunction()
		Config = CryoModule.Dictionary.join(UseResponsiveResult.config, {
			grid = CryoModule.Dictionary.join(UseResponsiveResult.config.grid, {
				margins = {
					[Breakpoint.XSmall] = 0,
					[Breakpoint.Small] = 0,
					[Breakpoint.Medium] = 0,
					[Breakpoint.Large] = 0,
					[Breakpoint.XLarge] = 0,
					[Breakpoint.XXLarge] = 0
				}
			})
		})
	end
	if LuaAppInfoTableResponsiveProviderOverride then
		local _, UseBreakpointResult2 = UseBreakpointFunction(v2)
		ReactModule.useEffect(function()
			-- upvalues: UseBreakpointResult2 (copy), Callback (ref)
			if UseBreakpointResult2.X > 0 then
				task.defer(function()
					-- upvalues: Callback (upval)
					Callback(true)
				end)
			end
		end, { UseBreakpointResult2.X })
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = Frame.LayoutOrder,
			ref = Ref
		}, {
			ContentFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = Frame.LayoutOrder
			}, {
				Grid = ReactModule.createElement(ResponsiveProvider, { config = Config }, ReactModule.createElement(FoundationModule.Grid.Root, { tag = Frame.gridTag, testId = Frame.testId }, Elements))
			})
		})
	else
		return if LuaAppInfoTableResponsiveProviderOverride then ReactModule.createElement(ResponsiveProvider, { config = Config }, ReactModule.createElement(FoundationModule.Grid.Root, {
			tag = Frame.gridTag,
			LayoutOrder = Frame.LayoutOrder,
			testId = Frame.testId
		}, Elements)) else ReactModule.createElement(FoundationModule.Grid.Root, {
			tag = Frame.gridTag,
			LayoutOrder = Frame.LayoutOrder,
			testId = Frame.testId
		}, Elements)
	end
end)