local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local Parent = SduiSharedContent.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local GetSduiActionHandlerRegistryFunction = SduiCoreSystemModule.getSduiActionHandlerRegistry
local FFlagSduiDismissPromptAction = require(Parent.SharedFlags).FFlagSduiDismissPromptAction
local FFlagLuaAppSduiMovePromptsActions = require(Parent.SharedFlags).FFlagLuaAppSduiMovePromptsActions
local FFlagSduiShowToastAction = require(Parent.SharedFlags).FFlagSduiShowToastAction
local FFlagSduiActionSequence = require(Parent.SharedFlags).FFlagSduiActionSequence
local FFlagSduiNavigate = require(Parent.SharedFlags).FFlagSduiNavigate
local FFlagSduiSetPageScopeFieldActionModule = require(SduiSharedContent.Flags.FFlagSduiSetPageScopeFieldAction)
local FFlagSduiReactionsComponent = require(Parent.SharedFlags).FFlagSduiReactionsComponent

return function()
	-- upvalues: SduiActionType (copy), SduiSharedContent (copy), FFlagSduiDismissPromptAction (copy), FFlagLuaAppSduiMovePromptsActions (copy), FFlagSduiShowToastAction (copy), FFlagSduiActionSequence (copy), FFlagSduiNavigate (copy), FFlagSduiSetPageScopeFieldActionModule (copy), FFlagSduiReactionsComponent (copy), GetSduiActionHandlerRegistryFunction (copy)
	GetSduiActionHandlerRegistryFunction().registerActionHandlerConfigs({
		[SduiActionType.CustomAnalyticsEvent] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiAnalyticsEventAction)
			end
		},
		[SduiActionType.LoadMoreFromApi] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiLoadMoreFromApi)
			end
		},
		[SduiActionType.RefreshFromApi] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiRefreshFromApi)
			end
		},
		[SduiActionType.Share] = {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiShareAction)
			end
		},
		[SduiActionType.OpenSocialProofUserListSheet] = {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiOpenSocialProofUserListSheetAction)
			end
		},
		[SduiActionType.DismissPrompt] = if FFlagSduiDismissPromptAction and not FFlagLuaAppSduiMovePromptsActions then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiDismissPromptAction)
			end
		} else nil,
		[SduiActionType.ShowToast] = if FFlagSduiShowToastAction then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiShowToastAction)
			end
		} else nil,
		[SduiActionType.ActionSequence] = if FFlagSduiActionSequence then {
			skipUnifiedLogging = true,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiActionSequenceAction)
			end
		} else nil,
		[SduiActionType.Navigate] = if FFlagSduiNavigate then {
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiNavigateAction)
			end
		} else nil,
		[SduiActionType.SetPageScopeField] = if FFlagSduiSetPageScopeFieldActionModule then {
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiSetPageScopeFieldAction)
			end
		} else nil,
		[SduiActionType.ToggleContentReaction] = if FFlagSduiReactionsComponent then {
			skipUnifiedLogging = false,
			lazyHandler = function()
				-- upvalues: SduiSharedContent (upval)
				return require(SduiSharedContent.Actions.SduiToggleContentReactionAction)
			end
		} else nil
	})
end