local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local TestId = Frame.testId or "BuildTabStrip"
	local OnActivatedFunction = Frame.onActivated
	local CountTabs = #Frame.tabs
	local v1: number? = nil
	local Elements = {}
	
	for LayoutOrder, tab in Frame.tabs do
		if tab.id == Frame.activeTabId then
			v1 = LayoutOrder - 1
		end
		local Id = tab.id
		Elements[tostring(Id)] = ReactModule.createElement(View, {
			tag = "fill size-0-1000 auto-y",
			LayoutOrder = LayoutOrder,
			selection = { Selectable = tab.isDisabled ~= true },
			isDisabled = tab.isDisabled,
			onActivated = function()
				-- upvalues: OnActivatedFunction (copy), Id (copy)
				if OnActivatedFunction ~= nil then
					OnActivatedFunction(Id)
				end
			end,
			testId = `{TestId}.Tab.{Id}`
		}, {
			Text = ReactModule.createElement(View, { tag = "size-full-full padding-x-medium padding-y-small" }, {
				Label = ReactModule.createElement(Text, {
					tag = "position-center-center anchor-center-center auto-xy text-label-medium content-emphasis",
					Text = tab.text
				})
			})
		})
	end
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder,
		testId = TestId
	}, {
		Divider = ReactModule.createElement(View, {
			tag = "position-bottom-left anchor-bottom-left",
			Size = UDim2.new(1, 0, 0, UseTokensResult.Stroke.Thick),
			backgroundStyle = UseTokensResult.Color.Stroke.Default,
			testId = `{TestId}.Divider`
		}),
		Tabs = ReactModule.createElement(View, { ZIndex = 2, tag = "row size-full-0 auto-y" }, Elements),
		Underline = ReactModule.createElement(View, {
			ZIndex = 3,
			tag = "anchor-bottom-left bg-system-contrast",
			Visible = v1 ~= nil and CountTabs > 0,
			Size = UDim2.new(1 / math.max(CountTabs, 1), 0, 0, UseTokensResult.Stroke.Thick),
			Position = if Frame.activeOffset then Frame.activeOffset:map(function(p1): UDim2
				-- upvalues: CountTabs (copy)
				return UDim2.fromScale(p1 / math.max(CountTabs, 1), 1)
			end) else UDim2.fromScale((v1 or 0) / math.max(CountTabs, 1), 1),
			testId = `{TestId}.Underline`
		})
	})
end