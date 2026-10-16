local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local Parent = SduiSharedContent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local GamePlayButtonModule = require(Parent.GamePlayButton)
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local SduiFeedContextModule = require(SduiSharedContent.Components.SduiFeedContext)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UsePlayButtonContextualMessageFunction = GamePlayButtonModule.usePlayButtonContextualMessage
local UsePlayButtonStateFunction = GamePlayButtonModule.usePlayButtonState
local _ = require(Parent.SduiCoreSystem)
local Text = FoundationModule.Text
local View = FoundationModule.View

return ReactModule.memo(function(p1) --[[ Line: 30 | Named "SduiPlayButtonContextualMessage" ]]
	-- upvalues: UseRoactServiceFunction (copy), RoactServiceTagsModule (copy), UseTokensFunction (copy), ReactModule (copy), SduiFeedContextModule (copy), UsePlayButtonStateFunction (copy), UsePlayButtonContextualMessageFunction (copy), View (copy), Text (copy), GamePlayButtonModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactServiceTagsModule.RoactNetworking)
	local UseTokensResult = UseTokensFunction()
	local UseContextResult = ReactModule.useContext(SduiFeedContextModule)
	local UseRefResult = ReactModule.useRef(nil)
	local UsePlayButtonStateResult = UsePlayButtonStateFunction(UseRoactServiceResult, p1.universeId, p1.fetchDelayInSeconds)
	local UsePlayButtonContextualMessageResult = UsePlayButtonContextualMessageFunction(p1.universeId, UsePlayButtonStateResult.playButtonState, UsePlayButtonStateResult.playabilityStatus)
	
	return if UsePlayButtonContextualMessageResult == nil or UsePlayButtonContextualMessageResult == "" then nil else ReactModule.createElement(View, {
		tag = "size-full-0 auto-xy",
		LayoutOrder = p1.layoutOrder
	}, {
		Text = ReactModule.createElement(Text, {
			tag = "auto-xy text-body-medium text-wrap text-align-x-left",
			textStyle = UseTokensResult.Color.Content.Emphasis,
			Text = UsePlayButtonContextualMessageResult,
			ref = UseRefResult
		}),
		ImpressionsDetector = ReactModule.createElement(GamePlayButtonModule.PlayButtonContextualMessageImpressionsDetector, {
			containerRef = UseRefResult,
			universeId = p1.universeId,
			playabilityStatus = UsePlayButtonStateResult.playabilityStatus,
			contextualMessage = UsePlayButtonContextualMessageResult,
			pageContext = p1.sduiContext and p1.sduiContext.appPage or "",
			scrollViewPositionChangedSignal = UseContextResult and UseContextResult.scrollViewPositionChangedSignal
		})
	})
end)