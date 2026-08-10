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
local header = compositionTagsModule.ContentRegion.Header
local body = compositionTagsModule.ContentRegion.Body
local detail = compositionTagsModule.Layout.Detail
local clipAtMaxWidth = compositionTagsModule.Utility.ClipAtMaxWidth
local var8 = if fFlagEnableSplitPane then compositionTagsModule.SupportRegion.Root else nil
local _ = if fFlagEnableSplitPane then compositionTagsModule.SupportRegion.Collapsed else nil
local var9 = if fFlagEnableSplitPane then "CompositionSupportMinSize" else nil
local var10 = if fFlagEnableSplitPane then "CompositionSupportMaxSize" else nil
local var11 = if fFlagEnableSplitPane then "CompositionSupportCollapsedSize" else nil
local var12 = if fFlagEnableSplitPane then compositionConfigModule.getRegionOverrides(appCompositionEnumsModule.RegionName.SupportRegion) else nil
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
	[u269] = if not luaAppCompositionFixDetailClip then { ClipsDescendants = false } else nil,
	[`.{detail} >> .{body}::StyleQuery #CompositionAtMaxWidthDetail`] = { MinSize = "$CompositionClipThresholdDetail" },
	[`.{detail} >> .{body}::StyleQuery #CompositionNotAtMaxWidthDetail`] = { MaxSize = "$CompositionMaxWidthDetail" },
	[`@CompositionAtMaxWidthDetail >> .{clipAtMaxWidth}`] = { ClipsDescendants = true },
	[u292] = if not luaAppCompositionFixDetailClip then { ClipsDescendants = false } else nil,
	[`.{var8}`] = if fFlagEnableSplitPane and var12 and var12.widthScale then { Size = UDim2.new(var12.widthScale, 0, 1, 0) } else nil,
	[u311] = if fFlagEnableSplitPane then { MinSize = "$" .. var9, MaxSize = "$" .. var10 } else nil,
	[u323] = if fFlagEnableSplitPane then { Size = "$" .. var11 } else nil
}

local function applyRules(p0, p1) --[[ line: 141 ]]
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

local function setupReactiveAttributes(value, p2) --[[ line: 155 ]]
	-- upvalues: signalsModule (ref), getGlobalViewportBreakpointModule (ref), compositionConfigModule (ref), fFlagEnableSplitPane (ref), appCompositionEnumsModule (ref), displayModule (ref), var9 (ref), var10 (ref), var11 (ref)
	local var17 = signalsModule.createComputed(function(p3) --[[ line: 156 ]]
		-- upvalues: getGlobalViewportBreakpointModule (copy), compositionConfigModule (copy), p2 (ref)
		return compositionConfigModule.getBaseConfig(getGlobalViewportBreakpointModule(p3), p2).margin
	end)
	local var18 = if fFlagEnableSplitPane then signalsModule.createComputed(function(p4) --[[ line: 162 ]]
		-- upvalues: getGlobalViewportBreakpointModule (copy), compositionConfigModule (copy), appCompositionEnumsModule (copy), p2 (ref)
		return compositionConfigModule.getRegionLayout(appCompositionEnumsModule.RegionName.SupportRegion, getGlobalViewportBreakpointModule(p4), p2)
	end) else nil
	
	return signalsModule.createEffect(function(p5) --[[ line: 168 ]]
		-- upvalues: var17 (ref), value (ref), fFlagEnableSplitPane (copy), var18 (ref), displayModule (copy), var9 (copy), var10 (copy), var11 (copy)
		local var19 = var17(p5)
		local var20 = var19 * 2
		value:SetAttribute("CompositionMargin", UDim.new(0, var19))
		value:SetAttribute("CompositionMaxWidthDiscovery", Vector2.new(1920 + var20, 1e999))
		value:SetAttribute("CompositionClipThresholdDiscovery", Vector2.new(1920 + var20, 0))
		value:SetAttribute("CompositionMaxWidthDetail", Vector2.new(848 + var20, 1e999))
		value:SetAttribute("CompositionClipThresholdDetail", Vector2.new(848 + var20, 0))
		
		if fFlagEnableSplitPane then
			local var21 = var18(p5)
			local displayStore = displayModule.GetDisplayStore(p5)
			local var23 = if displayStore.getPlatformScale then displayStore.getPlatformScale(p5) else 1
			
			if not var23 or var23 == 0 then
				var23 = 1
			end
			value:SetAttribute(var9, Vector2.new((var21.minWidth or 0) * var23, 0))
			value:SetAttribute(var10, Vector2.new((var21.maxWidth or 1e999) * var23, 1e999))
			value:SetAttribute(var11, UDim2.new(0, var19, 1, 0))
		end
	end)
end

return function(value, p6) --[[ line: 196 | named "setupCompositionStyleRules" ]]
	-- upvalues: applyRules (ref), setupReactiveAttributes (ref)
	local t = {}
	applyRules(value, t)
	local var25 = setupReactiveAttributes(value, p6)
	
	return function() --[[ line: 203 ]]
		-- upvalues: var25 (ref), t (ref)
		var25()
		
		for i, v in t do
			v:Destroy()
		end
	end
end