local AppComposition = script:FindFirstAncestor("AppComposition")
local Parent = AppComposition.Parent
local _ = require(Parent.Foundation)
local SignalsModule = require(Parent.Signals)
local CompositionConfigModule = require(AppComposition.CompositionConfig)
local AppCompositionEnumsModule = require(AppComposition.AppCompositionEnums)
local CompositionTagsModule = require(AppComposition.CompositionTags)
local GetGlobalViewportBreakpointModule = require(AppComposition.getGlobalViewportBreakpoint)
local FFlagEnableSplitPane = require(Parent.SharedFlags).FFlagEnableSplitPane
local DisplayModule = require(Parent.Display)
local LuaAppCompositionFixDetailClip = game:DefineFastFlag("LuaAppCompositionFixDetailClip", false)
local Header = CompositionTagsModule.ContentRegion.Header
local Body = CompositionTagsModule.ContentRegion.Body
local Detail = CompositionTagsModule.Layout.Detail
local ClipAtMaxWidth = CompositionTagsModule.Utility.ClipAtMaxWidth
local CompositionSupportMinSize = if FFlagEnableSplitPane then "CompositionSupportMinSize" else nil
local CompositionSupportMaxSize = if FFlagEnableSplitPane then "CompositionSupportMaxSize" else nil
local config = {
	[`.{Header}`] = {
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.fromScale(0.5, 0)
	},
	[`.{Header}::UIPadding`] = {
		PaddingLeft = "$CompositionMargin",
		PaddingRight = "$CompositionMargin"
	},
	[`.{Header}::UISizeConstraint`] = { MaxSize = "$CompositionMaxWidthDiscovery" },
	[`.{Body}`] = {
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.fromScale(0.5, 0)
	},
	[`.{Body}::UIPadding`] = {
		PaddingLeft = "$CompositionMargin",
		PaddingRight = "$CompositionMargin"
	},
	[`.{Body}::UISizeConstraint`] = { MaxSize = "$CompositionMaxWidthDiscovery" },
	[`.{Detail} >> .{Header}::UISizeConstraint`] = { MaxSize = "$CompositionMaxWidthDetail" },
	[`.{Detail} >> .{Body}::UISizeConstraint`] = { MaxSize = "$CompositionMaxWidthDetail" },
	[`.{Body}::StyleQuery #CompositionAtMaxWidthDiscovery`] = { MinSize = "$CompositionClipThresholdDiscovery" },
	[`.{Body}::StyleQuery #CompositionNotAtMaxWidthDiscovery`] = { MaxSize = "$CompositionMaxWidthDiscovery" },
	[`@CompositionAtMaxWidthDiscovery >> .{ClipAtMaxWidth}`] = { ClipsDescendants = true },
	[`@CompositionNotAtMaxWidthDiscovery >> .{ClipAtMaxWidth}`] = if LuaAppCompositionFixDetailClip then nil else { ClipsDescendants = false },
	[`.{Detail} >> .{Body}::StyleQuery #CompositionAtMaxWidthDetail`] = { MinSize = "$CompositionClipThresholdDetail" },
	[`.{Detail} >> .{Body}::StyleQuery #CompositionNotAtMaxWidthDetail`] = { MaxSize = "$CompositionMaxWidthDetail" },
	[`@CompositionAtMaxWidthDetail >> .{ClipAtMaxWidth}`] = { ClipsDescendants = true },
	[`@CompositionNotAtMaxWidthDetail >> .{ClipAtMaxWidth}`] = if LuaAppCompositionFixDetailClip then nil else { ClipsDescendants = false },
	[`.{if FFlagEnableSplitPane then CompositionTagsModule.SupportRegion.Root else nil}::UISizeConstraint`] = if FFlagEnableSplitPane then {
		MinSize = "$" .. CompositionSupportMinSize,
		MaxSize = "$" .. CompositionSupportMaxSize
	} else nil
}

local function applyRules(Parent, List)
	-- upvalues: config (copy)
	for Name, value in config do
		local StyleRule = Instance.new("StyleRule")
		StyleRule.Selector = Name
		StyleRule.Name = Name
		StyleRule:SetProperties(value)
		StyleRule.Parent = Parent
		table.insert(List, StyleRule)
	end
end

local function setupReactiveAttributes(Object, p1)
	-- upvalues: SignalsModule (copy), GetGlobalViewportBreakpointModule (copy), CompositionConfigModule (copy), FFlagEnableSplitPane (copy), AppCompositionEnumsModule (copy), DisplayModule (copy), CompositionSupportMinSize (copy), CompositionSupportMaxSize (copy)
	local Computed = SignalsModule.createComputed(function(p2)
		-- upvalues: GetGlobalViewportBreakpointModule (upval), CompositionConfigModule (upval), p1 (copy)
		return CompositionConfigModule.getBaseConfig(GetGlobalViewportBreakpointModule(p2), p1).margin
	end)
	local Computed1 = if FFlagEnableSplitPane then SignalsModule.createComputed(function(p2)
		-- upvalues: GetGlobalViewportBreakpointModule (upval), CompositionConfigModule (upval), AppCompositionEnumsModule (upval), p1 (copy)
		return CompositionConfigModule.getRegionLayout(AppCompositionEnumsModule.RegionName.SupportRegion, GetGlobalViewportBreakpointModule(p2), p1)
	end) else nil
	
	return SignalsModule.createEffect(function(p2)
		-- upvalues: Computed (copy), Object (copy), FFlagEnableSplitPane (upval), Computed1 (copy), DisplayModule (upval), CompositionSupportMinSize (upval), CompositionSupportMaxSize (upval)
		local ComputedResult: number = Computed(p2)
		local ScaledComputedResult = ComputedResult * 2
		Object:SetAttribute("CompositionMargin", UDim.new(0, ComputedResult))
		Object:SetAttribute("CompositionMaxWidthDiscovery", Vector2.new(1920 + ScaledComputedResult, 1e999))
		Object:SetAttribute("CompositionClipThresholdDiscovery", Vector2.new(1920 + ScaledComputedResult, 0))
		Object:SetAttribute("CompositionMaxWidthDetail", Vector2.new(848 + ScaledComputedResult, 1e999))
		Object:SetAttribute("CompositionClipThresholdDetail", Vector2.new(848 + ScaledComputedResult, 0))
		
		if FFlagEnableSplitPane then
			local ComputedResult1 = Computed1(p2)
			local DisplayStore = DisplayModule.GetDisplayStore(p2)
			local PlatformScale = if DisplayStore.getPlatformScale then DisplayStore.getPlatformScale(p2) else 1
			
			if not PlatformScale or PlatformScale == 0 then
				PlatformScale = 1
			end
			Object:SetAttribute(CompositionSupportMinSize, Vector2.new((ComputedResult1.minWidth or 0) * PlatformScale, 0))
			Object:SetAttribute(CompositionSupportMaxSize, Vector2.new((ComputedResult1.maxWidth or 1e999) * PlatformScale, 1e999))
		end
	end)
end

return function(Parent, p1)
	-- upvalues: applyRules (copy), setupReactiveAttributes (copy)
	local t = {}
	applyRules(Parent, t)
	local SetupReactiveAttributesResult = setupReactiveAttributes(Parent, p1)
	
	return function()
		-- upvalues: SetupReactiveAttributesResult (copy), t (copy)
		SetupReactiveAttributesResult()
		
		for _, value in t do
			value:Destroy()
		end
	end
end