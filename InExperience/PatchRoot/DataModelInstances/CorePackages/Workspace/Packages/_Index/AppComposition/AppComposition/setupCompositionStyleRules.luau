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
local _ = if fFlagEnableSplitPane then compositionTagsModule.SupportRegion.Root else nil
local var8 = if fFlagEnableSplitPane then "CompositionSupportMinSize" else nil
local var9 = if fFlagEnableSplitPane then "CompositionSupportMaxSize" else nil
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
	[u236] = if not luaAppCompositionFixDetailClip then { ClipsDescendants = false } else nil,
	[`.{detail} >> .{body}::StyleQuery #CompositionAtMaxWidthDetail`] = { MinSize = "$CompositionClipThresholdDetail" },
	[`.{detail} >> .{body}::StyleQuery #CompositionNotAtMaxWidthDetail`] = { MaxSize = "$CompositionMaxWidthDetail" },
	[`@CompositionAtMaxWidthDetail >> .{clipAtMaxWidth}`] = { ClipsDescendants = true },
	[u259] = if not luaAppCompositionFixDetailClip then { ClipsDescendants = false } else nil,
	[u265] = if fFlagEnableSplitPane then { MinSize = "$" .. var8, MaxSize = "$" .. var9 } else nil
}

local function applyRules(p0, p1) --[[ line: 121 ]]
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

local function setupReactiveAttributes(value, p2) --[[ line: 135 ]]
	-- upvalues: signalsModule (ref), getGlobalViewportBreakpointModule (ref), compositionConfigModule (ref), fFlagEnableSplitPane (ref), appCompositionEnumsModule (ref), displayModule (ref), var8 (ref), var9 (ref)
	local var14 = signalsModule.createComputed(function(p3) --[[ line: 136 ]]
		-- upvalues: getGlobalViewportBreakpointModule (copy), compositionConfigModule (copy), p2 (ref)
		return compositionConfigModule.getBaseConfig(getGlobalViewportBreakpointModule(p3), p2).margin
	end)
	local var15 = if fFlagEnableSplitPane then signalsModule.createComputed(function(p4) --[[ line: 142 ]]
		-- upvalues: getGlobalViewportBreakpointModule (copy), compositionConfigModule (copy), appCompositionEnumsModule (copy), p2 (ref)
		return compositionConfigModule.getRegionLayout(appCompositionEnumsModule.RegionName.SupportRegion, getGlobalViewportBreakpointModule(p4), p2)
	end) else nil
	
	return signalsModule.createEffect(function(p5) --[[ line: 148 ]]
		-- upvalues: var14 (ref), value (ref), fFlagEnableSplitPane (copy), var15 (ref), displayModule (copy), var8 (copy), var9 (copy)
		local var16 = var14(p5)
		local var17 = var16 * 2
		value:SetAttribute("CompositionMargin", UDim.new(0, var16))
		value:SetAttribute("CompositionMaxWidthDiscovery", Vector2.new(1920 + var17, 1e999))
		value:SetAttribute("CompositionClipThresholdDiscovery", Vector2.new(1920 + var17, 0))
		value:SetAttribute("CompositionMaxWidthDetail", Vector2.new(848 + var17, 1e999))
		value:SetAttribute("CompositionClipThresholdDetail", Vector2.new(848 + var17, 0))
		
		if fFlagEnableSplitPane then
			local var18 = var15(p5)
			local displayStore = displayModule.GetDisplayStore(p5)
			local var20 = if displayStore.getPlatformScale then displayStore.getPlatformScale(p5) else 1
			
			if not var20 or var20 == 0 then
				var20 = 1
			end
			value:SetAttribute(var8, Vector2.new((var18.minWidth or 0) * var20, 0))
			value:SetAttribute(var9, Vector2.new((var18.maxWidth or 1e999) * var20, 1e999))
		end
	end)
end

return function(value, p6) --[[ line: 175 | named "setupCompositionStyleRules" ]]
	-- upvalues: applyRules (ref), setupReactiveAttributes (ref)
	local t = {}
	applyRules(value, t)
	local var22 = setupReactiveAttributes(value, p6)
	
	return function() --[[ line: 182 ]]
		-- upvalues: var22 (ref), t (ref)
		var22()
		
		for i, v in t do
			v:Destroy()
		end
	end
end