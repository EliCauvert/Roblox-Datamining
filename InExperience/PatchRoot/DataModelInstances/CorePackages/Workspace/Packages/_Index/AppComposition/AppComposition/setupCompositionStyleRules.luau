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
local var1 = if fFlagEnableSplitPane then compositionTagsModule.SupportRegion.Root else nil
local var2 = if fFlagEnableSplitPane then compositionTagsModule.SupportRegion.Collapsed else nil
local var3 = if fFlagEnableSplitPane then "CompositionSupportMinSize" else nil
local var4 = if fFlagEnableSplitPane then "CompositionSupportMaxSize" else nil
local var5 = if fFlagEnableSplitPane then "CompositionSupportCollapsedSize" else nil
local var6 = if fFlagEnableSplitPane then compositionConfigModule.getRegionOverrides(appCompositionEnumsModule.RegionName.SupportRegion) else nil
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
	[`.{var1}`] = if fFlagEnableSplitPane and var6 and var6.widthScale then { Size = UDim2.new(var6.widthScale, 0, 1, 0) } else nil,
	[`.{var1}::UISizeConstraint`] = if fFlagEnableSplitPane then { MinSize = "$" .. var12, MaxSize = "$" .. var13 } else nil,
	[`.{var2}`] = if fFlagEnableSplitPane then { Size = "$" .. var14 } else nil
}

local function applyRules(p1, p2)
	-- upvalues: t (ref)
	for i, v in t do
		local styleRule = Instance.new("StyleRule")
		styleRule.Selector = i
		styleRule.Name = i
		styleRule:SetProperties(v)
		styleRule.Parent = p1
		table.insert(p2, styleRule)
	end
end

local function setupReactiveAttributes(value, p3)
	-- upvalues: signalsModule (ref), getGlobalViewportBreakpointModule (ref), compositionConfigModule (ref), fFlagEnableSplitPane (ref), appCompositionEnumsModule (ref), luaAppScaleDiscoveryWidth (ref), luaAppScaleDetailWidth (ref), displayModule (ref), var3 (ref), var4 (ref), var5 (ref)
	local var7 = signalsModule.createComputed(function(p4)
		-- upvalues: getGlobalViewportBreakpointModule (copy), compositionConfigModule (copy), p3 (ref)
		return compositionConfigModule.getBaseConfig(getGlobalViewportBreakpointModule(p4), p3).margin
	end)
	local var8 = if fFlagEnableSplitPane then signalsModule.createComputed(function(p4)
		-- upvalues: getGlobalViewportBreakpointModule (copy), compositionConfigModule (copy), appCompositionEnumsModule (copy), p3 (ref)
		return compositionConfigModule.getRegionLayout(appCompositionEnumsModule.RegionName.SupportRegion, getGlobalViewportBreakpointModule(p4), p3)
	end) else nil
	
	return signalsModule.createEffect(function(p4)
		-- upvalues: var7 (ref), value (ref), luaAppScaleDiscoveryWidth (copy), luaAppScaleDetailWidth (copy), displayModule (copy), fFlagEnableSplitPane (copy), var8 (ref), var3 (copy), var4 (copy), var5 (copy)
		local var9
		local var10 = var7(p4)
		local var11 = var10 * 2
		value:SetAttribute("CompositionMargin", UDim.new(0, var10))
		local var12 = nil
		
		if luaAppScaleDiscoveryWidth or luaAppScaleDetailWidth then
			local displayStore = displayModule.GetDisplayStore(p4)
			var9 = if displayStore.getPlatformScale then displayStore.getPlatformScale(p4) else 1
			var12 = if var9 and var9 > 0 then var9 else 1
		end
		value:SetAttribute("CompositionMaxWidthDiscovery", Vector2.new((if luaAppScaleDiscoveryWidth then var12 * 1920 else 1920) + var11, 1e999))
		value:SetAttribute("CompositionClipThresholdDiscovery", Vector2.new((if luaAppScaleDiscoveryWidth then var12 * 1920 else 1920) + var11, 0))
		value:SetAttribute("CompositionMaxWidthDetail", Vector2.new((if luaAppScaleDetailWidth then var12 * 848 else 848) + var11, 1e999))
		value:SetAttribute("CompositionClipThresholdDetail", Vector2.new((if luaAppScaleDetailWidth then var12 * 848 else 848) + var11, 0))
		
		if fFlagEnableSplitPane then
			local var13 = var8(p4)
			var9 = displayModule.GetDisplayStore(p4)
			local var14 = if var9.getPlatformScale then var9.getPlatformScale(p4) else 1
			
			if not var14 or var14 == 0 then
				var14 = 1
			end
			value:SetAttribute(var3, Vector2.new((var13.minWidth or 0) * var14, 0))
			value:SetAttribute(var4, Vector2.new((var13.maxWidth or 1e999) * var14, 1e999))
			value:SetAttribute(var5, UDim2.new(0, var10, 1, 0))
		end
	end)
end

return function(value, p3)
	-- upvalues: applyRules (ref), setupReactiveAttributes (ref)
	local t = {}
	applyRules(value, t)
	local var7 = setupReactiveAttributes(value, p3)
	
	return function()
		-- upvalues: var7 (ref), t (ref)
		var7()
		
		for i, v in t do
			v:Destroy()
		end
	end
end