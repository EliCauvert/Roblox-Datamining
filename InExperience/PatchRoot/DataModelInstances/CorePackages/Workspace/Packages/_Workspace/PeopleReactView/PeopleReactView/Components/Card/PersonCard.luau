local localPlayer = game:GetService("Players").LocalPlayer
local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local view = require(parent.Foundation).View
local peopleServiceModule = require(parent.PeopleService)
local cardDetailsModule = require(peopleReactView.Components.Card.CardDetails)
local cardThumbnailModule = require(peopleReactView.Components.Card.CardThumbnail)
local cardTooltipModule = require(peopleReactView.Components.Card.CardTooltip)
local flags = peopleServiceModule.getService("Flags")
local getFFlagPeoplePageEnablePersonSignalStore = flags.GetFFlagPeoplePageEnablePersonSignalStore
local getFFlagPeoplePageLazyRenderCards = flags.GetFFlagPeoplePageLazyRenderCards
local getFFlagFixPeoplePageCardTooltip = flags.GetFFlagFixPeoplePageCardTooltip
local fFlagPeopleCardsEnableVirtualizedGrid = flags.FFlagPeopleCardsEnableVirtualizedGrid

return reactModule.memo(function(p1)
	-- upvalues: getFFlagPeoplePageEnablePersonSignalStore (ref), signalsReactModule (ref), signalsModule (ref), reactIsModule (ref), reactModule (ref), fFlagPeopleCardsEnableVirtualizedGrid (ref), localPlayer (ref), view (ref), getFFlagFixPeoplePageCardTooltip (ref), cardThumbnailModule (ref), getFFlagPeoplePageLazyRenderCards (ref), cardDetailsModule (ref), cardTooltipModule (ref)
	local var1 = if getFFlagPeoplePageEnablePersonSignalStore() then signalsReactModule.useSignalBinding(signalsModule.createComputed(function(p2)
		-- upvalues: p1 (ref)
		return if type(p1.layoutOrder) == "function" then p1.layoutOrder(p2) else p1.layoutOrder or 0
	end)) else nil
	local var2 = if reactIsModule.isBinding(p1.width) then p1.width:map(function(p2)
		return UDim2.new(0, p2, 0, 0)
	end) else UDim2.new(0, p1.width, 0, 0)
	local var3, var4 = reactModule.useState(if fFlagPeopleCardsEnableVirtualizedGrid then false else p1.showTooltip)
	
	if fFlagPeopleCardsEnableVirtualizedGrid then
		reactModule.useEffect(function()
			-- upvalues: var4 (ref), p1 (ref), localPlayer (copy)
			var4(p1.showTooltip and (localPlayer ~= nil and p1.person.UserId == localPlayer.UserId))
		end, { p1.showTooltip, p1.person })
	end
	return reactModule.createElement(view, {
		tag = "auto-y",
		Size = var2,
		ZIndex = if var3 then 2 else 1,
		LayoutOrder = if getFFlagPeoplePageEnablePersonSignalStore() then var1 else p1.layoutOrder
	}, {
		CardContent = reactModule.createElement(view, {
			tag = if getFFlagFixPeoplePageCardTooltip() then "size-full-0 auto-y col bg-surface-100 radius-medium" else "size-full col bg-surface-100 radius-medium"
		}, {
			CardThumbnail = reactModule.createElement(cardThumbnailModule, {
				layoutOrder = 1,
				person = p1.person,
				shouldShowMenu = if getFFlagPeoplePageLazyRenderCards() then p1.shouldShowMenu else nil
			}),
			CardDetails = reactModule.createElement(cardDetailsModule, { layoutOrder = 2, person = p1.person })
		}),
		CardTooltip = if var3 then reactModule.createElement(cardTooltipModule, {
			action = reactModule.useCallback(function()
				-- upvalues: var4 (ref), p1 (ref)
				var4(false)
				p1.onDismissTooltip()
			end, {})
		}) else nil
	})
end)