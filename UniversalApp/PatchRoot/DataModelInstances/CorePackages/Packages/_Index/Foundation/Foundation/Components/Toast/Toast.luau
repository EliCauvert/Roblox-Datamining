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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useCursorModule (ref), reactModule (ref), loggerModule (ref), inputSizeModule (ref), fillBehaviorModule (ref), dashModule (ref), buttonModule (ref), useScaledValueModule (ref), viewModule (ref), withCommonPropsModule (ref), imageModule (ref), textModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3 = useCursorModule({
		radius = UDim.new(0, var2.Radius.Medium),
		offset = var2.Size.Size_200,
		borderWidth = var2.Stroke.Thicker
	})
	local actions = var1.actions
	local var4 = reactModule.useMemo(function()
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
	local var5 = var5.icon and var5.icon ~= ""
	local var6 = var5.title and var5.title ~= ""
	local var7 = var5.text and var5.text ~= ""
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var5, {
		tag = "row gap-small auto-y padding-medium radius-medium bg-over-media-0",
		Size = UDim2.new(var5.width or UDim.new(0, useScaledValueModule(400)), UDim.new()),
		Position = UDim2.fromScale(0.5, 0.1),
		selection = { Selectable = false, SelectionImageObject = var7 },
		ref = p2
	}), {
		Media = if var5 then reactModule.createElement(imageModule, {
			LayoutOrder = 1,
			tag = "size-1200-1200",
			Image = var5.icon,
			testId = `{var5.testId}--media`
		}) else nil,
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = {
				["fill self-center auto-y"] = true,
				["col gap-xxsmall"] = var6 or var7
			},
			testId = `{var5.testId}--content`
		}, {
			Header = if var6 then reactModule.createElement(textModule, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-small text-align-x-left text-truncate-end content-emphasis",
				Text = var5.title,
				testId = `{var5.testId}--header`
			}) else nil,
			Body = if var7 then reactModule.createElement(textModule, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default",
				Text = var5.text,
				testId = `{var5.testId}--body`
			}) else nil,
			Actions = if actions and #actions > 0 then reactModule.createElement(viewModule, {
				LayoutOrder = 3,
				tag = {
					["row gap-small size-full-0 auto-y"] = true,
					["padding-top-small"] = var6 or var7
				},
				testId = `{var5.testId}--actions`
			}, var4) else nil
		})
	})
end))