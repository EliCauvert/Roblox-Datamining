local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local userInputService = require(foundation.Utility.Wrappers).Services.UserInputService
local flagsModule = require(foundation.Utility.Flags)
local constantsModule = require(foundation.Constants)
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
	side = popoverSideModule.Right,
	hasArrow = if flagsModule.FoundationTooltipBeta then true else nil
}

local function AnchorWrapper(p0) --[[ line: 52 ]]
	-- upvalues: reactModule (ref), popoverContextModule (ref), loggerModule (ref), popoverModule (ref), withCommonPropsModule (ref)
	local var18 = reactModule.useContext(popoverContextModule)
	local var19 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 56 ]]
		-- upvalues: var18 (ref), loggerModule (copy), var19 (ref), p0 (ref)
		if var18.anchor ~= nil then
			if typeof(var18.anchor) ~= "Instance" then
				loggerModule:warning("MeasurableRef cannot be an anchor for the tooltip")
				
				return
			end
			var19.current = var18.anchor:GetPropertyChangedSignal("GuiState"):Connect(function() --[[ line: 62 ]]
				-- upvalues: p0 (copy), var18 (copy)
				p0.onHover(var18.anchor.GuiState == Enum.GuiState.Hover)
			end)
		end
		return function() --[[ line: 67 ]]
			-- upvalues: var19 (copy)
			if var19.current ~= nil then
				var19.current:Disconnect()
			end
		end
	end, { var18.anchor, p0.onHover })
	
	return reactModule.createElement(popoverModule.Anchor, withCommonPropsModule(p0, {}), p0.children)
end

return reactModule.memo(function(p1) --[[ line: 77 | named "Tooltip" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), useTokensModule (ref), useScaledValueModule (ref), flagsModule (ref), constantsModule (ref), userInputService (ref), popoverModule (ref), AnchorWrapper (ref), withCommonPropsModule (ref), radiusModule (ref), viewModule (ref), textModule (ref)
	local var20 = withDefaultsModule(p1, t)
	local var21, var22 = reactModule.useState(false)
	local var23 = useTokensModule()
	local var24 = var20.text ~= nil and var20.text ~= ""
	
	return reactModule.createElement(popoverModule.Root, { isOpen = var21, testId = var20.testId }, {
		Anchor = reactModule.createElement(AnchorWrapper, withCommonPropsModule(var20, { onHover = var22 }), var20.children),
		Content = reactModule.createElement(popoverModule.Content, {
			selectionGroup = false,
			hasArrow = if flagsModule.FoundationTooltipBeta then var20.hasArrow else false,
			align = var20.align,
			side = { position = var20.side, offset = var23.Size.Size_200 },
			radius = radiusModule.Small,
			backgroundStyle = var23.Inverse.Surface.Surface_0,
			onPressedOutside = if flagsModule.FoundationTooltipPressedOutside then function() --[[ line: 143 ]]
				-- upvalues: var22 (ref)
				var22(false)
			end else nil
		}, reactModule.createElement(viewModule, {
			tag = {
				["col gap-xsmall auto-xy"] = true,
				["padding-x-medium padding-y-small"] = not flagsModule.FoundationTooltipBeta and var20.text ~= nil,
				["padding-x-small padding-y-xsmall"] = not flagsModule.FoundationTooltipBeta and var20.text == nil
			},
			padding = if flagsModule.FoundationTooltipBeta then if var24 then {
				top = UDim.new(0, var23.Size.Size_150),
				bottom = UDim.new(0, var23.Size.Size_200),
				left = UDim.new(0, var23.Size.Size_200),
				right = UDim.new(0, var23.Size.Size_200)
			} else {
				top = UDim.new(0, var23.Size.Size_100),
				bottom = UDim.new(0, var23.Size.Size_150),
				left = UDim.new(0, var23.Size.Size_150),
				right = UDim.new(0, var23.Size.Size_150)
			} else nil,
			sizeConstraint = {
				MaxSize = Vector2.new(useScaledValueModule(if flagsModule.FoundationTooltipBeta then constantsModule.TOOLTIP_MAX_WIDTH else 320), 1e999)
			}
		}, {
			Header = if var20.title == "" and not var20.shortcut then nil else reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = "row flex-between gap-small size-full-0 auto-y"
			}, {
				Title = if var20.title ~= "" then nil else reactModule.createElement(textModule, {
					LayoutOrder = 1,
					Text = var20.title,
					tag = {
						["shrink auto-xy text-truncate-end content-inverse-emphasis"] = true,
						["text-title-small"] = not flagsModule.FoundationTooltipBeta,
						["text-caption-medium"] = flagsModule.FoundationTooltipBeta and var24,
						["text-body-small"] = flagsModule.FoundationTooltipBeta and not var24
					},
					testId = `{var20.testId}--title`
				}),
				Shortcut = if var20.shortcut then reactModule.createElement(textModule, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-small content-inverse-muted",
					Text = reactModule.useMemo(function() --[[ line: 100 ]]
						-- upvalues: var20 (ref), userInputService (copy)
						if var20.shortcut == nil then
							return nil
						end
						local var25 = ""
						
						for i, v in var20.shortcut do
							local var26 = userInputService:GetStringForKeyCode(v)
							
							if var26 == nil or var26 == "" then
								var26 = v.Name
							end
							if i > 1 then
								var25 ..= " + "
							end
							var25 ..= var26
						end
						return var25
					end, { var20.shortcut }),
					testId = `{var20.testId}--shortcut`
				}) else nil
			}),
			Text = if var20.text and var20.text ~= "" then reactModule.createElement(textModule, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-small text-wrap text-align-x-left content-inverse-default",
				Text = var20.text,
				testId = `{var20.testId}--text`
			}) else nil
		}))
	})
end)