local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local userInputService = require(foundation.Utility.Wrappers).Services.UserInputService
local loggerModule = require(foundation.Utility.Logger)
local popoverAlignModule = require(foundation.Enums.PopoverAlign)
local popoverContextModule = require(foundation.Components.Popover.PopoverContext)
local popoverSideModule = require(foundation.Enums.PopoverSide)
local radiusModule = require(foundation.Enums.Radius)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useScaledValueModule = require(foundation.Utility.useScaledValue)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local popoverModule = require(foundation.Components.Popover)
local t = {
	testId = "--foundation-tooltip",
	align = popoverAlignModule.Start,
	side = popoverSideModule.Right
}

local function AnchorWrapper(p0) --[[ line: 45 ]]
	-- upvalues: reactModule (ref), popoverContextModule (ref), loggerModule (ref), popoverModule (ref), withCommonPropsModule (ref)
	local var16 = reactModule.useContext(popoverContextModule)
	local var17 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 49 ]]
		-- upvalues: var16 (ref), loggerModule (copy), var17 (ref), p0 (ref)
		if var16.anchor ~= nil then
			if typeof(var16.anchor) ~= "Instance" then
				loggerModule:warning("MeasurableRef cannot be an anchor for the tooltip")
				
				return
			end
			var17.current = var16.anchor:GetPropertyChangedSignal("GuiState"):Connect(function() --[[ line: 55 ]]
				-- upvalues: p0 (copy), var16 (copy)
				p0.onHover(var16.anchor.GuiState == Enum.GuiState.Hover)
			end)
		end
		return function() --[[ line: 60 ]]
			-- upvalues: var17 (copy)
			if var17.current ~= nil then
				var17.current:Disconnect()
			end
		end
	end, { var16.anchor, p0.onHover })
	
	return reactModule.createElement(popoverModule.Anchor, withCommonPropsModule(p0, {}), p0.children)
end

return reactModule.memo(function(p1) --[[ line: 70 | named "Tooltip" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), useTokensModule (ref), useScaledValueModule (ref), userInputService (ref), popoverModule (ref), AnchorWrapper (ref), withCommonPropsModule (ref), radiusModule (ref), viewModule (ref), textModule (ref)
	local var18 = withDefaultsModule(p1, t)
	local var19, var20 = reactModule.useState(false)
	local var21 = useTokensModule()
	
	return reactModule.createElement(popoverModule.Root, { isOpen = var19, testId = var18.testId }, {
		Anchor = reactModule.createElement(AnchorWrapper, withCommonPropsModule(var18, { onHover = var20 }), var18.children),
		Content = reactModule.createElement(popoverModule.Content, {
			hasArrow = false,
			selectionGroup = false,
			align = var18.align,
			side = { position = var18.side, offset = var21.Size.Size_200 },
			radius = radiusModule.Small,
			backgroundStyle = var21.Inverse.Surface.Surface_0
		}, reactModule.createElement(viewModule, {
			tag = {
				["col gap-xsmall auto-xy"] = true,
				["padding-x-medium padding-y-small"] = var18.text ~= nil,
				["padding-x-small padding-y-xsmall"] = var18.text == nil
			},
			sizeConstraint = { MaxSize = Vector2.new(useScaledValueModule(320), 1e999) }
		}, {
			Header = if var18.title == "" and not var18.shortcut then nil else reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = "row flex-between gap-small size-full-0 auto-y"
			}, {
				Title = if var18.title ~= "" then nil else reactModule.createElement(textModule, {
					LayoutOrder = 1,
					tag = "shrink auto-xy text-title-small text-truncate-end content-inverse-emphasis",
					Text = var18.title,
					testId = `{var18.testId}--title`
				}),
				Shortcut = if var18.shortcut then reactModule.createElement(textModule, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-small content-inverse-muted",
					Text = reactModule.useMemo(function() --[[ line: 76 ]]
						-- upvalues: var18 (ref), userInputService (copy)
						if var18.shortcut == nil then
							return nil
						end
						local var22 = ""
						
						for i, v in var18.shortcut do
							local var23 = userInputService:GetStringForKeyCode(v)
							
							if var23 == nil or var23 == "" then
								var23 = v.Name
							end
							if i > 1 then
								var22 ..= " + "
							end
							var22 ..= var23
						end
						return var22
					end, { var18.shortcut }),
					testId = `{var18.testId}--shortcut`
				}) else nil
			}),
			Text = if var18.text and var18.text ~= "" then reactModule.createElement(textModule, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-small text-wrap text-align-x-left content-inverse-default",
				Text = var18.text,
				testId = `{var18.testId}--text`
			}) else nil
		}))
	})
end)