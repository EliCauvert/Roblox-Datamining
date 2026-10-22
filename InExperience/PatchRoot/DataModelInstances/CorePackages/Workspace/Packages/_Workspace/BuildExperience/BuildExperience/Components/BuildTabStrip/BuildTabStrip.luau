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
	local Elements = {}
	
	for LayoutOrder, tab in Frame.tabs do
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
			Text = ReactModule.createElement(View, {
				tag = "size-full-full padding-x-medium padding-bottom-medium padding-top-xsmall"
			}, {
				Label = ReactModule.createElement(Text, {
					tag = "position-center-center anchor-center-center auto-xy text-label-medium content-emphasis",
					Text = tab.text
				})
			}),
			Underline = ReactModule.createElement(View, {
				ZIndex = 2,
				tag = "position-bottom-left anchor-bottom-left bg-system-contrast",
				Visible = Id == Frame.activeTabId,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Stroke.Thick),
				testId = `{TestId}.Underline.{Id}`
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
		Tabs = ReactModule.createElement(View, { ZIndex = 2, tag = "row size-full-0 auto-y" }, Elements)
	})
end