local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local LoggerModule = require(Foundation.Utility.Logger)
local ButtonModule = require(Foundation.Components.Button)
local ImageModule = require(Foundation.Components.Image)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseCursorModule = require(Foundation.Providers.Cursor.useCursor)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(Foundation.Enums.ButtonVariant)
local FillBehaviorModule = require(Foundation.Enums.FillBehavior)
local InputSizeModule = require(Foundation.Enums.InputSize)
local config = { testId = "--foundation-toast" }

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseCursorModule (copy), ReactModule (copy), LoggerModule (copy), InputSizeModule (copy), FillBehaviorModule (copy), DashModule (copy), ButtonModule (copy), UseScaledValueModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ImageModule (copy), TextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local Actions = WithDefaultsModuleResult.actions
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Actions (copy), LoggerModule (upval), InputSizeModule (upval), FillBehaviorModule (upval), DashModule (upval), ReactModule (upval), ButtonModule (upval)
		local Elements = {}
		
		if Actions then
			for i, action in Actions do
				if i > 2 then
					LoggerModule:warning(`Toast only supports up to {2} actions`)
					
					return Elements
				end
				Elements["ToastButton" .. i] = ReactModule.createElement(ButtonModule, (DashModule.union(action, {
					LayoutOrder = #Actions - i,
					size = InputSizeModule.Medium,
					fillBehavior = FillBehaviorModule.Fill
				})))
			end
		end
		return Elements
	end, { Actions })
	local IsNotIconMatch: boolean = WithDefaultsModuleResult.icon and WithDefaultsModuleResult.icon ~= ""
	local IsNotTitleMatch: boolean = WithDefaultsModuleResult.title and WithDefaultsModuleResult.title ~= ""
	local IsNotTextMatch: boolean = WithDefaultsModuleResult.text and WithDefaultsModuleResult.text ~= ""
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = "row gap-small auto-y padding-medium radius-medium bg-over-media-0",
		Size = UDim2.new(WithDefaultsModuleResult.width or UDim.new(0, UseScaledValueModule(400)), UDim.new()),
		Position = UDim2.fromScale(0.5, 0.1),
		selection = {
			Selectable = false,
			SelectionImageObject = UseCursorModule({
				radius = UDim.new(0, UseTokensModuleResult.Radius.Medium),
				offset = UseTokensModuleResult.Size.Size_200,
				borderWidth = UseTokensModuleResult.Stroke.Thicker
			})
		},
		ref = Ref
	}), {
		Media = if IsNotIconMatch then ReactModule.createElement(ImageModule, {
			LayoutOrder = 1,
			tag = "size-1200-1200",
			Image = WithDefaultsModuleResult.icon,
			testId = `{WithDefaultsModuleResult.testId}--media`
		}) else nil,
		Content = ReactModule.createElement(ViewModule, {
			LayoutOrder = 2,
			tag = {
				["fill self-center auto-y"] = true,
				["col gap-xxsmall"] = IsNotTitleMatch or IsNotTextMatch
			},
			testId = `{WithDefaultsModuleResult.testId}--content`
		}, {
			Header = if IsNotTitleMatch then ReactModule.createElement(TextModule, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-small text-align-x-left text-truncate-end content-emphasis",
				Text = WithDefaultsModuleResult.title,
				testId = `{WithDefaultsModuleResult.testId}--header`
			}) else nil,
			Body = if IsNotTextMatch then ReactModule.createElement(TextModule, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default",
				Text = WithDefaultsModuleResult.text,
				testId = `{WithDefaultsModuleResult.testId}--body`
			}) else nil,
			Actions = if Actions and #Actions > 0 then ReactModule.createElement(ViewModule, {
				LayoutOrder = 3,
				tag = {
					["row gap-small size-full-0 auto-y"] = true,
					["padding-top-small"] = IsNotTitleMatch or IsNotTextMatch
				},
				testId = `{WithDefaultsModuleResult.testId}--actions`
			}, UseMemoResult) else nil
		})
	})
end))