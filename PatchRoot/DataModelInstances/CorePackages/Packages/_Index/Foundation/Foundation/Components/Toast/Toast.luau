-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:10 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local loggerModule = require(foundation.Utility.Logger)
local buttonModule = require(foundation.Components.Button)
local imageModule = require(foundation.Components.Image)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useCursorModule = require(foundation.Providers.Cursor.useCursor)
local useScaledValueModule = require(foundation.Utility.useScaledValue)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local _ = require(foundation.Enums.ButtonVariant)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local inputSizeModule = require(foundation.Enums.InputSize)
local t = { testId = "--foundation-toast" }

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 44 | named "Toast" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useCursorModule (ref), reactModule (ref), loggerModule (ref), inputSizeModule (ref), fillBehaviorModule (ref), dashModule (ref), buttonModule (ref), useScaledValueModule (ref), viewModule (ref), withCommonPropsModule (ref), imageModule (ref), textModule (ref)
	local var16 = withDefaultsModule(p0, t)
	local var17 = useTokensModule()
	local var18 = useCursorModule({
		radius = UDim.new(0, var17.Radius.Medium),
		offset = var17.Size.Size_200,
		borderWidth = var17.Stroke.Thicker
	})
	local actions = var16.actions
	local var19 = reactModule.useMemo(function() --[[ line: 54 ]]
		-- upvalues: actions (ref), loggerModule (copy), inputSizeModule (copy), fillBehaviorModule (copy), dashModule (copy), reactModule (copy), buttonModule (copy)
		local t = {}
		
		if actions then
			for i, v in actions do
				if i <= 2 then
					t["ToastButton" .. i] = reactModule.createElement(buttonModule, dashModule.union(v, {
						LayoutOrder = #actions - i,
						size = inputSizeModule.Medium,
						fillBehavior = fillBehaviorModule.Fill
					}))
					continue
				end
				loggerModule:warning(`Toast only supports up to {2} actions`)
				
				return t
			end
		end
		return t
	end, { actions })
	local var20 = var16.icon and var16.icon ~= ""
	local var21 = var16.title and var16.title ~= ""
	local var22 = var16.text and var16.text ~= ""
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var16, {
		tag = "row gap-small auto-y padding-medium radius-medium bg-over-media-0",
		Size = UDim2.new(var16.width or UDim.new(0, useScaledValueModule(400)), UDim.new()),
		Position = UDim2.fromScale(0.5, 0.1),
		selection = { Selectable = false, SelectionImageObject = var18 },
		ref = p1
	}), {
		Media = if var20 then reactModule.createElement(imageModule, {
			LayoutOrder = 1,
			tag = "size-1200-1200",
			Image = var16.icon,
			testId = `{var16.testId}--media`
		}) else nil,
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = {
				["fill self-center auto-y"] = true,
				["col gap-xxsmall"] = var21 or var22
			},
			testId = `{var16.testId}--content`
		}, {
			Header = if var21 then reactModule.createElement(textModule, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-small text-align-x-left text-truncate-end content-emphasis",
				Text = var16.title,
				testId = `{var16.testId}--header`
			}) else nil,
			Body = if var22 then reactModule.createElement(textModule, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default",
				Text = var16.text,
				testId = `{var16.testId}--body`
			}) else nil,
			Actions = if actions and #actions > 0 then reactModule.createElement(viewModule, {
				LayoutOrder = 3,
				tag = {
					["row gap-small size-full-0 auto-y"] = true,
					["padding-top-small"] = var21 or var22
				},
				testId = `{var16.testId}--actions`
			}, var19) else nil
		})
	})
end))