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

return reactModule.memo(function(p0) --[[ line: 30 | named "SduiPlayButtonContextualMessage" ]]
	-- upvalues: useRoactService (ref), roactServiceTagsModule (ref), useTokens (ref), reactModule (ref), sduiFeedContextModule (ref), usePlayButtonState (ref), usePlayButtonContextualMessage (ref), view (ref), text (ref), gamePlayButtonModule (ref)
	local var6 = useRoactService(roactServiceTagsModule.RoactNetworking)
	local var7 = useTokens()
	local var8 = reactModule.useContext(sduiFeedContextModule)
	local var9 = reactModule.useRef(nil)
	local var10 = usePlayButtonState(var6, p0.universeId, p0.fetchDelayInSeconds)
	local var11 = usePlayButtonContextualMessage(p0.universeId, var10.playButtonState, var10.playabilityStatus)
	
	return if var11 == nil or var11 == "" then nil else reactModule.createElement(view, {
		tag = "size-full-0 auto-xy",
		LayoutOrder = p0.layoutOrder
	}, {
		Text = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium text-wrap text-align-x-left",
			textStyle = var7.Color.Content.Emphasis,
			Text = var11,
			ref = var9
		}),
		ImpressionsDetector = reactModule.createElement(gamePlayButtonModule.PlayButtonContextualMessageImpressionsDetector, {
			containerRef = var9,
			universeId = p0.universeId,
			playabilityStatus = var10.playabilityStatus,
			contextualMessage = var11,
			pageContext = if p0.sduiContext then p0.sduiContext.appPage else "",
			scrollViewPositionChangedSignal = var8 and var8.scrollViewPositionChangedSignal
		})
	})
end)