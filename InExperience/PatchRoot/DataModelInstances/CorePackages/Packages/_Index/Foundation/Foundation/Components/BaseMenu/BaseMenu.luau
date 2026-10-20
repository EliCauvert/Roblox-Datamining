local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local FlagsModule = require(Foundation.Utility.Flags)
local ViewModule = require(Foundation.Components.View)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local UseBindableModule = require(Foundation.Utility.useBindable)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(Foundation.Enums.ControlState)
local RadiusModule = require(Foundation.Enums.Radius)
local _ = require(Foundation.Components.Types)
local BaseMenuContextModule = require(script.Parent.BaseMenuContext)
local BaseMenuScrollContainerModule = require(script.Parent.BaseMenuScrollContainer)
local UseSubmenuHoverModule = require(script.Parent.useSubmenuHover)
local DeclarativeBaseMenuContentModule = require(script.Parent.DeclarativeBaseMenuContent)
local config = { size = require(Foundation.Enums.InputSize).Medium }
local config1 = {
	[RadiusModule.Small] = "radius-small",
	[RadiusModule.Medium] = "radius-medium"
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: ReactModule (copy), config (copy), WithDefaultsModule (copy), UseBindableModule (copy), UseScaledValueModule (copy), UseSubmenuHoverModule (copy), FlagsModule (copy), DeclarativeBaseMenuContentModule (copy), config1 (copy), BaseMenuContextModule (copy), BaseMenuScrollContainerModule (copy), WithCommonPropsModule (copy), ViewModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local Copy = table.clone(config)
	Copy.Visible = UseBindingResult
	local WithDefaultsModuleResult = WithDefaultsModule(p1, Copy)
	local UseBindableModuleResult = UseBindableModule(WithDefaultsModuleResult.width)
	local UseBindableModuleResult1 = UseBindableModule(WithDefaultsModuleResult.maxHeight)
	local UseScaledValueModuleResult = UseScaledValueModule(260)
	local UseScaledValueModuleResult1 = UseScaledValueModule(320)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseSubmenuHoverModuleResult = UseSubmenuHoverModule()
	ReactModule.useEffect(function()
		-- upvalues: UseBindingResult2 (copy)
		task.delay(0, function()
			-- upvalues: UseBindingResult2 (upval)
			UseBindingResult2(true)
		end)
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseBindableModuleResult (copy), FlagsModule (upval), UseScaledValueModuleResult (copy)
		return UseBindableModuleResult:map(function(p2)
			-- upvalues: FlagsModule (upval), UseScaledValueModuleResult (upval)
			return if p2 then p2.Offset elseif FlagsModule.FoundationBaseMenuContentSizing then 0 else UseScaledValueModuleResult
		end)
	end, { UseBindableModuleResult, UseScaledValueModuleResult })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseBindableModuleResult (copy), FlagsModule (upval), WithDefaultsModuleResult (copy), UseScaledValueModuleResult1 (copy)
		return UseBindableModuleResult:map(function(p2): boolean
			-- upvalues: FlagsModule (upval), WithDefaultsModuleResult (upval), UseScaledValueModuleResult1 (upval)
			return if FlagsModule.FoundationBaseMenuContentSizing then not p2 or WithDefaultsModuleResult.couldGrow == true else not p2 or WithDefaultsModuleResult.couldGrow == true and p2.Offset < UseScaledValueModuleResult1
		end)
	end, {
		UseBindableModuleResult,
		UseScaledValueModuleResult1,
		WithDefaultsModuleResult.couldGrow
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), UseMemoResult1 (copy), UseMemoResult (copy), FlagsModule (upval), UseScaledValueModuleResult1 (copy)
		return {
			MinSize = ReactModule.joinBindings({ UseMemoResult1, UseMemoResult }):map(function(Entry)
				-- upvalues: FlagsModule (upval)
				local Entry1 = Entry[2]
				
				return if Entry[1] then if FlagsModule.FoundationBaseMenuContentSizing and Entry1 == 0 then nil else Vector2.new(Entry1, 0) else nil
			end),
			MaxSize = if FlagsModule.FoundationBaseMenuContentSizing then nil else UseMemoResult1:map(function(p2)
				-- upvalues: UseScaledValueModuleResult1 (upval)
				return if p2 then Vector2.new(UseScaledValueModuleResult1, 1e999) else nil
			end)
		}
	end, {
		UseMemoResult1,
		UseMemoResult,
		UseScaledValueModuleResult1
	})
	local Children = WithDefaultsModuleResult.children
	
	if not Children and WithDefaultsModuleResult.items then
		Children = ReactModule.createElement(DeclarativeBaseMenuContentModule, {
			items = WithDefaultsModuleResult.items,
			size = WithDefaultsModuleResult.size
		})
	end
	local Entry = if WithDefaultsModuleResult.radius == nil then "" else config1[WithDefaultsModuleResult.radius]
	local Element = ReactModule.createElement(BaseMenuContextModule.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: WithDefaultsModuleResult (copy), UseStateResult (copy), UseResult (copy), UseSubmenuHoverModuleResult (copy)
			return {
				depth = 1,
				onActivated = WithDefaultsModuleResult.onActivated,
				onNestedLeafActivated = WithDefaultsModuleResult.onNestedLeafActivated,
				size = WithDefaultsModuleResult.size,
				hasLeading = UseStateResult,
				setHasLeading = UseResult,
				hoverOpenPath = UseSubmenuHoverModuleResult.openPath,
				hoverOpenAtDepth = UseSubmenuHoverModuleResult.openAtDepth,
				hoverCloseAtDepth = UseSubmenuHoverModuleResult.closeAtDepth,
				hoverReset = UseSubmenuHoverModuleResult.reset,
				maxHeight = WithDefaultsModuleResult.maxHeight
			}
		end, {
			WithDefaultsModuleResult.onActivated,
			WithDefaultsModuleResult.onNestedLeafActivated, WithDefaultsModuleResult.size,
			UseStateResult, UseSubmenuHoverModuleResult.openPath,
			UseSubmenuHoverModuleResult.openAtDepth,
			UseSubmenuHoverModuleResult.closeAtDepth, UseSubmenuHoverModuleResult.reset,
			WithDefaultsModuleResult.maxHeight
		})
	}, Children)
	
	return if WithDefaultsModuleResult.maxHeight then ReactModule.createElement(BaseMenuScrollContainerModule, {
		maxHeight = UseBindableModuleResult1,
		autoSize = UseMemoResult1,
		width = UseBindableModuleResult,
		scrollViewProps = WithCommonPropsModule(WithDefaultsModuleResult, {
			ref = Ref,
			sizeConstraint = UseMemoResult2,
			scrollingFrameRef = WithDefaultsModuleResult.scrollingFrameRef,
			tag = `stroke-standard stroke-default {Entry}`
		})
	}, Element) else ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = `col stroke-standard stroke-default {Entry}`,
		AutomaticSize = UseMemoResult1:map(function(p2)
			return if p2 then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y
		end),
		Size = ReactModule.joinBindings({ UseMemoResult1, UseBindableModuleResult }):map(function(Entry)
			local Entry1 = Entry[2]
			
			return if Entry[1] then nil else UDim2.new(Entry1, UDim.new())
		end),
		ref = Ref,
		sizeConstraint = UseMemoResult2
	}), Element)
end))