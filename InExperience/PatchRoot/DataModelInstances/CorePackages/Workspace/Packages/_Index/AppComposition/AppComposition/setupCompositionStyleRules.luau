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
local _ = if fFlagEnableSplitPane then compositionTagsModule.SupportRegion.Collapsed else nil
local var11 = if fFlagEnableSplitPane then "CompositionSupportMinSize" else nil
local var12 = if fFlagEnableSplitPane then "CompositionSupportMaxSize" else nil
local var13 = if fFlagEnableSplitPane then "CompositionSupportCollapsedSize" else nil
local var14 = if fFlagEnableSplitPane then compositionConfigModule.getRegionOverrides(appCompositionEnumsModule.RegionName.SupportRegion) else nil
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
	[u284] = if not luaAppCompositionFixDetailClip then { ClipsDescendants = false } else nil,
	[`.{detail} >> .{body}::StyleQuery #CompositionAtMaxWidthDetail`] = { MinSize = "$CompositionClipThresholdDetail" },
	[`.{detail} >> .{body}::StyleQuery #CompositionNotAtMaxWidthDetail`] = { MaxSize = "$CompositionMaxWidthDetail" },
	[`@CompositionAtMaxWidthDetail >> .{clipAtMaxWidth}`] = { ClipsDescendants = true },
	[u307] = if not luaAppCompositionFixDetailClip then { ClipsDescendants = false } else nil,
	[`.{var10}`] = if fFlagEnableSplitPane and var14 and var14.widthScale then { Size = UDim2.new(var14.widthScale, 0, 1, 0) } else nil,
	[u326] = if fFlagEnableSplitPane then { MinSize = "$" .. var11, MaxSize = "$" .. var12 } else nil,
	[u338] = if fFlagEnableSplitPane then { Size = "$" .. var13 } else nil
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
	-- upvalues: signalsModule (ref), getGlobalViewportBreakpointModule (ref), compositionConfigModule (ref), fFlagEnableSplitPane (ref), appCompositionEnumsModule (ref), luaAppScaleDiscoveryWidth (ref), luaAppScaleDetailWidth (ref), displayModule (ref), var11 (ref), var12 (ref), var13 (ref)
	local var19 = signalsModule.createComputed(function(p3)
		-- upvalues: getGlobalViewportBreakpointModule (copy), compositionConfigModule (copy), p2 (ref)
		return compositionConfigModule.getBaseConfig(getGlobalViewportBreakpointModule(p3), p2).margin
	end)
	local var20 = if fFlagEnableSplitPane then signalsModule.createComputed(function(p4)
		-- upvalues: getGlobalViewportBreakpointModule (copy), compositionConfigModule (copy), appCompositionEnumsModule (copy), p2 (ref)
		return compositionConfigModule.getRegionLayout(appCompositionEnumsModule.RegionName.SupportRegion, getGlobalViewportBreakpointModule(p4), p2)
	end) else nil
	
	return signalsModule.createEffect(function(p5)
		-- upvalues: var19 (ref), value (ref), luaAppScaleDiscoveryWidth (copy), luaAppScaleDetailWidth (copy), displayModule (copy), fFlagEnableSplitPane (copy), var20 (ref), var11 (copy), var12 (copy), var13 (copy)
		local var25
		local var21 = var19(p5)
		local var22 = var21 * 2
		value:SetAttribute("CompositionMargin", UDim.new(0, var21))
		local var23 = nil
		
		if luaAppScaleDiscoveryWidth or luaAppScaleDetailWidth then
			local displayStore = displayModule.GetDisplayStore(p5)
			var25 = if displayStore.getPlatformScale then displayStore.getPlatformScale(p5) else 1
			var23 = if var25 and var25 > 0 then var25 else 1
		end
		value:SetAttribute("CompositionMaxWidthDiscovery", Vector2.new((if luaAppScaleDiscoveryWidth then var23 * 1920 else 1920) + var22, 1e999))
		value:SetAttribute("CompositionClipThresholdDiscovery", Vector2.new((if luaAppScaleDiscoveryWidth then var23 * 1920 else 1920) + var22, 0))
		value:SetAttribute("CompositionMaxWidthDetail", Vector2.new((if luaAppScaleDetailWidth then var23 * 848 else 848) + var22, 1e999))
		value:SetAttribute("CompositionClipThresholdDetail", Vector2.new((if luaAppScaleDetailWidth then var23 * 848 else 848) + var22, 0))
		
		if fFlagEnableSplitPane then
			local var26 = var20(p5)
			var25 = displayModule.GetDisplayStore(p5)
			local var27 = if var25.getPlatformScale then var25.getPlatformScale(p5) else 1
			
			if not var27 or var27 == 0 then
				var27 = 1
			end
			value:SetAttribute(var11, Vector2.new((var26.minWidth or 0) * var27, 0))
			value:SetAttribute(var12, Vector2.new((var26.maxWidth or 1e999) * var27, 1e999))
			value:SetAttribute(var13, UDim2.new(0, var21, 1, 0))
		end
	end)
end

return function(value, p6)
	-- upvalues: applyRules (ref), setupReactiveAttributes (ref)
	local t = {}
	applyRules(value, t)
	local var29 = setupReactiveAttributes(value, p6)
	
	return function()
		-- upvalues: var29 (ref), t (ref)
		var29()
		
		for i, v in t do
			v:Destroy()
		end
	end
end