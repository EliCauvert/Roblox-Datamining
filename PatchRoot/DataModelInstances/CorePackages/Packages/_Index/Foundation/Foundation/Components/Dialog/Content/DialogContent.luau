-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:02 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local scrollViewModule = require(foundation.Components.ScrollView)
local _ = require(foundation.Components.Types)
local visibilityModule = require(foundation.Enums.Visibility)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local useScrollBarPaddingModule = require(script.Parent.useScrollBarPadding)
local useDialogVariants = require(script.Parent.Parent.useDialogVariants).useDialogVariants
local useDialogModule = require(script.Parent.Parent.useDialog)

return function(p0) --[[ line: 19 | named "DialogContent" ]]
	-- upvalues: useScrollBarPaddingModule (ref), useDialogVariants (ref), useDialogModule (ref), reactModule (ref), scrollViewModule (ref), withCommonPropsModule (ref), visibilityModule (ref)
	local var7, var8, var9 = useScrollBarPaddingModule()
	local var10 = useDialogVariants()
	p0.testId = `{useDialogModule().testId}--content`
	
	return reactModule.createElement(scrollViewModule, withCommonPropsModule(p0, {
		scroll = {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.new(0, 0, 0, 0),
			scrollBarVisibility = if var7 then visibilityModule.Auto else visibilityModule.None
		},
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalFlex = Enum.UIFlexAlignment.Fill,
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		selection = {
			Selectable = (p0.Selectable == nil or p0.Selectable) and var7,
			NextSelectionUp = p0.NextSelectionUp,
			NextSelectionDown = p0.NextSelectionDown,
			NextSelectionLeft = p0.NextSelectionLeft,
			NextSelectionRight = p0.NextSelectionRight
		},
		onAbsoluteCanvasSizeChanged = var9,
		onAbsoluteWindowSizeChanged = var9,
		tag = var10.content.tag
	}), {
		ScrollPadding = reactModule.createElement("UIPadding", {
			PaddingRight = var8:map(function(p1) --[[ line: 55 ]]
				return UDim.new(0, p1)
			end)
		}),
		ScrollContent = reactModule.createElement(reactModule.Fragment, nil, p0.children)
	})
end