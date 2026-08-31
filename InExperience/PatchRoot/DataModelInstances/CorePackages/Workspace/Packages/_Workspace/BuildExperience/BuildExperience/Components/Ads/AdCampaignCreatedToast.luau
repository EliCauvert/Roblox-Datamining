local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local text = foundationModule.Text
local view = foundationModule.View

return function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), reactRobloxModule (ref), view (ref), text (ref)
	local var1 = foundationModule.Hooks.useOverlay()
	local var2 = foundationModule.Hooks.useTokens()
	reactModule.useEffect(function()
		-- upvalues: p1 (ref)
		local delayedThread = task.delay(5, p1.onClose)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { p1.onClose })
	
	if var1 == nil then
		return nil
	end
	local testId = p1.testId or "AdCampaignCreatedToast"
	
	return reactRobloxModule.createPortal(reactModule.createElement(view, {
		ZIndex = 999,
		tag = "row align-y-center gap-medium anchor-bottom-center auto-xy padding-x-large padding-y-xsmall radius-medium bg-system-contrast",
		Position = UDim2.new(0.5, 0, 1, -var2.Padding.XLarge),
		testId = testId
	}, {
		Title = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "auto-xy padding-y-small text-body-medium content-inverse-emphasis",
			Text = p1.title
		}),
		Action = if p1.actionText ~= nil and p1.onActionActivated ~= nil then reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "auto-xy",
			onActivated = p1.onActionActivated,
			testId = `{testId}.Action`
		}, {
			Label = reactModule.createElement(text, {
				RichText = true,
				tag = "auto-xy text-body-medium content-inverse-emphasis",
				Text = `<u>{p1.actionText}</u>`
			})
		}) else nil
	}), var1)
end