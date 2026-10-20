local Parent = script.Parent.Parent.Parent
local Jest = require(Parent.Dev.JestGlobals).jest
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)

return {
	createMockPeopleService = function(p1)
		-- upvalues: Jest (copy), ReactModule (copy), SignalsModule (copy)
		return {
			getService = Jest.fn(function(p2)
				-- upvalues: Jest (upval), ReactModule (upval), p1 (copy), SignalsModule (upval)
				return if p2 == "PeopleBlockingModalManager" then {
					getModalManager = Jest.fn(function(_, _)
						-- upvalues: ReactModule (upval)
						return function(p3)
							-- upvalues: ReactModule (upval)
							return ReactModule.createElement("Frame", { [ReactModule.Tag] = "data-testid=blockingModalManager" }, p3.children)
						end
					end)
				} elseif p2 == "Flags" then {
					GetFFlagAddPeoplePageCardLayout = p1.GetFFlagAddPeoplePageCardLayout,
					GetFFlagPeoplePageLazyRenderCards = p1.GetFFlagPeoplePageLazyRenderCards,
					GetFFlagFixPeoplePageCardTooltip = p1.GetFFlagFixPeoplePageCardTooltip,
					FFlagEnablePeopleListLazyRender = p1.FFlagEnablePeopleListLazyRender,
					GetFFlagPeoplePagePostponeInitialRender = p1.GetFFlagPeoplePagePostponeInitialRender,
					FFlagShowSwitchServerButton = p1.FFlagShowSwitchServerButton
				} elseif p2 == "PeopleListStore" then { people = SignalsModule.createSignal({}) } elseif p2 == "PeopleAnalyticsManager" then { trackPeoplePageLayoutChanged = Jest.fn() } else {}
			end)
		}
	end
}