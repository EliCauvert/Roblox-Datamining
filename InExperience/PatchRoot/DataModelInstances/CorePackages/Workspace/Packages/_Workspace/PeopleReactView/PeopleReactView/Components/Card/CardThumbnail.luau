local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local responsiveModule = require(parent.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
local input = responsiveModule.Input
local useLastInputMode = require(parent.FocusNavigationUtils).useLastInputMode
local foundationModule = require(parent.Foundation)
local getRbxThumb = foundationModule.Utility.getRbxThumb
local controlState = foundationModule.Enums.ControlState
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local thumbnailType = foundationModule.Enums.ThumbnailType
local thumbnailSize = foundationModule.Enums.ThumbnailSize
local image = foundationModule.Image
local view = foundationModule.View
local peopleServiceModule = require(parent.PeopleService)
local personButtonConfigsModule = require(peopleReactView.Configs.PersonButtonConfigs)
local useGetPeopleServiceModule = require(peopleReactView.Hooks.useGetPeopleService)
local useIsComponentInputEndedModule = require(peopleReactView.Hooks.useIsComponentInputEnded)
local cardMenuModule = require(peopleReactView.Components.Card.CardMenu)
local getFFlagPeoplePageLazyRenderCards = peopleServiceModule.getService("Flags").GetFFlagPeoplePageLazyRenderCards
local peoplePageCardMenuUseVisibleProperty = game:DefineFastFlag("PeoplePageCardMenuUseVisibleProperty", false)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), getFFlagPeoplePageLazyRenderCards (ref), usePreferredInput (ref), useLastInputMode (ref), useGetPeopleServiceModule (ref), personButtonConfigsModule (ref), signalsReactModule (ref), useIsComponentInputEndedModule (ref), controlState (ref), input (ref), view (ref), stateLayerAffordance (ref), image (ref), getRbxThumb (ref), thumbnailType (ref), thumbnailSize (ref), peoplePageCardMenuUseVisibleProperty (ref), cardMenuModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = if not getFFlagPeoplePageLazyRenderCards() then usePreferredInput() else nil
	local var3 = if not getFFlagPeoplePageLazyRenderCards() then useLastInputMode() else nil
	local var4 = useGetPeopleServiceModule("Constants")
	local var5 = useGetPeopleServiceModule("PeopleVoiceChatStore")
	local var6 = personButtonConfigsModule(p1.person.UserId)
	local var7 = reactModule.useMemo(function()
		-- upvalues: var6 (ref), var4 (ref)
		return var6[var4.PERSON_BUTTONS.INSPECT]
	end, { var6 })
	local var8 = signalsReactModule.useSignalState(var5.getPlayerIsTalking(p1.person.UserId))
	local var9, var10 = reactModule.useState(false)
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(false)
	local var15 = useIsComponentInputEndedModule(var1)
	local var16 = reactModule.useMemo(function()
		-- upvalues: getFFlagPeoplePageLazyRenderCards (copy), p1 (ref), var3 (ref), var2 (ref), input (copy), var9 (ref), var13 (ref), var8 (ref)
		return var9 or (var13 or (var8 or (if getFFlagPeoplePageLazyRenderCards() then p1.shouldShowMenu elseif var3 ~= "Focus" then var2 ~= input.Pointer else true)))
	end, {
		var9, var13, var8, var2, var3, p1.shouldShowMenu
	})
	
	return reactModule.createElement(view, {
		tag = "size-full aspect-1-1 radius-medium",
		selection = { Selectable = var7.shouldShow() },
		LayoutOrder = p1.layoutOrder,
		stateLayer = {
			affordance = if reactModule.useMemo(function()
				-- upvalues: var11 (ref), var13 (ref), var15 (ref)
				return var11 or (var13 or var15)
			end, { var11, var13, var15 }) then stateLayerAffordance.None else stateLayerAffordance.Background
		},
		onActivated = if var7.shouldShow() then reactModule.useCallback(function()
			-- upvalues: var7 (ref), var4 (ref)
			var7.onActivated(var4.ANALYTICS.ENTRY_POINT.PEOPLE_CARD)
		end, { var7.onActivated }) else nil,
		onStateChanged = reactModule.useCallback(function(p2)
			-- upvalues: var10 (ref), controlState (copy)
			var10(p2 == controlState.Hover)
		end, {}),
		ref = var1
	}, {
		AvatarThumbnailContainer = reactModule.createElement(view, { tag = "size-full padding-medium" }, {
			AvatarThumbnail = reactModule.createElement(image, {
				tag = "size-full",
				Image = getRbxThumb(thumbnailType.Avatar, p1.person.UserId, thumbnailSize.Medium)
			})
		}),
		ThumbnailHeaderBar = reactModule.createElement(view, {
			tag = "row size-full-0 auto-y align-x-right padding-small"
		}, {
			CardMenuBackground = if peoplePageCardMenuUseVisibleProperty or var16 then reactModule.createElement(view, {
				AutomaticSize = Enum.AutomaticSize.XY,
				selection = { Selectable = false },
				stateLayer = { affordance = stateLayerAffordance.None },
				onStateChanged = reactModule.useCallback(function(p2)
					-- upvalues: var12 (ref), controlState (copy)
					var12(p2 == controlState.Hover)
				end, {}),
				Visible = if peoplePageCardMenuUseVisibleProperty then var16 else nil
			}, {
				CardMenu = reactModule.createElement(cardMenuModule, { person = p1.person, onIsOpenChanged = var14 })
			}) else nil
		})
	})
end)