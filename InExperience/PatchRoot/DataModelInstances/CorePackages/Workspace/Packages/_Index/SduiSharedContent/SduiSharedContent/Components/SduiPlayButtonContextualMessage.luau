local sduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local parent = sduiSharedContent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local gamePlayButtonModule = require(parent.GamePlayButton)
local roactServiceTagsModule = require(parent.RoactServiceTags)
local sduiFeedContextModule = require(sduiSharedContent.Components.SduiFeedContext)
local useTokens = foundationModule.Hooks.useTokens
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local usePlayButtonContextualMessage = gamePlayButtonModule.usePlayButtonContextualMessage
local usePlayButtonState = gamePlayButtonModule.usePlayButtonState
local _ = require(parent.SduiCoreSystem)
local text = foundationModule.Text
local view = foundationModule.View

return reactModule.memo(function(p1)
	-- upvalues: useRoactService (ref), roactServiceTagsModule (ref), useTokens (ref), reactModule (ref), sduiFeedContextModule (ref), usePlayButtonState (ref), usePlayButtonContextualMessage (ref), view (ref), text (ref), gamePlayButtonModule (ref)
	local var1 = useRoactService(roactServiceTagsModule.RoactNetworking)
	local var2 = useTokens()
	local var3 = reactModule.useContext(sduiFeedContextModule)
	local var4 = reactModule.useRef(nil)
	local var5 = usePlayButtonState(var1, p1.universeId, p1.fetchDelayInSeconds)
	local var6 = usePlayButtonContextualMessage(p1.universeId, var5.playButtonState, var5.playabilityStatus)
	
	return if var6 == nil or var6 == "" then nil else reactModule.createElement(view, {
		tag = "size-full-0 auto-xy",
		LayoutOrder = p1.layoutOrder
	}, {
		Text = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium text-wrap text-align-x-left",
			textStyle = var2.Color.Content.Emphasis,
			Text = var6,
			ref = var4
		}),
		ImpressionsDetector = reactModule.createElement(gamePlayButtonModule.PlayButtonContextualMessageImpressionsDetector, {
			containerRef = var4,
			universeId = p1.universeId,
			playabilityStatus = var5.playabilityStatus,
			contextualMessage = var6,
			pageContext = if p1.sduiContext then p1.sduiContext.appPage else "",
			scrollViewPositionChangedSignal = var3 and var3.scrollViewPositionChangedSignal
		})
	})
end)