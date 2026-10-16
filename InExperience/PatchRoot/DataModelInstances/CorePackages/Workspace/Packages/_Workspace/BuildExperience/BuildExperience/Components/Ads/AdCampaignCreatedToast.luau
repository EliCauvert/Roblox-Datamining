local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local Text = FoundationModule.Text
local View = FoundationModule.View

return function(p1) --[[ Line: 31 | Named "AdCampaignCreatedToast" ]]
	-- upvalues: FoundationModule (copy), ReactModule (copy), ReactRobloxModule (copy), View (copy), Text (copy)
	local UseOverlayResult = FoundationModule.Hooks.useOverlay()
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	ReactModule.useEffect(function() --[[ Line: 35 ]]
		-- upvalues: p1 (copy)
		local DelayedThread = task.delay(5, p1.onClose)
		
		return function() --[[ Line: 37 ]]
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, { p1.onClose })
	
	if UseOverlayResult == nil then
		return nil
	else
		local TestId = p1.testId or "AdCampaignCreatedToast"
		local HasOnActionActivated: boolean = p1.actionText ~= nil and p1.onActionActivated ~= nil
		
		return ReactRobloxModule.createPortal(ReactModule.createElement(View, {
			ZIndex = 999,
			tag = "row align-y-center gap-medium anchor-bottom-center auto-xy padding-x-large padding-y-xsmall radius-medium bg-system-contrast",
			Position = UDim2.new(0.5, 0, 1, -UseTokensResult.Padding.XLarge),
			testId = TestId
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy padding-y-small text-body-medium content-inverse-emphasis",
				Text = p1.title
			}),
			Action = if HasOnActionActivated then ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "auto-xy",
				onActivated = p1.onActionActivated,
				testId = `{TestId}.Action`
			}, {
				Label = ReactModule.createElement(Text, {
					RichText = true,
					tag = "auto-xy text-body-medium content-inverse-emphasis",
					Text = `<u>{p1.actionText}</u>`
				})
			}) else nil
		}), UseOverlayResult)
	end
end