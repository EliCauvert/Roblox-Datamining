local appComposition = script:FindFirstAncestor("AppComposition")
local parent = appComposition.Parent
local _ = require(parent.Foundation)
local signalsModule = require(parent.Signals)
local compositionConfigModule = require(appComposition.CompositionConfig)
local appCompositionEnumsModule = require(appComposition.AppCompositionEnums)
local compositionTagsModule = require(appComposition.CompositionTags)
local getGlobalViewportBreakpointModule = require(appComposition.getGlobalViewportBreakpoint)
local fFlagEnableSplitPane = require(parent.SharedFlags).FFlagEnableSplitPane
local displayModule = require(parent.Display)
local luaAppCompositionFixDetailClip = game:DefineFastFlag("LuaAppCompositionFixDetailClip", false)
local luaAppScaleDetailWidth = game:DefineFastFlag("LuaAppScaleDetailWidth", false)
local luaAppScaleDiscoveryWidth = game:DefineFastFlag("LuaAppScaleDiscoveryWidth", false)
local header = compositionTagsModule.ContentRegion.Header
local body = compositionTagsModule.ContentRegion.Body
local detail = compositionTagsModule.Layout.Detail
local clipAtMaxWidth = compositionTagsModule.Utility.ClipAtMaxWidth
local var10 = if fFlagEnableSplitPane then compositionTagsModule.SupportRegion.Root else nil
local var11 = if fFlagEnableSplitPane then compositionTagsModule.SupportRegion.Collapsed else nil
local var12 = if fFlagEnableSplitPane then "CompositionSupportMinSize" else nil
local var13 = if fFlagEnableSplitPane then "CompositionSupportMaxSize" else nil
local var14 = if fFlagEnableSplitPane then "CompositionSupportCollapsedSize" else nil
local var15 = if fFlagEnableSplitPane then compositionConfigModule.getRegionOverrides(appCompositionEnumsModule.RegionName.SupportRegion) else nil
local t = {
	[`.{header}`] = {
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.fromScale(0.5, 0)
	},
	[`.{header}::UIPadding`] = {
		PaddingLeft = "$CompositionMargin",
		PaddingRight = "$CompositionMargin"
	},
	[`.{header}::UISizeConstraint`] = { MaxSize = "$CompositionMaxWidthDiscovery" },
	[`.{body}`] = {
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.fromScale(0.5, 0)
	},
	[`.{body}::UIPadding`] = {
		PaddingLeft = "$CompositionMargin",
		PaddingRight = "$CompositionMargin"
	},
	[`.{body}::UISizeConstraint`] = { MaxSize = "$CompositionMaxWidthDiscovery" },
	[`.{detail} >> .{header}::UISizeConstraint`] = { MaxSize = "$CompositionMaxWidthDetail" },
	[`.{detail} >> .{body}::UISizeConstraint`] = { MaxSize = "$CompositionMaxWidthDetail" },
	[`.{body}::StyleQuery #CompositionAtMaxWidthDiscovery`] = { MinSize = "$CompositionClipThresholdDiscovery" },
	[`.{body}::StyleQuery #CompositionNotAtMaxWidthDiscovery`] = { MaxSize = "$CompositionMaxWidthDiscovery" },
	[`@CompositionAtMaxWidthDiscovery >> .{clipAtMaxWidth}`] = { ClipsDescendants = true },
	[`@CompositionNotAtMaxWidthDiscovery >> .{clipAtMaxWidth}`] = if not luaAppCompositionFixDetailClip then { ClipsDescendants = false } else nil,
	[`.{detail} >> .{body}::StyleQuery #CompositionAtMaxWidthDetail`] = { MinSize = "$CompositionClipThresholdDetail" },
	[`.{detail} >> .{body}::StyleQuery #CompositionNotAtMaxWidthDetail`] = { MaxSize = "$CompositionMaxWidthDetail" },
	[`@CompositionAtMaxWidthDetail >> .{clipAtMaxWidth}`] = { ClipsDescendants = true },
	[`@CompositionNotAtMaxWidthDetail >> .{clipAtMaxWidth}`] = if not luaAppCompositionFixDetailClip then { ClipsDescendants = false } else nil,
	[`.{var10}`] = if fFlagEnableSplitPane and var15 and var15.widthScale then { Size = UDim2.new(var15.widthScale, 0, 1, 0) } else nil,
	[`.{var10}::UISizeConstraint`] = if fFlagEnableSplitPane then { MinSize = "$" .. var12, MaxSize = "$" .. var13 } else nil,
	[`.{var11}`] = if fFlagEnableSplitPane then { Size = "$" .. var14 } else nil
}

local function applyRules(p0, p1)
	-- upvalues: t (ref)
	for i, v in t do
		local styleRule = Instance.new("StyleRule")
		styleRule.Selector = i
		styleRule.Name = i
		styleRule:SetProperties(v)
		styleRule.Parent = p0
		table.insert(p1, styleRule)
	end
end

local function setupReactiveAttributes(value, p2)
	-- upvalues: signalsModule (ref), getGlobalViewportBreakpointModule (ref), compositionConfigModule (ref), fFlagEnableSplitPane (ref), appCompositionEnumsModule (ref), luaAppScaleDiscoveryWidth (ref), luaAppScaleDetailWidth (ref), displayModule (ref), var12 (ref), var13 (ref), var14 (ref)
	local var20 = signalsModule.createComputed(function(p3)
		-- upvalues: getGlobalViewportBreakpointModule (copy), compositionConfigModule (copy), p2 (ref)
		return compositionConfigModule.getBaseConfig(getGlobalViewportBreakpointModule(p3), p2).margin
	end)
	local var21 = if fFlagEnableSplitPane then signalsModule.createComputed(function(p4)
		-- upvalues: getGlobalViewportBreakpointModule (copy), compositionConfigModule (copy), appCompositionEnumsModule (copy), p2 (ref)
		return compositionConfigModule.getRegionLayout(appCompositionEnumsModule.RegionName.SupportRegion, getGlobalViewportBreakpointModule(p4), p2)
	end) else nil
	
	return signalsModule.createEffect(function(p5)
		-- upvalues: var20 (ref), value (ref), luaAppScaleDiscoveryWidth (copy), luaAppScaleDetailWidth (copy), displayModule (copy), fFlagEnableSplitPane (copy), var21 (ref), var12 (copy), var13 (copy), var14 (copy)
		local var26
		local var22 = var20(p5)
		local var23 = var22 * 2
		value:SetAttribute("CompositionMargin", UDim.new(0, var22))
		local var24 = nil
		
		if luaAppScaleDiscoveryWidth or luaAppScaleDetailWidth then
			local displayStore = displayModule.GetDisplayStore(p5)
			var26 = if displayStore.getPlatformScale then displayStore.getPlatformScale(p5) else 1
			var24 = if var26 and var26 > 0 then var26 else 1
		end
		value:SetAttribute("CompositionMaxWidthDiscovery", Vector2.new((if luaAppScaleDiscoveryWidth then var24 * 1920 else 1920) + var23, 1e999))
		value:SetAttribute("CompositionClipThresholdDiscovery", Vector2.new((if luaAppScaleDiscoveryWidth then var24 * 1920 else 1920) + var23, 0))
		value:SetAttribute("CompositionMaxWidthDetail", Vector2.new((if luaAppScaleDetailWidth then var24 * 848 else 848) + var23, 1e999))
		value:SetAttribute("CompositionClipThresholdDetail", Vector2.new((if luaAppScaleDetailWidth then var24 * 848 else 848) + var23, 0))
		
		if fFlagEnableSplitPane then
			local var27 = var21(p5)
			var26 = displayModule.GetDisplayStore(p5)
			local var28 = if var26.getPlatformScale then var26.getPlatformScale(p5) else 1
			
			if not var28 or var28 == 0 then
				var28 = 1
			end
			value:SetAttribute(var12, Vector2.new((var27.minWidth or 0) * var28, 0))
			value:SetAttribute(var13, Vector2.new((var27.maxWidth or 1e999) * var28, 1e999))
			value:SetAttribute(var14, UDim2.new(0, var22, 1, 0))
		end
	end)
end

return function(value, p6)
	-- upvalues: applyRules (ref), setupReactiveAttributes (ref)
	local t = {}
	applyRules(value, t)
	local var30 = setupReactiveAttributes(value, p6)
	
	return function()
		-- upvalues: var30 (ref), t (ref)
		var30()
		
		for i, v in t do
			v:Destroy()
		end
	end
end